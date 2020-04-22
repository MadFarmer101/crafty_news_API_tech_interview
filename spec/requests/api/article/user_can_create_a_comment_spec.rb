RSpec.describe "POST /api/articles", type: :request do
  let!(:articles) { 3.times { create(:article) } }
  describe "successfully" do
    before do
      post "/api/articles"
    end

    it "returns a 200 response" do
      expect(response).to have_http_status 200
    end
  end
end
