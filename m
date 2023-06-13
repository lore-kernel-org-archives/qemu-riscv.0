Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BD2EB64D8
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:02:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9B7a-0002Lg-UA; Tue, 13 Jun 2023 17:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7X-0002Cl-BU
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 17:00:07 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9B7U-0006pG-Ee
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 17:00:07 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-39cd084ea62so2070705b6e.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686690003; x=1689282003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubJxPOXGsOZcqy3wEgQyj8Qt7Aaplc3qbF8C5aVIw88=;
 b=pHQMXa7D95mUZhK9LC44c/dPu+1E6/N7uS26U28Cq3/FiLURqVxkq9OE4vzI5Yrbpl
 Du4OLqG87/cqpEqq9oXZ1vvKPT9GV0ZxNtXxiz1w7iK3TZAp8sg03lcgZe7gt5KJsfcM
 ooBYS72Nj1+CBvvs3Gy9VQh/b6Qf21CPgnZtHVSippfSKRUSCmGi7Feytethl7dyEGtO
 6s8LiTWQ9VbeyxwJgnwkz3wDmRqrp5R58V2wlN+wCiaVqizztcINqv0pYrk4YS0V0ZXQ
 YX7ha9Gx2+/Kw5umKQ2wVfMgbRZNxz+De6k5jrGc1sfd4FTnmN62FsTxxsmKD4v+L8mm
 Xh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686690003; x=1689282003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubJxPOXGsOZcqy3wEgQyj8Qt7Aaplc3qbF8C5aVIw88=;
 b=gXAr6aUtYULT/DtAw0BSl/DnQaf0/o3KzuYeXo/2sOD+iBeZNmhuv56LThvrhc1WBo
 RZvJX/lH9o/Jywu/J0wfyVPafwduORtj8Gq4UMnf0fhZ9wiHFryCYAdKz3dge1S1wsMN
 8k/t05MEzSiIQWOv6n1Ya7BowMhDJfoHGYw/Ws4UNTZzajo41xEV5RhZQrd2t6ghVVEw
 J4CMQowyl1haBWQe4IZ8YtjPfFGepjTSH3h+FpJhIGFwXn+nIy6ea0RYf7qwGW5CHZW/
 3ZUsAuHCHP5cq5MBLJbZVg1sFcQAXQfwd8x2KF2Vm+1JciWoRB/p4BTo1Jtk5713l4gK
 xDdw==
X-Gm-Message-State: AC+VfDyexBiEU6LSS6m0HQa0b0StvJchguS934Pmhu1G+IT7PM8zRXrd
 vOuuVysqAFUA7OeyySiMurANfA==
X-Google-Smtp-Source: ACHHUZ4qc7qwjZn3adT+HR8OjvIE9Fx3eeCrcfSYh01FG1GUajgC7XSpTB/FuzPtB7RrK8cAM7YX/Q==
X-Received: by 2002:a05:6808:209e:b0:39e:7885:e2f6 with SMTP id
 s30-20020a056808209e00b0039e7885e2f6mr154842oiw.24.1686690003062; 
 Tue, 13 Jun 2023 14:00:03 -0700 (PDT)
Received: from grind.. ([177.170.117.210]) by smtp.gmail.com with ESMTPSA id
 q82-20020acaf255000000b003982a8a1e3fsm5619514oih.51.2023.06.13.14.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 14:00:02 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 16/18] target/riscv: update multi-letter extension KVM
 properties
Date: Tue, 13 Jun 2023 17:58:55 -0300
Message-Id: <20230613205857.495165-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230613205857.495165-1-dbarboza@ventanamicro.com>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
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
index 63bf97fbff..0b6dff70de 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -280,6 +280,32 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
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
@@ -795,6 +821,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
 
     kvm_riscv_update_cpu_misa_ext(cpu, cs);
+    kvm_riscv_update_cpu_cfg_isa_ext(cpu, cs);
 
     return ret;
 }
-- 
2.40.1


