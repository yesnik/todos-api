RSpec.describe 'Todos API', type: :request do
  # initialize test data
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  describe 'GET /todos' do
    # make HTTP get request before each example
    before { get '/todos' }

    it 'returns todos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /todos/:id' do
    before { get "/todos/#{todo_id}" }

    context 'when the record exists' do
      it 'returns a todo' do
        expect(json['id']).to eq todo_id
      end

      it 'retruns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when record does not exist' do
      let(:todo_id) { 1000 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match /Could't find todo/
      end
    end
  end

  describe 'POST /todos' do
    let(:valid_attributes) { {title: 'Learn Rust', created_by: '1'} }

    context 'when the request is valid' do
      before { post '/todos', params: valid_attributes }

      it 'creates todo' do
        expect(json['title']).to eq 'Learn Rust'
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      let(:invalid_attributes) { {title: 'How to cook'} }
      before { post '/todos', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status 422
      end

      it 'returns a validation failure message' do
        expect(response.body).
          to match /Validation failed: Created by can't be blank/
      end
    end
  end

  describe 'PUT /todos/:id' do
    let(:valid_attributes) { {title: 'Learn Python'} }
    before { put "/todos/#{todo_id}" }

    context 'when the record exists' do
      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /todos/:id' do
    before { delete "/todos/#{todo_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
