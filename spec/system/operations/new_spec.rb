require 'rails_helper'

RSpec.describe 'operations#new', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  let(:operation) { FactoryBot.create(:operation) }

  describe 'new operation page' do
    before do
      user.confirm
      sign_in user
      @g1 = Group.create(name: 'Test Group', icon: 'fas fa-home', user:)
      visit new_group_operation_path(@g1)
    end

    describe 'should have a form to create a new operation' do
      it 'should have a name field' do
        expect(page).to have_field('Name')
      end

      it 'should have an amount field' do
        expect(page).to have_field('Amount')
      end

      it 'should have a category field' do
        expect(page).to have_content('Categories')
      end

      it 'should have a submit button' do
        expect(page).to have_button('Add new')
      end

      it 'should have a back button' do
        expect(page).to have_link('arrow_back')
      end

      context 'when the user click on some categories' do
        it 'should add the transaction to the checked categories' do
          @g2 = Group.create(name: 'Test Group 2', icon: 'fas fa-home', user:)
          @g3 = Group.create(name: 'Test Group 3', icon: 'fas fa-home', user:)
          visit new_group_operation_path(@g1)
          fill_in 'Name', with: 'New transaction'
          fill_in 'Amount', with: '999'

          check @g2.name
          check @g3.name
          click_on 'Add new'

          visit group_operations_path(@g2)
          expect(page).to have_content('New transaction')
          expect(page).to have_content('999')

          visit group_operations_path(@g3)
          expect(page).to have_content('New transaction')
          expect(page).to have_content('999')
        end
      end

      context 'when the user click on the submit button' do
        it 'should create a new transaction' do
          fill_in 'Name', with: 'Movie teather'
          fill_in 'Amount', with: 100
          click_on 'Add new'
          visit group_operations_path(@g1)
          expect(page).to have_content('Movie teather')
        end
        it 'should redirect to the transactions page' do
          fill_in 'Name', with: 'Movie teather'
          fill_in 'Amount', with: 100
          click_on 'Add new'
          expect(page).to have_current_path(group_operations_path(@g1))
        end
      end

      context 'when the user click on the back button' do
        it 'should redirect to the transactions page' do
          click_on 'arrow_back'
          expect(page).to have_current_path(group_operations_path(@g1))
        end
      end
    end
  end
end
