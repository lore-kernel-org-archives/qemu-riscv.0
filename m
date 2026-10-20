Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D6606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cobr+hS4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJ7KI-0004qJ-L4; Tue, 20 Oct 2026 06:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7Jp-0004Jp-Vf
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7JZ-0004Nh-Pz
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 06:43:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e20edd106so364532f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792493008; x=1793097808; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/9f6mqKQKIDfPizUVF1MsoBaBzc3N5Aydnd1/G+cFzg=;
 b=cobr+hS4wwS3+VY7V0pMDzN1MKUMLuuoi7WH0zlUSbGQWjpw0O9doJFrokyGtaif1Z
 TfLaYQ1k/E4JtIaJGUfj/YQqiGbYr4tt44zhybWSzfktkdLJamniL4vMvMG1EYFyLHMl
 lQZKh7D2u8rbEdiFUSGLJWSMahoZnVGWt1MQzH+R9AIbbdAdRMBYc49fUb7QAuprXk1V
 jTK0eja3JVDnJl5NMsspuVNuVPITwhjCcnt/U3RwUsA1J8f+awNUJJGD5ngEY5D4Zu18
 20YN0GBVLBxDmMA/XVDdNsK4mp38i5p6johJ1hFIqeb0pdQKxvMA8fB3MbK1MeAO1VPh
 i1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792493008; x=1793097808;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/9f6mqKQKIDfPizUVF1MsoBaBzc3N5Aydnd1/G+cFzg=;
 b=DWpMU2865hHk/WfWn2V9CUVN2Cu9SE6MXTOLz+yEpPDOlY8jjtQwihVlujg2Zrt5qm
 0a0pyCGvOogNu/+uqKUnLl+GdWVbVigocxPaNSGwzrftwEDxXmYrXjRrNUJG99D5U3sO
 LcLz1CrZ8+1qTFGSsQvRuejp2w74QEO02nXFR5+5PJXA4ElY0/S2y9lubj1ExYnfYT6V
 S+dgWM8uk/651s9NK8+qsdS56hM8Q9Qwtk83KP834fzyiCxMOZ+DD2/UGnGkZn6z/diR
 YNp+N5VNxbgkb8s3WTc8n6bEZQEcoHUKzZJKgrl/qL95G4fmxMf4xn01z/8h593U/VjG
 Z9VA==
X-Forwarded-Encrypted: i=1;
 AKwUvByDgFaaGjlE3IQk53hZuGUHBfHFHQW1bjFgkyD72Esyz+NuLBK9yKTSVe+NGaqaLz+7PGCDJ8LbR2zH@nongnu.org
X-Gm-Message-State: AFq9FYKMgerjY5C2BSmgz7TwCTKCGR/djSxuv/rsc79idBeuOUYeaAxp
 FqJuoU+StpFPsEfi4mw4MPozcVXS3nKqo78X3yYSdnWpEgprBZ970UirMXk0Wuf3v7g=
X-Gm-Gg: AYBFou3hjRF1FeOULMFNkrBOm3/CEiY6Bf8+gAt+nIUjNrOsbakK4VAjbk/DtvgSCGx
 JtiFLxSmMUSzYNsn+feHoIg0RNhS4W7hcKhSy1nAfoFI8RbKbPmZUTZC2NMz66N3PUslbV0Pr9E
 yxwUBXgLmuv1lMgvk6Y92wdroSz1aOafpyHyNlY78+LFvF3K2UxFJvXtlpGv92KMeuU6qQvVhzt
 Fw/M3EE4ReLLiiX9g0F0VZEKJHag3JDdsrNCjQoxGV0E8AQisXs7I7jv6SbWXIvq0TE50o36BLl
 a0fSk1fMf+Y3TKz+9r7Yz2MGblvC9LS0uPZ9heIfvDbj4EkHDe72quMtGMfeB+XVrBt7IhK+FJO
 LhC+HJdaMxWnHsbO6uUEpQ1InKYQaQykrI+rKPs2rloc5JfhaU85dXaOMnu0D91BOFvL8A4wEnl
 UvlUZfByrvwB5Ny0zekVMr32cADIJ7rjOXZt6/uV5Ca/QQKhUvvyAmxMOR6F+lBkFqU0B/7w==
X-Received: by 2002:adf:f806:0:b0:48d:f99d:a0cf with SMTP id
 ffacd0b85a97d-48e07bbe7b8mr15132244f8f.16.1792493007847; 
 Tue, 20 Oct 2026 03:43:27 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d818d61sm5154655f8f.31.2026.10.20.03.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 08ED15FCBC;
 Tue, 20 Oct 2026 11:43:22 +0100 (BST)
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
Subject: [PATCH 11/23] accel/kvm: port kvm_arch_process_async_events to
 KVMCPUOps
Date: Tue, 20 Oct 2026 11:43:05 +0100
Message-ID: <20261020104320.3686723-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The most complex async handling is for x86 which checks for various
exceptions and if the irqchip is not handled in the kernel for
interrupts. Most of the others just reflect if cs->halted has been
set.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/accel/kvm/cpu-ops.h | 9 +++++++++
 include/system/kvm.h        | 2 --
 target/i386/kvm/kvm_i386.h  | 1 +
 accel/kvm/kvm-all.c         | 2 +-
 target/arm/kvm.c            | 5 -----
 target/i386/kvm/kvm-cpu.c   | 1 +
 target/i386/kvm/kvm.c       | 2 +-
 target/loongarch/kvm/kvm.c  | 3 ++-
 target/ppc/kvm.c            | 3 ++-
 target/riscv/kvm/kvm-cpu.c  | 5 -----
 target/s390x/kvm/kvm.c      | 3 ++-
 11 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/include/accel/kvm/cpu-ops.h b/include/accel/kvm/cpu-ops.h
