Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956B606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EN8IUvj3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ7Ly-0006um-Ng; Tue, 20 Oct 2026 06:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7Jx-0004QV-FX
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7Jf-0004R9-C0
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so23726345e9.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 03:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792493014; x=1793097814; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BSBV/g6ALpQ14y7y92FmMnIwbYri89hzMlxCn9KKLwg=;
 b=EN8IUvj3UCHggYEy1wvBuXQOwcF6CO3je86+SnlK+Pn9tLPisfoO/tQDwUzNvSVgil
 xdrHuakjMyLWXyl+mvGrIzQ9PB6VU1q5QvoOBiGMkqgrKubkv7sOfih/mktrcGA7Cpp/
 +TIv0NAC5bEXto9n6y2MF31QjXN4hPCgpNsbiVR4U4Okvc7h0CYKRZPCOOxxRMd0ybRa
 O7Or3rQyrlkGQc82i2s7cNOE5tweHZv/rGFEjptp4q8gpWP1ZJL3D/UqCTVw4HyXxuc/
 tkceQakHNhjTmW/VU39e8TlEQwGgQ+YS7tZshK7uXz0OXc5OdY8woyVc/vkpf0au0ZEb
 rcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792493014; x=1793097814;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BSBV/g6ALpQ14y7y92FmMnIwbYri89hzMlxCn9KKLwg=;
 b=MfH3QOfja+UT5/farFEvhh7yHqczUamRj0JkUdlhqxGBkug1DJUsZCnguy3/ifhtKh
 EZ8IkDMJqnBv/21u+71Y+qaFKp5p0Bz4ybXwjgxRM3bZGgOsBoUDFBj/qyRTfB9B7/Nr
 ESYITjXG9U4DnpV6PrlcBAVInh11wm4c4QVDlk7XURnhX3kHDFAdj1nRfC657v9dVS1N
 vc/AOm76YE2nHUZLXk2uzDUGbHyCqZPerifIZqjE3tBDkQmaAY6y5VPz70pSZDDqB1/h
 wYBfTiY8+U2oPHMXSmnKNPQoTe58rQJxi8AnxTzTj2zGikb7bhowwi0Winu0OnzSUrEc
 l19Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxTdnhLpXtCuFGeII02WN2z1pQZg1qOFByzD+IAxCiSqjYUFxCEGiO2HZ2AeEP7kdnb27EKp0xy4wXG@nongnu.org
X-Gm-Message-State: AFq9FYKfLoqU7lhXrfZTlEVq37v4D2u2z/uqEpS9+pJDzFPmmKlU6agu
 4GqaAdr41SGk9qpqxFF5XXzXl9Pjqj7opuTBXXKlDypZIbiuAaEC+5s1BnGrr+kzke0=
X-Gm-Gg: AYBFou3PDsmu/y3IvHpaDcNdBAX6PEwnge5BF4sMSqytgrGpfOfqWy7yYiUHcdjdngq
 ZL2fQHkYXX07TpbQDuhQCARIdspnCFxUXBD6Q+qRZRFxSnLU/pzo49GUHTgiqBAy0QhxHedy9nG
 MJLpcJvFStvwFq+LkhgOSJGTChJRrgnNV/UaKEblUqyteJl9WWHgX4uCnO5bRalbk+qLK7zaIyP
 Ji08FChMtrNZDNuOs3H/6ZgrCn9pFaZCXTu27QmFcyLq+JLOH4ek+fgkZptPsk+XUTB3F4+WydX
 t35bQLWqPkYXqUnGakt44n7eT7F0RuTu67aZ1WUfCbMAMDYH0QYV4+G2TdF9EM91naYbv4bCBQT
 ZF3/kWKQRIueE0UAd9pYrgL6guymVCnHBxlDYDFIM02/WGV1ylYCaSx5fM9Cb0oc8HBmZ8SIMTm
 ooemlwgLV2hRUQ0ajd0LNEQgjdMSpeJwSbl/+Gf1gIZrNeCY4y+G1XVnHdNp4ldNkhVaRqkA==
