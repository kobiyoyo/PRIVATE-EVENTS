
FactoryBot.define do
  factory :event do
    title { 'Rails for Business Executives' }
    description { 'Rails is ,it productive and nice,oyoyo sawale oyooyo sawala egba bobobo  bhen' }
    start_time { '2019-12-31 15:15:00' }
    location { 'Anpa' }
    association :creator, factory: :user
  end
end