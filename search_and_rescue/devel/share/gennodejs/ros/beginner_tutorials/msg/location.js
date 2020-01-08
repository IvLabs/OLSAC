// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let pose = require('./pose.js');

//-----------------------------------------------------------

class location {
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
        this.data = new pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type location
    // Serialize message field [data]
    bufferOffset = pose.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type location
    let len;
    let data = new location(null);
    // Deserialize message field [data]
    data.data = pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/location';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '07f9b1d7d02ec65642cb58d50c4281bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    pose data
    
    ================================================================================
    MSG: beginner_tutorials/pose
    float32 x
    float32 y
    float32 theta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new location(null);
    if (msg.data !== undefined) {
      resolved.data = pose.Resolve(msg.data)
    }
    else {
      resolved.data = new pose()
    }

    return resolved;
    }
};

module.exports = location;
