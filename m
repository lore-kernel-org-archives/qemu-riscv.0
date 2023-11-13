Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AC5C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 21:41:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2eeU-00066f-Q2; Mon, 13 Nov 2023 16:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeT-00066O-OC
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:25 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeS-0001TU-2g
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:25 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cc5b705769so44788655ad.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 13:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699911562; x=1700516362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmMujTAnDCnLNQCIKB7A1R2XebVoD2eMHYsCnu9fyhk=;
 b=O02OGq8InUtk1FbDVI1FCuiIhoDCO+IM0SWZ2vAjkBfstSYR05O8EDcJgMubSU2R29
 Of40NHhI9Ev2S8eWcT16kEal8aA9H4rZ4/PT/I++oAPpd08BtCG/ik6gvGpm033xkJVk
 60LN+ggXV+yNkj7L+LUPmiTUDuy83pCvBaUZk1CgcQi/bxSDuzjqXfeQTeg1gNSEQzki
 u9ZvZP1P2RFajh9K+ieGjWh6VnGrk4DOulFswchO+9VTdL1R3MWbcf8d4lLlASk7fHAk
 7O84cNGAgXK//oXKnvdUvyXToG4NrL/bhjaJnDPAJKchbuntPlBps1FV3K/+hQMvPTmU
 tcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699911562; x=1700516362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmMujTAnDCnLNQCIKB7A1R2XebVoD2eMHYsCnu9fyhk=;
 b=X6Vk2/NZvIZ7AF4rB0xnMqtK9m8gLSCUIypK4hgC4IqLzUHqJaou4K4ZlNdkEh2l2W
 2BYj49H/1/C6mwBP3VnuOpQSBBqyONuQjyKDPd4aAi3lPi23A2xkGO9/bOjvHsyFz30V
 DBaYVLaYvf1sjnJgd1f9NAA2EeUOZb1MUJ91Q0LOqYOsUlJ+AgbaB3gd58oROj48XCiZ
 AIisDlo2/tfOKpY/t2Gx6HVBIvpNPn74t083WitExqvXZakqYNEK+Ez4gw774/yelzK0
 EIKBXXb857cdcj6oE0hzxKEcKi/8RPQluqxSJ0JiYQ1LBWxBM2wqFhn3gkD3Q14UVNik
 QqqA==
X-Gm-Message-State: AOJu0YxK01IuCJIvwxsyL8LHK3dvNUDPC4QMAFPRqMXufKOzkgRsqlHs
 tNY2GaoxUaLhRNbZocg9q7bXKg==
X-Google-Smtp-Source: AGHT+IFtumLXoXJHE5GgejqeRFnAxZ34EQZzDRBdIuMBq+5FIfAHHtsEfIaCBgZ9t/Od0Z1n5CA+0A==
X-Received: by 2002:a17:902:a403:b0:1c9:aac5:df30 with SMTP id
 p3-20020a170902a40300b001c9aac5df30mr419352plq.66.1699911561886; 
 Mon, 13 Nov 2023 13:39:21 -0800 (PST)
Received: from grind.. ([152.250.131.148]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902900600b001c736746d33sm4455423plp.217.2023.11.13.13.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 13:39:21 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH for-9.0 2/6] target/riscv/tcg: do not use "!generic" CPU checks
Date: Mon, 13 Nov 2023 18:39:00 -0300
Message-ID: <20231113213904.185320-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113213904.185320-1-dbarboza@ventanamicro.com>
References: <20231113213904.185320-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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

Our current logic in get/setters of MISA and multi-letter extensions
works because we have only 2 CPU types, generic and vendor, and by using
"!generic" we're implying that we're talking about vendor CPUs. When adding
a third CPU type this logic will break so let's handle it beforehand.

In set_misa_ext_cfg() and set_multi_ext_cfg(), check for "vendor" cpu instead
of "not generic". The "generic CPU" checks remaining are from
riscv_cpu_add_misa_properties() and cpu_add_multi_ext_prop() before
applying default values for the extensions.

This leaves us with:

- vendor CPUs will not allow extension enablement, all other CPUs will;

- generic CPUs will inherit default values for extensions, all others
  won't.

And now we can add a new, third CPU type, that will allow extensions to
be enabled and will not inherit defaults, without changing the existing
logic.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/tcg/tcg-cpu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 08adad304d..304211169e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -654,6 +654,11 @@ static bool riscv_cpu_is_generic(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
 }
 
+static bool riscv_cpu_is_vendor(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_VENDOR_CPU) != NULL;
+}
+
 /*
  * We'll get here via the following path:
  *
@@ -722,7 +727,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     target_ulong misa_bit = misa_ext_cfg->misa_bit;
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
-    bool generic_cpu = riscv_cpu_is_generic(obj);
+    bool vendor_cpu = riscv_cpu_is_vendor(obj);
     bool prev_val, value;
 
     if (!visit_type_bool(v, name, &value, errp)) {
@@ -736,7 +741,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
     }
 
     if (value) {
-        if (!generic_cpu) {
+        if (vendor_cpu) {
             g_autofree char *cpuname = riscv_cpu_get_name(cpu);
             error_setg(errp, "'%s' CPU does not allow enabling extensions",
                        cpuname);
@@ -841,7 +846,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
 {
     const RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
     RISCVCPU *cpu = RISCV_CPU(obj);
-    bool generic_cpu = riscv_cpu_is_generic(obj);
+    bool vendor_cpu = riscv_cpu_is_vendor(obj);
     bool prev_val, value;
 
     if (!visit_type_bool(v, name, &value, errp)) {
@@ -865,7 +870,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value && !generic_cpu) {
+    if (value && vendor_cpu) {
         g_autofree char *cpuname = riscv_cpu_get_name(cpu);
         error_setg(errp, "'%s' CPU does not allow enabling extensions",
                    cpuname);
-- 
2.41.0


