require! {Activity:'../../models/activity', Tag:'../../models/tag', Comment:'../../models/comment'}

# following page
module.exports = (req, res)!->
  res.render 'following', {
    title: '我关注的活动'
    user: req.user
  }