require "spec_helper"

describe "admin cateogries", type: :feature do

  describe "the category list page" do

    it "has a category in there" do
      user = create(:admin)
      create(:category)
      allow_any_instance_of(ApplicationController). to receive(:current_user).
                                                  and_return(user)

      visit admin_categories_path

      expect(page).to have_link("Create Category")
    end
  end

  describe "the category add page" do

    it "has a category add page" do
      user = create(:admin)
      allow_any_instance_of(ApplicationController). to receive(:current_user).
        and_return(user)

      visit new_admin_category_path

      expect(page).to have_content("Create New Category")
    end

    it "can add a category" do
      user = create(:admin)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit new_admin_category_path
      fill_in "category[name]", with: "NEW CATEGORY"
      click_link_or_button ("Submit")

      expect(page).to have_content("NEW CATEGORY")
    end

    it "redirects to categories page when done" do
      user = create(:admin)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit new_admin_category_path
      fill_in "category[name]", with: "NEW CATEGORY"
      click_link_or_button ("Submit")

      expect(current_path).to eq(admin_categories_path)
    end

    it "can edit a category" do
      user = create(:admin)
      category = create(:category)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit admin_categories_path
      expect(page).to have_content("Categories")
      visit edit_admin_category_path(category.id)
      expect(page).to have_button("Submit")
      fill_in "category[name]", with: "NEW CATEGORY"
      click_link_or_button ("Submit")
      expect(page).to have_content("NEW CATEGORY")
    end

    it "can delete a created a category" do
      user = create(:admin)
      main_category1 = create(:category)
      main_category2 = create(:category)
      main_category3 = create(:category)
      category4 = create(:category)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit admin_categories_path
      expect(page).to have_content("Categories")
      expect(page).to have_content("Delete")
      click_link_or_button ("Delete")
      expect(current_path).to eq(admin_categories_path)
      expect(page).not_to have_content(category4.name)
      expect(page).to have_content(main_category1.name)
    end

    it "cannot delete a main a category" do
      user = create(:admin)
      category = create(:category)
      allow_any_instance_of(ApplicationController).
        to receive(:current_user).
        and_return(user)

      visit admin_categories_path
      expect(page).to have_content("Categories")
      expect(page).not_to have_content("Delete")
      expect(page).to have_content(category.name)
    end

  end
end
