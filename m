Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOKdy-0000yo-HF
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 09:35:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKdu-0000nW-GH; Sun, 27 Feb 2022 09:35:22 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:36628 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOKdr-0007fu-OW; Sun, 27 Feb 2022 09:35:22 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACX3sZLihti7HLGAQ--.65305S12;
 Sun, 27 Feb 2022 22:27:34 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 10/14] target/riscv: rvk: add support for sha512 related
 instructions for RV64 in zknh extension
Date: Sun, 27 Feb 2022 22:25:49 +0800
Message-Id: <20220227142553.25815-11-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowACX3sZLihti7HLGAQ--.65305S12
X-Coremail-Antispam: 1UD129KBjvJXoWxGryDCw45uFW8JFWkZrWrKrg_yoWrCr4fpF
 4rGryUKFWUJFy3Aa1ftF15ur17ZFsak3yrt393tw1vka1rJ3ykX39rtw43KF47XF9ruFyj
 kF4kCFyjkrsaq3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
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

 - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/crypto_helper.c            | 31 ++++++++++++++
 target/riscv/helper.h                   |  5 +++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 56 +++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 6cd2a92b86..fd50a034a3 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -360,4 +360,35 @@ target_ulong HELPER(sha512sig1h)(target_ulong rs1, target_ulong rs2)
     return sext_xlen(result);
 }
 #undef zext32
+
+#define ROR64(a, amt) ((a << (-amt & 63)) | (a >> (amt & 63)))
+
+target_ulong HELPER(sha512sig0)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+
+    return ROR64(a, 1) ^ ROR64(a, 8) ^ (a >> 7);
+}
+
+target_ulong HELPER(sha512sig1)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+
+    return ROR64(a, 19) ^ ROR64(a, 61) ^ (a >> 6);
+}
+
+target_ulong HELPER(sha512sum0)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+
+    return ROR64(a, 28) ^ ROR64(a, 34) ^ ROR64(a, 39);
+}
+
+target_ulong HELPER(sha512sum1)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+
+    return ROR64(a, 14) ^ ROR64(a, 18) ^ ROR64(a, 41);
+}
+#undef ROR64
 #undef sext_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 207d298fde..393cca85b4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1141,3 +1141,8 @@ DEF_HELPER_2(sha512sig0l, tl, tl, tl)
 DEF_HELPER_2(sha512sig0h, tl, tl, tl)
 DEF_HELPER_2(sha512sig1l, tl, tl, tl)
 DEF_HELPER_2(sha512sig1h, tl, tl, tl)
+
+DEF_HELPER_1(sha512sig0, tl, tl)
+DEF_HELPER_1(sha512sig1, tl, tl)
+DEF_HELPER_1(sha512sum0, tl, tl)
+DEF_HELPER_1(sha512sum1, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6064dadef8..592efda019 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -865,3 +865,8 @@ sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
 sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
 sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
 sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
+# *** RV64 Zknh Standard Extension ***
+sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
+sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
+sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
+sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index e56040d07b..2b3ac67afd 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -342,3 +342,59 @@ static bool trans_sha512sig1h(DisasContext *ctx, arg_sha512sig1h *a)
 
     return true;
 }
+
+static bool trans_sha512sig0(DisasContext *ctx, arg_sha512sig0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sig0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha512sig1(DisasContext *ctx, arg_sha512sig1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sig1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha512sum0(DisasContext *ctx, arg_sha512sum0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sum0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sum1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
-- 
2.17.1


