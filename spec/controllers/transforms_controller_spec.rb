require 'rails_helper'

RSpec.describe TransformsController, :type => :controller do
  before :all do
    @long_url = "https://www.google.com/?gws_rd=ssl#q=rails+tutorial&start=10"
  end

  context "GET NEW" do
    it "should render template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context "POST CREATE" do
    it "should redirect to show" do
      post :create, transform: {long_url: @long_url}
      transform = assigns(:transform)
      expect(response).to redirect_to(transform)
    end

    it "should render new when long url is not submitted" do
      post :create, transform: {long_url: nil}
      expect(response).to render_template(:new)
    end

    it "should create a short_url" do
      post :create, transform: {long_url: @long_url}
      expect(assigns(:transform).short_url).not_to be_nil
    end
  end

  context "GET SHOW" do
    before :all do
      @transform = Transform.create(long_url: @long_url)
    end

    it "should render template" do
      get :show, id: @transform.id
      expect(response).to render_template(:show)
    end
  end

  context "GET GO" do
    before :all do
      @transform = Transform.create(long_url: @long_url)
    end

     it "should redirect to origin url" do
       get :go, id: @transform.id
       expect(response).to redirect_to(@long_url)
     end

     it "should not redirect to a wrong url" do
       get :go, id: @transform.id
       expect(response).not_to redirect_to("https://amazon.com")
     end
  end
end
