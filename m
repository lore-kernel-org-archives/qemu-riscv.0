Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74E1CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 19:58:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtCfB-0003sN-9l; Wed, 18 Oct 2023 15:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCf9-0003s6-Eb
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:57:03 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCf7-0001dJ-ML
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:57:03 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-27d4372322aso3592078a91.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697659020; x=1698263820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=goSM+plzgjI6cpvIrsL3gQcrpcnNxW3GYfnrMcJsUz0=;
 b=kAg7HUqGptswJakkLSOw7stXt1AfH7BhYT2E1PsUZjxlQkhv4Ic1Hv20aURQBng2vb
 dTogTkl2HMMedleLXKwXte2JYyHVzSGdBbIdonTNW4oDyjwzbMgrcyUwxXTAnCEagYMe
 xfAVbSwOqn9G7cc0kxZbevydqKO/tY+MHzfM7a+/T4xJTk5BT5f3mZqrgKvlmqzGTyaF
 /6gt7+rg0dClnw1guQSoThvkbTD09BiEdU6mZurHZInNPl4rflIyR335gUlgIfOf/Yuv
 5ssMvcu1bs7fJyh+7EqHRAzVaEBUn2IeI/PAuR+1bchNi1n6w1Tgj8cDxbNuLosTiRja
 PsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697659020; x=1698263820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=goSM+plzgjI6cpvIrsL3gQcrpcnNxW3GYfnrMcJsUz0=;
 b=ql9QazW8DW6Jf77nOEEvQsblr4tj1vnuBSATTqtNgp8aAmAFHdhktthfOOWwnL+y0o
 RbCpeQF+fcD2yuBbX7wJhoUcl7adAF6EJHK8hXMZisfLGle5CyJLEAgewqehoArEpjXk
 vUkdybYnLEnqIjdPFD+LzVsvYp9CwHbpRwPZMwYUu+xJNxEAfuHcaQVjRXIFwklLONY9
 z+DVJTGtfyc2jzFWLQcg+LMLn6xW+vJteoNWcKVVyoFXj+UjzD3E4FG4wRxoYtM9j28S
 AYnZW6gJKmDfzXnqEPCrgrFyhAA3MkamRmDIb4e4cbKPo/uZdavT0IwctGMJQS1OOptj
 0tCg==
X-Gm-Message-State: AOJu0YyZQof3p2eS6W9Wmy8+eX6HOwbGYH/d9OjfN86alBosLNU4Xbjt
 vcuzjGABQtRBmO0kg3rnEED3Pw==
X-Google-Smtp-Source: AGHT+IFyfYRuzTlB8SSBkUB1B/AROG625A/LjDrNNGdzsFVvTnjqr7m/6nrykted8jylI0O8QiUM+Q==
X-Received: by 2002:a17:90a:5886:b0:27c:ed8e:1840 with SMTP id
 j6-20020a17090a588600b0027ced8e1840mr198371pji.10.1697659020159; 
 Wed, 18 Oct 2023 12:57:00 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 ku12-20020a17090b218c00b00268b439a0cbsm256359pjb.23.2023.10.18.12.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 12:56:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 5/6] target/riscv: add riscv_cpu_accelerator_compatible()
Date: Wed, 18 Oct 2023 16:56:37 -0300
Message-ID: <20231018195638.211151-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018195638.211151-1-dbarboza@ventanamicro.com>
References: <20231018195638.211151-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add an API to check if a given CPU is compatible with the current
accelerator.

This will allow query-cpu-model-expansion to work properly in conditions
where QEMU supports both accelerators (TCG and KVM), QEMU is then
launched using TCG, and the API requests information about a KVM only
CPU (e.g. 'host' CPU).

KVM doesn't have such restrictions and, at least in theory, all CPUs
models should work with KVM. We will revisit this API in case we decide
to restrict the amount of KVM CPUs we support.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 9 +++++++++
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 7 ++++++-
 target/riscv/tcg/tcg-cpu.h | 1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 02db0834dd..8e0abe33d3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1063,6 +1063,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu)
+{
+    if (tcg_enabled()) {
+        return riscv_cpu_tcg_compatible(cpu);
+    }
+
+    return true;
+}
+
 #ifndef CONFIG_USER_ONLY
 static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8c9ec59d82..8efc4d83ec 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -758,6 +758,7 @@ char *riscv_cpu_get_name(RISCVCPU *cpu);
 
 void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
 void riscv_add_satp_mode_properties(Object *obj);
+bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 21a46f2a0e..6771617226 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -581,6 +581,11 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     }
 }
 
+bool riscv_cpu_tcg_compatible(RISCVCPU *cpu)
+{
+    return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST) == NULL;
+}
+
 static bool riscv_cpu_is_generic(Object *cpu_obj)
 {
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
@@ -598,7 +603,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(cs);
     Error *local_err = NULL;
 
-    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
+    if (!riscv_cpu_tcg_compatible(cpu)) {
         g_autofree char *name = riscv_cpu_get_name(cpu);
         error_setg(errp, "'%s' CPU is not compatible with TCG acceleration",
                    name);
diff --git a/target/riscv/tcg/tcg-cpu.h b/target/riscv/tcg/tcg-cpu.h
index aa00fbc253..f7b32417f8 100644
--- a/target/riscv/tcg/tcg-cpu.h
+++ b/target/riscv/tcg/tcg-cpu.h
@@ -24,5 +24,6 @@
 
 void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
+bool riscv_cpu_tcg_compatible(RISCVCPU *cpu);
 
 #endif
-- 
2.41.0


