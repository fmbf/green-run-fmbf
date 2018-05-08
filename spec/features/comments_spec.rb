require 'rails_helper'

feature 'Adding comments to beers' do
  before :each do
    sign_up_as_ginger_baker
    Brewery.create!(name: 'Tia Licha Brewing')
  end

  it 'there is an add comment form on the beer show page' do
    make_beer('Leon', brewery: Brewery.last)
    expect(page).to have_content 'Comment'
  end

  it 'shows the link show page on submit' do
    make_beer('Leon', brewery: Brewery.last)
    fill_in "comment[body]", with: 'yippy'
    find('#add-comment').click
    expect(current_path).to eq(beer_path(Beer.last))
  end

  it 'after submitting comment; new comment is added to list' do
    make_beer('Leon', brewery: Brewery.last)
    fill_in "comment[body]", with: 'yippy-chai-eh'
    find('#add-comment').click
    expect(page).to have_content 'yippy-chai-eh'
  end

  it 'validates presence of comment body' do
    make_beer('Leon', brewery: Brewery.last)
    find('#add-comment').click
    expect(page).to have_content 'Body can\'t be blank'
  end
end

feature 'Deleting own comments' do
  before :each do
    sign_up_as_ginger_baker
    Brewery.create!(name: 'Tia Licha Brewing')
    make_beer('Leon', brewery: Brewery.last)
    fill_in "comment[body]", with: 'there are 10 kinds of people. Those who understand binary and those who dont.'
    find('#add-comment').click
  end

  it 'displays a remove button next to each comment' do
    expect(page).to have_css('.delete-comment-icon')
  end

  it 'shows the beer show page on click' do
    find('.delete-comment-icon').click
    expect(current_path).to eq(beer_path(Beer.last))
  end

  it 'removes the comment on click' do
    find('.delete-comment-icon').click
    expect(page).to_not have_content 'there are 10 kinds of people. Those who understand binary and those who dont.'
  end
end
