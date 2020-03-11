

{-

Recall we set up the marked lambda-calculus:

  m --> x | lambda x m | mm | (lambda x m) m 
  
  We refised tjat we cpi;d eva;iate ,arled ter,s tp re,pves a;; ,amrlomgs a " by-value" evaluation
  
  v(x) = x
  v(lambda x N) = lambda x V(n)
  V(M N) = V(M) V(N)
  V(lambda x M) N) = V(M) [V(N)\x]
  
  Want to prove
  
  Prep in the marked lambda-calculus
  
  +-------------------------------------------+
|                                           |
|                                           |
|               beta                        |
|        m   +------------------>  m'       |
|                                           |
|        +                         +        |
|     *  |                         | *      |
|        |                         |        |
|        v                         v        |
|        v(m) +-----------------> v(m')     |
|                     *                     |
|                                           |
|                                           |
|                                           |
+-------------------------------------------+


It is useful to have the notion of a marked one hole context


A one step Beta reduction (marked or unmarked) can be written as

C [[ (lambda x m) N ]] ----->    C[[  M[N/x] ]]
                        C[[ B ]]

Proof (of prop)
(i) Consider the case when the rewrite is at the root. There are two cases:

+------------------------------------------------------------------------------+
|   a) unmarked reduction                               b) marked reduction    |
|                                                                              |
|      (lambda x. M) +-----------> m [N/x]              (lambda x M)N +> M[N/x]|
|                                     +                 +                 +    |
|            +                        |                 |                 |    |
|            |                        |                 |                 |    |
|            |                        |                 |                 |    |
|            |                        |                 |                 |    |
|            |                        |                 |                 |    |
|            |                        |                 |                 |    |
|            |                        |                 v                 v    |
|            v                        v                                        |
|       V((lambda x.M)N)             V(M[N/x])    V(M)[V(N)/x]  =  V(M[N/x])   |
|                                                               ^              |
|              =                       =   <---------------+    |              |
|       (lambda x . V(m)) V(W)        V(M) [V(N)/x]        |    |              |
|                                                          |    |              |
|                                                          |    |              |
|                                                          |    |              |
|                                                          |    |              |
|                                                          +    +              |
|                                                  Substitution lemma          |
|                                                                              |
+------------------------------------------------------------------------------+

Lemma V(M [N/x] = V(M) [V(N)/x]

Proof. By structural induction on M.
 * M = y and y =/ x    V(y [N/x[)  V(y) [V(N)/x]
                          =              =
						V(y)    =  y  =  y [V(N)/x]
						  =                 =
						V(N)         =   x [V(N)/x]

 * M = M1 M2    V(m1, m2) [N/X] )          V(m1,m2)   [V(N)/x]
                      =                        ^
				V(m1[N/x]  m2[N/x])            ~
				      =                        ~
			    V(m1[N/x]) V(m2[N/x]) = (V(m1) V(m2)) [V(N)/x)


(Last case)

 m = (lambda y . m1) m2     V((lambda y. M1) M2  [N/x])   V(lambda y. m1)m2) [V(N)/x]
                                         =
							V (lambda y. m1[N/x] m2 [N/x]
							=
							V(m1 [N/x]) [V(m2 [N/x]/y]
							=
							V(m1) [V(N) /x] [V(m2) [V(N)/x/y]
							=
							V(m1) [V(m2)/y


Lemma 
+-------------------------------------------------------+
|                beta                                   |
|    c[t]   +--------------------------> c[t']          |
|                                                       |
|       +                                  +            |
|     * |                                  | *          |
|       |                                  |            |
|       v                                  v            |
|     v(c[t]) +---------------------->  v[c[t'])        |
|                                                       |
|                                                       |
|                                                       |
+-------------------------------------------------------+

Proof Structural induction on the ocntext

* Identity context 
* 






-}