require 'rails_helper'

RSpec.describe 'Poem Facade' do
  before(:each) do
    @poem_facade = PoemFacade.new('Emily')
  end

  it "#get_poems_data" do
    poems = @poem_facade.get_poems_data
    expect(poems).to be_a(Array)
  end
end
