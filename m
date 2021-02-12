Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAaLe-00030P-Qs
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 10:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaLc-0002xS-SJ; Fri, 12 Feb 2021 10:27:08 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lAaLU-0005k4-Of; Fri, 12 Feb 2021 10:27:08 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436293|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00365088-7.57492e-05-0.996273;
 FP=11549458540173723280|1|1|1|0|-1|-1|-1; HT=ay29a033018047202;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.JYGrFHl_1613142312; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JYGrFHl_1613142312)
 by smtp.aliyun-inc.com(10.147.42.22); Fri, 12 Feb 2021 23:05:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, alistair23@gmail.com,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH 01/38] target/riscv: implementation-defined constant parameters
Date: Fri, 12 Feb 2021 23:02:19 +0800
Message-Id: <20210212150256.885-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212150256.885-1-zhiwei_liu@c-sky.com>
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2021 15:27:09 -0000

ext_p64 is whether to support Zp64 extension in RV32, default value is true.
pext_ver is the packed specification version, default value is v0.9.2.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c       | 29 +++++++++++++++++++++++++++++
 target/riscv/cpu.h       |  6 ++++++
 target/riscv/translate.c |  2 ++
 3 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a34238..1b99f629ec 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -132,6 +132,11 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
+static void set_pext_version(CPURISCVState *env, int pext_ver)
+{
+    env->pext_ver = pext_ver;
+}
+
 static void set_feature(CPURISCVState *env, int feature)
 {
     env->features |= (1ULL << feature);
@@ -380,6 +385,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
     int vext_version = VEXT_VERSION_0_07_1;
+    int pext_version = PEXT_VERSION_0_09_2;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
@@ -404,6 +410,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     set_priv_version(env, priv_version);
     set_vext_version(env, vext_version);
+    set_pext_version(env, pext_version);
 
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
@@ -511,6 +518,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_p) {
+            target_misa |= RVP;
+            if (cpu->cfg.pext_spec) {
+                if (!g_strcmp0(cpu->cfg.pext_spec, "v0.9.2")) {
+                    pext_version = PEXT_VERSION_0_09_2;
+                } else {
+                    error_setg(errp,
+                               "Unsupported packed spec version '%s'",
+                               cpu->cfg.pext_spec);
+                    return;
+                }
+            } else {
+                qemu_log("packed verison is not specified, "
+                         "use the default value v0.9.2\n");
+            }
+            if (!cpu->cfg.ext_p64 && env->misa == RV64) {
+                error_setg(errp, "For RV64, the Zp64 instructions will be "
+                                 "included in the baseline P extension.");
+                return;
+            }
+            set_pext_version(env, pext_version);
+        }
 
         set_misa(env, target_misa);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02758ae0eb..f458722646 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -68,6 +68,7 @@
 #define RVF RV('F')
 #define RVD RV('D')
 #define RVV RV('V')
+#define RVP RV('P')
 #define RVC RV('C')
 #define RVS RV('S')
 #define RVU RV('U')
@@ -87,6 +88,7 @@ enum {
 #define PRIV_VERSION_1_11_0 0x00011100
 
 #define VEXT_VERSION_0_07_1 0x00000701
+#define PEXT_VERSION_0_09_2 0x00000902
 
 enum {
     TRANSLATE_SUCCESS,
@@ -134,6 +136,7 @@ struct CPURISCVState {
 
     target_ulong priv_ver;
     target_ulong vext_ver;
+    target_ulong pext_ver;
     target_ulong misa;
     target_ulong misa_mask;
 
@@ -288,13 +291,16 @@ struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
+        bool ext_p;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_p64;
 
         char *priv_spec;
         char *user_spec;
         char *vext_spec;
+        char *pext_spec;
         uint16_t vlen;
         uint16_t elen;
         bool mmu;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0f28b5f41e..eb810efec6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -56,6 +56,7 @@ typedef struct DisasContext {
        to reset this known value.  */
     int frm;
     bool ext_ifencei;
+    bool ext_p64;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -824,6 +825,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->ext_p64 = cpu->cfg.ext_p64;
     ctx->cs = cs;
 }
 
-- 
2.17.1


