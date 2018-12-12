function c = circu(u, v, x, y)

c = trapz(y, v) + trapz(x, u);

end
