// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class vel {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ref_left = null;
      this.ref_right = null;
    }
    else {
      if (initObj.hasOwnProperty('ref_left')) {
        this.ref_left = initObj.ref_left
      }
      else {
        this.ref_left = 0;
      }
      if (initObj.hasOwnProperty('ref_right')) {
        this.ref_right = initObj.ref_right
      }
      else {
        this.ref_right = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type vel
    // Serialize message field [ref_left]
    bufferOffset = _serializer.int32(obj.ref_left, buffer, bufferOffset);
    // Serialize message field [ref_right]
    bufferOffset = _serializer.int32(obj.ref_right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type vel
    let len;
    let data = new vel(null);
    // Deserialize message field [ref_left]
    data.ref_left = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ref_right]
    data.ref_right = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/vel';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3607ebf3a337eebee6a6822feb14efcc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 ref_left
    int32 ref_right 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new vel(null);
    if (msg.ref_left !== undefined) {
      resolved.ref_left = msg.ref_left;
    }
    else {
      resolved.ref_left = 0
    }

    if (msg.ref_right !== undefined) {
      resolved.ref_right = msg.ref_right;
    }
    else {
      resolved.ref_right = 0
    }

    return resolved;
    }
};

module.exports = vel;
