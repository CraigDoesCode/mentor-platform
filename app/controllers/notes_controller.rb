class NotesController < ApplicationController
  before_action :set_note, only: %i[edit update destroy]
  before_action :set_user_challenge, only: %i[new create edit]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_challenge = @user_challenge
    if @note.save
      respond_to do |format|
        format.html { redirect_to user_challenge_path(@user_challenge) }
        foramt.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to user_challenge_path(@note.user_challenge)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to user_challenge_path(@note.user_challenge), status: :see_other }
      format.turbo_stream
    end
  end

  private

  def note_params
    params.require(:note).permit(:note)
  end

  def set_user_challenge
    @user_challenge = UserChallenge.find(params[:user_challenge_id])
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
