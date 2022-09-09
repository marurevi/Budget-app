require 'rails_helper'

RSpec.describe 'operations#index', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  let(:operation) { FactoryBot.create(:operation) }

  context 'when user is not logged in' do
    it 'should redirect to the splash page' do
      visit group_operations_path(group)
      expect(page).to have_current_path(new_user_session_path)
    end
  end
  context 'when user is logged in' do
    before do
      user.confirm
      sign_in(user)
      @g1 = Group.create(name: 'Family', icon: 'icon', user_id: user.id)
      @g2 = Group.create(name: 'Friends', icon: 'icon', user_id: user.id)
      @op1 = Operation.create(name: 'Food', amount: 1000, user_id: user.id)
      @op2 = Operation.create(name: 'Rent', amount: 2000, user_id: user.id)
      @op3 = Operation.create(name: 'Clothes', amount: 3000, user_id: user.id)
      @op4 = Operation.create(name: 'Transport', amount: 4000, user_id: user.id)
      @op5 = Operation.create(name: 'Entertainment', amount: 5000, user_id: user.id)

      @g1.operations << [@op1, @op2, @op3]
      @g2.operations << [@op1, @op4, @op5]

      visit group_operations_path(@g2)
    end

    it 'should render a list of transactions that belongs to a given category' do
      expect(page).to have_content(@op1.name)
      expect(page).to have_content(@op1.amount)
      expect(page).to have_content(@op4.name)
      expect(page).to have_content(@op4.amount)
      expect(page).to have_content(@op5.name)
      expect(page).to have_content(@op5.amount)
    end

    it 'The list should be ordered by date from the most recent to the oldest' do
      transactions = all('li', count: 3)
      expect(transactions.first).to have_content("#{@op5.name} - #{@op5.amount}")
    end

    it 'should have the total amount of transactions' do
      expect(page).to have_content('Total: 10000')
    end

    it 'should have a link to create a new transaction' do
      expect(page).to have_link('New Transaction', href: new_group_operation_path(@g2))
    end

    context 'when user clicks on the link to create a new transaction' do
      it 'should redirect to the new transaction page' do
        click_on 'New Transaction'
        expect(page).to have_current_path(new_group_operation_path(@g2))
      end
    end

    it 'should have a link to go back to the categories page' do
      expect(page).to have_link('Back')
    end

    context 'when the user clicks on the back link' do
      it 'should redirect to the categories page' do
        click_on 'Back'
        expect(page).to have_current_path(groups_path)
      end
    end
  end
end
