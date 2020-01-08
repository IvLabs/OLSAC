// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let single = require('./single.js');

//-----------------------------------------------------------

class info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.array = null;
    }
    else {
      if (initObj.hasOwnProperty('array')) {
        this.array = initObj.array
      }
      else {
        this.array = new single();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type info
    // Serialize message field [array]
    bufferOffset = single.serialize(obj.array, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type info
    let len;
    let data = new info(null);
    // Deserialize message field [array]
    data.array = single.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += single.getMessageSize(object.array);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2b1c54aa4c02c97f9c6f17593bc5f83';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    single array
    
    ================================================================================
    MSG: beginner_tutorials/single
    float32[] height
    int32[] align
    float32[] area
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new info(null);
    if (msg.array !== undefined) {
      resolved.array = single.Resolve(msg.array)
    }
    else {
      resolved.array = new single()
    }

    return resolved;
    }
};

module.exports = info;
