Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DDFEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 16:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEBcx-0004Cp-4b; Tue, 27 Jun 2023 12:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcp-00044y-43
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:33:07 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEBcn-0004zi-B8
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 12:33:06 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1b0606bee45so757316fac.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687883584; x=1690475584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cm5y2gWYt5OAiZ+hxblm6TFm4mb5jHZNaimv5+Czdw=;
 b=YvIEKtQPa+VIsHMN7uMeMXwN74/rRI6j7pik3y7zcmU80F0gpzHInk3+Y0+K3vQ6kY
 8oXxKvIuc/UB++MY2Bh0HDrKzNuIxZB/onqP1YreWhKxueFxukNryW6VNFo4+tO9VmPU
 kuOYZ8cuVd8N4Be/DPxbJxbo18UCiPFaoDaTtMWKw3EyTb9xjxdd75TpgRTn6llcBV/A
 eNlJYHU0dsm7PdqfNNSZtx4gqR3AOvsKXdQtFlO3ndxPWX4RnHtGX1JqkxKv5Fn4xHY6
 4VyvuugMiBgQSbYuNiCBcBiAXPCNRG8uukQ4AZmsbiF3cBVyKzA/TLjQQ31LXMC2tKfq
 TJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687883584; x=1690475584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3cm5y2gWYt5OAiZ+hxblm6TFm4mb5jHZNaimv5+Czdw=;
 b=kUhVrq2TWJpHY5Ku0mDT4bQ/PZmmd49x3r5dqfb/9nXwWvF6+2kmJO1DnHWDNVEMBg
 KomZ5PNU5lB5Fb/JO+blcDSE94AStKzV+8+jD42y+cYz/M3lerpkBkNQr+1qBiPv4ffz
 l2Db3Xk8T2tX3GYCgzn/DFeMDSsk5mRpOXCFbnEtDVXr/McfL8kiGlZtUDMiw6I+h6sV
 1gqxI2YV1oWiqECI46/34xCfYt/SvMLTNU8X5CV5bDtWnIsYWz8NkAJBaIXpDj6vgEQo
 PtCFQnpZEeSZFsmhz9t34jy098rFBZmR+PmlL42CoJW+WXjvYoxyUKKNuY+Ed0QHFA0Y
 Z3WA==
X-Gm-Message-State: AC+VfDyxMl9tTJ7dNIKt7QawTpDjeogEx2pzSIZLhmpTtjdVNvNoY1eE
 3cyIUzweUYdewgCvd/dvpNOWkw==
X-Google-Smtp-Source: ACHHUZ6FxIboCuO1NMRFKwk8mdKFCkbwsgV9Yy07ELQYgXyIi6j/VoEj9Y9Fml2mOodjET8cu7+tcA==
X-Received: by 2002:a05:6870:6295:b0:184:266a:142f with SMTP id
 s21-20020a056870629500b00184266a142fmr28308658oan.51.1687883584371; 
 Tue, 27 Jun 2023 09:33:04 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 gu17-20020a056870ab1100b001a3093ec23fsm5254134oab.32.2023.06.27.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:33:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 17/19] target/riscv: update multi-letter extension KVM
 properties
Date: Tue, 27 Jun 2023 13:32:01 -0300
Message-ID: <20230627163203.49422-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627163203.49422-1-dbarboza@ventanamicro.com>
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
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
index 376bbc68b4..6eebeb123a 100644
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


