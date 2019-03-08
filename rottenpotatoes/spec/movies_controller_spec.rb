require 'rails_helper'

describe MoviesController, :type => :controller do
   it 'should call model method' do
       expect(Movie).to receive(:similar_movies).with('1')
       get :find_similar_movies, {id: '1'}
    end

    it 'should assign a value if director exists' do
        fake_movies = [double('movie1'), double('movie2')]
       expect(Movie).to receive(:similar_movies).with('1').and_return(fake_movies)
       get :find_similar_movies, id: '1'
       expect(assigns(:movies)).to eql(fake_movies)
       expect(response).to render_template('find_similar_movies')
    end

    it 'should assign a value if director exists' do
       expect(Movie).to receive(:similar_movies).with('1').and_return(nil)
       get :find_similar_movies, id: '1'
       expect(assigns(:movies)).to eql(nil)
       expect(response).to redirect_to('/movies/1')
    end

end 