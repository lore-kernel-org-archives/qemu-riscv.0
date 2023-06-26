Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C58EB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 22:09:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDuIv-0003uX-DM; Mon, 26 Jun 2023 18:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIM-0002R5-1h
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:02:52 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDuIH-0005xe-5Y
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 18:02:48 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1b0605d4d11so5263fac.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 15:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687816963; x=1690408963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nvD2DfqdT0yLrhg4B8fLoR2B1muCOTUleRsfoLErt80=;
 b=UK4/5fWE+G6G0OsSQgs+OKGf8dvxnx0XXp31t2Ij0YLCsoMPU2S4WyGPOJ824nyaCR
 AZPQ6xwe3gHmtOdQa1ubPqE5M01b0JZ01zwKmPUpvOWaUoOl7VvZgtfnyvhU+S9/bG/X
 wuFH4ApC3et87iGVlXhnt16ZWaaw8dkymE+LXkqfmSuHLACkiyfEHP5snh6QdMfGG6cJ
 EM1Zs5uPYgUecuJi728dwz/Vwu256TFUkJAsf2VfglX/jyu4M7pZ0ek6yRasxu38bTh3
 WImjdXlE/+3iVSbIB0pcBFNyC5iMqrPAe2qaJOA764Cz/aOH/LdB1l+Sz8YX71Rp6kMu
 dSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687816963; x=1690408963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvD2DfqdT0yLrhg4B8fLoR2B1muCOTUleRsfoLErt80=;
 b=O7p87AiOo58IwSuv/X5KMAYFf/S4a1/WIniRD4gOloIE03rwsaBEGHfnz1O/Ex5qkN
 ljpxDx136iJjWTX+jeDoPulP8yzkgwmC014uJL2LFsrJbDk0SM96yteurBMjNBGD9Yri
 N/8T9kOFsC2m+trt1i04WlOM4vYAO+ttZSu+lKAX3MwsjVelO2z9Z+wR7B36043h3T76
 hdyFtBxXBAxBd3rD5/gz0YBXlzEvDcR2jtqtD8TsrIEQVgHJs3VQeRZ/F7OSXWtUbFA7
 P/lsbDV5hTiFlvXZehr6a5ZbSxZAr0Qnyjv494seUZC1KjZsKLyB33XqMbLCrHVqVoSE
 Ok0w==
X-Gm-Message-State: AC+VfDwxJV3lEoDSowSeiY6dSABlNj2MQjGgdYNgyBmBhWfnlZYiQB/O
 LBIXd0gxfN43ViRm/yHjBhOD6w==
X-Google-Smtp-Source: ACHHUZ6GoYWCMUefLiL9RVWZsPIr6kgJ8GQkefli15eqevDMqqh7gniK8dOAZ0dpiYJmBWv9kTrU9Q==
X-Received: by 2002:a05:6870:32cf:b0:1aa:f3:5b3b with SMTP id
 r15-20020a05687032cf00b001aa00f35b3bmr36330685oac.17.1687816963405; 
 Mon, 26 Jun 2023 15:02:43 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056870a10c00b001b03fbfa0c5sm1831419oae.39.2023.06.26.15.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 15:02:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 10/19] target/riscv/kvm.c: init 'misa_ext_mask' with
 scratch CPU
Date: Mon, 26 Jun 2023 19:02:00 -0300
Message-ID: <20230626220209.22142-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626220209.22142-1-dbarboza@ventanamicro.com>
References: <20230626220209.22142-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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

At this moment we're retrieving env->misa_ext during
kvm_arch_init_cpu(), leaving env->misa_ext_mask behind.

We want to set env->misa_ext_mask, and we want to set it as early as
possible. The reason is that we're going to use it in the validation
process of the KVM MISA properties we're going to add next. Setting it
during arch_init_cpu() is too late for user validation.

Move the code to a new helper that is going to be called during init()
time, via kvm_riscv_init_user_properties(), like we're already doing for
the machine ID properties. Set both misa_ext and misa_ext_mask to the
same value retrieved by the 'isa' config reg.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 602727cdfd..4d0808cb9a 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -396,6 +396,28 @@ static void kvm_riscv_init_machine_ids(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
     }
 }
 
+static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
+                                         KVMScratchCPU *kvmcpu)
+{
+    CPURISCVState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int ret;
+
+    reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
+                              KVM_REG_RISCV_CONFIG_REG(isa));
+    reg.addr = (uint64_t)&env->misa_ext_mask;
+    ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
+
+    if (ret) {
+        error_report("Unable to fetch ISA register from KVM, "
+                     "error %d", ret);
+        kvm_riscv_destroy_scratch_vcpu(kvmcpu);
+        exit(EXIT_FAILURE);
+    }
+
+    env->misa_ext = env->misa_ext_mask;
+}
+
 void kvm_riscv_init_user_properties(Object *cpu_obj)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_obj);
@@ -406,6 +428,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
     }
 
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
+    kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
 
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
@@ -525,21 +548,10 @@ static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     int ret = 0;
-    target_ulong isa;
     RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    uint64_t id;
 
     qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
 
-    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
-                          KVM_REG_RISCV_CONFIG_REG(isa));
-    ret = kvm_get_one_reg(cs, id, &isa);
-    if (ret) {
-        return ret;
-    }
-    env->misa_ext = isa;
-
     if (!object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
         ret = kvm_vcpu_set_machine_ids(cpu, cs);
     }
-- 
2.41.0


