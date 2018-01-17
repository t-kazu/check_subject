# coding: utf-8

# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
require 'mechanize'

class Subject
  attr_accessor :date, :attribute, :time, :group, :name, :theacher, :room, :other

  def initialize(data)
    @date = data[0]
    @attribute = data[1]
    @time = data[2]
    @group = data[3]
    @name = data[4]
    @teacher = data[5]
    @room = data[6]
    @other = data[7]
  end

end


def get_subjects
  # 受講している科目
  begin
    file = File.open('core/study.txt') #プロジェクトルートからのパス
    studies = file.read().split("\n")
    file.close
  rescue => e
    return e
  end

  # スクレイピング先のURL
  url = 'http://www.kougi.shimane-u.ac.jp/selectweb/conduct_list.asp'
  agent = Mechanize.new
  subjects = Array.new()

  (1..100).each do |i|
    response = agent.post(url,{ abspage: i })
    break if i.to_s != response.forms[0].field_with(:name => 'abspage').value
    doc = Nokogiri::HTML(response.body)

    doc.xpath('//tr').each do |item|
      subject = item.text.split("\r\n")[1..8]
      subjects << Subject.new(subject) if studies.index(subject[4]) != nil
    end
  end

  subjects
end
