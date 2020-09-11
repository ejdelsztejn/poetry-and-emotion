require 'rails_helper'

RSpec.describe 'Poem Service' do
  it 'can return poems by author name' do
    poem_service = PoemService.new
    results = poem_service.poems('Emily')

    expect(results).to be_a(Hash)
  end
end
