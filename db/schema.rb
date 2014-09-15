# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140915171454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_messages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
    t.string   "url"
    t.integer  "message_type"
  end

  create_table "admin_messages_user_types", id: false, force: true do |t|
    t.integer "admin_message_id"
    t.integer "user_type_id"
  end

  create_table "adyen_notifications", force: true do |t|
    t.boolean  "live",                            default: false, null: false
    t.string   "event_code",                                      null: false
    t.string   "psp_reference",                                   null: false
    t.string   "original_reference"
    t.string   "merchant_reference",                              null: false
    t.string   "merchant_account_code",                           null: false
    t.datetime "event_date",                                      null: false
    t.boolean  "success",                         default: false, null: false
    t.string   "payment_method"
    t.string   "operations"
    t.text     "reason"
    t.string   "currency",              limit: 3
    t.integer  "value"
    t.boolean  "processed",                       default: false, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "adyen_notifications", ["psp_reference", "event_code", "success"], name: "adyen_notification_uniqueness", unique: true, using: :btree

  create_table "agencies", force: true do |t|
    t.integer  "agent_id"
    t.integer  "artist_id"
    t.integer  "record_label_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "agents", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.text     "credentials"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bank_transfer_informations", force: true do |t|
    t.string   "name"
    t.string   "encrypted_iban"
    t.string   "encrypted_swift"
    t.string   "encrypted_bank_name"
    t.string   "encrypted_bank_address1"
    t.string   "encrypted_bank_address2"
    t.string   "encrypted_bank_country"
    t.string   "encrypted_bank_code"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.string   "paypal_email"
    t.boolean  "record_label_handles_payment"
    t.string   "encrypted_intermediary_bank"
  end

  create_table "banners", force: true do |t|
    t.integer  "record_label_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url",                default: "http://koblo.com"
    t.integer  "user_id"
  end

  add_index "banners", ["record_label_id"], name: "index_banners_on_record_label_id", using: :btree

  create_table "dismissed_timeline_events", force: true do |t|
    t.integer  "user_id"
    t.integer  "timeline_event_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "down_payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount_in_cents"
    t.string   "currency"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "download_validity_tokens", force: true do |t|
    t.string   "nonce"
    t.integer  "validity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.boolean  "active",          default: true,  null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "front_page_groups", force: true do |t|
    t.integer  "width"
    t.integer  "height"
    t.string   "item_type"
    t.string   "scope"
    t.integer  "max_number_of_items"
    t.integer  "position"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "title"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "cached_slug"
  end

  add_index "genres", ["cached_slug"], name: "index_categories_on_cached_slug", unique: true, using: :btree

  create_table "help_tips", force: true do |t|
    t.string   "page"
    t.string   "target"
    t.string   "text"
    t.string   "target_corner"
    t.string   "tip_corner"
    t.integer  "x_adjust"
    t.integer  "y_adjust"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "short_title"
  end

  create_table "payments", force: true do |t|
    t.integer  "amount"
    t.string   "currency_code"
    t.string   "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pending_social_network_messages", force: true do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.string   "provider"
    t.datetime "sent_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "facebook_id"
    t.string   "title"
    t.text     "message"
  end

  create_table "pictures", force: true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "pictures", ["picture_file_name"], name: "index_pictures_on_picture_file_name", using: :btree

  create_table "purchase_items", force: true do |t|
    t.integer  "purchase_id"
    t.integer  "song_id"
    t.string   "format"
    t.integer  "price_in_cents"
    t.string   "currency"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "purchase_items", ["purchase_id"], name: "index_purchase_items_on_purchase_id", using: :btree
  add_index "purchase_items", ["song_id"], name: "index_purchase_items_on_song_id", using: :btree

  create_table "purchases", force: true do |t|
    t.integer  "user_id"
    t.boolean  "completed",      default: false
    t.integer  "price_in_cents"
    t.string   "currency"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "payment_method"
    t.string   "last_digits"
  end

  create_table "ratings", force: true do |t|
    t.integer "song_id"
    t.integer "value"
    t.integer "user_id"
    t.string  "ip_address"
  end

  add_index "ratings", ["ip_address"], name: "index_ratings_on_ip_address", using: :btree
  add_index "ratings", ["song_id"], name: "index_ratings_on_song_id", using: :btree

  create_table "record_labels", force: true do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "picture_id"
    t.integer  "admin_id"
    t.text     "description"
    t.string   "website"
    t.string   "tagline"
    t.string   "cached_slug"
  end

  add_index "record_labels", ["cached_slug"], name: "index_record_labels_on_cached_slug", unique: true, using: :btree

  create_table "remix_settings", force: true do |t|
    t.string   "fx1"
    t.string   "fx2"
    t.string   "solo"
    t.string   "mute"
    t.string   "pan"
    t.string   "vol"
    t.text     "xml"
    t.integer  "song_id"
    t.integer  "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "slugs", force: true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                  default: 1, null: false
    t.string   "sluggable_type", limit: 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], name: "index_slugs_on_n_s_s_and_s", unique: true, using: :btree
  add_index "slugs", ["sluggable_id"], name: "index_slugs_on_sluggable_id", using: :btree

  create_table "song_approval_requests", force: true do |t|
    t.integer  "song_id"
    t.string   "approved"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_nonces", force: true do |t|
    t.string   "session_id"
    t.string   "nonce"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "count"
  end

  add_index "song_nonces", ["nonce"], name: "index_song_nonces_on_nonce", using: :btree
  add_index "song_nonces", ["session_id"], name: "index_song_nonces_on_session_id", using: :btree
  add_index "song_nonces", ["song_id"], name: "index_song_nonces_on_song_id", using: :btree

  create_table "songs", force: true do |t|
    t.string   "title"
    t.integer  "album_id"
    t.integer  "user_id"
    t.integer  "duration"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "genre_id"
    t.string   "mixdown_file_name"
    t.string   "mixdown_content_type"
    t.integer  "mixdown_file_size"
    t.integer  "samples"
    t.string   "currency"
    t.string   "multitrack_zip_file_file_name"
    t.string   "multitrack_zip_file_content_type"
    t.integer  "multitrack_zip_file_content_file_size"
    t.integer  "mixdown_tier"
    t.integer  "multitrack_tier"
    t.integer  "ringtone_tier"
    t.float    "bpm"
    t.integer  "sample_rate"
    t.string   "precision"
    t.string   "waveform_file_name"
    t.string   "waveform_content_type"
    t.integer  "waveform_file_size"
    t.datetime "waveform_updated_at"
    t.integer  "remix_of_id"
    t.text     "xml"
    t.datetime "released_at"
    t.string   "cached_slug"
    t.string   "remix_usage"
    t.boolean  "contests_allowed"
    t.boolean  "judge_intent"
    t.boolean  "prizes_offered"
    t.boolean  "approved_by_artist",                    default: false
    t.float    "score"
    t.string   "isrc"
    t.boolean  "importing"
    t.boolean  "featured",                              default: false
  end

  add_index "songs", ["cached_slug"], name: "index_songs_on_cached_slug", unique: true, using: :btree
  add_index "songs", ["created_at"], name: "index_songs_on_created_at", using: :btree
  add_index "songs", ["genre_id"], name: "index_songs_on_category_id", using: :btree
  add_index "songs", ["remix_of_id"], name: "index_songs_on_remix_of_id", using: :btree
  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "support_requests", force: true do |t|
    t.string   "email"
    t.text     "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeline_events", force: true do |t|
    t.string   "event_type"
    t.string   "subject_type"
    t.string   "actor_type"
    t.string   "secondary_subject_type"
    t.integer  "subject_id"
    t.integer  "actor_id"
    t.integer  "secondary_subject_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "priority"
  end

  create_table "tracks", force: true do |t|
    t.string   "title"
    t.integer  "song_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "sound_updated_at"
    t.integer  "user_id"
    t.string   "uploaded_data_file_name"
    t.string   "uploaded_data_content_type"
    t.integer  "uploaded_data_file_size"
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.integer  "mp3_file_size"
    t.string   "wav_file_name"
    t.string   "wav_content_type"
    t.integer  "wav_file_size"
    t.string   "waveform_file_name"
    t.string   "waveform_content_type"
    t.integer  "waveform_content_file_size"
    t.integer  "position"
  end

  create_table "user_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                            default: "",    null: false
    t.string   "encrypted_password",   limit: 128, default: "",    null: false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "role"
    t.string   "name"
    t.integer  "record_label_id"
    t.string   "website"
    t.text     "description"
    t.integer  "picture_id"
    t.integer  "user_type_id"
    t.string   "cached_slug"
    t.boolean  "terms_accepted"
    t.boolean  "emails_accepted"
    t.boolean  "featured",                         default: false
    t.integer  "manager_id"
    t.string   "twitter_username"
  end

  add_index "users", ["cached_slug"], name: "index_users_on_cached_slug", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["picture_id"], name: "index_users_on_picture_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_users", id: false, force: true do |t|
    t.integer  "fan_id"
    t.integer  "idol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "vouchers", force: true do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
