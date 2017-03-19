require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ChoicesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Choice. As you add validations to Choice, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ChoicesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all choices as @choices" do
      choice = Choice.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:choices)).to eq([choice])
    end
  end

  describe "GET #show" do
    it "assigns the requested choice as @choice" do
      choice = Choice.create! valid_attributes
      get :show, {:id => choice.to_param}, valid_session
      expect(assigns(:choice)).to eq(choice)
    end
  end

  describe "GET #new" do
    it "assigns a new choice as @choice" do
      get :new, {}, valid_session
      expect(assigns(:choice)).to be_a_new(Choice)
    end
  end

  describe "GET #edit" do
    it "assigns the requested choice as @choice" do
      choice = Choice.create! valid_attributes
      get :edit, {:id => choice.to_param}, valid_session
      expect(assigns(:choice)).to eq(choice)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Choice" do
        expect {
          post :create, {:choice => valid_attributes}, valid_session
        }.to change(Choice, :count).by(1)
      end

      it "assigns a newly created choice as @choice" do
        post :create, {:choice => valid_attributes}, valid_session
        expect(assigns(:choice)).to be_a(Choice)
        expect(assigns(:choice)).to be_persisted
      end

      it "redirects to the created choice" do
        post :create, {:choice => valid_attributes}, valid_session
        expect(response).to redirect_to(Choice.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved choice as @choice" do
        post :create, {:choice => invalid_attributes}, valid_session
        expect(assigns(:choice)).to be_a_new(Choice)
      end

      it "re-renders the 'new' template" do
        post :create, {:choice => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested choice" do
        choice = Choice.create! valid_attributes
        put :update, {:id => choice.to_param, :choice => new_attributes}, valid_session
        choice.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested choice as @choice" do
        choice = Choice.create! valid_attributes
        put :update, {:id => choice.to_param, :choice => valid_attributes}, valid_session
        expect(assigns(:choice)).to eq(choice)
      end

      it "redirects to the choice" do
        choice = Choice.create! valid_attributes
        put :update, {:id => choice.to_param, :choice => valid_attributes}, valid_session
        expect(response).to redirect_to(choice)
      end
    end

    context "with invalid params" do
      it "assigns the choice as @choice" do
        choice = Choice.create! valid_attributes
        put :update, {:id => choice.to_param, :choice => invalid_attributes}, valid_session
        expect(assigns(:choice)).to eq(choice)
      end

      it "re-renders the 'edit' template" do
        choice = Choice.create! valid_attributes
        put :update, {:id => choice.to_param, :choice => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested choice" do
      choice = Choice.create! valid_attributes
      expect {
        delete :destroy, {:id => choice.to_param}, valid_session
      }.to change(Choice, :count).by(-1)
    end

    it "redirects to the choices list" do
      choice = Choice.create! valid_attributes
      delete :destroy, {:id => choice.to_param}, valid_session
      expect(response).to redirect_to(choices_url)
    end
  end

end
