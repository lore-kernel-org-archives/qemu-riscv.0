Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CBAC77B7A
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:49:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45JQ-0006l5-32; Tue, 30 May 2023 15:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JH-0006iU-DP
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:13 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JC-0004KN-0r
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:10 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1967cd396a1so3485006fac.0
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685476023; x=1688068023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GiLv/mMyR/lX2Ul3OkR5/DnIxMohqsEw/laPeSH3Mc=;
 b=nRT6+kygW28WSwgalx5l9U0ePI1GiEuj0iU4CkAvB3YWP00uOlJcElcOj0haGZWEr8
 EPr81mNclK9GCCrprj5se7llewy94pRpFw+IZFuNSlrp3LapQNukSgMf0bEzh47yyvHM
 V9ZXa7X1SWEAjTNx87v6LgKVE5j01VUn+ECO+ib6xZhIrBzSssMPuGz2psaQJfLCX1c9
 jBhLeiX4E+FSMM6bkXVBT8nKusJib3NCs3nz0P98AZhgQ+6DJ5OMjzQ1WsKZ5ghaUXaG
 tMQGiYva2GBPtwL82U3it94tNO3m3UbqI5GOuYVeiI1jqWwBkODA1H2ezTsSDExFBpAl
 dGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685476023; x=1688068023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GiLv/mMyR/lX2Ul3OkR5/DnIxMohqsEw/laPeSH3Mc=;
 b=OhIe8gr4UllSf6eSAALSupPs7rKW1AXaHsIOQZN/AQd7LKBywK8r6Y+MiYO/KShFpk
 Ya7GaM4T9uyqIm8CB0g+ieDw+Gp5tY0lbTzy5qi6HYinsDAfSYCxRCyNb/XegSAMctGr
 TsuhLRV/ysiihF4bYzLhM93gVk15iz0MUD4aOGORn0VxVxuHLpF3kRY+X86Zh5eQWeKY
 pywjii8BjVucJQNrMXrPsnoDEJYYkfQILzdq5o6for3SrYAjSA1J0A/+c6Yd8q/Xp5w9
 Am4x3ttXu2mTDXHtP05Vpp/tVflbv7fO8Jt8f9Beye+iwcr7/hxISn2rLkfNQXAzgR03
 sCLw==
X-Gm-Message-State: AC+VfDzt4LM1E/OAHSNaVD3WKDiPnBaENGACV/4s/FmN7gMaqbG7MA33
 XLPyg06RnhkolZGCVr2wmBJz4g==
X-Google-Smtp-Source: ACHHUZ5nHCOUByyc8r3ZRvEkuliBP6IIsiQyhND37tJiDQ7oXmgRGtEJleY8tSC1dLBQzRD27igG8w==
X-Received: by 2002:a05:6870:e393:b0:19e:e6e8:46f9 with SMTP id
 x19-20020a056870e39300b0019ee6e846f9mr2706429oad.30.1685476023535; 
 Tue, 30 May 2023 12:47:03 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:47:03 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 10/16] target/riscv/kvm.c: init 'misa_ext_mask' with scratch
 CPU
Date: Tue, 30 May 2023 16:46:17 -0300
Message-Id: <20230530194623.272652-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
2.40.1


