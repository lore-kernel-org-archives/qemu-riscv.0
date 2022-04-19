Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngd6Y-0005Nq-C0
	for mharc-qemu-riscv@gnu.org; Mon, 18 Apr 2022 21:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ngd6L-0005GY-52; Mon, 18 Apr 2022 21:56:21 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:53054 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ngd6I-0004Sv-Jd; Mon, 18 Apr 2022 21:56:20 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACnr0sPFV5iXeUSAw--.34873S12;
 Tue, 19 Apr 2022 09:49:13 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v11 10/14] target/riscv: rvk: add support for sha512 related
 instructions for RV64 in zknh extension
Date: Tue, 19 Apr 2022 09:48:43 +0800
Message-Id: <20220419014847.9722-11-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220419014847.9722-1-liweiwei@iscas.ac.cn>
References: <20220419014847.9722-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowACnr0sPFV5iXeUSAw--.34873S12
X-Coremail-Antispam: 1UD129KBjvJXoWxGryDCw1DKF1UXF1rJw1kKrg_yoW5Zw4rpF
 18G34UWFWkJryfAasxtr1UZF43uFs3C3y5t3sxtwn5Ca15Ja1kG3yYk3yakrsFqF9FvFyj
 kFWkCFy5KrWktwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
 JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
 0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
 JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
 A2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
 43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
 v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
 vjfUOBTYUUUUU
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
X-List-Received-Date: Tue, 19 Apr 2022 01:56:22 -0000

 - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 53 +++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

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
index 9ed057a153..8274b5a364 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -278,3 +278,56 @@ static bool trans_sha512sig1h(DisasContext *ctx, arg_sha512sig1h *a)
     REQUIRE_ZKNH(ctx);
     return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64, 3, 6, 19);
 }
+
+static bool gen_sha512_rv64(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
+                            void (*func)(TCGv_i64, TCGv_i64, int64_t),
+                            int64_t num1, int64_t num2, int64_t num3)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    tcg_gen_extu_tl_i64(t0, src1);
+    tcg_gen_rotri_i64(t1, t0, num1);
+    tcg_gen_rotri_i64(t2, t0, num2);
+    tcg_gen_xor_i64(t1, t1, t2);
+    func(t2, t0, num3);
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
+static bool trans_sha512sig0(DisasContext *ctx, arg_sha512sig0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_shri_i64, 1, 8, 7);
+}
+
+static bool trans_sha512sig1(DisasContext *ctx, arg_sha512sig1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_shri_i64, 19, 61, 6);
+}
+
+static bool trans_sha512sum0(DisasContext *ctx, arg_sha512sum0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 28, 34, 39);
+}
+
+static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv64(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 14, 18, 41);
+}
-- 
2.17.1


