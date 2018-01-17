# coding: utf-8
Bundler.require

require_relative 'models/init'

get '/' do
  begin
    @subjects = get_subjects
    erb :index
  rescue => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
    @error = 'データの取得に失敗しました。'
    erb :error
  end
end

get '/register' do
  #授業登録画面を取得します。
  begin
    @studies = get_studies
    erb :register
  rescue => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
    @error = 'データの取得に失敗しました。'
    erb :error
  end
end

post '/register' do
   begin
    register_study(params[:study])
  rescue => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
    @error = 'データの取得に失敗しました。'
    erb :error
  end
  redirect to('register')
end

post '/delete' do
  #授業を削除します。
  begin
    study = params[:study]
    p study
    #delete_study(params[:study])
  rescue => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
    @error = '削除に失敗しました。'
    erb :error
  end
  redirect to('/register')
end

post '/delete_all' do
  #登録している授業を全て削除します。
  begin
    delete_all_study
  rescue => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
    @error = '削除に失敗しました。'
    erb :error
  end
  redirect to('/register')
end
