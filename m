Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg5Hc-0004Co-Lx
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 10:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pg5Hb-0004C5-Hr; Sat, 25 Mar 2023 10:54:15 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pg5HX-00038S-V4; Sat, 25 Mar 2023 10:54:14 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R791e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VeatLpN_1679756033; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeatLpN_1679756033) by smtp.aliyun-inc.com;
 Sat, 25 Mar 2023 22:53:55 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 1/1] target/riscv: Convert env->virt to a bool
 env->virt_enabled
Date: Sat, 25 Mar 2023 22:53:48 +0800
Message-Id: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 14:54:15 -0000

Currently we only use the env->virt to encode the virtual mode enabled
status. Let's make it a bool type.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu_bits.h   | 3 ---
 target/riscv/cpu_helper.c | 6 +++---
 target/riscv/machine.c    | 6 +++---
 target/riscv/translate.c  | 4 ++--
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..3c8041c5a4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -183,7 +183,7 @@ struct CPUArchState {
 #ifndef CONFIG_USER_ONLY
     target_ulong priv;
     /* This contains QEMU specific information about the virt state. */
-    target_ulong virt;
+    bool virt_enabled;
     target_ulong geilen;
     uint64_t resetvec;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef..45ddb00aa5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -607,9 +607,6 @@ typedef enum {
 #define PRV_H 2 /* Reserved */
 #define PRV_M 3
 
-/* Virtulisation Register Fields */
-#define VIRT_ONOFF          1
-
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
 #define SATP32_ASID         0x7fc00000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..56f4ff9ccc 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -564,7 +564,7 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env)
         return false;
     }
 
-    return get_field(env->virt, VIRT_ONOFF);
+    return env->virt_enabled;
 }
 
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
@@ -574,11 +574,11 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 
     /* Flush the TLB on all virt mode changes. */
-    if (get_field(env->virt, VIRT_ONOFF) != enable) {
+    if (env->virt_enabled != enable) {
         tlb_flush(env_cpu(env));
     }
 
-    env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+    env->virt_enabled = enable;
 
     if (enable) {
         /*
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 9c455931d8..0fb3ddda06 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 7,
-    .minimum_version_id = 7,
+    .version_id = 8,
+    .minimum_version_id = 8,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -352,7 +352,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
         VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
         VMSTATE_UINTTL(env.priv, RISCVCPU),
-        VMSTATE_UINTTL(env.virt, RISCVCPU),
+        VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
         VMSTATE_UINT64(env.resetvec, RISCVCPU),
         VMSTATE_UINTTL(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0ee8ee147d..c3adf30b54 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1255,8 +1255,8 @@ static void riscv_tr_disas_log(const DisasContextBase *dcbase,
 
     fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
 #ifndef CONFIG_USER_ONLY
-    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n",
-            env->priv, env->virt);
+    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: %d\n",
+            env->priv, env->virt_enabled);
 #endif
     target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
 }
-- 
2.17.1


