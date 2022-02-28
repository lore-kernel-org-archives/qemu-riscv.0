Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOhR5-0002M5-UF
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 09:55:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOhQy-0002JO-5F; Mon, 28 Feb 2022 09:55:33 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:59420 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOhQv-0004Wb-DR; Mon, 28 Feb 2022 09:55:31 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowADHzfHl4BxirdTdAQ--.5182S13;
 Mon, 28 Feb 2022 22:49:20 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v7 11/14] target/riscv: rvk: add support for zksed/zksh
 extension
Date: Mon, 28 Feb 2022 22:48:07 +0800
Message-Id: <20220228144810.7284-12-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowADHzfHl4BxirdTdAQ--.5182S13
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyUuw4ktr45Cr1kWFWrAFb_yoWrKw1DpF
 1FkrWUWFW8JFyfZa1ftF15Jw13Ars3uFyjv393t34rGayYqrWrAw1jyw4akr45XF95uryj
 ka1DAFyakr4IqaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
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
X-List-Received-Date: Mon, 28 Feb 2022 14:55:37 -0000

 - add sm3p0, sm3p1, sm4ed and sm4ks instructions

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/crypto_helper.c            | 28 ++++++++++++
 target/riscv/helper.h                   |  3 ++
 target/riscv/insn32.decode              |  6 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 58 +++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index cb4783a1e9..2ef30281b1 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -271,4 +271,32 @@ target_ulong HELPER(aes64im)(target_ulong rs1)
 
     return result;
 }
+
+target_ulong HELPER(sm4ed)(target_ulong rs1, target_ulong rs2,
+                           target_ulong shamt)
+{
+    uint32_t sb_in = (uint8_t)(rs2 >> shamt);
+    uint32_t sb_out = (uint32_t)sm4_sbox[sb_in];
+
+    uint32_t x = sb_out ^ (sb_out << 8) ^ (sb_out << 2) ^ (sb_out << 18) ^
+                 ((sb_out & 0x3f) << 26) ^ ((sb_out & 0xC0) << 10);
+
+    uint32_t rotl = rol32(x, shamt);
+
+    return sext32_xlen(rotl ^ (uint32_t)rs1);
+}
+
+target_ulong HELPER(sm4ks)(target_ulong rs1, target_ulong rs2,
+                           target_ulong shamt)
+{
+    uint32_t sb_in = (uint8_t)(rs2 >> shamt);
+    uint32_t sb_out = sm4_sbox[sb_in];
+
+    uint32_t x = sb_out ^ ((sb_out & 0x07) << 29) ^ ((sb_out & 0xFE) << 7) ^
+                 ((sb_out & 0x01) << 23) ^ ((sb_out & 0xF8) << 13);
+
+    uint32_t rotl = rol32(x, shamt);
+
+    return sext32_xlen(rotl ^ (uint32_t)rs1);
+}
 #undef sext32_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 0df0a05b11..863e0edd84 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1129,3 +1129,6 @@ DEF_HELPER_FLAGS_2(aes64dsm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(aes64ks2, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(aes64ks1i, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
+
+DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d9ebb138d1..4033565393 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -873,3 +873,9 @@ sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
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
index 3fe2d32e19..f6a331918a 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -35,6 +35,18 @@
     }                                           \
 } while (0)
 
+#define REQUIRE_ZKSED(ctx) do {                 \
+    if (!ctx->cfg_ptr->ext_zksed) {             \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKSH(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zksh) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
 static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
                           void (*func)(TCGv, TCGv, TCGv, TCGv))
 {
@@ -244,3 +256,49 @@ GEN_SHA512_RV64(sha512sig0, shri, 1, 8, 7)
 GEN_SHA512_RV64(sha512sig1, shri, 19, 61, 6)
 GEN_SHA512_RV64(sha512sum0, rotri, 28, 34, 39)
 GEN_SHA512_RV64(sha512sum1, rotri, 14, 18, 41)
+
+/* SM3 */
+static bool gen_sm3(DisasContext *ctx, arg_r2 *a, int32_t b, int32_t c)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv_i32 t0 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t0, src1);
+    tcg_gen_rotli_i32(t1, t0, b);
+    tcg_gen_xor_i32(t1, t0, t1);
+    tcg_gen_rotli_i32(t0, t0, c);
+    tcg_gen_xor_i32(t1, t1, t0);
+    tcg_gen_ext_i32_tl(dest, t1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free_i32(t0);
+    tcg_temp_free_i32(t1);
+    return true;
+}
+
+static bool trans_sm3p0(DisasContext *ctx, arg_sm3p0 *a)
+{
+    REQUIRE_ZKSH(ctx);
+    return gen_sm3(ctx, a, 9, 17);
+}
+
+static bool trans_sm3p1(DisasContext *ctx, arg_sm3p1 *a)
+{
+    REQUIRE_ZKSH(ctx);
+    return gen_sm3(ctx, a, 15, 23);
+}
+
+/* SM4 */
+static bool trans_sm4ed(DisasContext *ctx, arg_sm4ed *a)
+{
+    REQUIRE_ZKSED(ctx);
+    return gen_aes32_sm4(ctx, a , gen_helper_sm4ed);
+}
+
+static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
+{
+    REQUIRE_ZKSED(ctx);
+    return gen_aes32_sm4(ctx, a , gen_helper_sm4ks);
+}
-- 
2.17.1


