var Schema = {
  users: {
    id          : {type: 'increments', nullable: false, primary : true},
    email       : {type: 'string', maxlength   : 254, nullable  : false, unique: true},
    username    : {type: 'string', maxlength   : 14, nullable   : false, unique: true},
    password    : {type: 'string', maxLength   : 24, nullable   : false},
    first_name  : {type: 'string', maxlength   : 150, nullable  : false},
    last_name   : {type: 'string', maxlength   : 150, nullable  : false},
    phone_number: {type: 'integer', nullable   : false, unsigned: true},
    created_at  : {type: 'dateTime', nullable  : false},
    updated_at  : {type: 'dateTime', nullable  : true}
  },
  events : {
    id              : {type: 'increments', nullable: false, primary  : true},
    name            : {type: 'string', nullable    : false, maxLength: 30},
    html_description: {type: 'text', maxlength: 16777215, fieldtype: 'medium', nullable: false},
    user_id: {type: 'integer', nullable: false, unsigned: true, references:'users.id'},
    start_date      : {type: 'dateTime', nullable  : false},
    end_date        : {type: 'dateTime', nullable  : true},
    created_at      : {type: 'dateTime', nullable  : false},
    updated_at      : {type: 'dateTime', nullable  : true}

  },
  categories: {
    id: {type: 'increments', nullable: false, primary : true},
    name: {type: 'string', maxLength: 55, nullable: false}
  },
  event_comments: {
    id          : {type: 'increments', nullable: false, primary     : true},
    html_comment: {type: 'text', maxlength     : 16777215, fieldtype: 'medium', nullable: false},
    user_id     : {type: 'integer', nullable   : false, unsigned    : true, references:'users.id'},
    event_id    : {type: 'integer', nullable   : false, unsigned    : true, references:'events.id'}
  },
  ratings: {
    id      : {type: 'increments', nullable: false, primary : true},
    like    : {type: 'boolean'},
    user_id : {type: 'integer', nullable   : false, unsigned: true, references: 'users.id'},
    event_id: {type: 'integer', nullable   : false, unsigned: true, references: 'events.id'},
  },
  user_events: {
    user_id : {type: 'integer', nullable: false, unsigned: true, references: 'users.id'},
    event_id: {type: 'integer', nullable: false, unsigned: true, references: 'events.id'},
  },
  friends: {
    user_id : {type: 'integer', nullable: false, unsigned: true, references: 'users.id'},
    friend_id : {type: 'integer', nullable: false, unsigned: true, references: 'users.id'},
  }
};
module.exports = Schema;
