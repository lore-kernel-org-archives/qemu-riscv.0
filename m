Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nP1Bm-0007hu-R4
	for mharc-qemu-riscv@gnu.org; Tue, 01 Mar 2022 07:01:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nP1Aq-0007HV-HJ; Tue, 01 Mar 2022 07:00:13 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:35732 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nP1Ak-0007De-KK; Tue, 01 Mar 2022 07:00:12 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADHzsK4Ch5iwn2FAQ--.21639S11;
 Tue, 01 Mar 2022 20:00:02 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v8 09/14] target/riscv: rvk: add support for sha512 related
 instructions for RV32 in zknh extension
Date: Tue,  1 Mar 2022 19:58:23 +0800
Message-Id: <20220301115828.355-10-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220301115828.355-1-liweiwei@iscas.ac.cn>
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowADHzsK4Ch5iwn2FAQ--.21639S11
X-Coremail-Antispam: 1UD129KBjvJXoWxXF45AF1rurWkAFyxGrW8Crg_yoWrtF1xpF
 18K34UWF4ktFy5Aayftw15ZF43uFs7C3yjg3sxtw1rCFW5Ja1kG3y5C34a9rsIgF9F9Fy5
 AFWkCa45Kr1ft3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU
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
X-List-Received-Date: Tue, 01 Mar 2022 12:00:13 -0000

 - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, sha512sig0h and sha512sig1h instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/insn32.decode              |   6 ++
 target/riscv/insn_trans/trans_rvk.c.inc | 100 ++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index db28ecdd2b..02a0c71890 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -862,3 +862,9 @@ sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
 sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
 sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
 sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
+sha512sum0r 01 01000 ..... ..... 000 ..... 0110011 @r
+sha512sum1r 01 01001 ..... ..... 000 ..... 0110011 @r
+sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
+sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
+sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
+sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index beea7f8e96..bb89a53f52 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -167,3 +167,103 @@ static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
     REQUIRE_ZKNH(ctx);
     return gen_sha256(ctx, a, EXT_NONE, tcg_gen_rotri_i32, 6, 11, 25);
 }
+
+static bool gen_sha512_rv32(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                            void (*func1)(TCGv_i64, TCGv_i64, int64_t),
+                            void (*func2)(TCGv_i64, TCGv_i64, int64_t),
+                            int64_t num1, int64_t num2, int64_t num3)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = get_gpr(ctx, a->rs2, ext);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_concat_tl_i64(t0, src1, src2);
+    func1(t1, t0, num1);
+    func2(t2, t0, num2);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_rotri_i64(t2, t0, num3);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_trunc_i64_tl(dest, t1);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+    return true;
+}
+
+static bool trans_sha512sum0r(DisasContext *ctx, arg_sha512sum0r *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
+                           tcg_gen_rotli_i64, 25, 30, 28);
+}
+
+static bool trans_sha512sum1r(DisasContext *ctx, arg_sha512sum1r *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
+                           tcg_gen_rotri_i64, 23, 14, 18);
+}
+
+static bool trans_sha512sig0l(DisasContext *ctx, arg_sha512sig0l *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotri_i64,
+                           tcg_gen_rotri_i64, 1, 7, 8);
+}
+
+static bool trans_sha512sig1l(DisasContext *ctx, arg_sha512sig1l *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
+                           tcg_gen_rotri_i64, 3, 6, 19);
+}
+
+static bool gen_sha512h_rv32(DisasContext *ctx, arg_r *a, DisasExtend ext,
+                             void (*func)(TCGv_i64, TCGv_i64, int64_t),
+                             int64_t num1, int64_t num2, int64_t num3)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv src2 = get_gpr(ctx, a->rs2, ext);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_concat_tl_i64(t0, src1, src2);
+    func(t1, t0, num1);
+    tcg_gen_ext32u_i64(t2, t0);
+    tcg_gen_shri_i64(t2, t2, num2);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_rotri_i64(t2, t0, num3);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_trunc_i64_tl(dest, t1);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+    return true;
+}
+
+static bool trans_sha512sig0h(DisasContext *ctx, arg_sha512sig0h *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 1, 7, 8);
+}
+
+static bool trans_sha512sig1h(DisasContext *ctx, arg_sha512sig1h *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64, 3, 6, 19);
+}
-- 
2.17.1


