class RankingController < ApplicationController
  before_action :logged_in_user
  def have
    @ranking_list = []
    @rankings = Have.group(:item_id).limit(10).order('count_item_id desc').count('item_id')
    @rankings.each do |key, count|
      @ranking_list.push(Item.find(key))
    end
  end

  def want
    @ranking_list = []
    @rankings = Want.group(:item_id).limit(10).order('count_item_id desc').count('item_id')
    @rankings.each do |key, count|
      @ranking_list.push(Item.find(key))
      p Item.find(key).large_image
    end
  end
  
  def show
  end
  
end
