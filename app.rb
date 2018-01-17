# coding: utf-8
Bundler.require

require_relative 'models/scrape'

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
