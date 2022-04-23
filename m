Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni5ci-0000Jh-Mn
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 22:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cc-0008NK-ER; Fri, 22 Apr 2022 22:35:42 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39866 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cX-00058T-Hx; Fri, 22 Apr 2022 22:35:42 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABX0+DqZWNiSogjAA--.1876S9;
 Sat, 23 Apr 2022 10:35:29 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
Date: Sat, 23 Apr 2022 10:35:03 +0800
Message-Id: <20220423023510.30794-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
References: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABX0+DqZWNiSogjAA--.1876S9
X-Coremail-Antispam: 1UD129KBjvJXoW3Kr1DWrWUtryrCrW7CryxAFb_yoWDAFWkpF
 4FkrWjyrWUJFWfXan3KF15Jw1xZwnag34UAFWfKr1S9ayrJFZ5Xr1UG3yakFs5W3WDurWY
 kF4DArW7Aay2qFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Apr 2022 02:35:42 -0000

 - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, aes64ks1i instructions

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/crypto_helper.c            | 169 ++++++++++++++++++++++++
 target/riscv/helper.h                   |   8 ++
 target/riscv/insn32.decode              |  12 ++
 target/riscv/insn_trans/trans_rvk.c.inc |  54 ++++++++
 4 files changed, 243 insertions(+)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 220d51c742..cb4783a1e9 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -102,4 +102,173 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
 {
     return aes32_operation(shamt, rs1, rs2, false, false);
 }
