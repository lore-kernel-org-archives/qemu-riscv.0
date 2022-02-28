Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOhLR-0002VC-Im
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 09:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOhLP-0002Pa-PN; Mon, 28 Feb 2022 09:49:48 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:58374 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOhLM-0002WU-Pc; Mon, 28 Feb 2022 09:49:46 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowADHzfHl4BxirdTdAQ--.5182S12;
 Mon, 28 Feb 2022 22:49:19 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v7 10/14] target/riscv: rvk: add support for sha512 related
 instructions for RV64 in zknh extension
Date: Mon, 28 Feb 2022 22:48:06 +0800
Message-Id: <20220228144810.7284-11-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowADHzfHl4BxirdTdAQ--.5182S12
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rJFWDGw4DXw4DurWkXrb_yoW5JFWfpr
 1rK345WFZ5JryfA343tF15Zr1UCFs7u3y5t3sxtwn5Way5Jay8Ja98K3y2grZrXF9FkFyU
 CFWkCFyUK34rJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-List-Received-Date: Mon, 28 Feb 2022 14:49:48 -0000

 - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn32.decode              |  5 ++++
 target/riscv/insn_trans/trans_rvk.c.inc | 32 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 02a0c71890..d9ebb138d1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -868,3 +868,8 @@ sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
 sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
 sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
 sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
+# *** RV64 Zknh Standard Extension ***
+sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
+sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
+sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
+sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index f1dccc13c8..3fe2d32e19 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -212,3 +212,35 @@ static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
 
 GEN_SHA512H_RV32(sha512sig0h, rotri, 1, 7, 8)
 GEN_SHA512H_RV32(sha512sig1h, rotli, 3, 6, 19)
+
+#define GEN_SHA512_RV64(NAME, OP, NUM1, NUM2, NUM3) \
+static void gen_##NAME(TCGv dest, TCGv src1) \
+{ \
+    TCGv_i64 t0 = tcg_temp_new_i64(); \
+    TCGv_i64 t1 = tcg_temp_new_i64(); \
+    TCGv_i64 t2 = tcg_temp_new_i64(); \
+    \
+    tcg_gen_extu_tl_i64(t0, src1); \
+    tcg_gen_rotri_i64(t1, t0, NUM1); \
+    tcg_gen_rotri_i64(t2, t0, NUM2); \
+    tcg_gen_xor_i64(t1, t1, t2); \
+    tcg_gen_##OP##_i64(t2, t0, NUM3); \
+    tcg_gen_xor_i64(t1, t1, t2); \
+    tcg_gen_trunc_i64_tl(dest, t1); \
+    \
+    tcg_temp_free_i64(t0); \
+    tcg_temp_free_i64(t1); \
+    tcg_temp_free_i64(t2); \
+} \
+\
+static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+{ \
+    REQUIRE_64BIT(ctx); \
+    REQUIRE_ZKNH(ctx); \
+    return gen_unary(ctx, a, EXT_NONE, gen_##NAME); \
+}
+
+GEN_SHA512_RV64(sha512sig0, shri, 1, 8, 7)
+GEN_SHA512_RV64(sha512sig1, shri, 19, 61, 6)
+GEN_SHA512_RV64(sha512sum0, rotri, 28, 34, 39)
+GEN_SHA512_RV64(sha512sum1, rotri, 14, 18, 41)
-- 
2.17.1


