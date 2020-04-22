RSpec.describe "POST /api/comments", type: :request do
  let!(:article) { create(:article) }

  describe "successfully" do
    before do
      post "/api/comments",
        params: {
          comment: {
            body: 'Commenting',
            article_id: article.id
          } 
        } 
    end

    it "returns a 200 response" do
      expect(response).to have_http_status 200
    end

    it "returns a success message" do
      expect(response_json["message"]).to eq 'Your comment is saved.'
    end
  end

  describe "unsuccessfully" do
    before do
      post "/api/comments",
        params: {
          comment: {
            body: '',
            article_id: article.id
          } 
        } 
    end

    it "returns a 422 response" do
      expect(response).to have_http_status 422
    end

    it "returns an error message" do
      expect(response_json["error"]).to eq "Body can't be blank."
    end
  end
end
