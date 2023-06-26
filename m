Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5B3EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 22:09:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDuIp-0003Qf-54; Mon, 26 Jun 2023 18:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIB-0001dk-Ar
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:02:39 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuI5-0005vK-JZ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:02:37 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1acdfbe1c78so3771240fac.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 15:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687816952; x=1690408952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZtMAvrIOyEumaQvUNJyMxdqqk+YGOk6RSyVg2Zsp5s=;
 b=EOh1Yauflci5UUrgJ0s6nFbIGxc9fSIKisWZQUcKcmYvTXmLNLMEuQuJ1tCyl84OQr
 MTbpqlqjN5uhLGV42ElnXE5lMQyqbc8V7i4PTNaYpN9U6BkSjkMJhihXFkW/6W4ZesFx
 kUgLgil4pLWpEShS+Y7+b7ncaXyWAt6AS/CSx+fjoR7+gG8ceNOavvRx3w+U7XgVyrsK
 8/iv4DorYT5d2yxZkoLijFrJOZkhDbDm0Z6lFOrJMMQIlvYonAiqOhAU29wLOIdC49zr
 I1scbAdLcPSaAbvt1UfpmJeqAe0ep1oBLV83ugQcJUdbT2qCqWe7TlwXfsCA52Z8gP4o
 nGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687816952; x=1690408952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZtMAvrIOyEumaQvUNJyMxdqqk+YGOk6RSyVg2Zsp5s=;
 b=kCVL2WDC8p61OKhpgMVz7F7AjeDWpZf/Ofl28fyXOtN7n7qGZrCPLXudurMJ4UGy0v
 zWJwoIiQyB2iGkoMvIerbg0rjUPlH7tpMZAhEgOxodglW2K/LUxsMPS23ATSxWMSL+y/
 cVbkV9jY1veiRHLfxhZMSUQadky88/l8GqPMYXBHMZSA+sEtDR72beQSa6VKH/1x0lcP
 qGmq5E7Jip++t8P1iQ2mbj/HzYMm8/QfRGahrVr3W9TFRZeOAKP99IwqoM/Ib5VRGdgA
 kIKVlHwL889t7iGPOHI9XAIZ7jy/ktOxzwi/2j0GKQiugYC8JcCSrnfOeLGztt1pBWxb
 Phow==
X-Gm-Message-State: AC+VfDwTBY++np1XZnVmCMVvOmLDbgY5EBAzb39Sq1muOHkNeT8XWQqa
 8PbNbN+bc14bUBmnAzJXvXB2ZXUlQyvjJUCsMKI=
X-Google-Smtp-Source: ACHHUZ4/6ygaXH396ptUleoXhfyNcAbogYQHhBAQA2FvSnnGppckpi5MP6OXw0AWfi+V+bp+EngHLg==
X-Received: by 2002:a05:6871:6aa7:b0:1a6:a92b:6dcd with SMTP id
 zf39-20020a0568716aa700b001a6a92b6dcdmr23502950oab.44.1687816952038; 
 Mon, 26 Jun 2023 15:02:32 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056870a10c00b001b03fbfa0c5sm1831419oae.39.2023.06.26.15.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 15:02:31 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 06/19] target/riscv: use KVM scratch CPUs to init KVM
 properties
Date: Mon, 26 Jun 2023 19:01:56 -0300
Message-ID: <20230626220209.22142-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626220209.22142-1-dbarboza@ventanamicro.com>
References: <20230626220209.22142-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
 target/riscv/cpu.c       |  4 ++
 target/riscv/kvm.c       | 85 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/kvm_riscv.h |  1 +
 3 files changed, 90 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4768dcdf49..641bec3573 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1718,6 +1718,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
+    if (riscv_running_kvm()) {
+        kvm_riscv_init_user_properties(obj);
+    }
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