X-Received: by 2002:a05:600c:8b6f:b0:4a1:ce33:1536 with SMTP id
 5b1f17b1804b1-4a1d75e37ecmr193768375e9.9.1792493013721; 
 Tue, 20 Oct 2026 03:43:33 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d830e91sm5425066f8f.54.2026.10.20.03.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 03:43:27 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7E0E15F8DC;
 Tue, 20 Oct 2026 11:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Song Gao <17746591750@163.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Bj=C3=B6rn=20Walk?= <bwalk@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, linux-edac@vger.kernel.org,
 Glenn Miles <milesg@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Menghani <gautam@linux.ibm.com>,
 Xianglai Li <lixianglai@loongson.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Chinmay Rath <rathc@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 17/23] accel/kvm: port kvm_arch_update_guest_debug to KVMCPUOps
Date: Tue, 20 Oct 2026 11:43:11 +0100
Message-ID: <20261020104320.3686723-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As well as sw breakpoints.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/accel/kvm/cpu-ops.h | 17 +++++++++++++++++
 include/system/kvm.h        |  8 +-------
 target/i386/kvm/kvm_i386.h  |  3 +++
 accel/kvm/kvm-all.c         | 34 +++++++++++++++++++++++++++++-----
 target/arm/kvm.c            | 12 +++++++++---
 target/i386/kvm/kvm-cpu.c   |  3 +++
 target/i386/kvm/kvm.c       |  6 +++---
 target/loongarch/kvm/kvm.c  | 12 +++++++++---
 target/ppc/kvm.c            | 12 +++++++++---
 target/riscv/kvm/kvm-cpu.c  | 19 ++++++++++++++++---
 target/s390x/kvm/kvm.c      | 12 +++++++++---
 11 files changed, 108 insertions(+), 30 deletions(-)

diff --git a/include/accel/kvm/cpu-ops.h b/include/accel/kvm/cpu-ops.h
index be4031d9011..d2374e91cef 100644
--- a/include/accel/kvm/cpu-ops.h
+++ b/include/accel/kvm/cpu-ops.h
@@ -71,6 +71,20 @@ struct kvm_run;
  *                        return EXCP_HLT, or 0 if execution can proceed.
  *                        May be NULL if the target does not require event
  *                        processing before execution.
