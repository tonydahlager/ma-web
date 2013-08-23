require 'spec_helper'

describe Admin::TopicsController do
  # This should return the minimal set of attributes required to create a valid
  # Topic. As you add validations to Topic, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TopicsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all admin_topics as @admin_topics" do
      topic = Topic.create! valid_attributes
      get :index, {}, valid_session
      assigns(:topics).should eq([topic])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_topic as @admin_topic" do
      topic = Topic.create! valid_attributes
      get :show, {:id => topic.to_param}, valid_session
      assigns(:topic).should eq(topic)
    end
  end

  describe "GET new" do
    it "assigns a new @topic as @topic" do
      get :new, {}, valid_session
      assigns(:topic).should be_a_new(Topic)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_topic as @admin_topic" do
      topic = Topic.create! valid_attributes
      get :edit, {:id => topic.to_param}, valid_session
      assigns(:topic).should eq(topic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Topic" do
        expect {
          post :create, {:topic => valid_attributes}, valid_session
        }.to change(Topic, :count).by(1)
      end

      it "assigns a newly created admin_topic as @admin_topic" do
        post :create, {:topic => valid_attributes}, valid_session
        assigns(:topic).should be_a(Topic)
        assigns(:topic).should be_persisted
      end

      it "redirects to the created admin_topic" do
        post :create, {:topic => valid_attributes}, valid_session
        response.should redirect_to(Topic.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_topic as @admin_topic" do
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        post :create, {:topic => { "title" => "invalid value" }}, valid_session
        assigns(:topic).should be_a_new(Topic)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        post :create, {:topic => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_topic" do
        topic = Topic.create! valid_attributes
        # Assuming there are no other admin_topics in the database, this
        # specifies that the Topic created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Topic.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => topic.to_param, :admin_topic => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested admin_topic as @admin_topic" do
        topic = Topic.create! valid_attributes
        put :update, {:id => topic.to_param, :admin_topic => valid_attributes}, valid_session
        assigns(:admin_topic).should eq(topic)
      end

      it "redirects to the admin_topic" do
        topic = Topic.create! valid_attributes
        put :update, {:id => topic.to_param, :admin_topic => valid_attributes}, valid_session
        response.should redirect_to(topic)
      end
    end

    describe "with invalid params" do
      it "assigns the admin_topic as @admin_topic" do
        topic = Topic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        put :update, {:id => topic.to_param, :admin_topic => { "title" => "invalid value" }}, valid_session
        assigns(:admin_topic).should eq(topic)
      end

      it "re-renders the 'edit' template" do
        topic = Topic.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        put :update, {:id => topic.to_param, :admin_topic => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_topic" do
      topic = Topic.create! valid_attributes
      expect {
        delete :destroy, {:id => topic.to_param}, valid_session
      }.to change(Topic, :count).by(-1)
    end

    it "redirects to the admin_topics list" do
      topic = Topic.create! valid_attributes
      delete :destroy, {:id => topic.to_param}, valid_session
      response.should redirect_to(admin_topics_url)
    end
  end

end
