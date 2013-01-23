var SkillView = Backbone.View.extend({
  tagname: 'div',
  className: 'skill-canvas-container',
  template:_.template( $('#skill-template').html() ),

  initialize: function() {
    this.render();
  },

  render: function() {
    this.el.id = this.model.attributes.div-id;

    $(this.el).html(this.template(this.model.toJSON()));
    console.log($(this.el).html());
    return this;
  }
});
