require 'rails_helper'

describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }

  let!(:kfc) {Restaurant.create(name: 'KFC')}

  it 'should remove the review when the restaurant is deleted' do
    r =  Review.new(thoughts: "meh meh", rating: 3)
    r.save!
    kfc.reviews << r
    expect{kfc.destroy}.to change {Review.count}.by(-1)
  end

  it 'is invalid if the rating is more that 5' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end
end
