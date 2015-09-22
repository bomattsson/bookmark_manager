# bookmark_manager

## Temp: Make a few links:

Link.create(title: 'Google', url: 'http://google.com', description: 'Evil is their motto')

Link.create(title: 'Spotify', url: 'http://spotify.com', description: 'Streaming music and stuff', created_at: Time.now)

## Code for tags

  <% if link.tags.any? %>
  <p>
    <small>
      Tags:
    <% link.tags.each do |tag| %>
      <%= tag[:title]%>
    <% end %>
    </small>
  </p>
  <% end %>