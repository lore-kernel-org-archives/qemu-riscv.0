Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1684BC7EE2C
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:13:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZf-00025z-K5; Fri, 25 Aug 2023 09:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZd-00023A-IO
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:10:01 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZb-00075c-AY
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:10:01 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1c8be41e5efso516632fac.3
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968998; x=1693573798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q6sK33IVnbphVwjonh2/0Kb5XcSOc7XGh7TryZP5fM4=;
 b=GoSOOP6XQ4bHTUDGBI8Uu6+pbXm4omjUrDqfi5MMg7yUHXUAE+3bD05UoIPGeG1gHp
 jRYf6yWpEWHj+IH0ExZSLGG7DL7KC9V52uD49FE1VheEs71a9KmfYMHBxNuo3k9KSz6A
 IG0NlrdP6mMBre91gKMi0IJ6jwqYRUri2hswVE02b481xPkk0PlrZYB1gyFhZxqp4gkb
 0MsasQ6Wyy53d9G1BJrCIF6C/Hq5wmExb6cvZ2qpfMpHGRAJMdEJB+wFdhq27byZrz6C
 pXB5rHF+efXESMzoUpdRH12aFYnZWSFEC2TooZNF8h/nIkmSoGyFy42RjMFdWZUEbpoD
 2xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968998; x=1693573798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q6sK33IVnbphVwjonh2/0Kb5XcSOc7XGh7TryZP5fM4=;
 b=eMCIDHPwgtOzLywjYq8m4miNSdNQ4igG1cSvQwMTJUm2jn/ukC96WyZ60YUcNIPWmG
 zpx0GZAxnqE+CEecUkdUcQDPeeVAolw+nJYzwUbmjupo/Zz5SyykMiDd4LB1Qo/Sxr9K
 8JOYmx1+pA/a6ymW+fvCcBksnJyi8M95U+498oKF/UViNuF8bD6YbpLrLbO0xWt5+6f0
 Y7iL/XKyic/uJnq2s7nuEbWl2hIEu1EyiMuGbYXT8uPCCUjl9hBHfitu0UWOIf9qfxD5
 tCSfildQReBnji4SiN2kfuAdKkEonHrUm8DsLWaByiYvf4tTGmXs3haUEWnSjguhdLSL
 7GDg==
X-Gm-Message-State: AOJu0YzAFInctx18ItSS92ma5udkvPxNh0suj4GaLYZxPEG2C1oU7BE3
 csXCzrqqCUskVb6DUQJT0/J/lQ==
X-Google-Smtp-Source: AGHT+IGmjyiopfa+pjuMYN6Fr7dgX03kvBLV1EHzakx/vSKPuKHtCJmHQ4WGdjFTKml6y9BKVsI2Vg==
X-Received: by 2002:a05:6870:e0ca:b0:1b3:f010:87c2 with SMTP id
 a10-20020a056870e0ca00b001b3f01087c2mr2986454oab.30.1692968998124; 
 Fri, 25 Aug 2023 06:09:58 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:57 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 19/20] target/riscv: add 'tcg_supported' class property
Date: Fri, 25 Aug 2023 10:08:52 -0300
Message-ID: <20230825130853.511782-20-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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

This property indicates if a CPU supports TCG acceleration. All CPUs but
the 'host' CPU supports it.

The error in tcg_cpu_realizefn() can now be made generic in case more
non-TCG CPUs are added in the future.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h     |  1 +
 target/riscv/cpu.c         | 10 ++++++++++
 target/riscv/cpu.h         |  1 +
 target/riscv/tcg/tcg-cpu.c |  7 +++++--
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 7c76dc0dcc..e86b76f9fe 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -71,5 +71,6 @@ struct RISCVCPUClass {
     ResettablePhases parent_phases;
 
     bool user_extension_properties;
+    bool tcg_supported;
 };
 #endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6817f94c2c..f749ea2a2e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -625,6 +625,14 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 }
 #endif
 
+char *riscv_cpu_get_name(RISCVCPUClass *rcc)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(rcc));
+
+    return g_strndup(typename,
+                     strlen(typename) - strlen("-" TYPE_RISCV_CPU));
+}
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -1637,6 +1645,7 @@ static void riscv_dynamic_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *rcc = RISCV_CPU_CLASS(c);
 
     rcc->user_extension_properties = true;
+    rcc->tcg_supported = true;
 }
 
 static void riscv_vendor_cpu_class_init(ObjectClass *c, void *data)
@@ -1644,6 +1653,7 @@ static void riscv_vendor_cpu_class_init(ObjectClass *c, void *data)
     RISCVCPUClass *rcc = RISCV_CPU_CLASS(c);
 
     rcc->user_extension_properties = false;
+    rcc->tcg_supported = true;
 }
 
 #define DEFINE_DYNAMIC_CPU(type_name, initfn) \
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4254f04684..1e6ecf52ee 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -732,6 +732,7 @@ typedef struct isa_ext_data {
 extern const RISCVIsaExtData isa_edata_arr[];
 
 void riscv_add_satp_mode_properties(Object *obj);
+char *riscv_cpu_get_name(RISCVCPUClass *rcc);
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 6c91978920..a13796c597 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -554,11 +554,14 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(cpu);
     CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
-    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
-        error_setg(errp, "'host' CPU is not compatible with TCG acceleration");
+    if (!rcc->tcg_supported) {
+        g_autofree char *name = riscv_cpu_get_name(rcc);
+        error_setg(errp, "'%s' CPU is not compatible with TCG acceleration",
+                   name);
         return false;
     }
 
-- 
2.41.0


