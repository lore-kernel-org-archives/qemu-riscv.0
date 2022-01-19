Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9Iq-0002Dd-AZ
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:39:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9Ig-00027o-Ij; Wed, 19 Jan 2022 06:38:52 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:60444 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9Ie-0002KN-9R; Wed, 19 Jan 2022 06:38:50 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnblof+Odh7EjABQ--.19898S13;
 Wed, 19 Jan 2022 19:38:22 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v5 11/14] target/riscv: rvk: add support for zksed/zksh
 extension
Date: Wed, 19 Jan 2022 19:37:51 +0800
Message-Id: <20220119113754.20323-12-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABnblof+Odh7EjABQ--.19898S13
X-Coremail-Antispam: 1UD129KBjvJXoW3WrW3ZF1Uuw45uryUWF4rXwb_yoW7Ary3pr
 4rKrW3KayUGFWfAa1ftF15ury3XFsakFW0g393t340ka1FqrWkAr4Utw4akr45XFyDuryY
 kan8AFyjkr4Sq3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
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
X-List-Received-Date: Wed, 19 Jan 2022 11:38:54 -0000

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
index 71de6c96ac..fc8a4543cb 100644
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
index baebb987c9..a2dd460e81 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -863,3 +863,9 @@ sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
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
index 5614e37deb..32b202abb0 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -35,6 +35,18 @@
     }                                           \
 } while (0)
 
+#define REQUIRE_ZKSED(ctx) do {                 \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zksed) {   \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKSH(ctx) do {                  \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zksh) {    \
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


