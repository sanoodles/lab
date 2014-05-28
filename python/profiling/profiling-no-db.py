def light_loop():
    for i in range(0, 1000 * 1000):
        a = i * i

def heavy_loop():
    for i in range(0, 10 * 1000 * 1000):
        a = i * i

def mid_tier():
    light_loop();
    heavy_loop();

def top_tier():
    mid_tier();

top_tier();

