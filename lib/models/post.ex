# CREATE TABLE post (id bigserial primary key, title varchar(80) NOT NULL, comment text NOT NULL, created_at timestamp default NULL, updated_at timestamp default NULL);

defmodule Post do
  use Ecto.Model

  queryable "post" do
    field :title, :string
    field :comment, :string
    field :created_at, :datetime
    field :updated_at, :datetime
  end
end
