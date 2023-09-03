module RatingAverage
    extend ActiveSupport::Concern

    def average_rating(entity_name)
        if ratings.any?
            sum = ratings.sum(:score)
            average = sum.to_f
            if ratings.count == 1
                "#{entity_name} has #{ratings.count} rating with an average of #{average}"
            else
                "#{entity_name} has #{ratings.count} ratings with an average of #{average}"
            end
        end
    end
end