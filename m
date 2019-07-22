Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpaZs-0000Wh-Te
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaUj-0006eB-Dj
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaUZ-0004hE-4M
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:44:57 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.76]:48096)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaTn-0003x9-S0; Mon, 22 Jul 2019 11:44:01 -0400
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926081.bt.com (10.36.82.112) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:41:46 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:41:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:41:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, <walling@linux.ibm.com>, <david@redhat.com>,
 <palmer@sifive.com>, <mark.cave-ayland@ilande.co.uk>,
 <Alistair.Francis@wdc.com>, <arikalo@wavecomp.com>, <mst@redhat.com>,
 <pasic@linux.ibm.com>, <borntraeger@de.ibm.com>, <rth@twiddle.net>,
 <atar4qemu@gmail.com>, <ehabkost@redhat.com>, <sw@weilnetz.de>,
 <alex.williamson@redhat.com>, <qemu-arm@nongnu.org>,
 <david@gibson.dropbear.id.au>, <qemu-riscv@nongnu.org>, <cohuck@redhat.com>,
 <claudio.fontana@huawei.com>, <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, 
 <amarkovic@wavecomp.com>, <pbonzini@redhat.com>, <aurelien@aurel32.net>
Thread-Topic: [Qemu-devel] [PATCH v2 03/20] tcg: Replace MO_32 with MO_UL alias
Thread-Index: AQHVQKP47nfq9GamtU2q8ZXtYPwq2Q==
Date: Mon, 22 Jul 2019 15:41:47 +0000
Message-ID: <1563810105644.28725@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381010564428725btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.76
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:50:10 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 03/20] tcg: Replace MO_32 with
 MO_UL alias
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jul 2019 15:45:07 -0000

--_000_156381010564428725btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for splitting MO_32 out from TCGMemOp into new accelerator
independent MemOp.

As MO_32 will be a value of MemOp, existing TCGMemOp comparisons and
coercions will trigger -Wenum-compare and -Wenum-conversion.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/arm/sve_helper.c             |   6 +-
 target/arm/translate-a64.c          | 148 +++++++++++++++++---------------=
---
 target/arm/translate-sve.c          |  12 +--
 target/arm/translate-vfp.inc.c      |   4 +-
 target/arm/translate.c              |  34 ++++----
 target/i386/translate.c             | 150 ++++++++++++++++++--------------=
