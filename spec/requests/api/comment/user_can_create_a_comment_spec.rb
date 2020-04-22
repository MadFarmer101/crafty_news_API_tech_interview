RSpec.describe "POST /api/comments", type: :request do
  let!(:article) { create(:article) }
  describe "successfully" do
    before do
      get "/api/articles/#{article.id}"
      post "/api/comments"
    end

    it "returns a 200 response" do
      expect(response).to have_http_status 200
    end
  end
end
