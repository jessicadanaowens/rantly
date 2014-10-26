module Concerns
  module Following
    extend ActiveSupport::Concern

    included do
      has_many :followed_user_relationships,
               foreign_key: :user_id,
               class_name: 'InterestingRanter'
      has_many :ranters, through: :followed_user_relationships

      has_many :follower_relationships,
               foreign_key: :ranter_id,
               class_name: 'InterestingRanter'
      has_many :users, through: :follower_relationships
    end

    def following? ranter
      ranter_ids.include? ranter.id
    end

  end
end