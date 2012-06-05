Spine = require('spine')

class Example extends Spine.Model
  @configure 'Example', 'name'
  
module.exports = Example