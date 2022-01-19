Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9IY-0001lj-OM
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:38:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9II-0001JP-Qx; Wed, 19 Jan 2022 06:38:27 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:60316 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IE-0002Ic-CV; Wed, 19 Jan 2022 06:38:26 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnblof+Odh7EjABQ--.19898S9;
 Wed, 19 Jan 2022 19:38:17 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v5 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
Date: Wed, 19 Jan 2022 19:37:47 +0800
Message-Id: <20220119113754.20323-8-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABnblof+Odh7EjABQ--.19898S9
X-Coremail-Antispam: 1UD129KBjvJXoWxuw18JrWxJr18tw1UZw1rCrg_yoWftw4rpr
 4FkrW7JrWUGFWfXa1Skr15Cw13ZFnagryUG3yfK3WSka1rtrZ5Xr1UJ3yayFs5GFyDWrWY
 kFs8Aay7AayIqFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 11:38:29 -0000

 - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, aes64ks1i instructions

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/crypto_helper.c            | 136 ++++++++++++++++++++++++
 target/riscv/helper.h                   |   8 ++
 target/riscv/insn32.decode              |  11 ++
 target/riscv/insn_trans/trans_rvk.c.inc | 102 ++++++++++++++++++
 4 files changed, 257 insertions(+)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index f5a5909538..9e56668627 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -136,4 +136,140 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
 {
     return aes32_operation(bs, rs1, rs2, false, false);
 }
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
+    uint8_t round_consts[10] = {
+        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
+    };
+
+    uint8_t enc_rnum = rnum;
+    uint32_t temp = (RS1 >> 32) & 0xFFFFFFFF;
+    uint8_t rcon_ = 0;
+    target_ulong result;
+
+    if (enc_rnum != 0xA) {
+        temp = (temp >> 8) | (temp << 24); /* Rotate right by 8 */
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
 #undef sext_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ab3cf407c1..2446ec22ea 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1121,3 +1121,11 @@ DEF_HELPER_3(aes32esmi, tl, tl, tl, tl)
 DEF_HELPER_3(aes32esi, tl, tl, tl, tl)
 DEF_HELPER_3(aes32dsmi, tl, tl, tl, tl)
 DEF_HELPER_3(aes32dsi, tl, tl, tl, tl)
+
+DEF_HELPER_2(aes64esm, tl, tl, tl)
+DEF_HELPER_2(aes64es, tl, tl, tl)
+DEF_HELPER_2(aes64ds, tl, tl, tl)
+DEF_HELPER_2(aes64dsm, tl, tl, tl)
+DEF_HELPER_2(aes64ks2, tl, tl, tl)
+DEF_HELPER_2(aes64ks1i, tl, tl, tl)
+DEF_HELPER_1(aes64im, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index dcd4b4adbf..001b649c40 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -20,6 +20,7 @@
 %bs        30:2
 %rs3       27:5
 %rs2       20:5
+%rnum      20:4
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
@@ -833,6 +834,16 @@ fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
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
+aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 %rnum %rs1 %rd
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index 9cb40dd0e5..224cd860a4 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -45,6 +45,20 @@ static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
     return true;
 }
 
+static bool trans_aes64esm(DisasContext *ctx, arg_aes64esm *a)
+{
+    REQUIRE_ZKNE(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64esm(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
 static bool trans_aes32esi(DisasContext *ctx, arg_aes32esi *a)
 {
     REQUIRE_ZKNE(ctx);
@@ -61,6 +75,20 @@ static bool trans_aes32esi(DisasContext *ctx, arg_aes32esi *a)
     return true;
 }
 
+static bool trans_aes64es(DisasContext *ctx, arg_aes64es *a)
+{
+    REQUIRE_ZKNE(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64es(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
 static bool trans_aes32dsmi(DisasContext *ctx, arg_aes32dsmi *a)
 {
     REQUIRE_ZKND(ctx);
@@ -77,6 +105,34 @@ static bool trans_aes32dsmi(DisasContext *ctx, arg_aes32dsmi *a)
     return true;
 }
 
+static bool trans_aes64dsm(DisasContext *ctx, arg_aes64dsm *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64dsm(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_aes64ks2(DisasContext *ctx, arg_aes64ks2 *a)
+{
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64ks2(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
 static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
 {
     REQUIRE_ZKND(ctx);
@@ -92,3 +148,49 @@ static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
     tcg_temp_free(bs);
     return true;
 }
+
+static bool trans_aes64ds(DisasContext *ctx, arg_aes64ds *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64ds(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_aes64ks1i(DisasContext *ctx, arg_aes64ks1i *a)
+{
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+
+    if (a->rnum > 0xA) {
+        return false;
+    }
+
+    TCGv rnum = tcg_const_tl(a->rnum);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_aes64ks1i(dest, src1, rnum);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(rnum);
+    return true;
+}
+
+static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_aes64im(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
-- 
2.17.1


