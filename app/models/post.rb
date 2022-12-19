class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate  :must_be_clickbait

    def must_be_clickbait
        if title
        unless title.match?(/Won't Believe/ || /Secret/)
            errors.add :title, "Not Clickbaity Enough!"
        end
    end
end
end
