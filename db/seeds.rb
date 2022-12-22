# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "John",password: "test")
Post.create(
[
    {
        "id": 1,
        "title": "First post",
        "body": "body of the first post",
        "category": "news",
        "user_id": 1,
    },
    {
        "id": 2,
        "title": "2nd post",
        "body": "body of the second post",
        "category": "news",
        "user_id": 1,
    }
]
)