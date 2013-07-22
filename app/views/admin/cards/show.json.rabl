object @card

attributes :title, :description

node(:id) {|card| card.id.to_s }
