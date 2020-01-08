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

class single {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.height = null;
      this.align = null;
      this.area = null;
    }
    else {
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = [];
      }
      if (initObj.hasOwnProperty('align')) {
        this.align = initObj.align
      }
      else {
        this.align = [];
      }
      if (initObj.hasOwnProperty('area')) {
        this.area = initObj.area
      }
      else {
        this.area = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type single
    // Serialize message field [height]
    bufferOffset = _arraySerializer.float32(obj.height, buffer, bufferOffset, null);
    // Serialize message field [align]
    bufferOffset = _arraySerializer.int32(obj.align, buffer, bufferOffset, null);
    // Serialize message field [area]
    bufferOffset = _arraySerializer.float32(obj.area, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type single
    let len;
    let data = new single(null);
    // Deserialize message field [height]
    data.height = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [align]
    data.align = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [area]
    data.area = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.height.length;
    length += 4 * object.align.length;
    length += 4 * object.area.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/single';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f1b42f61dd256ab5fb256ea59e23417b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new single(null);
    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = []
    }

    if (msg.align !== undefined) {
      resolved.align = msg.align;
    }
    else {
      resolved.align = []
    }

    if (msg.area !== undefined) {
      resolved.area = msg.area;
    }
    else {
      resolved.area = []
    }

    return resolved;
    }
};

module.exports = single;
