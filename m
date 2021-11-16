Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmtVN-0007K8-Km
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 03:07:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtUr-0007A0-8d; Tue, 16 Nov 2021 03:07:19 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:54622 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtUn-0003BV-Aa; Tue, 16 Nov 2021 03:07:17 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2hZpNhU9VmBw--.50016S4;
 Tue, 16 Nov 2021 16:07:07 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v2 2/7] target/riscv: rvk: add implementation of
 instructions for Zbk*
Date: Tue, 16 Nov 2021 16:06:16 +0800
Message-Id: <20211116080621.2521-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
References: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAC3mO2hZpNhU9VmBw--.50016S4
X-Coremail-Antispam: 1UD129KBjvAXoW3Aw4DXF47tF48trW3Ww4xCrg_yoW8Xr1kJo
 W7Gw45Jrs3Gr13ua43G3WUXry7Ar4j9a4fJr1Y9w1qga97XrWfKryDJrs5Zw48Xry3KrW8
 Xas7tFnxJw1rWwnxn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUO77AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
 kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
 kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
 6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0x
 vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
 vjDU0xZFpf9x0JUpSoXUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Nov 2021 08:07:21 -0000
X-List-Received-Date: Tue, 16 Nov 2021 08:07:21 -0000

   - reuse partial instructions of Zbb/Zbc extensions
   - add brev8 packh, unzip, zip, etc.

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/bitmanip_helper.c          |  74 ++++++++++++++
 target/riscv/helper.h                   |   5 +
 target/riscv/insn32.decode              |  52 ++++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 127 +++++++++++++++++++++---
 target/riscv/translate.c                |   7 ++
 5 files changed, 234 insertions(+), 31 deletions(-)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index f1b5e5549f..0de92d968c 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -49,3 +49,77 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
 
     return result;
 }
+
+static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
+{
+    return ((x & mask) << shift) | ((x & ~mask) >> shift);
+}
+
+target_ulong HELPER(brev8)(target_ulong rs1)
+{
+    target_ulong x = rs1;
+    x = do_swap(x, 0x55, 1);
+    x = do_swap(x, 0x33, 2);
+    x = do_swap(x, 0x0f, 4);
+    return x;
+}
+
+static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
+                                    uint32_t sz_log2)
+{
+    target_ulong r = 0;
+    target_ulong sz = 1LL << sz_log2;
+    target_ulong mask = (1LL << sz) - 1;
+    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
+        target_ulong pos = ((rs2 >> i) & mask) << sz_log2;
+        if (pos < sizeof(target_ulong) * 8) {
+            r |= ((rs1 >> pos) & mask) << i;
+        }
+    }
+    return r;
+}
+
+target_ulong HELPER(xperm4)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 2);
+}
+
+target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 3);
+}
+
+static const uint64_t shuf_masks[] = {
+    dup_const(MO_8, 0x44),
+    dup_const(MO_8, 0x30),
+    dup_const(MO_16, 0x0f00),
+    dup_const(MO_32, 0xff0000)
+};
+
+static inline target_ulong do_shuf_stage(target_ulong src, uint64_t maskL,
+                                         uint64_t maskR, int shift)
+{
+    target_ulong x = src & ~(maskL | maskR);
+    x |= ((src << shift) & maskL) | ((src >> shift) & maskR);
+    return x;
+}
+
+target_ulong HELPER(unzip)(target_ulong rs1)
+{
+    target_ulong x = rs1;
+    x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
+    x = do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
+    x = do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
+    x = do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
+    return x;
+}
+
+target_ulong HELPER(zip)(target_ulong rs1)
+{
+    target_ulong x = rs1;
+    x = do_shuf_stage(x, shuf_masks[3], shuf_masks[3] >> 8, 8);
+    x = do_shuf_stage(x, shuf_masks[2], shuf_masks[2] >> 4, 4);
+    x = do_shuf_stage(x, shuf_masks[1], shuf_masks[1] >> 2, 2);
+    x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
+    return x;
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a5376227..1cc626893f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -61,6 +61,11 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2f251dac1b..a5333c4533 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -672,8 +672,22 @@ sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 slli_uw    00001 ............ 001 ..... 0011011 @sh
 
-# *** RV32 Zbb Standard Extension ***
+# *** RV32 Zbb/Zbkb Standard Extension ***
 andn       0100000 .......... 111 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rori       01100 ............ 101 ..... 0010011 @sh
+# The encoding for rev8 differs between RV32 and RV64.
+# rev8_32 denotes the RV32 variant.
+rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
+# The encoding for zext.h differs between RV32 and RV64.
+# zext_h_32 denotes the RV32 variant.
+{
+  zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
+  pack       0000100 ..... ..... 100 ..... 0110011 @r
+}
+xnor       0100000 .......... 100 ..... 0110011 @r
+# *** RV32 extra Zbb Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
@@ -683,23 +697,15 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
-# The encoding for rev8 differs between RV32 and RV64.
-# rev8_32 denotes the RV32 variant.
-rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
-rol        0110000 .......... 001 ..... 0110011 @r
-ror        0110000 .......... 101 ..... 0110011 @r
-rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
-xnor       0100000 .......... 100 ..... 0110011 @r
-# The encoding for zext.h differs between RV32 and RV64.
-# zext_h_32 denotes the RV32 variant.
-zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
+# *** RV32 extra Zbkb Standard Extension ***
+brev8      0110100 00111 ..... 101 ..... 0010011 @r2  #grevi
+packh      0000100  .......... 111 ..... 0110011 @r
+unzip      0000100 01111 ..... 101 ..... 0010011 @r2  #unshfl
+zip        0000100 01111 ..... 001 ..... 0010011 @r2  #shfl
 
-# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
-clzw       0110000 00000 ..... 001 ..... 0011011 @r2
-ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
-cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+# *** RV64 Zbb/Zbkb Standard Extension (in addition to RV32 Zbb/Zbkb) ***
 # The encoding for rev8 differs between RV32 and RV64.
 # When executing on RV64, the encoding used in RV32 is an illegal
 # instruction, so we use different handler functions to differentiate.
@@ -710,13 +716,25 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 # The encoding for zext.h differs between RV32 and RV64.
 # When executing on RV64, the encoding used in RV32 is an illegal
 # instruction, so we use different handler functions to differentiate.
-zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
+{
+  zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
+  packw      0000100 ..... ..... 100 ..... 0111011 @r
+}
+# *** RV64 extra Zbb Standard Extension (in addition to RV32 Zbb) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
 
-# *** RV32 Zbc Standard Extension ***
+# *** RV32 Zbc/Zbkc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
+# *** RV32 extra Zbc Standard Extension ***
 clmulr     0000101 .......... 010 ..... 0110011 @r
 
+# *** RV32 Zbkx Standard Extension ***
+xperm4     0010100 .......... 010 ..... 0110011 @r
+xperm8     0010100 .......... 100 ..... 0110011 @r
+
 # *** RV32 Zbs Standard Extension ***
 bclr       0100100 .......... 001 ..... 0110011 @r
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index c8d31907c5..8488d93b11 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zb[abcs] Standard Extension.
+ * RISC-V translation routines for the Zb[abcs] and Zbk[bcx] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -42,6 +42,18 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBKB(ctx) do {                   \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbkb) {     \
+        return false;                            \
+    }                                            \
+} while (0)
+
+#define REQUIRE_ZBKX(ctx) do {                   \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbkx) {     \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
@@ -85,19 +97,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
 }
 
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
 }
 
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
 
