require 'minitest/autorun'
require "open3"

class TestEcho < Minitest::Test
  CFLAGS = "-std=c99 -Wall"
  `cc #{CFLAGS} echo.c -o echo.out`

  def test_basic_usage
    stdout_str, stderr_str, status = Open3.capture3("./echo.out hello, world!")
    assert_equal "hello, world!\n", stdout_str
    assert_equal 0, status.exitstatus
    assert_equal "", stderr_str
  end

  def test_non_english
    stdout_str, stderr_str, status = Open3.capture3("./echo.out 你好，世界！")
    assert_equal "你好，世界！\n", stdout_str
    assert_equal 0, status.exitstatus
    assert_equal "", stderr_str
  end

  def test_single_quotes
    stdout_str, stderr_str, status = Open3.capture3("./echo.out 'hello, world!'")
    assert_equal "hello, world!\n", stdout_str
    assert_equal 0, status.exitstatus
    assert_equal "", stderr_str
  end

  def test_double_quotes
    stdout_str, stderr_str, status = Open3.capture3('./echo.out "hello, world!"')
    assert_equal "hello, world!\n", stdout_str
    assert_equal 0, status.exitstatus
    assert_equal "", stderr_str
  end

  def test_flag_n
    stdout_str, stderr_str, status = Open3.capture3("./echo.out -n 'hello, world!'")
    assert_equal "hello, world!", stdout_str
    assert_equal 0, status.exitstatus
    assert_equal "", stderr_str

    stdout_str2, stderr_str2, status2 = Open3.capture3("./echo.out -n")
    assert_equal "", stdout_str2
    assert_equal 0, status2.exitstatus
    assert_equal "", stderr_str2

    stdout_str3, stderr_str3, status3 = Open3.capture3("./echo.out -n -n")
    assert_equal "-n", stdout_str3
    assert_equal 0, status3.exitstatus
    assert_equal "", stderr_str3
  end
end
