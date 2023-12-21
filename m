Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B65C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:53:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNDk-00035V-Vb; Thu, 21 Dec 2023 12:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDY-0002cA-Ip
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:20 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDT-0007zq-M1
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:20 -0500
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-35d57e88c1dso4980175ab.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181134; x=1703785934; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSBipYs1ja9hQ+IdxMnaSg+JbEymd7tED/lgmeFP+2A=;
 b=Bp0BMkCdYA51wJoOD8R+U613fi9EwRoFovnn6x/ArylilaJY+9xTg0mAX4AdnVZU0N
 28biYe6i/dTpkZO3tE2ILJyRArA5mtrRZlr10TwTfukhSsx9hiu++fUgBIpqQ0fB6C5H
 9ssQrh6ma9L0QrRw17OUpZLpquJJLM1emj5O/zZuR13Q+AXSaYjyrSArnnXICR1Br39P
 +HZfmq/uhJLdfwiQv5NZ9gUU/K3woxWu1uNC2EhNGKB0r8U4rQQS275i/0VLum2J6uVj
 QUtX6bXbdiNHys0lRvIxNIrQn8EG/kJ9+sh/wLK4aztDPTLuWp9KdmnYhSiTpCz8n8j9
 eUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181134; x=1703785934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSBipYs1ja9hQ+IdxMnaSg+JbEymd7tED/lgmeFP+2A=;
 b=xPnZ5hNoT+6nWoxzvfOhJfOc7JY3WbPXzlmIgtTdZnTu+zroKHtKwyUXuvxNTquNEo
 mY3v3oSsewH9r9lmdVET2/wlZicFnK5oLisLMRryiq/+SNvZUxpTGpjSZO6eJdZHQOD0
 VFKNAJEhNxjZf+kDDAywlHpQP1nifxAxULReNAAApsXI5IlLDra6fF31Psy+valBpYEQ
 1ZXnlQGooZZklHchfFG0TZDE88qLC54rVVB1AKM8VAkr0tyHcG583nI6qx9CDhx828bS
 kgFgXDkUKkKSDjZ9+JjrrsAQcQtxJ7PczGxeZZ3Gk5HCFZBnr1zql6KzJs29go6cLT4w
 hfAg==
X-Gm-Message-State: AOJu0YxWeETprYpSClYlJ8zUT162ti2tMPmPrIWEU0G6J+VEEvxPgVoT
 G5USmldzbPnMwkyoZ33rwTDMzw==
X-Google-Smtp-Source: AGHT+IF2eaThLi06BT+Oyuavd5o69LImy0603i33yeqSCaUxLqAKkfKqV1cT/VGwCGpAULgo/A1lNg==
X-Received: by 2002:a05:6e02:1bc6:b0:35d:59a2:bb1 with SMTP id
 x6-20020a056e021bc600b0035d59a20bb1mr21687163ilv.71.1703181134446; 
 Thu, 21 Dec 2023 09:52:14 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:52:14 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 10/16] target/riscv: create finalize_features() for KVM
Date: Thu, 21 Dec 2023 14:51:31 -0300
Message-ID: <20231221175137.497379-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

To turn cbom_blocksize and cboz_blocksize into class properties we need
KVM specific changes.

KVM is creating its own version of these options with a customized
setter() that prevents users from picking an invalid value during init()
time. This comes at the cost of duplicating each option that KVM
supports. This will keep happening for each new shared option KVM
implements in the future.

We can avoid that by using the same property TCG uses and adding
specific KVM handling during finalize() time, like TCG already does with
riscv_tcg_cpu_finalize_features(). To do that, the common CPU property
offers a way of knowing if an option was user set or not, sparing us
from doing unneeded syscalls.

riscv_kvm_cpu_finalize_features() is then created using the same
KVMScratch CPU we already use during init() time, since finalize() time
is still too early to use the official KVM CPU for it. cbom_blocksize
and cboz_blocksize are then handled during finalize() in the same way
they're handled by their KVM specific setter.

With this change we can proceed with the blocksize changes in the common
code without breaking the KVM driver.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c           | 16 +++++++---
 target/riscv/cpu.h           |  1 +
 target/riscv/kvm/kvm-cpu.c   | 59 ++++++++++++++++++++++++++++++++++++
 target/riscv/kvm/kvm_riscv.h |  1 +
 4 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aec1968cad..d7e74b3428 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -63,6 +63,11 @@ static void cpu_option_add_user_setting(const char *optname, uint32_t value)
                         GUINT_TO_POINTER(value));
 }
 
+bool riscv_cpu_option_set(const char *optname)
+{
+    return g_hash_table_contains(general_user_opts, optname);
+}
+
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
 
@@ -1056,17 +1061,18 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-    /*
-     * KVM accel does not have a specialized finalize()
-     * callback because its extensions are validated
-     * in the get()/set() callbacks of each property.
-     */
     if (tcg_enabled()) {
         riscv_tcg_cpu_finalize_features(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
             return;
         }
+    } else if (kvm_enabled()) {
+        riscv_kvm_cpu_finalize_features(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 53101b82c5..988471c7ba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -495,6 +495,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
+bool riscv_cpu_option_set(const char *optname);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 62a1e51f0a..70fb075846 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1490,6 +1490,65 @@ static void kvm_cpu_instance_init(CPUState *cs)
     }
 }
 
+void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    KVMScratchCPU kvmcpu;
+    struct kvm_one_reg reg;
+    uint64_t val;
+    int ret;
+
+    /* short-circuit without spinning the scratch CPU */
+    if (!cpu->cfg.ext_zicbom && !cpu->cfg.ext_zicboz) {
+        return;
+    }
+
+    if (!kvm_riscv_create_scratch_vcpu(&kvmcpu)) {
+        error_setg(errp, "Unable to create scratch KVM cpu");
+        return;
+    }
+
+    if (cpu->cfg.ext_zicbom &&
+        riscv_cpu_option_set(kvm_cbom_blocksize.name)) {
+
+        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
+                                        kvm_cbom_blocksize.kvm_reg_id);
+        reg.addr = (uint64_t)&val;
+        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
+        if (ret != 0) {
+            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
+            return;
+        }
+
+        if (cpu->cfg.cbom_blocksize != val) {
+            error_setg(errp, "Unable to set cbom_blocksize to a different "
+                       "value than the host (%lu)", val);
+            return;
+        }
+    }
+
+    if (cpu->cfg.ext_zicboz &&
+        riscv_cpu_option_set(kvm_cboz_blocksize.name)) {
+
+        reg.id = kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
+                                        kvm_cboz_blocksize.kvm_reg_id);
+        reg.addr = (uint64_t)&val;
+        ret = ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
+        if (ret != 0) {
+            error_setg(errp, "Unable to read cbom_blocksize, error %d", errno);
+            return;
+        }
+
+        if (cpu->cfg.cboz_blocksize != val) {
+            error_setg(errp, "Unable to set cboz_blocksize to a different "
+                       "value than the host (%lu)", val);
+            return;
+        }
+    }
+
+    kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
+}
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
index 8329cfab82..4bd98fddc7 100644
--- a/target/riscv/kvm/kvm_riscv.h
+++ b/target/riscv/kvm/kvm_riscv.h
@@ -27,5 +27,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t guest_num);
 void riscv_kvm_aplic_request(void *opaque, int irq, int level);
 int kvm_riscv_sync_mpstate_to_kvm(RISCVCPU *cpu, int state);
+void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
 
 #endif
-- 
2.43.0


