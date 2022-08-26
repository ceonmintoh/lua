
local mytime = os.time()
print(mytime)
--manipulation
local date = mytime
local day2year = 365.242
local sec2hour = 60 * 60
local sec2day = sec2hour * 24
local sec2year = sec2day * day2year

-- year
print(date // sec2year + 1970)      --> 2015.0
-- hour (in UTC)
print(date % sec2day // sec2hour)   --> 15
-- minutes
print(date % sec2hour // 60)        --> 45
-- seconds
print(date % 60)