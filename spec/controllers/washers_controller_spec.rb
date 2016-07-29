# require 'rails_helper'
#
# describe WashersController do
#   let(:laundromat) { FactoryGirl.create(:laundromat) }
#   let(:dryer) { FactoryGirl.create(:dryer) }
#   let(:washer) { FactoryGirl.create(:dryer) }
#
#   describe "GET #index" do
  #   it "populates json" do
  #     get :index
  #     assigns(:laundromat).should eq([:laundromat])
  #   end

  #   it "renders the :index view" do
  #     get :index
  #     response.should render_template :index
  #   end
  # end
#
#   describe "GET #show" do
#     it "assigns the requested contact to @contact"
#     it "renders the :show template"
#   end
#
#   describe "GET #new" do
#     it "assigns a new Contact to @contact"
#     it "renders the :new template"
#   end
#
#   describe "POST #create" do
#     context "with valid attributes" do
#       it "saves the new contact in the database"
#       it "redirects to the home page"
#     end
#
#     context "with invalid attributes" do
#       it "does not save the new contact in the database"
#       it "re-renders the :new template"
#     end
#   end
# end
#
#
#
#
# describe "GET #show" do
#   it "assigns the requested contact to @contact" do
#     contact = Factory(:contact)
#     get :show, id: contact
#     assigns(:contact).should eq(contact)
#   end
#
#   it "renders the #show view" do
#     get :show, id: Factory(:contact)
#     response.should render_template :show
#   end
# end
# end
