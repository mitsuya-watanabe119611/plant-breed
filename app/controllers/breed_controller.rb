class BreedController < ApplicationController
  def index
    @seed_sentences = SeedSentence.all
    @seeding_sentences = SeedingSentence.all
    @flower_sentences = FlowerSentence.all
    @user = User.find_by(name: "guest")
    @plant = Plant.find_by(seed_sen_id: @user.seed_sen_id, seeding_sen_id: @user.seeding_sen_id, flower_sen_id: @user.flower_sen_id)
  end

  def search
    @seed_sentences = SeedSentence.all
    @seeding_sentences = SeedingSentence.all
    @flower_sentences = FlowerSentence.all
    
    @user = User.find_by(name: "guest")
    
    if @user.seed_sen_id.nil? && @user.seeding_sen_id.nil? && @user.flower_sen_id.nil?
      @user.seed_sen_id = params[:sentence_id].to_i
      @user.save
      redirect_to breed_index_path
    elsif @user.seeding_sen_id.nil? && @user.flower_sen_id.nil?
      @user.seeding_sen_id = params[:sentence_id].to_i
      @user.save
      redirect_to breed_index_path
    elsif @user.flower_sen_id.nil?
      @user.flower_sen_id = params[:sentence_id].to_i
      @user.save
      redirect_to breed_index_path
    end
  end

  def reset
    @user = User.find_by(name: "guest")
    @user.seed_sen_id = nil
    @user.seeding_sen_id = nil
    @user.flower_sen_id = nil
    @user.save
    redirect_to breed_path
  end
end
