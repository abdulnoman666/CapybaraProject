require 'spec_helper.rb'

feature "Showing Off Capbybara", js: true, type: :feature do
  
  background do
    visit '/login'
  
  end
  scenario 'Displayed Title: Login Page' do
    expect(page).to have_css('h2', text: 'Login Page')
  end

  scenario 'Displayed Textbox: Username' do
    expect(page).to have_field('Username')
  end

  scenario 'Displayed Textbox: Password' do
    expect(page).to have_field('Password')
  end

  scenario 'Displayed Button: Login' do
    expect(page).to have_button('Login')
  end

  scenario 'tjmaher / wrong_password: Your username is invalid!' do
    error_message = 'Your username is invalid!'
    fill_in('Username', with: 'tjmaher')
    fill_in('Password', with: 'wrong_password')
    click_button('Login')
    expect(page).to have_content(error_message) #Is message on page?
  end

  scenario 'tomsmith / wrong_password: Your password is invalid!' do
    error_message = 'Your password is invalid!'
    fill_in('Username', with: 'tomsmith')
    fill_in('Password', with: 'wrong_password')
    click_button('Login')
    expect(page).to have_css('div.flash', text: error_message) #Is message in alertbox?
  end

  scenario 'tomsmith / SuperSecretPassword!' do
    fill_in('Username', with: 'tomsmith')
    fill_in('Password', with: 'SuperSecretPassword!')
    click_button('Login')
    expect(page).to have_css('h2', text: 'Secure Area')
  end
end