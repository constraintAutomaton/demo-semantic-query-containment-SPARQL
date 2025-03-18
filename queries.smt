; ------------ Sort and Predicate -------------------
(declare-sort RDFValue 0)
(declare-fun P (RDFValue RDFValue RDFValue RDFValue) Bool)
(declare-fun f_str (RDFValue) RDFValue)
(declare-fun f_xsd_string (RDFValue) RDFValue)
(declare-fun f_datatype (RDFValue) RDFValue)
(declare-fun f_lcase (RDFValue) RDFValue)
(declare-fun f_round (RDFValue) RDFValue)
(declare-fun f_abs (RDFValue) RDFValue)
(declare-fun f_isliteral (RDFValue) Bool)
(declare-fun f_isuri (RDFValue) Bool)
(declare-fun f_contains (RDFValue RDFValue) Bool)
(declare-fun f_regex (RDFValue RDFValue) Bool)
(declare-fun f_add (RDFValue RDFValue) RDFValue)
(declare-fun f_sub (RDFValue RDFValue) RDFValue)
(declare-fun f_mul (RDFValue RDFValue) RDFValue)
(declare-fun f_div (RDFValue RDFValue) RDFValue)
(declare-fun f_lt (RDFValue RDFValue) Bool)
(declare-fun f_gt (RDFValue RDFValue) Bool)
(declare-fun f_leq (RDFValue RDFValue) Bool)
(declare-fun f_geq (RDFValue RDFValue) Bool)
(declare-fun f_bound (RDFValue) Bool)
(declare-const <default_graph> RDFValue)
(assert (forall ((s RDFValue)(p RDFValue)(o RDFValue)(g RDFValue)) (=> (P s p o g) (P s p o <default_graph>))))

; ------------ IRIs ---------------------------------
(declare-const	<p0_Resourse>	RDFValue)
(declare-const	<p1_age>	RDFValue)
(declare-const	<p1_job>	RDFValue)
(declare-const	<p_Property>	RDFValue)

; ------------ Literals -----------------------------
(declare-const	<l_18>	RDFValue)

; ------------ Variables ----------------------------
(declare-const	<v2_age>	RDFValue)
(declare-const	<v2_s>	RDFValue)

; ------------ Assumption ---------------------------
(assert 
	(and 
		(P <v2_s> <p1_age> <v2_age> <default_graph>) 
	)
)

; ------------ Conjecture ---------------------------
(assert (not (exists ((<v1_age> RDFValue)(<v1_s> RDFValue)(<v1_job> RDFValue)) 
	(and 
		(P <v1_s> <p1_job> <v1_job> <default_graph>) 
		(P <v1_s> <p1_age> <v1_age> <default_graph>) 
		(f_gt <v1_age> <l_18>)
		(and (= <v1_age> <v2_age>) (= <v1_s> <v2_s>) )
	)
)))

; ------------ Check-Sat ----------------------------
(check-sat)
