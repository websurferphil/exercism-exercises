defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name), do: Map.put(scores, name, 0)
  def add_player(scores, name, score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score) do 
    {_, new} = Map.get_and_update(scores, name, fn current -> 
      update = (current || 0) + score
      {current, update}
    end)
    new
  end

  def get_players(scores), do: Map.keys(scores)
end
