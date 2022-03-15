class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum:250 }
    validates :summary, length: { maximum:250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "is not included in the list" }
    validate :clickbait

    def clickbait
        if title.present? && (["Won't Believe","Secret","Top","Guess"].any? { |word| title.include?(word) }) != true
            errors.add(:title, "It can't")
        end
    end
end
