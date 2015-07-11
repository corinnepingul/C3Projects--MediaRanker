require 'rails_helper'

RSpec.describe Movie, type: :model do
  it_behaves_like 'a MediaModel'

  describe "scope rank_order_top_ten" do
    it "returns a ranked array of only the top ten media" do
      # factory girl??
      movie1 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 1)
      movie2 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 2)
      movie3 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 3)
      movie4 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 4)
      movie5 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 5)
      movie6 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 6)
      movie7 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 7)
      movie8 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 8)
      movie9 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 9)
      movie10 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 10)
      movie11 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 11)
      movie12 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 12)
      movies = Movie.all

      correct_array = [movie12, movie11, movie10, movie9, movie8, movie7, movie6, movie5, movie4, movie3]

      expect(movies.rank_order_top_ten).to eq correct_array
    end

    it "returns a ranked array of all the media if there's less than ten items" do
      movie1 = Movie.create(title: "HPCOS", director: "chris", description: "blah", rank: 3)
      movie2 = Movie.create(title: "HPGOF", director: "not chris", description: "dragons!", rank: 7)
      movies = Movie.all

      correct_array = [movie2, movie1]
      expect(movies.rank_order_top_ten).to eq correct_array
    end
  end
end
