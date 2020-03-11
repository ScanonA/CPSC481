

{-

Lambda calculus
free uncountable t ≡ minimun bariable context of t 

Beta reduction : one step reduction t -->  t'
                                        beta

multistep reduction 
        t--> t'   0 in a one step reduction 
		   *
		t--> t' 1 in a one step reduction 


Theorem : Chinsen 8 marked 
 in the lambda calculus 
 
+------------------------------+
|                              |
|              t               |
|            +   +             |
|            |   |             |  EVERY DIVERGENCE 
|           *|   |*            |
|            |   |             |
|   t1 <-----+   +-----> t2    |
|   +                     +    |
|  *|                     |*   | HAS A CONVERGENCE
|   |                     |    |
|   +--------> t0 <-------+    |
|                              |
+------------------------------+


Important Consequences:
 A theorem is in Beta noromal form if the one who beta ductions leaving true team 
 i.e     t is beta-nf <==> there is no element t --> t'
                                                   beta

 *************    if t1 and t2 are beta normal form terms then one sequence =beta iff they are al
 pha equivalent
 
 Proof: Suppose t1 =beta t2(s) then this means true are a series of terms =beta steps union
 can be viewd as beta reductions
 
      t2          t3      ...........     tn
      + +        + +
     *| |*      *| |*                     +
 t <--+ +-> t2'<-+ +----->t3'             |
 +           +             +              |
 |           |             |              |
*|           |*            |              |
 |           |             |              |
 +---> s1<---+             |              |
        +                  |*             |*
       *|                  |              |
        |                  |              |
        +------>s2<--------+              |
                 +                        |
                *|                        |
                 +----->s0<---------------+

Examples of terms in normal form (n.f)
 *every variable is in n.f 
 *any term with no lambda-constructions is in normal form 
 *any n.f term can be labmda-constructed and will be in normal form 
    lambayx. xyz lambdax . xx
	
Why is this important? This shows that lambda-calculus is consistent, i.e. not everything
is equal.

Corollary: EVery term isin the lamba-calculus beta-reduces to at most one normal form 

+------------------------------+
|                              |
|              t               |
|            +   +             |
|            |   |             | 
|           *|   |*            |
|            |   |             |
| nf t1<-----+   +-----> t2 nf |
|   +                     +    |
|  *|                     |*   |
|   |                     |    |
|   +--------> t0 <-------+    |
|                              |
+------------------------------+

Example: Omega = (lambdax . xx) (lambdax . xx) has no n.f, it beta reduces to itself 

Proving the Cunnen-Rosso theorem 
 Lemma (Strip lemma)

  if we have a divergence of the form

+--------------------------+
|             *            |
|     t1  +-------> t3     |
|      +                   |
|      |                   |
|     *|                   |
|      |                   |
|      v                   |
|      t2                  |
|                          |
+--------------------------+

(one step) has a convergence then true system is confluent.



/*********************AFTER PROOF PICTURES FOUND IN FOLDER


Now consider the case when the many reduction is not a true root.
We show true manner beta reduction as a reduicion in a one hole context 



+---------------------------------------------------------------------------+
|                               beta                                        |
|     c[[ (lambdax . t)s ]]  +-------------> c*beta [[ (lambdax . t) s ]]   |
|            +                                            +                 |
|            |                                            |                 |
|            | v                                          +v                |
|            v                                            +>                |
|     c [[ t [s/x] ]]  +------------------>   c*beta [[ t [s/x] ]]          |
|                                                                           |
|                             beta                                          |
|                                                                           |
|                                                                           |
+---------------------------------------------------------------------------+

But we have to consider an evaluation as follows:

+---------------------------------------------------------------+
|                           beta                                |
|                                                               |
|        t    +---------------------------------->  t'          |
|        +                                          +           |
|        |                                          |           |
|        |                                          |           |
|     *  |                                          | *         |
|        |                                          |           |
|        v                                          v           |
|        v(t) +--------------------------------> v(t')          |
|                                                               |
|                                                               |
+---------------------------------------------------------------+








-}