Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746CDC2FC08
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 21:39:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qj4tj-0005FO-CF; Wed, 20 Sep 2023 17:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4th-0005Bu-Tk
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:38:13 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qj4tg-0006YD-6q
 for qemu-riscv@nongnu.org; Wed, 20 Sep 2023 17:38:13 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1d6b4735158so144680fac.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695245891; x=1695850691; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPhfOSWnkLU5mAYkYDZTdFs/AmMh6zDJgUbX9Hh0aqI=;
 b=h6MaQUBjTm8hoPjvqAu/3SRTjcSdr2VeXtOD84I2ZPL1LF+8l2XG1d0t67MHhZp9Zv
 bgrPOYdASzfNF/xi3wy8TG5ULzGaeX5iTh1hr+WbllrGQde7i2B+yXjQ6rOpJ5/kzneA
 WFNmuW/prEY8344uV2OaoqxOCRGhnkoTiEYE8nVYX7DP9IIaYMMVOFD6H6lueSWrkjyN
 rzCcdlpHEkt2bQvwq07/eCVAz+CrfK9pRrJ9n1KvqLjfEAwEnPV0tCik0cZ/dQ1pkkbw
 BQyCIxtEY0clXzYCVmJRplw0/aARmI993tkZnDamN++QTOQvVUGkUuyvnn2bUPMs2IBI
 oQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695245891; x=1695850691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPhfOSWnkLU5mAYkYDZTdFs/AmMh6zDJgUbX9Hh0aqI=;
 b=okRZb4YvIHOmiL5jYC2cB4zxVhpIMQQDKuv775Yab4ziT8oBwr0PdrXYkhcfDGi6uq
 40kb2ngU6Y4GtdsO1n8U5in6tPUZDnvh4PwkzRbbsp3ZleR50hvng8bbIuZSE945nAE8
 f6mb9zpZvpjUnzQ2MEJrQg0lpHqIeOBkaFr9oOBwBzN7S4sqkKKQLCoLnQW9SqHcGmju
 i20pkuZ+0L0VHkz2KHAhqyZwsGgOfYTMAsvIVQVtfmXVfju9wI6hEUWHePBlUmfB2zP0
 1lOfUJxhswHGn3lZi5TtSEHh1MDWBRimQO84XU/pxe/qezvLWXItqET557+gKfdOP4tM
 8BZw==
X-Gm-Message-State: AOJu0Yz3g1eMQ+WOPDDfhr376hT/uwrgNv4GjFifstpK/kU7Ui495DC4
 /A6FmvoeMuRp0n3jt0k1RiAz5A==
X-Google-Smtp-Source: AGHT+IFIE5fmxWsb3FJMWCSjJDrf9x7l4DmQoTjen455wyMSUD5aj5/uM/IOAaqPGiKYP5sz+JKL5Q==
X-Received: by 2002:a05:6870:170a:b0:1d5:a377:f389 with SMTP id
 h10-20020a056870170a00b001d5a377f389mr2589488oae.22.1695245890893; 
 Wed, 20 Sep 2023 14:38:10 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 e1-20020a9d7301000000b006b83a36c08bsm64415otk.53.2023.09.20.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 14:38:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 7/8] target/riscv: add riscv_cpu_accelerator_compatible()
Date: Wed, 20 Sep 2023 18:37:42 -0300
Message-ID: <20230920213743.716265-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920213743.716265-1-dbarboza@ventanamicro.com>
References: <20230920213743.716265-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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
---
 target/riscv/cpu.c         | 9 +++++++++
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 7 ++++++-
 target/riscv/tcg/tcg-cpu.h | 1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 272baaf6c7..8bdf6dbd5d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1061,6 +1061,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index 1bfa3da55b..00b0507b17 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -734,6 +734,7 @@ char *riscv_cpu_get_name(RISCVCPU *cpu);
 
 void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
 void riscv_add_satp_mode_properties(Object *obj);
+bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 52cd87db0c..071a744a43 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -582,6 +582,11 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
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
@@ -599,7 +604,7 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
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


