require 'rails_helper'

RSpec.describe 'Splash#index', type: :system do
  let(:user) { FactoryBot.create(:user) }
  before do
    visit root_path
  end

  context 'when user is not logged in' do
    it 'should show the splash page' do
      expect(page).to have_content('Welcome to Budget app')
    end

    it 'should show the sign up link' do
      expect(page).to have_link('Sign up')
    end

    context 'when user clicks on the sign up link' do
      it 'should redirect to the sign up page' do
        click_on 'Sign up'
        expect(page).to have_current_path(new_user_registration_path)
      end
    end

    it 'should show the log in link' do
      expect(page).to have_link('Log in')
    end

    context 'when user clicks on the log in link' do
      it 'should redirect to the log in page' do
        click_on 'Log in'
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  context 'when user is logged in' do
    it 'should redirect to the home page' do
      user.confirm
      sign_in(user)
      visit root_path
      expect(page).to have_current_path(home_path) # crear ruta dashboard_path
    end
  end
end
