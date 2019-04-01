feature 'Registers a user so that they can post peeps as themselves' do
  scenario 'when they visit the homepage' do
    visit('/')
    click_button('register')
    expect(current_path).to eq('/chitter/register')
    fill_in 'name', with: 'John'
    fill_in 'surname', with: 'Doe'
    fill_in 'handle', with: 'TheRealJohnDoe'
    fill_in 'email', with: 'jdoe@email.com'
    fill_in 'password', with: 'P@55w0rd'
    click_button('register')
    expect(current_path).to eq('/chitter/register')
    expect(page).to have_content('TheRealJohnDoe')
    click_button('submit')
    expect(current_path).to eq('/chitter/TheRealJohnDoe')
    expect(page).to have_content('Hi John Doe! You are signed in and peeping as TheRealJohnDoe.')
    fill_in 'post', with: 'This should be at the bottom'
    click_button 'submit'
    expect(current_path).to eq('/chitter/TheRealJohnDoe')
    expect(page).to have_content('This should be at the bottom')
    expect(page).to have_content('by TheRealJohnDoe')
  end
end
