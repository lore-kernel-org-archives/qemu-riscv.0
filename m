Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntMYD-00051Q-Vs
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 00:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ntMYC-00051E-Iw; Tue, 24 May 2022 00:53:44 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:52954 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ntMY9-0004Bt-Ef; Tue, 24 May 2022 00:53:44 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAAnL4fJZIxiHf8DCg--.18894S2;
 Tue, 24 May 2022 12:53:31 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2] target/riscv: add support for zmmul extension v0.1
Date: Tue, 24 May 2022 12:53:20 +0800
Message-Id: <20220524045320.18606-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAAnL4fJZIxiHf8DCg--.18894S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw43Gw1fGFyfWrWDtw1fZwb_yoWrCFW8pr
 W8WrW7tF4UtFyfAayfJF1qqF1xGanag3yxt39avw4kGF4fCrZ8XF1DK3yakr15JFWkZF13
 C3WUAF98X3yjqa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
 wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
 k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
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
X-List-Received-Date: Tue, 24 May 2022 04:53:44 -0000

 - includes all multiplication operations for M extension

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

v2:
* disable M when both M and Zmmul are enabled
 
---
 target/riscv/cpu.c                      |  7 +++++++
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e373c61ba2..aec6882c5f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -598,6 +598,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_ifencei = true;
         }
 
+        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
+            warn_report("Zmmul will override M");
+            cpu->cfg.ext_m = false;
+        }
+
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
@@ -903,6 +908,7 @@ static Property riscv_cpu_properties[] = {
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
+    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
@@ -1027,6 +1033,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
      *    extensions by an underscore.
      */
     struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5ff7294c6..68177eae12 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -405,6 +405,7 @@ struct RISCVCPUConfig {
     bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
+    bool ext_zmmul;
 
     uint32_t mvendorid;
     uint64_t marchid;
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 16b029edf0..ec7f705aab 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -18,6 +18,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
+    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
+        return false;                                     \
+    }                                                     \
+} while (0)
+
 static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
 {
     TCGv tmpl = tcg_temp_new();
@@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128);
 }
 
@@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
                             gen_mulh_i128);
 }
@@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu_w,
                             gen_mulhsu_i128);
 }
@@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     /* gen_mulh_w works for either sign as input. */
     return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
                             gen_mulhu_i128);
@@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu *a)
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
     REQUIRE_64_OR_128BIT(ctx);
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     ctx->ol = MXL_RV32;
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
 }
@@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 static bool trans_muld(DisasContext *ctx, arg_muld *a)
 {
     REQUIRE_128BIT(ctx);
-    REQUIRE_EXT(ctx, RVM);
+    REQUIRE_M_OR_ZMMUL(ctx);
     ctx->ol = MXL_RV64;
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
 }
-- 
2.17.1


