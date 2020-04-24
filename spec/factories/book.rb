FactoryBot.define do
  factory :book do
    id                    { 1 }
    title                 { 'test' }
    author_id             { 134 }
    genre_id              { 13 }
    publisher_id          { 1 }
    created_at            { "2020-02-23 08:16:34" }
    updated_at            { "2020-02-23 08:16:34" }
  end
end
