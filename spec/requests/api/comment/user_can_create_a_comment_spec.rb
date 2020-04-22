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
  end
end
