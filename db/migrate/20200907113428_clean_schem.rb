class CleanSchem < ActiveRecord::Migration[6.0]
  def change
    enable_extension "plpgsql"

    create_table "active_storage_attachments", force: :cascade do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end

    create_table "active_storage_blobs", force: :cascade do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.bigint "byte_size", null: false
      t.string "checksum", null: false
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end

    create_table "comments", force: :cascade do |t|
      t.integer "user_id"
      t.integer "post_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.text "body"
    end

    create_table "friend_requests", force: :cascade do |t|
      t.integer "user_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "requester_id"
    end

    create_table "friendships", force: :cascade do |t|
      t.integer "user_id"
      t.integer "friend_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "likes", force: :cascade do |t|
      t.integer "user_id"
      t.integer "post_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "posts", force: :cascade do |t|
      t.integer "user_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.text "body"
    end

    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "name"
      t.date "birthday"
      t.string "gender"
      t.string "provider"
      t.string "uid"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  end
end
