Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpaZs-0000VV-Ft
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51727)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaQU-0001aS-Vm
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaQK-00019T-Ic
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:40:34 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:39577)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaQJ-00017n-1w; Mon, 22 Jul 2019 11:40:24 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 16:40:04 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:40:18 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:40:18 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v2 02/20] tcg: Replace MO_16 with MO_UW alias
Thread-Index: AQHVQKPDyJRtmfK8Wku9MyQfdwKCPw==
Date: Mon, 22 Jul 2019 15:40:17 +0000
Message-ID: <1563810016433.48708@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156381001643348708btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:50:10 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 02/20] tcg: Replace MO_16 with
 MO_UW alias
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
X-List-Received-Date: Mon, 22 Jul 2019 15:40:45 -0000

--_000_156381001643348708btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for splitting MO_16 out from TCGMemOp into new accelerator
independent MemOp.

As MO_16 will be a value of MemOp, existing TCGMemOp comparisons and
coercions will trigger -Wenum-compare and -Wenum-conversion.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/arm/sve_helper.c             |   4 +-
 target/arm/translate-a64.c          |  90 ++++++++--------
 target/arm/translate-sve.c          |  40 ++++----
 target/arm/translate-vfp.inc.c      |   2 +-
 target/arm/translate.c              |  32 +++---
 target/i386/translate.c             | 200 ++++++++++++++++++--------------=
