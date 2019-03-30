feature 'Displays all peeps in reverse chronological order' do
  scenario 'on the home page' do
    Timecop.freeze(Time.now - 30)
    Peep.create(post: 'This should be at the bottom')
    Timecop.return
    Timecop.freeze(Time.now - 15)
    Peep.create(post: 'This should be in the middle')
    Timecop.return
    Peep.create(post: 'This should be at the top')
    visit('/')
    expect('This should be at the top').to appear_before('This should be in the middle')
    expect('This should be in the middle').to appear_before('This should be at the bottom')
  end
end
