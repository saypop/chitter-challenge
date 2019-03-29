feature 'Posts a peep to homepage' do
  scenario 'after a user submits a peep' do
    visit('/chitter')
    save_and_open_page
    fill_in 'post', with: 'This should be at the bottom'
    click_button 'submit'
    expect(current_path).to eq('/chitter')
    expect(page).to have_content('This should be at the bottom')
  end
end
