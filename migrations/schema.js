var Schema = {
  users: {
    id                  : {type: 'increments', nullable: false, primary : true},
    email               : {type: 'string', maxlength   : 254, nullable  : true, unique: true},
    username            : {type: 'string', maxlength   : 14, nullable   : true, unique: true},
    password            : {type: 'string', maxlength   : 24, nullable   : true},
    first_name          : {type: 'string', maxlength   : 150, nullable  : true},
    last_name           : {type: 'string', maxlength   : 150, nullable  : true},
    phone_number        : {type: 'integer', unsigned   : true, nullable : true},
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
    admin               : {type: 'boolean'},
    created_at          : {type: 'dateTime', nullable  : false},
    updated_at          : {type: 'dateTime', nullable  : false}
  },
  events : {
    id              : {type: 'increments', nullable: false, primary     : true},
    name            : {type: 'string', nullable    : false, maxLength   : 30},
    html_description: {type: 'text', maxlength     : 16777215, fieldtype: 'medium', nullable: false},
    user_id         : {type: 'integer', nullable   : false, unsigned    : true, references:'users.id'},
    start_date      : {type: 'dateTime', nullable  : false},
    end_date        : {type: 'dateTime', nullable  : true},
    created_at      : {type: 'dateTime', nullable  : false},
    updated_at      : {type: 'dateTime', nullable  : true}

  },
  categories: {
    id  : {type: 'increments', nullable: false, primary : true},
    name: {type: 'string', maxLength   : 55, nullable   : false}
  },
  events_comments: {
    id          : {type: 'increments', nullable: false, primary     : true},
    html_comment: {type: 'text', maxlength     : 16777215, fieldtype: 'medium', nullable: false},
    user_id     : {type: 'integer', nullable   : false, unsigned    : true, references:'users.id'},
    event_id    : {type: 'integer', nullable   : false, unsigned    : true, references:'events.id'},
    created_at  : {type: 'dateTime', nullable  : false},
    updated_at  : {type: 'dateTime', nullable  : true}
  },
  ratings: {
    id      : {type: 'increments', nullable: false, primary : true},
    like    : {type: 'boolean'},
    user_id : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    event_id: {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'},
  },
  friends: {
    user_id    : {type: 'integer', nullable  : false, unsigned: true, references: 'users.id'},
    friend_id  : {type: 'integer', nullable  : false, unsigned: true, references: 'users.id'},
    created_at : {type: 'dateTime', nullable : false},
    updated_at : {type: 'dateTime', nullable : true}
  },
  transactions: {
    id              : {type: 'increments', nullable: false, primary : true},
    user_id         : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    event_id        : {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'},
    amount          : {type:'double', nullable     : false, unsigned: true},
    transaction_date: {type: 'dateTime', nullable  : false}
  },
  users_events: {
    user_id : {type: 'integer', nullable: false, unsigned: true, references: 'users.id'},
    event_id: {type: 'integer', nullable: false, unsigned: true, references: 'events.id'},
  },
  events_categories: {
    event_id   : {type: 'integer', nullable: false, unsigned: true, references: 'events.id'},
    category_id: {type: 'integer', nullable: false, unsigned: true, references: 'events.id'}
  },
  users_categories: {
    user_id    : {type: 'integer', nullable: false, unsigned: true, references: 'users.id'},
    category_id: {type: 'integer', nullable: false, unsigned: true, references: 'events.id'}
  }
};
module.exports = Schema;