----
 target/ppc/translate/vmx-impl.inc.c |  28 +++----
 target/ppc/translate/vsx-impl.inc.c |   4 +-
 target/s390x/translate.c            |   4 +-
 target/s390x/translate_vx.inc.c     |   2 +-
 target/s390x/vec.h                  |   4 +-
 tcg/aarch64/tcg-target.inc.c        |  20 ++---
 tcg/arm/tcg-target.inc.c            |   6 +-
 tcg/i386/tcg-target.inc.c           |  28 +++----
 tcg/mips/tcg-target.inc.c           |   6 +-
 tcg/ppc/tcg-target.inc.c            |   2 +-
 tcg/riscv/tcg-target.inc.c          |   2 +-
 tcg/sparc/tcg-target.inc.c          |   2 +-
 tcg/tcg-op-gvec.c                   |  64 +++++++--------
 tcg/tcg-op-vec.c                    |   6 +-
 tcg/tcg-op.c                        |  18 ++---
 tcg/tcg.h                           |   2 +-
 22 files changed, 276 insertions(+), 276 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f6bef3d..fa705c4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1561,7 +1561,7 @@ void HELPER(sve_cpy_m_s)(void *vd, void *vn, void *vg=
,
     uint64_t *d =3D vd, *n =3D vn;
     uint8_t *pg =3D vg;

-    mm =3D dup_const(MO_32, mm);
+    mm =3D dup_const(MO_UL, mm);
     for (i =3D 0; i < opr_sz; i +=3D 1) {
         uint64_t nn =3D n[i];
         uint64_t pp =3D expand_pred_s(pg[H1(i)]);
@@ -1612,7 +1612,7 @@ void HELPER(sve_cpy_z_s)(void *vd, void *vg, uint64_t=
 val, uint32_t desc)
     uint64_t *d =3D vd;
     uint8_t *pg =3D vg;

-    val =3D dup_const(MO_32, val);
+    val =3D dup_const(MO_UL, val);
     for (i =3D 0; i < opr_sz; i +=3D 1) {
         d[i] =3D val & expand_pred_s(pg[H1(i)]);
     }
@@ -5123,7 +5123,7 @@ static inline void sve_ldff1_zs(CPUARMState *env, voi=
d *vd, void *vg, void *vm,
     target_ulong addr;

     /* Skip to the first true predicate.  */
-    reg_off =3D find_next_active(vg, 0, reg_max, MO_32);
+    reg_off =3D find_next_active(vg, 0, reg_max, MO_UL);
     if (likely(reg_off < reg_max)) {
         /* Perform one normal read, which will fault or not.  */
         set_helper_retaddr(ra);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3acfccb..0b92e6d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -484,7 +484,7 @@ static TCGv_i32 read_fp_sreg(DisasContext *s, int reg)
 {
     TCGv_i32 v =3D tcg_temp_new_i32();

-    tcg_gen_ld_i32(v, cpu_env, fp_reg_offset(s, reg, MO_32));
+    tcg_gen_ld_i32(v, cpu_env, fp_reg_offset(s, reg, MO_UL));
     return v;
 }

@@ -999,7 +999,7 @@ static void read_vec_element(DisasContext *s, TCGv_i64 =
tcg_dest, int srcidx,
     case MO_UW:
         tcg_gen_ld16u_i64(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_gen_ld32u_i64(tcg_dest, cpu_env, vect_off);
         break;
     case MO_SB:
@@ -1008,7 +1008,7 @@ static void read_vec_element(DisasContext *s, TCGv_i6=
4 tcg_dest, int srcidx,
     case MO_SW:
         tcg_gen_ld16s_i64(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_32|MO_SIGN:
+    case MO_SL:
         tcg_gen_ld32s_i64(tcg_dest, cpu_env, vect_off);
         break;
     case MO_64:
@@ -1037,8 +1037,8 @@ static void read_vec_element_i32(DisasContext *s, TCG=
v_i32 tcg_dest, int srcidx,
     case MO_SW:
         tcg_gen_ld16s_i32(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_32:
-    case MO_32|MO_SIGN:
+    case MO_UL:
+    case MO_SL:
         tcg_gen_ld_i32(tcg_dest, cpu_env, vect_off);
         break;
     default:
@@ -1058,7 +1058,7 @@ static void write_vec_element(DisasContext *s, TCGv_i=
64 tcg_src, int destidx,
     case MO_UW:
         tcg_gen_st16_i64(tcg_src, cpu_env, vect_off);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_gen_st32_i64(tcg_src, cpu_env, vect_off);
         break;
     case MO_64:
@@ -1080,7 +1080,7 @@ static void write_vec_element_i32(DisasContext *s, TC=
Gv_i32 tcg_src,
     case MO_UW:
         tcg_gen_st16_i32(tcg_src, cpu_env, vect_off);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_gen_st_i32(tcg_src, cpu_env, vect_off);
         break;
     default:
@@ -5299,7 +5299,7 @@ static void handle_fp_compare(DisasContext *s, int si=
ze,
         }

         switch (size) {
-        case MO_32:
+        case MO_UL:
             if (signal_all_nans) {
                 gen_helper_vfp_cmpes_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
             } else {
@@ -5354,7 +5354,7 @@ static void disas_fp_compare(DisasContext *s, uint32_=
t insn)

     switch (type) {
     case 0:
-        size =3D MO_32;
+        size =3D MO_UL;
         break;
     case 1:
         size =3D MO_64;
@@ -5405,7 +5405,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t =
insn)

     switch (type) {
     case 0:
-        size =3D MO_32;
+        size =3D MO_UL;
         break;
     case 1:
         size =3D MO_64;
@@ -5471,7 +5471,7 @@ static void disas_fp_csel(DisasContext *s, uint32_t i=
nsn)

     switch (type) {
     case 0:
-        sz =3D MO_32;
+        sz =3D MO_UL;
         break;
     case 1:
         sz =3D MO_64;
@@ -6276,7 +6276,7 @@ static void disas_fp_imm(DisasContext *s, uint32_t in=
sn)

     switch (type) {
     case 0:
-        sz =3D MO_32;
+        sz =3D MO_UL;
         break;
     case 1:
         sz =3D MO_64;
@@ -6581,7 +6581,7 @@ static void handle_fmov(DisasContext *s, int rd, int =
rn, int type, bool itof)
         switch (type) {
         case 0:
             /* 32 bit */
-            tcg_gen_ld32u_i64(tcg_rd, cpu_env, fp_reg_offset(s, rn, MO_32)=
);
+            tcg_gen_ld32u_i64(tcg_rd, cpu_env, fp_reg_offset(s, rn, MO_UL)=
);
             break;
         case 1:
             /* 64 bit */
@@ -7030,7 +7030,7 @@ static TCGv_i32 do_reduction_op(DisasContext *s, int =
fpopcode, int rn,
 {
     if (esize =3D=3D size) {
         int element;
-        TCGMemOp msize =3D esize =3D=3D 16 ? MO_UW : MO_32;
+        TCGMemOp msize =3D esize =3D=3D 16 ? MO_UW : MO_UL;
         TCGv_i32 tcg_elem;

         /* We should have one register left here */
@@ -7702,7 +7702,7 @@ static void disas_simd_scalar_pairwise(DisasContext *=
s, uint32_t insn)
                 size =3D MO_UW;
             }
         } else {
-            size =3D extract32(size, 0, 1) ? MO_64 : MO_32;
+            size =3D extract32(size, 0, 1) ? MO_64 : MO_UL;
         }

         if (!fp_access_check(s)) {
@@ -8181,7 +8181,7 @@ static void handle_simd_qshl(DisasContext *s, bool sc=
alar, bool is_q,
             }
         };
         NeonGenTwoOpEnvFn *genfn =3D fns[src_unsigned][dst_unsigned][size]=
;
-        TCGMemOp memop =3D scalar ? size : MO_32;
+        TCGMemOp memop =3D scalar ? size : MO_UL;
         int maxpass =3D scalar ? 1 : is_q ? 4 : 2;

         for (pass =3D 0; pass < maxpass; pass++) {
@@ -8204,7 +8204,7 @@ static void handle_simd_qshl(DisasContext *s, bool sc=
alar, bool is_q,
                 }
                 write_fp_sreg(s, rd, tcg_op);
             } else {
-                write_vec_element_i32(s, tcg_op, rd, pass, MO_32);
+                write_vec_element_i32(s, tcg_op, rd, pass, MO_UL);
             }

             tcg_temp_free_i32(tcg_op);
@@ -8264,7 +8264,7 @@ static void handle_simd_intfp_conv(DisasContext *s, i=
nt rd, int rn,
             read_vec_element_i32(s, tcg_int32, rn, pass, mop);

             switch (size) {
-            case MO_32:
+            case MO_UL:
                 if (fracbits) {
                     if (is_signed) {
                         gen_helper_vfp_sltos(tcg_float, tcg_int32,
@@ -8337,7 +8337,7 @@ static void handle_simd_shift_intfp_conv(DisasContext=
 *s, bool is_scalar,
             return;
         }
     } else if (immh & 4) {
-        size =3D MO_32;
+        size =3D MO_UL;
     } else if (immh & 2) {
         size =3D MO_UW;
         if (!dc_isar_feature(aa64_fp16, s)) {
@@ -8382,7 +8382,7 @@ static void handle_simd_shift_fpint_conv(DisasContext=
 *s, bool is_scalar,
             return;
         }
     } else if (immh & 0x4) {
-        size =3D MO_32;
+        size =3D MO_UL;
     } else if (immh & 0x2) {
         size =3D MO_UW;
         if (!dc_isar_feature(aa64_fp16, s)) {
@@ -8436,7 +8436,7 @@ static void handle_simd_shift_fpint_conv(DisasContext=
 *s, bool is_scalar,
                 fn =3D gen_helper_vfp_toshh;
             }
             break;
-        case MO_32:
+        case MO_UL:
             if (is_u) {
                 fn =3D gen_helper_vfp_touls;
             } else {
@@ -8588,8 +8588,8 @@ static void disas_simd_scalar_three_reg_diff(DisasCon=
text *s, uint32_t insn)
         TCGv_i64 tcg_op2 =3D tcg_temp_new_i64();
         TCGv_i64 tcg_res =3D tcg_temp_new_i64();

-        read_vec_element(s, tcg_op1, rn, 0, MO_32 | MO_SIGN);
-        read_vec_element(s, tcg_op2, rm, 0, MO_32 | MO_SIGN);
+        read_vec_element(s, tcg_op1, rn, 0, MO_SL);
+        read_vec_element(s, tcg_op2, rm, 0, MO_SL);

         tcg_gen_mul_i64(tcg_res, tcg_op1, tcg_op2);
         gen_helper_neon_addl_saturate_s64(tcg_res, cpu_env, tcg_res, tcg_r=
es);
@@ -8631,7 +8631,7 @@ static void disas_simd_scalar_three_reg_diff(DisasCon=
text *s, uint32_t insn)
         case 0x9: /* SQDMLAL, SQDMLAL2 */
         {
             TCGv_i64 tcg_op3 =3D tcg_temp_new_i64();
-            read_vec_element(s, tcg_op3, rd, 0, MO_32);
+            read_vec_element(s, tcg_op3, rd, 0, MO_UL);
             gen_helper_neon_addl_saturate_s32(tcg_res, cpu_env,
                                               tcg_res, tcg_op3);
             tcg_temp_free_i64(tcg_op3);
@@ -8831,8 +8831,8 @@ static void handle_3same_float(DisasContext *s, int s=
ize, int elements,
             TCGv_i32 tcg_op2 =3D tcg_temp_new_i32();
             TCGv_i32 tcg_res =3D tcg_temp_new_i32();

-            read_vec_element_i32(s, tcg_op1, rn, pass, MO_32);
-            read_vec_element_i32(s, tcg_op2, rm, pass, MO_32);
+            read_vec_element_i32(s, tcg_op1, rn, pass, MO_UL);
+            read_vec_element_i32(s, tcg_op2, rm, pass, MO_UL);

             switch (fpopcode) {
             case 0x39: /* FMLS */
@@ -8840,7 +8840,7 @@ static void handle_3same_float(DisasContext *s, int s=
ize, int elements,
                 gen_helper_vfp_negs(tcg_op1, tcg_op1);
                 /* fall through */
             case 0x19: /* FMLA */
-                read_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+                read_vec_element_i32(s, tcg_res, rd, pass, MO_UL);
                 gen_helper_vfp_muladds(tcg_res, tcg_op1, tcg_op2,
                                        tcg_res, fpst);
                 break;
@@ -8908,7 +8908,7 @@ static void handle_3same_float(DisasContext *s, int s=
ize, int elements,
                 write_vec_element(s, tcg_tmp, rd, pass, MO_64);
                 tcg_temp_free_i64(tcg_tmp);
             } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+                write_vec_element_i32(s, tcg_res, rd, pass, MO_UL);
             }

             tcg_temp_free_i32(tcg_res);
@@ -9557,7 +9557,7 @@ static void handle_2misc_reciprocal(DisasContext *s, =
int opcode,
         }

         for (pass =3D 0; pass < maxpasses; pass++) {
-            read_vec_element_i32(s, tcg_op, rn, pass, MO_32);
+            read_vec_element_i32(s, tcg_op, rn, pass, MO_UL);

             switch (opcode) {
             case 0x3c: /* URECPE */
@@ -9579,7 +9579,7 @@ static void handle_2misc_reciprocal(DisasContext *s, =
int opcode,
             if (is_scalar) {
                 write_fp_sreg(s, rd, tcg_res);
             } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+                write_vec_element_i32(s, tcg_res, rd, pass, MO_UL);
             }
         }
         tcg_temp_free_i32(tcg_res);
@@ -9693,7 +9693,7 @@ static void handle_2misc_narrow(DisasContext *s, bool=
 scalar,
     }

     for (pass =3D 0; pass < 2; pass++) {
-        write_vec_element_i32(s, tcg_res[pass], rd, destelt + pass, MO_32)=
;
+        write_vec_element_i32(s, tcg_res[pass], rd, destelt + pass, MO_UL)=
;
         tcg_temp_free_i32(tcg_res[pass]);
     }
     clear_vec_high(s, is_q, rd);
@@ -9740,8 +9740,8 @@ static void handle_2misc_satacc(DisasContext *s, bool=
 is_scalar, bool is_u,
                 read_vec_element_i32(s, tcg_rn, rn, pass, size);
                 read_vec_element_i32(s, tcg_rd, rd, pass, size);
             } else {
-                read_vec_element_i32(s, tcg_rn, rn, pass, MO_32);
-                read_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
+                read_vec_element_i32(s, tcg_rn, rn, pass, MO_UL);
+                read_vec_element_i32(s, tcg_rd, rd, pass, MO_UL);
             }

             if (is_u) { /* USQADD */
@@ -9779,7 +9779,7 @@ static void handle_2misc_satacc(DisasContext *s, bool=
 is_scalar, bool is_u,
                 write_vec_element(s, tcg_zero, rd, 0, MO_64);
                 tcg_temp_free_i64(tcg_zero);
             }
-            write_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
+            write_vec_element_i32(s, tcg_rd, rd, pass, MO_UL);
         }
         tcg_temp_free_i32(tcg_rd);
         tcg_temp_free_i32(tcg_rn);
@@ -10347,7 +10347,7 @@ static void handle_3rd_widening(DisasContext *s, in=
t is_q, int is_u, int size,
             TCGv_i64 tcg_op1 =3D tcg_temp_new_i64();
             TCGv_i64 tcg_op2 =3D tcg_temp_new_i64();
             TCGv_i64 tcg_passres;
-            TCGMemOp memop =3D MO_32 | (is_u ? 0 : MO_SIGN);
+            TCGMemOp memop =3D is_u ? MO_UL : MO_SL;

             int elt =3D pass + is_q * 2;

@@ -10426,8 +10426,8 @@ static void handle_3rd_widening(DisasContext *s, in=
t is_q, int is_u, int size,
             TCGv_i64 tcg_passres;
             int elt =3D pass + is_q * 2;

-            read_vec_element_i32(s, tcg_op1, rn, elt, MO_32);
-            read_vec_element_i32(s, tcg_op2, rm, elt, MO_32);
+            read_vec_element_i32(s, tcg_op1, rn, elt, MO_UL);
+            read_vec_element_i32(s, tcg_op2, rm, elt, MO_UL);

             if (accop =3D=3D 0) {
                 tcg_passres =3D tcg_res[pass];
@@ -10547,7 +10547,7 @@ static void handle_3rd_wide(DisasContext *s, int is=
_q, int is_u, int size,
         NeonGenWidenFn *widenfn =3D widenfns[size][is_u];

         read_vec_element(s, tcg_op1, rn, pass, MO_64);
-        read_vec_element_i32(s, tcg_op2, rm, part + pass, MO_32);
+        read_vec_element_i32(s, tcg_op2, rm, part + pass, MO_UL);
         widenfn(tcg_op2_wide, tcg_op2);
         tcg_temp_free_i32(tcg_op2);
         tcg_res[pass] =3D tcg_temp_new_i64();
@@ -10603,7 +10603,7 @@ static void handle_3rd_narrowing(DisasContext *s, i=
nt is_q, int is_u, int size,
     }

     for (pass =3D 0; pass < 2; pass++) {
-        write_vec_element_i32(s, tcg_res[pass], rd, pass + part, MO_32);
+        write_vec_element_i32(s, tcg_res[pass], rd, pass + part, MO_UL);
         tcg_temp_free_i32(tcg_res[pass]);
     }
     clear_vec_high(s, is_q, rd);
@@ -10860,8 +10860,8 @@ static void handle_simd_3same_pair(DisasContext *s,=
 int is_q, int u, int opcode,
             int passreg =3D pass < (maxpass / 2) ? rn : rm;
             int passelt =3D (is_q && (pass & 1)) ? 2 : 0;

-            read_vec_element_i32(s, tcg_op1, passreg, passelt, MO_32);
-            read_vec_element_i32(s, tcg_op2, passreg, passelt + 1, MO_32);
+            read_vec_element_i32(s, tcg_op1, passreg, passelt, MO_UL);
+            read_vec_element_i32(s, tcg_op2, passreg, passelt + 1, MO_UL);
             tcg_res[pass] =3D tcg_temp_new_i32();

             switch (opcode) {
@@ -10925,7 +10925,7 @@ static void handle_simd_3same_pair(DisasContext *s,=
 int is_q, int u, int opcode,
         }

         for (pass =3D 0; pass < maxpass; pass++) {
-            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
+            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_UL);
             tcg_temp_free_i32(tcg_res[pass]);
         }
         clear_vec_high(s, is_q, rd);
@@ -10971,7 +10971,7 @@ static void disas_simd_3same_float(DisasContext *s,=
 uint32_t insn)
             unallocated_encoding(s);
             return;
         }
-        handle_simd_3same_pair(s, is_q, 0, fpopcode, size ? MO_64 : MO_32,
+        handle_simd_3same_pair(s, is_q, 0, fpopcode, size ? MO_64 : MO_UL,
                                rn, rm, rd);
         return;
     case 0x1b: /* FMULX */
@@ -11174,8 +11174,8 @@ static void disas_simd_3same_int(DisasContext *s, u=
int32_t insn)
             NeonGenTwoOpFn *genfn =3D NULL;
             NeonGenTwoOpEnvFn *genenvfn =3D NULL;

-            read_vec_element_i32(s, tcg_op1, rn, pass, MO_32);
-            read_vec_element_i32(s, tcg_op2, rm, pass, MO_32);
+            read_vec_element_i32(s, tcg_op1, rn, pass, MO_UL);
+            read_vec_element_i32(s, tcg_op2, rm, pass, MO_UL);

             switch (opcode) {
             case 0x0: /* SHADD, UHADD */
@@ -11292,11 +11292,11 @@ static void disas_simd_3same_int(DisasContext *s,=
 uint32_t insn)
                     tcg_gen_add_i32,
                 };

-                read_vec_element_i32(s, tcg_op1, rd, pass, MO_32);
+                read_vec_element_i32(s, tcg_op1, rd, pass, MO_UL);
                 fns[size](tcg_res, tcg_op1, tcg_res);
             }

-            write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+            write_vec_element_i32(s, tcg_res, rd, pass, MO_UL);

             tcg_temp_free_i32(tcg_res);
             tcg_temp_free_i32(tcg_op1);
@@ -11578,7 +11578,7 @@ static void disas_simd_three_reg_same_extra(DisasCo=
ntext *s, uint32_t insn)
         break;
     case 0x02: /* SDOT (vector) */
     case 0x12: /* UDOT (vector) */
-        if (size !=3D MO_32) {
+        if (size !=3D MO_UL) {
             unallocated_encoding(s);
             return;
         }
@@ -11709,7 +11709,7 @@ static void handle_2misc_widening(DisasContext *s, =
int opcode, bool is_q,
             TCGv_i32 tcg_op =3D tcg_temp_new_i32();
             tcg_res[pass] =3D tcg_temp_new_i64();

-            read_vec_element_i32(s, tcg_op, rn, srcelt + pass, MO_32);
+            read_vec_element_i32(s, tcg_op, rn, srcelt + pass, MO_UL);
             gen_helper_vfp_fcvtds(tcg_res[pass], tcg_op, cpu_env);
             tcg_temp_free_i32(tcg_op);
         }
@@ -11732,7 +11732,7 @@ static void handle_2misc_widening(DisasContext *s, =
int opcode, bool is_q,
                                            fpst, ahp);
         }
         for (pass =3D 0; pass < 4; pass++) {
-            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_32);
+            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_UL);
             tcg_temp_free_i32(tcg_res[pass]);
         }

@@ -11771,7 +11771,7 @@ static void handle_rev(DisasContext *s, int opcode,=
 bool u,
             case MO_UW:
                 tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
                 break;
-            case MO_32:
+            case MO_UL:
                 tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp);
                 break;
             case MO_64:
@@ -11900,7 +11900,7 @@ static void handle_shll(DisasContext *s, bool is_q,=
 int size, int rn, int rd)
         NeonGenWidenFn *widenfn =3D widenfns[size];
         TCGv_i32 tcg_op =3D tcg_temp_new_i32();

-        read_vec_element_i32(s, tcg_op, rn, part + pass, MO_32);
+        read_vec_element_i32(s, tcg_op, rn, part + pass, MO_UL);
         tcg_res[pass] =3D tcg_temp_new_i64();
         widenfn(tcg_res[pass], tcg_op);
         tcg_gen_shli_i64(tcg_res[pass], tcg_res[pass], 8 << size);
@@ -12251,7 +12251,7 @@ static void disas_simd_two_reg_misc(DisasContext *s=
, uint32_t insn)
             TCGv_i32 tcg_res =3D tcg_temp_new_i32();
             TCGCond cond;

-            read_vec_element_i32(s, tcg_op, rn, pass, MO_32);
+            read_vec_element_i32(s, tcg_op, rn, pass, MO_UL);

             if (size =3D=3D 2) {
                 /* Special cases for 32 bit elements */
@@ -12418,7 +12418,7 @@ static void disas_simd_two_reg_misc(DisasContext *s=
, uint32_t insn)
                 }
             }

-            write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+            write_vec_element_i32(s, tcg_res, rd, pass, MO_UL);

             tcg_temp_free_i32(tcg_res);
             tcg_temp_free_i32(tcg_op);
@@ -12816,7 +12816,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
         break;
     case 0x0e: /* SDOT */
     case 0x1e: /* UDOT */
-        if (is_scalar || size !=3D MO_32 || !dc_isar_feature(aa64_dp, s)) =
{
+        if (is_scalar || size !=3D MO_UL || !dc_isar_feature(aa64_dp, s)) =
{
             unallocated_encoding(s);
             return;
         }
@@ -12835,7 +12835,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
     case 0x04: /* FMLSL */
     case 0x18: /* FMLAL2 */
     case 0x1c: /* FMLSL2 */
-        if (is_scalar || size !=3D MO_32 || !dc_isar_feature(aa64_fhm, s))=
 {
+        if (is_scalar || size !=3D MO_UL || !dc_isar_feature(aa64_fhm, s))=
 {
             unallocated_encoding(s);
             return;
         }
@@ -12855,7 +12855,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
             size =3D MO_UW;
             is_fp16 =3D true;
             break;
-        case MO_32: /* single precision */
+        case MO_UL: /* single precision */
         case MO_64: /* double precision */
             break;
         default:
@@ -12868,7 +12868,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
         /* Each indexable element is a complex pair.  */
         size +=3D 1;
         switch (size) {
-        case MO_32:
+        case MO_UL:
             if (h && !is_q) {
                 unallocated_encoding(s);
                 return;
@@ -12902,7 +12902,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
     case MO_UW:
         index =3D h << 2 | l << 1 | m;
         break;
-    case MO_32:
+    case MO_UL:
         index =3D h << 1 | l;
         rm |=3D m << 4;
         break;
@@ -13038,7 +13038,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
             TCGv_i32 tcg_op =3D tcg_temp_new_i32();
             TCGv_i32 tcg_res =3D tcg_temp_new_i32();

-            read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : M=
O_32);
+            read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : M=
O_UL);

             switch (16 * u + opcode) {
             case 0x08: /* MUL */
@@ -13060,7 +13060,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
                 if (opcode =3D=3D 0x8) {
                     break;
                 }
-                read_vec_element_i32(s, tcg_op, rd, pass, MO_32);
+                read_vec_element_i32(s, tcg_op, rd, pass, MO_UL);
                 genfn =3D fns[size - 1][is_sub];
                 genfn(tcg_res, tcg_op, tcg_res);
                 break;
@@ -13068,7 +13068,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
             case 0x05: /* FMLS */
             case 0x01: /* FMLA */
                 read_vec_element_i32(s, tcg_res, rd, pass,
-                                     is_scalar ? size : MO_32);
+                                     is_scalar ? size : MO_UL);
                 switch (size) {
                 case 1:
                     if (opcode =3D=3D 0x5) {
@@ -13153,7 +13153,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
                 break;
             case 0x1d: /* SQRDMLAH */
                 read_vec_element_i32(s, tcg_res, rd, pass,
-                                     is_scalar ? size : MO_32);
+                                     is_scalar ? size : MO_UL);
                 if (size =3D=3D 1) {
                     gen_helper_neon_qrdmlah_s16(tcg_res, cpu_env,
                                                 tcg_op, tcg_idx, tcg_res);
@@ -13164,7 +13164,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
                 break;
             case 0x1f: /* SQRDMLSH */
                 read_vec_element_i32(s, tcg_res, rd, pass,
-                                     is_scalar ? size : MO_32);
+                                     is_scalar ? size : MO_UL);
                 if (size =3D=3D 1) {
                     gen_helper_neon_qrdmlsh_s16(tcg_res, cpu_env,
                                                 tcg_op, tcg_idx, tcg_res);
@@ -13180,7 +13180,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
             if (is_scalar) {
                 write_fp_sreg(s, rd, tcg_res);
             } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+                write_vec_element_i32(s, tcg_res, rd, pass, MO_UL);
             }

             tcg_temp_free_i32(tcg_op);
@@ -13194,7 +13194,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
         TCGv_i64 tcg_res[2];
         int pass;
         bool satop =3D extract32(opcode, 0, 1);
-        TCGMemOp memop =3D MO_32;
+        TCGMemOp memop =3D MO_UL;

         if (satop || !u) {
             memop |=3D MO_SIGN;
@@ -13288,7 +13288,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
                     read_vec_element_i32(s, tcg_op, rn, pass, size);
                 } else {
                     read_vec_element_i32(s, tcg_op, rn,
-                                         pass + (is_q * 2), MO_32);
+                                         pass + (is_q * 2), MO_UL);
                 }

                 tcg_res[pass] =3D tcg_temp_new_i64();
@@ -13780,19 +13780,19 @@ static void disas_crypto_four_reg(DisasContext *s=
, uint32_t insn)
         tcg_res =3D tcg_temp_new_i32();
         tcg_zero =3D tcg_const_i32(0);

-        read_vec_element_i32(s, tcg_op1, rn, 3, MO_32);
-        read_vec_element_i32(s, tcg_op2, rm, 3, MO_32);
-        read_vec_element_i32(s, tcg_op3, ra, 3, MO_32);
+        read_vec_element_i32(s, tcg_op1, rn, 3, MO_UL);
+        read_vec_element_i32(s, tcg_op2, rm, 3, MO_UL);
+        read_vec_element_i32(s, tcg_op3, ra, 3, MO_UL);

         tcg_gen_rotri_i32(tcg_res, tcg_op1, 20);
         tcg_gen_add_i32(tcg_res, tcg_res, tcg_op2);
         tcg_gen_add_i32(tcg_res, tcg_res, tcg_op3);
         tcg_gen_rotri_i32(tcg_res, tcg_res, 25);

-        write_vec_element_i32(s, tcg_zero, rd, 0, MO_32);
-        write_vec_element_i32(s, tcg_zero, rd, 1, MO_32);
-        write_vec_element_i32(s, tcg_zero, rd, 2, MO_32);
-        write_vec_element_i32(s, tcg_res, rd, 3, MO_32);
+        write_vec_element_i32(s, tcg_zero, rd, 0, MO_UL);
+        write_vec_element_i32(s, tcg_zero, rd, 1, MO_UL);
+        write_vec_element_i32(s, tcg_zero, rd, 2, MO_UL);
+        write_vec_element_i32(s, tcg_res, rd, 3, MO_UL);

         tcg_temp_free_i32(tcg_op1);
         tcg_temp_free_i32(tcg_op2);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2bc1bd1..f7c891d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1693,7 +1693,7 @@ static void do_sat_addsub_vec(DisasContext *s, int es=
z, int rd, int rn,
         tcg_temp_free_i32(t32);
         break;

-    case MO_32:
+    case MO_UL:
         t64 =3D tcg_temp_new_i64();
         if (d) {
             tcg_gen_neg_i64(t64, val);
@@ -3320,7 +3320,7 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_e=
sz *a)
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_sve_subri_s,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32,
+          .vece =3D MO_UL,
           .scalar_first =3D true },
         { .fni8 =3D tcg_gen_sub_i64,
           .fniv =3D tcg_gen_sub_vec,
@@ -5258,7 +5258,7 @@ static bool trans_LD1_zprz(DisasContext *s, arg_LD1_z=
prz *a)
     }

     switch (a->esz) {
-    case MO_32:
+    case MO_UL:
         fn =3D gather_load_fn32[be][a->ff][a->xs][a->u][a->msz];
         break;
     case MO_64:
@@ -5286,7 +5286,7 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_z=
piz *a)
     }

     switch (a->esz) {
-    case MO_32:
+    case MO_UL:
         fn =3D gather_load_fn32[be][a->ff][0][a->u][a->msz];
         break;
     case MO_64:
@@ -5364,7 +5364,7 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_z=
prz *a)
         return true;
     }
     switch (a->esz) {
-    case MO_32:
+    case MO_UL:
         fn =3D scatter_store_fn32[be][a->xs][a->msz];
         break;
     case MO_64:
@@ -5392,7 +5392,7 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_z=
piz *a)
     }

     switch (a->esz) {
-    case MO_32:
+    case MO_UL:
         fn =3D scatter_store_fn32[be][0][a->msz];
         break;
     case MO_64:
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.=
c
index 549874c..5e0cd63 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -46,7 +46,7 @@ uint64_t vfp_expand_imm(int size, uint8_t imm8)
             extract32(imm8, 0, 6);
         imm <<=3D 48;
         break;
-    case MO_32:
+    case MO_UL:
         imm =3D (extract32(imm8, 7, 1) ? 0x8000 : 0) |
             (extract32(imm8, 6, 1) ? 0x3e00 : 0x4000) |
             (extract32(imm8, 0, 6) << 3);
@@ -1901,7 +1901,7 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VM=
OV_imm_sp *a)
         }
     }

-    fd =3D tcg_const_i32(vfp_expand_imm(MO_32, a->imm));
+    fd =3D tcg_const_i32(vfp_expand_imm(MO_UL, a->imm));

     for (;;) {
         neon_store_reg32(fd, vd);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8d10922..5510ecd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1085,7 +1085,7 @@ static inline TCGv gen_aa32_addr(DisasContext *s, TCG=
v_i32 a32, TCGMemOp op)
     tcg_gen_extu_i32_tl(addr, a32);

     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b && (op & MO_SIZE) < MO_32) {
+    if (!IS_USER_ONLY && s->sctlr_b && (op & MO_SIZE) < MO_UL) {
         tcg_gen_xori_tl(addr, addr, 4 - (1 << (op & MO_SIZE)));
     }
     return addr;
@@ -1480,7 +1480,7 @@ static void neon_store_element(int reg, int ele, TCGM=
emOp size, TCGv_i32 var)
     case MO_UW:
         tcg_gen_st16_i32(var, cpu_env, offset);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_gen_st_i32(var, cpu_env, offset);
         break;
     default:
@@ -1499,7 +1499,7 @@ static void neon_store_element64(int reg, int ele, TC=
GMemOp size, TCGv_i64 var)
     case MO_UW:
         tcg_gen_st16_i64(var, cpu_env, offset);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_gen_st32_i64(var, cpu_env, offset);
         break;
     case MO_64:
@@ -4272,7 +4272,7 @@ const GVecGen2i ssra_op[4] =3D {
       .fniv =3D gen_ssra_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_ssra,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fni8 =3D gen_ssra64_i64,
       .fniv =3D gen_ssra_vec,
       .prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D 64,
@@ -4330,7 +4330,7 @@ const GVecGen2i usra_op[4] =3D {
       .fniv =3D gen_usra_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_usra,
-      .vece =3D MO_32, },
+      .vece =3D MO_UL, },
     { .fni8 =3D gen_usra64_i64,
       .fniv =3D gen_usra_vec,
       .prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D 64,
@@ -4410,7 +4410,7 @@ const GVecGen2i sri_op[4] =3D {
       .fniv =3D gen_shr_ins_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_sri,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fni8 =3D gen_shr64_ins_i64,
       .fniv =3D gen_shr_ins_vec,
       .prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D 64,
@@ -4488,7 +4488,7 @@ const GVecGen2i sli_op[4] =3D {
       .fniv =3D gen_shl_ins_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_sli,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fni8 =3D gen_shl64_ins_i64,
       .fniv =3D gen_shl_ins_vec,
       .prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D 64,
@@ -4584,7 +4584,7 @@ const GVecGen3 mla_op[4] =3D {
       .fniv =3D gen_mla_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_mla,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fni8 =3D gen_mla64_i64,
       .fniv =3D gen_mla_vec,
       .prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D 64,
@@ -4608,7 +4608,7 @@ const GVecGen3 mls_op[4] =3D {
       .fniv =3D gen_mls_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_mls,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fni8 =3D gen_mls64_i64,
       .fniv =3D gen_mls_vec,
       .prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D 64,
@@ -4653,7 +4653,7 @@ const GVecGen3 cmtst_op[4] =3D {
     { .fni4 =3D gen_cmtst_i32,
       .fniv =3D gen_cmtst_vec,
       .opt_opc =3D vecop_list_cmtst,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fni8 =3D gen_cmtst_i64,
       .fniv =3D gen_cmtst_vec,
       .prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D 64,
@@ -4691,7 +4691,7 @@ const GVecGen4 uqadd_op[4] =3D {
       .fno =3D gen_helper_gvec_uqadd_s,
       .write_aofs =3D true,
       .opt_opc =3D vecop_list_uqadd,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fniv =3D gen_uqadd_vec,
       .fno =3D gen_helper_gvec_uqadd_d,
       .write_aofs =3D true,
@@ -4729,7 +4729,7 @@ const GVecGen4 sqadd_op[4] =3D {
       .fno =3D gen_helper_gvec_sqadd_s,
       .opt_opc =3D vecop_list_sqadd,
       .write_aofs =3D true,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fniv =3D gen_sqadd_vec,
       .fno =3D gen_helper_gvec_sqadd_d,
       .opt_opc =3D vecop_list_sqadd,
@@ -4767,7 +4767,7 @@ const GVecGen4 uqsub_op[4] =3D {
       .fno =3D gen_helper_gvec_uqsub_s,
       .opt_opc =3D vecop_list_uqsub,
       .write_aofs =3D true,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fniv =3D gen_uqsub_vec,
       .fno =3D gen_helper_gvec_uqsub_d,
       .opt_opc =3D vecop_list_uqsub,
@@ -4805,7 +4805,7 @@ const GVecGen4 sqsub_op[4] =3D {
       .fno =3D gen_helper_gvec_sqsub_s,
       .opt_opc =3D vecop_list_sqsub,
       .write_aofs =3D true,
-      .vece =3D MO_32 },
+      .vece =3D MO_UL },
     { .fniv =3D gen_sqsub_vec,
       .fno =3D gen_helper_gvec_sqsub_d,
       .opt_opc =3D vecop_list_sqsub,
@@ -5798,10 +5798,10 @@ static int disas_neon_data_insn(DisasContext *s, ui=
nt32_t insn)
                     /* The immediate value has already been inverted,
                      * so BIC becomes AND.
                      */
-                    tcg_gen_gvec_andi(MO_32, reg_ofs, reg_ofs, imm,
+                    tcg_gen_gvec_andi(MO_UL, reg_ofs, reg_ofs, imm,
                                       vec_size, vec_size);
                 } else {
-                    tcg_gen_gvec_ori(MO_32, reg_ofs, reg_ofs, imm,
+                    tcg_gen_gvec_ori(MO_UL, reg_ofs, reg_ofs, imm,
                                      vec_size, vec_size);
                 }
             } else {
@@ -6879,7 +6879,7 @@ static int disas_neon_data_insn(DisasContext *s, uint=
32_t insn)
                     size =3D MO_UW;
                     element =3D (insn >> 18) & 3;
                 } else {
-                    size =3D MO_32;
+                    size =3D MO_UL;
                     element =3D (insn >> 19) & 1;
                 }
                 tcg_gen_gvec_dup_mem(size, neon_reg_offset(rd, 0),
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 0535bae..0e863d4 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -332,16 +332,16 @@ static inline TCGMemOp mo_pushpop(DisasContext *s, TC=
GMemOp ot)
 /* Select the size of the stack pointer.  */
 static inline TCGMemOp mo_stacksize(DisasContext *s)
 {
-    return CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_UW;
+    return CODE64(s) ? MO_64 : s->ss32 ? MO_UL : MO_UW;
 }

 /* Select only size 64 else 32.  Used for SSE operand sizes.  */
 static inline TCGMemOp mo_64_32(TCGMemOp ot)
 {
 #ifdef TARGET_X86_64
-    return ot =3D=3D MO_64 ? MO_64 : MO_32;
+    return ot =3D=3D MO_64 ? MO_64 : MO_UL;
 #else
-    return MO_32;
+    return MO_UL;
 #endif
 }

@@ -356,7 +356,7 @@ static inline TCGMemOp mo_b_d(int b, TCGMemOp ot)
    Used for decoding operand size of port opcodes.  */
 static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)
 {
-    return b & 1 ? (ot =3D=3D MO_UW ? MO_UW : MO_32) : MO_UB;
+    return b & 1 ? (ot =3D=3D MO_UW ? MO_UW : MO_UL) : MO_UB;
 }

 static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int reg, TCGv t=
0)
@@ -372,7 +372,7 @@ static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp =
ot, int reg, TCGv t0)
     case MO_UW:
         tcg_gen_deposit_tl(cpu_regs[reg], cpu_regs[reg], t0, 0, 16);
         break;
-    case MO_32:
+    case MO_UL:
         /* For x86_64, this sets the higher half of register to zero.
            For i386, this is equivalent to a mov. */
         tcg_gen_ext32u_tl(cpu_regs[reg], t0);
@@ -463,7 +463,7 @@ static void gen_lea_v_seg(DisasContext *s, TCGMemOp afl=
ag, TCGv a0,
         }
         break;
 #endif
-    case MO_32:
+    case MO_UL:
         /* 32 bit address */
         if (ovr_seg < 0 && s->addseg) {
             ovr_seg =3D def_seg;
@@ -538,7 +538,7 @@ static TCGv gen_ext_tl(TCGv dst, TCGv src, TCGMemOp siz=
e, bool sign)
         }
         return dst;
 #ifdef TARGET_X86_64
-    case MO_32:
+    case MO_UL:
         if (sign) {
             tcg_gen_ext32s_tl(dst, src);
         } else {
@@ -586,7 +586,7 @@ static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCG=
v_i32 n)
     case MO_UW:
         gen_helper_inw(v, cpu_env, n);
         break;
-    case MO_32:
+    case MO_UL:
         gen_helper_inl(v, cpu_env, n);
         break;
     default:
@@ -603,7 +603,7 @@ static void gen_helper_out_func(TCGMemOp ot, TCGv_i32 v=
, TCGv_i32 n)
     case MO_UW:
         gen_helper_outw(cpu_env, v, n);
         break;
-    case MO_32:
+    case MO_UL:
         gen_helper_outl(cpu_env, v, n);
         break;
     default:
@@ -625,7 +625,7 @@ static void gen_check_io(DisasContext *s, TCGMemOp ot, =
target_ulong cur_eip,
         case MO_UW:
             gen_helper_check_iow(cpu_env, s->tmp2_i32);
             break;
-        case MO_32:
+        case MO_UL:
             gen_helper_check_iol(cpu_env, s->tmp2_i32);
             break;
         default:
@@ -1077,7 +1077,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s, t=
arget_ulong next_eip)

 static inline void gen_stos(DisasContext *s, TCGMemOp ot)
 {
-    gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
+    gen_op_mov_v_reg(s, MO_UL, s->T0, R_EAX);
     gen_string_movl_A0_EDI(s);
     gen_op_st_v(s, ot, s->T0, s->A0);
     gen_op_movl_T0_Dshift(s, ot);
@@ -1568,7 +1568,7 @@ static void gen_rot_rm_T1(DisasContext *s, TCGMemOp o=
t, int op1, int is_right)
         goto do_long;
     do_long:
 #ifdef TARGET_X86_64
-    case MO_32:
+    case MO_UL:
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         if (is_right) {
@@ -1644,7 +1644,7 @@ static void gen_rot_rm_im(DisasContext *s, TCGMemOp o=
t, int op1, int op2,
     if (op2 !=3D 0) {
         switch (ot) {
 #ifdef TARGET_X86_64
-        case MO_32:
+        case MO_UL:
             tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
             if (is_right) {
                 tcg_gen_rotri_i32(s->tmp2_i32, s->tmp2_i32, op2);
@@ -1725,7 +1725,7 @@ static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp =
ot, int op1,
         case MO_UW:
             gen_helper_rcrw(s->T0, cpu_env, s->T0, s->T1);
             break;
-        case MO_32:
+        case MO_UL:
             gen_helper_rcrl(s->T0, cpu_env, s->T0, s->T1);
             break;
 #ifdef TARGET_X86_64
@@ -1744,7 +1744,7 @@ static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp =
ot, int op1,
         case MO_UW:
             gen_helper_rclw(s->T0, cpu_env, s->T0, s->T1);
             break;
-        case MO_32:
+        case MO_UL:
             gen_helper_rcll(s->T0, cpu_env, s->T0, s->T1);
             break;
 #ifdef TARGET_X86_64
@@ -1791,7 +1791,7 @@ static void gen_shiftd_rm_T1(DisasContext *s, TCGMemO=
p ot, int op1,
         }
         /* FALLTHRU */
 #ifdef TARGET_X86_64
-    case MO_32:
+    case MO_UL:
         /* Concatenate the two 32-bit values and use a 64-bit shift.  */
         tcg_gen_subi_tl(s->tmp0, count, 1);
         if (is_right) {
@@ -1984,7 +1984,7 @@ static AddressParts gen_lea_modrm_0(CPUX86State *env,=
 DisasContext *s,

     switch (s->aflag) {
     case MO_64:
-    case MO_32:
+    case MO_UL:
         havesib =3D 0;
         if (rm =3D=3D 4) {
             int code =3D x86_ldub_code(env, s);
@@ -2190,7 +2190,7 @@ static inline uint32_t insn_get(CPUX86State *env, Dis=
asContext *s, TCGMemOp ot)
     case MO_UW:
         ret =3D x86_lduw_code(env, s);
         break;
-    case MO_32:
+    case MO_UL:
 #ifdef TARGET_X86_64
     case MO_64:
 #endif
@@ -2204,7 +2204,7 @@ static inline uint32_t insn_get(CPUX86State *env, Dis=
asContext *s, TCGMemOp ot)

 static inline int insn_const_size(TCGMemOp ot)
 {
-    if (ot <=3D MO_32) {
+    if (ot <=3D MO_UL) {
         return 1 << ot;
     } else {
         return 4;
@@ -2400,12 +2400,12 @@ static inline void gen_pop_update(DisasContext *s, =
TCGMemOp ot)

 static inline void gen_stack_A0(DisasContext *s)
 {
-    gen_lea_v_seg(s, s->ss32 ? MO_32 : MO_UW, cpu_regs[R_ESP], R_SS, -1);
+    gen_lea_v_seg(s, s->ss32 ? MO_UL : MO_UW, cpu_regs[R_ESP], R_SS, -1);
 }

 static void gen_pusha(DisasContext *s)
 {
-    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_UW;
+    TCGMemOp s_ot =3D s->ss32 ? MO_UL : MO_UW;
     TCGMemOp d_ot =3D s->dflag;
     int size =3D 1 << d_ot;
     int i;
@@ -2421,7 +2421,7 @@ static void gen_pusha(DisasContext *s)

 static void gen_popa(DisasContext *s)
 {
-    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_UW;
+    TCGMemOp s_ot =3D s->ss32 ? MO_UL : MO_UW;
     TCGMemOp d_ot =3D s->dflag;
     int size =3D 1 << d_ot;
     int i;
@@ -2443,7 +2443,7 @@ static void gen_popa(DisasContext *s)
 static void gen_enter(DisasContext *s, int esp_addend, int level)
 {
     TCGMemOp d_ot =3D mo_pushpop(s, s->dflag);
-    TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_UW;
+    TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s->ss32 ? MO_UL : MO_UW;
     int size =3D 1 << d_ot;

     /* Push BP; compute FrameTemp into T1.  */
@@ -3145,7 +3145,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
             } else {
                 tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State,
                     xmm_regs[reg].ZMM_L(0)));
-                gen_op_st_v(s, MO_32, s->T0, s->A0);
+                gen_op_st_v(s, MO_UL, s->T0, s->A0);
             }
             break;
         case 0x6e: /* movd mm, ea */
@@ -3157,7 +3157,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
             } else
 #endif
             {
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
+                gen_ldst_modrm(env, s, modrm, MO_UL, OR_TMP0, 0);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env,
                                  offsetof(CPUX86State,fpregs[reg].mmx));
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
@@ -3174,7 +3174,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
             } else
 #endif
             {
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 0);
+                gen_ldst_modrm(env, s, modrm, MO_UL, OR_TMP0, 0);
                 tcg_gen_addi_ptr(s->ptr0, cpu_env,
                                  offsetof(CPUX86State,xmm_regs[reg]));
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
@@ -3211,7 +3211,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
         case 0x210: /* movss xmm, ea */
             if (mod !=3D 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_op_ld_v(s, MO_32, s->T0, s->A0);
+                gen_op_ld_v(s, MO_UL, s->T0, s->A0);
                 tcg_gen_st32_tl(s->T0, cpu_env,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(=
0)));
                 tcg_gen_movi_tl(s->T0, 0);
@@ -3346,7 +3346,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
             {
                 tcg_gen_ld32u_tl(s->T0, cpu_env,
                                  offsetof(CPUX86State,fpregs[reg].mmx.MMX_=
L(0)));
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
+                gen_ldst_modrm(env, s, modrm, MO_UL, OR_TMP0, 1);
             }
             break;
         case 0x17e: /* movd ea, xmm */
@@ -3360,7 +3360,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
             {
                 tcg_gen_ld32u_tl(s->T0, cpu_env,
                                  offsetof(CPUX86State,xmm_regs[reg].ZMM_L(=
0)));
-                gen_ldst_modrm(env, s, modrm, MO_32, OR_TMP0, 1);
+                gen_ldst_modrm(env, s, modrm, MO_UL, OR_TMP0, 1);
             }
             break;
         case 0x27e: /* movq xmm, ea */
@@ -3405,7 +3405,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_ld32u_tl(s->T0, cpu_env,
                                  offsetof(CPUX86State, xmm_regs[reg].ZMM_L=
(0)));
-                gen_op_st_v(s, MO_32, s->T0, s->A0);
+                gen_op_st_v(s, MO_UL, s->T0, s->A0);
             } else {
                 rm =3D (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)=
),
@@ -3530,7 +3530,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 0);
             op1_offset =3D offsetof(CPUX86State,xmm_regs[reg]);
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-            if (ot =3D=3D MO_32) {
+            if (ot =3D=3D MO_UL) {
                 SSEFunc_0_epi sse_fn_epi =3D sse_op_table3ai[(b >> 8) & 1]=
;
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 sse_fn_epi(cpu_env, s->ptr0, s->tmp2_i32);
@@ -3584,7 +3584,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                 if ((b >> 8) & 1) {
                     gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_Q(0=
)));
                 } else {
-                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
+                    gen_op_ld_v(s, MO_UL, s->T0, s->A0);
                     tcg_gen_st32_tl(s->T0, cpu_env,
                                     offsetof(CPUX86State, xmm_t0.ZMM_L(0))=
);
                 }
@@ -3594,7 +3594,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                 op2_offset =3D offsetof(CPUX86State,xmm_regs[rm]);
             }
             tcg_gen_addi_ptr(s->ptr0, cpu_env, op2_offset);
-            if (ot =3D=3D MO_32) {
+            if (ot =3D=3D MO_UL) {
                 SSEFunc_i_ep sse_fn_i_ep =3D
                     sse_op_table3bi[((b >> 7) & 2) | (b & 1)];
                 sse_fn_i_ep(s->tmp2_i32, cpu_env, s->ptr0);
@@ -3786,7 +3786,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                 if ((b & 0xff) =3D=3D 0xf0) {
                     ot =3D MO_UB;
                 } else if (s->dflag !=3D MO_64) {
-                    ot =3D (s->prefix & PREFIX_DATA ? MO_UW : MO_32);
+                    ot =3D (s->prefix & PREFIX_DATA ? MO_UW : MO_UL);
                 } else {
                     ot =3D MO_64;
                 }
@@ -3815,7 +3815,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                     goto illegal_op;
                 }
                 if (s->dflag !=3D MO_64) {
-                    ot =3D (s->prefix & PREFIX_DATA ? MO_UW : MO_32);
+                    ot =3D (s->prefix & PREFIX_DATA ? MO_UW : MO_UL);
                 } else {
                     ot =3D MO_64;
                 }
@@ -4026,7 +4026,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,

                     switch (ot) {
 #ifdef TARGET_X86_64
-                    case MO_32:
+                    case MO_UL:
                         /* If we know TL is 64-bit, and we want a 32-bit
                            result, just do everything in 64-bit arithmetic=
.  */
                         tcg_gen_ext32u_i64(cpu_regs[reg], cpu_regs[reg]);
@@ -4172,7 +4172,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                     }
                     break;
                 case 0x16:
-                    if (ot =3D=3D MO_32) { /* pextrd */
+                    if (ot =3D=3D MO_UL) { /* pextrd */
                         tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
                                         offsetof(CPUX86State,
                                                 xmm_regs[reg].ZMM_L(val & =
3)));
@@ -4210,7 +4210,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                     break;
                 case 0x20: /* pinsrb */
                     if (mod =3D=3D 3) {
-                        gen_op_mov_v_reg(s, MO_32, s->T0, rm);
+                        gen_op_mov_v_reg(s, MO_UL, s->T0, rm);
                     } else {
                         tcg_gen_qemu_ld_tl(s->T0, s->A0,
                                            s->mem_index, MO_UB);
@@ -4248,7 +4248,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                                                 xmm_regs[reg].ZMM_L(3)));
                     break;
                 case 0x22:
-                    if (ot =3D=3D MO_32) { /* pinsrd */
+                    if (ot =3D=3D MO_UL) { /* pinsrd */
                         if (mod =3D=3D 3) {
                             tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[rm]=
);
                         } else {
@@ -4393,7 +4393,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                 switch (sz) {
                 case 2:
                     /* 32 bit access */
-                    gen_op_ld_v(s, MO_32, s->T0, s->A0);
+                    gen_op_ld_v(s, MO_UL, s->T0, s->A0);
                     tcg_gen_st32_tl(s->T0, cpu_env,
                                     offsetof(CPUX86State,xmm_t0.ZMM_L(0)))=
;
                     break;
@@ -4630,19 +4630,19 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
         /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
            data with rex_w, and 16-bit data with 0x66; rex_w takes precede=
nce
            over 0x66 if both are present.  */
-        dflag =3D (rex_w > 0 ? MO_64 : prefixes & PREFIX_DATA ? MO_UW : MO=
_32);
+        dflag =3D (rex_w > 0 ? MO_64 : prefixes & PREFIX_DATA ? MO_UW : MO=
_UL);
         /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
-        aflag =3D (prefixes & PREFIX_ADR ? MO_32 : MO_64);
+        aflag =3D (prefixes & PREFIX_ADR ? MO_UL : MO_64);
     } else {
         /* In 16/32-bit mode, 0x66 selects the opposite data size.  */
         if (s->code32 ^ ((prefixes & PREFIX_DATA) !=3D 0)) {
-            dflag =3D MO_32;
+            dflag =3D MO_UL;
         } else {
             dflag =3D MO_UW;
         }
         /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
         if (s->code32 ^ ((prefixes & PREFIX_ADR) !=3D 0)) {
-            aflag =3D MO_32;
+            aflag =3D MO_UL;
         }  else {
             aflag =3D MO_UW;
         }
@@ -4891,7 +4891,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 set_cc_op(s, CC_OP_MULW);
                 break;
             default:
-            case MO_32:
+            case MO_UL:
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EAX]);
                 tcg_gen_mulu2_i32(s->tmp2_i32, s->tmp3_i32,
@@ -4942,7 +4942,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 set_cc_op(s, CC_OP_MULW);
                 break;
             default:
-            case MO_32:
+            case MO_UL:
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 tcg_gen_trunc_tl_i32(s->tmp3_i32, cpu_regs[R_EAX]);
                 tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
@@ -4976,7 +4976,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 gen_helper_divw_AX(cpu_env, s->T0);
                 break;
             default:
-            case MO_32:
+            case MO_UL:
                 gen_helper_divl_EAX(cpu_env, s->T0);
                 break;
 #ifdef TARGET_X86_64
@@ -4995,7 +4995,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 gen_helper_idivw_AX(cpu_env, s->T0);
                 break;
             default:
-            case MO_32:
+            case MO_UL:
                 gen_helper_idivl_EAX(cpu_env, s->T0);
                 break;
 #ifdef TARGET_X86_64
@@ -5026,7 +5026,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 /* operand size for jumps is 64 bit */
                 ot =3D MO_64;
             } else if (op =3D=3D 3 || op =3D=3D 5) {
-                ot =3D dflag !=3D MO_UW ? MO_32 + (rex_w =3D=3D 1) : MO_UW=
;
+                ot =3D dflag !=3D MO_UW ? MO_UL + (rex_w =3D=3D 1) : MO_UW=
;
             } else if (op =3D=3D 6) {
                 /* default push size is 64 bit */
                 ot =3D mo_pushpop(s, dflag);
@@ -5146,15 +5146,15 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
         switch (dflag) {
 #ifdef TARGET_X86_64
         case MO_64:
-            gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
+            gen_op_mov_v_reg(s, MO_UL, s->T0, R_EAX);
             tcg_gen_ext32s_tl(s->T0, s->T0);
             gen_op_mov_reg_v(s, MO_64, R_EAX, s->T0);
             break;
 #endif
-        case MO_32:
+        case MO_UL:
             gen_op_mov_v_reg(s, MO_UW, s->T0, R_EAX);
             tcg_gen_ext16s_tl(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_32, R_EAX, s->T0);
+            gen_op_mov_reg_v(s, MO_UL, R_EAX, s->T0);
             break;
         case MO_UW:
             gen_op_mov_v_reg(s, MO_UB, s->T0, R_EAX);
@@ -5174,11 +5174,11 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             gen_op_mov_reg_v(s, MO_64, R_EDX, s->T0);
             break;
 #endif
-        case MO_32:
-            gen_op_mov_v_reg(s, MO_32, s->T0, R_EAX);
+        case MO_UL:
+            gen_op_mov_v_reg(s, MO_UL, s->T0, R_EAX);
             tcg_gen_ext32s_tl(s->T0, s->T0);
             tcg_gen_sari_tl(s->T0, s->T0, 31);
-            gen_op_mov_reg_v(s, MO_32, R_EDX, s->T0);
+            gen_op_mov_reg_v(s, MO_UL, R_EDX, s->T0);
             break;
         case MO_UW:
             gen_op_mov_v_reg(s, MO_UW, s->T0, R_EAX);
@@ -5219,7 +5219,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             tcg_gen_sub_tl(cpu_cc_src, cpu_cc_src, s->T1);
             break;
 #endif
-        case MO_32:
+        case MO_UL:
             tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
             tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
             tcg_gen_muls2_i32(s->tmp2_i32, s->tmp3_i32,
@@ -5394,7 +5394,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         /**************************/
         /* push/pop */
     case 0x50 ... 0x57: /* push */
-        gen_op_mov_v_reg(s, MO_32, s->T0, (b & 7) | REX_B(s));
+        gen_op_mov_v_reg(s, MO_UL, s->T0, (b & 7) | REX_B(s));
         gen_push_v(s, s->T0);
         break;
     case 0x58 ... 0x5f: /* pop */
@@ -5734,7 +5734,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     case 0x1b5: /* lgs Gv */
         op =3D R_GS;
     do_lxx:
-        ot =3D dflag !=3D MO_UW ? MO_32 : MO_UW;
+        ot =3D dflag !=3D MO_UW ? MO_UL : MO_UW;
         modrm =3D x86_ldub_code(env, s);
         reg =3D ((modrm >> 3) & 7) | rex_r;
         mod =3D (modrm >> 6) & 3;
@@ -6576,7 +6576,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     case 0xe8: /* call im */
         {
             if (dflag !=3D MO_UW) {
-                tval =3D (int32_t)insn_get(env, s, MO_32);
+                tval =3D (int32_t)insn_get(env, s, MO_UL);
             } else {
                 tval =3D (int16_t)insn_get(env, s, MO_UW);
             }
@@ -6609,7 +6609,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         goto do_lcall;
     case 0xe9: /* jmp im */
         if (dflag !=3D MO_UW) {
-            tval =3D (int32_t)insn_get(env, s, MO_32);
+            tval =3D (int32_t)insn_get(env, s, MO_UL);
         } else {
             tval =3D (int16_t)insn_get(env, s, MO_UW);
         }
@@ -6649,7 +6649,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         goto do_jcc;
     case 0x180 ... 0x18f: /* jcc Jv */
         if (dflag !=3D MO_UW) {
-            tval =3D (int32_t)insn_get(env, s, MO_32);
+            tval =3D (int32_t)insn_get(env, s, MO_UL);
         } else {
             tval =3D (int16_t)insn_get(env, s, MO_UW);
         }
@@ -6827,7 +6827,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         reg =3D ((modrm >> 3) & 7) | rex_r;
         mod =3D (modrm >> 6) & 3;
         rm =3D (modrm & 7) | REX_B(s);
-        gen_op_mov_v_reg(s, MO_32, s->T1, reg);
+        gen_op_mov_v_reg(s, MO_UL, s->T1, reg);
         if (mod !=3D 3) {
             AddressParts a =3D gen_lea_modrm_0(env, s, modrm);
             /* specific case: we need to add a displacement */
@@ -7126,10 +7126,10 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
         } else
 #endif
         {
-            gen_op_mov_v_reg(s, MO_32, s->T0, reg);
+            gen_op_mov_v_reg(s, MO_UL, s->T0, reg);
             tcg_gen_ext32u_tl(s->T0, s->T0);
             tcg_gen_bswap32_tl(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_32, reg, s->T0);
+            gen_op_mov_reg_v(s, MO_UL, reg, s->T0);
         }
         break;
     case 0xd6: /* salc */
@@ -7359,7 +7359,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
-            gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            gen_op_st_v(s, CODE64(s) + MO_UL, s->T0, s->A0);
             break;

         case 0xc8: /* monitor */
@@ -7414,7 +7414,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
-            gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            gen_op_st_v(s, CODE64(s) + MO_UL, s->T0, s->A0);
             break;

         case 0xd0: /* xgetbv */
@@ -7560,7 +7560,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_UW, s->T1, s->A0);
             gen_add_A0_im(s, 2);
-            gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            gen_op_ld_v(s, CODE64(s) + MO_UL, s->T0, s->A0);
             if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
@@ -7577,7 +7577,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             gen_lea_modrm(env, s, modrm);
             gen_op_ld_v(s, MO_UW, s->T1, s->A0);
             gen_add_A0_im(s, 2);
-            gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
+            gen_op_ld_v(s, CODE64(s) + MO_UL, s->T0, s->A0);
             if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
@@ -7698,7 +7698,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             rm =3D (modrm & 7) | REX_B(s);

             if (mod =3D=3D 3) {
-                gen_op_mov_v_reg(s, MO_32, s->T0, rm);
+                gen_op_mov_v_reg(s, MO_UL, s->T0, rm);
                 /* sign extend */
                 if (d_ot =3D=3D MO_64) {
                     tcg_gen_ext32s_tl(s->T0, s->T0);
@@ -7706,7 +7706,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 gen_op_mov_reg_v(s, d_ot, reg, s->T0);
             } else {
                 gen_lea_modrm(env, s, modrm);
-                gen_op_ld_v(s, MO_32 | MO_SIGN, s->T0, s->A0);
+                gen_op_ld_v(s, MO_SL, s->T0, s->A0);
                 gen_op_mov_reg_v(s, d_ot, reg, s->T0);
             }
         } else
@@ -7765,7 +7765,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             TCGv t0;
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            ot =3D dflag !=3D MO_UW ? MO_32 : MO_UW;
+            ot =3D dflag !=3D MO_UW ? MO_UL : MO_UW;
             modrm =3D x86_ldub_code(env, s);
             reg =3D ((modrm >> 3) & 7) | rex_r;
             gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
@@ -8016,7 +8016,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             if (CODE64(s))
                 ot =3D MO_64;
             else
-                ot =3D MO_32;
+                ot =3D MO_UL;
             if ((prefixes & PREFIX_LOCK) && (reg =3D=3D 0) &&
                 (s->cpuid_ext3_features & CPUID_EXT3_CR8LEG)) {
                 reg =3D 8;
@@ -8073,7 +8073,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             if (CODE64(s))
                 ot =3D MO_64;
             else
-                ot =3D MO_32;
+                ot =3D MO_UL;
             if (reg >=3D 8) {
                 goto illegal_op;
             }
@@ -8168,7 +8168,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             }
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, mxcsr))=
;
-            gen_op_st_v(s, MO_32, s->T0, s->A0);
+            gen_op_st_v(s, MO_UL, s->T0, s->A0);
             break;

         CASE_MODRM_MEM_OP(4): /* xsave */
@@ -8268,7 +8268,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                     dst =3D treg, src =3D base;
                 }

-                if (s->dflag =3D=3D MO_32) {
+                if (s->dflag =3D=3D MO_UL) {
                     tcg_gen_ext32u_tl(dst, src);
                 } else {
                     tcg_gen_mov_tl(dst, src);
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx=
-impl.inc.c
index 71efef4..8aa767e 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -409,27 +409,27 @@ GEN_VXFORM_DUAL_EXT(vaddubm, PPC_ALTIVEC, PPC_NONE, 0=
,       \
 GEN_VXFORM_V(vadduhm, MO_UW, tcg_gen_gvec_add, 0, 1);
 GEN_VXFORM_DUAL(vadduhm, PPC_ALTIVEC, PPC_NONE,  \
                 vmul10ecuq, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_V(vadduwm, MO_32, tcg_gen_gvec_add, 0, 2);
+GEN_VXFORM_V(vadduwm, MO_UL, tcg_gen_gvec_add, 0, 2);
 GEN_VXFORM_V(vaddudm, MO_64, tcg_gen_gvec_add, 0, 3);
 GEN_VXFORM_V(vsububm, MO_UB, tcg_gen_gvec_sub, 0, 16);
 GEN_VXFORM_V(vsubuhm, MO_UW, tcg_gen_gvec_sub, 0, 17);
-GEN_VXFORM_V(vsubuwm, MO_32, tcg_gen_gvec_sub, 0, 18);
+GEN_VXFORM_V(vsubuwm, MO_UL, tcg_gen_gvec_sub, 0, 18);
 GEN_VXFORM_V(vsubudm, MO_64, tcg_gen_gvec_sub, 0, 19);
 GEN_VXFORM_V(vmaxub, MO_UB, tcg_gen_gvec_umax, 1, 0);
 GEN_VXFORM_V(vmaxuh, MO_UW, tcg_gen_gvec_umax, 1, 1);
-GEN_VXFORM_V(vmaxuw, MO_32, tcg_gen_gvec_umax, 1, 2);
+GEN_VXFORM_V(vmaxuw, MO_UL, tcg_gen_gvec_umax, 1, 2);
 GEN_VXFORM_V(vmaxud, MO_64, tcg_gen_gvec_umax, 1, 3);
 GEN_VXFORM_V(vmaxsb, MO_UB, tcg_gen_gvec_smax, 1, 4);
 GEN_VXFORM_V(vmaxsh, MO_UW, tcg_gen_gvec_smax, 1, 5);
-GEN_VXFORM_V(vmaxsw, MO_32, tcg_gen_gvec_smax, 1, 6);
+GEN_VXFORM_V(vmaxsw, MO_UL, tcg_gen_gvec_smax, 1, 6);
 GEN_VXFORM_V(vmaxsd, MO_64, tcg_gen_gvec_smax, 1, 7);
 GEN_VXFORM_V(vminub, MO_UB, tcg_gen_gvec_umin, 1, 8);
 GEN_VXFORM_V(vminuh, MO_UW, tcg_gen_gvec_umin, 1, 9);
-GEN_VXFORM_V(vminuw, MO_32, tcg_gen_gvec_umin, 1, 10);
+GEN_VXFORM_V(vminuw, MO_UL, tcg_gen_gvec_umin, 1, 10);
 GEN_VXFORM_V(vminud, MO_64, tcg_gen_gvec_umin, 1, 11);
 GEN_VXFORM_V(vminsb, MO_UB, tcg_gen_gvec_smin, 1, 12);
 GEN_VXFORM_V(vminsh, MO_UW, tcg_gen_gvec_smin, 1, 13);
-GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);
+GEN_VXFORM_V(vminsw, MO_UL, tcg_gen_gvec_smin, 1, 14);
 GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);
 GEN_VXFORM(vavgub, 1, 16);
 GEN_VXFORM(vabsdub, 1, 16);
@@ -532,18 +532,18 @@ GEN_VXFORM(vmulesh, 4, 13);
 GEN_VXFORM(vmulesw, 4, 14);
 GEN_VXFORM_V(vslb, MO_UB, tcg_gen_gvec_shlv, 2, 4);
 GEN_VXFORM_V(vslh, MO_UW, tcg_gen_gvec_shlv, 2, 5);
-GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
+GEN_VXFORM_V(vslw, MO_UL, tcg_gen_gvec_shlv, 2, 6);
 GEN_VXFORM(vrlwnm, 2, 6);
 GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \
                 vrlwnm, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);
 GEN_VXFORM_V(vsrb, MO_UB, tcg_gen_gvec_shrv, 2, 8);
 GEN_VXFORM_V(vsrh, MO_UW, tcg_gen_gvec_shrv, 2, 9);
-GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);
+GEN_VXFORM_V(vsrw, MO_UL, tcg_gen_gvec_shrv, 2, 10);
 GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);
 GEN_VXFORM_V(vsrab, MO_UB, tcg_gen_gvec_sarv, 2, 12);
 GEN_VXFORM_V(vsrah, MO_UW, tcg_gen_gvec_sarv, 2, 13);
-GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);
+GEN_VXFORM_V(vsraw, MO_UL, tcg_gen_gvec_sarv, 2, 14);
 GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);
 GEN_VXFORM(vsrv, 2, 28);
 GEN_VXFORM(vslv, 2, 29);
@@ -595,16 +595,16 @@ GEN_VXFORM_DUAL_EXT(vaddubs, PPC_ALTIVEC, PPC_NONE, 0=
,       \
 GEN_VXFORM_SAT(vadduhs, MO_UW, add, usadd, 0, 9);
 GEN_VXFORM_DUAL(vadduhs, PPC_ALTIVEC, PPC_NONE, \
                 vmul10euq, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_SAT(vadduws, MO_32, add, usadd, 0, 10);
+GEN_VXFORM_SAT(vadduws, MO_UL, add, usadd, 0, 10);
 GEN_VXFORM_SAT(vaddsbs, MO_UB, add, ssadd, 0, 12);
 GEN_VXFORM_SAT(vaddshs, MO_UW, add, ssadd, 0, 13);
-GEN_VXFORM_SAT(vaddsws, MO_32, add, ssadd, 0, 14);
+GEN_VXFORM_SAT(vaddsws, MO_UL, add, ssadd, 0, 14);
 GEN_VXFORM_SAT(vsububs, MO_UB, sub, ussub, 0, 24);
 GEN_VXFORM_SAT(vsubuhs, MO_UW, sub, ussub, 0, 25);
-GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
+GEN_VXFORM_SAT(vsubuws, MO_UL, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_UB, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_UW, sub, sssub, 0, 29);
-GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
+GEN_VXFORM_SAT(vsubsws, MO_UL, sub, sssub, 0, 30);
 GEN_VXFORM(vadduqm, 0, 4);
 GEN_VXFORM(vaddcuq, 0, 5);
 GEN_VXFORM3(vaddeuqm, 30, 0);
@@ -914,7 +914,7 @@ static void glue(gen_, name)(DisasContext *ctx)        =
                 \

 GEN_VXFORM_VSPLT(vspltb, MO_UB, 6, 8);
 GEN_VXFORM_VSPLT(vsplth, MO_UW, 6, 9);
-GEN_VXFORM_VSPLT(vspltw, MO_32, 6, 10);
+GEN_VXFORM_VSPLT(vspltw, MO_UL, 6, 10);
 GEN_VXFORM_UIMM_SPLAT(vextractub, 6, 8, 15);
 GEN_VXFORM_UIMM_SPLAT(vextractuh, 6, 9, 14);
 GEN_VXFORM_UIMM_SPLAT(vextractuw, 6, 10, 12);
diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/vsx=
-impl.inc.c
index 3922686..212817e 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1553,12 +1553,12 @@ static void gen_xxspltw(DisasContext *ctx)

     tofs =3D vsr_full_offset(rt);
     bofs =3D vsr_full_offset(rb);
-    bofs +=3D uim << MO_32;
+    bofs +=3D uim << MO_UL;
 #ifndef HOST_WORDS_BIG_ENDIAN
     bofs ^=3D 8 | 4;
 #endif

-    tcg_gen_gvec_dup_mem(MO_32, tofs, bofs, 16, 16);
+    tcg_gen_gvec_dup_mem(MO_UL, tofs, bofs, 16, 16);
 }

 #define pattern(x) (((x) & 0xff) * (~(uint64_t)0 / 0xff))
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 415747f..9e646f1 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -196,7 +196,7 @@ static inline int freg64_offset(uint8_t reg)
 static inline int freg32_offset(uint8_t reg)
 {
     g_assert(reg < 16);
-    return vec_reg_offset(reg, 0, MO_32);
+    return vec_reg_offset(reg, 0, MO_UL);
 }

 static TCGv_i64 load_reg(int reg)
@@ -2283,7 +2283,7 @@ static DisasJumpType op_csp(DisasContext *s, DisasOps=
 *o)

     /* Write back the output now, so that it happens before the
        following branch, so that we don't need local temps.  */
-    if ((mop & MO_SIZE) =3D=3D MO_32) {
+    if ((mop & MO_SIZE) =3D=3D MO_UL) {
         tcg_gen_deposit_i64(o->out, o->out, old, 0, 32);
     } else {
         tcg_gen_mov_i64(o->out, old);
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.in=
c.c
index 65da6b3..75d788c 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -48,7 +48,7 @@

 #define ES_8    MO_UB
 #define ES_16   MO_UW
-#define ES_32   MO_32
+#define ES_32   MO_UL
 #define ES_64   MO_64
 #define ES_128  4

diff --git a/target/s390x/vec.h b/target/s390x/vec.h
index 28e1b1d..f67392c 100644
--- a/target/s390x/vec.h
+++ b/target/s390x/vec.h
@@ -80,7 +80,7 @@ static inline uint64_t s390_vec_read_element(const S390Ve=
ctor *v, uint8_t enr,
         return s390_vec_read_element8(v, enr);
     case MO_UW:
         return s390_vec_read_element16(v, enr);
-    case MO_32:
+    case MO_UL:
         return s390_vec_read_element32(v, enr);
     case MO_64:
         return s390_vec_read_element64(v, enr);
@@ -127,7 +127,7 @@ static inline void s390_vec_write_element(S390Vector *v=
, uint8_t enr,
     case MO_UW:
         s390_vec_write_element16(v, enr, data);
         break;
-    case MO_32:
+    case MO_UL:
         s390_vec_write_element32(v, enr, data);
         break;
     case MO_64:
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 3d90c4b..dc4fd21 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -431,12 +431,12 @@ typedef enum {
        that emits them can transform to 3.3.10 or 3.3.13.  */
     I3312_STRB      =3D 0x38000000 | LDST_ST << 22 | MO_UB << 30,
     I3312_STRH      =3D 0x38000000 | LDST_ST << 22 | MO_UW << 30,
-    I3312_STRW      =3D 0x38000000 | LDST_ST << 22 | MO_32 << 30,
+    I3312_STRW      =3D 0x38000000 | LDST_ST << 22 | MO_UL << 30,
     I3312_STRX      =3D 0x38000000 | LDST_ST << 22 | MO_64 << 30,

     I3312_LDRB      =3D 0x38000000 | LDST_LD << 22 | MO_UB << 30,
     I3312_LDRH      =3D 0x38000000 | LDST_LD << 22 | MO_UW << 30,
-    I3312_LDRW      =3D 0x38000000 | LDST_LD << 22 | MO_32 << 30,
+    I3312_LDRW      =3D 0x38000000 | LDST_LD << 22 | MO_UL << 30,
     I3312_LDRX      =3D 0x38000000 | LDST_LD << 22 | MO_64 << 30,

     I3312_LDRSBW    =3D 0x38000000 | LDST_LD_S_W << 22 | MO_UB << 30,
@@ -444,10 +444,10 @@ typedef enum {

     I3312_LDRSBX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_UB << 30,
     I3312_LDRSHX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_UW << 30,
-    I3312_LDRSWX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_32 << 30,
+    I3312_LDRSWX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_UL << 30,

-    I3312_LDRVS     =3D 0x3c000000 | LDST_LD << 22 | MO_32 << 30,
-    I3312_STRVS     =3D 0x3c000000 | LDST_ST << 22 | MO_32 << 30,
+    I3312_LDRVS     =3D 0x3c000000 | LDST_LD << 22 | MO_UL << 30,
+    I3312_STRVS     =3D 0x3c000000 | LDST_ST << 22 | MO_UL << 30,

     I3312_LDRVD     =3D 0x3c000000 | LDST_LD << 22 | MO_64 << 30,
     I3312_STRVD     =3D 0x3c000000 | LDST_ST << 22 | MO_64 << 30,
@@ -870,7 +870,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType typ=
e,

     /*
      * Test all bytes 0x00 or 0xff second.  This can match cases that
-     * might otherwise take 2 or 3 insns for MO_UW or MO_32 below.
+     * might otherwise take 2 or 3 insns for MO_UW or MO_UL below.
      */
     for (i =3D imm8 =3D 0; i < 8; i++) {
         uint8_t byte =3D v64 >> (i * 8);
@@ -908,7 +908,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType typ=
e,
         tcg_out_insn(s, 3606, MOVI, q, rd, 0, 0x8, v16 & 0xff);
         tcg_out_insn(s, 3606, ORR, q, rd, 0, 0xa, v16 >> 8);
         return;
-    } else if (v64 =3D=3D dup_const(MO_32, v64)) {
+    } else if (v64 =3D=3D dup_const(MO_UL, v64)) {
         uint32_t v32 =3D v64;
         uint32_t n32 =3D ~v32;

@@ -1749,7 +1749,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCG=
MemOp memop, TCGType ext,
         if (bswap) {
             tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
             tcg_out_rev32(s, data_r, data_r);
-            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, data_r, data_r);
+            tcg_out_sxt(s, TCG_TYPE_I64, MO_UL, data_r, data_r);
         } else {
             tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
         }
@@ -1782,7 +1782,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
MemOp memop,
         }
         tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
         break;
-    case MO_32:
+    case MO_UL:
         if (bswap && data_r !=3D TCG_REG_XZR) {
             tcg_out_rev32(s, TCG_REG_TMP, data_r);
             data_r =3D TCG_REG_TMP;
@@ -2194,7 +2194,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
-        tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
+        tcg_out_sxt(s, TCG_TYPE_I64, MO_UL, a0, a1);
         break;
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext8u_i32:
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 0bd400e..05560a2 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -1435,7 +1435,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
     case MO_UW:
         argreg =3D tcg_out_arg_reg16(s, argreg, datalo);
         break;
-    case MO_32:
+    case MO_UL:
     default:
         argreg =3D tcg_out_arg_reg32(s, argreg, datalo);
         break;
@@ -1632,7 +1632,7 @@ static inline void tcg_out_qemu_st_index(TCGContext *=
s, int cond, TCGMemOp opc,
             tcg_out_st16_r(s, cond, datalo, addrlo, addend);
         }
         break;
-    case MO_32:
+    case MO_UL:
     default:
         if (bswap) {
             tcg_out_bswap32(s, cond, TCG_REG_R0, datalo);
@@ -1677,7 +1677,7 @@ static inline void tcg_out_qemu_st_direct(TCGContext =
*s, TCGMemOp opc,
             tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
         }
         break;
-    case MO_32:
+    case MO_UL:
     default:
         if (bswap) {
             tcg_out_bswap32(s, COND_AL, TCG_REG_R0, datalo);
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 31c3664..93e4c63 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -897,7 +897,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type=
, unsigned vece,
             tcg_out_vex_modrm(s, OPC_PUNPCKLWD, r, a, a);
             a =3D r;
             /* FALLTHRU */
-        case MO_32:
+        case MO_UL:
             tcg_out_vex_modrm(s, OPC_PSHUFD, r, 0, a);
             /* imm8 operand: all output lanes selected from input lane 0. =
 */
             tcg_out8(s, 0);
@@ -924,7 +924,7 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType typ=
e, unsigned vece,
         case MO_64:
             tcg_out_vex_modrm_offset(s, OPC_MOVDDUP, r, 0, base, offset);
             break;
-        case MO_32:
+        case MO_UL:
             tcg_out_vex_modrm_offset(s, OPC_VBROADCASTSS, r, 0, base, offs=
et);
             break;
         case MO_UW:
@@ -2173,7 +2173,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
Reg datalo, TCGReg datahi,
         tcg_out_modrm_sib_offset(s, movop + P_DATA16 + seg, datalo,
                                  base, index, 0, ofs);
         break;
-    case MO_32:
+    case MO_UL:
         if (bswap) {
             tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
             tcg_out_bswap32(s, scratch);
@@ -2927,7 +2927,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode o=
pc,
     case INDEX_op_x86_blend_vec:
         if (vece =3D=3D MO_UW) {
             insn =3D OPC_PBLENDW;
-        } else if (vece =3D=3D MO_32) {
+        } else if (vece =3D=3D MO_UL) {
             insn =3D (have_avx2 ? OPC_VPBLENDD : OPC_BLENDPS);
         } else {
             g_assert_not_reached();
@@ -3292,13 +3292,13 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type=
, unsigned vece)
     case INDEX_op_shrs_vec:
         return vece >=3D MO_UW;
     case INDEX_op_sars_vec:
-        return vece >=3D MO_UW && vece <=3D MO_32;
+        return vece >=3D MO_UW && vece <=3D MO_UL;

     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
-        return have_avx2 && vece >=3D MO_32;
+        return have_avx2 && vece >=3D MO_UL;
     case INDEX_op_sarv_vec:
-        return have_avx2 && vece =3D=3D MO_32;
+        return have_avx2 && vece =3D=3D MO_UL;

     case INDEX_op_mul_vec:
         if (vece =3D=3D MO_UB) {
@@ -3320,7 +3320,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, =
unsigned vece)
     case INDEX_op_umin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_abs_vec:
-        return vece <=3D MO_32;
+        return vece <=3D MO_UL;

     default:
         return 0;
@@ -3396,9 +3396,9 @@ static void expand_vec_sari(TCGType type, unsigned ve=
ce,
              * shift (note that the ISA says shift of 32 is valid).
              */
             t1 =3D tcg_temp_new_vec(type);
-            tcg_gen_sari_vec(MO_32, t1, v1, imm);
+            tcg_gen_sari_vec(MO_UL, t1, v1, imm);
             tcg_gen_shri_vec(MO_64, v0, v1, imm);
-            vec_gen_4(INDEX_op_x86_blend_vec, type, MO_32,
+            vec_gen_4(INDEX_op_x86_blend_vec, type, MO_UL,
                       tcgv_vec_arg(v0), tcgv_vec_arg(v0),
                       tcgv_vec_arg(t1), 0xaa);
             tcg_temp_free_vec(t1);
@@ -3515,28 +3515,28 @@ static bool expand_vec_cmp_noinv(TCGType type, unsi=
gned vece, TCGv_vec v0,
         fixup =3D NEED_SWAP | NEED_INV;
         break;
     case TCG_COND_LEU:
-        if (vece <=3D MO_32) {
+        if (vece <=3D MO_UL) {
             fixup =3D NEED_UMIN;
         } else {
             fixup =3D NEED_BIAS | NEED_INV;
         }
         break;
     case TCG_COND_GTU:
-        if (vece <=3D MO_32) {
+        if (vece <=3D MO_UL) {
             fixup =3D NEED_UMIN | NEED_INV;
         } else {
             fixup =3D NEED_BIAS;
         }
         break;
     case TCG_COND_GEU:
-        if (vece <=3D MO_32) {
+        if (vece <=3D MO_UL) {
             fixup =3D NEED_UMAX;
         } else {
             fixup =3D NEED_BIAS | NEED_SWAP | NEED_INV;
         }
         break;
     case TCG_COND_LTU:
-        if (vece <=3D MO_32) {
+        if (vece <=3D MO_UL) {
             fixup =3D NEED_UMAX | NEED_INV;
         } else {
             fixup =3D NEED_BIAS | NEED_SWAP;
diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
index 1780cb1..a78fe87 100644
--- a/tcg/mips/tcg-target.inc.c
+++ b/tcg/mips/tcg-target.inc.c
@@ -1386,7 +1386,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
     case MO_UW:
         i =3D tcg_out_call_iarg_reg16(s, i, l->datalo_reg);
         break;
-    case MO_32:
+    case MO_UL:
         i =3D tcg_out_call_iarg_reg(s, i, l->datalo_reg);
         break;
     case MO_64:
@@ -1579,11 +1579,11 @@ static void tcg_out_qemu_st_direct(TCGContext *s, T=
CGReg lo, TCGReg hi,
         tcg_out_opc_imm(s, OPC_SH, lo, base, 0);
         break;

-    case MO_32 | MO_BSWAP:
+    case MO_UL | MO_BSWAP:
         tcg_out_bswap32(s, TCG_TMP3, lo);
         lo =3D TCG_TMP3;
         /* FALLTHRU */
-    case MO_32:
+    case MO_UL:
         tcg_out_opc_imm(s, OPC_SW, lo, base, 0);
         break;

diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 852b894..835336a 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -1714,7 +1714,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
 #endif
             tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
             /* FALLTHRU */
-        case MO_32:
+        case MO_UL:
             tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
             break;
         default:
diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 20bc19d..1905986 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1222,7 +1222,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
Reg lo, TCGReg hi,
     case MO_UW:
         tcg_out_opc_store(s, OPC_SH, base, lo, 0);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_out_opc_store(s, OPC_SW, base, lo, 0);
         break;
     case MO_64:
diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
index 85550b5..ac0d3a3 100644
--- a/tcg/sparc/tcg-target.inc.c
+++ b/tcg/sparc/tcg-target.inc.c
@@ -889,7 +889,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op=
)
         tcg_out_arithi(s, r, r, 16, SHIFT_SLL);
         tcg_out_arithi(s, r, r, 16, SHIFT_SRL);
         break;
-    case MO_32:
+    case MO_UL:
         if (SPARC64) {
             tcg_out_arith(s, r, r, 0, SHIFT_SRL);
         }
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index da409f5..e63622c 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -310,7 +310,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c)
         return 0x0101010101010101ull * (uint8_t)c;
     case MO_UW:
         return 0x0001000100010001ull * (uint16_t)c;
-    case MO_32:
+    case MO_UL:
         return 0x0000000100000001ull * (uint32_t)c;
     case MO_64:
         return c;
@@ -330,7 +330,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i32 out, TC=
Gv_i32 in)
     case MO_UW:
         tcg_gen_deposit_i32(out, in, in, 16, 16);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_gen_mov_i32(out, in);
         break;
     default:
@@ -349,7 +349,7 @@ static void gen_dup_i64(unsigned vece, TCGv_i64 out, TC=
Gv_i64 in)
         tcg_gen_ext16u_i64(out, in);
         tcg_gen_muli_i64(out, out, 0x0001000100010001ull);
         break;
-    case MO_32:
+    case MO_UL:
         tcg_gen_deposit_i64(out, in, in, 32, 32);
         break;
     case MO_64:
@@ -443,7 +443,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32=
_t oprsz,
     TCGv_ptr t_ptr;
     uint32_t i;

-    assert(vece <=3D (in_32 ? MO_32 : MO_64));
+    assert(vece <=3D (in_32 ? MO_UL : MO_64));
     assert(in_32 =3D=3D NULL || in_64 =3D=3D NULL);

     /* If we're storing 0, expand oprsz to maxsz.  */
@@ -485,7 +485,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32=
_t oprsz,
                use a 64-bit operation unless the 32-bit operation would
                be simple enough.  */
             if (TCG_TARGET_REG_BITS =3D=3D 64
-                && (vece !=3D MO_32 || !check_size_impl(oprsz, 4))) {
+                && (vece !=3D MO_UL || !check_size_impl(oprsz, 4))) {
                 t_64 =3D tcg_temp_new_i64();
                 tcg_gen_extu_i32_i64(t_64, in_32);
                 gen_dup_i64(vece, t_64, t_64);
@@ -1430,7 +1430,7 @@ void tcg_gen_gvec_dup_i32(unsigned vece, uint32_t dof=
s, uint32_t oprsz,
                           uint32_t maxsz, TCGv_i32 in)
 {
     check_size_align(oprsz, maxsz, dofs);
-    tcg_debug_assert(vece <=3D MO_32);
+    tcg_debug_assert(vece <=3D MO_UL);
     do_dup(vece, dofs, oprsz, maxsz, in, NULL, 0);
 }

@@ -1453,7 +1453,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dof=
s, uint32_t aofs,
             tcg_gen_dup_mem_vec(vece, t_vec, cpu_env, aofs);
             do_dup_store(type, dofs, oprsz, maxsz, t_vec);
             tcg_temp_free_vec(t_vec);
-        } else if (vece <=3D MO_32) {
+        } else if (vece <=3D MO_UL) {
             TCGv_i32 in =3D tcg_temp_new_i32();
             switch (vece) {
             case MO_UB:
@@ -1519,7 +1519,7 @@ void tcg_gen_gvec_dup32i(uint32_t dofs, uint32_t oprs=
z,
                          uint32_t maxsz, uint32_t x)
 {
     check_size_align(oprsz, maxsz, dofs);
-    do_dup(MO_32, dofs, oprsz, maxsz, NULL, NULL, x);
+    do_dup(MO_UL, dofs, oprsz, maxsz, NULL, NULL, x);
 }

 void tcg_gen_gvec_dup16i(uint32_t dofs, uint32_t oprsz,
@@ -1618,7 +1618,7 @@ void tcg_gen_gvec_add(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_add32,
           .opt_opc =3D vecop_list_add,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_add_i64,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_add64,
@@ -1649,7 +1649,7 @@ void tcg_gen_gvec_adds(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_adds32,
           .opt_opc =3D vecop_list_add,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_add_i64,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_adds64,
@@ -1690,7 +1690,7 @@ void tcg_gen_gvec_subs(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_subs32,
           .opt_opc =3D vecop_list_sub,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_sub_i64,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_subs64,
@@ -1769,7 +1769,7 @@ void tcg_gen_gvec_sub(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_sub32,
           .opt_opc =3D vecop_list_sub,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_sub_i64,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_sub64,
@@ -1800,7 +1800,7 @@ void tcg_gen_gvec_mul(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_mul32,
           .opt_opc =3D vecop_list_mul,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_mul_i64,
           .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_mul64,
@@ -1829,7 +1829,7 @@ void tcg_gen_gvec_muls(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_muls32,
           .opt_opc =3D vecop_list_mul,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_mul_i64,
           .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_muls64,
@@ -1866,7 +1866,7 @@ void tcg_gen_gvec_ssadd(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_ssadd_vec,
           .fno =3D gen_helper_gvec_ssadd32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fniv =3D tcg_gen_ssadd_vec,
           .fno =3D gen_helper_gvec_ssadd64,
           .opt_opc =3D vecop_list,
@@ -1892,7 +1892,7 @@ void tcg_gen_gvec_sssub(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_sssub_vec,
           .fno =3D gen_helper_gvec_sssub32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fniv =3D tcg_gen_sssub_vec,
           .fno =3D gen_helper_gvec_sssub64,
           .opt_opc =3D vecop_list,
@@ -1935,7 +1935,7 @@ void tcg_gen_gvec_usadd(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
           .fniv =3D tcg_gen_usadd_vec,
           .fno =3D gen_helper_gvec_usadd32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_usadd_i64,
           .fniv =3D tcg_gen_usadd_vec,
           .fno =3D gen_helper_gvec_usadd64,
@@ -1979,7 +1979,7 @@ void tcg_gen_gvec_ussub(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
           .fniv =3D tcg_gen_ussub_vec,
           .fno =3D gen_helper_gvec_ussub32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_ussub_i64,
           .fniv =3D tcg_gen_ussub_vec,
           .fno =3D gen_helper_gvec_ussub64,
@@ -2007,7 +2007,7 @@ void tcg_gen_gvec_smin(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_smin_vec,
           .fno =3D gen_helper_gvec_smin32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_smin_i64,
           .fniv =3D tcg_gen_smin_vec,
           .fno =3D gen_helper_gvec_smin64,
@@ -2035,7 +2035,7 @@ void tcg_gen_gvec_umin(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_umin_vec,
           .fno =3D gen_helper_gvec_umin32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_umin_i64,
           .fniv =3D tcg_gen_umin_vec,
           .fno =3D gen_helper_gvec_umin64,
@@ -2063,7 +2063,7 @@ void tcg_gen_gvec_smax(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_smax_vec,
           .fno =3D gen_helper_gvec_smax32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_smax_i64,
           .fniv =3D tcg_gen_smax_vec,
           .fno =3D gen_helper_gvec_smax64,
@@ -2091,7 +2091,7 @@ void tcg_gen_gvec_umax(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_umax_vec,
           .fno =3D gen_helper_gvec_umax32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_umax_i64,
           .fniv =3D tcg_gen_umax_vec,
           .fno =3D gen_helper_gvec_umax64,
@@ -2165,7 +2165,7 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_neg_vec,
           .fno =3D gen_helper_gvec_neg32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_neg_i64,
           .fniv =3D tcg_gen_neg_vec,
           .fno =3D gen_helper_gvec_neg64,
@@ -2228,7 +2228,7 @@ void tcg_gen_gvec_abs(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_abs_vec,
           .fno =3D gen_helper_gvec_abs32,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_abs_i64,
           .fniv =3D tcg_gen_abs_vec,
           .fno =3D gen_helper_gvec_abs64,
@@ -2485,7 +2485,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shli_vec,
           .fno =3D gen_helper_gvec_shl32i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_shli_i64,
           .fniv =3D tcg_gen_shli_vec,
           .fno =3D gen_helper_gvec_shl64i,
@@ -2536,7 +2536,7 @@ void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shri_vec,
           .fno =3D gen_helper_gvec_shr32i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_shri_i64,
           .fniv =3D tcg_gen_shri_vec,
           .fno =3D gen_helper_gvec_shr64i,
@@ -2601,7 +2601,7 @@ void tcg_gen_gvec_sari(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_sari_vec,
           .fno =3D gen_helper_gvec_sar32i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_sari_i64,
           .fniv =3D tcg_gen_sari_vec,
           .fno =3D gen_helper_gvec_sar64i,
@@ -2736,7 +2736,7 @@ do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t=
 aofs, TCGv_i32 shift,
     }

     /* Otherwise fall back to integral... */
-    if (vece =3D=3D MO_32 && check_size_impl(oprsz, 4)) {
+    if (vece =3D=3D MO_UL && check_size_impl(oprsz, 4)) {
         expand_2s_i32(dofs, aofs, oprsz, shift, false, g->fni4);
     } else if (vece =3D=3D MO_64 && check_size_impl(oprsz, 8)) {
         TCGv_i64 sh64 =3D tcg_temp_new_i64();
@@ -2889,7 +2889,7 @@ void tcg_gen_gvec_shlv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shlv_mod_vec,
           .fno =3D gen_helper_gvec_shl32v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_shl_mod_i64,
           .fniv =3D tcg_gen_shlv_mod_vec,
           .fno =3D gen_helper_gvec_shl64v,
@@ -2952,7 +2952,7 @@ void tcg_gen_gvec_shrv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shrv_mod_vec,
           .fno =3D gen_helper_gvec_shr32v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_shr_mod_i64,
           .fniv =3D tcg_gen_shrv_mod_vec,
           .fno =3D gen_helper_gvec_shr64v,
@@ -3015,7 +3015,7 @@ void tcg_gen_gvec_sarv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_sarv_mod_vec,
           .fno =3D gen_helper_gvec_sar32v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_32 },
+          .vece =3D MO_UL },
         { .fni8 =3D tcg_gen_sar_mod_i64,
           .fniv =3D tcg_gen_sarv_mod_vec,
           .fno =3D gen_helper_gvec_sar64v,
@@ -3168,7 +3168,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, ui=
nt32_t dofs,
     case 0:
         if (vece =3D=3D MO_64 && check_size_impl(oprsz, 8)) {
             expand_cmp_i64(dofs, aofs, bofs, oprsz, cond);
-        } else if (vece =3D=3D MO_32 && check_size_impl(oprsz, 4)) {
+        } else if (vece =3D=3D MO_UL && check_size_impl(oprsz, 4)) {
             expand_cmp_i32(dofs, aofs, bofs, oprsz, cond);
         } else {
             gen_helper_gvec_3 * const *fn =3D fns[cond];
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index b0a4d98..ff723ab 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -216,7 +216,7 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }

-#define MO_REG  (TCG_TARGET_REG_BITS =3D=3D 64 ? MO_64 : MO_32)
+#define MO_REG  (TCG_TARGET_REG_BITS =3D=3D 64 ? MO_64 : MO_UL)

 static void do_dupi_vec(TCGv_vec r, unsigned vece, TCGArg a)
 {
@@ -253,7 +253,7 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
 void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)
 {
     if (TCG_TARGET_REG_BITS =3D=3D 32 && a =3D=3D deposit64(a, 32, 32, a))=
 {
-        do_dupi_vec(r, MO_32, a);
+        do_dupi_vec(r, MO_UL, a);
     } else if (TCG_TARGET_REG_BITS =3D=3D 64 || a =3D=3D (uint64_t)(int32_=
t)a) {
         do_dupi_vec(r, MO_64, a);
     } else {
@@ -265,7 +265,7 @@ void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)

 void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_32, a));
+    do_dupi_vec(r, MO_REG, dup_const(MO_UL, a));
 }

 void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 21d448c..447683d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2725,7 +2725,7 @@ static inline TCGMemOp tcg_canonicalize_memop(TCGMemO=
p op, bool is64, bool st)
         break;
     case MO_UW:
         break;
-    case MO_32:
+    case MO_UL:
         if (!is64) {
             op &=3D ~MO_SIGN;
         }
@@ -2816,7 +2816,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
                 tcg_gen_ext16s_i32(val, val);
             }
             break;
-        case MO_32:
+        case MO_UL:
             tcg_gen_bswap32_i32(val, val);
             break;
         default:
@@ -2841,7 +2841,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
             tcg_gen_ext16u_i32(swap, val);
             tcg_gen_bswap16_i32(swap, swap);
             break;
-        case MO_32:
+        case MO_UL:
             tcg_gen_bswap32_i32(swap, val);
             break;
         default:
@@ -2896,7 +2896,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
                 tcg_gen_ext16s_i64(val, val);
             }
             break;
-        case MO_32:
+        case MO_UL:
             tcg_gen_bswap32_i64(val, val);
             if (orig_memop & MO_SIGN) {
                 tcg_gen_ext32s_i64(val, val);
@@ -2932,7 +2932,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
             tcg_gen_ext16u_i64(swap, val);
             tcg_gen_bswap16_i64(swap, swap);
             break;
-        case MO_32:
+        case MO_UL:
             tcg_gen_ext32u_i64(swap, val);
             tcg_gen_bswap32_i64(swap, swap);
             break;
@@ -3027,8 +3027,8 @@ static void * const table_cmpxchg[16] =3D {
     [MO_UB] =3D gen_helper_atomic_cmpxchgb,
     [MO_UW | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,
     [MO_UW | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,
-    [MO_32 | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,
-    [MO_32 | MO_BE] =3D gen_helper_atomic_cmpxchgl_be,
+    [MO_UL | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,
+    [MO_UL | MO_BE] =3D gen_helper_atomic_cmpxchgl_be,
     WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomic_cmpxchgq_le)
     WITH_ATOMIC64([MO_64 | MO_BE] =3D gen_helper_atomic_cmpxchgq_be)
 };
@@ -3251,8 +3251,8 @@ static void * const table_##NAME[16] =3D {           =
                     \
     [MO_UB] =3D gen_helper_atomic_##NAME##b,                              =
 \
     [MO_UW | MO_LE] =3D gen_helper_atomic_##NAME##w_le,                   =
\
     [MO_UW | MO_BE] =3D gen_helper_atomic_##NAME##w_be,                   =
\
-    [MO_32 | MO_LE] =3D gen_helper_atomic_##NAME##l_le,                   =
\
-    [MO_32 | MO_BE] =3D gen_helper_atomic_##NAME##l_be,                   =
\
+    [MO_UL | MO_LE] =3D gen_helper_atomic_##NAME##l_le,                   =
\
+    [MO_UL | MO_BE] =3D gen_helper_atomic_##NAME##l_be,                   =
\
     WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomic_##NAME##q_le)     =
\
     WITH_ATOMIC64([MO_64 | MO_BE] =3D gen_helper_atomic_##NAME##q_be)     =
\
 };                                                                      \
diff --git a/tcg/tcg.h b/tcg/tcg.h
index a378887..4b6ee89 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -1304,7 +1304,7 @@ uint64_t dup_const(unsigned vece, uint64_t c);
     (__builtin_constant_p(VECE)                                    \
      ?   ((VECE) =3D=3D MO_UB ? 0x0101010101010101ull * (uint8_t)(C)   \
         : (VECE) =3D=3D MO_UW ? 0x0001000100010001ull * (uint16_t)(C)  \
-        : (VECE) =3D=3D MO_32 ? 0x0000000100000001ull * (uint32_t)(C)  \
+        : (VECE) =3D=3D MO_UL ? 0x0000000100000001ull * (uint32_t)(C)  \
         : dup_const(VECE, C))                                      \
      : dup_const(VECE, C))

--
1.8.3.1




--_000_156381010564428725btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">Preparation for splitting MO_32 out f=
rom TCGMemOp into new accelerator</span><br>
</div>
<div>independent MemOp.</div>
<div><br>
</div>
<div>As MO_32 will be a value of MemOp, existing TCGMemOp comparisons and</=
div>
<div>coercions will trigger -Wenum-compare and -Wenum-conversion.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;target/arm/sve_helper.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 6 &#43;-</div>
<div>&nbsp;target/arm/translate-a64.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 1=
48 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;------------------</div>
<div>&nbsp;target/arm/translate-sve.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp;12 &#43;--</div>
<div>&nbsp;target/arm/translate-vfp.inc.c &nbsp; &nbsp; &nbsp;| &nbsp; 4 &#=
43;-</div>
<div>&nbsp;target/arm/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp;34 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;target/i386/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | 150 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;------------------</div>
<div>&nbsp;target/ppc/translate/vmx-impl.inc.c | &nbsp;28 &#43;&#43;&#43;--=
--</div>
<div>&nbsp;target/ppc/translate/vsx-impl.inc.c | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/s390x/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 4 &#43;-</div>
<div>&nbsp;target/s390x/translate_vx.inc.c &nbsp; &nbsp; | &nbsp; 2 &#43;-<=
/div>
<div>&nbsp;target/s390x/vec.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;tcg/aarch64/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;=
20 &#43;&#43;---</div>
<div>&nbsp;tcg/arm/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 6 &#43;-</div>
<div>&nbsp;tcg/i386/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp;28 &#43;&#43;&#43;----</div>
<div>&nbsp;tcg/mips/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 6 &#43;-</div>
<div>&nbsp;tcg/ppc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/riscv/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/sparc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/tcg-op-gvec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp;64 &#43;&#43;&#43;&#43;&#43;&#43;&#43;--------</di=
v>
<div>&nbsp;tcg/tcg-op-vec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 6 &#43;-</div>
<div>&nbsp;tcg/tcg-op.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;18 &#43;&#43;---</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;22 files changed, 276 insertions(&#43;), 276 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c</div>
<div>index f6bef3d..fa705c4 100644</div>
<div>--- a/target/arm/sve_helper.c</div>
<div>&#43;&#43;&#43; b/target/arm/sve_helper.c</div>
<div>@@ -1561,7 &#43;1561,7 @@ void HELPER(sve_cpy_m_s)(void *vd, void *vn,=
 void *vg,</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t *d =3D vd, *n =3D vn;</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *pg =3D vg;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;mm =3D dup_const(MO_32, mm);</div>
<div>&#43; &nbsp; &nbsp;mm =3D dup_const(MO_UL, mm);</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; opr_sz; i &#43;=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint64_t nn =3D n[i];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint64_t pp =3D expand_pred_s(pg[H1(=
i)]);</div>
<div>@@ -1612,7 &#43;1612,7 @@ void HELPER(sve_cpy_z_s)(void *vd, void *vg,=
 uint64_t val, uint32_t desc)</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t *d =3D vd;</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *pg =3D vg;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;val =3D dup_const(MO_32, val);</div>
<div>&#43; &nbsp; &nbsp;val =3D dup_const(MO_UL, val);</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; opr_sz; i &#43;=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d[i] =3D val &amp; expand_pred_s(pg[=
H1(i)]);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>@@ -5123,7 &#43;5123,7 @@ static inline void sve_ldff1_zs(CPUARMState =
*env, void *vd, void *vg, void *vm,</div>
<div>&nbsp; &nbsp; &nbsp;target_ulong addr;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Skip to the first true predicate. &nbsp;*/</div=
>
<div>- &nbsp; &nbsp;reg_off =3D find_next_active(vg, 0, reg_max, MO_32);</d=
iv>
<div>&#43; &nbsp; &nbsp;reg_off =3D find_next_active(vg, 0, reg_max, MO_UL)=
;</div>
<div>&nbsp; &nbsp; &nbsp;if (likely(reg_off &lt; reg_max)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Perform one normal read, which wi=
ll fault or not. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set_helper_retaddr(ra);</div>
<div>diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c</=
div>
<div>index 3acfccb..0b92e6d 100644</div>
<div>--- a/target/arm/translate-a64.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-a64.c</div>
<div>@@ -484,7 &#43;484,7 @@ static TCGv_i32 read_fp_sreg(DisasContext *s, =
int reg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 v =3D tcg_temp_new_i32();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;tcg_gen_ld_i32(v, cpu_env, fp_reg_offset(s, reg, MO_32)=
);</div>
<div>&#43; &nbsp; &nbsp;tcg_gen_ld_i32(v, cpu_env, fp_reg_offset(s, reg, MO=
_UL));</div>
<div>&nbsp; &nbsp; &nbsp;return v;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -999,7 &#43;999,7 @@ static void read_vec_element(DisasContext *s, =
TCGv_i64 tcg_dest, int srcidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16u_i64(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_i64(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_SB:</div>
<div>@@ -1008,7 &#43;1008,7 @@ static void read_vec_element(DisasContext *s=
, TCGv_i64 tcg_dest, int srcidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_SW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16s_i64(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32|MO_SIGN:</div>
<div>&#43; &nbsp; &nbsp;case MO_SL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32s_i64(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -1037,8 &#43;1037,8 @@ static void read_vec_element_i32(DisasContex=
t *s, TCGv_i32 tcg_dest, int srcidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_SW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16s_i32(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>- &nbsp; &nbsp;case MO_32|MO_SIGN:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&#43; &nbsp; &nbsp;case MO_SL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld_i32(tcg_dest, cpu_env, ve=
ct_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -1058,7 &#43;1058,7 @@ static void write_vec_element(DisasContext *=
s, TCGv_i64 tcg_src, int destidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i64(tcg_src, cpu_env, v=
ect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st32_i64(tcg_src, cpu_env, v=
ect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -1080,7 &#43;1080,7 @@ static void write_vec_element_i32(DisasConte=
xt *s, TCGv_i32 tcg_src,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i32(tcg_src, cpu_env, v=
ect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st_i32(tcg_src, cpu_env, vec=
t_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -5299,7 &#43;5299,7 @@ static void handle_fp_compare(DisasContext *=
s, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (signal_all_nans) {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_vfp_cmpes_a64(tcg_flags, tcg_vn, tcg_vm, fpst);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -5354,7 &#43;5354,7 @@ static void disas_fp_compare(DisasContext *s=
, uint32_t insn)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (type) {</div>
<div>&nbsp; &nbsp; &nbsp;case 0:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_64;</div>
<div>@@ -5405,7 &#43;5405,7 @@ static void disas_fp_ccomp(DisasContext *s, =
uint32_t insn)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (type) {</div>
<div>&nbsp; &nbsp; &nbsp;case 0:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_64;</div>
<div>@@ -5471,7 &#43;5471,7 @@ static void disas_fp_csel(DisasContext *s, u=
int32_t insn)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (type) {</div>
<div>&nbsp; &nbsp; &nbsp;case 0:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_64;</div>
<div>@@ -6276,7 &#43;6276,7 @@ static void disas_fp_imm(DisasContext *s, ui=
nt32_t insn)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (type) {</div>
<div>&nbsp; &nbsp; &nbsp;case 0:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_64;</div>
<div>@@ -6581,7 &#43;6581,7 @@ static void handle_fmov(DisasContext *s, int=
 rd, int rn, int type, bool itof)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (type) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* 32 bit */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_i64(tcg_rd, c=
pu_env, fp_reg_offset(s, rn, MO_32));</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_i64(tcg_r=
d, cpu_env, fp_reg_offset(s, rn, MO_UL));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 1:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* 64 bit */</div>
<div>@@ -7030,7 &#43;7030,7 @@ static TCGv_i32 do_reduction_op(DisasContext=
 *s, int fpopcode, int rn,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (esize =3D=3D size) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int element;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp msize =3D esize =3D=3D 16 ? MO_U=
W : MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp msize =3D esize =3D=3D 16 ? =
MO_UW : MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_elem;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* We should have one register left =
here */</div>
<div>@@ -7702,7 &#43;7702,7 @@ static void disas_simd_scalar_pairwise(Disas=
Context *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D=
 MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D extract32(size, 0,=
 1) ? MO_64 : MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D extract32(size=
, 0, 1) ? MO_64 : MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!fp_access_check(s)) {</div>
<div>@@ -8181,7 &#43;8181,7 @@ static void handle_simd_qshl(DisasContext *s=
, bool scalar, bool is_q,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NeonGenTwoOpEnvFn *genfn =3D fns[src=
_unsigned][dst_unsigned][size];</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D scalar ? size : MO_32;=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D scalar ? size : MO=
_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int maxpass =3D scalar ? 1 : is_q ? =
4 : 2;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; maxpass; =
pass&#43;&#43;) {</div>
<div>@@ -8204,7 &#43;8204,7 @@ static void handle_simd_qshl(DisasContext *s=
, bool scalar, bool is_q,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_fp=
_sreg(s, rd, tcg_op);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_ele=
ment_i32(s, tcg_op, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec=
_element_i32(s, tcg_op, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op);</div>
<div>@@ -8264,7 &#43;8264,7 @@ static void handle_simd_intfp_conv(DisasCont=
ext *s, int rd, int rn,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s=
, tcg_int32, rn, pass, mop);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (frac=
bits) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (is_signed) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;gen_helper_vfp_sltos(tcg_float, tcg_int32,</div>
<div>@@ -8337,7 &#43;8337,7 @@ static void handle_simd_shift_intfp_conv(Dis=
asContext *s, bool is_scalar,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 4) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 2) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!dc_isar_feature(aa64_fp16, s)) =
{</div>
<div>@@ -8382,7 &#43;8382,7 @@ static void handle_simd_shift_fpint_conv(Dis=
asContext *s, bool is_scalar,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 0x4) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 0x2) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!dc_isar_feature(aa64_fp16, s)) =
{</div>
<div>@@ -8436,7 &#43;8436,7 @@ static void handle_simd_shift_fpint_conv(Dis=
asContext *s, bool is_scalar,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D g=
en_helper_vfp_toshh;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_u) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D g=
en_helper_vfp_touls;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -8588,8 &#43;8588,8 @@ static void disas_simd_scalar_three_reg_diff=
(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op2 =3D tcg_temp_new_i6=
4();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_res =3D tcg_temp_new_i6=
4();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tcg_op1, rn, 0, MO_32=
 | MO_SIGN);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tcg_op2, rm, 0, MO_32=
 | MO_SIGN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tcg_op1, rn, 0, M=
O_SL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tcg_op2, rm, 0, M=
O_SL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_i64(tcg_res, tcg_op1, tc=
g_op2);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_neon_addl_saturate_s64(tc=
g_res, cpu_env, tcg_res, tcg_res);</div>
<div>@@ -8631,7 &#43;8631,7 @@ static void disas_simd_scalar_three_reg_diff=
(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x9: /* SQDMLAL, SQDMLAL2 */</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op3 =3D t=
cg_temp_new_i64();</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tcg_op3=
, rd, 0, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tcg=
_op3, rd, 0, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_neon_addl_s=
aturate_s32(tcg_res, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;tcg_res, tcg_op3);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i64(tcg_=
op3);</div>
<div>@@ -8831,8 &#43;8831,8 @@ static void handle_3same_float(DisasContext =
*s, int size, int elements,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_op2 =3D t=
cg_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_res =3D t=
cg_temp_new_i32();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op1, rn, pass, MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op2, rm, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op1, rn, pass, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op2, rm, pass, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (fpopcode) {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x39: /* FMLS */<=
/div>
<div>@@ -8840,7 &#43;8840,7 @@ static void handle_3same_float(DisasContext =
*s, int size, int elements,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_vfp_negs(tcg_op1, tcg_op1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* fall =
through */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x19: /* FMLA */<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_elem=
ent_i32(s, tcg_res, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_=
element_i32(s, tcg_res, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_vfp_muladds(tcg_res, tcg_op1, tcg_op2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_r=
es, fpst);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -8908,7 &#43;8908,7 @@ static void handle_3same_float(DisasContext =
*s, int size, int elements,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_ve=
c_element(s, tcg_tmp, rd, pass, MO_64);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp=
_free_i64(tcg_tmp);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_ele=
ment_i32(s, tcg_res, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec=
_element_i32(s, tcg_res, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res);</div>
<div>@@ -9557,7 &#43;9557,7 @@ static void handle_2misc_reciprocal(DisasCon=
text *s, int opcode,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; maxpasses=
; pass&#43;&#43;) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op, rn, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op, rn, pass, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (opcode) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x3c: /* URECPE *=
/</div>
<div>@@ -9579,7 &#43;9579,7 @@ static void handle_2misc_reciprocal(DisasCon=
text *s, int opcode,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_scalar) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_fp=
_sreg(s, rd, tcg_res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_ele=
ment_i32(s, tcg_res, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec=
_element_i32(s, tcg_res, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_res);</div>
<div>@@ -9693,7 &#43;9693,7 @@ static void handle_2misc_narrow(DisasContext=
 *s, bool scalar,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; 2; pass&#43;&#43;) {</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_res[pass], r=
d, destelt &#43; pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_res[pass=
], rd, destelt &#43; pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_res[pass]);</d=
iv>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;clear_vec_high(s, is_q, rd);</div>
<div>@@ -9740,8 &#43;9740,8 @@ static void handle_2misc_satacc(DisasContext=
 *s, bool is_scalar, bool is_u,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec=
_element_i32(s, tcg_rn, rn, pass, size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec=
_element_i32(s, tcg_rd, rd, pass, size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_elem=
ent_i32(s, tcg_rn, rn, pass, MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_elem=
ent_i32(s, tcg_rd, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_=
element_i32(s, tcg_rn, rn, pass, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_=
element_i32(s, tcg_rd, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_u) { /* USQADD =
*/</div>
<div>@@ -9779,7 &#43;9779,7 @@ static void handle_2misc_satacc(DisasContext=
 *s, bool is_scalar, bool is_u,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_ve=
c_element(s, tcg_zero, rd, 0, MO_64);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp=
_free_i64(tcg_zero);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_rd, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_rd, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_rd);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_rn);</div>
<div>@@ -10347,7 &#43;10347,7 @@ static void handle_3rd_widening(DisasConte=
xt *s, int is_q, int is_u, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op1 =3D t=
cg_temp_new_i64();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op2 =3D t=
cg_temp_new_i64();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_passres;<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D MO_32 | =
(is_u ? 0 : MO_SIGN);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D is_u=
 ? MO_UL : MO_SL;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int elt =3D pass &#43;=
 is_q * 2;</div>
<div>&nbsp;</div>
<div>@@ -10426,8 &#43;10426,8 @@ static void handle_3rd_widening(DisasConte=
xt *s, int is_q, int is_u, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_passres;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int elt =3D pass &#43;=
 is_q * 2;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op1, rn, elt, MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op2, rm, elt, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op1, rn, elt, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op2, rm, elt, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (accop =3D=3D 0) {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_pass=
res =3D tcg_res[pass];</div>
<div>@@ -10547,7 &#43;10547,7 @@ static void handle_3rd_wide(DisasContext *=
s, int is_q, int is_u, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NeonGenWidenFn *widenfn =3D widenfns=
[size][is_u];</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tcg_op1, rn, pas=
s, MO_64);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op2, rm, part=
 &#43; pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op2, rm, =
part &#43; pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;widenfn(tcg_op2_wide, tcg_op2);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_op2);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res[pass] =3D tcg_temp_new_i64()=
;</div>
<div>@@ -10603,7 &#43;10603,7 @@ static void handle_3rd_narrowing(DisasCont=
ext *s, int is_q, int is_u, int size,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; 2; pass&#43;&#43;) {</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_res[pass], r=
d, pass &#43; part, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_res[pass=
], rd, pass &#43; part, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_res[pass]);</d=
iv>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;clear_vec_high(s, is_q, rd);</div>
<div>@@ -10860,8 &#43;10860,8 @@ static void handle_simd_3same_pair(DisasCo=
ntext *s, int is_q, int u, int opcode,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int passreg =3D pass &=
lt; (maxpass / 2) ? rn : rm;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int passelt =3D (is_q =
&amp;&amp; (pass &amp; 1)) ? 2 : 0;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op1, passreg, passelt, MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op2, passreg, passelt &#43; 1, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op1, passreg, passelt, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op2, passreg, passelt &#43; 1, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res[pass] =3D tcg_=
temp_new_i32();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (opcode) {</div=
>
<div>@@ -10925,7 &#43;10925,7 @@ static void handle_simd_3same_pair(DisasCo=
ntext *s, int is_q, int u, int opcode,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; maxpass; =
pass&#43;&#43;) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_res[pass], rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_res[pass], rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res[pass]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;clear_vec_high(s, is_q, rd);</div>
<div>@@ -10971,7 &#43;10971,7 @@ static void disas_simd_3same_float(DisasCo=
ntext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;handle_simd_3same_pair(s, is_q, 0, fpopco=
de, size ? MO_64 : MO_32,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;handle_simd_3same_pair(s, is_q, 0, fp=
opcode, size ? MO_64 : MO_UL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rn, rm, rd);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x1b: /* FMULX */</div>
<div>@@ -11174,8 &#43;11174,8 @@ static void disas_simd_3same_int(DisasCont=
ext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NeonGenTwoOpFn *genfn =
=3D NULL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NeonGenTwoOpEnvFn *gen=
envfn =3D NULL;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op1, rn, pass, MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op2, rm, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op1, rn, pass, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op2, rm, pass, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (opcode) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x0: /* SHADD, UH=
ADD */</div>
<div>@@ -11292,11 &#43;11292,11 @@ static void disas_simd_3same_int(DisasCo=
ntext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;tcg_gen_add_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_elem=
ent_i32(s, tcg_op1, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_=
element_i32(s, tcg_op1, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fns[size=
](tcg_res, tcg_op1, tcg_res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_res, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_res, rd, pass, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op1);</div>
<div>@@ -11578,7 &#43;11578,7 @@ static void disas_simd_three_reg_same_extr=
a(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x02: /* SDOT (vector) */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x12: /* UDOT (vector) */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (size !=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (size !=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -11709,7 &#43;11709,7 @@ static void handle_2misc_widening(DisasCon=
text *s, int opcode, bool is_q,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_op =3D tc=
g_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res[pass] =3D tcg_=
temp_new_i64();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op, rn, srcelt &#43; pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op, rn, srcelt &#43; pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_vfp_fcvtds(=
tcg_res[pass], tcg_op, cpu_env);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -11732,7 &#43;11732,7 @@ static void handle_2misc_widening(DisasCon=
text *s, int opcode, bool is_q,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; fpst, ahp);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; 4; pass&#=
43;&#43;) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_res[pass], rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_res[pass], rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res[pass]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -11771,7 &#43;11771,7 @@ static void handle_rev(DisasContext *s, in=
t opcode, bool u,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
bswap16_i64(tcg_tmp, tcg_tmp);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
bswap32_i64(tcg_tmp, tcg_tmp);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -11900,7 &#43;11900,7 @@ static void handle_shll(DisasContext *s, b=
ool is_q, int size, int rn, int rd)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NeonGenWidenFn *widenfn =3D widenfns=
[size];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_op =3D tcg_temp_new_i32=
();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op, rn, part =
&#43; pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op, rn, p=
art &#43; pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res[pass] =3D tcg_temp_new_i64()=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;widenfn(tcg_res[pass], tcg_op);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shli_i64(tcg_res[pass], tcg_=
res[pass], 8 &lt;&lt; size);</div>
<div>@@ -12251,7 &#43;12251,7 @@ static void disas_simd_two_reg_misc(DisasC=
ontext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_res =3D t=
cg_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGCond cond;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op, rn, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op, rn, pass, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (size =3D=3D 2) {</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Speci=
al cases for 32 bit elements */</div>
<div>@@ -12418,7 &#43;12418,7 @@ static void disas_simd_two_reg_misc(DisasC=
ontext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_res, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_res, rd, pass, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op);</div>
<div>@@ -12816,7 &#43;12816,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x0e: /* SDOT */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x1e: /* UDOT */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (is_scalar || size !=3D MO_32 || !dc_i=
sar_feature(aa64_dp, s)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (is_scalar || size !=3D MO_UL || !=
dc_isar_feature(aa64_dp, s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -12835,7 &#43;12835,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp;case 0x04: /* FMLSL */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x18: /* FMLAL2 */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x1c: /* FMLSL2 */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (is_scalar || size !=3D MO_32 || !dc_i=
sar_feature(aa64_fhm, s)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (is_scalar || size !=3D MO_UL || !=
dc_isar_feature(aa64_fhm, s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -12855,7 &#43;12855,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;is_fp16 =3D true;</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32: /* single precision */</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL: /* single precision */</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64: /* double precision */</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -12868,7 &#43;12868,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Each indexable element is a compl=
ex pair. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size &#43;=3D 1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (h &amp;&amp; !is_q=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unalloca=
ted_encoding(s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;<=
/div>
<div>@@ -12902,7 &#43;12902,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;index =3D h &lt;&lt; 2 | l &lt;&lt; =
1 | m;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;index =3D h &lt;&lt; 1 | l;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm |=3D m &lt;&lt; 4;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -13038,7 &#43;13038,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_op =3D tc=
g_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_res =3D t=
cg_temp_new_i32();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op, rn, pass, is_scalar ? size : MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op, rn, pass, is_scalar ? size : MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (16 * u &#43; o=
pcode) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x08: /* MUL */</=
div>
<div>@@ -13060,7 &#43;13060,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (opco=
de =3D=3D 0x8) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_elem=
ent_i32(s, tcg_op, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_=
element_i32(s, tcg_op, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;genfn =
=3D fns[size - 1][is_sub];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;genfn(tc=
g_res, tcg_op, tcg_res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -13068,7 &#43;13068,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x05: /* FMLS */<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x01: /* FMLA */<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec=
_element_i32(s, tcg_res, rd, pass,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; is_scalar ? size =
: MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; is_scalar ? s=
ize : MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (=
size) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 1:<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (opcode =3D=3D 0x5) {</div>
<div>@@ -13153,7 &#43;13153,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x1d: /* SQRDMLAH=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec=
_element_i32(s, tcg_res, rd, pass,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; is_scalar ? size =
: MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; is_scalar ? s=
ize : MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (size=
 =3D=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;gen_helper_neon_qrdmlah_s16(tcg_res, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;tcg_op, tcg_idx, tcg_res);</div>
<div>@@ -13164,7 &#43;13164,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x1f: /* SQRDMLSH=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec=
_element_i32(s, tcg_res, rd, pass,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; is_scalar ? size =
: MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; is_scalar ? s=
ize : MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (size=
 =3D=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;gen_helper_neon_qrdmlsh_s16(tcg_res, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;tcg_op, tcg_idx, tcg_res);</div>
<div>@@ -13180,7 &#43;13180,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_scalar) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_fp=
_sreg(s, rd, tcg_res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_ele=
ment_i32(s, tcg_res, rd, pass, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec=
_element_i32(s, tcg_res, rd, pass, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op);</div>
<div>@@ -13194,7 &#43;13194,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_res[2];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int pass;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool satop =3D extract32(opcode, 0, =
1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp memop =3D MO_UL;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (satop || !u) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memop |=3D MO_SIGN;</d=
iv>
<div>@@ -13288,7 &#43;13288,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;read_vec_element_i32(s, tcg_op, rn, pass, size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;read_vec_element_i32(s, tcg_op, rn,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pas=
s &#43; (is_q * 2), MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 pass &#43; (is_q * 2), MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res[=
pass] =3D tcg_temp_new_i64();</div>
<div>@@ -13780,19 &#43;13780,19 @@ static void disas_crypto_four_reg(DisasC=
ontext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res =3D tcg_temp_new_i32();</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_zero =3D tcg_const_i32(0);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op1, rn, 3, M=
O_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op2, rm, 3, M=
O_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op3, ra, 3, M=
O_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op1, rn, =
3, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op2, rm, =
3, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op3, ra, =
3, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_rotri_i32(tcg_res, tcg_op1, =
20);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_add_i32(tcg_res, tcg_res, tc=
g_op2);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_add_i32(tcg_res, tcg_res, tc=
g_op3);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_rotri_i32(tcg_res, tcg_res, =
25);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_zero, rd, 0,=
 MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_zero, rd, 1,=
 MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_zero, rd, 2,=
 MO_32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_res, rd, 3, =
MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_zero, rd=
, 0, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_zero, rd=
, 1, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_zero, rd=
, 2, MO_UL);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tcg_res, rd,=
 3, MO_UL);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_op1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_op2);</div>
<div>diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c</=
div>
<div>index 2bc1bd1..f7c891d 100644</div>
<div>--- a/target/arm/translate-sve.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-sve.c</div>
<div>@@ -1693,7 &#43;1693,7 @@ static void do_sat_addsub_vec(DisasContext *=
s, int esz, int rd, int rn,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(t32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t64 =3D tcg_temp_new_i64();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (d) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_neg_i64(t64, v=
al);</div>
<div>@@ -3320,7 &#43;3320,7 @@ static bool trans_SUBR_zzi(DisasContext *s, =
arg_rri_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_sve_subri=
_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.scalar_first =3D true },</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_sub_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>@@ -5258,7 &#43;5258,7 @@ static bool trans_LD1_zprz(DisasContext *s, =
arg_LD1_zprz *a)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (a-&gt;esz) {</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D gather_load_fn32[be][a-&gt;ff=
][a-&gt;xs][a-&gt;u][a-&gt;msz];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -5286,7 &#43;5286,7 @@ static bool trans_LD1_zpiz(DisasContext *s, =
arg_LD1_zpiz *a)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (a-&gt;esz) {</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D gather_load_fn32[be][a-&gt;ff=
][0][a-&gt;u][a-&gt;msz];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -5364,7 &#43;5364,7 @@ static bool trans_ST1_zprz(DisasContext *s, =
arg_ST1_zprz *a)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return true;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;switch (a-&gt;esz) {</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D scatter_store_fn32[be][a-&gt;=
xs][a-&gt;msz];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -5392,7 &#43;5392,7 @@ static bool trans_ST1_zpiz(DisasContext *s, =
arg_ST1_zpiz *a)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (a-&gt;esz) {</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D scatter_store_fn32[be][0][a-&=
gt;msz];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp=
.inc.c</div>
<div>index 549874c..5e0cd63 100644</div>
<div>--- a/target/arm/translate-vfp.inc.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-vfp.inc.c</div>
<div>@@ -46,7 &#43;46,7 @@ uint64_t vfp_expand_imm(int size, uint8_t imm8)<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;extract32(imm8, 0, 6);=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;imm &lt;&lt;=3D 48;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;imm =3D (extract32(imm8, 7, 1) ? 0x8=
000 : 0) |</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(extract32(imm8, 6, 1)=
 ? 0x3e00 : 0x4000) |</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(extract32(imm8, 0, 6)=
 &lt;&lt; 3);</div>
<div>@@ -1901,7 &#43;1901,7 @@ static bool trans_VMOV_imm_sp(DisasContext *=
s, arg_VMOV_imm_sp *a)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;fd =3D tcg_const_i32(vfp_expand_imm(MO_32, a-&gt;imm));=
</div>
<div>&#43; &nbsp; &nbsp;fd =3D tcg_const_i32(vfp_expand_imm(MO_UL, a-&gt;im=
m));</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;for (;;) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;neon_store_reg32(fd, vd);</div>
<div>diff --git a/target/arm/translate.c b/target/arm/translate.c</div>
<div>index 8d10922..5510ecd 100644</div>
<div>--- a/target/arm/translate.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate.c</div>
<div>@@ -1085,7 &#43;1085,7 @@ static inline TCGv gen_aa32_addr(DisasContex=
t *s, TCGv_i32 a32, TCGMemOp op)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_extu_i32_tl(addr, a32);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Not needed for user-mode BE32, where we use MO_=
BE instead. &nbsp;*/</div>
<div>- &nbsp; &nbsp;if (!IS_USER_ONLY &amp;&amp; s-&gt;sctlr_b &amp;&amp; (=
op &amp; MO_SIZE) &lt; MO_32) {</div>
<div>&#43; &nbsp; &nbsp;if (!IS_USER_ONLY &amp;&amp; s-&gt;sctlr_b &amp;&am=
p; (op &amp; MO_SIZE) &lt; MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_xori_tl(addr, addr, 4 - (1 &=
lt;&lt; (op &amp; MO_SIZE)));</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;return addr;</div>
<div>@@ -1480,7 &#43;1480,7 @@ static void neon_store_element(int reg, int =
ele, TCGMemOp size, TCGv_i32 var)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i32(var, cpu_env, offse=
t);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st_i32(var, cpu_env, offset)=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -1499,7 &#43;1499,7 @@ static void neon_store_element64(int reg, in=
t ele, TCGMemOp size, TCGv_i64 var)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i64(var, cpu_env, offse=
t);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st32_i64(var, cpu_env, offse=
t);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -4272,7 &#43;4272,7 @@ const GVecGen2i ssra_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_ssra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_ssra,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_ssra64_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_ssra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D =
64,</div>
<div>@@ -4330,7 &#43;4330,7 @@ const GVecGen2i usra_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_usra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_usra,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32, },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL, },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_usra64_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_usra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D =
64,</div>
<div>@@ -4410,7 &#43;4410,7 @@ const GVecGen2i sri_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shr_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sri,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_shr64_ins_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shr_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D =
64,</div>
<div>@@ -4488,7 &#43;4488,7 @@ const GVecGen2i sli_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shl_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sli,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_shl64_ins_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shl_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D =
64,</div>
<div>@@ -4584,7 &#43;4584,7 @@ const GVecGen3 mla_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mla_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mla,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_mla64_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mla_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D =
64,</div>
<div>@@ -4608,7 &#43;4608,7 @@ const GVecGen3 mls_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mls_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mls,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_mls64_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mls_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D =
64,</div>
<div>@@ -4653,7 &#43;4653,7 @@ const GVecGen3 cmtst_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_cmtst_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_cmtst_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_cmtst,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_cmtst_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_cmtst_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.prefer_i64 =3D TCG_TARGET_REG_BITS =3D=3D =
64,</div>
<div>@@ -4691,7 &#43;4691,7 @@ const GVecGen4 uqadd_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqadd_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqadd,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_uqadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqadd_d,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>@@ -4729,7 &#43;4729,7 @@ const GVecGen4 sqadd_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqadd_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqadd,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_sqadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqadd_d,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqadd,</div>
<div>@@ -4767,7 &#43;4767,7 @@ const GVecGen4 uqsub_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqsub_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqsub,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_uqsub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqsub_d,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqsub,</div>
<div>@@ -4805,7 &#43;4805,7 @@ const GVecGen4 sqsub_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqsub_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqsub,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_sqsub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqsub_d,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqsub,</div>
<div>@@ -5798,10 &#43;5798,10 @@ static int disas_neon_data_insn(DisasConte=
xt *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;/* The immediate value has already been inverted,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; * so BIC becomes AND.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;tcg_gen_gvec_andi(MO_32, reg_ofs, reg_ofs, imm,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;tcg_gen_gvec_andi(MO_UL, reg_ofs, reg_ofs, imm,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_si=
ze, vec_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;tcg_gen_gvec_ori(MO_32, reg_ofs, reg_ofs, imm,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;tcg_gen_gvec_ori(MO_UL, reg_ofs, reg_ofs, imm,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vec_size, ve=
c_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -6879,7 &#43;6879,7 @@ static int disas_neon_data_insn(DisasContext=
 *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;element =3D (insn &gt;&gt; 18) &amp; 3;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;size =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;size =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;element =3D (insn &gt;&gt; 19) &amp; 1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
gvec_dup_mem(size, neon_reg_offset(rd, 0),</div>
<div>diff --git a/target/i386/translate.c b/target/i386/translate.c</div>
<div>index 0535bae..0e863d4 100644</div>
<div>--- a/target/i386/translate.c</div>
<div>&#43;&#43;&#43; b/target/i386/translate.c</div>
<div>@@ -332,16 &#43;332,16 @@ static inline TCGMemOp mo_pushpop(DisasConte=
xt *s, TCGMemOp ot)</div>
<div>&nbsp;/* Select the size of the stack pointer. &nbsp;*/</div>
<div>&nbsp;static inline TCGMemOp mo_stacksize(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_32 : MO_UW;<=
/div>
<div>&#43; &nbsp; &nbsp;return CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_UL : MO_=
UW;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select only size 64 else 32. &nbsp;Used for SSE operand sizes=
. &nbsp;*/</div>
<div>&nbsp;static inline TCGMemOp mo_64_32(TCGMemOp ot)</div>
<div>&nbsp;{</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>- &nbsp; &nbsp;return ot =3D=3D MO_64 ? MO_64 : MO_32;</div>
<div>&#43; &nbsp; &nbsp;return ot =3D=3D MO_64 ? MO_64 : MO_UL;</div>
<div>&nbsp;#else</div>
<div>- &nbsp; &nbsp;return MO_32;</div>
<div>&#43; &nbsp; &nbsp;return MO_UL;</div>
<div>&nbsp;#endif</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -356,7 &#43;356,7 @@ static inline TCGMemOp mo_b_d(int b, TCGMemOp =
ot)</div>
<div>&nbsp; &nbsp; Used for decoding operand size of port opcodes. &nbsp;*/=
</div>
<div>&nbsp;static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return b &amp; 1 ? (ot =3D=3D MO_UW ? MO_UW : MO_32) : =
MO_UB;</div>
<div>&#43; &nbsp; &nbsp;return b &amp; 1 ? (ot =3D=3D MO_UW ? MO_UW : MO_UL=
) : MO_UB;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int r=
eg, TCGv t0)</div>
<div>@@ -372,7 &#43;372,7 @@ static void gen_op_mov_reg_v(DisasContext *s, =
TCGMemOp ot, int reg, TCGv t0)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_tl(cpu_regs[reg], cp=
u_regs[reg], t0, 0, 16);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* For x86_64, this sets the higher =
half of register to zero.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; For i386, this is equivalent=
 to a mov. */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext32u_tl(cpu_regs[reg], t0)=
;</div>
<div>@@ -463,7 &#43;463,7 @@ static void gen_lea_v_seg(DisasContext *s, TCG=
MemOp aflag, TCGv a0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* 32 bit address */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ovr_seg &lt; 0 &amp;&amp; s-&gt;=
addseg) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ovr_seg =3D def_seg;</=
div>
<div>@@ -538,7 &#43;538,7 @@ static TCGv gen_ext_tl(TCGv dst, TCGv src, TCG=
MemOp size, bool sign)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return dst;</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (sign) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext32s_tl(dst,=
 src);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -586,7 &#43;586,7 @@ static void gen_helper_in_func(TCGMemOp ot, TC=
Gv v, TCGv_i32 n)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_inw(v, cpu_env, n);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_inl(v, cpu_env, n);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -603,7 &#43;603,7 @@ static void gen_helper_out_func(TCGMemOp ot, T=
CGv_i32 v, TCGv_i32 n)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_outw(cpu_env, v, n);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_outl(cpu_env, v, n);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -625,7 &#43;625,7 @@ static void gen_check_io(DisasContext *s, TCGM=
emOp ot, target_ulong cur_eip,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_check_iow(c=
pu_env, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_check_iol(c=
pu_env, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -1077,7 &#43;1077,7 @@ static TCGLabel *gen_jz_ecx_string(DisasCont=
ext *s, target_ulong next_eip)</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void gen_stos(DisasContext *s, TCGMemOp ot)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, s-&gt;T0, R_EAX);</div>
<div>&#43; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_UL, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp;gen_string_movl_A0_EDI(s);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_st_v(s, ot, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp;gen_op_movl_T0_Dshift(s, ot);</div>
<div>@@ -1568,7 &#43;1568,7 @@ static void gen_rot_rm_T1(DisasContext *s, T=
CGMemOp ot, int op1, int is_right)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_long;</div>
<div>&nbsp; &nbsp; &nbsp;do_long:</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s-&gt;tmp2_i32,=
 s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s-&gt;tmp3_i32,=
 s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_right) {</div>
<div>@@ -1644,7 &#43;1644,7 @@ static void gen_rot_rm_im(DisasContext *s, T=
CGMemOp ot, int op1, int op2,</div>
<div>&nbsp; &nbsp; &nbsp;if (op2 !=3D 0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s=
-&gt;tmp2_i32, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_right) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
rotri_i32(s-&gt;tmp2_i32, s-&gt;tmp2_i32, op2);</div>
<div>@@ -1725,7 &#43;1725,7 @@ static void gen_rotc_rm_T1(DisasContext *s, =
TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rcrw(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rcrl(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>@@ -1744,7 &#43;1744,7 @@ static void gen_rotc_rm_T1(DisasContext *s, =
TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rclw(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rcll(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>@@ -1791,7 &#43;1791,7 @@ static void gen_shiftd_rm_T1(DisasContext *s=
, TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FALLTHRU */</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Concatenate the two 32-bit values=
 and use a 64-bit shift. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_subi_tl(s-&gt;tmp0, count, 1=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_right) {</div>
<div>@@ -1984,7 &#43;1984,7 @@ static AddressParts gen_lea_modrm_0(CPUX86St=
ate *env, DisasContext *s,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (s-&gt;aflag) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;havesib =3D 0;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rm =3D=3D 4) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int code =3D x86_ldub_=
code(env, s);</div>
<div>@@ -2190,7 &#43;2190,7 @@ static inline uint32_t insn_get(CPUX86State =
*env, DisasContext *s, TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D x86_lduw_code(env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>&nbsp;#endif</div>
<div>@@ -2204,7 &#43;2204,7 @@ static inline uint32_t insn_get(CPUX86State =
*env, DisasContext *s, TCGMemOp ot)</div>
<div>&nbsp;</div>
<div>&nbsp;static inline int insn_const_size(TCGMemOp ot)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;if (ot &lt;=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp;if (ot &lt;=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 1 &lt;&lt; ot;</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 4;</div>
<div>@@ -2400,12 &#43;2400,12 @@ static inline void gen_pop_update(DisasCon=
text *s, TCGMemOp ot)</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void gen_stack_A0(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;gen_lea_v_seg(s, s-&gt;ss32 ? MO_32 : MO_UW, cpu_regs[R=
_ESP], R_SS, -1);</div>
<div>&#43; &nbsp; &nbsp;gen_lea_v_seg(s, s-&gt;ss32 ? MO_UL : MO_UW, cpu_re=
gs[R_ESP], R_SS, -1);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_pusha(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_UW;</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_UL : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp d_ot =3D s-&gt;dflag;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>@@ -2421,7 &#43;2421,7 @@ static void gen_pusha(DisasContext *s)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_popa(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_UW;</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_UL : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp d_ot =3D s-&gt;dflag;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>@@ -2443,7 &#43;2443,7 @@ static void gen_popa(DisasContext *s)</div>
<div>&nbsp;static void gen_enter(DisasContext *s, int esp_addend, int level=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp d_ot =3D mo_pushpop(s, s-&gt;dflag);</div=
>
<div>- &nbsp; &nbsp;TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_3=
2 : MO_UW;</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s-&gt;ss32 ? =
MO_UL : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Push BP; compute FrameTemp into T1. &nbsp;*/</d=
iv>
<div>@@ -3145,7 &#43;3145,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ld32u_tl(s-&gt;T0, cpu_env, offsetof(CPUX86State,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;xmm_regs[reg].ZMM_L(0)));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s=
, MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st=
_v(s, MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x6e: /* movd mm, ea */</div>
<div>@@ -3157,7 &#43;3157,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else</div>
<div>&nbsp;#endif</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modr=
m(env, s, modrm, MO_32, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_=
modrm(env, s, modrm, MO_UL, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
addi_ptr(s-&gt;ptr0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offsetof(CPUX86State,fpreg=
s[reg].mmx));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>@@ -3174,7 &#43;3174,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else</div>
<div>&nbsp;#endif</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modr=
m(env, s, modrm, MO_32, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_=
modrm(env, s, modrm, MO_UL, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
addi_ptr(s-&gt;ptr0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offsetof(CPUX86State,xmm_r=
egs[reg]));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>@@ -3211,7 &#43;3211,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x210: /* movss xmm, ea */</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (mod !=3D 3) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_=
modrm(env, s, modrm);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s=
, MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld=
_v(s, MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
st32_tl(s-&gt;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;offsetof(CPUX86State, xmm_r=
egs[reg].ZMM_L(0)));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
movi_tl(s-&gt;T0, 0);</div>
<div>@@ -3346,7 &#43;3346,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ld32u_tl(s-&gt;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offsetof(CPUX86State,fpreg=
s[reg].mmx.MMX_L(0)));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modr=
m(env, s, modrm, MO_32, OR_TMP0, 1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_=
modrm(env, s, modrm, MO_UL, OR_TMP0, 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x17e: /* movd ea, xmm */</div>
<div>@@ -3360,7 &#43;3360,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ld32u_tl(s-&gt;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offsetof(CPUX86State,xmm_r=
egs[reg].ZMM_L(0)));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modr=
m(env, s, modrm, MO_32, OR_TMP0, 1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_=
modrm(env, s, modrm, MO_UL, OR_TMP0, 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x27e: /* movq xmm, ea */</div>
<div>@@ -3405,7 &#43;3405,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_=
modrm(env, s, modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ld32u_tl(s-&gt;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offsetof(CPUX86State, xmm_=
regs[reg].ZMM_L(0)));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s=
, MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st=
_v(s, MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm =3D (=
modrm &amp; 7) | REX_B(s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_m=
ovl(s, offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)),</div>
<div>@@ -3530,7 &#43;3530,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s,=
 modrm, ot, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op1_offset =3D offseto=
f(CPUX86State,xmm_regs[reg]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_addi_ptr(s-&gt=
;ptr0, cpu_env, op1_offset);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_32) {</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_UL) {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SSEFunc_=
0_epi sse_fn_epi =3D sse_op_table3ai[(b &gt;&gt; 8) &amp; 1];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sse_fn_e=
pi(cpu_env, s-&gt;ptr0, s-&gt;tmp2_i32);</div>
<div>@@ -3584,7 &#43;3584,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((b &=
gt;&gt; 8) &amp; 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_Q(0)));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;gen_op_ld_v(s, MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;gen_op_ld_v(s, MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;tcg_gen_st32_tl(s-&gt;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;offsetof(CPUX=
86State, xmm_t0.ZMM_L(0)));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -3594,7 &#43;3594,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op2_offs=
et =3D offsetof(CPUX86State,xmm_regs[rm]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_addi_ptr(s-&gt=
;ptr0, cpu_env, op2_offset);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_32) {</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_UL) {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SSEFunc_=
i_ep sse_fn_i_ep =3D</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;sse_op_table3bi[((b &gt;&gt; 7) &amp; 2) | (b &amp; 1)];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sse_fn_i=
_ep(s-&gt;tmp2_i32, cpu_env, s-&gt;ptr0);</div>
<div>@@ -3786,7 &#43;3786,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((b &=
amp; 0xff) =3D=3D 0xf0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;ot =3D MO_UB;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else i=
f (s-&gt;dflag !=3D MO_64) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_UW : MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_UW : MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;ot =3D MO_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -3815,7 &#43;3815,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&g=
t;dflag !=3D MO_64) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_UW : MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_UW : MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;ot =3D MO_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -4026,7 &#43;4026,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;switch (ot) {</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;/* If we know TL is 64-bit, and we want a 32-bit</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; result, just do everything in 64-bit arithmetic=
. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;tcg_gen_ext32u_i64(cpu_regs[reg], cpu_regs[reg]);</div>
<div>@@ -4172,7 &#43;4172,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x1=
6:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;if (ot =3D=3D MO_32) { /* pextrd */</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;if (ot =3D=3D MO_UL) { /* pextrd */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;tcg_gen_ld_i32(s-&gt;tmp2_i32, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;offsetof(CPUX86State,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;xmm_regs[reg].ZMM_L(val &amp; 3)));</div>
<div>@@ -4210,7 &#43;4210,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x2=
0: /* pinsrb */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (mod =3D=3D 3) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, s-&gt;T0, rm);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_UL, s-&gt;T0, rm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;tcg_gen_qemu_ld_tl(s-&gt;T0, s-&gt;A0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; s-&gt;mem_index, MO_UB);</div>
<div>@@ -4248,7 &#43;4248,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;xmm_regs[reg].ZMM_L(3)));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x2=
2:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;if (ot =3D=3D MO_32) { /* pinsrd */</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;if (ot =3D=3D MO_UL) { /* pinsrd */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;if (mod =3D=3D 3) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s-&gt;tmp2_i32, cpu_=
regs[rm]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -4393,7 &#43;4393,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (=
sz) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 2:<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;/* 32 bit access */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;gen_op_ld_v(s, MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;gen_op_ld_v(s, MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;tcg_gen_st32_tl(s-&gt;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;offsetof(CPUX=
86State,xmm_t0.ZMM_L(0)));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;</div>
<div>@@ -4630,19 &#43;4630,19 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 64-bit mode, the default data =
size is 32-bit. &nbsp;Select 64-bit</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data with rex_w, and 16-bit =
data with 0x66; rex_w takes precedence</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; over 0x66 if both are presen=
t. &nbsp;*/</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D (rex_w &gt; 0 ? MO_64 : prefixe=
s &amp; PREFIX_DATA ? MO_UW : MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D (rex_w &gt; 0 ? MO_64 : pre=
fixes &amp; PREFIX_DATA ? MO_UW : MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 64-bit mode, 0x67 selects 32-b=
it addressing. &nbsp;*/</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D (prefixes &amp; PREFIX_ADR ? MO=
_32 : MO_64);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D (prefixes &amp; PREFIX_ADR =
? MO_UL : MO_64);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 16/32-bit mode, 0x66 selects t=
he opposite data size. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;code32 ^ ((prefixes &amp; =
PREFIX_DATA) !=3D 0)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 16/32-bit mode, 0x67 selects t=
he opposite addressing. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;code32 ^ ((prefixes &amp; =
PREFIX_ADR) !=3D 0)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp;else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -4891,7 &#43;4891,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set_cc_o=
p(s, CC_OP_MULW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp3_i32, cpu_regs[R_EAX]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mulu2_i32(s-&gt;tmp2_i32, s-&gt;tmp3_i32,</div>
<div>@@ -4942,7 &#43;4942,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set_cc_o=
p(s, CC_OP_MULW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp3_i32, cpu_regs[R_EAX]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
muls2_i32(s-&gt;tmp2_i32, s-&gt;tmp3_i32,</div>
<div>@@ -4976,7 &#43;4976,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_divw_AX(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_divl_EAX(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>@@ -4995,7 &#43;4995,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_idivw_AX(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_idivl_EAX(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>@@ -5026,7 &#43;5026,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* opera=
nd size for jumps is 64 bit */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D M=
O_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (op =3D=3D 3=
 || op =3D=3D 5) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag =
!=3D MO_UW ? MO_32 &#43; (rex_w =3D=3D 1) : MO_UW;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D df=
lag !=3D MO_UW ? MO_UL &#43; (rex_w =3D=3D 1) : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (op =3D=3D 6=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* defau=
lt push size is 64 bit */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D m=
o_pushpop(s, dflag);</div>
<div>@@ -5146,15 &#43;5146,15 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (dflag) {</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, =
s-&gt;T0, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_=
UL, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext32s_tl(s-&g=
t;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO=
_64, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO=
_UW, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16s_tl(s-&g=
t;T0, s-&gt;T0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_32, =
R_EAX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_=
UL, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO=
_UB, s-&gt;T0, R_EAX);</div>
<div>@@ -5174,11 &#43;5174,11 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO=
_64, R_EDX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, =
s-&gt;T0, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_=
UL, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext32s_tl(s-&g=
t;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_tl(s-&gt;=
T0, s-&gt;T0, 31);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_32, =
R_EDX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_=
UL, R_EDX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO=
_UW, s-&gt;T0, R_EAX);</div>
<div>@@ -5219,7 &#43;5219,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sub_tl(cpu_cc_=
src, cpu_cc_src, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;#endif</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s=
-&gt;tmp2_i32, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s=
-&gt;tmp3_i32, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muls2_i32(s-&g=
t;tmp2_i32, s-&gt;tmp3_i32,</div>
<div>@@ -5394,7 &#43;5394,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/**************************/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* push/pop */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x50 ... 0x57: /* push */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, s-&gt;T0, (b &=
amp; 7) | REX_B(s));</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_UL, s-&gt;T0, =
(b &amp; 7) | REX_B(s));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_push_v(s, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x58 ... 0x5f: /* pop */</div>
<div>@@ -5734,7 &#43;5734,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;case 0x1b5: /* lgs Gv */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op =3D R_GS;</div>
<div>&nbsp; &nbsp; &nbsp;do_lxx:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_UW ? MO_32 : MO_UW;<=
/div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_UW ? MO_UL : MO_=
UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;modrm =3D x86_ldub_code(env, s);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D ((modrm &gt;&gt; 3) &amp; 7)=
 | rex_r;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mod =3D (modrm &gt;&gt; 6) &amp; 3;<=
/div>
<div>@@ -6576,7 &#43;6576,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;case 0xe8: /* call im */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_UW) =
{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int=
32_t)insn_get(env, s, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D =
(int32_t)insn_get(env, s, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D=
 (int16_t)insn_get(env, s, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -6609,7 &#43;6609,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_lcall;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xe9: /* jmp im */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_UW) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int32_t)insn_get(=
env, s, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int32_t)insn_=
get(env, s, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int16_t)insn=
_get(env, s, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -6649,7 &#43;6649,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_jcc;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x180 ... 0x18f: /* jcc Jv */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_UW) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int32_t)insn_get(=
env, s, MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int32_t)insn_=
get(env, s, MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int16_t)insn=
_get(env, s, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -6827,7 &#43;6827,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D ((modrm &gt;&gt; 3) &amp; 7)=
 | rex_r;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mod =3D (modrm &gt;&gt; 6) &amp; 3;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm =3D (modrm &amp; 7) | REX_B(s);</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, s-&gt;T1, reg)=
;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_UL, s-&gt;T1, =
reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (mod !=3D 3) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;AddressParts a =3D gen=
_lea_modrm_0(env, s, modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* specific case: we n=
eed to add a displacement */</div>
<div>@@ -7126,10 &#43;7126,10 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else</div>
<div>&nbsp;#endif</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_32, =
s-&gt;T0, reg);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_=
UL, s-&gt;T0, reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext32u_tl(s-&g=
t;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap32_tl(s-&=
gt;T0, s-&gt;T0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_32, =
reg, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_=
UL, reg, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xd6: /* salc */</div>
<div>@@ -7359,7 &#43;7359,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, CODE64(s) &#=
43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, CODE64(s=
) &#43; MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0xc8: /* monitor */</div>
<div>@@ -7414,7 &#43;7414,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, CODE64(s) &#=
43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, CODE64(s=
) &#43; MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0xd0: /* xgetbv */</div>
<div>@@ -7560,7 &#43;7560,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, =
modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UW, =
s-&gt;T1, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 2);</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, CODE64(s) &#=
43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, CODE64(s=
) &#43; MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -7577,7 &#43;7577,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, =
modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UW, =
s-&gt;T1, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 2);</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, CODE64(s) &#=
43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, CODE64(s=
) &#43; MO_UL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -7698,7 &#43;7698,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm =3D (modrm &amp; 7)=
 | REX_B(s);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (mod =3D=3D 3) {</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_=
reg(s, MO_32, s-&gt;T0, rm);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_v_reg(s, MO_UL, s-&gt;T0, rm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* sign =
extend */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (d_ot=
 =3D=3D MO_64) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;tcg_gen_ext32s_tl(s-&gt;T0, s-&gt;T0);</div>
<div>@@ -7706,7 &#43;7706,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_m=
ov_reg_v(s, d_ot, reg, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_=
modrm(env, s, modrm);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s=
, MO_32 | MO_SIGN, s-&gt;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld=
_v(s, MO_SL, s-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_m=
ov_reg_v(s, d_ot, reg, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else</div>
<div>@@ -7765,7 &#43;7765,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv t0;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!s-&gt;pe || s-&gt=
;vm86)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto ill=
egal_op;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_UW ? M=
O_32 : MO_UW;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_UW=
 ? MO_UL : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;modrm =3D x86_ldub_cod=
e(env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D ((modrm &gt;&g=
t; 3) &amp; 7) | rex_r;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s,=
 modrm, MO_UW, OR_TMP0, 0);</div>
<div>@@ -8016,7 &#43;8016,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (CODE64(s))</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D M=
O_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO_32;=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO=
_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((prefixes &amp; PR=
EFIX_LOCK) &amp;&amp; (reg =3D=3D 0) &amp;&amp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(s-&gt;c=
puid_ext3_features &amp; CPUID_EXT3_CR8LEG)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D =
8;</div>
<div>@@ -8073,7 &#43;8073,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (CODE64(s))</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D M=
O_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO_32;=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO=
_UL;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg &gt;=3D 8) {</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto ill=
egal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -8168,7 &#43;8168,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, =
modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_tl(s-&gt=
;T0, cpu_env, offsetof(CPUX86State, mxcsr));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, MO_32, s-&gt=
;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, MO_UL, s=
-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;CASE_MODRM_MEM_OP(4): /* xsave */</d=
iv>
<div>@@ -8268,7 &#43;8268,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;dst =3D treg, src =3D base;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;dfl=
ag =3D=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt=
;dflag =3D=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;tcg_gen_ext32u_tl(dst, src);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;tcg_gen_mov_tl(dst, src);</div>
<div>diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translat=
e/vmx-impl.inc.c</div>
<div>index 71efef4..8aa767e 100644</div>
<div>--- a/target/ppc/translate/vmx-impl.inc.c</div>
<div>&#43;&#43;&#43; b/target/ppc/translate/vmx-impl.inc.c</div>
<div>@@ -409,27 &#43;409,27 @@ GEN_VXFORM_DUAL_EXT(vaddubm, PPC_ALTIVEC, PP=
C_NONE, 0, &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp;GEN_VXFORM_V(vadduhm, MO_UW, tcg_gen_gvec_add, 0, 1);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vadduhm, PPC_ALTIVEC, PPC_NONE, &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vmul10ec=
uq, PPC_NONE, PPC2_ISA300)</div>
<div>-GEN_VXFORM_V(vadduwm, MO_32, tcg_gen_gvec_add, 0, 2);</div>
<div>&#43;GEN_VXFORM_V(vadduwm, MO_UL, tcg_gen_gvec_add, 0, 2);</div>
<div>&nbsp;GEN_VXFORM_V(vaddudm, MO_64, tcg_gen_gvec_add, 0, 3);</div>
<div>&nbsp;GEN_VXFORM_V(vsububm, MO_UB, tcg_gen_gvec_sub, 0, 16);</div>
<div>&nbsp;GEN_VXFORM_V(vsubuhm, MO_UW, tcg_gen_gvec_sub, 0, 17);</div>
<div>-GEN_VXFORM_V(vsubuwm, MO_32, tcg_gen_gvec_sub, 0, 18);</div>
<div>&#43;GEN_VXFORM_V(vsubuwm, MO_UL, tcg_gen_gvec_sub, 0, 18);</div>
<div>&nbsp;GEN_VXFORM_V(vsubudm, MO_64, tcg_gen_gvec_sub, 0, 19);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxub, MO_UB, tcg_gen_gvec_umax, 1, 0);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxuh, MO_UW, tcg_gen_gvec_umax, 1, 1);</div>
<div>-GEN_VXFORM_V(vmaxuw, MO_32, tcg_gen_gvec_umax, 1, 2);</div>
<div>&#43;GEN_VXFORM_V(vmaxuw, MO_UL, tcg_gen_gvec_umax, 1, 2);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxud, MO_64, tcg_gen_gvec_umax, 1, 3);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsb, MO_UB, tcg_gen_gvec_smax, 1, 4);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsh, MO_UW, tcg_gen_gvec_smax, 1, 5);</div>
<div>-GEN_VXFORM_V(vmaxsw, MO_32, tcg_gen_gvec_smax, 1, 6);</div>
<div>&#43;GEN_VXFORM_V(vmaxsw, MO_UL, tcg_gen_gvec_smax, 1, 6);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsd, MO_64, tcg_gen_gvec_smax, 1, 7);</div>
<div>&nbsp;GEN_VXFORM_V(vminub, MO_UB, tcg_gen_gvec_umin, 1, 8);</div>
<div>&nbsp;GEN_VXFORM_V(vminuh, MO_UW, tcg_gen_gvec_umin, 1, 9);</div>
<div>-GEN_VXFORM_V(vminuw, MO_32, tcg_gen_gvec_umin, 1, 10);</div>
<div>&#43;GEN_VXFORM_V(vminuw, MO_UL, tcg_gen_gvec_umin, 1, 10);</div>
<div>&nbsp;GEN_VXFORM_V(vminud, MO_64, tcg_gen_gvec_umin, 1, 11);</div>
<div>&nbsp;GEN_VXFORM_V(vminsb, MO_UB, tcg_gen_gvec_smin, 1, 12);</div>
<div>&nbsp;GEN_VXFORM_V(vminsh, MO_UW, tcg_gen_gvec_smin, 1, 13);</div>
<div>-GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);</div>
<div>&#43;GEN_VXFORM_V(vminsw, MO_UL, tcg_gen_gvec_smin, 1, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);</div>
<div>&nbsp;GEN_VXFORM(vavgub, 1, 16);</div>
<div>&nbsp;GEN_VXFORM(vabsdub, 1, 16);</div>
<div>@@ -532,18 &#43;532,18 @@ GEN_VXFORM(vmulesh, 4, 13);</div>
<div>&nbsp;GEN_VXFORM(vmulesw, 4, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vslb, MO_UB, tcg_gen_gvec_shlv, 2, 4);</div>
<div>&nbsp;GEN_VXFORM_V(vslh, MO_UW, tcg_gen_gvec_shlv, 2, 5);</div>
<div>-GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);</div>
<div>&#43;GEN_VXFORM_V(vslw, MO_UL, tcg_gen_gvec_shlv, 2, 6);</div>
<div>&nbsp;GEN_VXFORM(vrlwnm, 2, 6);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vrlwnm, =
PPC_NONE, PPC2_ISA300)</div>
<div>&nbsp;GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);</div>
<div>&nbsp;GEN_VXFORM_V(vsrb, MO_UB, tcg_gen_gvec_shrv, 2, 8);</div>
<div>&nbsp;GEN_VXFORM_V(vsrh, MO_UW, tcg_gen_gvec_shrv, 2, 9);</div>
<div>-GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);</div>
<div>&#43;GEN_VXFORM_V(vsrw, MO_UL, tcg_gen_gvec_shrv, 2, 10);</div>
<div>&nbsp;GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);</div>
<div>&nbsp;GEN_VXFORM_V(vsrab, MO_UB, tcg_gen_gvec_sarv, 2, 12);</div>
<div>&nbsp;GEN_VXFORM_V(vsrah, MO_UW, tcg_gen_gvec_sarv, 2, 13);</div>
<div>-GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);</div>
<div>&#43;GEN_VXFORM_V(vsraw, MO_UL, tcg_gen_gvec_sarv, 2, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);</div>
<div>&nbsp;GEN_VXFORM(vsrv, 2, 28);</div>
<div>&nbsp;GEN_VXFORM(vslv, 2, 29);</div>
<div>@@ -595,16 &#43;595,16 @@ GEN_VXFORM_DUAL_EXT(vaddubs, PPC_ALTIVEC, PP=
C_NONE, 0, &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp;GEN_VXFORM_SAT(vadduhs, MO_UW, add, usadd, 0, 9);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vadduhs, PPC_ALTIVEC, PPC_NONE, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vmul10eu=
q, PPC_NONE, PPC2_ISA300)</div>
<div>-GEN_VXFORM_SAT(vadduws, MO_32, add, usadd, 0, 10);</div>
<div>&#43;GEN_VXFORM_SAT(vadduws, MO_UL, add, usadd, 0, 10);</div>
<div>&nbsp;GEN_VXFORM_SAT(vaddsbs, MO_UB, add, ssadd, 0, 12);</div>
<div>&nbsp;GEN_VXFORM_SAT(vaddshs, MO_UW, add, ssadd, 0, 13);</div>
<div>-GEN_VXFORM_SAT(vaddsws, MO_32, add, ssadd, 0, 14);</div>
<div>&#43;GEN_VXFORM_SAT(vaddsws, MO_UL, add, ssadd, 0, 14);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsububs, MO_UB, sub, ussub, 0, 24);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubuhs, MO_UW, sub, ussub, 0, 25);</div>
<div>-GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);</div>
<div>&#43;GEN_VXFORM_SAT(vsubuws, MO_UL, sub, ussub, 0, 26);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubsbs, MO_UB, sub, sssub, 0, 28);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubshs, MO_UW, sub, sssub, 0, 29);</div>
<div>-GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);</div>
<div>&#43;GEN_VXFORM_SAT(vsubsws, MO_UL, sub, sssub, 0, 30);</div>
<div>&nbsp;GEN_VXFORM(vadduqm, 0, 4);</div>
<div>&nbsp;GEN_VXFORM(vaddcuq, 0, 5);</div>
<div>&nbsp;GEN_VXFORM3(vaddeuqm, 30, 0);</div>
<div>@@ -914,7 &#43;914,7 @@ static void glue(gen_, name)(DisasContext *ctx=
) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; \</div>
<div>&nbsp;</div>
<div>&nbsp;GEN_VXFORM_VSPLT(vspltb, MO_UB, 6, 8);</div>
<div>&nbsp;GEN_VXFORM_VSPLT(vsplth, MO_UW, 6, 9);</div>
<div>-GEN_VXFORM_VSPLT(vspltw, MO_32, 6, 10);</div>
<div>&#43;GEN_VXFORM_VSPLT(vspltw, MO_UL, 6, 10);</div>
<div>&nbsp;GEN_VXFORM_UIMM_SPLAT(vextractub, 6, 8, 15);</div>
<div>&nbsp;GEN_VXFORM_UIMM_SPLAT(vextractuh, 6, 9, 14);</div>
<div>&nbsp;GEN_VXFORM_UIMM_SPLAT(vextractuw, 6, 10, 12);</div>
<div>diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translat=
e/vsx-impl.inc.c</div>
<div>index 3922686..212817e 100644</div>
<div>--- a/target/ppc/translate/vsx-impl.inc.c</div>
<div>&#43;&#43;&#43; b/target/ppc/translate/vsx-impl.inc.c</div>
<div>@@ -1553,12 &#43;1553,12 @@ static void gen_xxspltw(DisasContext *ctx)=
</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tofs =3D vsr_full_offset(rt);</div>
<div>&nbsp; &nbsp; &nbsp;bofs =3D vsr_full_offset(rb);</div>
<div>- &nbsp; &nbsp;bofs &#43;=3D uim &lt;&lt; MO_32;</div>
<div>&#43; &nbsp; &nbsp;bofs &#43;=3D uim &lt;&lt; MO_UL;</div>
<div>&nbsp;#ifndef HOST_WORDS_BIG_ENDIAN</div>
<div>&nbsp; &nbsp; &nbsp;bofs ^=3D 8 | 4;</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;tcg_gen_gvec_dup_mem(MO_32, tofs, bofs, 16, 16);</div>
<div>&#43; &nbsp; &nbsp;tcg_gen_gvec_dup_mem(MO_UL, tofs, bofs, 16, 16);</d=
iv>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;#define pattern(x) (((x) &amp; 0xff) * (~(uint64_t)0 / 0xff))</d=
iv>
<div>diff --git a/target/s390x/translate.c b/target/s390x/translate.c</div>
<div>index 415747f..9e646f1 100644</div>
<div>--- a/target/s390x/translate.c</div>
<div>&#43;&#43;&#43; b/target/s390x/translate.c</div>
<div>@@ -196,7 &#43;196,7 @@ static inline int freg64_offset(uint8_t reg)</=
div>
<div>&nbsp;static inline int freg32_offset(uint8_t reg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;g_assert(reg &lt; 16);</div>
<div>- &nbsp; &nbsp;return vec_reg_offset(reg, 0, MO_32);</div>
<div>&#43; &nbsp; &nbsp;return vec_reg_offset(reg, 0, MO_UL);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static TCGv_i64 load_reg(int reg)</div>
<div>@@ -2283,7 &#43;2283,7 @@ static DisasJumpType op_csp(DisasContext *s,=
 DisasOps *o)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Write back the output now, so that it happens b=
efore the</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; following branch, so that we don't need lo=
cal temps. &nbsp;*/</div>
<div>- &nbsp; &nbsp;if ((mop &amp; MO_SIZE) =3D=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp;if ((mop &amp; MO_SIZE) =3D=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_i64(o-&gt;out, o-&gt=
;out, old, 0, 32);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mov_i64(o-&gt;out, old);</di=
v>
<div>diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_=
vx.inc.c</div>
<div>index 65da6b3..75d788c 100644</div>
<div>--- a/target/s390x/translate_vx.inc.c</div>
<div>&#43;&#43;&#43; b/target/s390x/translate_vx.inc.c</div>
<div>@@ -48,7 &#43;48,7 @@</div>
<div>&nbsp;</div>
<div>&nbsp;#define ES_8 &nbsp; &nbsp;MO_UB</div>
<div>&nbsp;#define ES_16 &nbsp; MO_UW</div>
<div>-#define ES_32 &nbsp; MO_32</div>
<div>&#43;#define ES_32 &nbsp; MO_UL</div>
<div>&nbsp;#define ES_64 &nbsp; MO_64</div>
<div>&nbsp;#define ES_128 &nbsp;4</div>
<div>&nbsp;</div>
<div>diff --git a/target/s390x/vec.h b/target/s390x/vec.h</div>
<div>index 28e1b1d..f67392c 100644</div>
<div>--- a/target/s390x/vec.h</div>
<div>&#43;&#43;&#43; b/target/s390x/vec.h</div>
<div>@@ -80,7 &#43;80,7 @@ static inline uint64_t s390_vec_read_element(con=
st S390Vector *v, uint8_t enr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element8(v, enr=
);</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element16(v, en=
r);</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element32(v, en=
r);</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element64(v, en=
r);</div>
<div>@@ -127,7 &#43;127,7 @@ static inline void s390_vec_write_element(S390=
Vector *v, uint8_t enr,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_vec_write_element16(v, enr, dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_vec_write_element32(v, enr, dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc=
.c</div>
<div>index 3d90c4b..dc4fd21 100644</div>
<div>--- a/tcg/aarch64/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/aarch64/tcg-target.inc.c</div>
<div>@@ -431,12 &#43;431,12 @@ typedef enum {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; that emits them can transform to 3.3.10 or=
 3.3.13. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_UW &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_STRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDST_ST=
 &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_STRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDS=
T_ST &lt;&lt; 22 | MO_UL &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRX &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_UW &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_LDRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
 &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDS=
T_LD &lt;&lt; 22 | MO_UL &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRX &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSBW &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_W &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>@@ -444,10 &#43;444,10 @@ typedef enum {</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSBX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_X &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSHX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_X &lt;&lt; 22 | MO_UW &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_LDRSWX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_S_X =
&lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRSWX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_=
S_X &lt;&lt; 22 | MO_UL &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;I3312_LDRVS &nbsp; &nbsp; =3D 0x3c000000 | LDST_LD &lt;=
&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_STRVS &nbsp; &nbsp; =3D 0x3c000000 | LDST_ST &lt;=
&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRVS &nbsp; &nbsp; =3D 0x3c000000 | LDST_LD =
&lt;&lt; 22 | MO_UL &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_STRVS &nbsp; &nbsp; =3D 0x3c000000 | LDST_ST =
&lt;&lt; 22 | MO_UL &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRVD &nbsp; &nbsp; =3D 0x3c000000 | LDST_LD=
 &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRVD &nbsp; &nbsp; =3D 0x3c000000 | LDST_ST=
 &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>@@ -870,7 &#43;870,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TC=
GType type,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * Test all bytes 0x00 or 0xff second. &nbsp;This =
can match cases that</div>
<div>- &nbsp; &nbsp; * might otherwise take 2 or 3 insns for MO_UW or MO_32=
 below.</div>
<div>&#43; &nbsp; &nbsp; * might otherwise take 2 or 3 insns for MO_UW or M=
O_UL below.</div>
<div>&nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D imm8 =3D 0; i &lt; 8; i&#43;&#43;) {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8_t byte =3D v64 &gt;&gt; (i * 8=
);</div>
<div>@@ -908,7 &#43;908,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TC=
GType type,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_insn(s, 3606, MOVI, q, rd, 0=
, 0x8, v16 &amp; 0xff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_insn(s, 3606, ORR, q, rd, 0,=
 0xa, v16 &gt;&gt; 8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>- &nbsp; &nbsp;} else if (v64 =3D=3D dup_const(MO_32, v64)) {</div>
<div>&#43; &nbsp; &nbsp;} else if (v64 =3D=3D dup_const(MO_UL, v64)) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t v32 =3D v64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint32_t n32 =3D ~v32;</div>
<div>&nbsp;</div>
<div>@@ -1749,7 &#43;1749,7 @@ static void tcg_out_qemu_ld_direct(TCGContex=
t *s, TCGMemOp memop, TCGType ext,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ldst_r(s, I331=
2_LDRW, data_r, addr_r, otype, off_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_rev32(s, data_=
r, data_r);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, TCG_TYPE_I64=
, MO_32, data_r, data_r);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, TCG_TYPE=
_I64, MO_UL, data_r, data_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ldst_r(s, I331=
2_LDRSWX, data_r, addr_r, otype, off_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -1782,7 &#43;1782,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGMemOp memop,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ldst_r(s, I3312_STRH, data_r=
, addr_r, otype, off_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap &amp;&amp; data_r !=3D TCG=
_REG_XZR) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_rev32(s, TCG_R=
EG_TMP, data_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data_r =3D TCG_REG_TMP=
;</div>
<div>@@ -2194,7 &#43;2194,7 @@ static void tcg_out_op(TCGContext *s, TCGOpc=
ode opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext_i32_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext32s_i64:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a=
1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, TCG_TYPE_I64, MO_UL, a=
0, a1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext8u_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext8u_i32:</div>
<div>diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c</div>
<div>index 0bd400e..05560a2 100644</div>
<div>--- a/tcg/arm/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/arm/tcg-target.inc.c</div>
<div>@@ -1435,7 &#43;1435,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argreg =3D tcg_out_arg_reg16(s, argr=
eg, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argreg =3D tcg_out_arg_reg32(s, argr=
eg, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -1632,7 &#43;1632,7 @@ static inline void tcg_out_qemu_st_index(TCG=
Context *s, int cond, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st16_r(s, cond=
, datalo, addrlo, addend);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_bswap32(s, con=
d, TCG_REG_R0, datalo);</div>
<div>@@ -1677,7 &#43;1677,7 @@ static inline void tcg_out_qemu_st_direct(TC=
GContext *s, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st16_8(s, COND=
_AL, datalo, addrlo, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_bswap32(s, CON=
D_AL, TCG_REG_R0, datalo);</div>
<div>diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c</di=
v>
<div>index 31c3664..93e4c63 100644</div>
<div>--- a/tcg/i386/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/i386/tcg-target.inc.c</div>
<div>@@ -897,7 &#43;897,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCG=
Type type, unsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm(s, O=
PC_PUNPCKLWD, r, a, a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a =3D r;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FALLTHRU */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm(s, O=
PC_PSHUFD, r, 0, a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* imm8 operand: all o=
utput lanes selected from input lane 0. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out8(s, 0);</div>
<div>@@ -924,7 &#43;924,7 @@ static bool tcg_out_dupm_vec(TCGContext *s, TC=
GType type, unsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm_offs=
et(s, OPC_MOVDDUP, r, 0, base, offset);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm_offs=
et(s, OPC_VBROADCASTSS, r, 0, base, offset);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>@@ -2173,7 &#43;2173,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGReg datalo, TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_modrm_sib_offset(s, movop &#=
43; P_DATA16 &#43; seg, datalo,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; base, index, 0, ofs);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_mov(s, TCG_TYP=
E_I32, scratch, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_bswap32(s, scr=
atch);</div>
<div>@@ -2927,7 &#43;2927,7 @@ static void tcg_out_vec_op(TCGContext *s, TC=
GOpcode opc,</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_x86_blend_vec:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;insn =3D OPC_PBLENDW;<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;insn =3D (have_avx2 ? =
OPC_VPBLENDD : OPC_BLENDPS);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached()=
;</div>
<div>@@ -3292,13 &#43;3292,13 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCG=
Type type, unsigned vece)</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shrs_vec:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return vece &gt;=3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_sars_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return vece &gt;=3D MO_UW &amp;&amp; vece=
 &lt;=3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return vece &gt;=3D MO_UW &amp;&amp; =
vece &lt;=3D MO_UL;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shlv_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shrv_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return have_avx2 &amp;&amp; vece &gt;=3D =
MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return have_avx2 &amp;&amp; vece &gt;=
=3D MO_UL;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_sarv_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return have_avx2 &amp;&amp; vece =3D=3D M=
O_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return have_avx2 &amp;&amp; vece =3D=
=3D MO_UL;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_mul_vec:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_UB) {</div>
<div>@@ -3320,7 &#43;3320,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGTy=
pe type, unsigned vece)</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_umin_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_umax_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_abs_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return vece &lt;=3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return vece &lt;=3D MO_UL;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;</div>
<div>@@ -3396,9 &#43;3396,9 @@ static void expand_vec_sari(TCGType type, un=
signed vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * shift (note that th=
e ISA says shift of 32 is valid).</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t1 =3D tcg_temp_new_ve=
c(type);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_32, t1,=
 v1, imm);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_UL,=
 t1, v1, imm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_64=
, v0, v1, imm);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_4(INDEX_op_x86_blen=
d_vec, type, MO_32,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_4(INDEX_op_x86_=
blend_vec, type, MO_UL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;tcgv_vec_arg(v0), tcgv_vec_arg(v0),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;tcgv_vec_arg(t1), 0xaa);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);=
</div>
<div>@@ -3515,28 &#43;3515,28 @@ static bool expand_vec_cmp_noinv(TCGType t=
ype, unsigned vece, TCGv_vec v0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_SWAP | NEED_INV;</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case TCG_COND_LEU:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_UMIN;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_BIAS | =
NEED_INV;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case TCG_COND_GTU:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_UMIN | =
NEED_INV;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_BIAS;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case TCG_COND_GEU:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_UMAX;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_BIAS | =
NEED_SWAP | NEED_INV;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case TCG_COND_LTU:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (vece &lt;=3D MO_UL) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_UMAX | =
NEED_INV;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fixup =3D NEED_BIAS | =
NEED_SWAP;</div>
<div>diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c</di=
v>
<div>index 1780cb1..a78fe87 100644</div>
<div>--- a/tcg/mips/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/mips/tcg-target.inc.c</div>
<div>@@ -1386,7 &#43;1386,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D tcg_out_call_iarg_reg16(s, i, =
l-&gt;datalo_reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D tcg_out_call_iarg_reg(s, i, l-=
&gt;datalo_reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -1579,11 &#43;1579,11 @@ static void tcg_out_qemu_st_direct(TCGCont=
ext *s, TCGReg lo, TCGReg hi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_imm(s, OPC_SH, lo, base,=
 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;case MO_32 | MO_BSWAP:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL | MO_BSWAP:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_bswap32(s, TCG_TMP3, lo);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lo =3D TCG_TMP3;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FALLTHRU */</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_imm(s, OPC_SW, lo, base,=
 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c</div>
<div>index 852b894..835336a 100644</div>
<div>--- a/tcg/ppc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/ppc/tcg-target.inc.c</div>
<div>@@ -1714,7 &#43;1714,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp;#endif</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_mov(s, TCG_TYP=
E_I32, arg&#43;&#43;, hi);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FALLTHRU */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_mov(s, TCG_TYP=
E_I32, arg&#43;&#43;, lo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c</=
div>
<div>index 20bc19d..1905986 100644</div>
<div>--- a/tcg/riscv/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/riscv/tcg-target.inc.c</div>
<div>@@ -1222,7 &#43;1222,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGReg lo, TCGReg hi,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_store(s, OPC_SH, base, l=
o, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_store(s, OPC_SW, base, l=
o, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c</=
div>
<div>index 85550b5..ac0d3a3 100644</div>
<div>--- a/tcg/sparc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/sparc/tcg-target.inc.c</div>
<div>@@ -889,7 &#43;889,7 @@ static void emit_extend(TCGContext *s, TCGReg =
r, int op)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_arithi(s, r, r, 16, SHIFT_SL=
L);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_arithi(s, r, r, 16, SHIFT_SR=
L);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (SPARC64) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_arith(s, r, r,=
 0, SHIFT_SRL);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c</div>
<div>index da409f5..e63622c 100644</div>
<div>--- a/tcg/tcg-op-gvec.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op-gvec.c</div>
<div>@@ -310,7 &#43;310,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c=
)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0101010101010101ull * (uint=
8_t)c;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0001000100010001ull * (uint=
16_t)c;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0000000100000001ull * (uint=
32_t)c;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return c;</div>
<div>@@ -330,7 &#43;330,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i3=
2 out, TCGv_i32 in)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_i32(out, in, in, 16,=
 16);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mov_i32(out, in);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -349,7 &#43;349,7 @@ static void gen_dup_i64(unsigned vece, TCGv_i6=
4 out, TCGv_i64 in)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16u_i64(out, in);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_i64(out, out, 0x0001000=
100010001ull);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_i64(out, in, in, 32,=
 32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>@@ -443,7 &#43;443,7 @@ static void do_dup(unsigned vece, uint32_t dof=
s, uint32_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_ptr t_ptr;</div>
<div>&nbsp; &nbsp; &nbsp;uint32_t i;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;assert(vece &lt;=3D (in_32 ? MO_32 : MO_64));</div>
<div>&#43; &nbsp; &nbsp;assert(vece &lt;=3D (in_32 ? MO_UL : MO_64));</div>
<div>&nbsp; &nbsp; &nbsp;assert(in_32 =3D=3D NULL || in_64 =3D=3D NULL);</d=
iv>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* If we're storing 0, expand oprsz to maxsz. &nbs=
p;*/</div>
<div>@@ -485,7 &#43;485,7 @@ static void do_dup(unsigned vece, uint32_t dof=
s, uint32_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; use a 64-bit o=
peration unless the 32-bit operation would</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; be simple enou=
gh. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TCG_TARGET_REG_BIT=
S =3D=3D 64</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;&amp; (v=
ece !=3D MO_32 || !check_size_impl(oprsz, 4))) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;&amp=
; (vece !=3D MO_UL || !check_size_impl(oprsz, 4))) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t_64 =3D=
 tcg_temp_new_i64();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
extu_i32_i64(t_64, in_32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_dup_=
i64(vece, t_64, t_64);</div>
<div>@@ -1430,7 &#43;1430,7 @@ void tcg_gen_gvec_dup_i32(unsigned vece, uin=
t32_t dofs, uint32_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;uint32_t maxsz, TCGv_i32 in)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;check_size_align(oprsz, maxsz, dofs);</div>
<div>- &nbsp; &nbsp;tcg_debug_assert(vece &lt;=3D MO_32);</div>
<div>&#43; &nbsp; &nbsp;tcg_debug_assert(vece &lt;=3D MO_UL);</div>
<div>&nbsp; &nbsp; &nbsp;do_dup(vece, dofs, oprsz, maxsz, in, NULL, 0);</di=
v>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -1453,7 &#43;1453,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uin=
t32_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_dup_mem_vec(ve=
ce, t_vec, cpu_env, aofs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_dup_store(type, dof=
s, oprsz, maxsz, t_vec);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t_ve=
c);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece &lt;=3D MO_32) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece &lt;=3D MO_UL) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 in =3D tcg_te=
mp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>@@ -1519,7 &#43;1519,7 @@ void tcg_gen_gvec_dup32i(uint32_t dofs, uint=
32_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; uint32_t maxsz, uint32_t x)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;check_size_align(oprsz, maxsz, dofs);</div>
<div>- &nbsp; &nbsp;do_dup(MO_32, dofs, oprsz, maxsz, NULL, NULL, x);</div>
<div>&#43; &nbsp; &nbsp;do_dup(MO_UL, dofs, oprsz, maxsz, NULL, NULL, x);</=
div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_gvec_dup16i(uint32_t dofs, uint32_t oprsz,</div>
<div>@@ -1618,7 &#43;1618,7 @@ void tcg_gen_gvec_add(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_add3=
2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_add,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_add_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_add6=
4,</div>
<div>@@ -1649,7 &#43;1649,7 @@ void tcg_gen_gvec_adds(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_adds=
32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_add,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_add_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_adds=
64,</div>
<div>@@ -1690,7 &#43;1690,7 @@ void tcg_gen_gvec_subs(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_subs=
32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sub,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_sub_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_subs=
64,</div>
<div>@@ -1769,7 &#43;1769,7 @@ void tcg_gen_gvec_sub(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sub3=
2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sub,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_sub_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sub6=
4,</div>
<div>@@ -1800,7 &#43;1800,7 @@ void tcg_gen_gvec_mul(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_mul_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_mul3=
2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_mul_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_mul_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_mul6=
4,</div>
<div>@@ -1829,7 &#43;1829,7 @@ void tcg_gen_gvec_muls(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_mul_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_muls=
32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_mul_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_mul_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_muls=
64,</div>
<div>@@ -1866,7 &#43;1866,7 @@ void tcg_gen_gvec_ssadd(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ssadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ssad=
d32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ssadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ssad=
d64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1892,7 &#43;1892,7 @@ void tcg_gen_gvec_sssub(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sssub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sssu=
b32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sssub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sssu=
b64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1935,7 &#43;1935,7 @@ void tcg_gen_gvec_usadd(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_usadd_vec,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_usad=
d32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_usadd_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_usadd_vec,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_usad=
d64,</div>
<div>@@ -1979,7 &#43;1979,7 @@ void tcg_gen_gvec_ussub(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_ussub_vec,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ussu=
b32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_ussub_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_ussub_vec,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ussu=
b64,</div>
<div>@@ -2007,7 &#43;2007,7 @@ void tcg_gen_gvec_smin(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_smin_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smin=
32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_smin_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_smin_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smin=
64,</div>
<div>@@ -2035,7 &#43;2035,7 @@ void tcg_gen_gvec_umin(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_umin_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umin=
32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_umin_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_umin_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umin=
64,</div>
<div>@@ -2063,7 &#43;2063,7 @@ void tcg_gen_gvec_smax(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_smax_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smax=
32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_smax_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_smax_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smax=
64,</div>
<div>@@ -2091,7 &#43;2091,7 @@ void tcg_gen_gvec_umax(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_umax_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umax=
32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_umax_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_umax_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umax=
64,</div>
<div>@@ -2165,7 &#43;2165,7 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_neg_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_neg3=
2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_neg_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_neg_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_neg6=
4,</div>
<div>@@ -2228,7 &#43;2228,7 @@ void tcg_gen_gvec_abs(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_abs_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_abs3=
2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_abs_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_abs_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_abs6=
4,</div>
<div>@@ -2485,7 &#43;2485,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shli_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl3=
2i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_shli_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shli_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl6=
4i,</div>
<div>@@ -2536,7 &#43;2536,7 @@ void tcg_gen_gvec_shri(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shri_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr3=
2i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_shri_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shri_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr6=
4i,</div>
<div>@@ -2601,7 &#43;2601,7 @@ void tcg_gen_gvec_sari(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sari_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar3=
2i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_sari_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sari_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar6=
4i,</div>
<div>@@ -2736,7 &#43;2736,7 @@ do_gvec_shifts(unsigned vece, uint32_t dofs,=
 uint32_t aofs, TCGv_i32 shift,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Otherwise fall back to integral... */</div>
<div>- &nbsp; &nbsp;if (vece =3D=3D MO_32 &amp;&amp; check_size_impl(oprsz,=
 4)) {</div>
<div>&#43; &nbsp; &nbsp;if (vece =3D=3D MO_UL &amp;&amp; check_size_impl(op=
rsz, 4)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;expand_2s_i32(dofs, aofs, oprsz, shi=
ft, false, g-&gt;fni4);</div>
<div>&nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_64 &amp;&amp; check_size=
_impl(oprsz, 8)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 sh64 =3D tcg_temp_new_i64()=
;</div>
<div>@@ -2889,7 &#43;2889,7 @@ void tcg_gen_gvec_shlv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shlv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl3=
2v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_shl_mod_i64,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shlv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl6=
4v,</div>
<div>@@ -2952,7 &#43;2952,7 @@ void tcg_gen_gvec_shrv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shrv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr3=
2v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_shr_mod_i64,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shrv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr6=
4v,</div>
<div>@@ -3015,7 &#43;3015,7 @@ void tcg_gen_gvec_sarv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sarv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar3=
2v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_32 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UL },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_sar_mod_i64,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sarv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar6=
4v,</div>
<div>@@ -3168,7 &#43;3168,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned=
 vece, uint32_t dofs,</div>
<div>&nbsp; &nbsp; &nbsp;case 0:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_64 &amp;&amp; che=
ck_size_impl(oprsz, 8)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;expand_cmp_i64(dofs, a=
ofs, bofs, oprsz, cond);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_32 &amp;&amp; c=
heck_size_impl(oprsz, 4)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_UL &amp;&am=
p; check_size_impl(oprsz, 4)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;expand_cmp_i32(dofs, a=
ofs, bofs, oprsz, cond);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_gvec_3 * co=
nst *fn =3D fns[cond];</div>
<div>diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c</div>
<div>index b0a4d98..ff723ab 100644</div>
<div>--- a/tcg/tcg-op-vec.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op-vec.c</div>
<div>@@ -216,7 &#43;216,7 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)</=
div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-#define MO_REG &nbsp;(TCG_TARGET_REG_BITS =3D=3D 64 ? MO_64 : MO_32)<=
/div>
<div>&#43;#define MO_REG &nbsp;(TCG_TARGET_REG_BITS =3D=3D 64 ? MO_64 : MO_=
UL)</div>
<div>&nbsp;</div>
<div>&nbsp;static void do_dupi_vec(TCGv_vec r, unsigned vece, TCGArg a)</di=
v>
<div>&nbsp;{</div>
<div>@@ -253,7 &#43;253,7 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec =
m)</div>
<div>&nbsp;void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (TCG_TARGET_REG_BITS =3D=3D 32 &amp;&amp; a =3D=
=3D deposit64(a, 32, 32, a)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;do_dupi_vec(r, MO_32, a);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;do_dupi_vec(r, MO_UL, a);</div>
<div>&nbsp; &nbsp; &nbsp;} else if (TCG_TARGET_REG_BITS =3D=3D 64 || a =3D=
=3D (uint64_t)(int32_t)a) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_dupi_vec(r, MO_64, a);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -265,7 &#43;265,7 @@ void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a=
)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;do_dupi_vec(r, MO_REG, dup_const(MO_32, a));</div>
<div>&#43; &nbsp; &nbsp;do_dupi_vec(r, MO_REG, dup_const(MO_UL, a));</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)</div>
<div>diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c</div>
<div>index 21d448c..447683d 100644</div>
<div>--- a/tcg/tcg-op.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op.c</div>
<div>@@ -2725,7 &#43;2725,7 @@ static inline TCGMemOp tcg_canonicalize_memo=
p(TCGMemOp op, bool is64, bool st)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!is64) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op &amp;=3D ~MO_SIGN;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -2816,7 &#43;2816,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16s_i32(val, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap32_i32(va=
l, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -2841,7 &#43;2841,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16u_i32(swa=
p, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap16_i32(sw=
ap, swap);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap32_i32(sw=
ap, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -2896,7 &#43;2896,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16s_i64(val, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap32_i64(va=
l, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (orig_memop &amp; M=
O_SIGN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext32s_i64(val, val);</div>
<div>@@ -2932,7 &#43;2932,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16u_i64(swa=
p, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap16_i64(sw=
ap, swap);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UL:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext32u_i64(swa=
p, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap32_i64(sw=
ap, swap);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -3027,8 &#43;3027,8 @@ static void * const table_cmpxchg[16] =3D {<=
/div>
<div>&nbsp; &nbsp; &nbsp;[MO_UB] =3D gen_helper_atomic_cmpxchgb,</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UW | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,=
</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UW | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,=
</div>
<div>- &nbsp; &nbsp;[MO_32 | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,</div=
>
<div>- &nbsp; &nbsp;[MO_32 | MO_BE] =3D gen_helper_atomic_cmpxchgl_be,</div=
>
<div>&#43; &nbsp; &nbsp;[MO_UL | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,<=
/div>
<div>&#43; &nbsp; &nbsp;[MO_UL | MO_BE] =3D gen_helper_atomic_cmpxchgl_be,<=
/div>
<div>&nbsp; &nbsp; &nbsp;WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomi=
c_cmpxchgq_le)</div>
<div>&nbsp; &nbsp; &nbsp;WITH_ATOMIC64([MO_64 | MO_BE] =3D gen_helper_atomi=
c_cmpxchgq_be)</div>
<div>&nbsp;};</div>
<div>@@ -3251,8 &#43;3251,8 @@ static void * const table_##NAME[16] =3D { &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UB] =3D gen_helper_atomic_##NAME##b, &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UW | MO_LE] =3D gen_helper_atomic_##NAME##w_le=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UW | MO_BE] =3D gen_helper_atomic_##NAME##w_be=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>- &nbsp; &nbsp;[MO_32 | MO_LE] =3D gen_helper_atomic_##NAME##l_le, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>- &nbsp; &nbsp;[MO_32 | MO_BE] =3D gen_helper_atomic_##NAME##l_be, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&#43; &nbsp; &nbsp;[MO_UL | MO_LE] =3D gen_helper_atomic_##NAME##l_le,=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&#43; &nbsp; &nbsp;[MO_UL | MO_BE] =3D gen_helper_atomic_##NAME##l_be,=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomi=
c_##NAME##q_le) &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;WITH_ATOMIC64([MO_64 | MO_BE] =3D gen_helper_atomi=
c_##NAME##q_be) &nbsp; &nbsp; \</div>
<div>&nbsp;}; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index a378887..4b6ee89 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -1304,7 &#43;1304,7 @@ uint64_t dup_const(unsigned vece, uint64_t c=
);</div>
<div>&nbsp; &nbsp; &nbsp;(__builtin_constant_p(VECE) &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; ? &nbsp; ((VECE) =3D=3D MO_UB ? 0x010101010101010=
1ull * (uint8_t)(C) &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_UW ? 0x0001000100=
010001ull * (uint16_t)(C) &nbsp;\</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_32 ? 0x000000010000000=
1ull * (uint32_t)(C) &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_UL ? 0x00000001000=
00001ull * (uint32_t)(C) &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: dup_const(VECE, C)) &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; : dup_const(VECE, C))</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381010564428725btcom_--

