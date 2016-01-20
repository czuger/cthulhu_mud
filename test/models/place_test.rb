require 'test_helper'
require 'pp'

class PlaceTest < ActiveSupport::TestCase

  test 'Neighbourhood' do
    travel = create( :arkham_to_kingsport )
    # pp Place.all
    # pp Travel.all
    assert_includes travel.place_from.neighbours, travel.place_to
  end

end
