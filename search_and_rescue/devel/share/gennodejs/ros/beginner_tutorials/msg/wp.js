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

class wp {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.way_pt = null;
    }
    else {
      if (initObj.hasOwnProperty('way_pt')) {
        this.way_pt = initObj.way_pt
      }
      else {
        this.way_pt = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type wp
    // Serialize message field [way_pt]
    // Serialize the length for message field [way_pt]
    bufferOffset = _serializer.uint32(obj.way_pt.length, buffer, bufferOffset);
    obj.way_pt.forEach((val) => {
      bufferOffset = pose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type wp
    let len;
    let data = new wp(null);
    // Deserialize message field [way_pt]
    // Deserialize array length for message field [way_pt]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.way_pt = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.way_pt[i] = pose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 12 * object.way_pt.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/wp';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0607f801753c707bef4c2c689caa3fea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    pose[] way_pt
    
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
    const resolved = new wp(null);
    if (msg.way_pt !== undefined) {
      resolved.way_pt = new Array(msg.way_pt.length);
      for (let i = 0; i < resolved.way_pt.length; ++i) {
        resolved.way_pt[i] = pose.Resolve(msg.way_pt[i]);
      }
    }
    else {
      resolved.way_pt = []
    }

    return resolved;
    }
};

module.exports = wp;
