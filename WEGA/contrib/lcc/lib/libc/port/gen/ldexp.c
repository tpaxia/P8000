/*
 * ldexp(value, exp) returns the quantity value * 2 ** exp.
 * In the event of overflow, on UNIX a floating-point exception is signalled.
 * In the event of underflow, zero is returned.
 *
 */

#include <nan.h>
#include <values.h>
/* Largest long int power of 2 */
#define MAXSHIFT	(BITSPERBYTE * sizeof(long) - 2)

double
ldexp(value, exp)
register double value;
register int exp;
{
	extern double frexp();
	int old_exp;

	if (exp == 0 || value == 0.0) /* nothing to do for zero */
		return (value);
	frexp(value, &old_exp);
	if (exp > 0) {
		if (exp + old_exp > MAXBEXP) /* overflow */
			KILLFPE();
		for ( ; exp > MAXSHIFT; exp -= MAXSHIFT)
			value *= (1L << MAXSHIFT);
		return (value * (1L << exp));
	}
	if (exp + old_exp < MINBEXP) /* underflow */
		return (0.0);
	for ( ; exp < -MAXSHIFT; exp += MAXSHIFT)
		value *= 1.0/(1L << MAXSHIFT); /* mult faster than div */
	return (value / (1L << -exp));
}
