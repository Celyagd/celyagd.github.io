# encoding: UTF-8

require File.expand_path('../test_helper', __FILE__)


class NodeCommentTest < Minitest::Test
  def setup
    xp = XML::Parser.string('<root></root>')
    @doc = xp.parse
    assert_instance_of(XML::Document, @doc)
    @root = @doc.root
  end

  def test_libxml_node_add_comment_01
    @root << XML::Node.new_comment('mycomment')
    assert_equal '<root><!--mycomment--></root>',
      @root.to_s.gsub(/\n\s*/,'')
  end

  def test_libxml_node_add_comment_02
    @root << XML::Node.new_comment('mycomment')
    assert_equal 'comment',
    @root.child.node_type_name
  end

  def test_libxml_node_add_comment_03
    @root << el = XML::Node.new_comment('mycomment')
    el << "_this_is_added"
    assert_equal '<root><!--mycomment_this_is_added--></root>',
    @root.to_s.gsub(/\n\s*/,'')
  end
end
