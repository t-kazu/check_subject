Bundler.require

require_relative 'models/scrape'

get '/' do
  @subjects = get_subjects
  erb :index
end