@@ -247,7 +259,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotr_tl, gen_rorw);
 }
 
@@ -264,7 +276,7 @@ static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
                                    tcg_gen_rotri_tl, gen_roriw);
 }
@@ -289,7 +301,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_shift_per_ol(ctx, a, EXT_NONE, tcg_gen_rotl_tl, gen_rolw);
 }
 
@@ -301,14 +313,14 @@ static void gen_rev8_32(TCGv ret, TCGv src1)
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
 
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
 }
 
@@ -403,7 +415,7 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol = MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rorw);
 }
@@ -411,7 +423,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol = MXL_RV32;
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw);
 }
@@ -419,7 +431,7 @@ static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_ZBB(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbb, zbkb);
     ctx->ol = MXL_RV32;
     return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
@@ -483,7 +495,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
 {
-    REQUIRE_ZBC(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
     return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul);
 }
 
@@ -495,7 +507,7 @@ static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
 
 static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
 {
-    REQUIRE_ZBC(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
     return gen_arith(ctx, a, EXT_NONE, gen_clmulh);
 }
 
@@ -504,3 +516,90 @@ static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
     REQUIRE_ZBC(ctx);
     return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr);
 }
+
+static void gen_pack(TCGv ret, TCGv src1, TCGv src2)
+{
+    tcg_gen_deposit_tl(ret, src1, src2,
+                       TARGET_LONG_BITS / 2,
+                       TARGET_LONG_BITS / 2);
+}
+
+static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext8u_tl(t, src2);
+    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
+    tcg_temp_free(t);
+}
+
+static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
+{
+    TCGv t = tcg_temp_new();
+    tcg_gen_ext16s_tl(t, src2);
+    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
+    tcg_temp_free(t);
+}
+
+static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
+{
+    REQUIRE_ZBKB(ctx);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    gen_helper_brev8(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_pack(DisasContext *ctx, arg_pack *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_pack);
+}
+
+static bool trans_packh(DisasContext *ctx, arg_packh *a)
+{
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_packh);
+}
+
+static bool trans_packw(DisasContext *ctx, arg_packw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBKB(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_packw);
+}
+
+static bool trans_unzip(DisasContext *ctx, arg_unzip *a)
+{
+    REQUIRE_ZBKB(ctx);
+    REQUIRE_32BIT(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    gen_helper_unzip(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_zip(DisasContext *ctx, arg_zip *a)
+{
+    REQUIRE_ZBKB(ctx);
+    REQUIRE_32BIT(ctx);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    gen_helper_zip(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_xperm4(DisasContext *ctx, arg_xperm4 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm4);
+}
+
+static bool trans_xperm8(DisasContext *ctx, arg_xperm8 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm8);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..c319707a6f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -374,6 +374,13 @@ EX_SH(12)
     }                              \
 } while (0)
 
+#define REQUIRE_EITHER_EXT(ctx, A, B) do {       \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_##A &&      \
+        !RISCV_CPU(ctx->cs)->cfg.ext_##B) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static int ex_rvc_register(DisasContext *ctx, int reg)
 {
     return 8 + reg;
-- 
2.17.1


