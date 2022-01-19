Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9IW-0001f9-JD
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:38:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IJ-0001Jq-P1; Wed, 19 Jan 2022 06:38:29 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:60358 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IG-0002J3-9a; Wed, 19 Jan 2022 06:38:26 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnblof+Odh7EjABQ--.19898S10;
 Wed, 19 Jan 2022 19:38:18 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v5 08/14] target/riscv: rvk: add support for sha256
 related instructions in zknh extension
Date: Wed, 19 Jan 2022 19:37:48 +0800
Message-Id: <20220119113754.20323-9-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABnblof+Odh7EjABQ--.19898S10
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW7Ar4fCw18WFy7uFW8tFb_yoWrZr1kpr
 4rKrWfGrWUGFWSva1fK3W5Gr13Ar4furyUtws3tw1Ika1fXrZ5Xr1qqw4akr4UXFyDur1Y
 kayDCFyakr4Fqa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

 - add sha256sig0, sha256sig1, sha256sum0 and sha256sum1 instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/crypto_helper.c            | 31 +++++++++++++
 target/riscv/helper.h                   |  5 +++
 target/riscv/insn32.decode              |  5 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 58 +++++++++++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 9e56668627..f5ffc262f2 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -272,4 +272,35 @@ target_ulong HELPER(aes64im)(target_ulong rs1)
 
     return result;
 }
+
+#define ROR32(a, amt) ((a << (-amt & 31)) | (a >> (amt & 31)))
+
+target_ulong HELPER(sha256sig0)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 7) ^ ROR32(a, 18) ^ (a >> 3));
+}
+
+target_ulong HELPER(sha256sig1)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 17) ^ ROR32(a, 19) ^ (a >> 10));
+}
+
+target_ulong HELPER(sha256sum0)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 2) ^ ROR32(a, 13) ^ ROR32(a, 22));
+}
+
+target_ulong HELPER(sha256sum1)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+
+    return sext_xlen(ROR32(a, 6) ^ ROR32(a, 11) ^ ROR32(a, 25));
+}
+#undef ROR32
 #undef sext_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 2446ec22ea..c0368187fa 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1129,3 +1129,8 @@ DEF_HELPER_2(aes64dsm, tl, tl, tl)
 DEF_HELPER_2(aes64ks2, tl, tl, tl)
 DEF_HELPER_2(aes64ks1i, tl, tl, tl)
 DEF_HELPER_1(aes64im, tl, tl)
+
+DEF_HELPER_1(sha256sig0, tl, tl)
+DEF_HELPER_1(sha256sig1, tl, tl)
+DEF_HELPER_1(sha256sum0, tl, tl)
+DEF_HELPER_1(sha256sum1, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 001b649c40..26d0e3a858 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -847,3 +847,8 @@ aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
 # *** RV64 Zkne/zknd Standard Extension ***
 aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
 aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 %rnum %rs1 %rd
+# *** RV32 Zknh Standard Extension ***
+sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
+sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
+sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
+sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
index 224cd860a4..3a6812a46a 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -29,6 +29,12 @@
     }                                           \
 } while (0)
 
+#define REQUIRE_ZKNH(ctx) do {                  \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zknh) {    \
+        return false;                           \
+    }                                           \
+} while (0)
+
 static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
 {
     REQUIRE_ZKNE(ctx);
@@ -194,3 +200,55 @@ static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
 
     return true;
 }
+
+static bool trans_sha256sig0(DisasContext *ctx, arg_sha256sig0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sig0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sig1(DisasContext *ctx, arg_sha256sig1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sig1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sum0(DisasContext *ctx, arg_sha256sum0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sum0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sum1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
-- 
2.17.1