+ * @update_guest_debug: Optional callback executed when updating KVM guest
+ *                      debug structures for the vCPU. Used to configure
+ *                      architecture-specific debug control flags and hardware
+ *                      or software breakpoint descriptors in @dbg.
+ *                      May be NULL if the target does not require
+ *                      architecture-specific guest debug setup.
+ * @insert_sw_breakpoint: Optional callback to insert an architecture-specific
+ *                        software breakpoint instruction at @bp->pc and save
+ *                        the overwritten instruction in @bp->saved_insn.
+ *                        Returns 0 on success, or a negative errno on failure.
+ * @remove_sw_breakpoint: Optional callback to remove an architecture-specific
+ *                        software breakpoint, restoring @bp->saved_insn at
+ *                        @bp->pc.
+ *                        Returns 0 on success, or a negative errno on failure.
  */
 typedef struct KVMCPUOps {
     int (*pre_create_vcpu)(CPUState *cpu, Error **errp);
@@ -83,6 +97,9 @@ typedef struct KVMCPUOps {
     MemTxAttrs (*post_run)(CPUState *cpu, struct kvm_run *run);
     int (*handle_exit)(CPUState *cpu, struct kvm_run *run);
     int (*process_async_events)(CPUState *cpu);
+    void (*update_guest_debug)(CPUState *cpu, struct kvm_guest_debug *dbg);
+    int (*insert_sw_breakpoint)(CPUState *cpu, struct kvm_sw_breakpoint *bp);
+    int (*remove_sw_breakpoint)(CPUState *cpu, struct kvm_sw_breakpoint *bp);
 } KVMCPUOps;
 
 #define TYPE_KVM_ACCEL_CPU "kvm-accel-cpu"
diff --git a/include/system/kvm.h b/include/system/kvm.h
index 2ecae10cdff..52b7a63a0b3 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -229,7 +229,7 @@ void kvm_irqchip_change_notify(void);
  * @reinject_trap: KVM trap injection control
  *
  * There are usually per-arch specifics which will be handled by
- * calling down to kvm_arch_update_guest_debug after the generic
+ * calling down to the KVMCPUOps::update_guest_debug callback after the generic
  * fields have been set.
  */
 #ifdef TARGET_KVM_HAVE_GUEST_DEBUG
@@ -394,18 +394,12 @@ struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
 
 int kvm_sw_breakpoints_active(CPUState *cpu);
 
-int kvm_arch_insert_sw_breakpoint(CPUState *cpu,
-                                  struct kvm_sw_breakpoint *bp);
-int kvm_arch_remove_sw_breakpoint(CPUState *cpu,
-                                  struct kvm_sw_breakpoint *bp);
 int kvm_arch_insert_gdbstub_hw_breakpoint(vaddr addr, vaddr len,
                                           GdbBreakpointType type);
 int kvm_arch_remove_gdbstub_hw_breakpoint(vaddr addr, vaddr len,
                                           GdbBreakpointType type);
 void kvm_arch_remove_all_gdbstub_hw_breakpoints(void);
 
-void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg);
-
 bool kvm_arch_stop_on_emulation_error(CPUState *cpu);
 
 int kvm_vm_check_extension(KVMState *s, unsigned int extension);
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index f189bb92bb9..27eea1f65ff 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -43,6 +43,9 @@ void x86_kvm_pre_run(CPUState *cpu, struct kvm_run *run);
 MemTxAttrs x86_kvm_post_run(CPUState *cpu, struct kvm_run *run);
 int x86_kvm_handle_exit(CPUState *cs, struct kvm_run *run);
 int x86_kvm_process_async_events(CPUState *cs);
+void x86_kvm_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg);
+int x86_kvm_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp);
+int x86_kvm_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp);
 void kvm_arch_after_reset_vcpu(X86CPU *cpu);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f10d93a98df..24ded4b1804 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3866,6 +3866,7 @@ static void kvm_invoke_set_guest_debug(CPUState *cpu, run_on_cpu_data data)
 
 int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
 {
+    const KVMCPUOps *ops = kvm_get_cpu_ops(cpu);
     struct kvm_set_guest_debug_data data;
 
     data.dbg.control = reinject_trap;
@@ -3877,7 +3878,9 @@ int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
             data.dbg.control |= KVM_GUESTDBG_BLOCKIRQ;
         }
     }
-    kvm_arch_update_guest_debug(cpu, &data.dbg);
+    if (ops && ops->update_guest_debug) {
+        ops->update_guest_debug(cpu, &data.dbg);
+    }
 
     run_on_cpu(cpu, kvm_invoke_set_guest_debug,
                RUN_ON_CPU_HOST_PTR(&data));
