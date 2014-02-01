require 'spec_helper'

describe :contexts do 
  it :show do 
    context = FactoryGirl.create(:context_with_barriers)
    visit context_path(context)
    page.current_path.should  eq("/contexts/#{context.id.to_s}")
    page.status_code.should   be(200)
  end
end
