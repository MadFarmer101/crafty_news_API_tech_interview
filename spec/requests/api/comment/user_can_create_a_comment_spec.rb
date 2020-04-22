RSpec.describe "POST /api/comments", type: :request do
  let!(:article) { create(:article) }

  let!(:user) { create(:user) }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: "application/json" }.merge!(user_credentials)
  end

  describe "successfully" do
    before do
      post "/api/comments",
        params: {
          comment: {
            body: "Commenting",
            article_id: article.id,
            user_id: user.id,
          },
        },
        headers: user_headers
    end

    it "returns a 200 response" do
      expect(response).to have_http_status 200
    end

    it "returns a success message" do
      expect(response_json["message"]).to eq "Your comment is saved."
    end
  end

  describe "unsuccessfully" do
    describe "with empty body" do
      before do
        post "/api/comments",
          params: {
            comment: {
              body: "",
              article_id: article.id,
              user_id: user.id,
            },
          },
          headers: user_headers
      end

      it "returns a 422 response" do
        expect(response).to have_http_status 422
      end

      it "returns an error message" do
        expect(response_json["error"]).to eq "Body can't be blank."
      end
    end

    describe "without article id" do
      before do
        post "/api/comments",
          params: {
            comment: {
              body: "Something",
              article_id: nil,
              user_id: user.id,
            },
          },
          headers: user_headers
      end

      it "returns a 500 response" do
        expect(response).to have_http_status 500
      end

      it "returns an error message" do
        expect(response_json["error"]).to eq "Internal error."
      end
    end

    describe "with invalid headers" do
      before do
        post "/api/comments",
          params: {
            comment: {
              body: "Something",
              article_id: article.id,
            },
          },
          headers: user_headers
      end

      it "returns a 500 response" do
        expect(response).to have_http_status 500
      end

      it "returns an error message" do
        expect(response_json["error"]).to eq "Internal error."
      end
    end
  end
end