----
 target/mips/translate.c             |   2 +-
 target/ppc/translate/vmx-impl.inc.c |  28 ++---
 target/s390x/translate_vx.inc.c     |   2 +-
 target/s390x/vec.h                  |   4 +-
 tcg/aarch64/tcg-target.inc.c        |  20 ++--
 tcg/arm/tcg-target.inc.c            |   6 +-
 tcg/i386/tcg-target.inc.c           |  48 ++++-----
 tcg/mips/tcg-target.inc.c           |   6 +-
 tcg/riscv/tcg-target.inc.c          |   4 +-
 tcg/sparc/tcg-target.inc.c          |   2 +-
 tcg/tcg-op-gvec.c                   |  72 ++++++-------
 tcg/tcg-op-vec.c                    |   2 +-
 tcg/tcg-op.c                        |  18 ++--
 tcg/tcg.h                           |   2 +-
 20 files changed, 292 insertions(+), 292 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4c7e11f..f6bef3d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1546,7 +1546,7 @@ void HELPER(sve_cpy_m_h)(void *vd, void *vn, void *vg=
,
     uint64_t *d =3D vd, *n =3D vn;
     uint8_t *pg =3D vg;

-    mm =3D dup_const(MO_16, mm);
+    mm =3D dup_const(MO_UW, mm);
     for (i =3D 0; i < opr_sz; i +=3D 1) {
         uint64_t nn =3D n[i];
         uint64_t pp =3D expand_pred_h(pg[H1(i)]);
@@ -1600,7 +1600,7 @@ void HELPER(sve_cpy_z_h)(void *vd, void *vg, uint64_t=
 val, uint32_t desc)
     uint64_t *d =3D vd;
     uint8_t *pg =3D vg;

-    val =3D dup_const(MO_16, val);
+    val =3D dup_const(MO_UW, val);
     for (i =3D 0; i < opr_sz; i +=3D 1) {
         d[i] =3D val & expand_pred_h(pg[H1(i)]);
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f840b43..3acfccb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -492,7 +492,7 @@ static TCGv_i32 read_fp_hreg(DisasContext *s, int reg)
 {
     TCGv_i32 v =3D tcg_temp_new_i32();

-    tcg_gen_ld16u_i32(v, cpu_env, fp_reg_offset(s, reg, MO_16));
+    tcg_gen_ld16u_i32(v, cpu_env, fp_reg_offset(s, reg, MO_UW));
     return v;
 }

@@ -996,7 +996,7 @@ static void read_vec_element(DisasContext *s, TCGv_i64 =
tcg_dest, int srcidx,
     case MO_UB:
         tcg_gen_ld8u_i64(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_ld16u_i64(tcg_dest, cpu_env, vect_off);
         break;
     case MO_32:
@@ -1005,7 +1005,7 @@ static void read_vec_element(DisasContext *s, TCGv_i6=
4 tcg_dest, int srcidx,
     case MO_SB:
         tcg_gen_ld8s_i64(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_16|MO_SIGN:
+    case MO_SW:
         tcg_gen_ld16s_i64(tcg_dest, cpu_env, vect_off);
         break;
     case MO_32|MO_SIGN:
@@ -1028,13 +1028,13 @@ static void read_vec_element_i32(DisasContext *s, T=
CGv_i32 tcg_dest, int srcidx,
     case MO_UB:
         tcg_gen_ld8u_i32(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_ld16u_i32(tcg_dest, cpu_env, vect_off);
         break;
     case MO_SB:
         tcg_gen_ld8s_i32(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_16|MO_SIGN:
+    case MO_SW:
         tcg_gen_ld16s_i32(tcg_dest, cpu_env, vect_off);
         break;
     case MO_32:
@@ -1055,7 +1055,7 @@ static void write_vec_element(DisasContext *s, TCGv_i=
64 tcg_src, int destidx,
     case MO_UB:
         tcg_gen_st8_i64(tcg_src, cpu_env, vect_off);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_st16_i64(tcg_src, cpu_env, vect_off);
         break;
     case MO_32:
@@ -1077,7 +1077,7 @@ static void write_vec_element_i32(DisasContext *s, TC=
Gv_i32 tcg_src,
     case MO_UB:
         tcg_gen_st8_i32(tcg_src, cpu_env, vect_off);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_st16_i32(tcg_src, cpu_env, vect_off);
         break;
     case MO_32:
@@ -5269,7 +5269,7 @@ static void handle_fp_compare(DisasContext *s, int si=
ze,
                               bool cmp_with_zero, bool signal_all_nans)
 {
     TCGv_i64 tcg_flags =3D tcg_temp_new_i64();
-    TCGv_ptr fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);
+    TCGv_ptr fpst =3D get_fpstatus_ptr(size =3D=3D MO_UW);

     if (size =3D=3D MO_64) {
         TCGv_i64 tcg_vn, tcg_vm;
@@ -5306,7 +5306,7 @@ static void handle_fp_compare(DisasContext *s, int si=
ze,
                 gen_helper_vfp_cmps_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
             }
             break;
-        case MO_16:
+        case MO_UW:
             if (signal_all_nans) {
                 gen_helper_vfp_cmpeh_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
             } else {
@@ -5360,7 +5360,7 @@ static void disas_fp_compare(DisasContext *s, uint32_=
t insn)
         size =3D MO_64;
         break;
     case 3:
-        size =3D MO_16;
+        size =3D MO_UW;
         if (dc_isar_feature(aa64_fp16, s)) {
             break;
         }
@@ -5411,7 +5411,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t =
insn)
         size =3D MO_64;
         break;
     case 3:
-        size =3D MO_16;
+        size =3D MO_UW;
         if (dc_isar_feature(aa64_fp16, s)) {
             break;
         }
@@ -5477,7 +5477,7 @@ static void disas_fp_csel(DisasContext *s, uint32_t i=
nsn)
         sz =3D MO_64;
         break;
     case 3:
-        sz =3D MO_16;
+        sz =3D MO_UW;
         if (dc_isar_feature(aa64_fp16, s)) {
             break;
         }
@@ -6282,7 +6282,7 @@ static void disas_fp_imm(DisasContext *s, uint32_t in=
sn)
         sz =3D MO_64;
         break;
     case 3:
-        sz =3D MO_16;
+        sz =3D MO_UW;
         if (dc_isar_feature(aa64_fp16, s)) {
             break;
         }
@@ -6593,7 +6593,7 @@ static void handle_fmov(DisasContext *s, int rd, int =
rn, int type, bool itof)
             break;
         case 3:
             /* 16 bit */
-            tcg_gen_ld16u_i64(tcg_rd, cpu_env, fp_reg_offset(s, rn, MO_16)=
);
+            tcg_gen_ld16u_i64(tcg_rd, cpu_env, fp_reg_offset(s, rn, MO_UW)=
);
             break;
         default:
             g_assert_not_reached();
@@ -7030,7 +7030,7 @@ static TCGv_i32 do_reduction_op(DisasContext *s, int =
fpopcode, int rn,
 {
     if (esize =3D=3D size) {
         int element;
-        TCGMemOp msize =3D esize =3D=3D 16 ? MO_16 : MO_32;
+        TCGMemOp msize =3D esize =3D=3D 16 ? MO_UW : MO_32;
         TCGv_i32 tcg_elem;

         /* We should have one register left here */
@@ -7204,7 +7204,7 @@ static void disas_simd_across_lanes(DisasContext *s, =
uint32_t insn)
          * Note that correct NaN propagation requires that we do these
          * operations in exactly the order specified by the pseudocode.
          */
-        TCGv_ptr fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);
+        TCGv_ptr fpst =3D get_fpstatus_ptr(size =3D=3D MO_UW);
         int fpopcode =3D opcode | is_min << 4 | is_u << 5;
         int vmap =3D (1 << elements) - 1;
         TCGv_i32 tcg_res32 =3D do_reduction_op(s, fpopcode, rn, esize,
@@ -7591,7 +7591,7 @@ static void disas_simd_mod_imm(DisasContext *s, uint3=
2_t insn)
             } else {
                 if (o2) {
                     /* FMOV (vector, immediate) - half-precision */
-                    imm =3D vfp_expand_imm(MO_16, abcdefgh);
+                    imm =3D vfp_expand_imm(MO_UW, abcdefgh);
                     /* now duplicate across the lanes */
                     imm =3D bitfield_replicate(imm, 16);
                 } else {
@@ -7699,7 +7699,7 @@ static void disas_simd_scalar_pairwise(DisasContext *=
s, uint32_t insn)
                 unallocated_encoding(s);
                 return;
             } else {
-                size =3D MO_16;
+                size =3D MO_UW;
             }
         } else {
             size =3D extract32(size, 0, 1) ? MO_64 : MO_32;
@@ -7709,7 +7709,7 @@ static void disas_simd_scalar_pairwise(DisasContext *=
s, uint32_t insn)
             return;
         }

-        fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);
+        fpst =3D get_fpstatus_ptr(size =3D=3D MO_UW);
         break;
     default:
         unallocated_encoding(s);
@@ -7760,7 +7760,7 @@ static void disas_simd_scalar_pairwise(DisasContext *=
s, uint32_t insn)
         read_vec_element_i32(s, tcg_op1, rn, 0, size);
         read_vec_element_i32(s, tcg_op2, rn, 1, size);

-        if (size =3D=3D MO_16) {
+        if (size =3D=3D MO_UW) {
             switch (opcode) {
             case 0xc: /* FMAXNMP */
                 gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst=
);
@@ -8222,7 +8222,7 @@ static void handle_simd_intfp_conv(DisasContext *s, i=
nt rd, int rn,
                                    int elements, int is_signed,
                                    int fracbits, int size)
 {
-    TCGv_ptr tcg_fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);
+    TCGv_ptr tcg_fpst =3D get_fpstatus_ptr(size =3D=3D MO_UW);
     TCGv_i32 tcg_shift =3D NULL;

     TCGMemOp mop =3D size | (is_signed ? MO_SIGN : 0);
@@ -8281,7 +8281,7 @@ static void handle_simd_intfp_conv(DisasContext *s, i=
nt rd, int rn,
                     }
                 }
                 break;
-            case MO_16:
+            case MO_UW:
                 if (fracbits) {
                     if (is_signed) {
                         gen_helper_vfp_sltoh(tcg_float, tcg_int32,
@@ -8339,7 +8339,7 @@ static void handle_simd_shift_intfp_conv(DisasContext=
 *s, bool is_scalar,
     } else if (immh & 4) {
         size =3D MO_32;
     } else if (immh & 2) {
-        size =3D MO_16;
+        size =3D MO_UW;
         if (!dc_isar_feature(aa64_fp16, s)) {
             unallocated_encoding(s);
             return;
@@ -8384,7 +8384,7 @@ static void handle_simd_shift_fpint_conv(DisasContext=
 *s, bool is_scalar,
     } else if (immh & 0x4) {
         size =3D MO_32;
     } else if (immh & 0x2) {
-        size =3D MO_16;
+        size =3D MO_UW;
         if (!dc_isar_feature(aa64_fp16, s)) {
             unallocated_encoding(s);
             return;
@@ -8403,7 +8403,7 @@ static void handle_simd_shift_fpint_conv(DisasContext=
 *s, bool is_scalar,
     assert(!(is_scalar && is_q));

     tcg_rmode =3D tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    tcg_fpstatus =3D get_fpstatus_ptr(size =3D=3D MO_16);
+    tcg_fpstatus =3D get_fpstatus_ptr(size =3D=3D MO_UW);
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     fracbits =3D (16 << size) - immhb;
     tcg_shift =3D tcg_const_i32(fracbits);
@@ -8429,7 +8429,7 @@ static void handle_simd_shift_fpint_conv(DisasContext=
 *s, bool is_scalar,
         int maxpass =3D is_scalar ? 1 : ((8 << is_q) >> size);

         switch (size) {
-        case MO_16:
+        case MO_UW:
             if (is_u) {
                 fn =3D gen_helper_vfp_touhh;
             } else {
@@ -9388,7 +9388,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, i=
nt opcode,
         return;
     }

-    fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);
+    fpst =3D get_fpstatus_ptr(size =3D=3D MO_UW);

     if (is_double) {
         TCGv_i64 tcg_op =3D tcg_temp_new_i64();
@@ -9440,7 +9440,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, i=
nt opcode,
         bool swap =3D false;
         int pass, maxpasses;

-        if (size =3D=3D MO_16) {
+        if (size =3D=3D MO_UW) {
             switch (opcode) {
             case 0x2e: /* FCMLT (zero) */
                 swap =3D true;
@@ -11422,8 +11422,8 @@ static void disas_simd_three_reg_same_fp16(DisasCon=
text *s, uint32_t insn)
             int passreg =3D pass < (maxpass / 2) ? rn : rm;
             int passelt =3D (pass << 1) & (maxpass - 1);

-            read_vec_element_i32(s, tcg_op1, passreg, passelt, MO_16);
-            read_vec_element_i32(s, tcg_op2, passreg, passelt + 1, MO_16);
+            read_vec_element_i32(s, tcg_op1, passreg, passelt, MO_UW);
+            read_vec_element_i32(s, tcg_op2, passreg, passelt + 1, MO_UW);
             tcg_res[pass] =3D tcg_temp_new_i32();

             switch (fpopcode) {
@@ -11450,7 +11450,7 @@ static void disas_simd_three_reg_same_fp16(DisasCon=
text *s, uint32_t insn)
         }

         for (pass =3D 0; pass < maxpass; pass++) {
-            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_16);
+            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_UW);
             tcg_temp_free_i32(tcg_res[pass]);
         }

@@ -11463,15 +11463,15 @@ static void disas_simd_three_reg_same_fp16(DisasC=
ontext *s, uint32_t insn)
             TCGv_i32 tcg_op2 =3D tcg_temp_new_i32();
             TCGv_i32 tcg_res =3D tcg_temp_new_i32();

-            read_vec_element_i32(s, tcg_op1, rn, pass, MO_16);
-            read_vec_element_i32(s, tcg_op2, rm, pass, MO_16);
+            read_vec_element_i32(s, tcg_op1, rn, pass, MO_UW);
+            read_vec_element_i32(s, tcg_op2, rm, pass, MO_UW);

             switch (fpopcode) {
             case 0x0: /* FMAXNM */
                 gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst=
);
                 break;
             case 0x1: /* FMLA */
-                read_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+                read_vec_element_i32(s, tcg_res, rd, pass, MO_UW);
                 gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_=
res,
                                            fpst);
                 break;
@@ -11496,7 +11496,7 @@ static void disas_simd_three_reg_same_fp16(DisasCon=
text *s, uint32_t insn)
             case 0x9: /* FMLS */
                 /* As usual for ARM, separate negation for fused multiply-=
add */
                 tcg_gen_xori_i32(tcg_op1, tcg_op1, 0x8000);
-                read_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+                read_vec_element_i32(s, tcg_res, rd, pass, MO_UW);
                 gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_=
res,
                                            fpst);
                 break;
@@ -11537,7 +11537,7 @@ static void disas_simd_three_reg_same_fp16(DisasCon=
text *s, uint32_t insn)
                 g_assert_not_reached();
             }

-            write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+            write_vec_element_i32(s, tcg_res, rd, pass, MO_UW);
             tcg_temp_free_i32(tcg_res);
             tcg_temp_free_i32(tcg_op1);
             tcg_temp_free_i32(tcg_op2);
@@ -11727,7 +11727,7 @@ static void handle_2misc_widening(DisasContext *s, =
int opcode, bool is_q,
         for (pass =3D 0; pass < 4; pass++) {
             tcg_res[pass] =3D tcg_temp_new_i32();

-            read_vec_element_i32(s, tcg_res[pass], rn, srcelt + pass, MO_1=
6);
+            read_vec_element_i32(s, tcg_res[pass], rn, srcelt + pass, MO_U=
W);
             gen_helper_vfp_fcvt_f16_to_f32(tcg_res[pass], tcg_res[pass],
                                            fpst, ahp);
         }
@@ -11768,7 +11768,7 @@ static void handle_rev(DisasContext *s, int opcode,=
 bool u,

             read_vec_element(s, tcg_tmp, rn, i, grp_size);
             switch (grp_size) {
-            case MO_16:
+            case MO_UW:
                 tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
                 break;
             case MO_32:
@@ -12499,7 +12499,7 @@ static void disas_simd_two_reg_misc_fp16(DisasConte=
xt *s, uint32_t insn)
         if (!fp_access_check(s)) {
             return;
         }
-        handle_simd_intfp_conv(s, rd, rn, elements, !u, 0, MO_16);
+        handle_simd_intfp_conv(s, rd, rn, elements, !u, 0, MO_UW);
         return;
     }
     break;
@@ -12508,7 +12508,7 @@ static void disas_simd_two_reg_misc_fp16(DisasConte=
xt *s, uint32_t insn)
     case 0x2e: /* FCMLT (zero) */
     case 0x6c: /* FCMGE (zero) */
     case 0x6d: /* FCMLE (zero) */
-        handle_2misc_fcmp_zero(s, fpop, is_scalar, 0, is_q, MO_16, rn, rd)=
;
+        handle_2misc_fcmp_zero(s, fpop, is_scalar, 0, is_q, MO_UW, rn, rd)=
;
         return;
     case 0x3d: /* FRECPE */
     case 0x3f: /* FRECPX */
@@ -12668,7 +12668,7 @@ static void disas_simd_two_reg_misc_fp16(DisasConte=
xt *s, uint32_t insn)
             TCGv_i32 tcg_op =3D tcg_temp_new_i32();
             TCGv_i32 tcg_res =3D tcg_temp_new_i32();

-            read_vec_element_i32(s, tcg_op, rn, pass, MO_16);
+            read_vec_element_i32(s, tcg_op, rn, pass, MO_UW);

             switch (fpop) {
             case 0x1a: /* FCVTNS */
@@ -12715,7 +12715,7 @@ static void disas_simd_two_reg_misc_fp16(DisasConte=
xt *s, uint32_t insn)
                 g_assert_not_reached();
             }

-            write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+            write_vec_element_i32(s, tcg_res, rd, pass, MO_UW);

             tcg_temp_free_i32(tcg_res);
             tcg_temp_free_i32(tcg_op);
@@ -12839,7 +12839,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
             unallocated_encoding(s);
             return;
         }
-        size =3D MO_16;
+        size =3D MO_UW;
         /* is_fp, but we pass cpu_env not fp_status.  */
         break;
     default:
@@ -12852,7 +12852,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)
         /* convert insn encoded size to TCGMemOp size */
         switch (size) {
         case 0: /* half-precision */
-            size =3D MO_16;
+            size =3D MO_UW;
             is_fp16 =3D true;
             break;
         case MO_32: /* single precision */
@@ -12899,7 +12899,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)

     /* Given TCGMemOp size, adjust register and indexing.  */
     switch (size) {
-    case MO_16:
+    case MO_UW:
         index =3D h << 2 | l << 1 | m;
         break;
     case MO_32:
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ec5fb11..2bc1bd1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1679,7 +1679,7 @@ static void do_sat_addsub_vec(DisasContext *s, int es=
z, int rd, int rn,
         tcg_temp_free_i32(t32);
         break;

-    case MO_16:
+    case MO_UW:
         t32 =3D tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(t32, val);
         if (d) {
@@ -3314,7 +3314,7 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_e=
sz *a)
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_sve_subri_h,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16,
+          .vece =3D MO_UW,
           .scalar_first =3D true },
         { .fni4 =3D tcg_gen_sub_i32,
           .fniv =3D tcg_gen_sub_vec,
@@ -3468,7 +3468,7 @@ static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA=
_zzxz *a)

     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -3494,7 +3494,7 @@ static bool trans_FMUL_zzx(DisasContext *s, arg_FMUL_=
zzx *a)

     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -3526,7 +3526,7 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a=
,

     tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
-    status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+    status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);

     fn(temp, t_zn, t_pg, status, t_desc);
     tcg_temp_free_ptr(t_zn);
@@ -3568,7 +3568,7 @@ DO_VPZ(FMAXV, fmaxv)
 static void do_zz_fp(DisasContext *s, arg_rr_esz *a, gen_helper_gvec_2_ptr=
 *fn)
 {
     unsigned vsz =3D vec_full_reg_size(s);
-    TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+    TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);

     tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
                        vec_full_reg_offset(s, a->rn),
@@ -3616,7 +3616,7 @@ static void do_ppz_fp(DisasContext *s, arg_rpr_esz *a=
,
                       gen_helper_gvec_3_ptr *fn)
 {
     unsigned vsz =3D vec_full_reg_size(s);
-    TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+    TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);

     tcg_gen_gvec_3_ptr(pred_full_reg_offset(s, a->rd),
                        vec_full_reg_offset(s, a->rn),
@@ -3668,7 +3668,7 @@ static bool trans_FTMAD(DisasContext *s, arg_FTMAD *a=
)
     }
     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -3708,7 +3708,7 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz=
 *a)
     t_pg =3D tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_rm, cpu_env, vec_full_reg_offset(s, a->rm));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
-    t_fpst =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+    t_fpst =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
     t_desc =3D tcg_const_i32(simd_desc(vsz, vsz, 0));

     fns[a->esz - 1](t_val, t_val, t_rm, t_pg, t_fpst, t_desc);
@@ -3735,7 +3735,7 @@ static bool do_zzz_fp(DisasContext *s, arg_rrr_esz *a=
,
     }
     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -3777,7 +3777,7 @@ static bool do_zpzz_fp(DisasContext *s, arg_rprr_esz =
*a,
     }
     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -3844,7 +3844,7 @@ static void do_fp_imm(DisasContext *s, arg_rpri_esz *=
a, uint64_t imm,
                       gen_helper_sve_fp2scalar *fn)
 {
     TCGv_i64 temp =3D tcg_const_i64(imm);
-    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_16, temp, fn);
+    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_UW, temp, fn);
     tcg_temp_free_i64(temp);
 }

@@ -3893,7 +3893,7 @@ static bool do_fp_cmp(DisasContext *s, arg_rprr_esz *=
a,
     }
     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_4_ptr(pred_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -3937,7 +3937,7 @@ static bool trans_FCADD(DisasContext *s, arg_FCADD *a=
)
     }
     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -4044,7 +4044,7 @@ static bool trans_FCMLA_zzxz(DisasContext *s, arg_FCM=
LA_zzxz *a)
     tcg_debug_assert(a->rd =3D=3D a->ra);
     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
@@ -4186,7 +4186,7 @@ static bool trans_FRINTI(DisasContext *s, arg_rpr_esz=
 *a)
     if (a->esz =3D=3D 0) {
         return false;
     }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_16,
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_UW,
                       frint_fns[a->esz - 1]);
 }

@@ -4200,7 +4200,7 @@ static bool trans_FRINTX(DisasContext *s, arg_rpr_esz=
 *a)
     if (a->esz =3D=3D 0) {
         return false;
     }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_16, fns[a->=
esz - 1]);
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_UW, fns[a->=
esz - 1]);
 }

 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
@@ -4211,7 +4211,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_es=
z *a, int mode)
     if (sve_access_check(s)) {
         unsigned vsz =3D vec_full_reg_size(s);
         TCGv_i32 tmode =3D tcg_const_i32(mode);
-        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_16);
+        TCGv_ptr status =3D get_fpstatus_ptr(a->esz =3D=3D MO_UW);

         gen_helper_set_rmode(tmode, tmode, status);

@@ -4262,7 +4262,7 @@ static bool trans_FRECPX(DisasContext *s, arg_rpr_esz=
 *a)
     if (a->esz =3D=3D 0) {
         return false;
     }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_16, fns[a->=
esz - 1]);
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_UW, fns[a->=
esz - 1]);
 }

 static bool trans_FSQRT(DisasContext *s, arg_rpr_esz *a)
@@ -4275,7 +4275,7 @@ static bool trans_FSQRT(DisasContext *s, arg_rpr_esz =
*a)
     if (a->esz =3D=3D 0) {
         return false;
     }
-    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_16, fns[a->=
esz - 1]);
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz =3D=3D MO_UW, fns[a->=
esz - 1]);
 }

 static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a)
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.=
c
index 092eb5e..549874c 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -52,7 +52,7 @@ uint64_t vfp_expand_imm(int size, uint8_t imm8)
             (extract32(imm8, 0, 6) << 3);
         imm <<=3D 16;
         break;
-    case MO_16:
+    case MO_UW:
         imm =3D (extract32(imm8, 7, 1) ? 0x8000 : 0) |
             (extract32(imm8, 6, 1) ? 0x3000 : 0x4000) |
             (extract32(imm8, 0, 6) << 6);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 39266cf..8d10922 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1477,7 +1477,7 @@ static void neon_store_element(int reg, int ele, TCGM=
emOp size, TCGv_i32 var)
     case MO_UB:
         tcg_gen_st8_i32(var, cpu_env, offset);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_st16_i32(var, cpu_env, offset);
         break;
     case MO_32:
@@ -1496,7 +1496,7 @@ static void neon_store_element64(int reg, int ele, TC=
GMemOp size, TCGv_i64 var)
     case MO_UB:
         tcg_gen_st8_i64(var, cpu_env, offset);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_st16_i64(var, cpu_env, offset);
         break;
     case MO_32:
@@ -4267,7 +4267,7 @@ const GVecGen2i ssra_op[4] =3D {
       .fniv =3D gen_ssra_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_ssra,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fni4 =3D gen_ssra32_i32,
       .fniv =3D gen_ssra_vec,
       .load_dest =3D true,
@@ -4325,7 +4325,7 @@ const GVecGen2i usra_op[4] =3D {
       .fniv =3D gen_usra_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_usra,
-      .vece =3D MO_16, },
+      .vece =3D MO_UW, },
     { .fni4 =3D gen_usra32_i32,
       .fniv =3D gen_usra_vec,
       .load_dest =3D true,
@@ -4353,7 +4353,7 @@ static void gen_shr8_ins_i64(TCGv_i64 d, TCGv_i64 a, =
int64_t shift)

 static void gen_shr16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
-    uint64_t mask =3D dup_const(MO_16, 0xffff >> shift);
+    uint64_t mask =3D dup_const(MO_UW, 0xffff >> shift);
     TCGv_i64 t =3D tcg_temp_new_i64();

     tcg_gen_shri_i64(t, a, shift);
@@ -4405,7 +4405,7 @@ const GVecGen2i sri_op[4] =3D {
       .fniv =3D gen_shr_ins_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_sri,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fni4 =3D gen_shr32_ins_i32,
       .fniv =3D gen_shr_ins_vec,
       .load_dest =3D true,
@@ -4433,7 +4433,7 @@ static void gen_shl8_ins_i64(TCGv_i64 d, TCGv_i64 a, =
int64_t shift)

 static void gen_shl16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
-    uint64_t mask =3D dup_const(MO_16, 0xffff << shift);
+    uint64_t mask =3D dup_const(MO_UW, 0xffff << shift);
     TCGv_i64 t =3D tcg_temp_new_i64();

     tcg_gen_shli_i64(t, a, shift);
@@ -4483,7 +4483,7 @@ const GVecGen2i sli_op[4] =3D {
       .fniv =3D gen_shl_ins_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_sli,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fni4 =3D gen_shl32_ins_i32,
       .fniv =3D gen_shl_ins_vec,
       .load_dest =3D true,
@@ -4579,7 +4579,7 @@ const GVecGen3 mla_op[4] =3D {
       .fniv =3D gen_mla_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_mla,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fni4 =3D gen_mla32_i32,
       .fniv =3D gen_mla_vec,
       .load_dest =3D true,
@@ -4603,7 +4603,7 @@ const GVecGen3 mls_op[4] =3D {
       .fniv =3D gen_mls_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_mls,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fni4 =3D gen_mls32_i32,
       .fniv =3D gen_mls_vec,
       .load_dest =3D true,
@@ -4649,7 +4649,7 @@ const GVecGen3 cmtst_op[4] =3D {
     { .fni4 =3D gen_helper_neon_tst_u16,
       .fniv =3D gen_cmtst_vec,
       .opt_opc =3D vecop_list_cmtst,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fni4 =3D gen_cmtst_i32,
       .fniv =3D gen_cmtst_vec,
       .opt_opc =3D vecop_list_cmtst,
@@ -4686,7 +4686,7 @@ const GVecGen4 uqadd_op[4] =3D {
       .fno =3D gen_helper_gvec_uqadd_h,
       .write_aofs =3D true,
       .opt_opc =3D vecop_list_uqadd,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fniv =3D gen_uqadd_vec,
       .fno =3D gen_helper_gvec_uqadd_s,
       .write_aofs =3D true,
@@ -4724,7 +4724,7 @@ const GVecGen4 sqadd_op[4] =3D {
       .fno =3D gen_helper_gvec_sqadd_h,
       .opt_opc =3D vecop_list_sqadd,
       .write_aofs =3D true,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fniv =3D gen_sqadd_vec,
       .fno =3D gen_helper_gvec_sqadd_s,
       .opt_opc =3D vecop_list_sqadd,
@@ -4762,7 +4762,7 @@ const GVecGen4 uqsub_op[4] =3D {
       .fno =3D gen_helper_gvec_uqsub_h,
       .opt_opc =3D vecop_list_uqsub,
       .write_aofs =3D true,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fniv =3D gen_uqsub_vec,
       .fno =3D gen_helper_gvec_uqsub_s,
       .opt_opc =3D vecop_list_uqsub,
@@ -4800,7 +4800,7 @@ const GVecGen4 sqsub_op[4] =3D {
       .fno =3D gen_helper_gvec_sqsub_h,
       .opt_opc =3D vecop_list_sqsub,
       .write_aofs =3D true,
-      .vece =3D MO_16 },
+      .vece =3D MO_UW },
     { .fniv =3D gen_sqsub_vec,
       .fno =3D gen_helper_gvec_sqsub_s,
       .opt_opc =3D vecop_list_sqsub,
@@ -6876,7 +6876,7 @@ static int disas_neon_data_insn(DisasContext *s, uint=
32_t insn)
                     size =3D MO_UB;
                     element =3D (insn >> 17) & 7;
                 } else if (insn & (1 << 17)) {
-                    size =3D MO_16;
+                    size =3D MO_UW;
                     element =3D (insn >> 18) & 3;
                 } else {
                     size =3D MO_32;
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 0e45300..0535bae 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -323,7 +323,7 @@ static inline bool byte_reg_is_xH(DisasContext *s, int =
reg)
 static inline TCGMemOp mo_pushpop(DisasContext *s, TCGMemOp ot)
 {
     if (CODE64(s)) {
-        return ot =3D=3D MO_16 ? MO_16 : MO_64;
+        return ot =3D=3D MO_UW ? MO_UW : MO_64;
     } else {
         return ot;
     }
@@ -332,7 +332,7 @@ static inline TCGMemOp mo_pushpop(DisasContext *s, TCGM=
emOp ot)
 /* Select the size of the stack pointer.  */
 static inline TCGMemOp mo_stacksize(DisasContext *s)
 {
-    return CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_16;
+    return CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_UW;
 }

 /* Select only size 64 else 32.  Used for SSE operand sizes.  */
@@ -356,7 +356,7 @@ static inline TCGMemOp mo_b_d(int b, TCGMemOp ot)
    Used for decoding operand size of port opcodes.  */
 static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)
 {
-    return b & 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_32) : MO_UB;
+    return b & 1 ? (ot =3D=3D MO_UW ? MO_UW : MO_32) : MO_UB;
 }

 static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int reg, TCGv t=
0)
@@ -369,7 +369,7 @@ static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp =
ot, int reg, TCGv t0)
             tcg_gen_deposit_tl(cpu_regs[reg - 4], cpu_regs[reg - 4], t0, 8=
, 8);
         }
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_deposit_tl(cpu_regs[reg], cpu_regs[reg], t0, 0, 16);
         break;
     case MO_32:
@@ -473,7 +473,7 @@ static void gen_lea_v_seg(DisasContext *s, TCGMemOp afl=
ag, TCGv a0,
             return;
         }
         break;
-    case MO_16:
+    case MO_UW:
         /* 16 bit address */
         tcg_gen_ext16u_tl(s->A0, a0);
         a0 =3D s->A0;
@@ -530,7 +530,7 @@ static TCGv gen_ext_tl(TCGv dst, TCGv src, TCGMemOp siz=
e, bool sign)
             tcg_gen_ext8u_tl(dst, src);
         }
         return dst;
-    case MO_16:
+    case MO_UW:
         if (sign) {
             tcg_gen_ext16s_tl(dst, src);
         } else {
@@ -583,7 +583,7 @@ static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCG=
v_i32 n)
     case MO_UB:
         gen_helper_inb(v, cpu_env, n);
         break;
-    case MO_16:
+    case MO_UW:
         gen_helper_inw(v, cpu_env, n);
         break;
     case MO_32:
@@ -600,7 +600,7 @@ static void gen_helper_out_func(TCGMemOp ot, TCGv_i32 v=
, TCGv_i32 n)
     case MO_UB:
         gen_helper_outb(cpu_env, v, n);
         break;
-    case MO_16:
+    case MO_UW:
         gen_helper_outw(cpu_env, v, n);
         break;
     case MO_32:
@@ -622,7 +622,7 @@ static void gen_check_io(DisasContext *s, TCGMemOp ot, =
target_ulong cur_eip,
         case MO_UB:
             gen_helper_check_iob(cpu_env, s->tmp2_i32);
             break;
-        case MO_16:
+        case MO_UW:
             gen_helper_check_iow(cpu_env, s->tmp2_i32);
             break;
         case MO_32:
@@ -1562,7 +1562,7 @@ static void gen_rot_rm_T1(DisasContext *s, TCGMemOp o=
t, int op1, int is_right)
         tcg_gen_ext8u_tl(s->T0, s->T0);
         tcg_gen_muli_tl(s->T0, s->T0, 0x01010101);
         goto do_long;
-    case MO_16:
+    case MO_UW:
         /* Replicate the 16-bit input so that a 32-bit rotate works.  */
         tcg_gen_deposit_tl(s->T0, s->T0, s->T0, 16, 16);
         goto do_long;
@@ -1664,7 +1664,7 @@ static void gen_rot_rm_im(DisasContext *s, TCGMemOp o=
t, int op1, int op2,
         case MO_UB:
             mask =3D 7;
             goto do_shifts;
-        case MO_16:
+        case MO_UW:
             mask =3D 15;
         do_shifts:
             shift =3D op2 & mask;
@@ -1722,7 +1722,7 @@ static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp =
ot, int op1,
         case MO_UB:
             gen_helper_rcrb(s->T0, cpu_env, s->T0, s->T1);
             break;
-        case MO_16:
+        case MO_UW:
             gen_helper_rcrw(s->T0, cpu_env, s->T0, s->T1);
             break;
         case MO_32:
@@ -1741,7 +1741,7 @@ static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp =
ot, int op1,
         case MO_UB:
             gen_helper_rclb(s->T0, cpu_env, s->T0, s->T1);
             break;
-        case MO_16:
+        case MO_UW:
             gen_helper_rclw(s->T0, cpu_env, s->T0, s->T1);
             break;
         case MO_32:
@@ -1778,7 +1778,7 @@ static void gen_shiftd_rm_T1(DisasContext *s, TCGMemO=
p ot, int op1,
     tcg_gen_andi_tl(count, count_in, mask);

     switch (ot) {
-    case MO_16:
+    case MO_UW:
         /* Note: we implement the Intel behaviour for shift count > 16.
            This means "shrdw C, B, A" shifts A:B:A >> C.  Build the B:A
            portion by constructing it as a 32-bit value.  */
@@ -1817,7 +1817,7 @@ static void gen_shiftd_rm_T1(DisasContext *s, TCGMemO=
p ot, int op1,
             tcg_gen_shl_tl(s->T1, s->T1, s->tmp4);
         } else {
             tcg_gen_shl_tl(s->tmp0, s->T0, s->tmp0);
-            if (ot =3D=3D MO_16) {
+            if (ot =3D=3D MO_UW) {
                 /* Only needed if count > 16, for Intel behaviour.  */
                 tcg_gen_subfi_tl(s->tmp4, 33, count);
                 tcg_gen_shr_tl(s->tmp4, s->T1, s->tmp4);
@@ -2026,7 +2026,7 @@ static AddressParts gen_lea_modrm_0(CPUX86State *env,=
 DisasContext *s,
         }
         break;

-    case MO_16:
+    case MO_UW:
         if (mod =3D=3D 0) {
             if (rm =3D=3D 6) {
                 base =3D -1;
@@ -2187,7 +2187,7 @@ static inline uint32_t insn_get(CPUX86State *env, Dis=
asContext *s, TCGMemOp ot)
     case MO_UB:
         ret =3D x86_ldub_code(env, s);
         break;
-    case MO_16:
+    case MO_UW:
         ret =3D x86_lduw_code(env, s);
         break;
     case MO_32:
@@ -2400,12 +2400,12 @@ static inline void gen_pop_update(DisasContext *s, =
TCGMemOp ot)

 static inline void gen_stack_A0(DisasContext *s)
 {
-    gen_lea_v_seg(s, s->ss32 ? MO_32 : MO_16, cpu_regs[R_ESP], R_SS, -1);
+    gen_lea_v_seg(s, s->ss32 ? MO_32 : MO_UW, cpu_regs[R_ESP], R_SS, -1);
 }

 static void gen_pusha(DisasContext *s)
 {
-    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_16;
+    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_UW;
     TCGMemOp d_ot =3D s->dflag;
     int size =3D 1 << d_ot;
     int i;
@@ -2421,7 +2421,7 @@ static void gen_pusha(DisasContext *s)

 static void gen_popa(DisasContext *s)
 {
-    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_16;
+    TCGMemOp s_ot =3D s->ss32 ? MO_32 : MO_UW;
     TCGMemOp d_ot =3D s->dflag;
     int size =3D 1 << d_ot;
     int i;
@@ -2443,7 +2443,7 @@ static void gen_popa(DisasContext *s)
 static void gen_enter(DisasContext *s, int esp_addend, int level)
 {
     TCGMemOp d_ot =3D mo_pushpop(s, s->dflag);
-    TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_16;
+    TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s->ss32 ? MO_32 : MO_UW;
     int size =3D 1 << d_ot;

     /* Push BP; compute FrameTemp into T1.  */
@@ -3613,7 +3613,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
         case 0xc4: /* pinsrw */
         case 0x1c4:
             s->rip_offset =3D 1;
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
             val =3D x86_ldub_code(env, s);
             if (b1) {
                 val &=3D 7;
@@ -3786,7 +3786,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                 if ((b & 0xff) =3D=3D 0xf0) {
                     ot =3D MO_UB;
                 } else if (s->dflag !=3D MO_64) {
-                    ot =3D (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
+                    ot =3D (s->prefix & PREFIX_DATA ? MO_UW : MO_32);
                 } else {
                     ot =3D MO_64;
                 }
@@ -3815,7 +3815,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                     goto illegal_op;
                 }
                 if (s->dflag !=3D MO_64) {
-                    ot =3D (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
+                    ot =3D (s->prefix & PREFIX_DATA ? MO_UW : MO_32);
                 } else {
                     ot =3D MO_64;
                 }
@@ -4630,7 +4630,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         /* In 64-bit mode, the default data size is 32-bit.  Select 64-bit
            data with rex_w, and 16-bit data with 0x66; rex_w takes precede=
nce
            over 0x66 if both are present.  */
-        dflag =3D (rex_w > 0 ? MO_64 : prefixes & PREFIX_DATA ? MO_16 : MO=
_32);
+        dflag =3D (rex_w > 0 ? MO_64 : prefixes & PREFIX_DATA ? MO_UW : MO=
_32);
         /* In 64-bit mode, 0x67 selects 32-bit addressing.  */
         aflag =3D (prefixes & PREFIX_ADR ? MO_32 : MO_64);
     } else {
@@ -4638,13 +4638,13 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
         if (s->code32 ^ ((prefixes & PREFIX_DATA) !=3D 0)) {
             dflag =3D MO_32;
         } else {
-            dflag =3D MO_16;
+            dflag =3D MO_UW;
         }
         /* In 16/32-bit mode, 0x67 selects the opposite addressing.  */
         if (s->code32 ^ ((prefixes & PREFIX_ADR) !=3D 0)) {
             aflag =3D MO_32;
         }  else {
-            aflag =3D MO_16;
+            aflag =3D MO_UW;
         }
     }

@@ -4872,21 +4872,21 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
                 tcg_gen_ext8u_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                gen_op_mov_reg_v(s, MO_UW, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_andi_tl(cpu_cc_src, s->T0, 0xff00);
                 set_cc_op(s, CC_OP_MULB);
                 break;
-            case MO_16:
-                gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
+            case MO_UW:
+                gen_op_mov_v_reg(s, MO_UW, s->T1, R_EAX);
                 tcg_gen_ext16u_tl(s->T0, s->T0);
                 tcg_gen_ext16u_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                gen_op_mov_reg_v(s, MO_UW, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_shri_tl(s->T0, s->T0, 16);
-                gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
+                gen_op_mov_reg_v(s, MO_UW, R_EDX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_src, s->T0);
                 set_cc_op(s, CC_OP_MULW);
                 break;
@@ -4921,24 +4921,24 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
                 tcg_gen_ext8s_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                gen_op_mov_reg_v(s, MO_UW, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_ext8s_tl(s->tmp0, s->T0);
                 tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
                 set_cc_op(s, CC_OP_MULB);
                 break;
-            case MO_16:
-                gen_op_mov_v_reg(s, MO_16, s->T1, R_EAX);
+            case MO_UW:
+                gen_op_mov_v_reg(s, MO_UW, s->T1, R_EAX);
                 tcg_gen_ext16s_tl(s->T0, s->T0);
                 tcg_gen_ext16s_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
                 tcg_gen_mul_tl(s->T0, s->T0, s->T1);
-                gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                gen_op_mov_reg_v(s, MO_UW, R_EAX, s->T0);
                 tcg_gen_mov_tl(cpu_cc_dst, s->T0);
                 tcg_gen_ext16s_tl(s->tmp0, s->T0);
                 tcg_gen_sub_tl(cpu_cc_src, s->T0, s->tmp0);
                 tcg_gen_shri_tl(s->T0, s->T0, 16);
-                gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
+                gen_op_mov_reg_v(s, MO_UW, R_EDX, s->T0);
                 set_cc_op(s, CC_OP_MULW);
                 break;
             default:
@@ -4972,7 +4972,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             case MO_UB:
                 gen_helper_divb_AL(cpu_env, s->T0);
                 break;
-            case MO_16:
+            case MO_UW:
                 gen_helper_divw_AX(cpu_env, s->T0);
                 break;
             default:
@@ -4991,7 +4991,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             case MO_UB:
                 gen_helper_idivb_AL(cpu_env, s->T0);
                 break;
-            case MO_16:
+            case MO_UW:
                 gen_helper_idivw_AX(cpu_env, s->T0);
                 break;
             default:
@@ -5026,7 +5026,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 /* operand size for jumps is 64 bit */
                 ot =3D MO_64;
             } else if (op =3D=3D 3 || op =3D=3D 5) {
-                ot =3D dflag !=3D MO_16 ? MO_32 + (rex_w =3D=3D 1) : MO_16=
;
+                ot =3D dflag !=3D MO_UW ? MO_32 + (rex_w =3D=3D 1) : MO_UW=
;
             } else if (op =3D=3D 6) {
                 /* default push size is 64 bit */
                 ot =3D mo_pushpop(s, dflag);
@@ -5057,7 +5057,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             break;
         case 2: /* call Ev */
             /* XXX: optimize if memory (no 'and' is necessary) */
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             next_eip =3D s->pc - s->cs_base;
@@ -5070,7 +5070,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         case 3: /* lcall Ev */
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
-            gen_op_ld_v(s, MO_16, s->T0, s->A0);
+            gen_op_ld_v(s, MO_UW, s->T0, s->A0);
         do_lcall:
             if (s->pe && !s->vm86) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
@@ -5087,7 +5087,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             gen_jr(s, s->tmp4);
             break;
         case 4: /* jmp Ev */
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
             gen_op_jmp_v(s->T0);
@@ -5097,7 +5097,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         case 5: /* ljmp Ev */
             gen_op_ld_v(s, ot, s->T1, s->A0);
             gen_add_A0_im(s, 1 << ot);
-            gen_op_ld_v(s, MO_16, s->T0, s->A0);
+            gen_op_ld_v(s, MO_UW, s->T0, s->A0);
         do_ljmp:
             if (s->pe && !s->vm86) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
@@ -5152,14 +5152,14 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             break;
 #endif
         case MO_32:
-            gen_op_mov_v_reg(s, MO_16, s->T0, R_EAX);
+            gen_op_mov_v_reg(s, MO_UW, s->T0, R_EAX);
             tcg_gen_ext16s_tl(s->T0, s->T0);
             gen_op_mov_reg_v(s, MO_32, R_EAX, s->T0);
             break;
-        case MO_16:
+        case MO_UW:
             gen_op_mov_v_reg(s, MO_UB, s->T0, R_EAX);
             tcg_gen_ext8s_tl(s->T0, s->T0);
-            gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+            gen_op_mov_reg_v(s, MO_UW, R_EAX, s->T0);
             break;
         default:
             tcg_abort();
@@ -5180,11 +5180,11 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             tcg_gen_sari_tl(s->T0, s->T0, 31);
             gen_op_mov_reg_v(s, MO_32, R_EDX, s->T0);
             break;
-        case MO_16:
-            gen_op_mov_v_reg(s, MO_16, s->T0, R_EAX);
+        case MO_UW:
+            gen_op_mov_v_reg(s, MO_UW, s->T0, R_EAX);
             tcg_gen_ext16s_tl(s->T0, s->T0);
             tcg_gen_sari_tl(s->T0, s->T0, 15);
-            gen_op_mov_reg_v(s, MO_16, R_EDX, s->T0);
+            gen_op_mov_reg_v(s, MO_UW, R_EDX, s->T0);
             break;
         default:
             tcg_abort();
@@ -5538,7 +5538,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         reg =3D (modrm >> 3) & 7;
         if (reg >=3D 6 || reg =3D=3D R_CS)
             goto illegal_op;
-        gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+        gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
         gen_movl_seg_T0(s, reg);
         /* Note that reg =3D=3D R_SS in gen_movl_seg_T0 always sets is_jmp=
.  */
         if (s->base.is_jmp) {
@@ -5558,7 +5558,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         if (reg >=3D 6)
             goto illegal_op;
         gen_op_movl_T0_seg(s, reg);
-        ot =3D mod =3D=3D 3 ? dflag : MO_16;
+        ot =3D mod =3D=3D 3 ? dflag : MO_UW;
         gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
         break;

@@ -5734,7 +5734,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     case 0x1b5: /* lgs Gv */
         op =3D R_GS;
     do_lxx:
-        ot =3D dflag !=3D MO_16 ? MO_32 : MO_16;
+        ot =3D dflag !=3D MO_UW ? MO_32 : MO_UW;
         modrm =3D x86_ldub_code(env, s);
         reg =3D ((modrm >> 3) & 7) | rex_r;
         mod =3D (modrm >> 6) & 3;
@@ -5744,7 +5744,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         gen_op_ld_v(s, ot, s->T1, s->A0);
         gen_add_A0_im(s, 1 << ot);
         /* load the segment first to handle exceptions properly */
-        gen_op_ld_v(s, MO_16, s->T0, s->A0);
+        gen_op_ld_v(s, MO_UW, s->T0, s->A0);
         gen_movl_seg_T0(s, op);
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
@@ -6287,7 +6287,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 case 0:
                     gen_helper_fnstsw(s->tmp2_i32, cpu_env);
                     tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
-                    gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
+                    gen_op_mov_reg_v(s, MO_UW, R_EAX, s->T0);
                     break;
                 default:
                     goto unknown_op;
@@ -6575,14 +6575,14 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
         break;
     case 0xe8: /* call im */
         {
-            if (dflag !=3D MO_16) {
+            if (dflag !=3D MO_UW) {
                 tval =3D (int32_t)insn_get(env, s, MO_32);
             } else {
-                tval =3D (int16_t)insn_get(env, s, MO_16);
+                tval =3D (int16_t)insn_get(env, s, MO_UW);
             }
             next_eip =3D s->pc - s->cs_base;
             tval +=3D next_eip;
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tval &=3D 0xffff;
             } else if (!CODE64(s)) {
                 tval &=3D 0xffffffff;
@@ -6601,20 +6601,20 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
                 goto illegal_op;
             ot =3D dflag;
             offset =3D insn_get(env, s, ot);
-            selector =3D insn_get(env, s, MO_16);
+            selector =3D insn_get(env, s, MO_UW);

             tcg_gen_movi_tl(s->T0, selector);
             tcg_gen_movi_tl(s->T1, offset);
         }
         goto do_lcall;
     case 0xe9: /* jmp im */
-        if (dflag !=3D MO_16) {
+        if (dflag !=3D MO_UW) {
             tval =3D (int32_t)insn_get(env, s, MO_32);
         } else {
-            tval =3D (int16_t)insn_get(env, s, MO_16);
+            tval =3D (int16_t)insn_get(env, s, MO_UW);
         }
         tval +=3D s->pc - s->cs_base;
-        if (dflag =3D=3D MO_16) {
+        if (dflag =3D=3D MO_UW) {
             tval &=3D 0xffff;
         } else if (!CODE64(s)) {
             tval &=3D 0xffffffff;
@@ -6630,7 +6630,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 goto illegal_op;
             ot =3D dflag;
             offset =3D insn_get(env, s, ot);
-            selector =3D insn_get(env, s, MO_16);
+            selector =3D insn_get(env, s, MO_UW);

             tcg_gen_movi_tl(s->T0, selector);
             tcg_gen_movi_tl(s->T1, offset);
@@ -6639,7 +6639,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     case 0xeb: /* jmp Jb */
         tval =3D (int8_t)insn_get(env, s, MO_UB);
         tval +=3D s->pc - s->cs_base;
-        if (dflag =3D=3D MO_16) {
+        if (dflag =3D=3D MO_UW) {
             tval &=3D 0xffff;
         }
         gen_jmp(s, tval);
@@ -6648,15 +6648,15 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
         tval =3D (int8_t)insn_get(env, s, MO_UB);
         goto do_jcc;
     case 0x180 ... 0x18f: /* jcc Jv */
-        if (dflag !=3D MO_16) {
+        if (dflag !=3D MO_UW) {
             tval =3D (int32_t)insn_get(env, s, MO_32);
         } else {
-            tval =3D (int16_t)insn_get(env, s, MO_16);
+            tval =3D (int16_t)insn_get(env, s, MO_UW);
         }
     do_jcc:
         next_eip =3D s->pc - s->cs_base;
         tval +=3D next_eip;
-        if (dflag =3D=3D MO_16) {
+        if (dflag =3D=3D MO_UW) {
             tval &=3D 0xffff;
         }
         gen_bnd_jmp(s);
@@ -6697,7 +6697,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         } else {
             ot =3D gen_pop_T0(s);
             if (s->cpl =3D=3D 0) {
-                if (dflag !=3D MO_16) {
+                if (dflag !=3D MO_UW) {
                     gen_helper_write_eflags(cpu_env, s->T0,
                                             tcg_const_i32((TF_MASK | AC_MA=
SK |
                                                            ID_MASK | NT_MA=
SK |
@@ -6712,7 +6712,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 }
             } else {
                 if (s->cpl <=3D s->iopl) {
-                    if (dflag !=3D MO_16) {
+                    if (dflag !=3D MO_UW) {
                         gen_helper_write_eflags(cpu_env, s->T0,
                                                 tcg_const_i32((TF_MASK |
                                                                AC_MASK |
@@ -6729,7 +6729,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                                                               & 0xffff));
                     }
                 } else {
-                    if (dflag !=3D MO_16) {
+                    if (dflag !=3D MO_UW) {
                         gen_helper_write_eflags(cpu_env, s->T0,
                                            tcg_const_i32((TF_MASK | AC_MAS=
K |
                                                           ID_MASK | NT_MAS=
K)));
@@ -7110,7 +7110,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         gen_op_mov_v_reg(s, ot, s->T0, reg);
         gen_lea_modrm(env, s, modrm);
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-        if (ot =3D=3D MO_16) {
+        if (ot =3D=3D MO_UW) {
             gen_helper_boundw(cpu_env, s->A0, s->tmp2_i32);
         } else {
             gen_helper_boundl(cpu_env, s->A0, s->tmp2_i32);
@@ -7149,7 +7149,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             tval =3D (int8_t)insn_get(env, s, MO_UB);
             next_eip =3D s->pc - s->cs_base;
             tval +=3D next_eip;
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tval &=3D 0xffff;
             }

@@ -7291,7 +7291,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, ldt.selector));
-            ot =3D mod =3D=3D 3 ? dflag : MO_16;
+            ot =3D mod =3D=3D 3 ? dflag : MO_UW;
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 2: /* lldt */
@@ -7301,7 +7301,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
             } else {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
-                gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+                gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lldt(cpu_env, s->tmp2_i32);
             }
@@ -7312,7 +7312,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_READ);
             tcg_gen_ld32u_tl(s->T0, cpu_env,
                              offsetof(CPUX86State, tr.selector));
-            ot =3D mod =3D=3D 3 ? dflag : MO_16;
+            ot =3D mod =3D=3D 3 ? dflag : MO_UW;
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
         case 3: /* ltr */
@@ -7322,7 +7322,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
             } else {
                 gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
-                gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+                gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ltr(cpu_env, s->tmp2_i32);
             }
@@ -7331,7 +7331,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         case 5: /* verw */
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
             gen_update_cc_op(s);
             if (op =3D=3D 4) {
                 gen_helper_verr(cpu_env, s->T0);
@@ -7353,10 +7353,10 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0,
                              cpu_env, offsetof(CPUX86State, gdt.limit));
-            gen_op_st_v(s, MO_16, s->T0, s->A0);
+            gen_op_st_v(s, MO_UW, s->T0, s->A0);
             gen_add_A0_im(s, 2);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base))=
;
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
@@ -7408,10 +7408,10 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_READ);
             gen_lea_modrm(env, s, modrm);
             tcg_gen_ld32u_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.lim=
it));
-            gen_op_st_v(s, MO_16, s->T0, s->A0);
+            gen_op_st_v(s, MO_UW, s->T0, s->A0);
             gen_add_A0_im(s, 2);
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base))=
;
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             gen_op_st_v(s, CODE64(s) + MO_32, s->T0, s->A0);
@@ -7558,10 +7558,10 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
-            gen_op_ld_v(s, MO_16, s->T1, s->A0);
+            gen_op_ld_v(s, MO_UW, s->T1, s->A0);
             gen_add_A0_im(s, 2);
             gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, gdt.base))=
;
@@ -7575,10 +7575,10 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
             gen_lea_modrm(env, s, modrm);
-            gen_op_ld_v(s, MO_16, s->T1, s->A0);
+            gen_op_ld_v(s, MO_UW, s->T1, s->A0);
             gen_add_A0_im(s, 2);
             gen_op_ld_v(s, CODE64(s) + MO_32, s->T0, s->A0);
-            if (dflag =3D=3D MO_16) {
+            if (dflag =3D=3D MO_UW) {
                 tcg_gen_andi_tl(s->T0, s->T0, 0xffffff);
             }
             tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, idt.base))=
;
@@ -7590,9 +7590,9 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             tcg_gen_ld_tl(s->T0, cpu_env, offsetof(CPUX86State, cr[0]));
             if (CODE64(s)) {
                 mod =3D (modrm >> 6) & 3;
-                ot =3D (mod !=3D 3 ? MO_16 : s->dflag);
+                ot =3D (mod !=3D 3 ? MO_UW : s->dflag);
             } else {
-                ot =3D MO_16;
+                ot =3D MO_UW;
             }
             gen_ldst_modrm(env, s, modrm, ot, OR_TMP0, 1);
             break;
@@ -7619,7 +7619,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 break;
             }
             gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
             gen_helper_lmsw(cpu_env, s->T0);
             gen_jmp_im(s, s->pc - s->cs_base);
             gen_eob(s);
@@ -7720,7 +7720,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             t0 =3D tcg_temp_local_new();
             t1 =3D tcg_temp_local_new();
             t2 =3D tcg_temp_local_new();
-            ot =3D MO_16;
+            ot =3D MO_UW;
             modrm =3D x86_ldub_code(env, s);
             reg =3D (modrm >> 3) & 7;
             mod =3D (modrm >> 6) & 3;
@@ -7765,10 +7765,10 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
             TCGv t0;
             if (!s->pe || s->vm86)
                 goto illegal_op;
-            ot =3D dflag !=3D MO_16 ? MO_32 : MO_16;
+            ot =3D dflag !=3D MO_UW ? MO_32 : MO_UW;
             modrm =3D x86_ldub_code(env, s);
             reg =3D ((modrm >> 3) & 7) | rex_r;
-            gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
+            gen_ldst_modrm(env, s, modrm, MO_UW, OR_TMP0, 0);
             t0 =3D tcg_temp_local_new();
             gen_update_cc_op(s);
             if (b =3D=3D 0x102) {
@@ -7813,7 +7813,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 /* bndcl */
                 if (reg >=3D 4
                     || (prefixes & PREFIX_LOCK)
-                    || s->aflag =3D=3D MO_16) {
+                    || s->aflag =3D=3D MO_UW) {
                     goto illegal_op;
                 }
                 gen_bndck(env, s, modrm, TCG_COND_LTU, cpu_bndl[reg]);
@@ -7821,7 +7821,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 /* bndcu */
                 if (reg >=3D 4
                     || (prefixes & PREFIX_LOCK)
-                    || s->aflag =3D=3D MO_16) {
+                    || s->aflag =3D=3D MO_UW) {
                     goto illegal_op;
                 }
                 TCGv_i64 notu =3D tcg_temp_new_i64();
@@ -7830,7 +7830,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 tcg_temp_free_i64(notu);
             } else if (prefixes & PREFIX_DATA) {
                 /* bndmov -- from reg/mem */
-                if (reg >=3D 4 || s->aflag =3D=3D MO_16) {
+                if (reg >=3D 4 || s->aflag =3D=3D MO_UW) {
                     goto illegal_op;
                 }
                 if (mod =3D=3D 3) {
@@ -7865,7 +7865,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 AddressParts a =3D gen_lea_modrm_0(env, s, modrm);
                 if (reg >=3D 4
                     || (prefixes & PREFIX_LOCK)
-                    || s->aflag =3D=3D MO_16
+                    || s->aflag =3D=3D MO_UW
                     || a.base < -1) {
                     goto illegal_op;
                 }
@@ -7903,7 +7903,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 /* bndmk */
                 if (reg >=3D 4
                     || (prefixes & PREFIX_LOCK)
-                    || s->aflag =3D=3D MO_16) {
+                    || s->aflag =3D=3D MO_UW) {
                     goto illegal_op;
                 }
                 AddressParts a =3D gen_lea_modrm_0(env, s, modrm);
@@ -7931,13 +7931,13 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
                 /* bndcn */
                 if (reg >=3D 4
                     || (prefixes & PREFIX_LOCK)
-                    || s->aflag =3D=3D MO_16) {
+                    || s->aflag =3D=3D MO_UW) {
                     goto illegal_op;
                 }
                 gen_bndck(env, s, modrm, TCG_COND_GTU, cpu_bndu[reg]);
             } else if (prefixes & PREFIX_DATA) {
                 /* bndmov -- to reg/mem */
-                if (reg >=3D 4 || s->aflag =3D=3D MO_16) {
+                if (reg >=3D 4 || s->aflag =3D=3D MO_UW) {
                     goto illegal_op;
                 }
                 if (mod =3D=3D 3) {
@@ -7970,7 +7970,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 AddressParts a =3D gen_lea_modrm_0(env, s, modrm);
                 if (reg >=3D 4
                     || (prefixes & PREFIX_LOCK)
-                    || s->aflag =3D=3D MO_16
+                    || s->aflag =3D=3D MO_UW
                     || a.base < -1) {
                     goto illegal_op;
                 }
@@ -8341,7 +8341,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         reg =3D ((modrm >> 3) & 7) | rex_r;

         if (s->prefix & PREFIX_DATA) {
-            ot =3D MO_16;
+            ot =3D MO_UW;
         } else {
             ot =3D mo_64_32(dflag);
         }
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 20a9777..525c7fe 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -21087,7 +21087,7 @@ static void gen_pool32a5_nanomips_insn(DisasContext=
 *ctx, int opc,
             imm =3D sextract32(ctx->opcode, 11, 11);
             imm =3D (int16_t)(imm << 6) >> 6;
             if (rt !=3D 0) {
-                tcg_gen_movi_tl(cpu_gpr[rt], dup_const(MO_16, imm));
+                tcg_gen_movi_tl(cpu_gpr[rt], dup_const(MO_UW, imm));
             }
         }
         break;
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx=
-impl.inc.c
index 4130dd1..71efef4 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -406,29 +406,29 @@ static void glue(gen_, name)(DisasContext *ctx)      =
                   \
 GEN_VXFORM_V(vaddubm, MO_UB, tcg_gen_gvec_add, 0, 0);
 GEN_VXFORM_DUAL_EXT(vaddubm, PPC_ALTIVEC, PPC_NONE, 0,       \
                     vmul10cuq, PPC_NONE, PPC2_ISA300, 0x0000F800)
-GEN_VXFORM_V(vadduhm, MO_16, tcg_gen_gvec_add, 0, 1);
+GEN_VXFORM_V(vadduhm, MO_UW, tcg_gen_gvec_add, 0, 1);
 GEN_VXFORM_DUAL(vadduhm, PPC_ALTIVEC, PPC_NONE,  \
                 vmul10ecuq, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_V(vadduwm, MO_32, tcg_gen_gvec_add, 0, 2);
 GEN_VXFORM_V(vaddudm, MO_64, tcg_gen_gvec_add, 0, 3);
 GEN_VXFORM_V(vsububm, MO_UB, tcg_gen_gvec_sub, 0, 16);
-GEN_VXFORM_V(vsubuhm, MO_16, tcg_gen_gvec_sub, 0, 17);
+GEN_VXFORM_V(vsubuhm, MO_UW, tcg_gen_gvec_sub, 0, 17);
 GEN_VXFORM_V(vsubuwm, MO_32, tcg_gen_gvec_sub, 0, 18);
 GEN_VXFORM_V(vsubudm, MO_64, tcg_gen_gvec_sub, 0, 19);
 GEN_VXFORM_V(vmaxub, MO_UB, tcg_gen_gvec_umax, 1, 0);
-GEN_VXFORM_V(vmaxuh, MO_16, tcg_gen_gvec_umax, 1, 1);
+GEN_VXFORM_V(vmaxuh, MO_UW, tcg_gen_gvec_umax, 1, 1);
 GEN_VXFORM_V(vmaxuw, MO_32, tcg_gen_gvec_umax, 1, 2);
 GEN_VXFORM_V(vmaxud, MO_64, tcg_gen_gvec_umax, 1, 3);
 GEN_VXFORM_V(vmaxsb, MO_UB, tcg_gen_gvec_smax, 1, 4);
-GEN_VXFORM_V(vmaxsh, MO_16, tcg_gen_gvec_smax, 1, 5);
+GEN_VXFORM_V(vmaxsh, MO_UW, tcg_gen_gvec_smax, 1, 5);
 GEN_VXFORM_V(vmaxsw, MO_32, tcg_gen_gvec_smax, 1, 6);
 GEN_VXFORM_V(vmaxsd, MO_64, tcg_gen_gvec_smax, 1, 7);
 GEN_VXFORM_V(vminub, MO_UB, tcg_gen_gvec_umin, 1, 8);
-GEN_VXFORM_V(vminuh, MO_16, tcg_gen_gvec_umin, 1, 9);
+GEN_VXFORM_V(vminuh, MO_UW, tcg_gen_gvec_umin, 1, 9);
 GEN_VXFORM_V(vminuw, MO_32, tcg_gen_gvec_umin, 1, 10);
 GEN_VXFORM_V(vminud, MO_64, tcg_gen_gvec_umin, 1, 11);
 GEN_VXFORM_V(vminsb, MO_UB, tcg_gen_gvec_smin, 1, 12);
-GEN_VXFORM_V(vminsh, MO_16, tcg_gen_gvec_smin, 1, 13);
+GEN_VXFORM_V(vminsh, MO_UW, tcg_gen_gvec_smin, 1, 13);
 GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);
 GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);
 GEN_VXFORM(vavgub, 1, 16);
@@ -531,18 +531,18 @@ GEN_VXFORM(vmulesb, 4, 12);
 GEN_VXFORM(vmulesh, 4, 13);
 GEN_VXFORM(vmulesw, 4, 14);
 GEN_VXFORM_V(vslb, MO_UB, tcg_gen_gvec_shlv, 2, 4);
-GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
+GEN_VXFORM_V(vslh, MO_UW, tcg_gen_gvec_shlv, 2, 5);
 GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
 GEN_VXFORM(vrlwnm, 2, 6);
 GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \
                 vrlwnm, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);
 GEN_VXFORM_V(vsrb, MO_UB, tcg_gen_gvec_shrv, 2, 8);
-GEN_VXFORM_V(vsrh, MO_16, tcg_gen_gvec_shrv, 2, 9);
+GEN_VXFORM_V(vsrh, MO_UW, tcg_gen_gvec_shrv, 2, 9);
 GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);
 GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);
 GEN_VXFORM_V(vsrab, MO_UB, tcg_gen_gvec_sarv, 2, 12);
-GEN_VXFORM_V(vsrah, MO_16, tcg_gen_gvec_sarv, 2, 13);
+GEN_VXFORM_V(vsrah, MO_UW, tcg_gen_gvec_sarv, 2, 13);
 GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);
 GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);
 GEN_VXFORM(vsrv, 2, 28);
@@ -592,18 +592,18 @@ static void glue(gen_, NAME)(DisasContext *ctx)      =
                   \
 GEN_VXFORM_SAT(vaddubs, MO_UB, add, usadd, 0, 8);
 GEN_VXFORM_DUAL_EXT(vaddubs, PPC_ALTIVEC, PPC_NONE, 0,       \
                     vmul10uq, PPC_NONE, PPC2_ISA300, 0x0000F800)
-GEN_VXFORM_SAT(vadduhs, MO_16, add, usadd, 0, 9);
+GEN_VXFORM_SAT(vadduhs, MO_UW, add, usadd, 0, 9);
 GEN_VXFORM_DUAL(vadduhs, PPC_ALTIVEC, PPC_NONE, \
                 vmul10euq, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_SAT(vadduws, MO_32, add, usadd, 0, 10);
 GEN_VXFORM_SAT(vaddsbs, MO_UB, add, ssadd, 0, 12);
-GEN_VXFORM_SAT(vaddshs, MO_16, add, ssadd, 0, 13);
+GEN_VXFORM_SAT(vaddshs, MO_UW, add, ssadd, 0, 13);
 GEN_VXFORM_SAT(vaddsws, MO_32, add, ssadd, 0, 14);
 GEN_VXFORM_SAT(vsububs, MO_UB, sub, ussub, 0, 24);
-GEN_VXFORM_SAT(vsubuhs, MO_16, sub, ussub, 0, 25);
+GEN_VXFORM_SAT(vsubuhs, MO_UW, sub, ussub, 0, 25);
 GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_UB, sub, sssub, 0, 28);
-GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
+GEN_VXFORM_SAT(vsubshs, MO_UW, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
 GEN_VXFORM(vadduqm, 0, 4);
 GEN_VXFORM(vaddcuq, 0, 5);
@@ -913,7 +913,7 @@ static void glue(gen_, name)(DisasContext *ctx)        =
                 \
     }

 GEN_VXFORM_VSPLT(vspltb, MO_UB, 6, 8);
-GEN_VXFORM_VSPLT(vsplth, MO_16, 6, 9);
+GEN_VXFORM_VSPLT(vsplth, MO_UW, 6, 9);
 GEN_VXFORM_VSPLT(vspltw, MO_32, 6, 10);
 GEN_VXFORM_UIMM_SPLAT(vextractub, 6, 8, 15);
 GEN_VXFORM_UIMM_SPLAT(vextractuh, 6, 9, 14);
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.in=
c.c
index bb424c8..65da6b3 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -47,7 +47,7 @@
 #define NUM_VEC_ELEMENT_BITS(es) (NUM_VEC_ELEMENT_BYTES(es) * BITS_PER_BYT=
E)

 #define ES_8    MO_UB
-#define ES_16   MO_16
+#define ES_16   MO_UW
 #define ES_32   MO_32
 #define ES_64   MO_64
 #define ES_128  4
diff --git a/target/s390x/vec.h b/target/s390x/vec.h
index b813054..28e1b1d 100644
--- a/target/s390x/vec.h
+++ b/target/s390x/vec.h
@@ -78,7 +78,7 @@ static inline uint64_t s390_vec_read_element(const S390Ve=
ctor *v, uint8_t enr,
     switch (es) {
     case MO_UB:
         return s390_vec_read_element8(v, enr);
-    case MO_16:
+    case MO_UW:
         return s390_vec_read_element16(v, enr);
     case MO_32:
         return s390_vec_read_element32(v, enr);
@@ -124,7 +124,7 @@ static inline void s390_vec_write_element(S390Vector *v=
, uint8_t enr,
     case MO_UB:
         s390_vec_write_element8(v, enr, data);
         break;
-    case MO_16:
+    case MO_UW:
         s390_vec_write_element16(v, enr, data);
         break;
     case MO_32:
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index e4e0845..3d90c4b 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -430,20 +430,20 @@ typedef enum {
     /* Load/store register.  Described here as 3.3.12, but the helper
        that emits them can transform to 3.3.10 or 3.3.13.  */
     I3312_STRB      =3D 0x38000000 | LDST_ST << 22 | MO_UB << 30,
-    I3312_STRH      =3D 0x38000000 | LDST_ST << 22 | MO_16 << 30,
+    I3312_STRH      =3D 0x38000000 | LDST_ST << 22 | MO_UW << 30,
     I3312_STRW      =3D 0x38000000 | LDST_ST << 22 | MO_32 << 30,
     I3312_STRX      =3D 0x38000000 | LDST_ST << 22 | MO_64 << 30,

     I3312_LDRB      =3D 0x38000000 | LDST_LD << 22 | MO_UB << 30,
-    I3312_LDRH      =3D 0x38000000 | LDST_LD << 22 | MO_16 << 30,
+    I3312_LDRH      =3D 0x38000000 | LDST_LD << 22 | MO_UW << 30,
     I3312_LDRW      =3D 0x38000000 | LDST_LD << 22 | MO_32 << 30,
     I3312_LDRX      =3D 0x38000000 | LDST_LD << 22 | MO_64 << 30,

     I3312_LDRSBW    =3D 0x38000000 | LDST_LD_S_W << 22 | MO_UB << 30,
-    I3312_LDRSHW    =3D 0x38000000 | LDST_LD_S_W << 22 | MO_16 << 30,
+    I3312_LDRSHW    =3D 0x38000000 | LDST_LD_S_W << 22 | MO_UW << 30,

     I3312_LDRSBX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_UB << 30,
-    I3312_LDRSHX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_16 << 30,
+    I3312_LDRSHX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_UW << 30,
     I3312_LDRSWX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_32 << 30,

     I3312_LDRVS     =3D 0x3c000000 | LDST_LD << 22 | MO_32 << 30,
@@ -870,7 +870,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType typ=
e,

     /*
      * Test all bytes 0x00 or 0xff second.  This can match cases that
-     * might otherwise take 2 or 3 insns for MO_16 or MO_32 below.
+     * might otherwise take 2 or 3 insns for MO_UW or MO_32 below.
      */
     for (i =3D imm8 =3D 0; i < 8; i++) {
         uint8_t byte =3D v64 >> (i * 8);
@@ -889,7 +889,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType typ=
e,
      * cannot find an expansion there's no point checking a larger
      * width because we already know by replication it cannot match.
      */
-    if (v64 =3D=3D dup_const(MO_16, v64)) {
+    if (v64 =3D=3D dup_const(MO_UW, v64)) {
         uint16_t v16 =3D v64;

         if (is_shimm16(v16, &cmode, &imm8)) {
@@ -1733,7 +1733,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCG=
MemOp memop, TCGType ext,
         if (bswap) {
             tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
             tcg_out_rev16(s, data_r, data_r);
-            tcg_out_sxt(s, ext, MO_16, data_r, data_r);
+            tcg_out_sxt(s, ext, MO_UW, data_r, data_r);
         } else {
             tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
                            data_r, addr_r, otype, off_r);
@@ -1775,7 +1775,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
MemOp memop,
     case MO_UB:
         tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
         break;
-    case MO_16:
+    case MO_UW:
         if (bswap && data_r !=3D TCG_REG_XZR) {
             tcg_out_rev16(s, TCG_REG_TMP, data_r);
             data_r =3D TCG_REG_TMP;
@@ -2190,7 +2190,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16s_i32:
-        tcg_out_sxt(s, ext, MO_16, a0, a1);
+        tcg_out_sxt(s, ext, MO_UW, a0, a1);
         break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
@@ -2202,7 +2202,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext16u_i32:
-        tcg_out_uxt(s, MO_16, a0, a1);
+        tcg_out_uxt(s, MO_UW, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 542ffa8..0bd400e 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -1432,7 +1432,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
     case MO_UB:
         argreg =3D tcg_out_arg_reg8(s, argreg, datalo);
         break;
-    case MO_16:
+    case MO_UW:
         argreg =3D tcg_out_arg_reg16(s, argreg, datalo);
         break;
     case MO_32:
@@ -1624,7 +1624,7 @@ static inline void tcg_out_qemu_st_index(TCGContext *=
s, int cond, TCGMemOp opc,
     case MO_UB:
         tcg_out_st8_r(s, cond, datalo, addrlo, addend);
         break;
-    case MO_16:
+    case MO_UW:
         if (bswap) {
             tcg_out_bswap16st(s, cond, TCG_REG_R0, datalo);
             tcg_out_st16_r(s, cond, TCG_REG_R0, addrlo, addend);
@@ -1669,7 +1669,7 @@ static inline void tcg_out_qemu_st_direct(TCGContext =
*s, TCGMemOp opc,
     case MO_UB:
         tcg_out_st8_12(s, COND_AL, datalo, addrlo, 0);
         break;
-    case MO_16:
+    case MO_UW:
         if (bswap) {
             tcg_out_bswap16st(s, COND_AL, TCG_REG_R0, datalo);
             tcg_out_st16_8(s, COND_AL, TCG_REG_R0, addrlo, 0);
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 0d68ba4..31c3664 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -893,7 +893,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type=
, unsigned vece,
             tcg_out_vex_modrm(s, OPC_PUNPCKLBW, r, a, a);
             a =3D r;
             /* FALLTHRU */
-        case MO_16:
+        case MO_UW:
             tcg_out_vex_modrm(s, OPC_PUNPCKLWD, r, a, a);
             a =3D r;
             /* FALLTHRU */
@@ -927,7 +927,7 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType typ=
e, unsigned vece,
         case MO_32:
             tcg_out_vex_modrm_offset(s, OPC_VBROADCASTSS, r, 0, base, offs=
et);
             break;
-        case MO_16:
+        case MO_UW:
             tcg_out_vex_modrm_offset(s, OPC_VPINSRW, r, r, base, offset);
             tcg_out8(s, 0); /* imm8 */
             tcg_out_dup_vec(s, type, vece, r, r);
@@ -2164,7 +2164,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
Reg datalo, TCGReg datahi,
         tcg_out_modrm_sib_offset(s, OPC_MOVB_EvGv + P_REXB_R + seg,
                                  datalo, base, index, 0, ofs);
         break;
-    case MO_16:
+    case MO_UW:
         if (bswap) {
             tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
             tcg_out_rolw_8(s, scratch);
@@ -2747,15 +2747,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode=
 opc,
         OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_UD2
     };
     static int const shlv_insn[4] =3D {
-        /* TODO: AVX512 adds support for MO_16.  */
+        /* TODO: AVX512 adds support for MO_UW.  */
         OPC_UD2, OPC_UD2, OPC_VPSLLVD, OPC_VPSLLVQ
     };
     static int const shrv_insn[4] =3D {
-        /* TODO: AVX512 adds support for MO_16.  */
+        /* TODO: AVX512 adds support for MO_UW.  */
         OPC_UD2, OPC_UD2, OPC_VPSRLVD, OPC_VPSRLVQ
     };
     static int const sarv_insn[4] =3D {
-        /* TODO: AVX512 adds support for MO_16, MO_64.  */
+        /* TODO: AVX512 adds support for MO_UW, MO_64.  */
         OPC_UD2, OPC_UD2, OPC_VPSRAVD, OPC_UD2
     };
     static int const shls_insn[4] =3D {
@@ -2925,7 +2925,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode o=
pc,
         sub =3D args[3];
         goto gen_simd_imm8;
     case INDEX_op_x86_blend_vec:
-        if (vece =3D=3D MO_16) {
+        if (vece =3D=3D MO_UW) {
             insn =3D OPC_PBLENDW;
         } else if (vece =3D=3D MO_32) {
             insn =3D (have_avx2 ? OPC_VPBLENDD : OPC_BLENDPS);
@@ -3290,9 +3290,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, =
unsigned vece)

     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
-        return vece >=3D MO_16;
+        return vece >=3D MO_UW;
     case INDEX_op_sars_vec:
-        return vece >=3D MO_16 && vece <=3D MO_32;
+        return vece >=3D MO_UW && vece <=3D MO_32;

     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
@@ -3314,7 +3314,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, =
unsigned vece)
     case INDEX_op_usadd_vec:
     case INDEX_op_sssub_vec:
     case INDEX_op_ussub_vec:
-        return vece <=3D MO_16;
+        return vece <=3D MO_UW;
     case INDEX_op_smin_vec:
     case INDEX_op_smax_vec:
     case INDEX_op_umin_vec:
@@ -3352,13 +3352,13 @@ static void expand_vec_shi(TCGType type, unsigned v=
ece, bool shr,
               tcgv_vec_arg(t2), tcgv_vec_arg(v1), tcgv_vec_arg(v1));

     if (shr) {
-        tcg_gen_shri_vec(MO_16, t1, t1, imm + 8);
-        tcg_gen_shri_vec(MO_16, t2, t2, imm + 8);
+        tcg_gen_shri_vec(MO_UW, t1, t1, imm + 8);
+        tcg_gen_shri_vec(MO_UW, t2, t2, imm + 8);
     } else {
-        tcg_gen_shli_vec(MO_16, t1, t1, imm + 8);
-        tcg_gen_shli_vec(MO_16, t2, t2, imm + 8);
-        tcg_gen_shri_vec(MO_16, t1, t1, 8);
-        tcg_gen_shri_vec(MO_16, t2, t2, 8);
+        tcg_gen_shli_vec(MO_UW, t1, t1, imm + 8);
+        tcg_gen_shli_vec(MO_UW, t2, t2, imm + 8);
+        tcg_gen_shri_vec(MO_UW, t1, t1, 8);
+        tcg_gen_shri_vec(MO_UW, t2, t2, 8);
     }

     vec_gen_3(INDEX_op_x86_packus_vec, type, MO_UB,
@@ -3381,8 +3381,8 @@ static void expand_vec_sari(TCGType type, unsigned ve=
ce,
                   tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(v1));
         vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_UB,
                   tcgv_vec_arg(t2), tcgv_vec_arg(v1), tcgv_vec_arg(v1));
-        tcg_gen_sari_vec(MO_16, t1, t1, imm + 8);
-        tcg_gen_sari_vec(MO_16, t2, t2, imm + 8);
+        tcg_gen_sari_vec(MO_UW, t1, t1, imm + 8);
+        tcg_gen_sari_vec(MO_UW, t2, t2, imm + 8);
         vec_gen_3(INDEX_op_x86_packss_vec, type, MO_UB,
                   tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t2));
         tcg_temp_free_vec(t1);
@@ -3446,8 +3446,8 @@ static void expand_vec_mul(TCGType type, unsigned vec=
e,
                   tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t2));
         vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_TYPE_V128, MO_UB,
                   tcgv_vec_arg(t2), tcgv_vec_arg(t2), tcgv_vec_arg(v2));
-        tcg_gen_mul_vec(MO_16, t1, t1, t2);
-        tcg_gen_shri_vec(MO_16, t1, t1, 8);
+        tcg_gen_mul_vec(MO_UW, t1, t1, t2);
+        tcg_gen_shri_vec(MO_UW, t1, t1, 8);
         vec_gen_3(INDEX_op_x86_packus_vec, TCG_TYPE_V128, MO_UB,
                   tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t1));
         tcg_temp_free_vec(t1);
@@ -3469,10 +3469,10 @@ static void expand_vec_mul(TCGType type, unsigned v=
ece,
                   tcgv_vec_arg(t3), tcgv_vec_arg(v1), tcgv_vec_arg(t4));
         vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_UB,
                   tcgv_vec_arg(t4), tcgv_vec_arg(t4), tcgv_vec_arg(v2));
-        tcg_gen_mul_vec(MO_16, t1, t1, t2);
-        tcg_gen_mul_vec(MO_16, t3, t3, t4);
-        tcg_gen_shri_vec(MO_16, t1, t1, 8);
-        tcg_gen_shri_vec(MO_16, t3, t3, 8);
+        tcg_gen_mul_vec(MO_UW, t1, t1, t2);
+        tcg_gen_mul_vec(MO_UW, t3, t3, t4);
+        tcg_gen_shri_vec(MO_UW, t1, t1, 8);
+        tcg_gen_shri_vec(MO_UW, t3, t3, 8);
         vec_gen_3(INDEX_op_x86_packus_vec, type, MO_UB,
                   tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t3));
         tcg_temp_free_vec(t1);
diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
index c6d13ea..1780cb1 100644
--- a/tcg/mips/tcg-target.inc.c
+++ b/tcg/mips/tcg-target.inc.c
@@ -1383,7 +1383,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
     case MO_UB:
         i =3D tcg_out_call_iarg_reg8(s, i, l->datalo_reg);
         break;
-    case MO_16:
+    case MO_UW:
         i =3D tcg_out_call_iarg_reg16(s, i, l->datalo_reg);
         break;
     case MO_32:
@@ -1570,12 +1570,12 @@ static void tcg_out_qemu_st_direct(TCGContext *s, T=
CGReg lo, TCGReg hi,
         tcg_out_opc_imm(s, OPC_SB, lo, base, 0);
         break;

-    case MO_16 | MO_BSWAP:
+    case MO_UW | MO_BSWAP:
         tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP1, lo, 0xffff);
         tcg_out_bswap16(s, TCG_TMP1, TCG_TMP1);
         lo =3D TCG_TMP1;
         /* FALLTHRU */
-    case MO_16:
+    case MO_UW:
         tcg_out_opc_imm(s, OPC_SH, lo, base, 0);
         break;

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 9c60c0f..20bc19d 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1104,7 +1104,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
     case MO_UB:
         tcg_out_ext8u(s, a2, a2);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_out_ext16u(s, a2, a2);
         break;
     default:
@@ -1219,7 +1219,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
Reg lo, TCGReg hi,
     case MO_UB:
         tcg_out_opc_store(s, OPC_SB, base, lo, 0);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_out_opc_store(s, OPC_SH, base, lo, 0);
         break;
     case MO_32:
diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
index 479ee2e..85550b5 100644
--- a/tcg/sparc/tcg-target.inc.c
+++ b/tcg/sparc/tcg-target.inc.c
@@ -885,7 +885,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op=
)
     case MO_UB:
         tcg_out_arithi(s, r, r, 0xff, ARITH_AND);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_out_arithi(s, r, r, 16, SHIFT_SLL);
         tcg_out_arithi(s, r, r, 16, SHIFT_SRL);
         break;
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 9658c36..da409f5 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -308,7 +308,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c)
     switch (vece) {
     case MO_UB:
         return 0x0101010101010101ull * (uint8_t)c;
-    case MO_16:
+    case MO_UW:
         return 0x0001000100010001ull * (uint16_t)c;
     case MO_32:
         return 0x0000000100000001ull * (uint32_t)c;
@@ -327,7 +327,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i32 out, TC=
Gv_i32 in)
         tcg_gen_ext8u_i32(out, in);
         tcg_gen_muli_i32(out, out, 0x01010101);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_deposit_i32(out, in, in, 16, 16);
         break;
     case MO_32:
@@ -345,7 +345,7 @@ static void gen_dup_i64(unsigned vece, TCGv_i64 out, TC=
Gv_i64 in)
         tcg_gen_ext8u_i64(out, in);
         tcg_gen_muli_i64(out, out, 0x0101010101010101ull);
         break;
-    case MO_16:
+    case MO_UW:
         tcg_gen_ext16u_i64(out, in);
         tcg_gen_muli_i64(out, out, 0x0001000100010001ull);
         break;
@@ -558,7 +558,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32=
_t oprsz,
                 tcg_gen_extrl_i64_i32(t_32, in_64);
             } else if (vece =3D=3D MO_UB) {
                 tcg_gen_movi_i32(t_32, in_c & 0xff);
-            } else if (vece =3D=3D MO_16) {
+            } else if (vece =3D=3D MO_UW) {
                 tcg_gen_movi_i32(t_32, in_c & 0xffff);
             } else {
                 tcg_gen_movi_i32(t_32, in_c);
@@ -1459,7 +1459,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dof=
s, uint32_t aofs,
             case MO_UB:
                 tcg_gen_ld8u_i32(in, cpu_env, aofs);
                 break;
-            case MO_16:
+            case MO_UW:
                 tcg_gen_ld16u_i32(in, cpu_env, aofs);
                 break;
             default:
@@ -1526,7 +1526,7 @@ void tcg_gen_gvec_dup16i(uint32_t dofs, uint32_t oprs=
z,
                          uint32_t maxsz, uint16_t x)
 {
     check_size_align(oprsz, maxsz, dofs);
-    do_dup(MO_16, dofs, oprsz, maxsz, NULL, NULL, x);
+    do_dup(MO_UW, dofs, oprsz, maxsz, NULL, NULL, x);
 }

 void tcg_gen_gvec_dup8i(uint32_t dofs, uint32_t oprsz,
@@ -1579,7 +1579,7 @@ void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCG=
v_i64 b)

 void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_16, 0x8000));
+    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UW, 0x8000));
     gen_addv_mask(d, a, b, m);
     tcg_temp_free_i64(m);
 }
@@ -1613,7 +1613,7 @@ void tcg_gen_gvec_add(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_add16,
           .opt_opc =3D vecop_list_add,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_add_i32,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_add32,
@@ -1644,7 +1644,7 @@ void tcg_gen_gvec_adds(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_adds16,
           .opt_opc =3D vecop_list_add,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_add_i32,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_adds32,
@@ -1685,7 +1685,7 @@ void tcg_gen_gvec_subs(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_subs16,
           .opt_opc =3D vecop_list_sub,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_sub_i32,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_subs32,
@@ -1732,7 +1732,7 @@ void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCG=
v_i64 b)

 void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_16, 0x8000));
+    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UW, 0x8000));
     gen_subv_mask(d, a, b, m);
     tcg_temp_free_i64(m);
 }
@@ -1764,7 +1764,7 @@ void tcg_gen_gvec_sub(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_sub16,
           .opt_opc =3D vecop_list_sub,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_sub_i32,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_sub32,
@@ -1795,7 +1795,7 @@ void tcg_gen_gvec_mul(unsigned vece, uint32_t dofs, u=
int32_t aofs,
         { .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_mul16,
           .opt_opc =3D vecop_list_mul,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_mul_i32,
           .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_mul32,
@@ -1824,7 +1824,7 @@ void tcg_gen_gvec_muls(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_muls16,
           .opt_opc =3D vecop_list_mul,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_mul_i32,
           .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_muls32,
@@ -1862,7 +1862,7 @@ void tcg_gen_gvec_ssadd(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_ssadd_vec,
           .fno =3D gen_helper_gvec_ssadd16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fniv =3D tcg_gen_ssadd_vec,
           .fno =3D gen_helper_gvec_ssadd32,
           .opt_opc =3D vecop_list,
@@ -1888,7 +1888,7 @@ void tcg_gen_gvec_sssub(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_sssub_vec,
           .fno =3D gen_helper_gvec_sssub16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fniv =3D tcg_gen_sssub_vec,
           .fno =3D gen_helper_gvec_sssub32,
           .opt_opc =3D vecop_list,
@@ -1930,7 +1930,7 @@ void tcg_gen_gvec_usadd(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_usadd_vec,
           .fno =3D gen_helper_gvec_usadd16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_usadd_i32,
           .fniv =3D tcg_gen_usadd_vec,
           .fno =3D gen_helper_gvec_usadd32,
@@ -1974,7 +1974,7 @@ void tcg_gen_gvec_ussub(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_ussub_vec,
           .fno =3D gen_helper_gvec_ussub16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_ussub_i32,
           .fniv =3D tcg_gen_ussub_vec,
           .fno =3D gen_helper_gvec_ussub32,
@@ -2002,7 +2002,7 @@ void tcg_gen_gvec_smin(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_smin_vec,
           .fno =3D gen_helper_gvec_smin16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_smin_i32,
           .fniv =3D tcg_gen_smin_vec,
           .fno =3D gen_helper_gvec_smin32,
@@ -2030,7 +2030,7 @@ void tcg_gen_gvec_umin(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_umin_vec,
           .fno =3D gen_helper_gvec_umin16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_umin_i32,
           .fniv =3D tcg_gen_umin_vec,
           .fno =3D gen_helper_gvec_umin32,
@@ -2058,7 +2058,7 @@ void tcg_gen_gvec_smax(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_smax_vec,
           .fno =3D gen_helper_gvec_smax16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_smax_i32,
           .fniv =3D tcg_gen_smax_vec,
           .fno =3D gen_helper_gvec_smax32,
@@ -2086,7 +2086,7 @@ void tcg_gen_gvec_umax(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_umax_vec,
           .fno =3D gen_helper_gvec_umax16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_umax_i32,
           .fniv =3D tcg_gen_umax_vec,
           .fno =3D gen_helper_gvec_umax32,
@@ -2127,7 +2127,7 @@ void tcg_gen_vec_neg8_i64(TCGv_i64 d, TCGv_i64 b)

 void tcg_gen_vec_neg16_i64(TCGv_i64 d, TCGv_i64 b)
 {
-    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_16, 0x8000));
+    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UW, 0x8000));
     gen_negv_mask(d, b, m);
     tcg_temp_free_i64(m);
 }
@@ -2160,7 +2160,7 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_neg_vec,
           .fno =3D gen_helper_gvec_neg16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_neg_i32,
           .fniv =3D tcg_gen_neg_vec,
           .fno =3D gen_helper_gvec_neg32,
@@ -2206,7 +2206,7 @@ static void tcg_gen_vec_abs8_i64(TCGv_i64 d, TCGv_i64=
 b)

 static void tcg_gen_vec_abs16_i64(TCGv_i64 d, TCGv_i64 b)
 {
-    gen_absv_mask(d, b, MO_16);
+    gen_absv_mask(d, b, MO_UW);
 }

 void tcg_gen_gvec_abs(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -2223,7 +2223,7 @@ void tcg_gen_gvec_abs(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_abs_vec,
           .fno =3D gen_helper_gvec_abs16,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_abs_i32,
           .fniv =3D tcg_gen_abs_vec,
           .fno =3D gen_helper_gvec_abs32,
@@ -2461,7 +2461,7 @@ void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, in=
t64_t c)

 void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
-    uint64_t mask =3D dup_const(MO_16, 0xffff << c);
+    uint64_t mask =3D dup_const(MO_UW, 0xffff << c);
     tcg_gen_shli_i64(d, a, c);
     tcg_gen_andi_i64(d, d, mask);
 }
@@ -2480,7 +2480,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shli_vec,
           .fno =3D gen_helper_gvec_shl16i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_shli_i32,
           .fniv =3D tcg_gen_shli_vec,
           .fno =3D gen_helper_gvec_shl32i,
@@ -2512,7 +2512,7 @@ void tcg_gen_vec_shr8i_i64(TCGv_i64 d, TCGv_i64 a, in=
t64_t c)

 void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
-    uint64_t mask =3D dup_const(MO_16, 0xffff >> c);
+    uint64_t mask =3D dup_const(MO_UW, 0xffff >> c);
     tcg_gen_shri_i64(d, a, c);
     tcg_gen_andi_i64(d, d, mask);
 }
@@ -2531,7 +2531,7 @@ void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shri_vec,
           .fno =3D gen_helper_gvec_shr16i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_shri_i32,
           .fniv =3D tcg_gen_shri_vec,
           .fno =3D gen_helper_gvec_shr32i,
@@ -2570,8 +2570,8 @@ void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_i64 a, in=
t64_t c)

 void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
-    uint64_t s_mask =3D dup_const(MO_16, 0x8000 >> c);
-    uint64_t c_mask =3D dup_const(MO_16, 0xffff >> c);
+    uint64_t s_mask =3D dup_const(MO_UW, 0x8000 >> c);
+    uint64_t c_mask =3D dup_const(MO_UW, 0xffff >> c);
     TCGv_i64 s =3D tcg_temp_new_i64();

     tcg_gen_shri_i64(d, a, c);
@@ -2596,7 +2596,7 @@ void tcg_gen_gvec_sari(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_sari_vec,
           .fno =3D gen_helper_gvec_sar16i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_sari_i32,
           .fniv =3D tcg_gen_sari_vec,
           .fno =3D gen_helper_gvec_sar32i,
@@ -2884,7 +2884,7 @@ void tcg_gen_gvec_shlv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_shlv_mod_vec,
           .fno =3D gen_helper_gvec_shl16v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_shl_mod_i32,
           .fniv =3D tcg_gen_shlv_mod_vec,
           .fno =3D gen_helper_gvec_shl32v,
@@ -2947,7 +2947,7 @@ void tcg_gen_gvec_shrv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_shrv_mod_vec,
           .fno =3D gen_helper_gvec_shr16v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_shr_mod_i32,
           .fniv =3D tcg_gen_shrv_mod_vec,
           .fno =3D gen_helper_gvec_shr32v,
@@ -3010,7 +3010,7 @@ void tcg_gen_gvec_sarv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_sarv_mod_vec,
           .fno =3D gen_helper_gvec_sar16v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_16 },
+          .vece =3D MO_UW },
         { .fni4 =3D tcg_gen_sar_mod_i32,
           .fniv =3D tcg_gen_sarv_mod_vec,
           .fno =3D gen_helper_gvec_sar32v,
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index d7ffc9e..b0a4d98 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -270,7 +270,7 @@ void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)

 void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_16, a));
+    do_dupi_vec(r, MO_REG, dup_const(MO_UW, a));
 }

 void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 61eda33..21d448c 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2723,7 +2723,7 @@ static inline TCGMemOp tcg_canonicalize_memop(TCGMemO=
p op, bool is64, bool st)
     case MO_UB:
         op &=3D ~MO_BSWAP;
         break;
-    case MO_16:
+    case MO_UW:
         break;
     case MO_32:
         if (!is64) {
@@ -2810,7 +2810,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)

     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
-        case MO_16:
+        case MO_UW:
             tcg_gen_bswap16_i32(val, val);
             if (orig_memop & MO_SIGN) {
                 tcg_gen_ext16s_i32(val, val);
@@ -2837,7 +2837,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         swap =3D tcg_temp_new_i32();
         switch (memop & MO_SIZE) {
-        case MO_16:
+        case MO_UW:
             tcg_gen_ext16u_i32(swap, val);
             tcg_gen_bswap16_i32(swap, swap);
             break;
@@ -2890,7 +2890,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)

     if ((orig_memop ^ memop) & MO_BSWAP) {
         switch (orig_memop & MO_SIZE) {
-        case MO_16:
+        case MO_UW:
             tcg_gen_bswap16_i64(val, val);
             if (orig_memop & MO_SIGN) {
                 tcg_gen_ext16s_i64(val, val);
@@ -2928,7 +2928,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCG=
Arg idx, TCGMemOp memop)
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
         swap =3D tcg_temp_new_i64();
         switch (memop & MO_SIZE) {
-        case MO_16:
+        case MO_UW:
             tcg_gen_ext16u_i64(swap, val);
             tcg_gen_bswap16_i64(swap, swap);
             break;
@@ -3025,8 +3025,8 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env,=
 TCGv, TCGv_i64);

 static void * const table_cmpxchg[16] =3D {
     [MO_UB] =3D gen_helper_atomic_cmpxchgb,
-    [MO_16 | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,
-    [MO_16 | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,
+    [MO_UW | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,
+    [MO_UW | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,
     [MO_32 | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,
     [MO_32 | MO_BE] =3D gen_helper_atomic_cmpxchgl_be,
     WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomic_cmpxchgq_le)
@@ -3249,8 +3249,8 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr,=
 TCGv_i64 val,
 #define GEN_ATOMIC_HELPER(NAME, OP, NEW)                                \
 static void * const table_##NAME[16] =3D {                                =
\
     [MO_UB] =3D gen_helper_atomic_##NAME##b,                              =
 \
-    [MO_16 | MO_LE] =3D gen_helper_atomic_##NAME##w_le,                   =
\
-    [MO_16 | MO_BE] =3D gen_helper_atomic_##NAME##w_be,                   =
\
+    [MO_UW | MO_LE] =3D gen_helper_atomic_##NAME##w_le,                   =
\
+    [MO_UW | MO_BE] =3D gen_helper_atomic_##NAME##w_be,                   =
\
     [MO_32 | MO_LE] =3D gen_helper_atomic_##NAME##l_le,                   =
\
     [MO_32 | MO_BE] =3D gen_helper_atomic_##NAME##l_be,                   =
\
     WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomic_##NAME##q_le)     =
\
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 5636d6b..a378887 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -1303,7 +1303,7 @@ uint64_t dup_const(unsigned vece, uint64_t c);
 #define dup_const(VECE, C)                                         \
     (__builtin_constant_p(VECE)                                    \
      ?   ((VECE) =3D=3D MO_UB ? 0x0101010101010101ull * (uint8_t)(C)   \
-        : (VECE) =3D=3D MO_16 ? 0x0001000100010001ull * (uint16_t)(C)  \
+        : (VECE) =3D=3D MO_UW ? 0x0001000100010001ull * (uint16_t)(C)  \
         : (VECE) =3D=3D MO_32 ? 0x0000000100000001ull * (uint32_t)(C)  \
         : dup_const(VECE, C))                                      \
      : dup_const(VECE, C))
--
1.8.3.1




--_000_156381001643348708btcom_
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
<div><span style=3D"font-size: 12pt;">Preparation for splitting MO_16 out f=
rom TCGMemOp into new accelerator</span></div>
<div>independent MemOp.</div>
<div><br>
</div>
<div>As MO_16 will be a value of MemOp, existing TCGMemOp comparisons and</=
div>
<div>coercions will trigger -Wenum-compare and -Wenum-conversion.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;target/arm/sve_helper.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 4 &#43;-</div>
<div>&nbsp;target/arm/translate-a64.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp;90 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------</div>
<div>&nbsp;target/arm/translate-sve.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp;40 &#43;&#43;&#43;&#43;----</div>
<div>&nbsp;target/arm/translate-vfp.inc.c &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#=
43;-</div>
<div>&nbsp;target/arm/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp;32 &#43;&#43;&#43;---</div>
<div>&nbsp;target/i386/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | 200 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;------------------</div>
<div>&nbsp;target/mips/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp; 2 &#43;-</div>
<div>&nbsp;target/ppc/translate/vmx-impl.inc.c | &nbsp;28 &#43;&#43;---</di=
v>
<div>&nbsp;target/s390x/translate_vx.inc.c &nbsp; &nbsp; | &nbsp; 2 &#43;-<=
/div>
<div>&nbsp;target/s390x/vec.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp; 4 &#43;-</div>
<div>&nbsp;tcg/aarch64/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;=
20 &#43;&#43;--</div>
<div>&nbsp;tcg/arm/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp; 6 &#43;-</div>
<div>&nbsp;tcg/i386/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp;48 &#43;&#43;&#43;&#43;-----</div>
<div>&nbsp;tcg/mips/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp; 6 &#43;-</div>
<div>&nbsp;tcg/riscv/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 4 &#43;-</div>
<div>&nbsp;tcg/sparc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/tcg-op-gvec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | &nbsp;72 &#43;&#43;&#43;&#43;&#43;&#43;-------</div>
<div>&nbsp;tcg/tcg-op-vec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| &nbsp; 2 &#43;-</div>
<div>&nbsp;tcg/tcg-op.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;18 &#43;&#43;--</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 &#43;-</div>
<div>&nbsp;20 files changed, 292 insertions(&#43;), 292 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c</div>
<div>index 4c7e11f..f6bef3d 100644</div>
<div>--- a/target/arm/sve_helper.c</div>
<div>&#43;&#43;&#43; b/target/arm/sve_helper.c</div>
<div>@@ -1546,7 &#43;1546,7 @@ void HELPER(sve_cpy_m_h)(void *vd, void *vn,=
 void *vg,</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t *d =3D vd, *n =3D vn;</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *pg =3D vg;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;mm =3D dup_const(MO_16, mm);</div>
<div>&#43; &nbsp; &nbsp;mm =3D dup_const(MO_UW, mm);</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; opr_sz; i &#43;=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint64_t nn =3D n[i];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint64_t pp =3D expand_pred_h(pg[H1(=
i)]);</div>
<div>@@ -1600,7 &#43;1600,7 @@ void HELPER(sve_cpy_z_h)(void *vd, void *vg,=
 uint64_t val, uint32_t desc)</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t *d =3D vd;</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *pg =3D vg;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;val =3D dup_const(MO_16, val);</div>
<div>&#43; &nbsp; &nbsp;val =3D dup_const(MO_UW, val);</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; opr_sz; i &#43;=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d[i] =3D val &amp; expand_pred_h(pg[=
H1(i)]);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c</=
div>
<div>index f840b43..3acfccb 100644</div>
<div>--- a/target/arm/translate-a64.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-a64.c</div>
<div>@@ -492,7 &#43;492,7 @@ static TCGv_i32 read_fp_hreg(DisasContext *s, =
int reg)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 v =3D tcg_temp_new_i32();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;tcg_gen_ld16u_i32(v, cpu_env, fp_reg_offset(s, reg, MO_=
16));</div>
<div>&#43; &nbsp; &nbsp;tcg_gen_ld16u_i32(v, cpu_env, fp_reg_offset(s, reg,=
 MO_UW));</div>
<div>&nbsp; &nbsp; &nbsp;return v;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -996,7 &#43;996,7 @@ static void read_vec_element(DisasContext *s, =
TCGv_i64 tcg_dest, int srcidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8u_i64(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16u_i64(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1005,7 &#43;1005,7 @@ static void read_vec_element(DisasContext *s=
, TCGv_i64 tcg_dest, int srcidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_SB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8s_i64(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16|MO_SIGN:</div>
<div>&#43; &nbsp; &nbsp;case MO_SW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16s_i64(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32|MO_SIGN:</div>
<div>@@ -1028,13 &#43;1028,13 @@ static void read_vec_element_i32(DisasCont=
ext *s, TCGv_i32 tcg_dest, int srcidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8u_i32(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16u_i32(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_SB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8s_i32(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16|MO_SIGN:</div>
<div>&#43; &nbsp; &nbsp;case MO_SW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16s_i32(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1055,7 &#43;1055,7 @@ static void write_vec_element(DisasContext *=
s, TCGv_i64 tcg_src, int destidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i64(tcg_src, cpu_env, ve=
ct_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i64(tcg_src, cpu_env, v=
ect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1077,7 &#43;1077,7 @@ static void write_vec_element_i32(DisasConte=
xt *s, TCGv_i32 tcg_src,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i32(tcg_src, cpu_env, ve=
ct_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i32(tcg_src, cpu_env, v=
ect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -5269,7 &#43;5269,7 @@ static void handle_fp_compare(DisasContext *=
s, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool cmp_with_zero, bool signal_al=
l_nans)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 tcg_flags =3D tcg_temp_new_i64();</div>
<div>- &nbsp; &nbsp;TCGv_ptr fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);<=
/div>
<div>&#43; &nbsp; &nbsp;TCGv_ptr fpst =3D get_fpstatus_ptr(size =3D=3D MO_U=
W);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (size =3D=3D MO_64) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_vn, tcg_vm;</div>
<div>@@ -5306,7 &#43;5306,7 @@ static void handle_fp_compare(DisasContext *=
s, int size,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_vfp_cmps_a64(tcg_flags, tcg_vn, tcg_vm, fpst);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (signal_all_nans) {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_vfp_cmpeh_a64(tcg_flags, tcg_vn, tcg_vm, fpst);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -5360,7 &#43;5360,7 @@ static void disas_fp_compare(DisasContext *s=
, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 3:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dc_isar_feature(aa64_fp16, s)) {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -5411,7 &#43;5411,7 @@ static void disas_fp_ccomp(DisasContext *s, =
uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 3:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dc_isar_feature(aa64_fp16, s)) {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -5477,7 &#43;5477,7 @@ static void disas_fp_csel(DisasContext *s, u=
int32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 3:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dc_isar_feature(aa64_fp16, s)) {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -6282,7 &#43;6282,7 @@ static void disas_fp_imm(DisasContext *s, ui=
nt32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 3:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;sz =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dc_isar_feature(aa64_fp16, s)) {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -6593,7 &#43;6593,7 @@ static void handle_fmov(DisasContext *s, int=
 rd, int rn, int type, bool itof)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 3:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* 16 bit */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16u_i64(tcg_rd, c=
pu_env, fp_reg_offset(s, rn, MO_16));</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16u_i64(tcg_r=
d, cpu_env, fp_reg_offset(s, rn, MO_UW));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert_not_reached()=
;</div>
<div>@@ -7030,7 &#43;7030,7 @@ static TCGv_i32 do_reduction_op(DisasContext=
 *s, int fpopcode, int rn,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (esize =3D=3D size) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int element;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp msize =3D esize =3D=3D 16 ? MO_1=
6 : MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGMemOp msize =3D esize =3D=3D 16 ? =
MO_UW : MO_32;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_elem;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* We should have one register left =
here */</div>
<div>@@ -7204,7 &#43;7204,7 @@ static void disas_simd_across_lanes(DisasCon=
text *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Note that correct NaN propagation=
 requires that we do these</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * operations in exactly the order s=
pecified by the pseudocode.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr fpst =3D get_fpstatus_ptr(size =
=3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr fpst =3D get_fpstatus_ptr(si=
ze =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int fpopcode =3D opcode | is_min &lt=
;&lt; 4 | is_u &lt;&lt; 5;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int vmap =3D (1 &lt;&lt; elements) -=
 1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_res32 =3D do_reduction_=
op(s, fpopcode, rn, esize,</div>
<div>@@ -7591,7 &#43;7591,7 @@ static void disas_simd_mod_imm(DisasContext =
*s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (o2) =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;/* FMOV (vector, immediate) - half-precision */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;imm =3D vfp_expand_imm(MO_16, abcdefgh);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;imm =3D vfp_expand_imm(MO_UW, abcdefgh);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;/* now duplicate across the lanes */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;imm =3D bitfield_replicate(imm, 16);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>@@ -7699,7 &#43;7699,7 @@ static void disas_simd_scalar_pairwise(Disas=
Context *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unalloca=
ted_encoding(s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_1=
6;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D =
MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D extract32(siz=
e, 0, 1) ? MO_64 : MO_32;</div>
<div>@@ -7709,7 &#43;7709,7 @@ static void disas_simd_scalar_pairwise(Disas=
Context *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;fpst =3D get_fpstatus_ptr(size =3D=3D MO_=
16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;fpst =3D get_fpstatus_ptr(size =3D=3D=
 MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s);</div>
<div>@@ -7760,7 &#43;7760,7 @@ static void disas_simd_scalar_pairwise(Disas=
Context *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op1, rn,=
 0, size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg_op2, rn,=
 1, size);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (size =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (size =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (opcode) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0xc: /* FMAXNMP *=
/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);</div>
<div>@@ -8222,7 &#43;8222,7 @@ static void handle_simd_intfp_conv(DisasCont=
ext *s, int rd, int rn,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int elements, int i=
s_signed,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int fracbits, int s=
ize)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGv_ptr tcg_fpst =3D get_fpstatus_ptr(size =3D=3D MO_1=
6);</div>
<div>&#43; &nbsp; &nbsp;TCGv_ptr tcg_fpst =3D get_fpstatus_ptr(size =3D=3D =
MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i32 tcg_shift =3D NULL;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp mop =3D size | (is_signed ? MO_SIGN : 0);=
</div>
<div>@@ -8281,7 &#43;8281,7 @@ static void handle_simd_intfp_conv(DisasCont=
ext *s, int rd, int rn,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (frac=
bits) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if (is_signed) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;gen_helper_vfp_sltoh(tcg_float, tcg_int32,</div>
<div>@@ -8339,7 &#43;8339,7 @@ static void handle_simd_shift_intfp_conv(Dis=
asContext *s, bool is_scalar,</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 4) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_32;</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 2) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!dc_isar_feature(aa64_fp16, s)) =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>@@ -8384,7 &#43;8384,7 @@ static void handle_simd_shift_fpint_conv(Dis=
asContext *s, bool is_scalar,</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 0x4) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_32;</div>
<div>&nbsp; &nbsp; &nbsp;} else if (immh &amp; 0x2) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!dc_isar_feature(aa64_fp16, s)) =
{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>@@ -8403,7 &#43;8403,7 @@ static void handle_simd_shift_fpint_conv(Dis=
asContext *s, bool is_scalar,</div>
<div>&nbsp; &nbsp; &nbsp;assert(!(is_scalar &amp;&amp; is_q));</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_rmode =3D tcg_const_i32(arm_rmode_to_sf(FPROUN=
DING_ZERO));</div>
<div>- &nbsp; &nbsp;tcg_fpstatus =3D get_fpstatus_ptr(size =3D=3D MO_16);</=
div>
<div>&#43; &nbsp; &nbsp;tcg_fpstatus =3D get_fpstatus_ptr(size =3D=3D MO_UW=
);</div>
<div>&nbsp; &nbsp; &nbsp;gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fps=
tatus);</div>
<div>&nbsp; &nbsp; &nbsp;fracbits =3D (16 &lt;&lt; size) - immhb;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_shift =3D tcg_const_i32(fracbits);</div>
<div>@@ -8429,7 &#43;8429,7 @@ static void handle_simd_shift_fpint_conv(Dis=
asContext *s, bool is_scalar,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int maxpass =3D is_scalar ? 1 : ((8 =
&lt;&lt; is_q) &gt;&gt; size);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_u) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D g=
en_helper_vfp_touhh;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -9388,7 &#43;9388,7 @@ static void handle_2misc_fcmp_zero(DisasCont=
ext *s, int opcode,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;fpst =3D get_fpstatus_ptr(size =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp;fpst =3D get_fpstatus_ptr(size =3D=3D MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (is_double) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64 tcg_op =3D tcg_temp_new_i64=
();</div>
<div>@@ -9440,7 &#43;9440,7 @@ static void handle_2misc_fcmp_zero(DisasCont=
ext *s, int opcode,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool swap =3D false;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int pass, maxpasses;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (size =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (size =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (opcode) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x2e: /* FCMLT (z=
ero) */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;swap =3D=
 true;</div>
<div>@@ -11422,8 &#43;11422,8 @@ static void disas_simd_three_reg_same_fp16=
(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int passreg =3D pass &=
lt; (maxpass / 2) ? rn : rm;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int passelt =3D (pass =
&lt;&lt; 1) &amp; (maxpass - 1);</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op1, passreg, passelt, MO_16);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op2, passreg, passelt &#43; 1, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op1, passreg, passelt, MO_UW);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op2, passreg, passelt &#43; 1, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res[pass] =3D tcg_=
temp_new_i32();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (fpopcode) {</d=
iv>
<div>@@ -11450,7 &#43;11450,7 @@ static void disas_simd_three_reg_same_fp16=
(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; maxpass; =
pass&#43;&#43;) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_res[pass], rd, pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_res[pass], rd, pass, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res[pass]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -11463,15 &#43;11463,15 @@ static void disas_simd_three_reg_same_fp=
16(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_op2 =3D t=
cg_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_res =3D t=
cg_temp_new_i32();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op1, rn, pass, MO_16);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op2, rm, pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op1, rn, pass, MO_UW);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op2, rm, pass, MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (fpopcode) {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x0: /* FMAXNM */=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x1: /* FMLA */</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_elem=
ent_i32(s, tcg_res, rd, pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_=
element_i32(s, tcg_res, rd, pass, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_res,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; fpst);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -11496,7 &#43;11496,7 @@ static void disas_simd_three_reg_same_fp16=
(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x9: /* FMLS */</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* As us=
ual for ARM, separate negation for fused multiply-add */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
xori_i32(tcg_op1, tcg_op1, 0x8000);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_elem=
ent_i32(s, tcg_res, rd, pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_=
element_i32(s, tcg_res, rd, pass, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_res,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; fpst);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -11537,7 &#43;11537,7 @@ static void disas_simd_three_reg_same_fp16=
(DisasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert=
_not_reached();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_res, rd, pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_res, rd, pass, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op2);</div>
<div>@@ -11727,7 &#43;11727,7 @@ static void handle_2misc_widening(DisasCon=
text *s, int opcode, bool is_q,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (pass =3D 0; pass &lt; 4; pass&#=
43;&#43;) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_res[pass] =3D tcg_=
temp_new_i32();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_res[pass], rn, srcelt &#43; pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_res[pass], rn, srcelt &#43; pass, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_vfp_fcvt_f1=
6_to_f32(tcg_res[pass], tcg_res[pass],</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; fpst, ahp);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -11768,7 &#43;11768,7 @@ static void handle_rev(DisasContext *s, in=
t opcode, bool u,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element(s, tc=
g_tmp, rn, i, grp_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (grp_size) {</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
bswap16_i64(tcg_tmp, tcg_tmp);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -12499,7 &#43;12499,7 @@ static void disas_simd_two_reg_misc_fp16(D=
isasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!fp_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;handle_simd_intfp_conv(s, rd, rn, element=
s, !u, 0, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;handle_simd_intfp_conv(s, rd, rn, ele=
ments, !u, 0, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -12508,7 &#43;12508,7 @@ static void disas_simd_two_reg_misc_fp16(D=
isasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp;case 0x2e: /* FCMLT (zero) */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x6c: /* FCMGE (zero) */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x6d: /* FCMLE (zero) */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;handle_2misc_fcmp_zero(s, fpop, is_scalar=
, 0, is_q, MO_16, rn, rd);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;handle_2misc_fcmp_zero(s, fpop, is_sc=
alar, 0, is_q, MO_UW, rn, rd);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x3d: /* FRECPE */</div>
<div>&nbsp; &nbsp; &nbsp;case 0x3f: /* FRECPX */</div>
<div>@@ -12668,7 &#43;12668,7 @@ static void disas_simd_two_reg_misc_fp16(D=
isasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_op =3D tc=
g_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tcg_res =3D t=
cg_temp_new_i32();</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s, tcg=
_op, rn, pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_vec_element_i32(s,=
 tcg_op, rn, pass, MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (fpop) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x1a: /* FCVTNS *=
/</div>
<div>@@ -12715,7 &#43;12715,7 @@ static void disas_simd_two_reg_misc_fp16(D=
isasContext *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_assert=
_not_reached();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s, tc=
g_res, rd, pass, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_vec_element_i32(s=
, tcg_res, rd, pass, MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
res);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(tcg_=
op);</div>
<div>@@ -12839,7 &#43;12839,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* is_fp, but we pass cpu_env not fp=
_status. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -12852,7 &#43;12852,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* convert insn encoded size to TCGM=
emOp size */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0: /* half-precision */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;is_fp16 =3D true;</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32: /* single precision */</=
div>
<div>@@ -12899,7 &#43;12899,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Given TCGMemOp size, adjust register and indexi=
ng. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;index =3D h &lt;&lt; 2 | l &lt;&lt; =
1 | m;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c</=
div>
<div>index ec5fb11..2bc1bd1 100644</div>
<div>--- a/target/arm/translate-sve.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-sve.c</div>
<div>@@ -1679,7 &#43;1679,7 @@ static void do_sat_addsub_vec(DisasContext *=
s, int esz, int rd, int rn,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_i32(t32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t32 =3D tcg_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_extrl_i64_i32(t32, val);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (d) {</div>
<div>@@ -3314,7 &#43;3314,7 @@ static bool trans_SUBR_zzi(DisasContext *s, =
arg_rri_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_sve_subri=
_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.scalar_first =3D true },</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_sub_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>@@ -3468,7 &#43;3468,7 @@ static bool trans_FMLA_zzxz(DisasContext *s,=
 arg_FMLA_zzxz *a)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_4_ptr(vec_full_reg_offs=
et(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -3494,7 &#43;3494,7 @@ static bool trans_FMUL_zzx(DisasContext *s, =
arg_FMUL_zzx *a)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_3_ptr(vec_full_reg_offs=
et(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -3526,7 &#43;3526,7 @@ static void do_reduce(DisasContext *s, arg_r=
pr_esz *a,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offse=
t(s, a-&gt;rn));</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offs=
et(s, a-&gt;pg));</div>
<div>- &nbsp; &nbsp;status =3D get_fpstatus_ptr(a-&gt;esz =3D=3D MO_16);</d=
iv>
<div>&#43; &nbsp; &nbsp;status =3D get_fpstatus_ptr(a-&gt;esz =3D=3D MO_UW)=
;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;fn(temp, t_zn, t_pg, status, t_desc);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_ptr(t_zn);</div>
<div>@@ -3568,7 &#43;3568,7 @@ DO_VPZ(FMAXV, fmaxv)</div>
<div>&nbsp;static void do_zz_fp(DisasContext *s, arg_rr_esz *a, gen_helper_=
gvec_2_ptr *fn)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s);</div>
<div>- &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&gt;esz =3D=3D M=
O_16);</div>
<div>&#43; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&gt;esz =3D=
=3D MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a-&gt;rd=
),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>@@ -3616,7 &#43;3616,7 @@ static void do_ppz_fp(DisasContext *s, arg_r=
pr_esz *a,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;gen_helper_gvec_3_ptr *fn)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s);</div>
<div>- &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&gt;esz =3D=3D M=
O_16);</div>
<div>&#43; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&gt;esz =3D=
=3D MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_gvec_3_ptr(pred_full_reg_offset(s, a-&gt;r=
d),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>@@ -3668,7 &#43;3668,7 @@ static bool trans_FTMAD(DisasContext *s, arg=
_FTMAD *a)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_3_ptr(vec_full_reg_offs=
et(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -3708,7 &#43;3708,7 @@ static bool trans_FADDA(DisasContext *s, arg=
_rprr_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp;t_pg =3D tcg_temp_new_ptr();</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_ptr(t_rm, cpu_env, vec_full_reg_offse=
t(s, a-&gt;rm));</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offs=
et(s, a-&gt;pg));</div>
<div>- &nbsp; &nbsp;t_fpst =3D get_fpstatus_ptr(a-&gt;esz =3D=3D MO_16);</d=
iv>
<div>&#43; &nbsp; &nbsp;t_fpst =3D get_fpstatus_ptr(a-&gt;esz =3D=3D MO_UW)=
;</div>
<div>&nbsp; &nbsp; &nbsp;t_desc =3D tcg_const_i32(simd_desc(vsz, vsz, 0));<=
/div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;fns[a-&gt;esz - 1](t_val, t_val, t_rm, t_pg, t_fps=
t, t_desc);</div>
<div>@@ -3735,7 &#43;3735,7 @@ static bool do_zzz_fp(DisasContext *s, arg_r=
rr_esz *a,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_3_ptr(vec_full_reg_offs=
et(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -3777,7 &#43;3777,7 @@ static bool do_zpzz_fp(DisasContext *s, arg_=
rprr_esz *a,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_4_ptr(vec_full_reg_offs=
et(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -3844,7 &#43;3844,7 @@ static void do_fp_imm(DisasContext *s, arg_r=
pri_esz *a, uint64_t imm,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;gen_helper_sve_fp2scalar *fn)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 temp =3D tcg_const_i64(imm);</div>
<div>- &nbsp; &nbsp;do_fp_scalar(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, a-&gt;esz=
 =3D=3D MO_16, temp, fn);</div>
<div>&#43; &nbsp; &nbsp;do_fp_scalar(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, a-&gt=
;esz =3D=3D MO_UW, temp, fn);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i64(temp);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -3893,7 &#43;3893,7 @@ static bool do_fp_cmp(DisasContext *s, arg_r=
prr_esz *a,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_4_ptr(pred_full_reg_off=
set(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -3937,7 &#43;3937,7 @@ static bool trans_FCADD(DisasContext *s, arg=
_FCADD *a)</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_4_ptr(vec_full_reg_offs=
et(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -4044,7 &#43;4044,7 @@ static bool trans_FCMLA_zzxz(DisasContext *s=
, arg_FCMLA_zzxz *a)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_debug_assert(a-&gt;rd =3D=3D a-&gt;ra);</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_3_ptr(vec_full_reg_offs=
et(s, a-&gt;rd),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rn),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; vec_full_reg_offset(s, a-&gt;rm),</div>
<div>@@ -4186,7 &#43;4186,7 @@ static bool trans_FRINTI(DisasContext *s, ar=
g_rpr_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp;if (a-&gt;esz =3D=3D 0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, a-&g=
t;esz =3D=3D MO_16,</div>
<div>&#43; &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, =
a-&gt;esz =3D=3D MO_UW,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;frint_fns[a-&gt;esz - 1]);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -4200,7 &#43;4200,7 @@ static bool trans_FRINTX(DisasContext *s, ar=
g_rpr_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp;if (a-&gt;esz =3D=3D 0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, a-&g=
t;esz =3D=3D MO_16, fns[a-&gt;esz - 1]);</div>
<div>&#43; &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, =
a-&gt;esz =3D=3D MO_UW, fns[a-&gt;esz - 1]);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int m=
ode)</div>
<div>@@ -4211,7 &#43;4211,7 @@ static bool do_frint_mode(DisasContext *s, a=
rg_rpr_esz *a, int mode)</div>
<div>&nbsp; &nbsp; &nbsp;if (sve_access_check(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned vsz =3D vec_full_reg_size(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 tmode =3D tcg_const_i32(mod=
e);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(a-&g=
t;esz =3D=3D MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_ptr status =3D get_fpstatus_ptr(=
a-&gt;esz =3D=3D MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_set_rmode(tmode, tmode, s=
tatus);</div>
<div>&nbsp;</div>
<div>@@ -4262,7 &#43;4262,7 @@ static bool trans_FRECPX(DisasContext *s, ar=
g_rpr_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp;if (a-&gt;esz =3D=3D 0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, a-&g=
t;esz =3D=3D MO_16, fns[a-&gt;esz - 1]);</div>
<div>&#43; &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, =
a-&gt;esz =3D=3D MO_UW, fns[a-&gt;esz - 1]);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static bool trans_FSQRT(DisasContext *s, arg_rpr_esz *a)</div>
<div>@@ -4275,7 &#43;4275,7 @@ static bool trans_FSQRT(DisasContext *s, arg=
_rpr_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp;if (a-&gt;esz =3D=3D 0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return false;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>- &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, a-&g=
t;esz =3D=3D MO_16, fns[a-&gt;esz - 1]);</div>
<div>&#43; &nbsp; &nbsp;return do_zpz_ptr(s, a-&gt;rd, a-&gt;rn, a-&gt;pg, =
a-&gt;esz =3D=3D MO_UW, fns[a-&gt;esz - 1]);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a)</div=
>
<div>diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp=
.inc.c</div>
<div>index 092eb5e..549874c 100644</div>
<div>--- a/target/arm/translate-vfp.inc.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-vfp.inc.c</div>
<div>@@ -52,7 &#43;52,7 @@ uint64_t vfp_expand_imm(int size, uint8_t imm8)<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(extract32(imm8, 0, 6)=
 &lt;&lt; 3);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;imm &lt;&lt;=3D 16;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;imm =3D (extract32(imm8, 7, 1) ? 0x8=
000 : 0) |</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(extract32(imm8, 6, 1)=
 ? 0x3000 : 0x4000) |</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(extract32(imm8, 0, 6)=
 &lt;&lt; 6);</div>
<div>diff --git a/target/arm/translate.c b/target/arm/translate.c</div>
<div>index 39266cf..8d10922 100644</div>
<div>--- a/target/arm/translate.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate.c</div>
<div>@@ -1477,7 &#43;1477,7 @@ static void neon_store_element(int reg, int =
ele, TCGMemOp size, TCGv_i32 var)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i32(var, cpu_env, offset=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i32(var, cpu_env, offse=
t);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1496,7 &#43;1496,7 @@ static void neon_store_element64(int reg, in=
t ele, TCGMemOp size, TCGv_i64 var)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i64(var, cpu_env, offset=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st16_i64(var, cpu_env, offse=
t);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -4267,7 &#43;4267,7 @@ const GVecGen2i ssra_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_ssra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_ssra,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_ssra32_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_ssra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4325,7 &#43;4325,7 @@ const GVecGen2i usra_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_usra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_usra,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16, },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW, },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_usra32_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_usra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4353,7 &#43;4353,7 @@ static void gen_shr8_ins_i64(TCGv_i64 d, TCG=
v_i64 a, int64_t shift)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_shr16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh=
ift)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_16, 0xffff &gt;&gt; shif=
t);</div>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UW, 0xffff &gt;&gt; =
shift);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 t =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shri_i64(t, a, shift);</div>
<div>@@ -4405,7 &#43;4405,7 @@ const GVecGen2i sri_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shr_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sri,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_shr32_ins_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shr_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4433,7 &#43;4433,7 @@ static void gen_shl8_ins_i64(TCGv_i64 d, TCG=
v_i64 a, int64_t shift)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_shl16_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh=
ift)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_16, 0xffff &lt;&lt; shif=
t);</div>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UW, 0xffff &lt;&lt; =
shift);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 t =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shli_i64(t, a, shift);</div>
<div>@@ -4483,7 &#43;4483,7 @@ const GVecGen2i sli_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shl_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sli,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_shl32_ins_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shl_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4579,7 &#43;4579,7 @@ const GVecGen3 mla_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mla_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mla,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_mla32_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mla_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4603,7 &#43;4603,7 @@ const GVecGen3 mls_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mls_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mls,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_mls32_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mls_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4649,7 &#43;4649,7 @@ const GVecGen3 cmtst_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_helper_neon_tst_u16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_cmtst_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_cmtst,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_cmtst_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_cmtst_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_cmtst,</div>
<div>@@ -4686,7 &#43;4686,7 @@ const GVecGen4 uqadd_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqadd_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqadd,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_uqadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqadd_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>@@ -4724,7 &#43;4724,7 @@ const GVecGen4 sqadd_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqadd_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqadd,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_sqadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqadd_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqadd,</div>
<div>@@ -4762,7 &#43;4762,7 @@ const GVecGen4 uqsub_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqsub_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqsub,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_uqsub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqsub_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqsub,</div>
<div>@@ -4800,7 &#43;4800,7 @@ const GVecGen4 sqsub_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqsub_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqsub,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_sqsub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqsub_s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqsub,</div>
<div>@@ -6876,7 &#43;6876,7 @@ static int disas_neon_data_insn(DisasContext=
 *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;size =3D MO_UB;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;element =3D (insn &gt;&gt; 17) &amp; 7;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else i=
f (insn &amp; (1 &lt;&lt; 17)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;size =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;size =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;element =3D (insn &gt;&gt; 18) &amp; 3;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;size =3D MO_32;</div>
<div>diff --git a/target/i386/translate.c b/target/i386/translate.c</div>
<div>index 0e45300..0535bae 100644</div>
<div>--- a/target/i386/translate.c</div>
<div>&#43;&#43;&#43; b/target/i386/translate.c</div>
<div>@@ -323,7 &#43;323,7 @@ static inline bool byte_reg_is_xH(DisasContext=
 *s, int reg)</div>
<div>&nbsp;static inline TCGMemOp mo_pushpop(DisasContext *s, TCGMemOp ot)<=
/div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;if (CODE64(s)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return ot =3D=3D MO_16 ? MO_16 : MO_64;</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return ot =3D=3D MO_UW ? MO_UW : MO_6=
4;</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return ot;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>@@ -332,7 &#43;332,7 @@ static inline TCGMemOp mo_pushpop(DisasContext=
 *s, TCGMemOp ot)</div>
<div>&nbsp;/* Select the size of the stack pointer. &nbsp;*/</div>
<div>&nbsp;static inline TCGMemOp mo_stacksize(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_32 : MO_16;<=
/div>
<div>&#43; &nbsp; &nbsp;return CODE64(s) ? MO_64 : s-&gt;ss32 ? MO_32 : MO_=
UW;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select only size 64 else 32. &nbsp;Used for SSE operand sizes=
. &nbsp;*/</div>
<div>@@ -356,7 &#43;356,7 @@ static inline TCGMemOp mo_b_d(int b, TCGMemOp =
ot)</div>
<div>&nbsp; &nbsp; Used for decoding operand size of port opcodes. &nbsp;*/=
</div>
<div>&nbsp;static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return b &amp; 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_32) : =
MO_UB;</div>
<div>&#43; &nbsp; &nbsp;return b &amp; 1 ? (ot =3D=3D MO_UW ? MO_UW : MO_32=
) : MO_UB;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int r=
eg, TCGv t0)</div>
<div>@@ -369,7 &#43;369,7 @@ static void gen_op_mov_reg_v(DisasContext *s, =
TCGMemOp ot, int reg, TCGv t0)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_tl(cpu=
_regs[reg - 4], cpu_regs[reg - 4], t0, 8, 8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_tl(cpu_regs[reg], cp=
u_regs[reg], t0, 0, 16);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -473,7 &#43;473,7 @@ static void gen_lea_v_seg(DisasContext *s, TCG=
MemOp aflag, TCGv a0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* 16 bit address */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16u_tl(s-&gt;A0, a0);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a0 =3D s-&gt;A0;</div>
<div>@@ -530,7 &#43;530,7 @@ static TCGv gen_ext_tl(TCGv dst, TCGv src, TCG=
MemOp size, bool sign)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8u_tl(dst, =
src);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return dst;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (sign) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16s_tl(dst,=
 src);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -583,7 &#43;583,7 @@ static void gen_helper_in_func(TCGMemOp ot, TC=
Gv v, TCGv_i32 n)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_inb(v, cpu_env, n);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_inw(v, cpu_env, n);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -600,7 &#43;600,7 @@ static void gen_helper_out_func(TCGMemOp ot, T=
CGv_i32 v, TCGv_i32 n)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_outb(cpu_env, v, n);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_outw(cpu_env, v, n);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -622,7 &#43;622,7 @@ static void gen_check_io(DisasContext *s, TCGM=
emOp ot, target_ulong cur_eip,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_check_iob(c=
pu_env, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_check_iow(c=
pu_env, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1562,7 &#43;1562,7 @@ static void gen_rot_rm_T1(DisasContext *s, T=
CGMemOp ot, int op1, int is_right)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8u_tl(s-&gt;T0, s-&gt;T0)=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_tl(s-&gt;T0, s-&gt;T0, =
0x01010101);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_long;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Replicate the 16-bit input so tha=
t a 32-bit rotate works. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_tl(s-&gt;T0, s-&gt;T=
0, s-&gt;T0, 16, 16);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_long;</div>
<div>@@ -1664,7 &#43;1664,7 @@ static void gen_rot_rm_im(DisasContext *s, T=
CGMemOp ot, int op1, int op2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mask =3D 7;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_shifts;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mask =3D 15;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_shifts:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;shift =3D op2 &amp; ma=
sk;</div>
<div>@@ -1722,7 &#43;1722,7 @@ static void gen_rotc_rm_T1(DisasContext *s, =
TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rcrb(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rcrw(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1741,7 &#43;1741,7 @@ static void gen_rotc_rm_T1(DisasContext *s, =
TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rclb(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rclw(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1778,7 &#43;1778,7 @@ static void gen_shiftd_rm_T1(DisasContext *s=
, TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_andi_tl(count, count_in, mask);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Note: we implement the Intel beha=
viour for shift count &gt; 16.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; This means &quot;shrdw C, B,=
 A&quot; shifts A:B:A &gt;&gt; C. &nbsp;Build the B:A</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; portion by constructing it a=
s a 32-bit value. &nbsp;*/</div>
<div>@@ -1817,7 &#43;1817,7 @@ static void gen_shiftd_rm_T1(DisasContext *s=
, TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shl_tl(s-&gt;T=
1, s-&gt;T1, s-&gt;tmp4);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shl_tl(s-&gt;t=
mp0, s-&gt;T0, s-&gt;tmp0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_16) {</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_UW) {<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Only =
needed if count &gt; 16, for Intel behaviour. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
subfi_tl(s-&gt;tmp4, 33, count);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
shr_tl(s-&gt;tmp4, s-&gt;T1, s-&gt;tmp4);</div>
<div>@@ -2026,7 &#43;2026,7 @@ static AddressParts gen_lea_modrm_0(CPUX86St=
ate *env, DisasContext *s,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (mod =3D=3D 0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rm =3D=3D 6) {</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;base =3D=
 -1;</div>
<div>@@ -2187,7 &#43;2187,7 @@ static inline uint32_t insn_get(CPUX86State =
*env, DisasContext *s, TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D x86_ldub_code(env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D x86_lduw_code(env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -2400,12 &#43;2400,12 @@ static inline void gen_pop_update(DisasCon=
text *s, TCGMemOp ot)</div>
<div>&nbsp;</div>
<div>&nbsp;static inline void gen_stack_A0(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;gen_lea_v_seg(s, s-&gt;ss32 ? MO_32 : MO_16, cpu_regs[R=
_ESP], R_SS, -1);</div>
<div>&#43; &nbsp; &nbsp;gen_lea_v_seg(s, s-&gt;ss32 ? MO_32 : MO_UW, cpu_re=
gs[R_ESP], R_SS, -1);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_pusha(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_16;</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp d_ot =3D s-&gt;dflag;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp; &nbsp; &nbsp;int i;</div>
<div>@@ -2421,7 &#43;2421,7 @@ static void gen_pusha(DisasContext *s)</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_popa(DisasContext *s)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_16;</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp s_ot =3D s-&gt;ss32 ? MO_32 : MO_UW;</div>
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
2 : MO_16;</div>
<div>&#43; &nbsp; &nbsp;TCGMemOp a_ot =3D CODE64(s) ? MO_64 : s-&gt;ss32 ? =
MO_32 : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;int size =3D 1 &lt;&lt; d_ot;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Push BP; compute FrameTemp into T1. &nbsp;*/</d=
iv>
<div>@@ -3613,7 &#43;3613,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0xc4: /* pinsrw */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x1c4:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s-&gt;rip_offset =3D 1=
;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modr=
m, MO_16, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, =
modrm, MO_UW, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D x86_ldub_code(=
env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (b1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val &amp=
;=3D 7;</div>
<div>@@ -3786,7 &#43;3786,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((b &=
amp; 0xff) =3D=3D 0xf0) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;ot =3D MO_UB;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else i=
f (s-&gt;dflag !=3D MO_64) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_16 : MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_UW : MO_32);</div>
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
;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_16 : MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_UW : MO_32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;ot =3D MO_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -4630,7 &#43;4630,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 64-bit mode, the default data =
size is 32-bit. &nbsp;Select 64-bit</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data with rex_w, and 16-bit =
data with 0x66; rex_w takes precedence</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; over 0x66 if both are presen=
t. &nbsp;*/</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D (rex_w &gt; 0 ? MO_64 : prefixe=
s &amp; PREFIX_DATA ? MO_16 : MO_32);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D (rex_w &gt; 0 ? MO_64 : pre=
fixes &amp; PREFIX_DATA ? MO_UW : MO_32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 64-bit mode, 0x67 selects 32-b=
it addressing. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D (prefixes &amp; PREFIX_ADR=
 ? MO_32 : MO_64);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -4638,13 &#43;4638,13 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;code32 ^ ((prefixes &amp; =
PREFIX_DATA) !=3D 0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D MO_32;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dflag =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 16/32-bit mode, 0x67 selects t=
he opposite addressing. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;code32 ^ ((prefixes &amp; =
PREFIX_ADR) !=3D 0)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D MO_32;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} &nbsp;else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;aflag =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -4872,21 &#43;4872,21 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext8u_tl(s-&gt;T1, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: =
use 32 bit mul which could be faster */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mul_tl(s-&gt;T0, s-&gt;T0, s-&gt;T1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_re=
g_v(s, MO_16, R_EAX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_reg_v(s, MO_UW, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mov_tl(cpu_cc_dst, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(cpu_cc_src, s-&gt;T0, 0xff00);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set_cc_o=
p(s, CC_OP_MULB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_=
reg(s, MO_16, s-&gt;T1, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_v_reg(s, MO_UW, s-&gt;T1, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16u_tl(s-&gt;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16u_tl(s-&gt;T1, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: =
use 32 bit mul which could be faster */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mul_tl(s-&gt;T0, s-&gt;T0, s-&gt;T1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_re=
g_v(s, MO_16, R_EAX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_reg_v(s, MO_UW, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mov_tl(cpu_cc_dst, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
shri_tl(s-&gt;T0, s-&gt;T0, 16);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_re=
g_v(s, MO_16, R_EDX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_reg_v(s, MO_UW, R_EDX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mov_tl(cpu_cc_src, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set_cc_o=
p(s, CC_OP_MULW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>@@ -4921,24 &#43;4921,24 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext8s_tl(s-&gt;T1, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: =
use 32 bit mul which could be faster */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mul_tl(s-&gt;T0, s-&gt;T0, s-&gt;T1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_re=
g_v(s, MO_16, R_EAX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_reg_v(s, MO_UW, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mov_tl(cpu_cc_dst, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext8s_tl(s-&gt;tmp0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
sub_tl(cpu_cc_src, s-&gt;T0, s-&gt;tmp0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set_cc_o=
p(s, CC_OP_MULB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_=
reg(s, MO_16, s-&gt;T1, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_v_reg(s, MO_UW, s-&gt;T1, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16s_tl(s-&gt;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16s_tl(s-&gt;T1, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: =
use 32 bit mul which could be faster */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mul_tl(s-&gt;T0, s-&gt;T0, s-&gt;T1);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_re=
g_v(s, MO_16, R_EAX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_reg_v(s, MO_UW, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
mov_tl(cpu_cc_dst, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16s_tl(s-&gt;tmp0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
sub_tl(cpu_cc_src, s-&gt;T0, s-&gt;tmp0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
shri_tl(s-&gt;T0, s-&gt;T0, 16);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_re=
g_v(s, MO_16, R_EDX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_reg_v(s, MO_UW, R_EDX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set_cc_o=
p(s, CC_OP_MULW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -4972,7 &#43;4972,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_divb_AL(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_divw_AX(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -4991,7 &#43;4991,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_idivb_AL(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_idivw_AX(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -5026,7 &#43;5026,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* opera=
nd size for jumps is 64 bit */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D M=
O_64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (op =3D=3D 3=
 || op =3D=3D 5) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag =
!=3D MO_16 ? MO_32 &#43; (rex_w =3D=3D 1) : MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D df=
lag !=3D MO_UW ? MO_32 &#43; (rex_w =3D=3D 1) : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (op =3D=3D 6=
) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* defau=
lt push size is 64 bit */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D m=
o_pushpop(s, dflag);</div>
<div>@@ -5057,7 &#43;5057,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 2: /* call Ev */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: optimize if me=
mory (no 'and' is necessary) */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16u_tl(s-&gt;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;next_eip =3D s-&gt;pc =
- s-&gt;cs_base;</div>
<div>@@ -5070,7 &#43;5070,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 3: /* lcall Ev */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, ot, s-&=
gt;T1, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 1 &lt=
;&lt; ot);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_16, s-&gt=
;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UW, s=
-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_lcall:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;pe &amp;&amp=
; !s-&gt;vm86) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>@@ -5087,7 &#43;5087,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_jr(s, s-&gt;tmp4);=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 4: /* jmp Ev */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16u_tl(s-&gt;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_jmp_v(s-&gt;T0)=
;</div>
<div>@@ -5097,7 &#43;5097,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 5: /* ljmp Ev */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, ot, s-&=
gt;T1, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 1 &lt=
;&lt; ot);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_16, s-&gt=
;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UW, s=
-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;do_ljmp:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;pe &amp;&amp=
; !s-&gt;vm86) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>@@ -5152,14 &#43;5152,14 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;#endif</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_16, =
s-&gt;T0, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_=
UW, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16s_tl(s-&g=
t;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO=
_32, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO=
_UB, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8s_tl(s-&gt=
;T0, s-&gt;T0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_16, =
R_EAX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_=
UW, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_abort();</div>
<div>@@ -5180,11 &#43;5180,11 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_tl(s-&gt;=
T0, s-&gt;T0, 31);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO=
_32, R_EDX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_16, =
s-&gt;T0, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_=
UW, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16s_tl(s-&g=
t;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_tl(s-&gt;=
T0, s-&gt;T0, 15);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_16, =
R_EDX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_=
UW, R_EDX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_abort();</div>
<div>@@ -5538,7 &#43;5538,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D (modrm &gt;&gt; 3) &amp; 7;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg &gt;=3D 6 || reg =3D=3D R_CS=
)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto illegal_op;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modrm, MO_16, OR_T=
MP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modrm, MO_UW, =
OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_movl_seg_T0(s, reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Note that reg =3D=3D R_SS in gen_=
movl_seg_T0 always sets is_jmp. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;base.is_jmp) {</div>
<div>@@ -5558,7 &#43;5558,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg &gt;=3D 6)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_movl_T0_seg(s, reg);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;ot =3D mod =3D=3D 3 ? dflag : MO_16;</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D mod =3D=3D 3 ? dflag : MO_UW;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modrm, ot, OR=
_TMP0, 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>@@ -5734,7 &#43;5734,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;case 0x1b5: /* lgs Gv */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op =3D R_GS;</div>
<div>&nbsp; &nbsp; &nbsp;do_lxx:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_16 ? MO_32 : MO_16;<=
/div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_UW ? MO_32 : MO_=
UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;modrm =3D x86_ldub_code(env, s);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D ((modrm &gt;&gt; 3) &amp; 7)=
 | rex_r;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mod =3D (modrm &gt;&gt; 6) &amp; 3;<=
/div>
<div>@@ -5744,7 &#43;5744,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, ot, s-&gt;T1, s-&gt;A=
0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 1 &lt;&lt; ot);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* load the segment first to handle =
exceptions properly */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_16, s-&gt;T0, s-&gt;A0)=
;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UW, s-&gt;T0, s-&gt=
;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_movl_seg_T0(s, op);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* then put the data */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, ot, reg, s-&gt;T=
1);</div>
<div>@@ -6287,7 &#43;6287,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0:<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;gen_helper_fnstsw(s-&gt;tmp2_i32, cpu_env);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;tcg_gen_extu_i32_tl(s-&gt;T0, s-&gt;tmp2_i32);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;gen_op_mov_reg_v(s, MO_16, R_EAX, s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;gen_op_mov_reg_v(s, MO_UW, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto unknown_op;</div>
<div>@@ -6575,14 &#43;6575,14 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xe8: /* call im */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_16) {</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_UW) {=
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D=
 (int32_t)insn_get(env, s, MO_32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int=
16_t)insn_get(env, s, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D =
(int16_t)insn_get(env, s, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;next_eip =3D s-&gt;pc =
- s-&gt;cs_base;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &#43;=3D next_eip=
;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &am=
p;=3D 0xffff;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (!CODE64(s))=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &am=
p;=3D 0xffffffff;</div>
<div>@@ -6601,20 &#43;6601,20 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto ill=
egal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;offset =3D insn_get(en=
v, s, ot);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;selector =3D insn_get(env, =
s, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;selector =3D insn_get(e=
nv, s, MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;=
T0, selector);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;=
T1, offset);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_lcall;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xe9: /* jmp im */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int32_t)insn=
_get(env, s, MO_32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int16_t)insn_get(=
env, s, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int16_t)insn_=
get(env, s, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &#43;=3D s-&gt;pc - s-&gt;cs_ba=
se;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &amp;=3D 0xffff;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (!CODE64(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &amp;=3D 0xffffff=
ff;</div>
<div>@@ -6630,7 &#43;6630,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto ill=
egal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;offset =3D insn_get(en=
v, s, ot);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;selector =3D insn_get(env, =
s, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;selector =3D insn_get(e=
nv, s, MO_UW);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;=
T0, selector);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;=
T1, offset);</div>
<div>@@ -6639,7 &#43;6639,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;case 0xeb: /* jmp Jb */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_get(env, s, MO=
_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &#43;=3D s-&gt;pc - s-&gt;cs_ba=
se;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &amp;=3D 0xffff;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_jmp(s, tval);</div>
<div>@@ -6648,15 &#43;6648,15 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_get(env, s, MO=
_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_jcc;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x180 ... 0x18f: /* jcc Jv */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int32_t)insn=
_get(env, s, MO_32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int16_t)insn_get(=
env, s, MO_16);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int16_t)insn_=
get(env, s, MO_UW);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;do_jcc:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;next_eip =3D s-&gt;pc - s-&gt;cs_bas=
e;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &#43;=3D next_eip;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &amp;=3D 0xffff;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_bnd_jmp(s);</div>
<div>@@ -6697,7 &#43;6697,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D gen_pop_T0(s);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;cpl =3D=3D 0=
) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=
=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag=
 !=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;gen_helper_write_eflags(cpu_env, s-&gt;T0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;tcg_const_i32((TF_MASK | AC_MASK |</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ID_MASK | =
NT_MASK |</div>
<div>@@ -6712,7 &#43;6712,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&g=
t;cpl &lt;=3D s-&gt;iopl) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;if (dflag !=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;if (dflag !=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;gen_helper_write_eflags(cpu_env, s-&gt;T0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;tcg_const_i32((TF_MASK |</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; AC_MASK |</div>
<div>@@ -6729,7 &#43;6729,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;&amp; 0xffff));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;if (dflag !=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;if (dflag !=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;gen_helper_write_eflags(cpu_env, s-&gt;T0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; tcg_const_i32((TF_MASK | AC_MASK |</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ID_MASK | N=
T_MASK)));</div>
<div>@@ -7110,7 &#43;7110,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, ot, s-&gt;T0, re=
g);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s-&gt;tmp2_i32,=
 s-&gt;T0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (ot =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_boundw(cpu_=
env, s-&gt;A0, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_boundl(cpu_=
env, s-&gt;A0, s-&gt;tmp2_i32);</div>
<div>@@ -7149,7 &#43;7149,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_=
get(env, s, MO_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;next_eip =3D s-&gt;pc =
- s-&gt;cs_base;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &#43;=3D next_eip=
;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &am=
p;=3D 0xffff;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>@@ -7291,7 &#43;7291,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_check_intercep=
t(s, pc_start, SVM_EXIT_LDTR_READ);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_tl(s-&gt=
;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offsetof(CPUX86State, ldt.selector));</d=
iv>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D mod =3D=3D 3 ? dflag=
 : MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D mod =3D=3D 3 ? d=
flag : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s,=
 modrm, ot, OR_TMP0, 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 2: /* lldt */</div>
<div>@@ -7301,7 &#43;7301,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_exce=
ption(s, EXCP0D_GPF, pc_start - s-&gt;cs_base);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_=
check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modr=
m(env, s, modrm, MO_16, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_=
modrm(env, s, modrm, MO_UW, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_lldt(cpu_env, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -7312,7 &#43;7312,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_check_intercep=
t(s, pc_start, SVM_EXIT_TR_READ);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_tl(s-&gt=
;T0, cpu_env,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; offsetof(CPUX86State, tr.selector));</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D mod =3D=3D 3 ? dflag=
 : MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D mod =3D=3D 3 ? d=
flag : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s,=
 modrm, ot, OR_TMP0, 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 3: /* ltr */</div>
<div>@@ -7322,7 &#43;7322,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_exce=
ption(s, EXCP0D_GPF, pc_start - s-&gt;cs_base);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_=
check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modr=
m(env, s, modrm, MO_16, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_=
modrm(env, s, modrm, MO_UW, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
trunc_tl_i32(s-&gt;tmp2_i32, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_ltr(cpu_env, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -7331,7 &#43;7331,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 5: /* verw */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!s-&gt;pe || s-&gt=
;vm86)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto ill=
egal_op;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modr=
m, MO_16, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, =
modrm, MO_UW, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_update_cc_op(s);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (op =3D=3D 4) {</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_verr(cpu_env, s-&gt;T0);</div>
<div>@@ -7353,10 &#43;7353,10 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, =
modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_tl(s-&gt=
;T0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cpu_env, offsetof(CPUX86State, gdt.limit=
));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, MO_16, s-&gt=
;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, MO_UW, s=
-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 2);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld_tl(s-&gt;T0=
, cpu_env, offsetof(CPUX86State, gdt.base));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, CODE64(=
s) &#43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>@@ -7408,10 &#43;7408,10 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_check_intercep=
t(s, pc_start, SVM_EXIT_IDTR_READ);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, =
modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_tl(s-&gt=
;T0, cpu_env, offsetof(CPUX86State, idt.limit));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, MO_16, s-&gt=
;T0, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, MO_UW, s=
-&gt;T0, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 2);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld_tl(s-&gt;T0=
, cpu_env, offsetof(CPUX86State, idt.base));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_st_v(s, CODE64(=
s) &#43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>@@ -7558,10 &#43;7558,10 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_check_intercep=
t(s, pc_start, SVM_EXIT_GDTR_WRITE);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, =
modrm);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_16, s-&gt=
;T1, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UW, s=
-&gt;T1, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 2);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, CODE64(=
s) &#43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st_tl(s-&gt;T0=
, cpu_env, offsetof(CPUX86State, gdt.base));</div>
<div>@@ -7575,10 &#43;7575,10 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_check_intercep=
t(s, pc_start, SVM_EXIT_IDTR_WRITE);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_lea_modrm(env, s, =
modrm);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_16, s-&gt=
;T1, s-&gt;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UW, s=
-&gt;T1, s-&gt;A0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_im(s, 2);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, CODE64(=
s) &#43; MO_32, s-&gt;T0, s-&gt;A0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_UW)=
 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
andi_tl(s-&gt;T0, s-&gt;T0, 0xffffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st_tl(s-&gt;T0=
, cpu_env, offsetof(CPUX86State, idt.base));</div>
<div>@@ -7590,9 &#43;7590,9 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld_tl(s-&gt;T0=
, cpu_env, offsetof(CPUX86State, cr[0]));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (CODE64(s)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mod =3D =
(modrm &gt;&gt; 6) &amp; 3;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D (mod !=
=3D 3 ? MO_16 : s-&gt;dflag);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D (m=
od !=3D 3 ? MO_UW : s-&gt;dflag);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO_16;=
</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO=
_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s,=
 modrm, ot, OR_TMP0, 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -7619,7 &#43;7619,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_svm_check_intercep=
t(s, pc_start, SVM_EXIT_WRITE_CR0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modr=
m, MO_16, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, =
modrm, MO_UW, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_lmsw(cpu_en=
v, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_jmp_im(s, s-&gt;pc=
 - s-&gt;cs_base);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_eob(s);</div>
<div>@@ -7720,7 &#43;7720,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t0 =3D tcg_temp_local_=
new();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t1 =3D tcg_temp_local_=
new();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t2 =3D tcg_temp_local_=
new();</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;modrm =3D x86_ldub_cod=
e(env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D (modrm &gt;&gt=
; 3) &amp; 7;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mod =3D (modrm &gt;&gt=
; 6) &amp; 3;</div>
<div>@@ -7765,10 &#43;7765,10 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv t0;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!s-&gt;pe || s-&gt=
;vm86)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto ill=
egal_op;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_16 ? M=
O_32 : MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D dflag !=3D MO_UW=
 ? MO_32 : MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;modrm =3D x86_ldub_cod=
e(env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D ((modrm &gt;&g=
t; 3) &amp; 7) | rex_r;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modr=
m, MO_16, OR_TMP0, 0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, =
modrm, MO_UW, OR_TMP0, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t0 =3D tcg_temp_local_=
new();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_update_cc_op(s);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (b =3D=3D 0x102) {<=
/div>
<div>@@ -7813,7 &#43;7813,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* bndcl=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg =
&gt;=3D 4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| (prefixes &amp; PREFIX_LOCK)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;|| s-&gt;aflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;|| s-&gt;aflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_bndc=
k(env, s, modrm, TCG_COND_LTU, cpu_bndl[reg]);</div>
<div>@@ -7821,7 &#43;7821,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* bndcu=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg =
&gt;=3D 4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| (prefixes &amp; PREFIX_LOCK)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;|| s-&gt;aflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;|| s-&gt;aflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i64=
 notu =3D tcg_temp_new_i64();</div>
<div>@@ -7830,7 &#43;7830,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp=
_free_i64(notu);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (prefixes &a=
mp; PREFIX_DATA) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* bndmo=
v -- from reg/mem */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg &gt;=
=3D 4 || s-&gt;aflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg &=
gt;=3D 4 || s-&gt;aflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (mod =
=3D=3D 3) {</div>
<div>@@ -7865,7 &#43;7865,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;AddressP=
arts a =3D gen_lea_modrm_0(env, s, modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg =
&gt;=3D 4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| (prefixes &amp; PREFIX_LOCK)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;|| s-&gt;aflag =3D=3D MO_16</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;|| s-&gt;aflag =3D=3D MO_UW</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| a.base &lt; -1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -7903,7 &#43;7903,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* bndmk=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg =
&gt;=3D 4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| (prefixes &amp; PREFIX_LOCK)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;|| s-&gt;aflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;|| s-&gt;aflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;AddressP=
arts a =3D gen_lea_modrm_0(env, s, modrm);</div>
<div>@@ -7931,13 &#43;7931,13 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* bndcn=
 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg =
&gt;=3D 4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| (prefixes &amp; PREFIX_LOCK)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;|| s-&gt;aflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;|| s-&gt;aflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_bndc=
k(env, s, modrm, TCG_COND_GTU, cpu_bndu[reg]);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (prefixes &a=
mp; PREFIX_DATA) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* bndmo=
v -- to reg/mem */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg &gt;=
=3D 4 || s-&gt;aflag =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg &=
gt;=3D 4 || s-&gt;aflag =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (mod =
=3D=3D 3) {</div>
<div>@@ -7970,7 &#43;7970,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;AddressP=
arts a =3D gen_lea_modrm_0(env, s, modrm);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (reg =
&gt;=3D 4</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| (prefixes &amp; PREFIX_LOCK)</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;|| s-&gt;aflag =3D=3D MO_16</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;|| s-&gt;aflag =3D=3D MO_UW</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|| a.base &lt; -1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -8341,7 &#43;8341,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D ((modrm &gt;&gt; 3) &amp; 7)=
 | rex_r;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (s-&gt;prefix &amp; PREFIX_DATA) =
{</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D mo_64_32(dflag)=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/target/mips/translate.c b/target/mips/translate.c</div>
<div>index 20a9777..525c7fe 100644</div>
<div>--- a/target/mips/translate.c</div>
<div>&#43;&#43;&#43; b/target/mips/translate.c</div>
<div>@@ -21087,7 &#43;21087,7 @@ static void gen_pool32a5_nanomips_insn(Dis=
asContext *ctx, int opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;imm =3D sextract32(ctx=
-&gt;opcode, 11, 11);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;imm =3D (int16_t)(imm =
&lt;&lt; 6) &gt;&gt; 6;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rt !=3D 0) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_=
tl(cpu_gpr[rt], dup_const(MO_16, imm));</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_m=
ovi_tl(cpu_gpr[rt], dup_const(MO_UW, imm));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translat=
e/vmx-impl.inc.c</div>
<div>index 4130dd1..71efef4 100644</div>
<div>--- a/target/ppc/translate/vmx-impl.inc.c</div>
<div>&#43;&#43;&#43; b/target/ppc/translate/vmx-impl.inc.c</div>
<div>@@ -406,29 &#43;406,29 @@ static void glue(gen_, name)(DisasContext *c=
tx) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; \</div>
<div>&nbsp;GEN_VXFORM_V(vaddubm, MO_UB, tcg_gen_gvec_add, 0, 0);</div>
<div>&nbsp;GEN_VXFORM_DUAL_EXT(vaddubm, PPC_ALTIVEC, PPC_NONE, 0, &nbsp; &n=
bsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;vmul10cuq, PPC_NONE, PPC2_ISA300, 0x0000F800)</div>
<div>-GEN_VXFORM_V(vadduhm, MO_16, tcg_gen_gvec_add, 0, 1);</div>
<div>&#43;GEN_VXFORM_V(vadduhm, MO_UW, tcg_gen_gvec_add, 0, 1);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vadduhm, PPC_ALTIVEC, PPC_NONE, &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vmul10ec=
uq, PPC_NONE, PPC2_ISA300)</div>
<div>&nbsp;GEN_VXFORM_V(vadduwm, MO_32, tcg_gen_gvec_add, 0, 2);</div>
<div>&nbsp;GEN_VXFORM_V(vaddudm, MO_64, tcg_gen_gvec_add, 0, 3);</div>
<div>&nbsp;GEN_VXFORM_V(vsububm, MO_UB, tcg_gen_gvec_sub, 0, 16);</div>
<div>-GEN_VXFORM_V(vsubuhm, MO_16, tcg_gen_gvec_sub, 0, 17);</div>
<div>&#43;GEN_VXFORM_V(vsubuhm, MO_UW, tcg_gen_gvec_sub, 0, 17);</div>
<div>&nbsp;GEN_VXFORM_V(vsubuwm, MO_32, tcg_gen_gvec_sub, 0, 18);</div>
<div>&nbsp;GEN_VXFORM_V(vsubudm, MO_64, tcg_gen_gvec_sub, 0, 19);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxub, MO_UB, tcg_gen_gvec_umax, 1, 0);</div>
<div>-GEN_VXFORM_V(vmaxuh, MO_16, tcg_gen_gvec_umax, 1, 1);</div>
<div>&#43;GEN_VXFORM_V(vmaxuh, MO_UW, tcg_gen_gvec_umax, 1, 1);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxuw, MO_32, tcg_gen_gvec_umax, 1, 2);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxud, MO_64, tcg_gen_gvec_umax, 1, 3);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsb, MO_UB, tcg_gen_gvec_smax, 1, 4);</div>
<div>-GEN_VXFORM_V(vmaxsh, MO_16, tcg_gen_gvec_smax, 1, 5);</div>
<div>&#43;GEN_VXFORM_V(vmaxsh, MO_UW, tcg_gen_gvec_smax, 1, 5);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsw, MO_32, tcg_gen_gvec_smax, 1, 6);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsd, MO_64, tcg_gen_gvec_smax, 1, 7);</div>
<div>&nbsp;GEN_VXFORM_V(vminub, MO_UB, tcg_gen_gvec_umin, 1, 8);</div>
<div>-GEN_VXFORM_V(vminuh, MO_16, tcg_gen_gvec_umin, 1, 9);</div>
<div>&#43;GEN_VXFORM_V(vminuh, MO_UW, tcg_gen_gvec_umin, 1, 9);</div>
<div>&nbsp;GEN_VXFORM_V(vminuw, MO_32, tcg_gen_gvec_umin, 1, 10);</div>
<div>&nbsp;GEN_VXFORM_V(vminud, MO_64, tcg_gen_gvec_umin, 1, 11);</div>
<div>&nbsp;GEN_VXFORM_V(vminsb, MO_UB, tcg_gen_gvec_smin, 1, 12);</div>
<div>-GEN_VXFORM_V(vminsh, MO_16, tcg_gen_gvec_smin, 1, 13);</div>
<div>&#43;GEN_VXFORM_V(vminsh, MO_UW, tcg_gen_gvec_smin, 1, 13);</div>
<div>&nbsp;GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);</div>
<div>&nbsp;GEN_VXFORM(vavgub, 1, 16);</div>
<div>@@ -531,18 &#43;531,18 @@ GEN_VXFORM(vmulesb, 4, 12);</div>
<div>&nbsp;GEN_VXFORM(vmulesh, 4, 13);</div>
<div>&nbsp;GEN_VXFORM(vmulesw, 4, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vslb, MO_UB, tcg_gen_gvec_shlv, 2, 4);</div>
<div>-GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);</div>
<div>&#43;GEN_VXFORM_V(vslh, MO_UW, tcg_gen_gvec_shlv, 2, 5);</div>
<div>&nbsp;GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);</div>
<div>&nbsp;GEN_VXFORM(vrlwnm, 2, 6);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vrlwnm, =
PPC_NONE, PPC2_ISA300)</div>
<div>&nbsp;GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);</div>
<div>&nbsp;GEN_VXFORM_V(vsrb, MO_UB, tcg_gen_gvec_shrv, 2, 8);</div>
<div>-GEN_VXFORM_V(vsrh, MO_16, tcg_gen_gvec_shrv, 2, 9);</div>
<div>&#43;GEN_VXFORM_V(vsrh, MO_UW, tcg_gen_gvec_shrv, 2, 9);</div>
<div>&nbsp;GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);</div>
<div>&nbsp;GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);</div>
<div>&nbsp;GEN_VXFORM_V(vsrab, MO_UB, tcg_gen_gvec_sarv, 2, 12);</div>
<div>-GEN_VXFORM_V(vsrah, MO_16, tcg_gen_gvec_sarv, 2, 13);</div>
<div>&#43;GEN_VXFORM_V(vsrah, MO_UW, tcg_gen_gvec_sarv, 2, 13);</div>
<div>&nbsp;GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);</div>
<div>&nbsp;GEN_VXFORM(vsrv, 2, 28);</div>
<div>@@ -592,18 &#43;592,18 @@ static void glue(gen_, NAME)(DisasContext *c=
tx) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; \</div>
<div>&nbsp;GEN_VXFORM_SAT(vaddubs, MO_UB, add, usadd, 0, 8);</div>
<div>&nbsp;GEN_VXFORM_DUAL_EXT(vaddubs, PPC_ALTIVEC, PPC_NONE, 0, &nbsp; &n=
bsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;vmul10uq, PPC_NONE, PPC2_ISA300, 0x0000F800)</div>
<div>-GEN_VXFORM_SAT(vadduhs, MO_16, add, usadd, 0, 9);</div>
<div>&#43;GEN_VXFORM_SAT(vadduhs, MO_UW, add, usadd, 0, 9);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vadduhs, PPC_ALTIVEC, PPC_NONE, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vmul10eu=
q, PPC_NONE, PPC2_ISA300)</div>
<div>&nbsp;GEN_VXFORM_SAT(vadduws, MO_32, add, usadd, 0, 10);</div>
<div>&nbsp;GEN_VXFORM_SAT(vaddsbs, MO_UB, add, ssadd, 0, 12);</div>
<div>-GEN_VXFORM_SAT(vaddshs, MO_16, add, ssadd, 0, 13);</div>
<div>&#43;GEN_VXFORM_SAT(vaddshs, MO_UW, add, ssadd, 0, 13);</div>
<div>&nbsp;GEN_VXFORM_SAT(vaddsws, MO_32, add, ssadd, 0, 14);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsububs, MO_UB, sub, ussub, 0, 24);</div>
<div>-GEN_VXFORM_SAT(vsubuhs, MO_16, sub, ussub, 0, 25);</div>
<div>&#43;GEN_VXFORM_SAT(vsubuhs, MO_UW, sub, ussub, 0, 25);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubsbs, MO_UB, sub, sssub, 0, 28);</div>
<div>-GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);</div>
<div>&#43;GEN_VXFORM_SAT(vsubshs, MO_UW, sub, sssub, 0, 29);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);</div>
<div>&nbsp;GEN_VXFORM(vadduqm, 0, 4);</div>
<div>&nbsp;GEN_VXFORM(vaddcuq, 0, 5);</div>
<div>@@ -913,7 &#43;913,7 @@ static void glue(gen_, name)(DisasContext *ctx=
) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;GEN_VXFORM_VSPLT(vspltb, MO_UB, 6, 8);</div>
<div>-GEN_VXFORM_VSPLT(vsplth, MO_16, 6, 9);</div>
<div>&#43;GEN_VXFORM_VSPLT(vsplth, MO_UW, 6, 9);</div>
<div>&nbsp;GEN_VXFORM_VSPLT(vspltw, MO_32, 6, 10);</div>
<div>&nbsp;GEN_VXFORM_UIMM_SPLAT(vextractub, 6, 8, 15);</div>
<div>&nbsp;GEN_VXFORM_UIMM_SPLAT(vextractuh, 6, 9, 14);</div>
<div>diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_=
vx.inc.c</div>
<div>index bb424c8..65da6b3 100644</div>
<div>--- a/target/s390x/translate_vx.inc.c</div>
<div>&#43;&#43;&#43; b/target/s390x/translate_vx.inc.c</div>
<div>@@ -47,7 &#43;47,7 @@</div>
<div>&nbsp;#define NUM_VEC_ELEMENT_BITS(es) (NUM_VEC_ELEMENT_BYTES(es) * BI=
TS_PER_BYTE)</div>
<div>&nbsp;</div>
<div>&nbsp;#define ES_8 &nbsp; &nbsp;MO_UB</div>
<div>-#define ES_16 &nbsp; MO_16</div>
<div>&#43;#define ES_16 &nbsp; MO_UW</div>
<div>&nbsp;#define ES_32 &nbsp; MO_32</div>
<div>&nbsp;#define ES_64 &nbsp; MO_64</div>
<div>&nbsp;#define ES_128 &nbsp;4</div>
<div>diff --git a/target/s390x/vec.h b/target/s390x/vec.h</div>
<div>index b813054..28e1b1d 100644</div>
<div>--- a/target/s390x/vec.h</div>
<div>&#43;&#43;&#43; b/target/s390x/vec.h</div>
<div>@@ -78,7 &#43;78,7 @@ static inline uint64_t s390_vec_read_element(con=
st S390Vector *v, uint8_t enr,</div>
<div>&nbsp; &nbsp; &nbsp;switch (es) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element8(v, enr=
);</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element16(v, en=
r);</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element32(v, en=
r);</div>
<div>@@ -124,7 &#43;124,7 @@ static inline void s390_vec_write_element(S390=
Vector *v, uint8_t enr,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_vec_write_element8(v, enr, data=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_vec_write_element16(v, enr, dat=
a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc=
.c</div>
<div>index e4e0845..3d90c4b 100644</div>
<div>--- a/tcg/aarch64/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/aarch64/tcg-target.inc.c</div>
<div>@@ -430,20 &#43;430,20 @@ typedef enum {</div>
<div>&nbsp; &nbsp; &nbsp;/* Load/store register. &nbsp;Described here as 3.=
3.12, but the helper</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; that emits them can transform to 3.3.10 or=
 3.3.13. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_STRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDST_ST=
 &lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_STRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDS=
T_ST &lt;&lt; 22 | MO_UW &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRX &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_LDRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
 &lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDS=
T_LD &lt;&lt; 22 | MO_UW &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRX &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSBW &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_W &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_LDRSHW &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_S_W =
&lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRSHW &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_=
S_W &lt;&lt; 22 | MO_UW &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSBX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_X &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>- &nbsp; &nbsp;I3312_LDRSHX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_S_X =
&lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRSHX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_=
S_X &lt;&lt; 22 | MO_UW &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSWX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_X &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRVS &nbsp; &nbsp; =3D 0x3c000000 | LDST_LD=
 &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>@@ -870,7 &#43;870,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TC=
GType type,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * Test all bytes 0x00 or 0xff second. &nbsp;This =
can match cases that</div>
<div>- &nbsp; &nbsp; * might otherwise take 2 or 3 insns for MO_16 or MO_32=
 below.</div>
<div>&#43; &nbsp; &nbsp; * might otherwise take 2 or 3 insns for MO_UW or M=
O_32 below.</div>
<div>&nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D imm8 =3D 0; i &lt; 8; i&#43;&#43;) {</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8_t byte =3D v64 &gt;&gt; (i * 8=
);</div>
<div>@@ -889,7 &#43;889,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TC=
GType type,</div>
<div>&nbsp; &nbsp; &nbsp; * cannot find an expansion there's no point check=
ing a larger</div>
<div>&nbsp; &nbsp; &nbsp; * width because we already know by replication it=
 cannot match.</div>
<div>&nbsp; &nbsp; &nbsp; */</div>
<div>- &nbsp; &nbsp;if (v64 =3D=3D dup_const(MO_16, v64)) {</div>
<div>&#43; &nbsp; &nbsp;if (v64 =3D=3D dup_const(MO_UW, v64)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint16_t v16 =3D v64;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (is_shimm16(v16, &amp;cmode, &amp=
;imm8)) {</div>
<div>@@ -1733,7 &#43;1733,7 @@ static void tcg_out_qemu_ld_direct(TCGContex=
t *s, TCGMemOp memop, TCGType ext,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ldst_r(s, I331=
2_LDRH, data_r, addr_r, otype, off_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_rev16(s, data_=
r, data_r);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, ext, MO_16, =
data_r, data_r);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, ext, MO_=
UW, data_r, data_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ldst_r(s, (ext=
 ? I3312_LDRSHX : I3312_LDRSHW),</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; data_r, addr_r, otype, off_r);</div>
<div>@@ -1775,7 &#43;1775,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGMemOp memop,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ldst_r(s, I3312_STRB, data_r=
, addr_r, otype, off_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap &amp;&amp; data_r !=3D TCG=
_REG_XZR) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_rev16(s, TCG_R=
EG_TMP, data_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data_r =3D TCG_REG_TMP=
;</div>
<div>@@ -2190,7 &#43;2190,7 @@ static void tcg_out_op(TCGContext *s, TCGOpc=
ode opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16s_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16s_i32:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, ext, MO_16, a0, a1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, ext, MO_UW, a0, a1);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext_i32_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext32s_i64:</div>
<div>@@ -2202,7 &#43;2202,7 @@ static void tcg_out_op(TCGContext *s, TCGOpc=
ode opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16u_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16u_i32:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_uxt(s, MO_16, a0, a1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_uxt(s, MO_UW, a0, a1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_extu_i32_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext32u_i64:</div>
<div>diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c</div>
<div>index 542ffa8..0bd400e 100644</div>
<div>--- a/tcg/arm/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/arm/tcg-target.inc.c</div>
<div>@@ -1432,7 &#43;1432,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argreg =3D tcg_out_arg_reg8(s, argre=
g, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argreg =3D tcg_out_arg_reg16(s, argr=
eg, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1624,7 &#43;1624,7 @@ static inline void tcg_out_qemu_st_index(TCG=
Context *s, int cond, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st8_r(s, cond, datalo, addrl=
o, addend);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_bswap16st(s, c=
ond, TCG_REG_R0, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st16_r(s, cond=
, TCG_REG_R0, addrlo, addend);</div>
<div>@@ -1669,7 &#43;1669,7 @@ static inline void tcg_out_qemu_st_direct(TC=
GContext *s, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st8_12(s, COND_AL, datalo, a=
ddrlo, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_bswap16st(s, C=
OND_AL, TCG_REG_R0, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st16_8(s, COND=
_AL, TCG_REG_R0, addrlo, 0);</div>
<div>diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c</di=
v>
<div>index 0d68ba4..31c3664 100644</div>
<div>--- a/tcg/i386/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/i386/tcg-target.inc.c</div>
<div>@@ -893,7 &#43;893,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCG=
Type type, unsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm(s, O=
PC_PUNPCKLBW, r, a, a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a =3D r;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FALLTHRU */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm(s, O=
PC_PUNPCKLWD, r, a, a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a =3D r;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FALLTHRU */</div>
<div>@@ -927,7 &#43;927,7 @@ static bool tcg_out_dupm_vec(TCGContext *s, TC=
GType type, unsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm_offs=
et(s, OPC_VBROADCASTSS, r, 0, base, offset);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm_offs=
et(s, OPC_VPINSRW, r, r, base, offset);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out8(s, 0); /* imm=
8 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_dup_vec(s, typ=
e, vece, r, r);</div>
<div>@@ -2164,7 &#43;2164,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGReg datalo, TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_modrm_sib_offset(s, OPC_MOVB=
_EvGv &#43; P_REXB_R &#43; seg,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; datalo, base, index, 0, of=
s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (bswap) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_mov(s, TCG_TYP=
E_I32, scratch, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_rolw_8(s, scra=
tch);</div>
<div>@@ -2747,15 &#43;2747,15 @@ static void tcg_out_vec_op(TCGContext *s, =
TCGOpcode opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, =
OPC_UD2</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static int const shlv_insn[4] =3D {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* TODO: AVX512 adds support for MO_16. &=
nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* TODO: AVX512 adds support for MO_U=
W. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;OPC_UD2, OPC_UD2, OPC_VPSLLVD, OPC_V=
PSLLVQ</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static int const shrv_insn[4] =3D {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* TODO: AVX512 adds support for MO_16. &=
nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* TODO: AVX512 adds support for MO_U=
W. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;OPC_UD2, OPC_UD2, OPC_VPSRLVD, OPC_V=
PSRLVQ</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static int const sarv_insn[4] =3D {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* TODO: AVX512 adds support for MO_16, M=
O_64. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* TODO: AVX512 adds support for MO_U=
W, MO_64. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;OPC_UD2, OPC_UD2, OPC_VPSRAVD, OPC_U=
D2</div>
<div>&nbsp; &nbsp; &nbsp;};</div>
<div>&nbsp; &nbsp; &nbsp;static int const shls_insn[4] =3D {</div>
<div>@@ -2925,7 &#43;2925,7 @@ static void tcg_out_vec_op(TCGContext *s, TC=
GOpcode opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sub =3D args[3];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto gen_simd_imm8;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_x86_blend_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_16) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;insn =3D OPC_PBLENDW;<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_32) {</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;insn =3D (have_avx2 ? =
OPC_VPBLENDD : OPC_BLENDPS);</div>
<div>@@ -3290,9 &#43;3290,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGTy=
pe type, unsigned vece)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shls_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shrs_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return vece &gt;=3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return vece &gt;=3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_sars_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return vece &gt;=3D MO_16 &amp;&amp; vece=
 &lt;=3D MO_32;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return vece &gt;=3D MO_UW &amp;&amp; =
vece &lt;=3D MO_32;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shlv_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shrv_vec:</div>
<div>@@ -3314,7 &#43;3314,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGTy=
pe type, unsigned vece)</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_usadd_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_sssub_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ussub_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return vece &lt;=3D MO_16;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return vece &lt;=3D MO_UW;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_smin_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_smax_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_umin_vec:</div>
<div>@@ -3352,13 &#43;3352,13 @@ static void expand_vec_shi(TCGType type, u=
nsigned vece, bool shr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcgv_vec_arg(t2=
), tcgv_vec_arg(v1), tcgv_vec_arg(v1));</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (shr) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t1, t1, imm &#43;=
 8);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t2, t2, imm &#43;=
 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_UW, t1, t1, imm &=
#43; 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_UW, t2, t2, imm &=
#43; 8);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shli_vec(MO_16, t1, t1, imm &#43;=
 8);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shli_vec(MO_16, t2, t2, imm &#43;=
 8);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t1, t1, 8);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t2, t2, 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shli_vec(MO_UW, t1, t1, imm &=
#43; 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shli_vec(MO_UW, t2, t2, imm &=
#43; 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_UW, t1, t1, 8);</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_UW, t2, t2, 8);</=
div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, type, MO_UB,</d=
iv>
<div>@@ -3381,8 &#43;3381,8 @@ static void expand_vec_sari(TCGType type, un=
signed vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(v1));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, =
type, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t2), tcgv_vec_arg(v1), tcgv_vec_arg(v1));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_16, t1, t1, imm &#43;=
 8);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_16, t2, t2, imm &#43;=
 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_UW, t1, t1, imm &=
#43; 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_UW, t2, t2, imm &=
#43; 8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packss_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t2));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);</div>
<div>@@ -3446,8 &#43;3446,8 @@ static void expand_vec_mul(TCGType type, uns=
igned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t2));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, =
TCG_TYPE_V128, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t2), tcgv_vec_arg(t2), tcgv_vec_arg(v2));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_16, t1, t1, t2);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t1, t1, 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_UW, t1, t1, t2);</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_UW, t1, t1, 8);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, T=
CG_TYPE_V128, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t1));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);</div>
<div>@@ -3469,10 &#43;3469,10 @@ static void expand_vec_mul(TCGType type, u=
nsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t3), tcgv_vec_arg(v1), tcgv_vec_arg(t4));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, =
type, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t4), tcgv_vec_arg(t4), tcgv_vec_arg(v2));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_16, t1, t1, t2);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_16, t3, t3, t4);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t1, t1, 8);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t3, t3, 8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_UW, t1, t1, t2);</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_UW, t3, t3, t4);</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_UW, t1, t1, 8);</=
div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_UW, t3, t3, 8);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t3));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);</div>
<div>diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c</di=
v>
<div>index c6d13ea..1780cb1 100644</div>
<div>--- a/tcg/mips/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/mips/tcg-target.inc.c</div>
<div>@@ -1383,7 &#43;1383,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D tcg_out_call_iarg_reg8(s, i, l=
-&gt;datalo_reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D tcg_out_call_iarg_reg16(s, i, =
l-&gt;datalo_reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -1570,12 &#43;1570,12 @@ static void tcg_out_qemu_st_direct(TCGCont=
ext *s, TCGReg lo, TCGReg hi,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_imm(s, OPC_SB, lo, base,=
 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;case MO_16 | MO_BSWAP:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW | MO_BSWAP:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP=
1, lo, 0xffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_bswap16(s, TCG_TMP1, TCG_TMP=
1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lo =3D TCG_TMP1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* FALLTHRU */</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_imm(s, OPC_SH, lo, base,=
 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c</=
div>
<div>index 9c60c0f..20bc19d 100644</div>
<div>--- a/tcg/riscv/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/riscv/tcg-target.inc.c</div>
<div>@@ -1104,7 &#43;1104,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ext8u(s, a2, a2);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ext16u(s, a2, a2);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -1219,7 &#43;1219,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGReg lo, TCGReg hi,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_store(s, OPC_SB, base, l=
o, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_store(s, OPC_SH, base, l=
o, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c</=
div>
<div>index 479ee2e..85550b5 100644</div>
<div>--- a/tcg/sparc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/sparc/tcg-target.inc.c</div>
<div>@@ -885,7 &#43;885,7 @@ static void emit_extend(TCGContext *s, TCGReg =
r, int op)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_arithi(s, r, r, 0xff, ARITH_=
AND);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_arithi(s, r, r, 16, SHIFT_SL=
L);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_arithi(s, r, r, 16, SHIFT_SR=
L);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c</div>
<div>index 9658c36..da409f5 100644</div>
<div>--- a/tcg/tcg-op-gvec.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op-gvec.c</div>
<div>@@ -308,7 &#43;308,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c=
)</div>
<div>&nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0101010101010101ull * (uint=
8_t)c;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0001000100010001ull * (uint=
16_t)c;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0000000100000001ull * (uint=
32_t)c;</div>
<div>@@ -327,7 &#43;327,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i3=
2 out, TCGv_i32 in)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8u_i32(out, in);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_i32(out, out, 0x0101010=
1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_i32(out, in, in, 16,=
 16);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>@@ -345,7 &#43;345,7 @@ static void gen_dup_i64(unsigned vece, TCGv_i6=
4 out, TCGv_i64 in)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8u_i64(out, in);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_i64(out, out, 0x0101010=
101010101ull);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16u_i64(out, in);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_i64(out, out, 0x0001000=
100010001ull);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -558,7 &#43;558,7 @@ static void do_dup(unsigned vece, uint32_t dof=
s, uint32_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
extrl_i64_i32(t_32, in_64);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D=
 MO_UB) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
movi_i32(t_32, in_c &amp; 0xff);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_1=
6) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D =
MO_UW) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
movi_i32(t_32, in_c &amp; 0xffff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
movi_i32(t_32, in_c);</div>
<div>@@ -1459,7 &#43;1459,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uin=
t32_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ld8u_i32(in, cpu_env, aofs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ld16u_i32(in, cpu_env, aofs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:</div>
<div>@@ -1526,7 &#43;1526,7 @@ void tcg_gen_gvec_dup16i(uint32_t dofs, uint=
32_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; uint32_t maxsz, uint16_t x)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;check_size_align(oprsz, maxsz, dofs);</div>
<div>- &nbsp; &nbsp;do_dup(MO_16, dofs, oprsz, maxsz, NULL, NULL, x);</div>
<div>&#43; &nbsp; &nbsp;do_dup(MO_UW, dofs, oprsz, maxsz, NULL, NULL, x);</=
div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_gvec_dup8i(uint32_t dofs, uint32_t oprsz,</div>
<div>@@ -1579,7 &#43;1579,7 @@ void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i=
64 a, TCGv_i64 b)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)</=
div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_16, 0x8000));=
</div>
<div>&#43; &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UW, 0x800=
0));</div>
<div>&nbsp; &nbsp; &nbsp;gen_addv_mask(d, a, b, m);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i64(m);</div>
<div>&nbsp;}</div>
<div>@@ -1613,7 &#43;1613,7 @@ void tcg_gen_gvec_add(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_add1=
6,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_add,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_add_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_add3=
2,</div>
<div>@@ -1644,7 &#43;1644,7 @@ void tcg_gen_gvec_adds(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_adds=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_add,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_add_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_adds=
32,</div>
<div>@@ -1685,7 &#43;1685,7 @@ void tcg_gen_gvec_subs(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_subs=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sub,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_sub_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_subs=
32,</div>
<div>@@ -1732,7 &#43;1732,7 @@ void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i=
64 a, TCGv_i64 b)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)</=
div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_16, 0x8000));=
</div>
<div>&#43; &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UW, 0x800=
0));</div>
<div>&nbsp; &nbsp; &nbsp;gen_subv_mask(d, a, b, m);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i64(m);</div>
<div>&nbsp;}</div>
<div>@@ -1764,7 &#43;1764,7 @@ void tcg_gen_gvec_sub(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sub1=
6,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sub,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_sub_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sub3=
2,</div>
<div>@@ -1795,7 &#43;1795,7 @@ void tcg_gen_gvec_mul(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_mul_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_mul1=
6,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_mul_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_mul_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_mul3=
2,</div>
<div>@@ -1824,7 &#43;1824,7 @@ void tcg_gen_gvec_muls(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_mul_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_muls=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_mul_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_mul_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_muls=
32,</div>
<div>@@ -1862,7 &#43;1862,7 @@ void tcg_gen_gvec_ssadd(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ssadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ssad=
d16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ssadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ssad=
d32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1888,7 &#43;1888,7 @@ void tcg_gen_gvec_sssub(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sssub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sssu=
b16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sssub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sssu=
b32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1930,7 &#43;1930,7 @@ void tcg_gen_gvec_usadd(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_usadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_usad=
d16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_usadd_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_usadd_vec,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_usad=
d32,</div>
<div>@@ -1974,7 &#43;1974,7 @@ void tcg_gen_gvec_ussub(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ussub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ussu=
b16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_ussub_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_ussub_vec,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ussu=
b32,</div>
<div>@@ -2002,7 &#43;2002,7 @@ void tcg_gen_gvec_smin(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_smin_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smin=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_smin_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_smin_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smin=
32,</div>
<div>@@ -2030,7 &#43;2030,7 @@ void tcg_gen_gvec_umin(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_umin_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umin=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_umin_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_umin_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umin=
32,</div>
<div>@@ -2058,7 &#43;2058,7 @@ void tcg_gen_gvec_smax(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_smax_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smax=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_smax_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_smax_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smax=
32,</div>
<div>@@ -2086,7 &#43;2086,7 @@ void tcg_gen_gvec_umax(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_umax_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umax=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_umax_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_umax_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umax=
32,</div>
<div>@@ -2127,7 &#43;2127,7 @@ void tcg_gen_vec_neg8_i64(TCGv_i64 d, TCGv_i=
64 b)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_neg16_i64(TCGv_i64 d, TCGv_i64 b)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_16, 0x8000));=
</div>
<div>&#43; &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UW, 0x800=
0));</div>
<div>&nbsp; &nbsp; &nbsp;gen_negv_mask(d, b, m);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i64(m);</div>
<div>&nbsp;}</div>
<div>@@ -2160,7 &#43;2160,7 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_neg_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_neg1=
6,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_neg_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_neg_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_neg3=
2,</div>
<div>@@ -2206,7 &#43;2206,7 @@ static void tcg_gen_vec_abs8_i64(TCGv_i64 d,=
 TCGv_i64 b)</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_gen_vec_abs16_i64(TCGv_i64 d, TCGv_i64 b)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;gen_absv_mask(d, b, MO_16);</div>
<div>&#43; &nbsp; &nbsp;gen_absv_mask(d, b, MO_UW);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_gvec_abs(unsigned vece, uint32_t dofs, uint32_t aof=
s,</div>
<div>@@ -2223,7 &#43;2223,7 @@ void tcg_gen_gvec_abs(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_abs_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_abs1=
6,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_abs_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_abs_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_abs3=
2,</div>
<div>@@ -2461,7 &#43;2461,7 @@ void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_=
i64 a, int64_t c)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_shl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)</=
div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_16, 0xffff &lt;&lt; c);<=
/div>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UW, 0xffff &lt;&lt; =
c);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shli_i64(d, a, c);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_andi_i64(d, d, mask);</div>
<div>&nbsp;}</div>
<div>@@ -2480,7 &#43;2480,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shli_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl1=
6i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_shli_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shli_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl3=
2i,</div>
<div>@@ -2512,7 &#43;2512,7 @@ void tcg_gen_vec_shr8i_i64(TCGv_i64 d, TCGv_=
i64 a, int64_t c)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_shr16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)</=
div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_16, 0xffff &gt;&gt; c);<=
/div>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UW, 0xffff &gt;&gt; =
c);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shri_i64(d, a, c);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_andi_i64(d, d, mask);</div>
<div>&nbsp;}</div>
<div>@@ -2531,7 &#43;2531,7 @@ void tcg_gen_gvec_shri(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shri_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr1=
6i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_shri_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shri_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr3=
2i,</div>
<div>@@ -2570,8 &#43;2570,8 @@ void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_=
i64 a, int64_t c)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)</=
div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t s_mask =3D dup_const(MO_16, 0x8000 &gt;&gt; c)=
;</div>
<div>- &nbsp; &nbsp;uint64_t c_mask =3D dup_const(MO_16, 0xffff &gt;&gt; c)=
;</div>
<div>&#43; &nbsp; &nbsp;uint64_t s_mask =3D dup_const(MO_UW, 0x8000 &gt;&gt=
; c);</div>
<div>&#43; &nbsp; &nbsp;uint64_t c_mask =3D dup_const(MO_UW, 0xffff &gt;&gt=
; c);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 s =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shri_i64(d, a, c);</div>
<div>@@ -2596,7 &#43;2596,7 @@ void tcg_gen_gvec_sari(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sari_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar1=
6i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_sari_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sari_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar3=
2i,</div>
<div>@@ -2884,7 &#43;2884,7 @@ void tcg_gen_gvec_shlv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_shlv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl1=
6v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_shl_mod_i32,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shlv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl3=
2v,</div>
<div>@@ -2947,7 &#43;2947,7 @@ void tcg_gen_gvec_shrv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_shrv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr1=
6v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_shr_mod_i32,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shrv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr3=
2v,</div>
<div>@@ -3010,7 &#43;3010,7 @@ void tcg_gen_gvec_sarv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sarv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar1=
6v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_16 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UW },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni4 =3D tcg_gen_sar_mod_i32,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sarv_mod_ve=
c,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar3=
2v,</div>
<div>diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c</div>
<div>index d7ffc9e..b0a4d98 100644</div>
<div>--- a/tcg/tcg-op-vec.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op-vec.c</div>
<div>@@ -270,7 &#43;270,7 @@ void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a=
)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;do_dupi_vec(r, MO_REG, dup_const(MO_16, a));</div>
<div>&#43; &nbsp; &nbsp;do_dupi_vec(r, MO_REG, dup_const(MO_UW, a));</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)</div>
<div>diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c</div>
<div>index 61eda33..21d448c 100644</div>
<div>--- a/tcg/tcg-op.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op.c</div>
<div>@@ -2723,7 &#43;2723,7 @@ static inline TCGMemOp tcg_canonicalize_memo=
p(TCGMemOp op, bool is64, bool st)</div>
<div>&nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op &amp;=3D ~MO_BSWAP;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!is64) {</div>
<div>@@ -2810,7 &#43;2810,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if ((orig_memop ^ memop) &amp; MO_BSWAP) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (orig_memop &amp; MO_SIZE) {<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap16_i32(va=
l, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (orig_memop &amp; M=
O_SIGN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16s_i32(val, val);</div>
<div>@@ -2837,7 &#43;2837,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp;if (!TCG_TARGET_HAS_MEMORY_BSWAP &amp;&amp; (memop=
 &amp; MO_BSWAP)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;swap =3D tcg_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (memop &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16u_i32(swa=
p, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap16_i32(sw=
ap, swap);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -2890,7 &#43;2890,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if ((orig_memop ^ memop) &amp; MO_BSWAP) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (orig_memop &amp; MO_SIZE) {<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap16_i64(va=
l, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (orig_memop &amp; M=
O_SIGN) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext16s_i64(val, val);</div>
<div>@@ -2928,7 &#43;2928,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv =
addr, TCGArg idx, TCGMemOp memop)</div>
<div>&nbsp; &nbsp; &nbsp;if (!TCG_TARGET_HAS_MEMORY_BSWAP &amp;&amp; (memop=
 &amp; MO_BSWAP)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;swap =3D tcg_temp_new_i64();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (memop &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UW:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext16u_i64(swa=
p, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_bswap16_i64(sw=
ap, swap);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -3025,8 &#43;3025,8 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, =
TCGv_env, TCGv, TCGv_i64);</div>
<div>&nbsp;</div>
<div>&nbsp;static void * const table_cmpxchg[16] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UB] =3D gen_helper_atomic_cmpxchgb,</div>
<div>- &nbsp; &nbsp;[MO_16 | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,</div=
>
<div>- &nbsp; &nbsp;[MO_16 | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,</div=
>
<div>&#43; &nbsp; &nbsp;[MO_UW | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,<=
/div>
<div>&#43; &nbsp; &nbsp;[MO_UW | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,<=
/div>
<div>&nbsp; &nbsp; &nbsp;[MO_32 | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,=
</div>
<div>&nbsp; &nbsp; &nbsp;[MO_32 | MO_BE] =3D gen_helper_atomic_cmpxchgl_be,=
</div>
<div>&nbsp; &nbsp; &nbsp;WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomi=
c_cmpxchgq_le)</div>
<div>@@ -3249,8 &#43;3249,8 @@ static void do_atomic_op_i64(TCGv_i64 ret, T=
CGv addr, TCGv_i64 val,</div>
<div>&nbsp;#define GEN_ATOMIC_HELPER(NAME, OP, NEW) &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;\</div>
<div>&nbsp;static void * const table_##NAME[16] =3D { &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp;[MO_UB] =3D gen_helper_atomic_##NAME##b, &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; \</div>
<div>- &nbsp; &nbsp;[MO_16 | MO_LE] =3D gen_helper_atomic_##NAME##w_le, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>- &nbsp; &nbsp;[MO_16 | MO_BE] =3D gen_helper_atomic_##NAME##w_be, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&#43; &nbsp; &nbsp;[MO_UW | MO_LE] =3D gen_helper_atomic_##NAME##w_le,=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&#43; &nbsp; &nbsp;[MO_UW | MO_BE] =3D gen_helper_atomic_##NAME##w_be,=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;[MO_32 | MO_LE] =3D gen_helper_atomic_##NAME##l_le=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;[MO_32 | MO_BE] =3D gen_helper_atomic_##NAME##l_be=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;WITH_ATOMIC64([MO_64 | MO_LE] =3D gen_helper_atomi=
c_##NAME##q_le) &nbsp; &nbsp; \</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index 5636d6b..a378887 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -1303,7 &#43;1303,7 @@ uint64_t dup_const(unsigned vece, uint64_t c=
);</div>
<div>&nbsp;#define dup_const(VECE, C) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;(__builtin_constant_p(VECE) &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; ? &nbsp; ((VECE) =3D=3D MO_UB ? 0x010101010101010=
1ull * (uint8_t)(C) &nbsp; \</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_16 ? 0x000100010001000=
1ull * (uint16_t)(C) &nbsp;\</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_UW ? 0x00010001000=
10001ull * (uint16_t)(C) &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_32 ? 0x0000000100=
000001ull * (uint32_t)(C) &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: dup_const(VECE, C)) &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; : dup_const(VECE, C))</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156381001643348708btcom_--

