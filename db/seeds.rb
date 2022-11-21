Pathway.destroy_all
Challenge.destroy_all
UserChallenge.destroy_all
User.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"

@mentor = User.create!(
    first_name: "Mentor", last_name: "Test", email: "mentor@test.com", password: "Testpassword1!", role: "mentor")

@mentee = User.create!(
    first_name: "Mentee", last_name: "Test", email: "mentee@test.com", password: "Testpassword1!", role: "mentee")

level = ["beginner", "intermediate", "advanced", ]

def CreateChallenge(i)
    Challenge.create!(
        title: "Challenge #{i + 1}!",
        details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        user_id: @mentor.id
    )

    PathChallenge.create!(
        challenge_id: Challenge.last.id,
        pathway_id: Pathway.last.id,
        order: (i)
    )
end

5.times do |i|
    level_choice = rand(0..2)
    Pathway.create!( user_id: @mentor.id,
    title: "Pathway, #{i + 1}!",
    details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. #{i + 1}!",
    difficulty: level[level_choice] )

    20.times do |i|
        CreateChallenge(i)
    end
end

puts "created #{User.count} users"
puts "created #{Pathway.count} pathways"
puts "Created #{Challenge.count} challenges"
puts "Created #{PathChallenge.count} Path challenges"

puts "-----------------"
puts "SEED FINISHED"
