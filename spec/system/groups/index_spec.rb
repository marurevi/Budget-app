require 'rails_helper'

RSpec.describe 'groups#index', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  let(:operation) { FactoryBot.create(:operation) }

  context 'when user is not logged in' do
    it 'should redirect to the splash page' do
      visit groups_path
      expect(page).to have_current_path(new_user_session_path)
    end
  end
  context 'when user is logged in' do
    before do
      user.confirm
      sign_in(user)
      @c1 = FactoryBot.create(:group, name: 'All', user:)
      @c2 = FactoryBot.create(:group, name: 'Services', user:)
      @c3 = FactoryBot.create(:group, name: 'Food', user:)
      @c4 = FactoryBot.create(:group, name: 'Clothing', user:)
      @c5 = FactoryBot.create(:group, name: 'Cleaning', user:)
      @c6 = FactoryBot.create(:group, name: 'Car', user:)
      @c7 = FactoryBot.create(:group, name: 'Other', user:)
      @op1 = FactoryBot.create(:operation, amount: 100, user:)
      @c1.operations << @op1
      visit groups_path
    end

    it 'should render all the categories' do
      within('ul') do
        expect(page).to have_content('All')
        expect(page).to have_content('Services')
        expect(page).to have_content('Food')
        expect(page).to have_content('Clothing')
        expect(page).to have_content('Cleaning')
        expect(page).to have_content('Car')
        expect(page).to have_content('Other')
      end
    end

    it 'should render the total amount of transactions for each category' do
      expect(page).to have_content('Total: $ 100')
    end

    it 'should have a link to create a new category' do
      expect(page).to have_link('New category', href: new_group_path)
    end

    context 'when user clicks on the New category link' do
      it 'should redirect to the new category page' do
        click_on 'New category'
        expect(page).to have_current_path(new_group_path)
      end
    end

    context 'when user clicks on the category' do
      it 'should redirect to the transactions page' do
        within('ul') do
          click_on @c4.name
          expect(page).to have_current_path(group_operations_path(@c4))
        end
      end
    end
  end
end
