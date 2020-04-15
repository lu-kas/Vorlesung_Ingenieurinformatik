def primedecomposition(number, primes):
    result = [0] * len(primes)
    for i in range(len(primes)):
        p = primes[i]
        while number % p == 0:
            number = number / p
            result[i] += 1
    return result

def mult(primes, power):
    result = 1
    for i in range(len(primes)):
        result *= primes[i] ** power[i]
    return result

def ggT(no1, no2, primes):
    dec1 = primedecomposition(no1, primes)
    dec2 = primedecomposition(no2, primes)

    power = []
    for i in range(len(primes)):
        if dec1[i] > dec2[i]:
            power.append(dec2[i])
        else:
            power.append(dec1[i])

    return mult(primes,power)
    
if __name__ == "__main__":
    no1 = 315
    no2 = 126
    primes = [2,3,5,7]
    print("ggT of {} and {} is {}.".format(no1,no2,ggT(no1,no2,primes)))
    print("prime decompostion of {}: {}".format(no1, primedecomposition(no1,primes)))
    print("prime decompostion of {}: {}".format(no2, primedecomposition(no2,primes)))
