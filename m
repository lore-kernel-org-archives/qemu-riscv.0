Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpaZq-0000PK-JM
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 11:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaU3-0005lm-IP
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaTt-00045e-6V
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 11:44:15 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.74]:33996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaTC-0003Wm-5j; Mon, 22 Jul 2019 11:43:22 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:38:09 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:38:09 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:38:09 +0100
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
Thread-Topic: [Qemu-devel] [PATCH v2 01/20] tcg: Replace MO_8 with MO_UB alias
Thread-Index: AQHVQKNq0Qv9Y9yzaki71enBtb4N6w==
Date: Mon, 22 Jul 2019 15:38:09 +0000
Message-ID: <1563809888089.57547@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
Content-Type: multipart/alternative; boundary="_000_156380988808957547btcom_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.74
X-Mailman-Approved-At: Mon, 22 Jul 2019 11:50:10 -0400
Subject: [Qemu-riscv] [Qemu-devel] [PATCH v2 01/20] tcg: Replace MO_8 with
 MO_UB alias
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
X-List-Received-Date: Mon, 22 Jul 2019 15:44:25 -0000

--_000_156380988808957547btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Preparation for splitting MO_8 out from TCGMemOp into new accelerator
independent MemOp.

As MO_8 will be a value of MemOp, existing TCGMemOp comparisons and
coercions will trigger -Wenum-compare and -Wenum-conversion.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 target/arm/sve_helper.c             |  4 +-
 target/arm/translate-a64.c          | 14 +++----
 target/arm/translate-sve.c          |  4 +-
 target/arm/translate.c              | 38 +++++++++----------
 target/i386/translate.c             | 72 +++++++++++++++++----------------=
--
 target/mips/translate.c             |  4 +-
 target/ppc/translate/vmx-impl.inc.c | 28 +++++++-------
 target/s390x/translate.c            |  2 +-
 target/s390x/translate_vx.inc.c     |  4 +-
 target/s390x/vec.h                  |  4 +-
 tcg/aarch64/tcg-target.inc.c        | 16 ++++----
 tcg/arm/tcg-target.inc.c            |  6 +--
 tcg/i386/tcg-target.inc.c           | 54 +++++++++++++-------------
 tcg/mips/tcg-target.inc.c           |  4 +-
 tcg/riscv/tcg-target.inc.c          |  4 +-
 tcg/sparc/tcg-target.inc.c          |  2 +-
 tcg/tcg-op-gvec.c                   | 76 ++++++++++++++++++---------------=
