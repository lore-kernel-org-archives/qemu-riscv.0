Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfYJN-0005Gk-40
	for mharc-qemu-riscv@gnu.org; Fri, 15 Apr 2022 22:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nfYJK-00059X-3y; Fri, 15 Apr 2022 22:37:18 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:57252 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nfYJF-0001Pk-JM; Fri, 15 Apr 2022 22:37:17 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAC34I7MK1pi9AtRAg--.25370S6;
 Sat, 16 Apr 2022 10:37:04 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v10 04/14] target/riscv: rvk: add support for zbkx extension
Date: Sat, 16 Apr 2022 10:35:39 +0800
Message-Id: <20220416023549.28463-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220416023549.28463-1-liweiwei@iscas.ac.cn>
References: <20220416023549.28463-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: qwCowAC34I7MK1pi9AtRAg--.25370S6
X-Coremail-Antispam: 1UD129KBjvJXoWxCFy8Jr1DXFy3Zr1fGw1xKrg_yoWrGry5pF
 4SkrW5GFWUJrWfXa1SyF45G3W3Jrsagr17Zws3tw1kta15JFZ5tr1qkw43KF45JFn09r4j
 9a1DA34ay3y8Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 16 Apr 2022 02:37:18 -0000

 - add xperm4 and xperm8 instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 +++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index e003e8b25b..b99c4a39a1 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -102,3 +102,30 @@ target_ulong HELPER(zip)(target_ulong rs1)
     x = do_shuf_stage(x, shuf_masks[0], shuf_masks[0] >> 1, 1);
     return x;
 }
+
+static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
+                                    uint32_t sz_log2)
+{
+    target_ulong r = 0;
+    target_ulong sz = 1LL << sz_log2;
+    target_ulong mask = (1LL << sz) - 1;
+    target_ulong pos;
+
+    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
+        pos = ((rs2 >> i) & mask) << sz_log2;
+        if (pos < sizeof(target_ulong) * 8) {
+            r |= ((rs1 >> pos) & mask) << i;
+        }
+    }
+    return r;
+}
+
+target_ulong HELPER(xperm4)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 2);
+}
+
+target_ulong HELPER(xperm8)(target_ulong rs1, target_ulong rs2)
+{
+    return do_xperm(rs1, rs2, 3);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 8a3a7615f2..cfead7abfc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -69,6 +69,8 @@ DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_1(brev8, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(unzip, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(zip, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_2(xperm4, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(xperm8, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 /* Floating Point - Half Precision */
 DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3a49acab37..75ffac9c81 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -776,6 +776,10 @@ clmulh     0000101 .......... 011 ..... 0110011 @r
 # *** RV32 extra Zbc Standard Extension ***
 clmulr     0000101 .......... 010 ..... 0110011 @r
 
+# *** RV32 Zbkx Standard Extension ***
+xperm4     0010100 .......... 010 ..... 0110011 @r
+xperm8     0010100 .......... 100 ..... 0110011 @r
+
 # *** RV32 Zbs Standard Extension ***
 bclr       0100100 .......... 001 ..... 0110011 @r
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 5a5751557d..e2b8329f1e 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -48,6 +48,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBKX(ctx) do {                   \
+    if (!ctx->cfg_ptr->ext_zbkx) {               \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
@@ -574,3 +580,15 @@ static bool trans_zip(DisasContext *ctx, arg_zip *a)
     REQUIRE_ZBKB(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_helper_zip);
 }
+
+static bool trans_xperm4(DisasContext *ctx, arg_xperm4 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm4, NULL);
+}
+
+static bool trans_xperm8(DisasContext *ctx, arg_xperm8 *a)
+{
+    REQUIRE_ZBKX(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_xperm8, NULL);
+}
-- 
2.17.1


