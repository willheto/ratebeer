module RatingAverage
  extend ActiveSupport::Concern

  def average_rating(entity_name)
    return unless ratings.any?

    sum = ratings.sum(:score)
    average = sum.to_f
    if entity_name == 'User'
      if ratings.count == 1
        "#{entity_name} has made #{ratings.count} rating with an average of #{average}"
      else
        "#{entity_name} has made #{ratings.count} ratings with an average of #{average}"
      end
    end

    if ratings.count == 1
      "#{entity_name} has #{ratings.count} rating with an average of #{average}"
    else
      "#{entity_name} has #{ratings.count} ratings with an average of #{average}"
    end
  end
end
