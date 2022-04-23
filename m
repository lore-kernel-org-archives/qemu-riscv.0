Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni5ci-0000I7-Dt
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 22:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cb-0008Lf-Re; Fri, 22 Apr 2022 22:35:41 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39860 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cX-00058O-26; Fri, 22 Apr 2022 22:35:41 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABX0+DqZWNiSogjAA--.1876S11;
 Sat, 23 Apr 2022 10:35:31 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 09/14] target/riscv: rvk: add support for sha512 related
 instructions for RV32 in zknh extension
Date: Sat, 23 Apr 2022 10:35:05 +0800
Message-Id: <20220423023510.30794-10-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
References: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABX0+DqZWNiSogjAA--.1876S11
X-Coremail-Antispam: 1UD129KBjvJXoWxXF45AF1rurWkAFyxGrW8Crg_yoWrKF43pF
 18K34UWF4kJFyrAay3tw15ZF43uFs7C3yjq3sxtwn5CFW5Ja1kG345C34a9rsxKF9FvFy5
 AFWkCa45trWft3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
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
X-List-Received-Date: Sat, 23 Apr 2022 02:35:42 -0000

 - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, sha512sig0h and sha512sig1h instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index 531e2c7cb3..9ed057a153 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -178,3 +178,103 @@ static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
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


