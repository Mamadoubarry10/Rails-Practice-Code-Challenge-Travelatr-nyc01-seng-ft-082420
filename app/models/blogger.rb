class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 } 

   

    def most_liked
        max_likes = self.posts.map { |post| post.likes }.max
        self.posts.find_all { |post| post.likes == max_likes }
    end

    def average_age
        self.all.collect { |blogger| blogger.age }.sum / self.all.length
    end




end
