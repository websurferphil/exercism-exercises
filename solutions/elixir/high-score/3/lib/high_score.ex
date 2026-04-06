defmodule HighScore do
  @init_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @init_score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score) do 
    {_, new} = Map.get_and_update(scores, name, fn current -> 
      update = (current || @init_score) + score
      {current, update}
    end)
    new
  end

  def get_players(scores), do: Map.keys(scores)
end
