feature 'Posts a peep to homepage' do
  scenario 'after a user submits a peep' do
    visit('/chitter')
    fill_in 'peep', with: 'dis a peep yo!'
    click_button 'submit'
    expect(current_path).to eq('/chitter')
    expect(page).to have_content('dis a peep yo!')
  end
end
