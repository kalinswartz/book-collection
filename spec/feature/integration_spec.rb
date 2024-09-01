require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid attributes' do
      visit new_book_path
      fill_in "book[author]", with: 'jk rowling'
      fill_in "book[title]", with: 'harry potter'
      fill_in "book[price]", with: 16.99
      select '2024', from: 'book_published_1i' # Year dropdown
      select 'January', from: 'book_published_2i' # Month dropdown
      select '1', from: 'book_published_3i' # Day dropdown
      click_on 'Add Book'
      visit books_path
      expect(page).to have_content('harry potter')
      expect(page).to have_content('jk rowling')
      expect(page).to have_content(16.99)
      expect(page).to have_content('2024-01-01')
    end

    scenario 'title is blank' do
        visit new_book_path
        fill_in "book[title]", with: ''
        fill_in "book[author]", with: 'jk rowling'
        fill_in "book[price]", with: 16.99
        select '2024', from: 'book_published_1i' # Year dropdown
        select 'January', from: 'book_published_2i' # Month dropdown
        select '1', from: 'book_published_3i' # Day dropdown
        click_on 'Add Book'
        expect(page).to have_content("Fields can't be blank.")
    end

    scenario 'author is blank' do
      visit new_book_path
      fill_in "book[author]", with: ''
      fill_in "book[title]", with: 'harry potter'
      fill_in "book[price]", with: 16.99
      select '2024', from: 'book_published_1i' # Year dropdown
      select 'January', from: 'book_published_2i' # Month dropdown
      select '1', from: 'book_published_3i' # Day dropdown
      click_on 'Add Book'
      expect(page).to have_content("Fields can't be blank.")
    end

    scenario 'price is blank' do
      visit new_book_path
      fill_in "book[author]", with: 'jk rowling'
      fill_in "book[title]", with: 'harry potter'
      select '2024', from: 'book_published_1i' # Year dropdown
      select 'January', from: 'book_published_2i' # Month dropdown
      select '1', from: 'book_published_3i' # Day dropdown
      click_on 'Add Book'
      expect(page).to have_content("Fields can't be blank.")
    end

    scenario 'published date is blank' do
      visit new_book_path
      fill_in "book[author]", with: 'jk rowling'
      fill_in "book[title]", with: 'harry potter'
      fill_in "book[price]", with: 16.99
      click_on 'Add Book'
      expect(page).to have_content("Fields can't be blank.")
    end

  end