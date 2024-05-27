defmodule HighScore do

  @high_score %{}

  def new() do
    @high_score
  end

  def add_player(scores, name, score) do
    Map.put(scores, name, score)
  end

  def add_player(scores, name) do
    Map.put(scores, name, 0)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    add_player(scores, name)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
