Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FC2EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:19:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHM4f-0006zg-AH; Thu, 06 Jul 2023 06:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4b-0006az-28
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:54 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHM4Y-0007E1-Dy
 for qemu-riscv@nongnu.org; Thu, 06 Jul 2023 06:18:52 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1b06a46e1a9so529609fac.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Jul 2023 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688638729; x=1691230729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sK8Q7kUgISTidewyExhAXIRgEYgEXzTq8t13zbdcf5U=;
 b=bq9n1tqXkT217k1xhhCnamydQ/yPPxLT9NANq3veBERQe+Pp2yJRD24NYWHf7MEsz3
 q+3UspFg0Gc53xMteH9+PF0rcLSNlNuJsRc+bzX58VBHNSCJboRCaNiNQjwDaXfA0NSQ
 hrZ9oObq88vcdmXjhXKeC+p4QPBXIQJJCXJnx1N/CYE2I1WcpOlVwSQCbEi43+07orAW
 Y+YaELFkNg/VzEUiciZwD5dkA/mpXUqbalZYt8S5rH2s1026qE+tPs74Oqft1fHz/rdQ
 E1a+HsurdlF2iPh/rxvsukLPBPnvP2wcyb2Joqa3Z8BUZuEp7DESAzfLgN0K983UWcSD
 c1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688638729; x=1691230729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sK8Q7kUgISTidewyExhAXIRgEYgEXzTq8t13zbdcf5U=;
 b=cmH8wU/hCmLSXK5Eo0Jh+vJohSs/SSqyFk0mntYCRCt47KTRMLcBHitv7Uxe20ta7x
 d8YwrRekqnW4DowIo28BuVLHWtKztU2q1LfldsSp3g8mDTDB4WzQGD+CKHAyMCj4l6X6
 5DbCHUI9MALUgqjSg79BtZetZIWNcWhClA5xvca33gmyUxkcgokreItAW6J+HkAz8Svo
 8zqh4LJJuxBbn9z3ElEf0+8qx9syJDmkP6BYWGRcg1GwDyr/tGQyhw8nHeIi3PptPExU
 N6n/P8kswwuEzH5QpXqmLePiowUxW5/xQmuLYgreuNYmRtmT3yzcE6UDYRk3D0Wl/KfA
 5+HQ==
X-Gm-Message-State: ABy/qLbG4CUbY4cyU9WagV6pABobzN4LQDYCNiShWfqjaOcIf3UvaVeq
 FqtkK2DeHVE0YdaFElcZQ4xvBQ==
X-Google-Smtp-Source: APBJJlEQ2EZwuX0YTYsAfnwfzw2uXuYK/G3D/OzUR6t6+NnySdqo95cZeGcPrO8nwxPeKW3eeS0+Vg==
X-Received: by 2002:a05:6870:4205:b0:1b0:49a7:c285 with SMTP id
 u5-20020a056870420500b001b049a7c285mr1836950oac.24.1688638729321; 
 Thu, 06 Jul 2023 03:18:49 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6a59000000b006b8850ad193sm511382otn.56.2023.07.06.03.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:18:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 18/20] target/riscv: update multi-letter extension KVM
 properties
Date: Thu,  6 Jul 2023 07:17:36 -0300
Message-ID: <20230706101738.460804-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
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

We're now ready to update the multi-letter extensions status for KVM.

kvm_riscv_update_cpu_cfg_isa_ext() is called called during vcpu creation
time to verify which user options changes host defaults (via the 'user_set'
flag) and tries to write them back to KVM.

Failure to commit a change to KVM is only ignored in case KVM doesn't
know about the extension (-EINVAL error code) and the user wanted to
disable the given extension. Otherwise we're going to abort the boot
process.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/kvm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 2d39ec154f..ba940e570e 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -273,6 +273,32 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
     kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
 }
 
+static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t id, reg;
+    int i, ret;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
+        KVMCPUConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
+
+        if (!multi_ext_cfg->user_set) {
+            continue;
+        }
+
+        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
+                              multi_ext_cfg->kvm_reg_id);
+        reg = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
+        ret = kvm_set_one_reg(cs, id, &reg);
+        if (ret != 0) {
+            error_report("Unable to %s extension %s in KVM, error %d",
+                         reg ? "enable" : "disable",
+                         multi_ext_cfg->name, ret);
+            exit(EXIT_FAILURE);
+        }
+    }
+}
+
 static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
@@ -792,6 +818,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     kvm_riscv_update_cpu_misa_ext(cpu, cs);
+    kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
 
     return ret;
 }
-- 
2.41.0


