require 'rails_helper'



feature 'Creating a beer' do
  before :each do
    sign_up_as_ginger_baker
    visit new_beer_path
  end

  it 'has a new beer page' do
    expect(page).to have_content 'Add New Beer'
  end

  it 'takes a name and a brewery' do
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Brewery'
  end

  # it 'redirects to the beer show page on success' do
  #   fill_in 'Name', with: 'Preciosa Ale'
  #   find('#new-beer-brewery-select').find(:xpath, 'option[1]').select_option
  #   find('#add-beer-form-button').click
  #
  #   expect(current_path).to eq(beer_path(Beer.last))
  #   expect(page).to have_content 'Preciosa Ale'
  # end

  context 'on failed save' do
    before :each do
      fill_in 'Name', with: ''
      fill_in 'ibu', with: 45
      find('#add-beer-form-button').click
    end

    it 'renders errors when invalid beers are submitted' do
      expect(page).to have_content 'Name can\'t be blank'
    end

    it 'displays the new beer form again' do
      expect(page).to have_content 'New Beer'
    end

    it 'has a pre-filled form (with the data previously input)' do
      expect(find_field('ibu').value).to eq("45")
    end

    # it 'still allows for a successful save' do
    #   find('#add-beer-form-button').click
    #   expect(current_path).to eq(beer_path(Beer.last))
    # end
  end
end

feature 'Seeing all beers' do
  context 'when logged in' do
    before :each do
      foo = User.create!(username: 'foo', password: 'password')
      Brewery.create!(name: 'Tia Licha Brewing')
      Beer.create!(name: 'Preciosa', brewery_id: Brewery.last.id)
      sign_up_as_ginger_baker
      make_beer('Ahaloola', 2)
      make_beer('Big Fat Porter', 1)
      visit beers_path
    end

    it 'beer index has a \'add beer\' button to new beer page' do
      expect(page).to have_content 'Add Beer'
    end

    it 'shows all the beers for all users' do
      expect(page).to have_content 'Preciosa'
      expect(page).to have_content 'Ahaloola'
      expect(page).to have_content 'Big Fat Porter'
    end

    it 'shows the current user\'s username' do
      expect(page).to have_content 'ginger_baker'
    end

    it 'links to each of the beer\'s show page via beer titles' do
      click_link 'Preciosa'
      expect(current_path).to eq(beer_path(Beer.find_by_name('Preciosa')))
    end
  end

  context 'when logged out' do
    it 'redirects to the login page' do
      visit beers_path
      expect(page).to have_content 'Log In'
    end
  end

  context 'when signed in as another user' do
    before :each do
      User.create!(username: 'ginger_baker', password: 'abcdef')
      hw = User.create!(username: 'hello_world', password: 'abcdef')
      Brewery.create!(name: 'Tia Licha Brewing')
      Beer.create!(name: 'Saison De Mort', brewery_id: Brewery.last.id)

      sign_in('ginger_baker')
    end

    it 'shows others beers' do
      visit beers_path
      expect(page).to have_content 'Saison De Mort'
    end
  end
end

feature 'Showing a beer' do
  before :each do
    sign_up('ginger_baker')
    Brewery.create!(name: 'Tia Licha Brewing')
    Beer.create!(name: 'Leon', brewery_id: Brewery.last.id)
    visit beers_path
    click_link 'Leon'
  end

  it 'displays the beer name' do
    expect(page).to have_content 'Leon'
  end

  it 'displays the beer Brewery' do
    expect(page).to have_content 'Tia Licha Brewing'
  end

  it 'displays a link back to the beer index' do
    expect(page).to have_css('#link-to-all-beers')
  end

  it 'has a link on the show page to edit a beer' do
    expect(page).to have_css('#link-to-edit-beer')
  end
end

feature 'Editing a beer' do
  before :each do
    sign_up_as_ginger_baker
    Brewery.create!(name: 'Tia Licha Brewing')
    Beer.create!(name: 'Leon', brewery_id: Brewery.last.id, ibu: 76)
    visit beers_path
    click_link 'Leon'
  end

  it 'shows a form to edit the beer' do
    find('#link-to-edit-beer').click
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Brewery'
  end

  it 'has all the data pre-filled' do
    find('#link-to-edit-beer').click
    expect(first(:field, 'Name').value).to eq('Leon')
  end

  # it 'shows errors if editing fails' do
  #   find('#link-to-edit-beer').click
  #   # fill_in 'Name', with: ''
  #   find('#link-to-update-beer').click
  #   expect(page).to have_content 'Edit Beer'
  #   expect(page).to have_content 'Name can\'t be blank'
  # end

  context 'on successful update' do
    before :each do
      find('#link-to-edit-beer').click
    end

    it 'redirects to the beer show page' do
      # fill_in 'Name', with: 'Edited Beer'
      find('#link-to-update-beer').click
      expect(current_path).to eq(beer_path(Beer.find_by_name('Leon')))
    end
  end
end