+
+#define BY(X, I) ((X >> (8 * I)) & 0xFF)
+
+#define AES_SHIFROWS_LO(RS1, RS2) ( \
+    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
+
+#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
+    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
+
+#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
+    BY(COL, B3) ^ BY(COL, B2) ^ AES_GFMUL(BY(COL, B1), 3) ^ \
+    AES_GFMUL(BY(COL, B0), 2))
+
+#define AES_MIXCOLUMN(COL) ( \
+    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_MIXBYTE(COL, 1, 2, 3, 0) << 8 | AES_MIXBYTE(COL, 0, 1, 2, 3) << 0)
+
+#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
+    AES_GFMUL(BY(COL, B3), 0x9) ^ AES_GFMUL(BY(COL, B2), 0xd) ^ \
+    AES_GFMUL(BY(COL, B1), 0xb) ^ AES_GFMUL(BY(COL, B0), 0xe))
+
+#define AES_INVMIXCOLUMN(COL) ( \
+    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
+    AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
+
+static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
+                                           bool enc, bool mix)
+{
+    uint64_t RS1 = rs1;
+    uint64_t RS2 = rs2;
+    uint64_t result;
+    uint64_t temp;
+    uint32_t col_0;
+    uint32_t col_1;
+
+    if (enc) {
+        temp = AES_SHIFROWS_LO(RS1, RS2);
+        temp = (((uint64_t)AES_sbox[(temp >> 0) & 0xFF] << 0) |
+                ((uint64_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
+                ((uint64_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
+                ((uint64_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
+                ((uint64_t)AES_sbox[(temp >> 32) & 0xFF] << 32) |
+                ((uint64_t)AES_sbox[(temp >> 40) & 0xFF] << 40) |
+                ((uint64_t)AES_sbox[(temp >> 48) & 0xFF] << 48) |
+                ((uint64_t)AES_sbox[(temp >> 56) & 0xFF] << 56));
+        if (mix) {
+            col_0 = temp & 0xFFFFFFFF;
+            col_1 = temp >> 32;
+
+            col_0 = AES_MIXCOLUMN(col_0);
+            col_1 = AES_MIXCOLUMN(col_1);
+
+            result = ((uint64_t)col_1 << 32) | col_0;
+        } else {
+            result = temp;
+        }
+    } else {
+        temp = AES_INVSHIFROWS_LO(RS1, RS2);
+        temp = (((uint64_t)AES_isbox[(temp >> 0) & 0xFF] << 0) |
+                ((uint64_t)AES_isbox[(temp >> 8) & 0xFF] << 8) |
+                ((uint64_t)AES_isbox[(temp >> 16) & 0xFF] << 16) |
+                ((uint64_t)AES_isbox[(temp >> 24) & 0xFF] << 24) |
+                ((uint64_t)AES_isbox[(temp >> 32) & 0xFF] << 32) |
+                ((uint64_t)AES_isbox[(temp >> 40) & 0xFF] << 40) |
+                ((uint64_t)AES_isbox[(temp >> 48) & 0xFF] << 48) |
+                ((uint64_t)AES_isbox[(temp >> 56) & 0xFF] << 56));
+        if (mix) {
+            col_0 = temp & 0xFFFFFFFF;
+            col_1 = temp >> 32;
+
+            col_0 = AES_INVMIXCOLUMN(col_0);
+            col_1 = AES_INVMIXCOLUMN(col_1);
+
+            result = ((uint64_t)col_1 << 32) | col_0;
+        } else {
+            result = temp;
+        }
+    }
+
+    return result;
+}
+
+target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, true, true);
+}
+
+target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, true, false);
+}
+
+target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, false, false);
+}
+
+target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, false, true);
+}
+
+target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)
+{
+    uint64_t RS1 = rs1;
+    uint64_t RS2 = rs2;
+    uint32_t rs1_hi = RS1 >> 32;
+    uint32_t rs2_lo = RS2;
+    uint32_t rs2_hi = RS2 >> 32;
+
+    uint32_t r_lo = (rs1_hi ^ rs2_lo);
+    uint32_t r_hi = (rs1_hi ^ rs2_lo ^ rs2_hi);
+    target_ulong result = ((uint64_t)r_hi << 32) | r_lo;
+
+    return result;
+}
+
+target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
+{
+    uint64_t RS1 = rs1;
+    static const uint8_t round_consts[10] = {
+        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
+    };
+
+    uint8_t enc_rnum = rnum;
+    uint32_t temp = (RS1 >> 32) & 0xFFFFFFFF;
+    uint8_t rcon_ = 0;
+    target_ulong result;
+
+    if (enc_rnum != 0xA) {
+        temp = ror32(temp, 8); /* Rotate right by 8 */
+        rcon_ = round_consts[enc_rnum];
+    }
+
+    temp = ((uint32_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
+           ((uint32_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
+           ((uint32_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
+           ((uint32_t)AES_sbox[(temp >> 0) & 0xFF] << 0);
+
+    temp ^= rcon_;
+
+    result = ((uint64_t)temp << 32) | temp;
+
+    return result;
+}
+
+target_ulong HELPER(aes64im)(target_ulong rs1)
+{
+    uint64_t RS1 = rs1;
+    uint32_t col_0 = RS1 & 0xFFFFFFFF;
+    uint32_t col_1 = RS1 >> 32;
+    target_ulong result;
+
+    col_0 = AES_INVMIXCOLUMN(col_0);
+    col_1 = AES_INVMIXCOLUMN(col_1);
+
+    result = ((uint64_t)col_1 << 32) | col_0;
+
+    return result;
+}
 #undef sext32_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3c4e7e6113..56519fcc26 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1118,3 +1118,11 @@ DEF_HELPER_FLAGS_3(aes32esmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(aes32esi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(aes32dsmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(aes32dsi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+DEF_HELPER_FLAGS_2(aes64esm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64es, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64ds, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64dsm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64ks2, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(aes64ks1i, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 0f2e661583..0b800b4093 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -36,6 +36,7 @@
 %imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
 %imm_u    12:s20                 !function=ex_shift_12
 %imm_bs   30:2                   !function=ex_shift_3
+%imm_rnum 20:4
 
 # Argument sets:
 &empty
@@ -92,6 +93,7 @@
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
 @k_aes   .. ..... ..... .....  ... ..... ....... &k_aes  shamt=%imm_bs   %rs2 %rs1 %rd
+@i_aes   .. ..... ..... .....  ... ..... ....... &i      imm=%imm_rnum        %rs1 %rd
 
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
@@ -842,6 +844,16 @@ hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
 # *** RV32 Zknd Standard Extension ***
 aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
 aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV64 Zknd Standard Extension ***
+aes64dsm    00 11111 ..... ..... 000 ..... 0110011 @r
+aes64ds     00 11101 ..... ..... 000 ..... 0110011 @r
+aes64im     00 11000 00000 ..... 001 ..... 0010011 @r2
 # *** RV32 Zkne Standard Extension ***
 aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
 aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV64 Zkne Standard Extension ***
+aes64es     00 11001 ..... ..... 000 ..... 0110011 @r
+aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
+# *** RV64 Zkne/zknd Standard Extension ***
+aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
+aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 @i_aes
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index 8d0b42106f..6336b48cb5 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -69,3 +69,57 @@ static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
     REQUIRE_ZKND(ctx);
     return gen_aes32_sm4(ctx, a, gen_helper_aes32dsi);
 }
+
+static bool trans_aes64es(DisasContext *ctx, arg_aes64es *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64es, NULL);
+}
+
+static bool trans_aes64esm(DisasContext *ctx, arg_aes64esm *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64esm, NULL);
+}
+
+static bool trans_aes64ds(DisasContext *ctx, arg_aes64ds *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64ds, NULL);
+}
+
+static bool trans_aes64dsm(DisasContext *ctx, arg_aes64dsm *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64dsm, NULL);
+}
+
+static bool trans_aes64ks2(DisasContext *ctx, arg_aes64ks2 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_aes64ks2, NULL);
+}
+
+static bool trans_aes64ks1i(DisasContext *ctx, arg_aes64ks1i *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+
+    if (a->imm > 0xA) {
+        return false;
+    }
+
+    return gen_arith_imm_tl(ctx, a, EXT_NONE, gen_helper_aes64ks1i, NULL);
+}
+
+static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_helper_aes64im);
+}
-- 
2.17.1


