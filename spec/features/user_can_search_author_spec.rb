


# Then I should see the tone or tones listed for each poem.
# For each poem I should see
# - Title
# - Author
# - The poem(as a single string)
# I should also see:
# - The tone or tones for each poem
require 'rails_helper'

RSpec.describe 'User can search for poems by author', type: :feature do
  describe 'As a user' do
    it 'can visit index page and seach for poems by author' do

      # When I visit "/"
      visit '/'

      # And I fill in "Emily" in the textfield(Note: Use the existing search form)
      fill_in :author, with: 'Emily'

      # And I click "Get Poems"
      click_on 'Get Poems'

      # Then I should be on page "/search"
      expect(current_path).to eq('/search')

      # Then I should see a list of the first 10 poems
      expect(page).to have_content("10 Results")
      expect(page).to have_css(".poem", count: 10)

      # For each poem I should see
      # - Title
      # - Author
      # - The poem(as a single string)
      # I should also see:
      # - The tone or tones for each poem
      save_and_open_page
      within('.poem').first do
        expect(page).to have_css(".title")
        expect(page).to have_css(".author")
        expect(page).to have_css(".lines")
        expect(page).to have_css(".tones")
      end
    end
  end
end
