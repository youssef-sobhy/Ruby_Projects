def fibs(n)
  fibs = [0, 1]
  (n - 1).times { fibs << fibs[-1] + fibs[-2] }
  fibs
end

def fibs_rec(n, fibs = [0, 1])
  return fibs if fibs.size == n + 1
  fibs_rec(n, fibs << fibs[-1] + fibs[-2])
end

fibs(10)                    # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
fibs_rec(10)                # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
