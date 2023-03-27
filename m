Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pghuy-0007Lo-Ix
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 04:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pghut-0007H9-FX; Mon, 27 Mar 2023 04:09:23 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pghuq-00054g-6q; Mon, 27 Mar 2023 04:09:23 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACnrWUkTyFksV29Cg--.4754S7;
 Mon, 27 Mar 2023 16:09:12 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 05/10] target/riscv: Convert env->virt to a bool
 env->virt_enabled
Date: Mon, 27 Mar 2023 16:08:53 +0800
Message-Id: <20230327080858.39703-6-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrWUkTyFksV29Cg--.4754S7
X-Coremail-Antispam: 1UD129KBjvJXoWxAF4xZw45GF1xKr4kGFWUCFg_yoWrXr15pr
 4kG3yIkrWkJrZxCayxtFyDXr15Jws0gr4Yk397uw4xGa13JrW3WrnrKw4IyFs5XF18ur1j
 9F4UAryayr48Zr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
 6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Mar 2023 08:09:24 -0000

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Currently we only use the env->virt to encode the virtual mode enabled
status. Let's make it a bool type.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu_bits.h   | 3 ---
 target/riscv/cpu_helper.c | 6 +++---
 target/riscv/machine.c    | 6 +++---
 target/riscv/translate.c  | 4 ++--
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5adefe4ab5..22dc5ddb95 100644
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
index b286118a6b..c7bc3fc553 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -560,18 +560,18 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
 
 bool riscv_cpu_virt_enabled(CPURISCVState *env)
 {
-    return get_field(env->virt, VIRT_ONOFF);
+    return env->virt_enabled;
 }
 
 /* This function can only be called to set virt when RVH is enabled */
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 {
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
2.25.1


