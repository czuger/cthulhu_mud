require 'graphviz'
require 'set'

class MapsController < ApplicationController

  def show
    # Create a new graph
    g = GraphViz.new( :G, :type => "graph" )

    places_nodes_hash = {}
    set_edges = Set.new

    Place.leaves.each do |place|
      unless places_nodes_hash.has_key?( place.id )
        places_nodes_hash[ place.id ] = g.add_nodes( place.full_description_name )
      end
      place.travels.each do |travel|
        unless places_nodes_hash.has_key?( travel.place_to.id )
          places_nodes_hash[ travel.place_to.id ] = g.add_nodes( travel.place_to.full_description_name )
        end
        unless set_edges.include?( [ travel.place_to.id, place.id ] )
          g.add_edges( places_nodes_hash[ place.id ], places_nodes_hash[ travel.place_to.id ] )
          set_edges << [ place.id, travel.place_to.id ]
        end

      end
    end

    # Generate output image
    g.output( :png => "map.png" )

  end

end
