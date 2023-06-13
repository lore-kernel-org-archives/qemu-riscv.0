Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EC2EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:02:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9B7L-00028Q-2z; Tue, 13 Jun 2023 16:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7G-00026w-82
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:50 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7C-0006kd-7m
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 16:59:50 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5556e2bddf9so8898eaf.1
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 13:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686689985; x=1689281985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6y8l+qgZYKHF40Q3lIRPCdTWnb4sLgxntQ7wIOvnirE=;
 b=IKzJJ9XEqTKFlnygBBaE9cUrhzRwhbe5KqXKmdQZFHFQ3n1QvF1ZVkpCyfOSB00mAK
 lcrKyT/i3Vi3gnyVtEYQA7g06We3gsokoLF2egouuKoWo0rdcWpVBVjnMmEjfDcjRR/b
 eNU0UIbY5rLjyPzzle1mTbC03/WBVn8WQKrb/BNogbL8O0hZxsWmmb0qatDTfN0chYTg
 GvL4rV3eOz5YI8gCPSer3TNkwvhJtU56tUGZy4xAS//ASVKMVucoloM1X0SFelak7HvF
 7mofJPLSpW6rjjxnqVcTjjjP0HbdjwTmiRN5AFV2Dq6FDOFR9kbQRkcr5O+O2YKLOSbg
 nzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686689985; x=1689281985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6y8l+qgZYKHF40Q3lIRPCdTWnb4sLgxntQ7wIOvnirE=;
 b=Laxgu/z9Aa1EPoI5bu1/ynZpQ4MUcnDRAXrYq5XTD0oMSsw9QILKRgfSK7X0mMWHF7
 DKzP+SJ+UC1lSf0GQ7ueDl5/7Mfbtvt1tBl3lkrtB+sXWG8Zj0Ed9Fi+qEABXXWztTKY
 UILns/0jBFIMbXqXFy1ghWSEuH1a8U26eoiDoGLkwK3ikC7+wObdbzF5BKACWxpyEijO
 d2oui8Yg5KByeid1bXqVygRuAD306Dq6EP7ao2yIzmlgI3Ju1LzypXd/xVEaXEtBcmmY
 sIqGvQ0k37F6yNlSf4CtUrv1ueBmJTnLd2UVevfzMbxe7zrcNLq/nTHgzpi3GbhNu5Yh
 KBKg==
X-Gm-Message-State: AC+VfDxb+lpuZoHUe2WMb2cKIHPL3M9ky6LNM+x5nKHuBWzoOW7eKf2M
 WQylHJ+OD9VT1AQisfhgq6d1j7mPwUcSyV10Ri4=
X-Google-Smtp-Source: ACHHUZ4pORLxgdOhoUvOiCG73HcN3OEBtriGjJOzpGeIa2dxHJrc6RDtpyZDl5DxdLqJ6iyJFE+tIQ==
X-Received: by 2002:a05:6808:158c:b0:397:f94e:4321 with SMTP id
 t12-20020a056808158c00b00397f94e4321mr9880625oiw.23.1686689984878; 
 Tue, 13 Jun 2023 13:59:44 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 q82-20020acaf255000000b003982a8a1e3fsm5619514oih.51.2023.06.13.13.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:59:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 10/18] target/riscv/kvm.c: init 'misa_ext_mask' with
 scratch CPU
Date: Tue, 13 Jun 2023 17:58:49 -0300
Message-Id: <20230613205857.495165-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613205857.495165-1-dbarboza@ventanamicro.com>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc35.google.com
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


