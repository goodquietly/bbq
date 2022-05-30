ActiveRecord::Schema[7.0].define(version: 20_220_529_063_243) do
  create_table 'events', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'address'
    t.datetime 'datetime'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'events', 'users'
end
