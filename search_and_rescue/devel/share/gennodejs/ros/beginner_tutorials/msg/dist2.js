// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let dist1 = require('./dist1.js');

//-----------------------------------------------------------

class dist2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new dist1();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dist2
    // Serialize message field [data]
    bufferOffset = dist1.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dist2
    let len;
    let data = new dist2(null);
    // Deserialize message field [data]
    data.data = dist1.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/dist2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5b473841e30c98b858bbebd2aca970b8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    dist1 data
    
    ================================================================================
    MSG: beginner_tutorials/dist1
    float32 distance
    int32 dir
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new dist2(null);
    if (msg.data !== undefined) {
      resolved.data = dist1.Resolve(msg.data)
    }
    else {
      resolved.data = new dist1()
    }

    return resolved;
    }
};

module.exports = dist2;
