var Schema = {
  users: {
    id                  : {type: 'increments', nullable: false, primary : true},
    gender              : {type: 'string', nullable    : true},
    date_of_birth       : {type: 'date', nullable      : true},
    email               : {type: 'string', maxlength   : 254, nullable  : true, unique: true},
    username            : {type: 'string', maxlength   : 14, nullable   : true, unique: true},
    password            : {type: 'string', maxlength   : 254, nullable  : true},
    first_name          : {type: 'string', maxlength   : 150, nullable  : true},
    last_name           : {type: 'string', maxlength   : 150, nullable  : true},
    phone_number        : {type: 'bigint', unsigned    : true, nullable : true},
    facebook_id         : {type: 'string', maxlength   : 255, nullable  : true, unique : true},
    facebook_token      : {type: 'string', maxlength   : 255, nullable  : true},
    facebook_name       : {type: 'string', maxlength   : 255, nullable  : true},
    facebook_email      : {type: 'string', maxlength   : 255, nullable  : true, unique : true},
    twitter_id          : {type: 'string', maxlength   : 255, nullable  : true, unique : true},
    twitter_token       : {type: 'string', maxlength   : 255, nullable  : true},
    twitter_username    : {type: 'string', maxlength   : 255, nullable  : true, unique : true},
    twitter_displayName : {type: 'string', maxlength   : 255, nullable  : true},
    google_id           : {type: 'string', maxlength   : 255, nullable  : true, unique : true},
    google_token        : {type: 'string', maxlength   : 255, nullable  : true},
    google_name         : {type: 'string', maxlength   : 255, nullable  : true},
    google_email        : {type: 'string', maxlength   : 255, nullable  : true, unique : true},
    primary_account     : {type: 'string', maxlength   : 30, nullable   : false},
    admin               : {type: 'boolean'},
    created_at          : {type: 'dateTime', nullable  : false},
    updated_at          : {type: 'dateTime', nullable  : false}
  },
  events : {
    id              : {type: 'increments', nullable: false, primary     : true},
    name            : {type: 'string', nullable    : false, maxlength   : 99},
    html_description: {type: 'text', maxlength     : 16777215, fieldtype: 'medium', nullable: false},
    user_id         : {type: 'integer', nullable   : false, unsigned    : true, references:'users.id'},
    picture_url     : {type: 'string', maxlength   : 255, nullable: true},
    address         : {type: 'string', maxlength   : 255, nullable: true},
    latitude        : {type: 'integer', nullable: true},
    longitude       : {type: 'integer', nullable: true},
    private         : {type: 'boolean', nullable: true},
    password        : {type: 'string', maxlength   : 255, nullable      : true},
    start_date      : {type: 'dateTime', nullable  : false},
    end_date        : {type: 'dateTime', nullable  : false},
    saved           : {type: 'boolean', nullable: true}, //if a user wants to save details and come back later to finish it.
    created_at      : {type: 'dateTime'},
    updated_at      : {type: 'dateTime'}

  },
  categories: {
    id  : {type: 'increments', nullable: false, primary : true},
    name: {type: 'string', maxLength   : 55, nullable   : false, unique: true}
  },
  comments: {
    id          : {type: 'increments', nullable: false, primary     : true},
    html_comment: {type: 'text', maxlength     : 16777215, fieldtype: 'medium', nullable: false},
    user_id     : {type: 'integer', nullable   : false, unsigned    : true, references:'users.id'},
    event_id    : {type: 'integer', nullable   : false, unsigned    : true, references:'events.id'},
    likes       : {type: 'integer', nullable   : true},
    created_at  : {type: 'dateTime', nullable  : false},
    updated_at  : {type: 'dateTime', nullable  : true}
  },
  ratings: {
    id      : {type: 'increments', nullable: false, primary : true},
    like    : {type: 'boolean'},
    user_id : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    event_id: {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'},
  },
  users_friends: {
    id         : {type: 'increments', nullable: false, primary : true},
    user_id    : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    friend_id  : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    created_at : {type: 'dateTime', nullable  : false},
    updated_at : {type: 'dateTime', nullable  : true}
  },
  transactions: {
    id              : {type: 'increments', nullable: false, primary : true},
    user_id         : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    event_id        : {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'},
    amount          : {type:'double', nullable     : false, unsigned: true},
    transaction_date: {type: 'dateTime', nullable  : false}
  },
  users_events: {
    id      : {type: 'increments', nullable: false, primary : true},
    user_id : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    event_id: {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'},
  },
  events_categories: {
    id         : {type: 'increments', nullable: false, primary : true},
    event_id   : {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'},
    category_id: {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'}
  },
  users_categories: {
    id         : {type: 'increments', nullable: false, primary : true},
    user_id    : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    category_id: {type: 'integer', nullable   : false, unsigned: true, references: 'categories.id'}
  }
};
module.exports = Schema;
