Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOKdv-0000qF-MH
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 09:35:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKdu-0000nV-2D; Sun, 27 Feb 2022 09:35:22 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:36624 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKdr-0007fv-OX; Sun, 27 Feb 2022 09:35:21 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACX3sZLihti7HLGAQ--.65305S13;
 Sun, 27 Feb 2022 22:27:35 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 11/14] target/riscv: rvk: add support for zksed/zksh
 extension
Date: Sun, 27 Feb 2022 22:25:50 +0800
Message-Id: <20220227142553.25815-12-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowACX3sZLihti7HLGAQ--.65305S13
X-Coremail-Antispam: 1UD129KBjvJXoW3WrWfKw43ZF1kWF4kGr47XFb_yoW7Ar13pr
 4rKrW7KayUWFWfAa1ftF15ur13XFsakFy0g393J340ka1FqrZ5Ar4Utw4akr45XFyDury5
 Can8AFyYkr4fX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
 JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUQSdkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Sun, 27 Feb 2022 14:35:22 -0000

 - add sm3p0, sm3p1, sm4ed and sm4ks instructions

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/crypto_helper.c            | 49 +++++++++++++++++
 target/riscv/helper.h                   |  6 +++
 target/riscv/insn32.decode              |  6 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 72 +++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index fd50a034a3..d712854a9c 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -391,4 +391,53 @@ target_ulong HELPER(sha512sum1)(target_ulong rs1)
     return ROR64(a, 14) ^ ROR64(a, 18) ^ ROR64(a, 41);
 }
 #undef ROR64
+
+#define ROL32(a, amt) ((a >> (-amt & 31)) | (a << (amt & 31)))
+
+target_ulong HELPER(sm3p0)(target_ulong rs1)
+{
+    uint32_t src = rs1;
+    uint32_t result = src ^ ROL32(src, 9) ^ ROL32(src, 17);
+
+    return sext_xlen(result);
+}
+
+target_ulong HELPER(sm3p1)(target_ulong rs1)
+{
+    uint32_t src = rs1;
+    uint32_t result = src ^ ROL32(src, 15) ^ ROL32(src, 23);
+
+    return sext_xlen(result);
+}
+#undef ROL32
+
+target_ulong HELPER(sm4ed)(target_ulong rs2, target_ulong rt, target_ulong bs)
+{
+    uint8_t bs_t = bs;
+
+    uint32_t sb_in = (uint8_t)(rs2 >> (8 * bs_t));
+    uint32_t sb_out = (uint32_t)sm4_sbox[sb_in];
+
+    uint32_t linear = sb_out ^ (sb_out << 8) ^ (sb_out << 2) ^ (sb_out << 18) ^
+        ((sb_out & 0x3f) << 26) ^ ((sb_out & 0xC0) << 10);
+
+    uint32_t rotl = (linear << (8 * bs_t)) | (linear >> (32 - 8 * bs_t));
+
+    return sext_xlen(rotl ^ (uint32_t)rt);
+}
+
+target_ulong HELPER(sm4ks)(target_ulong rs2, target_ulong rs1, target_ulong bs)
+{
+    uint8_t bs_t = bs;
+
+    uint32_t sb_in = (uint8_t)(rs2 >> (8 * bs_t));
+    uint32_t sb_out = sm4_sbox[sb_in];
+
+    uint32_t x = sb_out ^ ((sb_out & 0x07) << 29) ^ ((sb_out & 0xFE) << 7) ^
+        ((sb_out & 0x01) << 23) ^ ((sb_out & 0xF8) << 13);
+
+    uint32_t rotl = (x << (8 * bs_t)) | (x >> (32 - 8 * bs_t));
+
+    return sext_xlen(rotl ^ (uint32_t)rs1);
+}
 #undef sext_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 393cca85b4..826eba032f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1146,3 +1146,9 @@ DEF_HELPER_1(sha512sig0, tl, tl)
 DEF_HELPER_1(sha512sig1, tl, tl)
 DEF_HELPER_1(sha512sum0, tl, tl)
 DEF_HELPER_1(sha512sum1, tl, tl)
+
+DEF_HELPER_1(sm3p0, tl, tl)
+DEF_HELPER_1(sm3p1, tl, tl)
+
+DEF_HELPER_3(sm4ed, tl, tl, tl, tl)
+DEF_HELPER_3(sm4ks, tl, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 592efda019..37c29da763 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -870,3 +870,9 @@ sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
 sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
 sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
 sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
+# *** RV32 Zksh Standard Extension ***
+sm3p0       00 01000 01000 ..... 001 ..... 0010011 @r2
+sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
+# *** RV32 Zksed Standard Extension ***
+sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
+sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index 2b3ac67afd..5b1770fe66 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -35,6 +35,18 @@
     }                                           \
 } while (0)
 
+#define REQUIRE_ZKSED(ctx) do {                 \
+    if (!ctx->cfg_ptr->ext_zksed) {   \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKSH(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zksh) {    \
+        return false;                           \
+    }                                           \
+} while (0)
+
 static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
 {
     REQUIRE_ZKNE(ctx);
@@ -398,3 +410,63 @@ static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
 
     return true;
 }
+
+/* SM3 */
+static bool trans_sm3p0(DisasContext *ctx, arg_sm3p0 *a)
+{
+    REQUIRE_ZKSH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sm3p0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sm3p1(DisasContext *ctx, arg_sm3p1 *a)
+{
+    REQUIRE_ZKSH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sm3p1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+/* SM4 */
+static bool trans_sm4ed(DisasContext *ctx, arg_sm4ed *a)
+{
+    REQUIRE_ZKSED(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sm4ed(dest, src2, src1, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
+
+static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
+{
+    REQUIRE_ZKSED(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sm4ks(dest, src2, src1, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
-- 
2.17.1


