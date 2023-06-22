Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB9EB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:59:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCKp4-00080v-3Q; Thu, 22 Jun 2023 09:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKp2-0007wM-AQ
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:58:04 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKp0-0001n1-Hc
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:58:04 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-55e41318185so3520093eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 06:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687442281; x=1690034281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cm5y2gWYt5OAiZ+hxblm6TFm4mb5jHZNaimv5+Czdw=;
 b=DI0mFsQ3y9MABQnIcq0O3ycu7j3dbvfNpY0a3hUyGSfu2r21Vuu/YZxVhIJHQ0Tn2x
 zRXK/uJqkvqHqJ1WA+VxN3R5rHLQ8Skvi833r2T7rpIFwQN8dREEpkuYk//G1ri7rx1c
 0i9OnLchhMNYjGkHOidqH7VKHUX7MWr2m8cQAGkvGLkVMve81mHTBr4v1xiN6X/R/S1n
 hPAmFWCX1qIZxik3nSTOtFpcmvIoCvDWJCMA+Lh5+7+/HcVBXVxbjM5Xyql5U/2xIzHo
 lti6yhvZTGngegERbTX523BdUpocOA2qt3/LZFeIys5gPQSE0GYApVZHeIWM8TDt5vxl
 gtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442281; x=1690034281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3cm5y2gWYt5OAiZ+hxblm6TFm4mb5jHZNaimv5+Czdw=;
 b=GVMei2/fgxLzeWnhjAuEXmWcMkBjS5DddoUVViCICKjFEK08I5tz7l6YZiuYGD0xg/
 7NOBHAg3Z70zdCrnwBgLRN4ylEw9UYmMBrA0twb71pqM67SWwJdsQrX2cjXAUUK1Cce+
 5pg24uo2eI3a+fDZ2FcppsD0Ugxw0AtYaz447MI/kjwA0HICC1GvkQn/PaE4Pv+L2tDW
 nTqHdUoFom2fJ6+3KASpVibg6RqjhhWNHaO8+2m4pNh5BSsQKOvNACRZ8GSDTs0KmX9D
 CU/HP8NcH8kWuq0u1u9WBuuEmsebe+CKAyk3l+dLt4Thez/ikzXF/LDunv20xsaYDs91
 TdFw==
X-Gm-Message-State: AC+VfDz44vvHTaKiFdKCMHX7GtS1rCgUSAYm37zPhAXJ/PrdrA9OOLNl
 WpNftartA5oYPswWc1CNg9X7Ug==
X-Google-Smtp-Source: ACHHUZ4MOKVqNEh7bksKj2+zTVp0EuxtdOE3OuOpMBhF5PhU7tnvnPEeJIb04WjVN3CCdu0Io7mLNQ==
X-Received: by 2002:a4a:d0b8:0:b0:562:eb5c:15af with SMTP id
 t24-20020a4ad0b8000000b00562eb5c15afmr658352oor.8.1687442281500; 
 Thu, 22 Jun 2023 06:58:01 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a4aa446000000b00562f06fb5easm156677ool.11.2023.06.22.06.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 06:58:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 17/19] target/riscv: update multi-letter extension KVM
 properties
Date: Thu, 22 Jun 2023 10:56:58 -0300
Message-ID: <20230622135700.105383-18-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622135700.105383-1-dbarboza@ventanamicro.com>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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


