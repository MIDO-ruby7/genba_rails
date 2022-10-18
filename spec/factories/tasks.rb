FactoryBot.define do
  factory :task do
    name {'テストを書く'}
    description {'RSpec & FactoryBotを準備する'}
    user #:userという名前のFactoryをTaskモデルに定義されたuserという名前の関連を生成するのに利用するという意味
  end
end