defmodule WebsiteWeb.Schema do
  use Absinthe.Schema

  alias WebsiteWeb.Resolvers

  import_types(__MODULE__.PostsTypes)
  import_types(__MODULE__.UsersTypes)

  query do
    @desc "Get all users"
    field :all_users, list_of(:user) do
      resolve(&Resolvers.Users.users/3)
    end

    @desc "Get a single user"
    field :fetch_user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Users.user/3)
    end

    @desc "Get all posts"
    field :all_posts, list_of(:post) do
      resolve(&Resolvers.Posts.posts/3)
    end

    @desc "Get a single post"
    field :fetch_post, :post do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Posts.post/3)
    end
  end

  mutation do
    field :login, :string do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Users.login/3)
    end

    field :create_user, :user do
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.Users.create_user/3)
    end

    field :add_post, :post do
      arg(:title, non_null(:string))
      arg(:content, non_null(:string))
      resolve(&Resolvers.Posts.add_post/3)
    end
  end
end