@@ -3891,16 +3894,22 @@ int kvm_insert_gdbstub_breakpoint(CPUState *cpu, GdbBreakpointType type,
     int err;
 
     if (type == GDB_BREAKPOINT_SW) {
+        const KVMCPUOps *ops = kvm_get_cpu_ops(cpu);
+
         bp = kvm_find_sw_breakpoint(cpu, addr);
         if (bp) {
             bp->use_count++;
             return 0;
         }
 
+        if (!ops || !ops->insert_sw_breakpoint) {
+            return -ENOSYS;
+        }
+
         bp = g_new(struct kvm_sw_breakpoint, 1);
         bp->pc = addr;
         bp->use_count = 1;
-        err = kvm_arch_insert_sw_breakpoint(cpu, bp);
+        err = ops->insert_sw_breakpoint(cpu, bp);
         if (err) {
             g_free(bp);
             return err;
@@ -3930,6 +3939,8 @@ int kvm_remove_gdbstub_breakpoint(CPUState *cpu, GdbBreakpointType type,
     int err;
 
     if (type == GDB_BREAKPOINT_SW) {
+        const KVMCPUOps *ops = kvm_get_cpu_ops(cpu);
+
         bp = kvm_find_sw_breakpoint(cpu, addr);
         if (!bp) {
             return -ENOENT;
@@ -3940,7 +3951,11 @@ int kvm_remove_gdbstub_breakpoint(CPUState *cpu, GdbBreakpointType type,
             return 0;
         }
 
-        err = kvm_arch_remove_sw_breakpoint(cpu, bp);
+        if (!ops || !ops->remove_sw_breakpoint) {
+            return -ENOSYS;
+        }
+
+        err = ops->remove_sw_breakpoint(cpu, bp);
         if (err) {
             return err;
         }
@@ -3965,15 +3980,24 @@ int kvm_remove_gdbstub_breakpoint(CPUState *cpu, GdbBreakpointType type,
 
 void kvm_remove_all_gdbstub_breakpoints(CPUState *cpu)
 {
+    const KVMCPUOps *ops = kvm_get_cpu_ops(cpu);
     struct kvm_sw_breakpoint *bp, *next;
     KVMState *s = cpu->kvm_state;
     CPUState *tmpcpu;
 
     QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
-        if (kvm_arch_remove_sw_breakpoint(cpu, bp) != 0) {
+        int ret = -ENOENT;
+
+        if (ops && ops->remove_sw_breakpoint) {
+            ret = ops->remove_sw_breakpoint(cpu, bp);
+        }
+        if (ret != 0) {
             /* Try harder to find a CPU that currently sees the breakpoint. */
             CPU_FOREACH(tmpcpu) {
-                if (kvm_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
+                const KVMCPUOps *tmpops = kvm_get_cpu_ops(tmpcpu);
+
+                if (tmpops && tmpops->remove_sw_breakpoint &&
+                    tmpops->remove_sw_breakpoint(tmpcpu, bp) == 0) {
                     break;
                 }
             }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ad8166e0b41..a4f063f2efb 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1649,7 +1649,8 @@ static void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr)
     }
 }
 
-void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
+static void arm_kvm_update_guest_debug(CPUState *cs,
+                                       struct kvm_guest_debug *dbg)
 {
     if (kvm_sw_breakpoints_active(cs)) {
         dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
@@ -2538,7 +2539,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 /* C6.6.29 BRK instruction */
 static const uint32_t brk_insn = 0xd4200000;
 
-int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int arm_kvm_insert_sw_breakpoint(CPUState *cs,
+                                        struct kvm_sw_breakpoint *bp)
 {
     if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
         cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
@@ -2547,7 +2549,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     return 0;
 }
 
-int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int arm_kvm_remove_sw_breakpoint(CPUState *cs,
+                                        struct kvm_sw_breakpoint *bp)
 {
     static uint32_t brk;
 
@@ -2652,6 +2655,9 @@ static const KVMCPUOps arm_kvm_cpu_ops = {
     .pre_run = arm_kvm_pre_run,
     .post_run = arm_kvm_post_run,
     .handle_exit = arm_kvm_handle_exit,
+    .update_guest_debug = arm_kvm_update_guest_debug,
+    .insert_sw_breakpoint = arm_kvm_insert_sw_breakpoint,
+    .remove_sw_breakpoint = arm_kvm_remove_sw_breakpoint,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 6990cd8d5c4..0cd0884be30 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -245,6 +245,9 @@ static const KVMCPUOps x86_kvm_cpu_ops = {
     .post_run = x86_kvm_post_run,
     .handle_exit = x86_kvm_handle_exit,
     .process_async_events = x86_kvm_process_async_events,
+    .update_guest_debug = x86_kvm_update_guest_debug,
+    .insert_sw_breakpoint = x86_kvm_insert_sw_breakpoint,
+    .remove_sw_breakpoint = x86_kvm_remove_sw_breakpoint,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a3076d43b45..4ee7f53c2a8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -6128,7 +6128,7 @@ static int kvm_handle_tpr_access(X86CPU *cpu)
     return 1;
 }
 
-int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+int x86_kvm_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static const uint8_t int3 = 0xcc;
 
@@ -6139,7 +6139,7 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     return 0;
 }
 
-int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+int x86_kvm_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     uint8_t int3;
 
@@ -6292,7 +6292,7 @@ static int kvm_handle_debug(X86CPU *cpu,
     return ret;
 }
 
-void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
+void x86_kvm_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
 {
     const uint8_t type_code[] = {
         [GDB_BREAKPOINT_HW] = 0x0,
diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
index 97b6b448edf..0899aef552e 100644
--- a/target/loongarch/kvm/kvm.c
+++ b/target/loongarch/kvm/kvm.c
@@ -1518,14 +1518,16 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
     return true;
 }
 
-void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
+static void loongarch_kvm_update_guest_debug(CPUState *cpu,
+                                             struct kvm_guest_debug *dbg)
 {
     if (kvm_sw_breakpoints_active(cpu)) {
         dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
     }
 }
 
-int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int loongarch_kvm_insert_sw_breakpoint(CPUState *cs,
+                                              struct kvm_sw_breakpoint *bp)
 {
     if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
         cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
@@ -1535,7 +1537,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     return 0;
 }
 
-int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int loongarch_kvm_remove_sw_breakpoint(CPUState *cs,
+                                              struct kvm_sw_breakpoint *bp)
 {
     static uint32_t brk;
 
@@ -1640,6 +1643,9 @@ static const KVMCPUOps loongarch_kvm_cpu_ops = {
     .put_registers = loongarch_kvm_put_registers,
     .handle_exit = loongarch_kvm_handle_exit,
     .process_async_events = loongarch_kvm_process_async_events,
+    .update_guest_debug = loongarch_kvm_update_guest_debug,
+    .insert_sw_breakpoint = loongarch_kvm_insert_sw_breakpoint,
+    .remove_sw_breakpoint = loongarch_kvm_remove_sw_breakpoint,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index ffc7a33bf17..4b2e42ef163 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1366,7 +1366,8 @@ static int kvmppc_handle_dcr_write(CPUPPCState *env,
     return 0;
 }
 
-int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int ppc_kvm_insert_sw_breakpoint(CPUState *cs,
+                                        struct kvm_sw_breakpoint *bp)
 {
     /* Mixed endian case is not handled */
     uint32_t sc = debug_inst_opcode;
@@ -1380,7 +1381,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     return 0;
 }
 
-int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int ppc_kvm_remove_sw_breakpoint(CPUState *cs,
+                                        struct kvm_sw_breakpoint *bp)
 {
     uint32_t sc;
 
@@ -1515,7 +1517,8 @@ void kvm_arch_remove_all_gdbstub_hw_breakpoints(void)
     nb_hw_breakpoint = nb_hw_watchpoint = 0;
 }
 
-void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
+static void ppc_kvm_update_guest_debug(CPUState *cs,
+                                       struct kvm_guest_debug *dbg)
 {
     int n;
 
@@ -3069,6 +3072,9 @@ static const KVMCPUOps ppc_kvm_cpu_ops = {
     .put_registers = ppc_kvm_put_registers,
     .handle_exit = ppc_kvm_handle_exit,
     .process_async_events = ppc_kvm_process_async_events,
+    .update_guest_debug = ppc_kvm_update_guest_debug,
+    .insert_sw_breakpoint = ppc_kvm_insert_sw_breakpoint,
+    .remove_sw_breakpoint = ppc_kvm_remove_sw_breakpoint,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index d9984828048..8a82160a7bf 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -2168,11 +2168,21 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
 
+static int riscv_kvm_insert_sw_breakpoint(CPUState *cs,
+                                          struct kvm_sw_breakpoint *bp);
+static int riscv_kvm_remove_sw_breakpoint(CPUState *cs,
+                                          struct kvm_sw_breakpoint *bp);
+static void riscv_kvm_update_guest_debug(CPUState *cs,
+                                         struct kvm_guest_debug *dbg);
+
 static const KVMCPUOps riscv_kvm_cpu_ops = {
     .init_vcpu = riscv_kvm_init_vcpu,
     .get_registers = riscv_kvm_get_registers,
     .put_registers = riscv_kvm_put_registers,
     .handle_exit = riscv_kvm_handle_exit,
+    .update_guest_debug = riscv_kvm_update_guest_debug,
+    .insert_sw_breakpoint = riscv_kvm_insert_sw_breakpoint,
+    .remove_sw_breakpoint = riscv_kvm_remove_sw_breakpoint,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
@@ -2225,7 +2235,8 @@ DEFINE_TYPES(riscv_kvm_cpu_type_infos)
 static const uint32_t ebreak_insn = 0x00100073;
 static const uint16_t c_ebreak_insn = 0x9002;
 
-int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int riscv_kvm_insert_sw_breakpoint(CPUState *cs,
+                                          struct kvm_sw_breakpoint *bp)
 {
     if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 2, 0)) {
         return -EINVAL;
@@ -2245,7 +2256,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     return 0;
 }
 
-int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int riscv_kvm_remove_sw_breakpoint(CPUState *cs,
+                                          struct kvm_sw_breakpoint *bp)
 {
     uint32_t ebreak;
     uint16_t c_ebreak;
@@ -2286,7 +2298,8 @@ void kvm_arch_remove_all_gdbstub_hw_breakpoints(void)
     /* TODO; To be implemented later. */
 }
 
-void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
+static void riscv_kvm_update_guest_debug(CPUState *cs,
+                                         struct kvm_guest_debug *dbg)
 {
     if (kvm_sw_breakpoints_active(cs)) {
         dbg->control |= KVM_GUESTDBG_ENABLE;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 7400fe41f87..12695376442 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -825,7 +825,8 @@ static void determine_sw_breakpoint_instr(void)
         }
 }
 
-int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int s390x_kvm_insert_sw_breakpoint(CPUState *cs,
+                                          struct kvm_sw_breakpoint *bp)
 {
     determine_sw_breakpoint_instr();
 
@@ -837,7 +838,8 @@ int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
     return 0;
 }
 
-int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
+static int s390x_kvm_remove_sw_breakpoint(CPUState *cs,
+                                          struct kvm_sw_breakpoint *bp)
 {
     uint8_t t[MAX_ILEN];
 
@@ -956,7 +958,8 @@ void kvm_arch_remove_all_gdbstub_hw_breakpoints(void)
     hw_breakpoints = NULL;
 }
 
-void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
+static void s390x_kvm_update_guest_debug(CPUState *cpu,
+                                         struct kvm_guest_debug *dbg)
 {
     int i;
 
@@ -2647,6 +2650,9 @@ static const KVMCPUOps s390x_kvm_cpu_ops = {
     .put_registers = s390x_kvm_put_registers,
     .handle_exit = s390x_kvm_handle_exit,
     .process_async_events = s390x_kvm_process_async_events,
+    .update_guest_debug = s390x_kvm_update_guest_debug,
+    .insert_sw_breakpoint = s390x_kvm_insert_sw_breakpoint,
+    .remove_sw_breakpoint = s390x_kvm_remove_sw_breakpoint,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-- 
2.47.3


