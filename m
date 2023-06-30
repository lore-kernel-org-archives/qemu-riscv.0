Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42688EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:09:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFB3W-00058R-Nv; Fri, 30 Jun 2023 06:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3U-000573-Ft
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:08:44 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3Q-0000mp-7s
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:08:44 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1b059dd7c0cso1518327fac.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688119719; x=1690711719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7R/sel99e627KtIn7pDVqWD8XPgNj5ixqoMQ0EFkK9c=;
 b=DvvH35UECNIG2dnjMhvqKx4u+6pF7/22RRnWQcN+VpjilmHziqTR9ub3/O3ndzcFVJ
 kcLpMKXuMgw7AjDw+cwp086D+WHLgIr9DmItDQhWFCVYaeTW3Y9edLmPhKYOBcyOI7aF
 XKR4iTucLh/hwcnj8IAMvTEKVAqMeNWpqblSK+vPjamoWoTru6yDaC01myeUgH5FQWoz
 qxnjPX0ltbUASk4iiJtANcpGablaQHP6iZKR0KrYpUQUBYPWv76HsyNhz6EeWGG+9onb
 IKU384iR0oNmlfexk34coXeSeqMaNhciK9QXiKKViT5yL9h8ntNNxn+N8MgYJL5o81pO
 2tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688119719; x=1690711719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7R/sel99e627KtIn7pDVqWD8XPgNj5ixqoMQ0EFkK9c=;
 b=aO5JWlfK2mU2ohE+ieijj004OBXD0eTfdRIR2Ab5hr76HD/2gtqLIrTtj8Utx1VDY6
 dErK2xaGgnfM+p5WNwqSC2wZvkJMGWMbJJh7iqJMlOk1+u9zMofvSwh/UtOlFmp8WsZj
 BpfWOFDdmY4c05dGP/UgoocQc+v2ROA9iETj0YRi9dD73PpzpeNaAIl4gdspN5fo1k9e
 Bb5HzqBVqx4vBEMuwuNMh7wWA8fSPTbgPkPbqfB3oWURUqtIxtR7bEotxd1hNx3DAqrt
 cjW8s0aV1Gh3c2A7xX9XDjAFWUrJ0naykkPL7OhAy1p7uq2j1GXVfS575Df3+8QRqMcY
 /Tvw==
X-Gm-Message-State: AC+VfDyPyAjr+XzQilAE+mjgg+aUSw9MOxT092kq5sI/+kBGEVdj3dhg
 zyCtfpF9oGrpRUdfymAo0EuCpg==
X-Google-Smtp-Source: ACHHUZ6mh+a9Wz3mJO7lNaat7mDNbXWThrIazK8Gk3az+jGHs2FDltRGa67a51WjJvokODGWGtJzPw==
X-Received: by 2002:a05:6870:9d8d:b0:1b0:18cc:d9fb with SMTP id
 pv13-20020a0568709d8d00b001b018ccd9fbmr2913595oab.24.1688119719274; 
 Fri, 30 Jun 2023 03:08:39 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 eh18-20020a056870f59200b001a663e49523sm8707467oab.36.2023.06.30.03.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 03:08:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 06/20] target/riscv: use KVM scratch CPUs to init KVM
 properties
Date: Fri, 30 Jun 2023 07:07:57 -0300
Message-ID: <20230630100811.287315-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100811.287315-1-dbarboza@ventanamicro.com>
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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

Certain validations, such as the validations done for the machine IDs
(mvendorid/marchid/mimpid), are done before starting the CPU.
Non-dynamic (named) CPUs tries to match user input with a preset
default. As it is today we can't prefetch a KVM default for these cases
because we're only able to read/write KVM regs after the vcpu is
spinning.

Our target/arm friends use a concept called "scratch CPU", which
consists of creating a vcpu for doing queries and validations and so on,
which is discarded shortly after use [1]. This is a suitable solution
for what we need so let's implement it in target/riscv as well.

kvm_riscv_init_machine_ids() will be used to do any pre-launch setup for
KVM CPUs, via riscv_cpu_add_user_properties(). The function will create
a KVM scratch CPU, fetch KVM regs that work as default values for user
properties, and then discard the scratch CPU afterwards.

We're starting by initializing 'mvendorid'. This concept will be used to
init other KVM specific properties in the next patches as well.

[1] target/arm/kvm.c, kvm_arm_create_scratch_host_vcpu()

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c       |  6 +++
 target/riscv/kvm.c       | 85 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/kvm_riscv.h |  1 +
 3 files changed, 92 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a05b76238b..58439a05d1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1710,6 +1710,12 @@ static void riscv_cpu_add_user_properties(Object *obj)
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
+#ifndef CONFIG_USER_ONLY
+    if (kvm_enabled()) {
+        kvm_riscv_init_user_properties(obj);
+    }
+#endif
+
     riscv_cpu_add_misa_properties(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 0f932a5b96..37f0f70794 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -309,6 +309,91 @@ static void kvm_riscv_put_regs_timer(CPUState *cs)
     env->kvm_timer_dirty = false;
 }
 
+typedef struct KVMScratchCPU {
+    int kvmfd;
+    int vmfd;
+    int cpufd;
+} KVMScratchCPU;
+
+/*
+ * Heavily inspired by kvm_arm_create_scratch_host_vcpu()
+ * from target/arm/kvm.c.
+ */
+static bool kvm_riscv_create_scratch_vcpu(KVMScratchCPU *scratch)
+{
+    int kvmfd = -1, vmfd = -1, cpufd = -1;
+
+    kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
+    if (kvmfd < 0) {
+        goto err;
+    }
+    do {
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, 0);
+    } while (vmfd == -1 && errno == EINTR);
+    if (vmfd < 0) {
+        goto err;
+    }
+    cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
+    if (cpufd < 0) {
+        goto err;
+    }
+
+    scratch->kvmfd =  kvmfd;
+    scratch->vmfd = vmfd;
+    scratch->cpufd = cpufd;
+
+    return true;
+
+ err:
+    if (cpufd >= 0) {
+        close(cpufd);
+    }
+    if (vmfd >= 0) {
+        close(vmfd);
+    }
+    if (kvmfd >= 0) {
+        close(kvmfd);
+    }
+
+    return false;
+}
+
+static void kvm_riscv_destroy_scratch_vcpu(KVMScratchCPU *scratch)
+{
+    close(scratch->cpufd);
+    close(scratch->vmfd);
+    close(scratch->kvmfd);
+}
+
+static void kvm_riscv_init_machine_ids(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
+{
+    CPURISCVState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int ret;
+
+    reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                              KVM_REG_RISCV_CONFIG_REG(mvendorid));
+    reg.addr = (uint64_t)&cpu->cfg.mvendorid;
+    ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
+    if (ret != 0) {
+        error_report("Unable to retrieve mvendorid from host, error %d", ret);
+    }
+}
+
+void kvm_riscv_init_user_properties(Object *cpu_obj)
+{
+    RISCVCPU *cpu = RISCV_CPU(cpu_obj);
+    KVMScratchCPU kvmcpu;
+
+    if (!kvm_riscv_create_scratch_vcpu(&kvmcpu)) {
+        return;
+    }
+
+    kvm_riscv_init_machine_ids(cpu, &kvmcpu);
+
+    kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index ed281bdce0..e3ba935808 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -19,6 +19,7 @@
 #ifndef QEMU_KVM_RISCV_H
 #define QEMU_KVM_RISCV_H
 
+void kvm_riscv_init_user_properties(Object *cpu_obj);
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 
-- 
2.41.0


