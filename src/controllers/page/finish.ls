require! {Activity:'../../models/activity', Tag:'../../models/tag', Comment:'../../models/comment'}

# upload image page
module.exports = (req, res)!->
  id = req.params.id
  res.render 'finish', {
    title: '发布活动信息'
    act_id: id
    user: req.user
  }
