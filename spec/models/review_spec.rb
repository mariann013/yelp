describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }
  
  let!(:kfc) {Restaurant.create(name: 'KFC')}

  it 'should remove the review when the restaurant is deleted' do
    r =  Review.new(thoughts: "meh meh", rating: 3)
    r.save!
    kfc.reviews << r
    expect{kfc.destroy}.to change {Review.count}.by(-1)
  end
end
