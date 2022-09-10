require 'rails_helper'

RSpec.describe 'groups#new', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group, user:) }

  before do
    user.confirm
    sign_in(user)
    visit new_group_path
  end

  context 'when user is visit the page' do
    it 'shows the form to create a new group' do
      expect(page).to have_content 'NEW CATEGORY'
      expect(page).to have_content 'Select Icon:'
      expect(page).to have_content 'arrow_back'
    end

    context 'when the user fill the form with valid data' do
      it 'creates a new group' do
        fill_in 'Name', with: 'Group_name'
        select '👔', from: 'Icon'
        click_on 'Add new'
        visit groups_path
        expect(page).to have_content 'Group_name'
      end
    end

    context 'when the user click on the back button' do
      it 'redirects to the groups index' do
        click_on 'arrow_back'
        expect(page).to have_current_path(groups_path)
      end
    end
  end
end
