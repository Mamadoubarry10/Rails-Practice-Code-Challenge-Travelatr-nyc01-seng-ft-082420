class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts




    def most_five_recent
        self.posts.take(5).each do |post|
            post.content
        end
    end
    def most_liked
        max_likes = self.posts.map { |post| post.likes }.max
        self.posts.find_all { |post| post.likes == max_likes }
    end
     
    def avg_age 
        self.bloggers.distinct.average(:age).round()
    end
        
        
end