index 8b2aabd3c2f..cbd3935ba4d 100644
--- a/include/accel/kvm/cpu-ops.h
+++ b/include/accel/kvm/cpu-ops.h
@@ -35,11 +35,20 @@ struct kvm_run;
  *               (or unhandled sub-cases of KVM_EXIT_SYSTEM_EVENT).
  *               Returns 0 to continue execution, or an EXCP_* code (or negative
  *               error code) to exit the CPU execution loop.
+ * @process_async_events: Optional callback executed at the start of
+ *                        kvm_cpu_exec() while holding the BQL to process
+ *                        pending asynchronous events (such as interrupts,
+ *                        resets, or MCEs). Returns non-zero (typically
+ *                        cpu->halted) if the vCPU should not run and should
+ *                        return EXCP_HLT, or 0 if execution can proceed.
+ *                        May be NULL if the target does not require event
+ *                        processing before execution.
  */
 typedef struct KVMCPUOps {
     void (*pre_run)(CPUState *cpu, struct kvm_run *run);
     MemTxAttrs (*post_run)(CPUState *cpu, struct kvm_run *run);
     int (*handle_exit)(CPUState *cpu, struct kvm_run *run);
+    int (*process_async_events)(CPUState *cpu);
 } KVMCPUOps;
 
 #define TYPE_KVM_ACCEL_CPU "kvm-accel-cpu"
diff --git a/include/system/kvm.h b/include/system/kvm.h
index 82d18d79dc0..8c705d21f79 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -333,8 +333,6 @@ extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
 
 void kvm_arch_accel_class_init(ObjectClass *oc);
 
-int kvm_arch_process_async_events(CPUState *cpu);
-
 int kvm_arch_get_registers(CPUState *cpu, Error **errp);
 
 typedef enum kvm_put_state {
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 5bcc9b51214..bff587a56de 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -36,6 +36,7 @@ void kvm_arch_reset_vcpu(X86CPU *cs);
 void x86_kvm_pre_run(CPUState *cpu, struct kvm_run *run);
 MemTxAttrs x86_kvm_post_run(CPUState *cpu, struct kvm_run *run);
 int x86_kvm_handle_exit(CPUState *cs, struct kvm_run *run);
+int x86_kvm_process_async_events(CPUState *cs);
 void kvm_arch_after_reset_vcpu(X86CPU *cpu);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 33fa47bddf0..e8a26a9f067 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3459,7 +3459,7 @@ int kvm_cpu_exec(CPUState *cpu)
 
     trace_kvm_cpu_exec();
 
-    if (kvm_arch_process_async_events(cpu)) {
+    if (ops->process_async_events && ops->process_async_events(cpu)) {
         return EXCP_HLT;
     }
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 914f8e3b089..06b133ebf53 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1619,11 +1619,6 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
     return true;
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
-{
-    return 0;
-}
-
 /**
  * kvm_arm_hw_debug_active:
  * @cpu: ARMCPU
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 6b75eb038e1..163d60a1060 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -238,6 +238,7 @@ static const KVMCPUOps x86_kvm_cpu_ops = {
     .pre_run = x86_kvm_pre_run,
     .post_run = x86_kvm_post_run,
     .handle_exit = x86_kvm_handle_exit,
+    .process_async_events = x86_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index dfc70eac3db..83c4451cf31 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -6040,7 +6040,7 @@ MemTxAttrs x86_kvm_post_run(CPUState *cpu, struct kvm_run *run)
     return cpu_get_mem_attrs(env);
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+int x86_kvm_process_async_events(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
index b23031007c2..600903a2280 100644
--- a/target/loongarch/kvm/kvm.c
+++ b/target/loongarch/kvm/kvm.c
@@ -1517,7 +1517,7 @@ int kvm_arch_irqchip_create(KVMState *s)
     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+static int loongarch_kvm_process_async_events(CPUState *cs)
 {
     return cs->halted;
 }
@@ -1644,6 +1644,7 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
 static const KVMCPUOps loongarch_kvm_cpu_ops = {
     .handle_exit = loongarch_kvm_handle_exit,
+    .process_async_events = loongarch_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 25aaefd7649..e52f0b84ee3 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1336,7 +1336,7 @@ int kvmppc_set_interrupt(PowerPCCPU *cpu, int irq, int level)
     return 0;
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+static int ppc_kvm_process_async_events(CPUState *cs)
 {
     return cs->halted;
 }
@@ -3074,6 +3074,7 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
 static const KVMCPUOps ppc_kvm_cpu_ops = {
     .handle_exit = ppc_kvm_handle_exit,
+    .process_async_events = ppc_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 8944961a939..a5333083765 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1635,11 +1635,6 @@ int kvm_arch_irqchip_create(KVMState *s)
     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
-{
-    return 0;
-}
-
 bool kvm_arch_stop_on_emulation_error(CPUState *cs)
 {
     return true;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 967706a87e1..420703f7683 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -984,7 +984,7 @@ void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
     }
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+static int s390x_kvm_process_async_events(CPUState *cs)
 {
     return cs->halted;
 }
@@ -2651,6 +2651,7 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
 static const KVMCPUOps s390x_kvm_cpu_ops = {
     .handle_exit = s390x_kvm_handle_exit,
+    .process_async_events = s390x_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-- 
2.47.3