----
 tcg/tcg-op-vec.c                    | 10 ++---
 tcg/tcg-op.c                        |  6 +--
 tcg/tcg.h                           |  2 +-
 20 files changed, 177 insertions(+), 177 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fc0c175..4c7e11f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1531,7 +1531,7 @@ void HELPER(sve_cpy_m_b)(void *vd, void *vn, void *vg=
,
     uint64_t *d =3D vd, *n =3D vn;
     uint8_t *pg =3D vg;

-    mm =3D dup_const(MO_8, mm);
+    mm =3D dup_const(MO_UB, mm);
     for (i =3D 0; i < opr_sz; i +=3D 1) {
         uint64_t nn =3D n[i];
         uint64_t pp =3D expand_pred_b(pg[H1(i)]);
@@ -1588,7 +1588,7 @@ void HELPER(sve_cpy_z_b)(void *vd, void *vg, uint64_t=
 val, uint32_t desc)
     uint64_t *d =3D vd;
     uint8_t *pg =3D vg;

-    val =3D dup_const(MO_8, val);
+    val =3D dup_const(MO_UB, val);
     for (i =3D 0; i < opr_sz; i +=3D 1) {
         d[i] =3D val & expand_pred_b(pg[H1(i)]);
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d323147..f840b43 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -993,7 +993,7 @@ static void read_vec_element(DisasContext *s, TCGv_i64 =
tcg_dest, int srcidx,
 {
     int vect_off =3D vec_reg_offset(s, srcidx, element, memop & MO_SIZE);
     switch (memop) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_ld8u_i64(tcg_dest, cpu_env, vect_off);
         break;
     case MO_16:
@@ -1002,7 +1002,7 @@ static void read_vec_element(DisasContext *s, TCGv_i6=
4 tcg_dest, int srcidx,
     case MO_32:
         tcg_gen_ld32u_i64(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_8|MO_SIGN:
+    case MO_SB:
         tcg_gen_ld8s_i64(tcg_dest, cpu_env, vect_off);
         break;
     case MO_16|MO_SIGN:
@@ -1025,13 +1025,13 @@ static void read_vec_element_i32(DisasContext *s, T=
CGv_i32 tcg_dest, int srcidx,
 {
     int vect_off =3D vec_reg_offset(s, srcidx, element, memop & MO_SIZE);
     switch (memop) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_ld8u_i32(tcg_dest, cpu_env, vect_off);
         break;
     case MO_16:
         tcg_gen_ld16u_i32(tcg_dest, cpu_env, vect_off);
         break;
-    case MO_8|MO_SIGN:
+    case MO_SB:
         tcg_gen_ld8s_i32(tcg_dest, cpu_env, vect_off);
         break;
     case MO_16|MO_SIGN:
@@ -1052,7 +1052,7 @@ static void write_vec_element(DisasContext *s, TCGv_i=
64 tcg_src, int destidx,
 {
     int vect_off =3D vec_reg_offset(s, destidx, element, memop & MO_SIZE);
     switch (memop) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_st8_i64(tcg_src, cpu_env, vect_off);
         break;
     case MO_16:
@@ -1074,7 +1074,7 @@ static void write_vec_element_i32(DisasContext *s, TC=
Gv_i32 tcg_src,
 {
     int vect_off =3D vec_reg_offset(s, destidx, element, memop & MO_SIZE);
     switch (memop) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_st8_i32(tcg_src, cpu_env, vect_off);
         break;
     case MO_16:
@@ -12885,7 +12885,7 @@ static void disas_simd_indexed(DisasContext *s, uin=
t32_t insn)

     default: /* integer */
         switch (size) {
-        case MO_8:
+        case MO_UB:
         case MO_64:
             unallocated_encoding(s);
             return;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fa068b0..ec5fb11 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1665,7 +1665,7 @@ static void do_sat_addsub_vec(DisasContext *s, int es=
z, int rd, int rn,
     desc =3D tcg_const_i32(simd_desc(vsz, vsz, 0));

     switch (esz) {
-    case MO_8:
+    case MO_UB:
         t32 =3D tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(t32, val);
         if (d) {
@@ -3308,7 +3308,7 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_e=
sz *a)
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_sve_subri_b,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8,
+          .vece =3D MO_UB,
           .scalar_first =3D true },
         { .fni8 =3D tcg_gen_vec_sub16_i64,
           .fniv =3D tcg_gen_sub_vec,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462..39266cf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1474,7 +1474,7 @@ static void neon_store_element(int reg, int ele, TCGM=
emOp size, TCGv_i32 var)
     long offset =3D neon_element_offset(reg, ele, size);

     switch (size) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_st8_i32(var, cpu_env, offset);
         break;
     case MO_16:
@@ -1493,7 +1493,7 @@ static void neon_store_element64(int reg, int ele, TC=
GMemOp size, TCGv_i64 var)
     long offset =3D neon_element_offset(reg, ele, size);

     switch (size) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_st8_i64(var, cpu_env, offset);
         break;
     case MO_16:
@@ -4262,7 +4262,7 @@ const GVecGen2i ssra_op[4] =3D {
       .fniv =3D gen_ssra_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_ssra,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fni8 =3D gen_ssra16_i64,
       .fniv =3D gen_ssra_vec,
       .load_dest =3D true,
@@ -4320,7 +4320,7 @@ const GVecGen2i usra_op[4] =3D {
       .fniv =3D gen_usra_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_usra,
-      .vece =3D MO_8, },
+      .vece =3D MO_UB, },
     { .fni8 =3D gen_usra16_i64,
       .fniv =3D gen_usra_vec,
       .load_dest =3D true,
@@ -4341,7 +4341,7 @@ const GVecGen2i usra_op[4] =3D {

 static void gen_shr8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
-    uint64_t mask =3D dup_const(MO_8, 0xff >> shift);
+    uint64_t mask =3D dup_const(MO_UB, 0xff >> shift);
     TCGv_i64 t =3D tcg_temp_new_i64();

     tcg_gen_shri_i64(t, a, shift);
@@ -4400,7 +4400,7 @@ const GVecGen2i sri_op[4] =3D {
       .fniv =3D gen_shr_ins_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_sri,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fni8 =3D gen_shr16_ins_i64,
       .fniv =3D gen_shr_ins_vec,
       .load_dest =3D true,
@@ -4421,7 +4421,7 @@ const GVecGen2i sri_op[4] =3D {

 static void gen_shl8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
-    uint64_t mask =3D dup_const(MO_8, 0xff << shift);
+    uint64_t mask =3D dup_const(MO_UB, 0xff << shift);
     TCGv_i64 t =3D tcg_temp_new_i64();

     tcg_gen_shli_i64(t, a, shift);
@@ -4478,7 +4478,7 @@ const GVecGen2i sli_op[4] =3D {
       .fniv =3D gen_shl_ins_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_sli,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fni8 =3D gen_shl16_ins_i64,
       .fniv =3D gen_shl_ins_vec,
       .load_dest =3D true,
@@ -4574,7 +4574,7 @@ const GVecGen3 mla_op[4] =3D {
       .fniv =3D gen_mla_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_mla,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fni4 =3D gen_mla16_i32,
       .fniv =3D gen_mla_vec,
       .load_dest =3D true,
@@ -4598,7 +4598,7 @@ const GVecGen3 mls_op[4] =3D {
       .fniv =3D gen_mls_vec,
       .load_dest =3D true,
       .opt_opc =3D vecop_list_mls,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fni4 =3D gen_mls16_i32,
       .fniv =3D gen_mls_vec,
       .load_dest =3D true,
@@ -4645,7 +4645,7 @@ const GVecGen3 cmtst_op[4] =3D {
     { .fni4 =3D gen_helper_neon_tst_u8,
       .fniv =3D gen_cmtst_vec,
       .opt_opc =3D vecop_list_cmtst,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fni4 =3D gen_helper_neon_tst_u16,
       .fniv =3D gen_cmtst_vec,
       .opt_opc =3D vecop_list_cmtst,
@@ -4681,7 +4681,7 @@ const GVecGen4 uqadd_op[4] =3D {
       .fno =3D gen_helper_gvec_uqadd_b,
       .write_aofs =3D true,
       .opt_opc =3D vecop_list_uqadd,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fniv =3D gen_uqadd_vec,
       .fno =3D gen_helper_gvec_uqadd_h,
       .write_aofs =3D true,
@@ -4719,7 +4719,7 @@ const GVecGen4 sqadd_op[4] =3D {
       .fno =3D gen_helper_gvec_sqadd_b,
       .opt_opc =3D vecop_list_sqadd,
       .write_aofs =3D true,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fniv =3D gen_sqadd_vec,
       .fno =3D gen_helper_gvec_sqadd_h,
       .opt_opc =3D vecop_list_sqadd,
@@ -4757,7 +4757,7 @@ const GVecGen4 uqsub_op[4] =3D {
       .fno =3D gen_helper_gvec_uqsub_b,
       .opt_opc =3D vecop_list_uqsub,
       .write_aofs =3D true,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fniv =3D gen_uqsub_vec,
       .fno =3D gen_helper_gvec_uqsub_h,
       .opt_opc =3D vecop_list_uqsub,
@@ -4795,7 +4795,7 @@ const GVecGen4 sqsub_op[4] =3D {
       .fno =3D gen_helper_gvec_sqsub_b,
       .opt_opc =3D vecop_list_sqsub,
       .write_aofs =3D true,
-      .vece =3D MO_8 },
+      .vece =3D MO_UB },
     { .fniv =3D gen_sqsub_vec,
       .fno =3D gen_helper_gvec_sqsub_h,
       .opt_opc =3D vecop_list_sqsub,
@@ -4972,15 +4972,15 @@ static int disas_neon_data_insn(DisasContext *s, ui=
nt32_t insn)
                                  vec_size, vec_size);
                 break;
             case 5: /* VBSL */
-                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rd_ofs, rn_ofs, rm_ofs,
+                tcg_gen_gvec_bitsel(MO_UB, rd_ofs, rd_ofs, rn_ofs, rm_ofs,
                                     vec_size, vec_size);
                 break;
             case 6: /* VBIT */
-                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rm_ofs, rn_ofs, rd_ofs,
+                tcg_gen_gvec_bitsel(MO_UB, rd_ofs, rm_ofs, rn_ofs, rd_ofs,
                                     vec_size, vec_size);
                 break;
             case 7: /* VBIF */
-                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rm_ofs, rd_ofs, rn_ofs,
+                tcg_gen_gvec_bitsel(MO_UB, rd_ofs, rm_ofs, rd_ofs, rn_ofs,
                                     vec_size, vec_size);
                 break;
             }
@@ -6873,7 +6873,7 @@ static int disas_neon_data_insn(DisasContext *s, uint=
32_t insn)
                     return 1;
                 }
                 if (insn & (1 << 16)) {
-                    size =3D MO_8;
+                    size =3D MO_UB;
                     element =3D (insn >> 17) & 7;
                 } else if (insn & (1 << 17)) {
                     size =3D MO_16;
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 03150a8..0e45300 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -349,20 +349,20 @@ static inline TCGMemOp mo_64_32(TCGMemOp ot)
    byte vs word opcodes.  */
 static inline TCGMemOp mo_b_d(int b, TCGMemOp ot)
 {
-    return b & 1 ? ot : MO_8;
+    return b & 1 ? ot : MO_UB;
 }

 /* Select size 8 if lsb of B is clear, else OT capped at 32.
    Used for decoding operand size of port opcodes.  */
 static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)
 {
-    return b & 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_32) : MO_8;
+    return b & 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_32) : MO_UB;
 }

 static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int reg, TCGv t=
0)
 {
     switch(ot) {
-    case MO_8:
+    case MO_UB:
         if (!byte_reg_is_xH(s, reg)) {
             tcg_gen_deposit_tl(cpu_regs[reg], cpu_regs[reg], t0, 0, 8);
         } else {
@@ -390,7 +390,7 @@ static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp =
ot, int reg, TCGv t0)
 static inline
 void gen_op_mov_v_reg(DisasContext *s, TCGMemOp ot, TCGv t0, int reg)
 {
-    if (ot =3D=3D MO_8 && byte_reg_is_xH(s, reg)) {
+    if (ot =3D=3D MO_UB && byte_reg_is_xH(s, reg)) {
         tcg_gen_extract_tl(t0, cpu_regs[reg - 4], 8, 8);
     } else {
         tcg_gen_mov_tl(t0, cpu_regs[reg]);
@@ -523,7 +523,7 @@ static inline void gen_op_movl_T0_Dshift(DisasContext *=
s, TCGMemOp ot)
 static TCGv gen_ext_tl(TCGv dst, TCGv src, TCGMemOp size, bool sign)
 {
     switch (size) {
-    case MO_8:
+    case MO_UB:
         if (sign) {
             tcg_gen_ext8s_tl(dst, src);
         } else {
@@ -580,7 +580,7 @@ void gen_op_jz_ecx(DisasContext *s, TCGMemOp size, TCGL=
abel *label1)
 static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCGv_i32 n)
 {
     switch (ot) {
-    case MO_8:
+    case MO_UB:
         gen_helper_inb(v, cpu_env, n);
         break;
     case MO_16:
@@ -597,7 +597,7 @@ static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCG=
v_i32 n)
 static void gen_helper_out_func(TCGMemOp ot, TCGv_i32 v, TCGv_i32 n)
 {
     switch (ot) {
-    case MO_8:
+    case MO_UB:
         gen_helper_outb(cpu_env, v, n);
         break;
     case MO_16:
@@ -619,7 +619,7 @@ static void gen_check_io(DisasContext *s, TCGMemOp ot, =
target_ulong cur_eip,
     if (s->pe && (s->cpl > s->iopl || s->vm86)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         switch (ot) {
-        case MO_8:
+        case MO_UB:
             gen_helper_check_iob(cpu_env, s->tmp2_i32);
             break;
         case MO_16:
@@ -1557,7 +1557,7 @@ static void gen_rot_rm_T1(DisasContext *s, TCGMemOp o=
t, int op1, int is_right)
     tcg_gen_andi_tl(s->T1, s->T1, mask);

     switch (ot) {
-    case MO_8:
+    case MO_UB:
         /* Replicate the 8-bit input so that a 32-bit rotate works.  */
         tcg_gen_ext8u_tl(s->T0, s->T0);
         tcg_gen_muli_tl(s->T0, s->T0, 0x01010101);
@@ -1661,7 +1661,7 @@ static void gen_rot_rm_im(DisasContext *s, TCGMemOp o=
t, int op1, int op2,
                 tcg_gen_rotli_tl(s->T0, s->T0, op2);
             }
             break;
-        case MO_8:
+        case MO_UB:
             mask =3D 7;
             goto do_shifts;
         case MO_16:
@@ -1719,7 +1719,7 @@ static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp =
ot, int op1,

     if (is_right) {
         switch (ot) {
-        case MO_8:
+        case MO_UB:
             gen_helper_rcrb(s->T0, cpu_env, s->T0, s->T1);
             break;
         case MO_16:
@@ -1738,7 +1738,7 @@ static void gen_rotc_rm_T1(DisasContext *s, TCGMemOp =
ot, int op1,
         }
     } else {
         switch (ot) {
-        case MO_8:
+        case MO_UB:
             gen_helper_rclb(s->T0, cpu_env, s->T0, s->T1);
             break;
         case MO_16:
@@ -2184,7 +2184,7 @@ static inline uint32_t insn_get(CPUX86State *env, Dis=
asContext *s, TCGMemOp ot)
     uint32_t ret;

     switch (ot) {
-    case MO_8:
+    case MO_UB:
         ret =3D x86_ldub_code(env, s);
         break;
     case MO_16:
@@ -3784,7 +3784,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s=
, int b,
                     goto illegal_op;
                 }
                 if ((b & 0xff) =3D=3D 0xf0) {
-                    ot =3D MO_8;
+                    ot =3D MO_UB;
                 } else if (s->dflag !=3D MO_64) {
                     ot =3D (s->prefix & PREFIX_DATA ? MO_16 : MO_32);
                 } else {
@@ -4760,7 +4760,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
                 val =3D insn_get(env, s, ot);
                 break;
             case 0x83:
-                val =3D (int8_t)insn_get(env, s, MO_8);
+                val =3D (int8_t)insn_get(env, s, MO_UB);
                 break;
             }
             tcg_gen_movi_tl(s->T1, val);
@@ -4866,8 +4866,8 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             break;
         case 4: /* mul */
             switch(ot) {
-            case MO_8:
-                gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
+            case MO_UB:
+                gen_op_mov_v_reg(s, MO_UB, s->T1, R_EAX);
                 tcg_gen_ext8u_tl(s->T0, s->T0);
                 tcg_gen_ext8u_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
@@ -4915,8 +4915,8 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             break;
         case 5: /* imul */
             switch(ot) {
-            case MO_8:
-                gen_op_mov_v_reg(s, MO_8, s->T1, R_EAX);
+            case MO_UB:
+                gen_op_mov_v_reg(s, MO_UB, s->T1, R_EAX);
                 tcg_gen_ext8s_tl(s->T0, s->T0);
                 tcg_gen_ext8s_tl(s->T1, s->T1);
                 /* XXX: use 32 bit mul which could be faster */
@@ -4969,7 +4969,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             break;
         case 6: /* div */
             switch(ot) {
-            case MO_8:
+            case MO_UB:
                 gen_helper_divb_AL(cpu_env, s->T0);
                 break;
             case MO_16:
@@ -4988,7 +4988,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             break;
         case 7: /* idiv */
             switch(ot) {
-            case MO_8:
+            case MO_UB:
                 gen_helper_idivb_AL(cpu_env, s->T0);
                 break;
             case MO_16:
@@ -5157,7 +5157,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             gen_op_mov_reg_v(s, MO_32, R_EAX, s->T0);
             break;
         case MO_16:
-            gen_op_mov_v_reg(s, MO_8, s->T0, R_EAX);
+            gen_op_mov_v_reg(s, MO_UB, s->T0, R_EAX);
             tcg_gen_ext8s_tl(s->T0, s->T0);
             gen_op_mov_reg_v(s, MO_16, R_EAX, s->T0);
             break;
@@ -5205,7 +5205,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             val =3D insn_get(env, s, ot);
             tcg_gen_movi_tl(s->T1, val);
         } else if (b =3D=3D 0x6b) {
-            val =3D (int8_t)insn_get(env, s, MO_8);
+            val =3D (int8_t)insn_get(env, s, MO_UB);
             tcg_gen_movi_tl(s->T1, val);
         } else {
             gen_op_mov_v_reg(s, ot, s->T1, reg);
@@ -5419,7 +5419,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         if (b =3D=3D 0x68)
             val =3D insn_get(env, s, ot);
         else
-            val =3D (int8_t)insn_get(env, s, MO_8);
+            val =3D (int8_t)insn_get(env, s, MO_UB);
         tcg_gen_movi_tl(s->T0, val);
         gen_push_v(s, s->T0);
         break;
@@ -5573,7 +5573,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             /* d_ot is the size of destination */
             d_ot =3D dflag;
             /* ot is the size of source */
-            ot =3D (b & 1) + MO_8;
+            ot =3D (b & 1) + MO_UB;
             /* s_ot is the sign+size of source */
             s_ot =3D b & 8 ? MO_SIGN | ot : ot;

@@ -5661,13 +5661,13 @@ static target_ulong disas_insn(DisasContext *s, CPU=
State *cpu)
         tcg_gen_add_tl(s->A0, s->A0, s->T0);
         gen_extu(s->aflag, s->A0);
         gen_add_A0_ds_seg(s);
-        gen_op_ld_v(s, MO_8, s->T0, s->A0);
-        gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
+        gen_op_ld_v(s, MO_UB, s->T0, s->A0);
+        gen_op_mov_reg_v(s, MO_UB, R_EAX, s->T0);
         break;
     case 0xb0 ... 0xb7: /* mov R, Ib */
-        val =3D insn_get(env, s, MO_8);
+        val =3D insn_get(env, s, MO_UB);
         tcg_gen_movi_tl(s->T0, val);
-        gen_op_mov_reg_v(s, MO_8, (b & 7) | REX_B(s), s->T0);
+        gen_op_mov_reg_v(s, MO_UB, (b & 7) | REX_B(s), s->T0);
         break;
     case 0xb8 ... 0xbf: /* mov R, Iv */
 #ifdef TARGET_X86_64
@@ -6637,7 +6637,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         }
         goto do_ljmp;
     case 0xeb: /* jmp Jb */
-        tval =3D (int8_t)insn_get(env, s, MO_8);
+        tval =3D (int8_t)insn_get(env, s, MO_UB);
         tval +=3D s->pc - s->cs_base;
         if (dflag =3D=3D MO_16) {
             tval &=3D 0xffff;
@@ -6645,7 +6645,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         gen_jmp(s, tval);
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
-        tval =3D (int8_t)insn_get(env, s, MO_8);
+        tval =3D (int8_t)insn_get(env, s, MO_UB);
         goto do_jcc;
     case 0x180 ... 0x18f: /* jcc Jv */
         if (dflag !=3D MO_16) {
@@ -6666,7 +6666,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     case 0x190 ... 0x19f: /* setcc Gv */
         modrm =3D x86_ldub_code(env, s);
         gen_setcc1(s, b, s->T0);
-        gen_ldst_modrm(env, s, modrm, MO_8, OR_TMP0, 1);
+        gen_ldst_modrm(env, s, modrm, MO_UB, OR_TMP0, 1);
         break;
     case 0x140 ... 0x14f: /* cmov Gv, Ev */
         if (!(s->cpuid_features & CPUID_CMOV)) {
@@ -6751,7 +6751,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
     case 0x9e: /* sahf */
         if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
             goto illegal_op;
-        gen_op_mov_v_reg(s, MO_8, s->T0, R_AH);
+        gen_op_mov_v_reg(s, MO_UB, s->T0, R_AH);
         gen_compute_eflags(s);
         tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, CC_O);
         tcg_gen_andi_tl(s->T0, s->T0, CC_S | CC_Z | CC_A | CC_P | CC_C);
@@ -6763,7 +6763,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         gen_compute_eflags(s);
         /* Note: gen_compute_eflags() only gives the condition codes */
         tcg_gen_ori_tl(s->T0, cpu_cc_src, 0x02);
-        gen_op_mov_reg_v(s, MO_8, R_AH, s->T0);
+        gen_op_mov_reg_v(s, MO_UB, R_AH, s->T0);
         break;
     case 0xf5: /* cmc */
         gen_compute_eflags(s);
@@ -7137,7 +7137,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
             goto illegal_op;
         gen_compute_eflags_c(s, s->T0);
         tcg_gen_neg_tl(s->T0, s->T0);
-        gen_op_mov_reg_v(s, MO_8, R_EAX, s->T0);
+        gen_op_mov_reg_v(s, MO_UB, R_EAX, s->T0);
         break;
     case 0xe0: /* loopnz */
     case 0xe1: /* loopz */
@@ -7146,7 +7146,7 @@ static target_ulong disas_insn(DisasContext *s, CPUSt=
ate *cpu)
         {
             TCGLabel *l1, *l2, *l3;

-            tval =3D (int8_t)insn_get(env, s, MO_8);
+            tval =3D (int8_t)insn_get(env, s, MO_UB);
             next_eip =3D s->pc - s->cs_base;
             tval +=3D next_eip;
             if (dflag =3D=3D MO_16) {
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 3575eff..20a9777 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -3684,7 +3684,7 @@ static void gen_st(DisasContext *ctx, uint32_t opc, i=
nt rt,
         mem_idx =3D MIPS_HFLAG_UM;
         /* fall through */
     case OPC_SB:
-        tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_8);
+        tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_UB);
         break;
     case OPC_SWLE:
         mem_idx =3D MIPS_HFLAG_UM;
@@ -20193,7 +20193,7 @@ static void gen_p_lsx(DisasContext *ctx, int rd, in=
t rs, int rt)
         check_nms(ctx);
         gen_load_gpr(t1, rd);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx,
-                           MO_8);
+                           MO_UB);
         break;
     case NM_SHX:
     /*case NM_SHXS:*/
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx=
-impl.inc.c
index 663275b..4130dd1 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -403,7 +403,7 @@ static void glue(gen_, name)(DisasContext *ctx)        =
                 \
     tcg_temp_free_ptr(rb);                                              \
 }

-GEN_VXFORM_V(vaddubm, MO_8, tcg_gen_gvec_add, 0, 0);
+GEN_VXFORM_V(vaddubm, MO_UB, tcg_gen_gvec_add, 0, 0);
 GEN_VXFORM_DUAL_EXT(vaddubm, PPC_ALTIVEC, PPC_NONE, 0,       \
                     vmul10cuq, PPC_NONE, PPC2_ISA300, 0x0000F800)
 GEN_VXFORM_V(vadduhm, MO_16, tcg_gen_gvec_add, 0, 1);
@@ -411,23 +411,23 @@ GEN_VXFORM_DUAL(vadduhm, PPC_ALTIVEC, PPC_NONE,  \
                 vmul10ecuq, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_V(vadduwm, MO_32, tcg_gen_gvec_add, 0, 2);
 GEN_VXFORM_V(vaddudm, MO_64, tcg_gen_gvec_add, 0, 3);
-GEN_VXFORM_V(vsububm, MO_8, tcg_gen_gvec_sub, 0, 16);
+GEN_VXFORM_V(vsububm, MO_UB, tcg_gen_gvec_sub, 0, 16);
 GEN_VXFORM_V(vsubuhm, MO_16, tcg_gen_gvec_sub, 0, 17);
 GEN_VXFORM_V(vsubuwm, MO_32, tcg_gen_gvec_sub, 0, 18);
 GEN_VXFORM_V(vsubudm, MO_64, tcg_gen_gvec_sub, 0, 19);
-GEN_VXFORM_V(vmaxub, MO_8, tcg_gen_gvec_umax, 1, 0);
+GEN_VXFORM_V(vmaxub, MO_UB, tcg_gen_gvec_umax, 1, 0);
 GEN_VXFORM_V(vmaxuh, MO_16, tcg_gen_gvec_umax, 1, 1);
 GEN_VXFORM_V(vmaxuw, MO_32, tcg_gen_gvec_umax, 1, 2);
 GEN_VXFORM_V(vmaxud, MO_64, tcg_gen_gvec_umax, 1, 3);
-GEN_VXFORM_V(vmaxsb, MO_8, tcg_gen_gvec_smax, 1, 4);
+GEN_VXFORM_V(vmaxsb, MO_UB, tcg_gen_gvec_smax, 1, 4);
 GEN_VXFORM_V(vmaxsh, MO_16, tcg_gen_gvec_smax, 1, 5);
 GEN_VXFORM_V(vmaxsw, MO_32, tcg_gen_gvec_smax, 1, 6);
 GEN_VXFORM_V(vmaxsd, MO_64, tcg_gen_gvec_smax, 1, 7);
-GEN_VXFORM_V(vminub, MO_8, tcg_gen_gvec_umin, 1, 8);
+GEN_VXFORM_V(vminub, MO_UB, tcg_gen_gvec_umin, 1, 8);
 GEN_VXFORM_V(vminuh, MO_16, tcg_gen_gvec_umin, 1, 9);
 GEN_VXFORM_V(vminuw, MO_32, tcg_gen_gvec_umin, 1, 10);
 GEN_VXFORM_V(vminud, MO_64, tcg_gen_gvec_umin, 1, 11);
-GEN_VXFORM_V(vminsb, MO_8, tcg_gen_gvec_smin, 1, 12);
+GEN_VXFORM_V(vminsb, MO_UB, tcg_gen_gvec_smin, 1, 12);
 GEN_VXFORM_V(vminsh, MO_16, tcg_gen_gvec_smin, 1, 13);
 GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);
 GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);
@@ -530,18 +530,18 @@ GEN_VXFORM(vmuleuw, 4, 10);
 GEN_VXFORM(vmulesb, 4, 12);
 GEN_VXFORM(vmulesh, 4, 13);
 GEN_VXFORM(vmulesw, 4, 14);
-GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
+GEN_VXFORM_V(vslb, MO_UB, tcg_gen_gvec_shlv, 2, 4);
 GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
 GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
 GEN_VXFORM(vrlwnm, 2, 6);
 GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \
                 vrlwnm, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);
-GEN_VXFORM_V(vsrb, MO_8, tcg_gen_gvec_shrv, 2, 8);
+GEN_VXFORM_V(vsrb, MO_UB, tcg_gen_gvec_shrv, 2, 8);
 GEN_VXFORM_V(vsrh, MO_16, tcg_gen_gvec_shrv, 2, 9);
 GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);
 GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);
-GEN_VXFORM_V(vsrab, MO_8, tcg_gen_gvec_sarv, 2, 12);
+GEN_VXFORM_V(vsrab, MO_UB, tcg_gen_gvec_sarv, 2, 12);
 GEN_VXFORM_V(vsrah, MO_16, tcg_gen_gvec_sarv, 2, 13);
 GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);
 GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);
@@ -589,20 +589,20 @@ static void glue(gen_, NAME)(DisasContext *ctx)      =
                   \
                    16, 16, &g);                                         \
 }

-GEN_VXFORM_SAT(vaddubs, MO_8, add, usadd, 0, 8);
+GEN_VXFORM_SAT(vaddubs, MO_UB, add, usadd, 0, 8);
 GEN_VXFORM_DUAL_EXT(vaddubs, PPC_ALTIVEC, PPC_NONE, 0,       \
                     vmul10uq, PPC_NONE, PPC2_ISA300, 0x0000F800)
 GEN_VXFORM_SAT(vadduhs, MO_16, add, usadd, 0, 9);
 GEN_VXFORM_DUAL(vadduhs, PPC_ALTIVEC, PPC_NONE, \
                 vmul10euq, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_SAT(vadduws, MO_32, add, usadd, 0, 10);
-GEN_VXFORM_SAT(vaddsbs, MO_8, add, ssadd, 0, 12);
+GEN_VXFORM_SAT(vaddsbs, MO_UB, add, ssadd, 0, 12);
 GEN_VXFORM_SAT(vaddshs, MO_16, add, ssadd, 0, 13);
 GEN_VXFORM_SAT(vaddsws, MO_32, add, ssadd, 0, 14);
-GEN_VXFORM_SAT(vsububs, MO_8, sub, ussub, 0, 24);
+GEN_VXFORM_SAT(vsububs, MO_UB, sub, ussub, 0, 24);
 GEN_VXFORM_SAT(vsubuhs, MO_16, sub, ussub, 0, 25);
 GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
-GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
+GEN_VXFORM_SAT(vsubsbs, MO_UB, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
 GEN_VXFORM(vadduqm, 0, 4);
@@ -912,7 +912,7 @@ static void glue(gen_, name)(DisasContext *ctx)        =
                 \
         tcg_temp_free_ptr(rd);                                          \
     }

-GEN_VXFORM_VSPLT(vspltb, MO_8, 6, 8);
+GEN_VXFORM_VSPLT(vspltb, MO_UB, 6, 8);
 GEN_VXFORM_VSPLT(vsplth, MO_16, 6, 9);
 GEN_VXFORM_VSPLT(vspltw, MO_32, 6, 10);
 GEN_VXFORM_UIMM_SPLAT(vextractub, 6, 8, 15);
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index ac0d8b6..415747f 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -154,7 +154,7 @@ static inline int vec_full_reg_offset(uint8_t reg)

 static inline int vec_reg_offset(uint8_t reg, uint8_t enr, TCGMemOp es)
 {
-    /* Convert element size (es) - e.g. MO_8 - to bytes */
+    /* Convert element size (es) - e.g. MO_UB - to bytes */
     const uint8_t bytes =3D 1 << es;
     int offs =3D enr * bytes;

diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.in=
c.c
index 41d5cf8..bb424c8 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -30,7 +30,7 @@
  * Sizes:
  *  On s390x, the operand size (oprsz) and the maximum size (maxsz) are
  *  always 16 (128 bit). What gvec code calls "vece", s390x calls "es",
- *  a.k.a. "element size". These values nicely map to MO_8 ... MO_64. Only
+ *  a.k.a. "element size". These values nicely map to MO_UB ... MO_64. Onl=
y
  *  128 bit element size has to be treated in a special way (MO_64 + 1).
  *  We will use ES_* instead of MO_* for this reason in this file.
  *
@@ -46,7 +46,7 @@
 #define NUM_VEC_ELEMENTS(es) (16 / NUM_VEC_ELEMENT_BYTES(es))
 #define NUM_VEC_ELEMENT_BITS(es) (NUM_VEC_ELEMENT_BYTES(es) * BITS_PER_BYT=
E)

-#define ES_8    MO_8
+#define ES_8    MO_UB
 #define ES_16   MO_16
 #define ES_32   MO_32
 #define ES_64   MO_64
diff --git a/target/s390x/vec.h b/target/s390x/vec.h
index a6e3618..b813054 100644
--- a/target/s390x/vec.h
+++ b/target/s390x/vec.h
@@ -76,7 +76,7 @@ static inline uint64_t s390_vec_read_element(const S390Ve=
ctor *v, uint8_t enr,
                                              uint8_t es)
 {
     switch (es) {
-    case MO_8:
+    case MO_UB:
         return s390_vec_read_element8(v, enr);
     case MO_16:
         return s390_vec_read_element16(v, enr);
@@ -121,7 +121,7 @@ static inline void s390_vec_write_element(S390Vector *v=
, uint8_t enr,
                                           uint8_t es, uint64_t data)
 {
     switch (es) {
-    case MO_8:
+    case MO_UB:
         s390_vec_write_element8(v, enr, data);
         break;
     case MO_16:
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 0713448..e4e0845 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -429,20 +429,20 @@ typedef enum {

     /* Load/store register.  Described here as 3.3.12, but the helper
        that emits them can transform to 3.3.10 or 3.3.13.  */
-    I3312_STRB      =3D 0x38000000 | LDST_ST << 22 | MO_8 << 30,
+    I3312_STRB      =3D 0x38000000 | LDST_ST << 22 | MO_UB << 30,
     I3312_STRH      =3D 0x38000000 | LDST_ST << 22 | MO_16 << 30,
     I3312_STRW      =3D 0x38000000 | LDST_ST << 22 | MO_32 << 30,
     I3312_STRX      =3D 0x38000000 | LDST_ST << 22 | MO_64 << 30,

-    I3312_LDRB      =3D 0x38000000 | LDST_LD << 22 | MO_8 << 30,
+    I3312_LDRB      =3D 0x38000000 | LDST_LD << 22 | MO_UB << 30,
     I3312_LDRH      =3D 0x38000000 | LDST_LD << 22 | MO_16 << 30,
     I3312_LDRW      =3D 0x38000000 | LDST_LD << 22 | MO_32 << 30,
     I3312_LDRX      =3D 0x38000000 | LDST_LD << 22 | MO_64 << 30,

-    I3312_LDRSBW    =3D 0x38000000 | LDST_LD_S_W << 22 | MO_8 << 30,
+    I3312_LDRSBW    =3D 0x38000000 | LDST_LD_S_W << 22 | MO_UB << 30,
     I3312_LDRSHW    =3D 0x38000000 | LDST_LD_S_W << 22 | MO_16 << 30,

-    I3312_LDRSBX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_8 << 30,
+    I3312_LDRSBX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_UB << 30,
     I3312_LDRSHX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_16 << 30,
     I3312_LDRSWX    =3D 0x38000000 | LDST_LD_S_X << 22 | MO_32 << 30,

@@ -862,7 +862,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType typ=
e,
     int cmode, imm8, i;

     /* Test all bytes equal first.  */
-    if (v64 =3D=3D dup_const(MO_8, v64)) {
+    if (v64 =3D=3D dup_const(MO_UB, v64)) {
         imm8 =3D (uint8_t)v64;
         tcg_out_insn(s, 3606, MOVI, q, rd, 0, 0xe, imm8);
         return;
@@ -1772,7 +1772,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
MemOp memop,
     const TCGMemOp bswap =3D memop & MO_BSWAP;

     switch (memop & MO_SIZE) {
-    case MO_8:
+    case MO_UB:
         tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
         break;
     case MO_16:
@@ -2186,7 +2186,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,

     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8s_i32:
-        tcg_out_sxt(s, ext, MO_8, a0, a1);
+        tcg_out_sxt(s, ext, MO_UB, a0, a1);
         break;
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16s_i32:
@@ -2198,7 +2198,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext8u_i32:
-        tcg_out_uxt(s, MO_8, a0, a1);
+        tcg_out_uxt(s, MO_UB, a0, a1);
         break;
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext16u_i32:
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index ece88dc..542ffa8 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -1429,7 +1429,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *lb)
     datalo =3D lb->datalo_reg;
     datahi =3D lb->datahi_reg;
     switch (opc & MO_SIZE) {
-    case MO_8:
+    case MO_UB:
         argreg =3D tcg_out_arg_reg8(s, argreg, datalo);
         break;
     case MO_16:
@@ -1621,7 +1621,7 @@ static inline void tcg_out_qemu_st_index(TCGContext *=
s, int cond, TCGMemOp opc,
     TCGMemOp bswap =3D opc & MO_BSWAP;

     switch (opc & MO_SIZE) {
-    case MO_8:
+    case MO_UB:
         tcg_out_st8_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_16:
@@ -1666,7 +1666,7 @@ static inline void tcg_out_qemu_st_direct(TCGContext =
*s, TCGMemOp opc,
     TCGMemOp bswap =3D opc & MO_BSWAP;

     switch (opc & MO_SIZE) {
-    case MO_8:
+    case MO_UB:
         tcg_out_st8_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_16:
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 6ddeebf..0d68ba4 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -888,7 +888,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type=
, unsigned vece,
         tcg_out_vex_modrm(s, avx2_dup_insn[vece] + vex_l, r, 0, a);
     } else {
         switch (vece) {
-        case MO_8:
+        case MO_UB:
             /* ??? With zero in a register, use PSHUFB.  */
             tcg_out_vex_modrm(s, OPC_PUNPCKLBW, r, a, a);
             a =3D r;
@@ -932,7 +932,7 @@ static bool tcg_out_dupm_vec(TCGContext *s, TCGType typ=
e, unsigned vece,
             tcg_out8(s, 0); /* imm8 */
             tcg_out_dup_vec(s, type, vece, r, r);
             break;
-        case MO_8:
+        case MO_UB:
             tcg_out_vex_modrm_offset(s, OPC_VPINSRB, r, r, base, offset);
             tcg_out8(s, 0); /* imm8 */
             tcg_out_dup_vec(s, type, vece, r, r);
@@ -2154,7 +2154,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
Reg datalo, TCGReg datahi,
     }

     switch (memop & MO_SIZE) {
-    case MO_8:
+    case MO_UB:
         /* In 32-bit mode, 8-bit stores can only happen from [abcd]x.
            Use the scratch register if necessary.  */
         if (TCG_TARGET_REG_BITS =3D=3D 32 && datalo >=3D 4) {
@@ -2901,7 +2901,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode o=
pc,
         tcg_debug_assert(vece !=3D MO_64);
         sub =3D 4;
     gen_shift:
-        tcg_debug_assert(vece !=3D MO_8);
+        tcg_debug_assert(vece !=3D MO_UB);
         insn =3D shift_imm_insn[vece];
         if (type =3D=3D TCG_TYPE_V256) {
             insn |=3D P_VEXL;
@@ -3273,12 +3273,12 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type=
, unsigned vece)

     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
-        /* We must expand the operation for MO_8.  */
-        return vece =3D=3D MO_8 ? -1 : 1;
+        /* We must expand the operation for MO_UB.  */
+        return vece =3D=3D MO_UB ? -1 : 1;

     case INDEX_op_sari_vec:
-        /* We must expand the operation for MO_8.  */
-        if (vece =3D=3D MO_8) {
+        /* We must expand the operation for MO_UB.  */
+        if (vece =3D=3D MO_UB) {
             return -1;
         }
         /* We can emulate this for MO_64, but it does not pay off
@@ -3301,8 +3301,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, =
unsigned vece)
         return have_avx2 && vece =3D=3D MO_32;

     case INDEX_op_mul_vec:
-        if (vece =3D=3D MO_8) {
-            /* We can expand the operation for MO_8.  */
+        if (vece =3D=3D MO_UB) {
+            /* We can expand the operation for MO_UB.  */
             return -1;
         }
         if (vece =3D=3D MO_64) {
@@ -3332,7 +3332,7 @@ static void expand_vec_shi(TCGType type, unsigned vec=
e, bool shr,
 {
     TCGv_vec t1, t2;

-    tcg_debug_assert(vece =3D=3D MO_8);
+    tcg_debug_assert(vece =3D=3D MO_UB);

     t1 =3D tcg_temp_new_vec(type);
     t2 =3D tcg_temp_new_vec(type);
@@ -3346,9 +3346,9 @@ static void expand_vec_shi(TCGType type, unsigned vec=
e, bool shr,
        (3) Step 2 leaves high half zero such that PACKUSWB
            (pack with unsigned saturation) does not modify
            the quantity.  */
-    vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_8,
+    vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_UB,
               tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(v1));
-    vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_8,
+    vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_UB,
               tcgv_vec_arg(t2), tcgv_vec_arg(v1), tcgv_vec_arg(v1));

     if (shr) {
@@ -3361,7 +3361,7 @@ static void expand_vec_shi(TCGType type, unsigned vec=
e, bool shr,
         tcg_gen_shri_vec(MO_16, t2, t2, 8);
     }

-    vec_gen_3(INDEX_op_x86_packus_vec, type, MO_8,
+    vec_gen_3(INDEX_op_x86_packus_vec, type, MO_UB,
               tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t2));
     tcg_temp_free_vec(t1);
     tcg_temp_free_vec(t2);
@@ -3373,17 +3373,17 @@ static void expand_vec_sari(TCGType type, unsigned =
vece,
     TCGv_vec t1, t2;

     switch (vece) {
-    case MO_8:
+    case MO_UB:
         /* Unpack to W, shift, and repack, as in expand_vec_shi.  */
         t1 =3D tcg_temp_new_vec(type);
         t2 =3D tcg_temp_new_vec(type);
-        vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_UB,
                   tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(v1));
-        vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_UB,
                   tcgv_vec_arg(t2), tcgv_vec_arg(v1), tcgv_vec_arg(v1));
         tcg_gen_sari_vec(MO_16, t1, t1, imm + 8);
         tcg_gen_sari_vec(MO_16, t2, t2, imm + 8);
-        vec_gen_3(INDEX_op_x86_packss_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_packss_vec, type, MO_UB,
                   tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t2));
         tcg_temp_free_vec(t1);
         tcg_temp_free_vec(t2);
@@ -3425,7 +3425,7 @@ static void expand_vec_mul(TCGType type, unsigned vec=
e,
 {
     TCGv_vec t1, t2, t3, t4;

-    tcg_debug_assert(vece =3D=3D MO_8);
+    tcg_debug_assert(vece =3D=3D MO_UB);

     /*
      * Unpack v1 bytes to words, 0 | x.
@@ -3442,13 +3442,13 @@ static void expand_vec_mul(TCGType type, unsigned v=
ece,
         t1 =3D tcg_temp_new_vec(TCG_TYPE_V128);
         t2 =3D tcg_temp_new_vec(TCG_TYPE_V128);
         tcg_gen_dup16i_vec(t2, 0);
-        vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_TYPE_V128, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_TYPE_V128, MO_UB,
                   tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t2));
-        vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_TYPE_V128, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_TYPE_V128, MO_UB,
                   tcgv_vec_arg(t2), tcgv_vec_arg(t2), tcgv_vec_arg(v2));
         tcg_gen_mul_vec(MO_16, t1, t1, t2);
         tcg_gen_shri_vec(MO_16, t1, t1, 8);
-        vec_gen_3(INDEX_op_x86_packus_vec, TCG_TYPE_V128, MO_8,
+        vec_gen_3(INDEX_op_x86_packus_vec, TCG_TYPE_V128, MO_UB,
                   tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t1));
         tcg_temp_free_vec(t1);
         tcg_temp_free_vec(t2);
@@ -3461,19 +3461,19 @@ static void expand_vec_mul(TCGType type, unsigned v=
ece,
         t3 =3D tcg_temp_new_vec(type);
         t4 =3D tcg_temp_new_vec(type);
         tcg_gen_dup16i_vec(t4, 0);
-        vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_UB,
                   tcgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t4));
-        vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_UB,
                   tcgv_vec_arg(t2), tcgv_vec_arg(t4), tcgv_vec_arg(v2));
-        vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_UB,
                   tcgv_vec_arg(t3), tcgv_vec_arg(v1), tcgv_vec_arg(t4));
-        vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_UB,
                   tcgv_vec_arg(t4), tcgv_vec_arg(t4), tcgv_vec_arg(v2));
         tcg_gen_mul_vec(MO_16, t1, t1, t2);
         tcg_gen_mul_vec(MO_16, t3, t3, t4);
         tcg_gen_shri_vec(MO_16, t1, t1, 8);
         tcg_gen_shri_vec(MO_16, t3, t3, 8);
-        vec_gen_3(INDEX_op_x86_packus_vec, type, MO_8,
+        vec_gen_3(INDEX_op_x86_packus_vec, type, MO_UB,
                   tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t3));
         tcg_temp_free_vec(t1);
         tcg_temp_free_vec(t2);
diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
index 41bff32..c6d13ea 100644
--- a/tcg/mips/tcg-target.inc.c
+++ b/tcg/mips/tcg-target.inc.c
@@ -1380,7 +1380,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
         i =3D tcg_out_call_iarg_reg(s, i, l->addrlo_reg);
     }
     switch (s_bits) {
-    case MO_8:
+    case MO_UB:
         i =3D tcg_out_call_iarg_reg8(s, i, l->datalo_reg);
         break;
     case MO_16:
@@ -1566,7 +1566,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
Reg lo, TCGReg hi,
     }

     switch (opc & (MO_SIZE | MO_BSWAP)) {
-    case MO_8:
+    case MO_UB:
         tcg_out_opc_imm(s, OPC_SB, lo, base, 0);
         break;

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 3e76bf5..9c60c0f 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1101,7 +1101,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
     tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
     tcg_out_mov(s, TCG_TYPE_PTR, a2, l->datalo_reg);
     switch (s_bits) {
-    case MO_8:
+    case MO_UB:
         tcg_out_ext8u(s, a2, a2);
         break;
     case MO_16:
@@ -1216,7 +1216,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCG=
Reg lo, TCGReg hi,
     g_assert(!bswap);

     switch (opc & (MO_SSIZE)) {
-    case MO_8:
+    case MO_UB:
         tcg_out_opc_store(s, OPC_SB, base, lo, 0);
         break;
     case MO_16:
diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
index 10b1cea..479ee2e 100644
--- a/tcg/sparc/tcg-target.inc.c
+++ b/tcg/sparc/tcg-target.inc.c
@@ -882,7 +882,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op=
)
      * required by the MO_* value op; do nothing for 64 bit.
      */
     switch (op & MO_SIZE) {
-    case MO_8:
+    case MO_UB:
         tcg_out_arithi(s, r, r, 0xff, ARITH_AND);
         break;
     case MO_16:
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 17679b6..9658c36 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -306,7 +306,7 @@ static void expand_clr(uint32_t dofs, uint32_t maxsz);
 uint64_t (dup_const)(unsigned vece, uint64_t c)
 {
     switch (vece) {
-    case MO_8:
+    case MO_UB:
         return 0x0101010101010101ull * (uint8_t)c;
     case MO_16:
         return 0x0001000100010001ull * (uint16_t)c;
@@ -323,7 +323,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c)
 static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
 {
     switch (vece) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_ext8u_i32(out, in);
         tcg_gen_muli_i32(out, out, 0x01010101);
         break;
@@ -341,7 +341,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i32 out, TC=
Gv_i32 in)
 static void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in)
 {
     switch (vece) {
-    case MO_8:
+    case MO_UB:
         tcg_gen_ext8u_i64(out, in);
         tcg_gen_muli_i64(out, out, 0x0101010101010101ull);
         break;
@@ -556,7 +556,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32=
_t oprsz,
             t_32 =3D tcg_temp_new_i32();
             if (in_64) {
                 tcg_gen_extrl_i64_i32(t_32, in_64);
-            } else if (vece =3D=3D MO_8) {
+            } else if (vece =3D=3D MO_UB) {
                 tcg_gen_movi_i32(t_32, in_c & 0xff);
             } else if (vece =3D=3D MO_16) {
                 tcg_gen_movi_i32(t_32, in_c & 0xffff);
@@ -581,7 +581,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32=
_t oprsz,
 /* Likewise, but with zero.  */
 static void expand_clr(uint32_t dofs, uint32_t maxsz)
 {
-    do_dup(MO_8, dofs, maxsz, maxsz, NULL, NULL, 0);
+    do_dup(MO_UB, dofs, maxsz, maxsz, NULL, NULL, 0);
 }

 /* Expand OPSZ bytes worth of two-operand operations using i32 elements.  =
*/
@@ -1456,7 +1456,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dof=
s, uint32_t aofs,
         } else if (vece <=3D MO_32) {
             TCGv_i32 in =3D tcg_temp_new_i32();
             switch (vece) {
-            case MO_8:
+            case MO_UB:
                 tcg_gen_ld8u_i32(in, cpu_env, aofs);
                 break;
             case MO_16:
@@ -1533,7 +1533,7 @@ void tcg_gen_gvec_dup8i(uint32_t dofs, uint32_t oprsz=
,
                          uint32_t maxsz, uint8_t x)
 {
     check_size_align(oprsz, maxsz, dofs);
-    do_dup(MO_8, dofs, oprsz, maxsz, NULL, NULL, x);
+    do_dup(MO_UB, dofs, oprsz, maxsz, NULL, NULL, x);
 }

 void tcg_gen_gvec_not(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -1572,7 +1572,7 @@ static void gen_addv_mask(TCGv_i64 d, TCGv_i64 a, TCG=
v_i64 b, TCGv_i64 m)

 void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_8, 0x80));
+    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UB, 0x80));
     gen_addv_mask(d, a, b, m);
     tcg_temp_free_i64(m);
 }
@@ -1608,7 +1608,7 @@ void tcg_gen_gvec_add(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_add8,
           .opt_opc =3D vecop_list_add,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_add16_i64,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_add16,
@@ -1639,7 +1639,7 @@ void tcg_gen_gvec_adds(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_adds8,
           .opt_opc =3D vecop_list_add,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_add16_i64,
           .fniv =3D tcg_gen_add_vec,
           .fno =3D gen_helper_gvec_adds16,
@@ -1680,7 +1680,7 @@ void tcg_gen_gvec_subs(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_subs8,
           .opt_opc =3D vecop_list_sub,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_sub16_i64,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_subs16,
@@ -1725,7 +1725,7 @@ static void gen_subv_mask(TCGv_i64 d, TCGv_i64 a, TCG=
v_i64 b, TCGv_i64 m)

 void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_8, 0x80));
+    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UB, 0x80));
     gen_subv_mask(d, a, b, m);
     tcg_temp_free_i64(m);
 }
@@ -1759,7 +1759,7 @@ void tcg_gen_gvec_sub(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_sub8,
           .opt_opc =3D vecop_list_sub,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_sub16_i64,
           .fniv =3D tcg_gen_sub_vec,
           .fno =3D gen_helper_gvec_sub16,
@@ -1791,7 +1791,7 @@ void tcg_gen_gvec_mul(unsigned vece, uint32_t dofs, u=
int32_t aofs,
         { .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_mul8,
           .opt_opc =3D vecop_list_mul,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_mul16,
           .opt_opc =3D vecop_list_mul,
@@ -1820,7 +1820,7 @@ void tcg_gen_gvec_muls(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_muls8,
           .opt_opc =3D vecop_list_mul,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_mul_vec,
           .fno =3D gen_helper_gvec_muls16,
           .opt_opc =3D vecop_list_mul,
@@ -1858,7 +1858,7 @@ void tcg_gen_gvec_ssadd(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_ssadd_vec,
           .fno =3D gen_helper_gvec_ssadd8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_ssadd_vec,
           .fno =3D gen_helper_gvec_ssadd16,
           .opt_opc =3D vecop_list,
@@ -1884,7 +1884,7 @@ void tcg_gen_gvec_sssub(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_sssub_vec,
           .fno =3D gen_helper_gvec_sssub8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_sssub_vec,
           .fno =3D gen_helper_gvec_sssub16,
           .opt_opc =3D vecop_list,
@@ -1926,7 +1926,7 @@ void tcg_gen_gvec_usadd(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_usadd_vec,
           .fno =3D gen_helper_gvec_usadd8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_usadd_vec,
           .fno =3D gen_helper_gvec_usadd16,
           .opt_opc =3D vecop_list,
@@ -1970,7 +1970,7 @@ void tcg_gen_gvec_ussub(unsigned vece, uint32_t dofs,=
 uint32_t aofs,
         { .fniv =3D tcg_gen_ussub_vec,
           .fno =3D gen_helper_gvec_ussub8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_ussub_vec,
           .fno =3D gen_helper_gvec_ussub16,
           .opt_opc =3D vecop_list,
@@ -1998,7 +1998,7 @@ void tcg_gen_gvec_smin(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_smin_vec,
           .fno =3D gen_helper_gvec_smin8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_smin_vec,
           .fno =3D gen_helper_gvec_smin16,
           .opt_opc =3D vecop_list,
@@ -2026,7 +2026,7 @@ void tcg_gen_gvec_umin(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_umin_vec,
           .fno =3D gen_helper_gvec_umin8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_umin_vec,
           .fno =3D gen_helper_gvec_umin16,
           .opt_opc =3D vecop_list,
@@ -2054,7 +2054,7 @@ void tcg_gen_gvec_smax(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_smax_vec,
           .fno =3D gen_helper_gvec_smax8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_smax_vec,
           .fno =3D gen_helper_gvec_smax16,
           .opt_opc =3D vecop_list,
@@ -2082,7 +2082,7 @@ void tcg_gen_gvec_umax(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_umax_vec,
           .fno =3D gen_helper_gvec_umax8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_umax_vec,
           .fno =3D gen_helper_gvec_umax16,
           .opt_opc =3D vecop_list,
@@ -2120,7 +2120,7 @@ static void gen_negv_mask(TCGv_i64 d, TCGv_i64 b, TCG=
v_i64 m)

 void tcg_gen_vec_neg8_i64(TCGv_i64 d, TCGv_i64 b)
 {
-    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_8, 0x80));
+    TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UB, 0x80));
     gen_negv_mask(d, b, m);
     tcg_temp_free_i64(m);
 }
@@ -2155,7 +2155,7 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_neg_vec,
           .fno =3D gen_helper_gvec_neg8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_neg16_i64,
           .fniv =3D tcg_gen_neg_vec,
           .fno =3D gen_helper_gvec_neg16,
@@ -2201,7 +2201,7 @@ static void gen_absv_mask(TCGv_i64 d, TCGv_i64 b, uns=
igned vece)

 static void tcg_gen_vec_abs8_i64(TCGv_i64 d, TCGv_i64 b)
 {
-    gen_absv_mask(d, b, MO_8);
+    gen_absv_mask(d, b, MO_UB);
 }

 static void tcg_gen_vec_abs16_i64(TCGv_i64 d, TCGv_i64 b)
@@ -2218,7 +2218,7 @@ void tcg_gen_gvec_abs(unsigned vece, uint32_t dofs, u=
int32_t aofs,
           .fniv =3D tcg_gen_abs_vec,
           .fno =3D gen_helper_gvec_abs8,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_abs16_i64,
           .fniv =3D tcg_gen_abs_vec,
           .fno =3D gen_helper_gvec_abs16,
@@ -2454,7 +2454,7 @@ void tcg_gen_gvec_ori(unsigned vece, uint32_t dofs, u=
int32_t aofs,

 void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
-    uint64_t mask =3D dup_const(MO_8, 0xff << c);
+    uint64_t mask =3D dup_const(MO_UB, 0xff << c);
     tcg_gen_shli_i64(d, a, c);
     tcg_gen_andi_i64(d, d, mask);
 }
@@ -2475,7 +2475,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shli_vec,
           .fno =3D gen_helper_gvec_shl8i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_shl16i_i64,
           .fniv =3D tcg_gen_shli_vec,
           .fno =3D gen_helper_gvec_shl16i,
@@ -2505,7 +2505,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, =
uint32_t aofs,

 void tcg_gen_vec_shr8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
-    uint64_t mask =3D dup_const(MO_8, 0xff >> c);
+    uint64_t mask =3D dup_const(MO_UB, 0xff >> c);
     tcg_gen_shri_i64(d, a, c);
     tcg_gen_andi_i64(d, d, mask);
 }
@@ -2526,7 +2526,7 @@ void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_shri_vec,
           .fno =3D gen_helper_gvec_shr8i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_shr16i_i64,
           .fniv =3D tcg_gen_shri_vec,
           .fno =3D gen_helper_gvec_shr16i,
@@ -2556,8 +2556,8 @@ void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, =
uint32_t aofs,

 void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
-    uint64_t s_mask =3D dup_const(MO_8, 0x80 >> c);
-    uint64_t c_mask =3D dup_const(MO_8, 0xff >> c);
+    uint64_t s_mask =3D dup_const(MO_UB, 0x80 >> c);
+    uint64_t c_mask =3D dup_const(MO_UB, 0xff >> c);
     TCGv_i64 s =3D tcg_temp_new_i64();

     tcg_gen_shri_i64(d, a, c);
@@ -2591,7 +2591,7 @@ void tcg_gen_gvec_sari(unsigned vece, uint32_t dofs, =
uint32_t aofs,
           .fniv =3D tcg_gen_sari_vec,
           .fno =3D gen_helper_gvec_sar8i,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fni8 =3D tcg_gen_vec_sar16i_i64,
           .fniv =3D tcg_gen_sari_vec,
           .fno =3D gen_helper_gvec_sar16i,
@@ -2880,7 +2880,7 @@ void tcg_gen_gvec_shlv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_shlv_mod_vec,
           .fno =3D gen_helper_gvec_shl8v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_shlv_mod_vec,
           .fno =3D gen_helper_gvec_shl16v,
           .opt_opc =3D vecop_list,
@@ -2943,7 +2943,7 @@ void tcg_gen_gvec_shrv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_shrv_mod_vec,
           .fno =3D gen_helper_gvec_shr8v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_shrv_mod_vec,
           .fno =3D gen_helper_gvec_shr16v,
           .opt_opc =3D vecop_list,
@@ -3006,7 +3006,7 @@ void tcg_gen_gvec_sarv(unsigned vece, uint32_t dofs, =
uint32_t aofs,
         { .fniv =3D tcg_gen_sarv_mod_vec,
           .fno =3D gen_helper_gvec_sar8v,
           .opt_opc =3D vecop_list,
-          .vece =3D MO_8 },
+          .vece =3D MO_UB },
         { .fniv =3D tcg_gen_sarv_mod_vec,
           .fno =3D gen_helper_gvec_sar16v,
           .opt_opc =3D vecop_list,
@@ -3129,7 +3129,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, ui=
nt32_t dofs,
     check_overlap_3(dofs, aofs, bofs, maxsz);

     if (cond =3D=3D TCG_COND_NEVER || cond =3D=3D TCG_COND_ALWAYS) {
-        do_dup(MO_8, dofs, oprsz, maxsz,
+        do_dup(MO_UB, dofs, oprsz, maxsz,
                NULL, NULL, -(cond =3D=3D TCG_COND_ALWAYS));
         return;
     }
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 6714991..d7ffc9e 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -275,7 +275,7 @@ void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)

 void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_8, a));
+    do_dupi_vec(r, MO_REG, dup_const(MO_UB, a));
 }

 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
@@ -752,13 +752,13 @@ void tcg_gen_bitsel_vec(unsigned vece, TCGv_vec r, TC=
Gv_vec a,
     tcg_debug_assert(ct->base_type >=3D type);

     if (TCG_TARGET_HAS_bitsel_vec) {
-        vec_gen_4(INDEX_op_bitsel_vec, type, MO_8,
+        vec_gen_4(INDEX_op_bitsel_vec, type, MO_UB,
                   temp_arg(rt), temp_arg(at), temp_arg(bt), temp_arg(ct));
     } else {
         TCGv_vec t =3D tcg_temp_new_vec(type);
-        tcg_gen_and_vec(MO_8, t, a, b);
-        tcg_gen_andc_vec(MO_8, r, c, a);
-        tcg_gen_or_vec(MO_8, r, r, t);
+        tcg_gen_and_vec(MO_UB, t, a, b);
+        tcg_gen_andc_vec(MO_UB, r, c, a);
+        tcg_gen_or_vec(MO_UB, r, r, t);
         tcg_temp_free_vec(t);
     }
 }
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 587d092..61eda33 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2720,7 +2720,7 @@ static inline TCGMemOp tcg_canonicalize_memop(TCGMemO=
p op, bool is64, bool st)
     (void)get_alignment_bits(op);

     switch (op & MO_SIZE) {
-    case MO_8:
+    case MO_UB:
         op &=3D ~MO_BSWAP;
         break;
     case MO_16:
@@ -3024,7 +3024,7 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, TCGv_env,=
 TCGv, TCGv_i64);
 #endif

 static void * const table_cmpxchg[16] =3D {
-    [MO_8] =3D gen_helper_atomic_cmpxchgb,
+    [MO_UB] =3D gen_helper_atomic_cmpxchgb,
     [MO_16 | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,
     [MO_16 | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,
     [MO_32 | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,
@@ -3248,7 +3248,7 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr,=
 TCGv_i64 val,

 #define GEN_ATOMIC_HELPER(NAME, OP, NEW)                                \
 static void * const table_##NAME[16] =3D {                                =
\
-    [MO_8] =3D gen_helper_atomic_##NAME##b,                               =
\
+    [MO_UB] =3D gen_helper_atomic_##NAME##b,                              =
 \
     [MO_16 | MO_LE] =3D gen_helper_atomic_##NAME##w_le,                   =
\
     [MO_16 | MO_BE] =3D gen_helper_atomic_##NAME##w_be,                   =
\
     [MO_32 | MO_LE] =3D gen_helper_atomic_##NAME##l_le,                   =
\
diff --git a/tcg/tcg.h b/tcg/tcg.h
index b411e17..5636d6b 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -1302,7 +1302,7 @@ uint64_t dup_const(unsigned vece, uint64_t c);

 #define dup_const(VECE, C)                                         \
     (__builtin_constant_p(VECE)                                    \
-     ? (  (VECE) =3D=3D MO_8  ? 0x0101010101010101ull * (uint8_t)(C)   \
+     ?   ((VECE) =3D=3D MO_UB ? 0x0101010101010101ull * (uint8_t)(C)   \
         : (VECE) =3D=3D MO_16 ? 0x0001000100010001ull * (uint16_t)(C)  \
         : (VECE) =3D=3D MO_32 ? 0x0000000100000001ull * (uint32_t)(C)  \
         : dup_const(VECE, C))                                      \
--
1.8.3.1




--_000_156380988808957547btcom_
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
<div><span style=3D"font-size: 12pt;">Preparation for splitting MO_8 out fr=
om TCGMemOp into new accelerator</span><br>
</div>
<div>independent MemOp.</div>
<div><br>
</div>
<div>As MO_8 will be a value of MemOp, existing TCGMemOp comparisons and</d=
iv>
<div>coercions will trigger -Wenum-compare and -Wenum-conversion.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;target/arm/sve_helper.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp;4 &#43;-</div>
<div>&nbsp;target/arm/translate-a64.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 1=
4 &#43;&#43;&#43;----</div>
<div>&nbsp;target/arm/translate-sve.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp;4 &#43;-</div>
<div>&nbsp;target/arm/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| 38 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------</div>
<div>&nbsp;target/i386/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | 72 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;------------------</div>
<div>&nbsp;target/mips/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; | &nbsp;4 &#43;-</div>
<div>&nbsp;target/ppc/translate/vmx-impl.inc.c | 28 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;-------</div>
<div>&nbsp;target/s390x/translate.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp;2 &#43;-</div>
<div>&nbsp;target/s390x/translate_vx.inc.c &nbsp; &nbsp; | &nbsp;4 &#43;-</=
div>
<div>&nbsp;target/s390x/vec.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| &nbsp;4 &#43;-</div>
<div>&nbsp;tcg/aarch64/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp;| 16 &#4=
3;&#43;&#43;&#43;----</div>
<div>&nbsp;tcg/arm/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| &nbsp;6 &#43;--</div>
<div>&nbsp;tcg/i386/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 5=
4 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------=
-----</div>
<div>&nbsp;tcg/mips/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &=
nbsp;4 &#43;-</div>
<div>&nbsp;tcg/riscv/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp;4 &#43;-</div>
<div>&nbsp;tcg/sparc/tcg-target.inc.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &=
nbsp;2 &#43;-</div>
<div>&nbsp;tcg/tcg-op-gvec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; | 76 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-------------------</div>
<div>&nbsp;tcg/tcg-op-vec.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| 10 &#43;&#43;---</div>
<div>&nbsp;tcg/tcg-op.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;6 &#43;--</div>
<div>&nbsp;tcg/tcg.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 &#43;-</div>
<div>&nbsp;20 files changed, 177 insertions(&#43;), 177 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c</div>
<div>index fc0c175..4c7e11f 100644</div>
<div>--- a/target/arm/sve_helper.c</div>
<div>&#43;&#43;&#43; b/target/arm/sve_helper.c</div>
<div>@@ -1531,7 &#43;1531,7 @@ void HELPER(sve_cpy_m_b)(void *vd, void *vn,=
 void *vg,</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t *d =3D vd, *n =3D vn;</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *pg =3D vg;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;mm =3D dup_const(MO_8, mm);</div>
<div>&#43; &nbsp; &nbsp;mm =3D dup_const(MO_UB, mm);</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; opr_sz; i &#43;=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint64_t nn =3D n[i];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint64_t pp =3D expand_pred_b(pg[H1(=
i)]);</div>
<div>@@ -1588,7 &#43;1588,7 @@ void HELPER(sve_cpy_z_b)(void *vd, void *vg,=
 uint64_t val, uint32_t desc)</div>
<div>&nbsp; &nbsp; &nbsp;uint64_t *d =3D vd;</div>
<div>&nbsp; &nbsp; &nbsp;uint8_t *pg =3D vg;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;val =3D dup_const(MO_8, val);</div>
<div>&#43; &nbsp; &nbsp;val =3D dup_const(MO_UB, val);</div>
<div>&nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; opr_sz; i &#43;=3D 1) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d[i] =3D val &amp; expand_pred_b(pg[=
H1(i)]);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c</=
div>
<div>index d323147..f840b43 100644</div>
<div>--- a/target/arm/translate-a64.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-a64.c</div>
<div>@@ -993,7 &#43;993,7 @@ static void read_vec_element(DisasContext *s, =
TCGv_i64 tcg_dest, int srcidx,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, srcidx, element=
, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8u_i64(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1002,7 &#43;1002,7 @@ static void read_vec_element(DisasContext *s=
, TCGv_i64 tcg_dest, int srcidx,</div>
<div>&nbsp; &nbsp; &nbsp;case MO_32:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld32u_i64(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_8|MO_SIGN:</div>
<div>&#43; &nbsp; &nbsp;case MO_SB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8s_i64(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16|MO_SIGN:</div>
<div>@@ -1025,13 &#43;1025,13 @@ static void read_vec_element_i32(DisasCont=
ext *s, TCGv_i32 tcg_dest, int srcidx,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, srcidx, element=
, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8u_i32(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld16u_i32(tcg_dest, cpu_env,=
 vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp;case MO_8|MO_SIGN:</div>
<div>&#43; &nbsp; &nbsp;case MO_SB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ld8s_i32(tcg_dest, cpu_env, =
vect_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16|MO_SIGN:</div>
<div>@@ -1052,7 &#43;1052,7 @@ static void write_vec_element(DisasContext *=
s, TCGv_i64 tcg_src, int destidx,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, destidx, elemen=
t, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i64(tcg_src, cpu_env, ve=
ct_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1074,7 &#43;1074,7 @@ static void write_vec_element_i32(DisasConte=
xt *s, TCGv_i32 tcg_src,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;int vect_off =3D vec_reg_offset(s, destidx, elemen=
t, memop &amp; MO_SIZE);</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i32(tcg_src, cpu_env, ve=
ct_off);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -12885,7 &#43;12885,7 @@ static void disas_simd_indexed(DisasContex=
t *s, uint32_t insn)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;default: /* integer */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unallocated_encoding(s=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c</=
div>
<div>index fa068b0..ec5fb11 100644</div>
<div>--- a/target/arm/translate-sve.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate-sve.c</div>
<div>@@ -1665,7 &#43;1665,7 @@ static void do_sat_addsub_vec(DisasContext *=
s, int esz, int rd, int rn,</div>
<div>&nbsp; &nbsp; &nbsp;desc =3D tcg_const_i32(simd_desc(vsz, vsz, 0));</d=
iv>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (esz) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t32 =3D tcg_temp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_extrl_i64_i32(t32, val);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (d) {</div>
<div>@@ -3308,7 &#43;3308,7 @@ static bool trans_SUBR_zzi(DisasContext *s, =
arg_rri_esz *a)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_sve_subri=
_b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.scalar_first =3D true },</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_sub16_i64,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>diff --git a/target/arm/translate.c b/target/arm/translate.c</div>
<div>index 7853462..39266cf 100644</div>
<div>--- a/target/arm/translate.c</div>
<div>&#43;&#43;&#43; b/target/arm/translate.c</div>
<div>@@ -1474,7 &#43;1474,7 @@ static void neon_store_element(int reg, int =
ele, TCGMemOp size, TCGv_i32 var)</div>
<div>&nbsp; &nbsp; &nbsp;long offset =3D neon_element_offset(reg, ele, size=
);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i32(var, cpu_env, offset=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1493,7 &#43;1493,7 @@ static void neon_store_element64(int reg, in=
t ele, TCGMemOp size, TCGv_i64 var)</div>
<div>&nbsp; &nbsp; &nbsp;long offset =3D neon_element_offset(reg, ele, size=
);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_st8_i64(var, cpu_env, offset=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -4262,7 &#43;4262,7 @@ const GVecGen2i ssra_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_ssra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_ssra,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_ssra16_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_ssra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4320,7 &#43;4320,7 @@ const GVecGen2i usra_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_usra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_usra,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8, },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB, },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_usra16_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_usra_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4341,7 &#43;4341,7 @@ const GVecGen2i usra_op[4] =3D {</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_shr8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shi=
ft)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_8, 0xff &gt;&gt; shift);=
</div>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UB, 0xff &gt;&gt; sh=
ift);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 t =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shri_i64(t, a, shift);</div>
<div>@@ -4400,7 &#43;4400,7 @@ const GVecGen2i sri_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shr_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sri,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_shr16_ins_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shr_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4421,7 &#43;4421,7 @@ const GVecGen2i sri_op[4] =3D {</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_shl8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shi=
ft)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_8, 0xff &lt;&lt; shift);=
</div>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UB, 0xff &lt;&lt; sh=
ift);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 t =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shli_i64(t, a, shift);</div>
<div>@@ -4478,7 &#43;4478,7 @@ const GVecGen2i sli_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shl_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sli,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni8 =3D gen_shl16_ins_i64,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_shl_ins_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4574,7 &#43;4574,7 @@ const GVecGen3 mla_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mla_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mla,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_mla16_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mla_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4598,7 &#43;4598,7 @@ const GVecGen3 mls_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mls_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mls,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_mls16_i32,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_mls_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.load_dest =3D true,</div>
<div>@@ -4645,7 &#43;4645,7 @@ const GVecGen3 cmtst_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_helper_neon_tst_u8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_cmtst_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_cmtst,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fni4 =3D gen_helper_neon_tst_u16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D gen_cmtst_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_cmtst,</div>
<div>@@ -4681,7 &#43;4681,7 @@ const GVecGen4 uqadd_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqadd_b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqadd,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_uqadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqadd_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>@@ -4719,7 &#43;4719,7 @@ const GVecGen4 sqadd_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqadd_b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqadd,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_sqadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqadd_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqadd,</div>
<div>@@ -4757,7 &#43;4757,7 @@ const GVecGen4 uqsub_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqsub_b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqsub,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_uqsub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_uqsub_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_uqsub,</div>
<div>@@ -4795,7 &#43;4795,7 @@ const GVecGen4 sqsub_op[4] =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqsub_b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqsub,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.write_aofs =3D true,</div>
<div>- &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp;{ .fniv =3D gen_sqsub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sqsub_h,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sqsub,</div>
<div>@@ -4972,15 &#43;4972,15 @@ static int disas_neon_data_insn(DisasConte=
xt *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vec_size, vec_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 5: /* VBSL */</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_=
bitsel(MO_8, rd_ofs, rd_ofs, rn_ofs, rm_ofs,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_g=
vec_bitsel(MO_UB, rd_ofs, rd_ofs, rn_ofs, rm_ofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_size, vec=
_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 6: /* VBIT */</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_=
bitsel(MO_8, rd_ofs, rm_ofs, rn_ofs, rd_ofs,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_g=
vec_bitsel(MO_UB, rd_ofs, rm_ofs, rn_ofs, rd_ofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_size, vec=
_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 7: /* VBIF */</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_gvec_=
bitsel(MO_8, rd_ofs, rm_ofs, rd_ofs, rn_ofs,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_g=
vec_bitsel(MO_UB, rd_ofs, rm_ofs, rd_ofs, rn_ofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vec_size, vec=
_size);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>@@ -6873,7 &#43;6873,7 @@ static int disas_neon_data_insn(DisasContext=
 *s, uint32_t insn)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;return 1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (insn=
 &amp; (1 &lt;&lt; 16)) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;size =3D MO_8;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;size =3D MO_UB;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;element =3D (insn &gt;&gt; 17) &amp; 7;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else i=
f (insn &amp; (1 &lt;&lt; 17)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;size =3D MO_16;</div>
<div>diff --git a/target/i386/translate.c b/target/i386/translate.c</div>
<div>index 03150a8..0e45300 100644</div>
<div>--- a/target/i386/translate.c</div>
<div>&#43;&#43;&#43; b/target/i386/translate.c</div>
<div>@@ -349,20 &#43;349,20 @@ static inline TCGMemOp mo_64_32(TCGMemOp ot)=
</div>
<div>&nbsp; &nbsp; byte vs word opcodes. &nbsp;*/</div>
<div>&nbsp;static inline TCGMemOp mo_b_d(int b, TCGMemOp ot)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return b &amp; 1 ? ot : MO_8;</div>
<div>&#43; &nbsp; &nbsp;return b &amp; 1 ? ot : MO_UB;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Select size 8 if lsb of B is clear, else OT capped at 32.</di=
v>
<div>&nbsp; &nbsp; Used for decoding operand size of port opcodes. &nbsp;*/=
</div>
<div>&nbsp;static inline TCGMemOp mo_b_d32(int b, TCGMemOp ot)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;return b &amp; 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_32) : =
MO_8;</div>
<div>&#43; &nbsp; &nbsp;return b &amp; 1 ? (ot =3D=3D MO_16 ? MO_16 : MO_32=
) : MO_UB;</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void gen_op_mov_reg_v(DisasContext *s, TCGMemOp ot, int r=
eg, TCGv t0)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch(ot) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!byte_reg_is_xH(s, reg)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_deposit_tl(cpu=
_regs[reg], cpu_regs[reg], t0, 0, 8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -390,7 &#43;390,7 @@ static void gen_op_mov_reg_v(DisasContext *s, =
TCGMemOp ot, int reg, TCGv t0)</div>
<div>&nbsp;static inline</div>
<div>&nbsp;void gen_op_mov_v_reg(DisasContext *s, TCGMemOp ot, TCGv t0, int=
 reg)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;if (ot =3D=3D MO_8 &amp;&amp; byte_reg_is_xH(s, reg)) {=
</div>
<div>&#43; &nbsp; &nbsp;if (ot =3D=3D MO_UB &amp;&amp; byte_reg_is_xH(s, re=
g)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_extract_tl(t0, cpu_regs[reg =
- 4], 8, 8);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mov_tl(t0, cpu_regs[reg]);</=
div>
<div>@@ -523,7 &#43;523,7 @@ static inline void gen_op_movl_T0_Dshift(Disas=
Context *s, TCGMemOp ot)</div>
<div>&nbsp;static TCGv gen_ext_tl(TCGv dst, TCGv src, TCGMemOp size, bool s=
ign)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (size) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (sign) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8s_tl(dst, =
src);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>@@ -580,7 &#43;580,7 @@ void gen_op_jz_ecx(DisasContext *s, TCGMemOp s=
ize, TCGLabel *label1)</div>
<div>&nbsp;static void gen_helper_in_func(TCGMemOp ot, TCGv v, TCGv_i32 n)<=
/div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_inb(v, cpu_env, n);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -597,7 &#43;597,7 @@ static void gen_helper_in_func(TCGMemOp ot, TC=
Gv v, TCGv_i32 n)</div>
<div>&nbsp;static void gen_helper_out_func(TCGMemOp ot, TCGv_i32 v, TCGv_i3=
2 n)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_outb(cpu_env, v, n);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -619,7 &#43;619,7 @@ static void gen_check_io(DisasContext *s, TCGM=
emOp ot, target_ulong cur_eip,</div>
<div>&nbsp; &nbsp; &nbsp;if (s-&gt;pe &amp;&amp; (s-&gt;cpl &gt; s-&gt;iopl=
 || s-&gt;vm86)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_trunc_tl_i32(s-&gt;tmp2_i32,=
 s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_check_iob(c=
pu_env, s-&gt;tmp2_i32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1557,7 &#43;1557,7 @@ static void gen_rot_rm_T1(DisasContext *s, T=
CGMemOp ot, int op1, int is_right)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_andi_tl(s-&gt;T1, s-&gt;T1, mask);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Replicate the 8-bit input so that=
 a 32-bit rotate works. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8u_tl(s-&gt;T0, s-&gt;T0)=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_tl(s-&gt;T0, s-&gt;T0, =
0x01010101);</div>
<div>@@ -1661,7 &#43;1661,7 @@ static void gen_rot_rm_im(DisasContext *s, T=
CGMemOp ot, int op1, int op2,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
rotli_tl(s-&gt;T0, s-&gt;T0, op2);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mask =3D 7;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_shifts;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1719,7 &#43;1719,7 @@ static void gen_rotc_rm_T1(DisasContext *s, =
TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (is_right) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rcrb(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1738,7 &#43;1738,7 @@ static void gen_rotc_rm_T1(DisasContext *s, =
TCGMemOp ot, int op1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_helper_rclb(s-&gt;=
T0, cpu_env, s-&gt;T0, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -2184,7 &#43;2184,7 @@ static inline uint32_t insn_get(CPUX86State =
*env, DisasContext *s, TCGMemOp ot)</div>
<div>&nbsp; &nbsp; &nbsp;uint32_t ret;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (ot) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret =3D x86_ldub_code(env, s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -3784,7 &#43;3784,7 @@ static void gen_sse(CPUX86State *env, DisasC=
ontext *s, int b,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if ((b &=
amp; 0xff) =3D=3D 0xf0) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;ot =3D MO_8;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;ot =3D MO_UB;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else i=
f (s-&gt;dflag !=3D MO_64) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;ot =3D (s-&gt;prefix &amp; PREFIX_DATA ? MO_16 : MO_32);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {=
</div>
<div>@@ -4760,7 &#43;4760,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D =
insn_get(env, s, ot);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 0x83:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D (int8=
_t)insn_get(env, s, MO_8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D (=
int8_t)insn_get(env, s, MO_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;=
T1, val);</div>
<div>@@ -4866,8 &#43;4866,8 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 4: /* mul */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch(ot) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_=
reg(s, MO_8, s-&gt;T1, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_v_reg(s, MO_UB, s-&gt;T1, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext8u_tl(s-&gt;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext8u_tl(s-&gt;T1, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: =
use 32 bit mul which could be faster */</div>
<div>@@ -4915,8 &#43;4915,8 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 5: /* imul */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch(ot) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_=
reg(s, MO_8, s-&gt;T1, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mo=
v_v_reg(s, MO_UB, s-&gt;T1, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext8s_tl(s-&gt;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ext8s_tl(s-&gt;T1, s-&gt;T1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* XXX: =
use 32 bit mul which could be faster */</div>
<div>@@ -4969,7 &#43;4969,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 6: /* div */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch(ot) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_divb_AL(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -4988,7 &#43;4988,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case 7: /* idiv */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch(ot) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_help=
er_idivb_AL(cpu_env, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -5157,7 &#43;5157,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO=
_32, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_8, s=
-&gt;T0, R_EAX);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_=
UB, s-&gt;T0, R_EAX);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8s_tl(s-&gt=
;T0, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO=
_16, R_EAX, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -5205,7 &#43;5205,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D insn_get(env, =
s, ot);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;=
T1, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (b =3D=3D 0x6b) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D (int8_t)insn_get(en=
v, s, MO_8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D (int8_t)insn_ge=
t(env, s, MO_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;=
T1, val);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, ot=
, s-&gt;T1, reg);</div>
<div>@@ -5419,7 &#43;5419,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (b =3D=3D 0x68)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D insn_get(env, =
s, ot);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D (int8_t)insn_get(en=
v, s, MO_8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;val =3D (int8_t)insn_ge=
t(env, s, MO_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;T0, val);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_push_v(s, s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -5573,7 &#43;5573,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* d_ot is the size of=
 destination */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d_ot =3D dflag;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* ot is the size of s=
ource */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D (b &amp; 1) &#43; MO=
_8;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ot =3D (b &amp; 1) &#43=
; MO_UB;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* s_ot is the sign&#4=
3;size of source */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s_ot =3D b &amp; 8 ? M=
O_SIGN | ot : ot;</div>
<div>&nbsp;</div>
<div>@@ -5661,13 &#43;5661,13 @@ static target_ulong disas_insn(DisasContex=
t *s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_add_tl(s-&gt;A0, s-&gt;A0, s=
-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_extu(s-&gt;aflag, s-&gt;A0);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_add_A0_ds_seg(s);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_8, s-&gt;T0, s-&gt;A0);=
</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_8, R_EAX, s-&gt;T0=
);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_ld_v(s, MO_UB, s-&gt;T0, s-&gt=
;A0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_UB, R_EAX, s-&=
gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xb0 ... 0xb7: /* mov R, Ib */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;val =3D insn_get(env, s, MO_8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;val =3D insn_get(env, s, MO_UB);</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_movi_tl(s-&gt;T0, val);</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_8, (b &amp; 7) | R=
EX_B(s), s-&gt;T0);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_UB, (b &amp; 7=
) | REX_B(s), s-&gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xb8 ... 0xbf: /* mov R, Iv */</div>
<div>&nbsp;#ifdef TARGET_X86_64</div>
<div>@@ -6637,7 &#43;6637,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_ljmp;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xeb: /* jmp Jb */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_get(env, s, MO_8);<=
/div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_get(env, s, MO_=
UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &#43;=3D s-&gt;pc - s-&gt;cs_ba=
se;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &amp;=3D 0xffff;<=
/div>
<div>@@ -6645,7 &#43;6645,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_jmp(s, tval);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x70 ... 0x7f: /* jcc Jb */</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_get(env, s, MO_8);<=
/div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_get(env, s, MO_=
UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto do_jcc;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x180 ... 0x18f: /* jcc Jv */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag !=3D MO_16) {</div>
<div>@@ -6666,7 &#43;6666,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;case 0x190 ... 0x19f: /* setcc Gv */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;modrm =3D x86_ldub_code(env, s);</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_setcc1(s, b, s-&gt;T0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modrm, MO_8, OR_TM=
P0, 1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_ldst_modrm(env, s, modrm, MO_UB, =
OR_TMP0, 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0x140 ... 0x14f: /* cmov Gv, Ev */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!(s-&gt;cpuid_features &amp; CPU=
ID_CMOV)) {</div>
<div>@@ -6751,7 &#43;6751,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp;case 0x9e: /* sahf */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (CODE64(s) &amp;&amp; !(s-&gt;cpu=
id_ext3_features &amp; CPUID_EXT3_LAHF_LM))</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto illegal_op;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_8, s-&gt;T0, R_AH)=
;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_v_reg(s, MO_UB, s-&gt;T0, =
R_AH);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_compute_eflags(s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_andi_tl(cpu_cc_src, cpu_cc_s=
rc, CC_O);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_andi_tl(s-&gt;T0, s-&gt;T0, =
CC_S | CC_Z | CC_A | CC_P | CC_C);</div>
<div>@@ -6763,7 &#43;6763,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_compute_eflags(s);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Note: gen_compute_eflags() only g=
ives the condition codes */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ori_tl(s-&gt;T0, cpu_cc_src,=
 0x02);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_8, R_AH, s-&gt;T0)=
;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_UB, R_AH, s-&g=
t;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xf5: /* cmc */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_compute_eflags(s);</div>
<div>@@ -7137,7 &#43;7137,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto illegal_op;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_compute_eflags_c(s, s-&gt;T0);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_neg_tl(s-&gt;T0, s-&gt;T0);<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_8, R_EAX, s-&gt;T0=
);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;gen_op_mov_reg_v(s, MO_UB, R_EAX, s-&=
gt;T0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case 0xe0: /* loopnz */</div>
<div>&nbsp; &nbsp; &nbsp;case 0xe1: /* loopz */</div>
<div>@@ -7146,7 &#43;7146,7 @@ static target_ulong disas_insn(DisasContext =
*s, CPUState *cpu)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGLabel *l1, *l2, *l3=
;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_get(e=
nv, s, MO_8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval =3D (int8_t)insn_g=
et(env, s, MO_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;next_eip =3D s-&gt;pc =
- s-&gt;cs_base;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tval &#43;=3D next_eip=
;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (dflag =3D=3D MO_16=
) {</div>
<div>diff --git a/target/mips/translate.c b/target/mips/translate.c</div>
<div>index 3575eff..20a9777 100644</div>
<div>--- a/target/mips/translate.c</div>
<div>&#43;&#43;&#43; b/target/mips/translate.c</div>
<div>@@ -3684,7 &#43;3684,7 @@ static void gen_st(DisasContext *ctx, uint32=
_t opc, int rt,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mem_idx =3D MIPS_HFLAG_UM;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* fall through */</div>
<div>&nbsp; &nbsp; &nbsp;case OPC_SB:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_qemu_st_tl(t1, t0, mem_idx, MO_8)=
;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_qemu_st_tl(t1, t0, mem_idx, M=
O_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case OPC_SWLE:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mem_idx =3D MIPS_HFLAG_UM;</div>
<div>@@ -20193,7 &#43;20193,7 @@ static void gen_p_lsx(DisasContext *ctx, i=
nt rd, int rs, int rt)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;check_nms(ctx);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gen_load_gpr(t1, rd);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_qemu_st_tl(t1, t0, ctx-&gt;m=
em_idx,</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; MO_8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; MO_UB);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case NM_SHX:</div>
<div>&nbsp; &nbsp; &nbsp;/*case NM_SHXS:*/</div>
<div>diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translat=
e/vmx-impl.inc.c</div>
<div>index 663275b..4130dd1 100644</div>
<div>--- a/target/ppc/translate/vmx-impl.inc.c</div>
<div>&#43;&#43;&#43; b/target/ppc/translate/vmx-impl.inc.c</div>
<div>@@ -403,7 &#43;403,7 @@ static void glue(gen_, name)(DisasContext *ctx=
) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_ptr(rb); &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-GEN_VXFORM_V(vaddubm, MO_8, tcg_gen_gvec_add, 0, 0);</div>
<div>&#43;GEN_VXFORM_V(vaddubm, MO_UB, tcg_gen_gvec_add, 0, 0);</div>
<div>&nbsp;GEN_VXFORM_DUAL_EXT(vaddubm, PPC_ALTIVEC, PPC_NONE, 0, &nbsp; &n=
bsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;vmul10cuq, PPC_NONE, PPC2_ISA300, 0x0000F800)</div>
<div>&nbsp;GEN_VXFORM_V(vadduhm, MO_16, tcg_gen_gvec_add, 0, 1);</div>
<div>@@ -411,23 &#43;411,23 @@ GEN_VXFORM_DUAL(vadduhm, PPC_ALTIVEC, PPC_NO=
NE, &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vmul10ec=
uq, PPC_NONE, PPC2_ISA300)</div>
<div>&nbsp;GEN_VXFORM_V(vadduwm, MO_32, tcg_gen_gvec_add, 0, 2);</div>
<div>&nbsp;GEN_VXFORM_V(vaddudm, MO_64, tcg_gen_gvec_add, 0, 3);</div>
<div>-GEN_VXFORM_V(vsububm, MO_8, tcg_gen_gvec_sub, 0, 16);</div>
<div>&#43;GEN_VXFORM_V(vsububm, MO_UB, tcg_gen_gvec_sub, 0, 16);</div>
<div>&nbsp;GEN_VXFORM_V(vsubuhm, MO_16, tcg_gen_gvec_sub, 0, 17);</div>
<div>&nbsp;GEN_VXFORM_V(vsubuwm, MO_32, tcg_gen_gvec_sub, 0, 18);</div>
<div>&nbsp;GEN_VXFORM_V(vsubudm, MO_64, tcg_gen_gvec_sub, 0, 19);</div>
<div>-GEN_VXFORM_V(vmaxub, MO_8, tcg_gen_gvec_umax, 1, 0);</div>
<div>&#43;GEN_VXFORM_V(vmaxub, MO_UB, tcg_gen_gvec_umax, 1, 0);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxuh, MO_16, tcg_gen_gvec_umax, 1, 1);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxuw, MO_32, tcg_gen_gvec_umax, 1, 2);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxud, MO_64, tcg_gen_gvec_umax, 1, 3);</div>
<div>-GEN_VXFORM_V(vmaxsb, MO_8, tcg_gen_gvec_smax, 1, 4);</div>
<div>&#43;GEN_VXFORM_V(vmaxsb, MO_UB, tcg_gen_gvec_smax, 1, 4);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsh, MO_16, tcg_gen_gvec_smax, 1, 5);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsw, MO_32, tcg_gen_gvec_smax, 1, 6);</div>
<div>&nbsp;GEN_VXFORM_V(vmaxsd, MO_64, tcg_gen_gvec_smax, 1, 7);</div>
<div>-GEN_VXFORM_V(vminub, MO_8, tcg_gen_gvec_umin, 1, 8);</div>
<div>&#43;GEN_VXFORM_V(vminub, MO_UB, tcg_gen_gvec_umin, 1, 8);</div>
<div>&nbsp;GEN_VXFORM_V(vminuh, MO_16, tcg_gen_gvec_umin, 1, 9);</div>
<div>&nbsp;GEN_VXFORM_V(vminuw, MO_32, tcg_gen_gvec_umin, 1, 10);</div>
<div>&nbsp;GEN_VXFORM_V(vminud, MO_64, tcg_gen_gvec_umin, 1, 11);</div>
<div>-GEN_VXFORM_V(vminsb, MO_8, tcg_gen_gvec_smin, 1, 12);</div>
<div>&#43;GEN_VXFORM_V(vminsb, MO_UB, tcg_gen_gvec_smin, 1, 12);</div>
<div>&nbsp;GEN_VXFORM_V(vminsh, MO_16, tcg_gen_gvec_smin, 1, 13);</div>
<div>&nbsp;GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);</div>
<div>@@ -530,18 &#43;530,18 @@ GEN_VXFORM(vmuleuw, 4, 10);</div>
<div>&nbsp;GEN_VXFORM(vmulesb, 4, 12);</div>
<div>&nbsp;GEN_VXFORM(vmulesh, 4, 13);</div>
<div>&nbsp;GEN_VXFORM(vmulesw, 4, 14);</div>
<div>-GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);</div>
<div>&#43;GEN_VXFORM_V(vslb, MO_UB, tcg_gen_gvec_shlv, 2, 4);</div>
<div>&nbsp;GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);</div>
<div>&nbsp;GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);</div>
<div>&nbsp;GEN_VXFORM(vrlwnm, 2, 6);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vslw, PPC_ALTIVEC, PPC_NONE, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vrlwnm, =
PPC_NONE, PPC2_ISA300)</div>
<div>&nbsp;GEN_VXFORM_V(vsld, MO_64, tcg_gen_gvec_shlv, 2, 23);</div>
<div>-GEN_VXFORM_V(vsrb, MO_8, tcg_gen_gvec_shrv, 2, 8);</div>
<div>&#43;GEN_VXFORM_V(vsrb, MO_UB, tcg_gen_gvec_shrv, 2, 8);</div>
<div>&nbsp;GEN_VXFORM_V(vsrh, MO_16, tcg_gen_gvec_shrv, 2, 9);</div>
<div>&nbsp;GEN_VXFORM_V(vsrw, MO_32, tcg_gen_gvec_shrv, 2, 10);</div>
<div>&nbsp;GEN_VXFORM_V(vsrd, MO_64, tcg_gen_gvec_shrv, 2, 27);</div>
<div>-GEN_VXFORM_V(vsrab, MO_8, tcg_gen_gvec_sarv, 2, 12);</div>
<div>&#43;GEN_VXFORM_V(vsrab, MO_UB, tcg_gen_gvec_sarv, 2, 12);</div>
<div>&nbsp;GEN_VXFORM_V(vsrah, MO_16, tcg_gen_gvec_sarv, 2, 13);</div>
<div>&nbsp;GEN_VXFORM_V(vsraw, MO_32, tcg_gen_gvec_sarv, 2, 14);</div>
<div>&nbsp;GEN_VXFORM_V(vsrad, MO_64, tcg_gen_gvec_sarv, 2, 15);</div>
<div>@@ -589,20 &#43;589,20 @@ static void glue(gen_, NAME)(DisasContext *c=
tx) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
16, 16, &amp;g); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; \</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>-GEN_VXFORM_SAT(vaddubs, MO_8, add, usadd, 0, 8);</div>
<div>&#43;GEN_VXFORM_SAT(vaddubs, MO_UB, add, usadd, 0, 8);</div>
<div>&nbsp;GEN_VXFORM_DUAL_EXT(vaddubs, PPC_ALTIVEC, PPC_NONE, 0, &nbsp; &n=
bsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;vmul10uq, PPC_NONE, PPC2_ISA300, 0x0000F800)</div>
<div>&nbsp;GEN_VXFORM_SAT(vadduhs, MO_16, add, usadd, 0, 9);</div>
<div>&nbsp;GEN_VXFORM_DUAL(vadduhs, PPC_ALTIVEC, PPC_NONE, \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vmul10eu=
q, PPC_NONE, PPC2_ISA300)</div>
<div>&nbsp;GEN_VXFORM_SAT(vadduws, MO_32, add, usadd, 0, 10);</div>
<div>-GEN_VXFORM_SAT(vaddsbs, MO_8, add, ssadd, 0, 12);</div>
<div>&#43;GEN_VXFORM_SAT(vaddsbs, MO_UB, add, ssadd, 0, 12);</div>
<div>&nbsp;GEN_VXFORM_SAT(vaddshs, MO_16, add, ssadd, 0, 13);</div>
<div>&nbsp;GEN_VXFORM_SAT(vaddsws, MO_32, add, ssadd, 0, 14);</div>
<div>-GEN_VXFORM_SAT(vsububs, MO_8, sub, ussub, 0, 24);</div>
<div>&#43;GEN_VXFORM_SAT(vsububs, MO_UB, sub, ussub, 0, 24);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubuhs, MO_16, sub, ussub, 0, 25);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);</div>
<div>-GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);</div>
<div>&#43;GEN_VXFORM_SAT(vsubsbs, MO_UB, sub, sssub, 0, 28);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);</div>
<div>&nbsp;GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);</div>
<div>&nbsp;GEN_VXFORM(vadduqm, 0, 4);</div>
<div>@@ -912,7 &#43;912,7 @@ static void glue(gen_, name)(DisasContext *ctx=
) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_ptr(rd); &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>-GEN_VXFORM_VSPLT(vspltb, MO_8, 6, 8);</div>
<div>&#43;GEN_VXFORM_VSPLT(vspltb, MO_UB, 6, 8);</div>
<div>&nbsp;GEN_VXFORM_VSPLT(vsplth, MO_16, 6, 9);</div>
<div>&nbsp;GEN_VXFORM_VSPLT(vspltw, MO_32, 6, 10);</div>
<div>&nbsp;GEN_VXFORM_UIMM_SPLAT(vextractub, 6, 8, 15);</div>
<div>diff --git a/target/s390x/translate.c b/target/s390x/translate.c</div>
<div>index ac0d8b6..415747f 100644</div>
<div>--- a/target/s390x/translate.c</div>
<div>&#43;&#43;&#43; b/target/s390x/translate.c</div>
<div>@@ -154,7 &#43;154,7 @@ static inline int vec_full_reg_offset(uint8_t =
reg)</div>
<div>&nbsp;</div>
<div>&nbsp;static inline int vec_reg_offset(uint8_t reg, uint8_t enr, TCGMe=
mOp es)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;/* Convert element size (es) - e.g. MO_8 - to bytes */<=
/div>
<div>&#43; &nbsp; &nbsp;/* Convert element size (es) - e.g. MO_UB - to byte=
s */</div>
<div>&nbsp; &nbsp; &nbsp;const uint8_t bytes =3D 1 &lt;&lt; es;</div>
<div>&nbsp; &nbsp; &nbsp;int offs =3D enr * bytes;</div>
<div>&nbsp;</div>
<div>diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_=
vx.inc.c</div>
<div>index 41d5cf8..bb424c8 100644</div>
<div>--- a/target/s390x/translate_vx.inc.c</div>
<div>&#43;&#43;&#43; b/target/s390x/translate_vx.inc.c</div>
<div>@@ -30,7 &#43;30,7 @@</div>
<div>&nbsp; * Sizes:</div>
<div>&nbsp; * &nbsp;On s390x, the operand size (oprsz) and the maximum size=
 (maxsz) are</div>
<div>&nbsp; * &nbsp;always 16 (128 bit). What gvec code calls &quot;vece&qu=
ot;, s390x calls &quot;es&quot;,</div>
<div>- * &nbsp;a.k.a. &quot;element size&quot;. These values nicely map to =
MO_8 ... MO_64. Only</div>
<div>&#43; * &nbsp;a.k.a. &quot;element size&quot;. These values nicely map=
 to MO_UB ... MO_64. Only</div>
<div>&nbsp; * &nbsp;128 bit element size has to be treated in a special way=
 (MO_64 &#43; 1).</div>
<div>&nbsp; * &nbsp;We will use ES_* instead of MO_* for this reason in thi=
s file.</div>
<div>&nbsp; *</div>
<div>@@ -46,7 &#43;46,7 @@</div>
<div>&nbsp;#define NUM_VEC_ELEMENTS(es) (16 / NUM_VEC_ELEMENT_BYTES(es))</d=
iv>
<div>&nbsp;#define NUM_VEC_ELEMENT_BITS(es) (NUM_VEC_ELEMENT_BYTES(es) * BI=
TS_PER_BYTE)</div>
<div>&nbsp;</div>
<div>-#define ES_8 &nbsp; &nbsp;MO_8</div>
<div>&#43;#define ES_8 &nbsp; &nbsp;MO_UB</div>
<div>&nbsp;#define ES_16 &nbsp; MO_16</div>
<div>&nbsp;#define ES_32 &nbsp; MO_32</div>
<div>&nbsp;#define ES_64 &nbsp; MO_64</div>
<div>diff --git a/target/s390x/vec.h b/target/s390x/vec.h</div>
<div>index a6e3618..b813054 100644</div>
<div>--- a/target/s390x/vec.h</div>
<div>&#43;&#43;&#43; b/target/s390x/vec.h</div>
<div>@@ -76,7 &#43;76,7 @@ static inline uint64_t s390_vec_read_element(con=
st S390Vector *v, uint8_t enr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; uint8_t es)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (es) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element8(v, enr=
);</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return s390_vec_read_element16(v, en=
r);</div>
<div>@@ -121,7 &#43;121,7 @@ static inline void s390_vec_write_element(S390=
Vector *v, uint8_t enr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;uint8_t es, uint64_t data)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (es) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s390_vec_write_element8(v, enr, data=
);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc=
.c</div>
<div>index 0713448..e4e0845 100644</div>
<div>--- a/tcg/aarch64/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/aarch64/tcg-target.inc.c</div>
<div>@@ -429,20 &#43;429,20 @@ typedef enum {</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Load/store register. &nbsp;Described here as 3.=
3.12, but the helper</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; that emits them can transform to 3.3.10 or=
 3.3.13. &nbsp;*/</div>
<div>- &nbsp; &nbsp;I3312_STRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDST_ST=
 &lt;&lt; 22 | MO_8 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_STRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDS=
T_ST &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_STRX &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_ST &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;I3312_LDRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
 &lt;&lt; 22 | MO_8 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRB &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LDS=
T_LD &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRH &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRW &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRX &nbsp; &nbsp; &nbsp;=3D 0x38000000 | LD=
ST_LD &lt;&lt; 22 | MO_64 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;I3312_LDRSBW &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_S_W =
&lt;&lt; 22 | MO_8 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRSBW &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_=
S_W &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSHW &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_W &lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;I3312_LDRSBX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_S_X =
&lt;&lt; 22 | MO_8 &lt;&lt; 30,</div>
<div>&#43; &nbsp; &nbsp;I3312_LDRSBX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD_=
S_X &lt;&lt; 22 | MO_UB &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSHX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_X &lt;&lt; 22 | MO_16 &lt;&lt; 30,</div>
<div>&nbsp; &nbsp; &nbsp;I3312_LDRSWX &nbsp; &nbsp;=3D 0x38000000 | LDST_LD=
_S_X &lt;&lt; 22 | MO_32 &lt;&lt; 30,</div>
<div>&nbsp;</div>
<div>@@ -862,7 &#43;862,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TC=
GType type,</div>
<div>&nbsp; &nbsp; &nbsp;int cmode, imm8, i;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/* Test all bytes equal first. &nbsp;*/</div>
<div>- &nbsp; &nbsp;if (v64 =3D=3D dup_const(MO_8, v64)) {</div>
<div>&#43; &nbsp; &nbsp;if (v64 =3D=3D dup_const(MO_UB, v64)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;imm8 =3D (uint8_t)v64;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_insn(s, 3606, MOVI, q, rd, 0=
, 0xe, imm8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>@@ -1772,7 &#43;1772,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGMemOp memop,</div>
<div>&nbsp; &nbsp; &nbsp;const TCGMemOp bswap =3D memop &amp; MO_BSWAP;</di=
v>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ldst_r(s, I3312_STRB, data_r=
, addr_r, otype, off_r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -2186,7 &#43;2186,7 @@ static void tcg_out_op(TCGContext *s, TCGOpc=
ode opc,</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext8s_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext8s_i32:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, ext, MO_8, a0, a1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_sxt(s, ext, MO_UB, a0, a1);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16s_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16s_i32:</div>
<div>@@ -2198,7 &#43;2198,7 @@ static void tcg_out_op(TCGContext *s, TCGOpc=
ode opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext8u_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext8u_i32:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_uxt(s, MO_8, a0, a1);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_uxt(s, MO_UB, a0, a1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16u_i64:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_ext16u_i32:</div>
<div>diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c</div>
<div>index ece88dc..542ffa8 100644</div>
<div>--- a/tcg/arm/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/arm/tcg-target.inc.c</div>
<div>@@ -1429,7 &#43;1429,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *lb)</div>
<div>&nbsp; &nbsp; &nbsp;datalo =3D lb-&gt;datalo_reg;</div>
<div>&nbsp; &nbsp; &nbsp;datahi =3D lb-&gt;datahi_reg;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argreg =3D tcg_out_arg_reg8(s, argre=
g, datalo);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1621,7 &#43;1621,7 @@ static inline void tcg_out_qemu_st_index(TCG=
Context *s, int cond, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st8_r(s, cond, datalo, addrl=
o, addend);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1666,7 &#43;1666,7 @@ static inline void tcg_out_qemu_st_direct(TC=
GContext *s, TCGMemOp opc,</div>
<div>&nbsp; &nbsp; &nbsp;TCGMemOp bswap =3D opc &amp; MO_BSWAP;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_st8_12(s, COND_AL, datalo, a=
ddrlo, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c</di=
v>
<div>index 6ddeebf..0d68ba4 100644</div>
<div>--- a/tcg/i386/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/i386/tcg-target.inc.c</div>
<div>@@ -888,7 &#43;888,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCG=
Type type, unsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm(s, avx2_dup_insn[v=
ece] &#43; vex_l, r, 0, a);</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* ??? With zero in a =
register, use PSHUFB. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm(s, O=
PC_PUNPCKLBW, r, a, a);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;a =3D r;</div>
<div>@@ -932,7 &#43;932,7 @@ static bool tcg_out_dupm_vec(TCGContext *s, TC=
GType type, unsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out8(s, 0); /* imm=
8 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_dup_vec(s, typ=
e, vece, r, r);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_vex_modrm_offs=
et(s, OPC_VPINSRB, r, r, base, offset);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out8(s, 0); /* imm=
8 */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_dup_vec(s, typ=
e, vece, r, r);</div>
<div>@@ -2154,7 &#43;2154,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGReg datalo, TCGReg datahi,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (memop &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* In 32-bit mode, 8-bit stores can =
only happen from [abcd]x.</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Use the scratch register if =
necessary. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TCG_TARGET_REG_BITS =3D=3D 32 &a=
mp;&amp; datalo &gt;=3D 4) {</div>
<div>@@ -2901,7 &#43;2901,7 @@ static void tcg_out_vec_op(TCGContext *s, TC=
GOpcode opc,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_debug_assert(vece !=3D MO_64);</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sub =3D 4;</div>
<div>&nbsp; &nbsp; &nbsp;gen_shift:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_debug_assert(vece !=3D MO_8);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_debug_assert(vece !=3D MO_UB);</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;insn =3D shift_imm_insn[vece];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (type =3D=3D TCG_TYPE_V256) {</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;insn |=3D P_VEXL;</div=
>
<div>@@ -3273,12 &#43;3273,12 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCG=
Type type, unsigned vece)</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shli_vec:</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_shri_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* We must expand the operation for MO_8.=
 &nbsp;*/</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;return vece =3D=3D MO_8 ? -1 : 1;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* We must expand the operation for M=
O_UB. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;return vece =3D=3D MO_UB ? -1 : 1;</d=
iv>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_sari_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;/* We must expand the operation for MO_8.=
 &nbsp;*/</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_8) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;/* We must expand the operation for M=
O_UB. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_UB) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* We can emulate this for MO_64, bu=
t it does not pay off</div>
<div>@@ -3301,8 &#43;3301,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGTy=
pe type, unsigned vece)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return have_avx2 &amp;&amp; vece =3D=
=3D MO_32;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;case INDEX_op_mul_vec:</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_8) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* We can expand the operat=
ion for MO_8. &nbsp;*/</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_UB) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* We can expand the op=
eration for MO_UB. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (vece =3D=3D MO_64) {</div>
<div>@@ -3332,7 &#43;3332,7 @@ static void expand_vec_shi(TCGType type, uns=
igned vece, bool shr,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_vec t1, t2;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;tcg_debug_assert(vece =3D=3D MO_8);</div>
<div>&#43; &nbsp; &nbsp;tcg_debug_assert(vece =3D=3D MO_UB);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;t1 =3D tcg_temp_new_vec(type);</div>
<div>&nbsp; &nbsp; &nbsp;t2 =3D tcg_temp_new_vec(type);</div>
<div>@@ -3346,9 &#43;3346,9 @@ static void expand_vec_shi(TCGType type, uns=
igned vece, bool shr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; (3) Step 2 leaves high half zero such that=
 PACKUSWB</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (pack with unsigned saturati=
on) does not modify</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; the quantity. &nbsp;*/</div>
<div>- &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_8,</div>
<div>&#43; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, type, MO_UB,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcgv_vec_arg(t1=
), tcgv_vec_arg(v1), tcgv_vec_arg(v1));</div>
<div>- &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_8,</div>
<div>&#43; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, type, MO_UB,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcgv_vec_arg(t2=
), tcgv_vec_arg(v1), tcgv_vec_arg(v1));</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (shr) {</div>
<div>@@ -3361,7 &#43;3361,7 @@ static void expand_vec_shi(TCGType type, uns=
igned vece, bool shr,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t2, t2, 8);<=
/div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, type, MO_8,</div>
<div>&#43; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, type, MO_UB,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcgv_vec_arg(v0=
), tcgv_vec_arg(t1), tcgv_vec_arg(t2));</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t2);</div>
<div>@@ -3373,17 &#43;3373,17 @@ static void expand_vec_sari(TCGType type, =
unsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_vec t1, t2;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Unpack to W, shift, and repack, a=
s in expand_vec_shi. &nbsp;*/</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t1 =3D tcg_temp_new_vec(type);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t2 =3D tcg_temp_new_vec(type);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, type,=
 MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(v1));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, type,=
 MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t2), tcgv_vec_arg(v1), tcgv_vec_arg(v1));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_16, t1, t1, imm =
&#43; 8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_sari_vec(MO_16, t2, t2, imm =
&#43; 8);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packss_vec, type, =
MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packss_vec, ty=
pe, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t2));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t2);</div>
<div>@@ -3425,7 &#43;3425,7 @@ static void expand_vec_mul(TCGType type, uns=
igned vece,</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_vec t1, t2, t3, t4;</div>
<div>&nbsp;</div>
<div>- &nbsp; &nbsp;tcg_debug_assert(vece =3D=3D MO_8);</div>
<div>&#43; &nbsp; &nbsp;tcg_debug_assert(vece =3D=3D MO_UB);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;/*</div>
<div>&nbsp; &nbsp; &nbsp; * Unpack v1 bytes to words, 0 | x.</div>
<div>@@ -3442,13 &#43;3442,13 @@ static void expand_vec_mul(TCGType type, u=
nsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t1 =3D tcg_temp_new_vec(TCG_TYPE_V12=
8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t2 =3D tcg_temp_new_vec(TCG_TYPE_V12=
8);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_dup16i_vec(t2, 0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_T=
YPE_V128, MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, T=
CG_TYPE_V128, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t2));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, TCG_T=
YPE_V128, MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, T=
CG_TYPE_V128, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t2), tcgv_vec_arg(t2), tcgv_vec_arg(v2));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_16, t1, t1, t2);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t1, t1, 8);<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, TCG_TY=
PE_V128, MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, TC=
G_TYPE_V128, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t1));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t2);</div>
<div>@@ -3461,19 &#43;3461,19 @@ static void expand_vec_mul(TCGType type, u=
nsigned vece,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t3 =3D tcg_temp_new_vec(type);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t4 =3D tcg_temp_new_vec(type);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_dup16i_vec(t4, 0);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, type,=
 MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t1), tcgv_vec_arg(v1), tcgv_vec_arg(t4));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, type,=
 MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckl_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t2), tcgv_vec_arg(t4), tcgv_vec_arg(v2));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, type,=
 MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t3), tcgv_vec_arg(v1), tcgv_vec_arg(t4));</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, type,=
 MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_punpckh_vec, t=
ype, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(t4), tcgv_vec_arg(t4), tcgv_vec_arg(v2));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_16, t1, t1, t2);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_mul_vec(MO_16, t3, t3, t4);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t1, t1, 8);<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_shri_vec(MO_16, t3, t3, 8);<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, type, =
MO_8,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_3(INDEX_op_x86_packus_vec, ty=
pe, MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
cgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(t3));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t2);</div>
<div>diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c</di=
v>
<div>index 41bff32..c6d13ea 100644</div>
<div>--- a/tcg/mips/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/mips/tcg-target.inc.c</div>
<div>@@ -1380,7 &#43;1380,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D tcg_out_call_iarg_reg(s, i, l-=
&gt;addrlo_reg);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp;switch (s_bits) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D tcg_out_call_iarg_reg8(s, i, l=
-&gt;datalo_reg);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1566,7 &#43;1566,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGReg lo, TCGReg hi,</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; (MO_SIZE | MO_BSWAP)) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_imm(s, OPC_SB, lo, base,=
 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp;</div>
<div>diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c</=
div>
<div>index 3e76bf5..9c60c0f 100644</div>
<div>--- a/tcg/riscv/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/riscv/tcg-target.inc.c</div>
<div>@@ -1101,7 &#43;1101,7 @@ static bool tcg_out_qemu_st_slow_path(TCGCon=
text *s, TCGLabelQemuLdst *l)</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_mov(s, TCG_TYPE_PTR, a1, l-&gt;addrlo_reg)=
;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_out_mov(s, TCG_TYPE_PTR, a2, l-&gt;datalo_reg)=
;</div>
<div>&nbsp; &nbsp; &nbsp;switch (s_bits) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_ext8u(s, a2, a2);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1216,7 &#43;1216,7 @@ static void tcg_out_qemu_st_direct(TCGContex=
t *s, TCGReg lo, TCGReg hi,</div>
<div>&nbsp; &nbsp; &nbsp;g_assert(!bswap);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (opc &amp; (MO_SSIZE)) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_opc_store(s, OPC_SB, base, l=
o, 0);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c</=
div>
<div>index 10b1cea..479ee2e 100644</div>
<div>--- a/tcg/sparc/tcg-target.inc.c</div>
<div>&#43;&#43;&#43; b/tcg/sparc/tcg-target.inc.c</div>
<div>@@ -882,7 &#43;882,7 @@ static void emit_extend(TCGContext *s, TCGReg =
r, int op)</div>
<div>&nbsp; &nbsp; &nbsp; * required by the MO_* value op; do nothing for 6=
4 bit.</div>
<div>&nbsp; &nbsp; &nbsp; */</div>
<div>&nbsp; &nbsp; &nbsp;switch (op &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_out_arithi(s, r, r, 0xff, ARITH_=
AND);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c</div>
<div>index 17679b6..9658c36 100644</div>
<div>--- a/tcg/tcg-op-gvec.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op-gvec.c</div>
<div>@@ -306,7 &#43;306,7 @@ static void expand_clr(uint32_t dofs, uint32_t=
 maxsz);</div>
<div>&nbsp;uint64_t (dup_const)(unsigned vece, uint64_t c)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0101010101010101ull * (uint=
8_t)c;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0x0001000100010001ull * (uint=
16_t)c;</div>
<div>@@ -323,7 &#43;323,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c=
)</div>
<div>&nbsp;static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8u_i32(out, in);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_i32(out, out, 0x0101010=
1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -341,7 &#43;341,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i3=
2 out, TCGv_i32 in)</div>
<div>&nbsp;static void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in=
)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_ext8u_i64(out, in);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_muli_i64(out, out, 0x0101010=
101010101ull);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>@@ -556,7 &#43;556,7 @@ static void do_dup(unsigned vece, uint32_t dof=
s, uint32_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t_32 =3D tcg_temp_new_=
i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (in_64) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
extrl_i64_i32(t_32, in_64);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D MO_8=
) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D =
MO_UB) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
movi_i32(t_32, in_c &amp; 0xff);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece =3D=3D=
 MO_16) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
movi_i32(t_32, in_c &amp; 0xffff);</div>
<div>@@ -581,7 &#43;581,7 @@ static void do_dup(unsigned vece, uint32_t dof=
s, uint32_t oprsz,</div>
<div>&nbsp;/* Likewise, but with zero. &nbsp;*/</div>
<div>&nbsp;static void expand_clr(uint32_t dofs, uint32_t maxsz)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;do_dup(MO_8, dofs, maxsz, maxsz, NULL, NULL, 0);</div>
<div>&#43; &nbsp; &nbsp;do_dup(MO_UB, dofs, maxsz, maxsz, NULL, NULL, 0);</=
div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;/* Expand OPSZ bytes worth of two-operand operations using i32 e=
lements. &nbsp;*/</div>
<div>@@ -1456,7 &#43;1456,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uin=
t32_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else if (vece &lt;=3D MO_32) {</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_i32 in =3D tcg_te=
mp_new_i32();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;switch (vece) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_=
ld8u_i32(in, cpu_env, aofs);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -1533,7 &#43;1533,7 @@ void tcg_gen_gvec_dup8i(uint32_t dofs, uint3=
2_t oprsz,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; uint32_t maxsz, uint8_t x)</div>
<div>&nbsp;{</div>
<div>&nbsp; &nbsp; &nbsp;check_size_align(oprsz, maxsz, dofs);</div>
<div>- &nbsp; &nbsp;do_dup(MO_8, dofs, oprsz, maxsz, NULL, NULL, x);</div>
<div>&#43; &nbsp; &nbsp;do_dup(MO_UB, dofs, oprsz, maxsz, NULL, NULL, x);</=
div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_gvec_not(unsigned vece, uint32_t dofs, uint32_t aof=
s,</div>
<div>@@ -1572,7 &#43;1572,7 @@ static void gen_addv_mask(TCGv_i64 d, TCGv_i=
64 a, TCGv_i64 b, TCGv_i64 m)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)</d=
iv>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_8, 0x80));</d=
iv>
<div>&#43; &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UB, 0x80)=
);</div>
<div>&nbsp; &nbsp; &nbsp;gen_addv_mask(d, a, b, m);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i64(m);</div>
<div>&nbsp;}</div>
<div>@@ -1608,7 &#43;1608,7 @@ void tcg_gen_gvec_add(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_add8=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_add,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_add16_i64,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_add1=
6,</div>
<div>@@ -1639,7 &#43;1639,7 @@ void tcg_gen_gvec_adds(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_adds=
8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_add,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_add16_i64,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_add_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_adds=
16,</div>
<div>@@ -1680,7 &#43;1680,7 @@ void tcg_gen_gvec_subs(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_subs=
8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sub,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_sub16_i64,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_subs=
16,</div>
<div>@@ -1725,7 &#43;1725,7 @@ static void gen_subv_mask(TCGv_i64 d, TCGv_i=
64 a, TCGv_i64 b, TCGv_i64 m)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)</d=
iv>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_8, 0x80));</d=
iv>
<div>&#43; &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UB, 0x80)=
);</div>
<div>&nbsp; &nbsp; &nbsp;gen_subv_mask(d, a, b, m);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i64(m);</div>
<div>&nbsp;}</div>
<div>@@ -1759,7 &#43;1759,7 @@ void tcg_gen_gvec_sub(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sub8=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_sub,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_sub16_i64,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sub_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sub1=
6,</div>
<div>@@ -1791,7 &#43;1791,7 @@ void tcg_gen_gvec_mul(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_mul_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_mul8=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_mul_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_mul1=
6,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>@@ -1820,7 &#43;1820,7 @@ void tcg_gen_gvec_muls(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_mul_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_muls=
8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_mul_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_muls=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list_mul,<=
/div>
<div>@@ -1858,7 &#43;1858,7 @@ void tcg_gen_gvec_ssadd(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ssadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ssad=
d8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ssadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ssad=
d16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1884,7 &#43;1884,7 @@ void tcg_gen_gvec_sssub(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sssub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sssu=
b8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sssub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sssu=
b16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1926,7 &#43;1926,7 @@ void tcg_gen_gvec_usadd(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_usadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_usad=
d8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_usadd_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_usad=
d16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1970,7 &#43;1970,7 @@ void tcg_gen_gvec_ussub(unsigned vece, uint3=
2_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ussub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ussu=
b8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_ussub_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_ussu=
b16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -1998,7 &#43;1998,7 @@ void tcg_gen_gvec_smin(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_smin_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smin=
8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_smin_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smin=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -2026,7 &#43;2026,7 @@ void tcg_gen_gvec_umin(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_umin_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umin=
8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_umin_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umin=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -2054,7 &#43;2054,7 @@ void tcg_gen_gvec_smax(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_smax_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smax=
8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_smax_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_smax=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -2082,7 &#43;2082,7 @@ void tcg_gen_gvec_umax(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_umax_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umax=
8,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_umax_vec,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_umax=
16,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -2120,7 &#43;2120,7 @@ static void gen_negv_mask(TCGv_i64 d, TCGv_i=
64 b, TCGv_i64 m)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_neg8_i64(TCGv_i64 d, TCGv_i64 b)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_8, 0x80));</d=
iv>
<div>&#43; &nbsp; &nbsp;TCGv_i64 m =3D tcg_const_i64(dup_const(MO_UB, 0x80)=
);</div>
<div>&nbsp; &nbsp; &nbsp;gen_negv_mask(d, b, m);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_temp_free_i64(m);</div>
<div>&nbsp;}</div>
<div>@@ -2155,7 &#43;2155,7 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_neg_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_neg8=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_neg16_i64,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_neg_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_neg1=
6,</div>
<div>@@ -2201,7 &#43;2201,7 @@ static void gen_absv_mask(TCGv_i64 d, TCGv_i=
64 b, unsigned vece)</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_gen_vec_abs8_i64(TCGv_i64 d, TCGv_i64 b)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;gen_absv_mask(d, b, MO_8);</div>
<div>&#43; &nbsp; &nbsp;gen_absv_mask(d, b, MO_UB);</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;static void tcg_gen_vec_abs16_i64(TCGv_i64 d, TCGv_i64 b)</div>
<div>@@ -2218,7 &#43;2218,7 @@ void tcg_gen_gvec_abs(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_abs_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_abs8=
,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_abs16_i64,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_abs_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_abs1=
6,</div>
<div>@@ -2454,7 &#43;2454,7 @@ void tcg_gen_gvec_ori(unsigned vece, uint32_=
t dofs, uint32_t aofs,</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)</d=
iv>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_8, 0xff &lt;&lt; c);</di=
v>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UB, 0xff &lt;&lt; c)=
;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shli_i64(d, a, c);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_andi_i64(d, d, mask);</div>
<div>&nbsp;}</div>
<div>@@ -2475,7 &#43;2475,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shli_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl8=
i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_shl16i_i64,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shli_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl1=
6i,</div>
<div>@@ -2505,7 &#43;2505,7 @@ void tcg_gen_gvec_shli(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_shr8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)</d=
iv>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_8, 0xff &gt;&gt; c);</di=
v>
<div>&#43; &nbsp; &nbsp;uint64_t mask =3D dup_const(MO_UB, 0xff &gt;&gt; c)=
;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shri_i64(d, a, c);</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_andi_i64(d, d, mask);</div>
<div>&nbsp;}</div>
<div>@@ -2526,7 &#43;2526,7 @@ void tcg_gen_gvec_shri(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shri_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr8=
i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_shr16i_i64,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_shri_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr1=
6i,</div>
<div>@@ -2556,8 &#43;2556,8 @@ void tcg_gen_gvec_shri(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)</d=
iv>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;uint64_t s_mask =3D dup_const(MO_8, 0x80 &gt;&gt; c);</=
div>
<div>- &nbsp; &nbsp;uint64_t c_mask =3D dup_const(MO_8, 0xff &gt;&gt; c);</=
div>
<div>&#43; &nbsp; &nbsp;uint64_t s_mask =3D dup_const(MO_UB, 0x80 &gt;&gt; =
c);</div>
<div>&#43; &nbsp; &nbsp;uint64_t c_mask =3D dup_const(MO_UB, 0xff &gt;&gt; =
c);</div>
<div>&nbsp; &nbsp; &nbsp;TCGv_i64 s =3D tcg_temp_new_i64();</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;tcg_gen_shri_i64(d, a, c);</div>
<div>@@ -2591,7 &#43;2591,7 @@ void tcg_gen_gvec_sari(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sari_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar8=
i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fni8 =3D tcg_gen_vec_sar16i_i64,<=
/div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fniv =3D tcg_gen_sari_vec,</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar1=
6i,</div>
<div>@@ -2880,7 &#43;2880,7 @@ void tcg_gen_gvec_shlv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_shlv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl8=
v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_shlv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shl1=
6v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -2943,7 &#43;2943,7 @@ void tcg_gen_gvec_shrv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_shrv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr8=
v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_shrv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_shr1=
6v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -3006,7 &#43;3006,7 @@ void tcg_gen_gvec_sarv(unsigned vece, uint32=
_t dofs, uint32_t aofs,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sarv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar8=
v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_8 },</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.vece =3D MO_UB },</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{ .fniv =3D tcg_gen_sarv_mod_vec,</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.fno =3D gen_helper_gvec_sar1=
6v,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.opt_opc =3D vecop_list,</div=
>
<div>@@ -3129,7 &#43;3129,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned=
 vece, uint32_t dofs,</div>
<div>&nbsp; &nbsp; &nbsp;check_overlap_3(dofs, aofs, bofs, maxsz);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (cond =3D=3D TCG_COND_NEVER || cond =3D=3D TCG_=
COND_ALWAYS) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;do_dup(MO_8, dofs, oprsz, maxsz,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;do_dup(MO_UB, dofs, oprsz, maxsz,</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NULL, NULL, -(=
cond =3D=3D TCG_COND_ALWAYS));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c</div>
<div>index 6714991..d7ffc9e 100644</div>
<div>--- a/tcg/tcg-op-vec.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op-vec.c</div>
<div>@@ -275,7 &#43;275,7 @@ void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a=
)</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)</div>
<div>&nbsp;{</div>
<div>- &nbsp; &nbsp;do_dupi_vec(r, MO_REG, dup_const(MO_8, a));</div>
<div>&#43; &nbsp; &nbsp;do_dupi_vec(r, MO_REG, dup_const(MO_UB, a));</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)</di=
v>
<div>@@ -752,13 &#43;752,13 @@ void tcg_gen_bitsel_vec(unsigned vece, TCGv_=
vec r, TCGv_vec a,</div>
<div>&nbsp; &nbsp; &nbsp;tcg_debug_assert(ct-&gt;base_type &gt;=3D type);</=
div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;if (TCG_TARGET_HAS_bitsel_vec) {</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_4(INDEX_op_bitsel_vec, type, MO_8=
,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;vec_gen_4(INDEX_op_bitsel_vec, type, =
MO_UB,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;t=
emp_arg(rt), temp_arg(at), temp_arg(bt), temp_arg(ct));</div>
<div>&nbsp; &nbsp; &nbsp;} else {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TCGv_vec t =3D tcg_temp_new_vec(type=
);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_and_vec(MO_8, t, a, b);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_andc_vec(MO_8, r, c, a);</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_or_vec(MO_8, r, r, t);</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_and_vec(MO_UB, t, a, b);</div=
>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_andc_vec(MO_UB, r, c, a);</di=
v>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp;tcg_gen_or_vec(MO_UB, r, r, t);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tcg_temp_free_vec(t);</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp;}</div>
<div>diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c</div>
<div>index 587d092..61eda33 100644</div>
<div>--- a/tcg/tcg-op.c</div>
<div>&#43;&#43;&#43; b/tcg/tcg-op.c</div>
<div>@@ -2720,7 &#43;2720,7 @@ static inline TCGMemOp tcg_canonicalize_memo=
p(TCGMemOp op, bool is64, bool st)</div>
<div>&nbsp; &nbsp; &nbsp;(void)get_alignment_bits(op);</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;switch (op &amp; MO_SIZE) {</div>
<div>- &nbsp; &nbsp;case MO_8:</div>
<div>&#43; &nbsp; &nbsp;case MO_UB:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;op &amp;=3D ~MO_BSWAP;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp;case MO_16:</div>
<div>@@ -3024,7 &#43;3024,7 @@ typedef void (*gen_atomic_op_i64)(TCGv_i64, =
TCGv_env, TCGv, TCGv_i64);</div>
<div>&nbsp;#endif</div>
<div>&nbsp;</div>
<div>&nbsp;static void * const table_cmpxchg[16] =3D {</div>
<div>- &nbsp; &nbsp;[MO_8] =3D gen_helper_atomic_cmpxchgb,</div>
<div>&#43; &nbsp; &nbsp;[MO_UB] =3D gen_helper_atomic_cmpxchgb,</div>
<div>&nbsp; &nbsp; &nbsp;[MO_16 | MO_LE] =3D gen_helper_atomic_cmpxchgw_le,=
</div>
<div>&nbsp; &nbsp; &nbsp;[MO_16 | MO_BE] =3D gen_helper_atomic_cmpxchgw_be,=
</div>
<div>&nbsp; &nbsp; &nbsp;[MO_32 | MO_LE] =3D gen_helper_atomic_cmpxchgl_le,=
</div>
<div>@@ -3248,7 &#43;3248,7 @@ static void do_atomic_op_i64(TCGv_i64 ret, T=
CGv addr, TCGv_i64 val,</div>
<div>&nbsp;</div>
<div>&nbsp;#define GEN_ATOMIC_HELPER(NAME, OP, NEW) &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;\</div>
<div>&nbsp;static void * const table_##NAME[16] =3D { &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;\</div>
<div>- &nbsp; &nbsp;[MO_8] =3D gen_helper_atomic_##NAME##b, &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; \</div>
<div>&#43; &nbsp; &nbsp;[MO_UB] =3D gen_helper_atomic_##NAME##b, &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;[MO_16 | MO_LE] =3D gen_helper_atomic_##NAME##w_le=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;[MO_16 | MO_BE] =3D gen_helper_atomic_##NAME##w_be=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;[MO_32 | MO_LE] =3D gen_helper_atomic_##NAME##l_le=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>diff --git a/tcg/tcg.h b/tcg/tcg.h</div>
<div>index b411e17..5636d6b 100644</div>
<div>--- a/tcg/tcg.h</div>
<div>&#43;&#43;&#43; b/tcg/tcg.h</div>
<div>@@ -1302,7 &#43;1302,7 @@ uint64_t dup_const(unsigned vece, uint64_t c=
);</div>
<div>&nbsp;</div>
<div>&nbsp;#define dup_const(VECE, C) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp;(__builtin_constant_p(VECE) &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>- &nbsp; &nbsp; ? ( &nbsp;(VECE) =3D=3D MO_8 &nbsp;? 0x010101010101010=
1ull * (uint8_t)(C) &nbsp; \</div>
<div>&#43; &nbsp; &nbsp; ? &nbsp; ((VECE) =3D=3D MO_UB ? 0x0101010101010101=
ull * (uint8_t)(C) &nbsp; \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_16 ? 0x0001000100=
010001ull * (uint16_t)(C) &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: (VECE) =3D=3D MO_32 ? 0x0000000100=
000001ull * (uint32_t)(C) &nbsp;\</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: dup_const(VECE, C)) &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156380988808957547btcom_--

