require 'spec_helper'

describe :barriers do 
  it :index do 
    FactoryGirl.create(:barrier)
    FactoryGirl.create(:barrier)
    visit barriers_path
    page.current_path.should  eq('/barriers')
    page.status_code.should   be(200)
  end
  
  it :show do 
    b = FactoryGirl.create(:barrier_full)
    visit barrier_path(b)
    page.current_path.should  eq("/barriers/#{b.id.to_s}")
    page.status_code.should   be(200)
  end
end
