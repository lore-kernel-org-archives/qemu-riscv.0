Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni5kd-0006TE-CF
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 22:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5kb-0006MT-QV; Fri, 22 Apr 2022 22:43:57 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:40876 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5kY-0006Jc-J0; Fri, 22 Apr 2022 22:43:57 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABX0+DqZWNiSogjAA--.1876S13;
 Sat, 23 Apr 2022 10:35:32 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 11/14] target/riscv: rvk: add support for zksed/zksh
 extension
Date: Sat, 23 Apr 2022 10:35:07 +0800
Message-Id: <20220423023510.30794-12-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
References: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABX0+DqZWNiSogjAA--.1876S13
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyUuw4ktr45Cr1kWFWrAFb_yoW7Jw15pF
 1FkrW7CFW8JFyfZayftF15Z343Ars3uryjva9ay34rWayYq395Jw1jyw4akr45XFykur1j
 kayDAFyayF4Iq3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
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
X-List-Received-Date: Sat, 23 Apr 2022 02:43:58 -0000

 - add sm3p0, sm3p1, sm4ed and sm4ks instructions

Co-authored-by: Ruibo Lu <luruibo2000@163.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index 56519fcc26..4ef3b2251d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1126,3 +1126,6 @@ DEF_HELPER_FLAGS_2(aes64dsm, TCG_CALL_NO_RWG_SE, tl, tl, tl)
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
index 8274b5a364..90f4eeff60 100644
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
@@ -331,3 +343,49 @@ static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
     REQUIRE_ZKNH(ctx);
     return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 14, 18, 41);
 }
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
+    return gen_aes32_sm4(ctx, a, gen_helper_sm4ed);
+}
+
+static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
+{
+    REQUIRE_ZKSED(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_sm4ks);
+}
-- 
2.17.1


