class User
  scope :ordered_by, (col) -> { order(col) }
end

class UserController
  def index
    @users = User.ordered_by('last_name')
  end
end

<html>
  <body>
    <ul>
      <% @users.each do |user| %>
        <li><%= user.last_name %> <%= user.first_name %></li>
      <% end %>
    </ul>
  </body>
</html>