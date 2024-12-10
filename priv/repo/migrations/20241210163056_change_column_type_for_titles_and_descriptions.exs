defmodule Caaal.Repo.Migrations.ChangeColumnTypeForTitlesAndDescriptions do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      modify :title, :text
      modify :description, :text
    end
  end
end
