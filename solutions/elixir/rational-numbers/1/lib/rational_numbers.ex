defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {a1, b1} = a
    {a2, b2} = b
    reduce({a1*b2+a2*b1, b1*b2})   
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a1, b1} = a
    {a2, b2} = b
    reduce({a1*b2-a2*b1, b1*b2})   
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a1, b1} = a
    {a2, b2} = b
    reduce({a1*a2, b1*b2})   
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a1, b1} = num
    {a2, b2} = den
    reduce({a1*b2, a2*b1})  
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a1,b1} =a
    reduce({Kernel.abs(a1),Kernel.abs(b1)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {numer, denom} = a
    cond do
      n>0 -> reduce({numer**n, denom**n})
      n<0 -> reduce({denom**-n, numer**-n})
      n==0-> {1, 1}
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {numer, denom} = n
    x**(numer/denom)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {numer, denom} = a
    divisor = Integer.gcd(numer, denom)
    if denom < 0, do: { div(-numer, divisor), div(-denom, divisor)}, else: { div(numer, divisor), div(denom, divisor)}
  end
end
