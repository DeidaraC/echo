require 'minitest/autorun'

class TestEcho < Minitest::Test
  CFLAGS = "-std=c99 -Wall"
  `cc #{CFLAGS} echo.c -o echo.out`

  def test_basic_usage
    output = `./echo.out hello, world!`
    assert_equal "hello, world!\n", output
  end

  def test_non_english
    output = `./echo.out 你好，世界！`
    assert_equal "你好，世界！\n", output
  end

  def test_single_quotes
    output = `./echo.out 'hello, world!'`
    assert_equal "hello, world!\n", output
  end

  def test_double_quotes
    output = `./echo.out "hello, world!"`
    assert_equal "hello, world!\n", output
  end

  def test_flag_n
    assert_equal "hello, world!", `./echo.out -n hello, world!`
    assert_equal "hello, world!", `./echo.out -n 'hello, world!'`
    assert_equal "hello, world!", `./echo.out -n "hello, world!"`
    assert_equal "", `./echo.out -n`
    assert_equal "-n", `./echo.out -n -n`
  end
end
