Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD819C41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:23:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeYe-0001hu-5h; Fri, 22 Dec 2023 07:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYa-0001d6-U0
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:12 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYU-0006Ar-7h
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6d2350636d6so1673364b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247785; x=1703852585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohkcTHo+nO+qUyiKr9PwLX4xkcWJcEp6mLlOiRy/wj8=;
 b=bBTW/DFnh/Ck9FdlveukDF4NRCIMMeNTMghXHA4DmWvWirfD39wCH931f0cy+62kak
 WifeOX93griBol4KoVhww4kx5h840lBbsus9grE1CSt9+7yhaQKe8zx0YUsCnnetzVmq
 c0wq+/7hyiGca8fyBh3qaw+4ytqDBjLOdF0KNK7Mgfcqu2UVWZJuKAZRZS1Cy6mGBxHM
 u1ggAioEpbUYNzFGWPqaXM5o9Rrhpnf7Y+p20annvPUY7CRZfYylWdAPHQX6a8rVQATJ
 qKunxG+EhVtAWim45Ndyf9L7PwSLMmjBLMrkMpXzQQEGpZ8CibbjLxLQYouI66ll9tz+
 NrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247785; x=1703852585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohkcTHo+nO+qUyiKr9PwLX4xkcWJcEp6mLlOiRy/wj8=;
 b=macH0LZZ8Q09cpuYa8NCxrwWnaOMTYlZ49WP1IQ/e/pZuhwQpRWUw+tvLQ4jIBIQfc
 Z/HZvZST1e2D/ZBLtuh9SBQQyUFANx6MRbyTp2b83MEwTtUnhrOBsCm8PDSr8DOfpEav
 wbU+K9r4mXcqVAm/Rt+3IROlY+0BIFqFcUtUi7vIQL6IiM2YkOXG9AhK7G/cjCo5Isgn
 ZhREYzVoyqwDMPlylo49xENMx1KLi+nAfRNH8nhFKV8TKVZlmCDsfFJ5ogjzhUHOqOn8
 5APD0Uzz8k0PX9QR84G02/JQZ8QL917mndqBf82tAk2P6hhWcSRb0cj5l1HQ7fzmbJw9
 X50Q==
X-Gm-Message-State: AOJu0YxsxS/0/QCY5GsZcLUwpjEFPridTUiJcDLmHcLNRe8Br7E3SpNv
 P+TRonObfOA0tM50UK/TonA2RRPvbCmdjGTY6g3BcOeZv1RLWA==
X-Google-Smtp-Source: AGHT+IFhEaB7dA+SXEVIqb0pLI/6H6vpDW2g0cMBqmA1rPdbcGO4ZlNo/sbXKzI/nvDaDag6WAIE4A==
X-Received: by 2002:aa7:8611:0:b0:6d9:83a8:658a with SMTP id
 p17-20020aa78611000000b006d983a8658amr1191057pfn.43.1703247784921; 
 Fri, 22 Dec 2023 04:23:04 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:23:04 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 08/16] target/riscv: move 'vlen' to riscv_cpu_properties[]
Date: Fri, 22 Dec 2023 09:22:27 -0300
Message-ID: <20231222122235.545235-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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

Turning 'vlen' into a class property will allow its default value to be
overwritten by cpu_init() later on, solving the issue we have now where
CPU specific settings are getting overwritten by the default.

For 'vlen', 'elen' and the blocksize options we need a way of tracking
if the user set a value for them. This is benign for TCG since the cost
of always validating these values are small, but for KVM we need syscalls
to read the host values to make the validations. Knowing whether the
user didn't touch the values makes a difference. We'll track user setting
for these properties using a hash, like we do in the TCG driver.

Common validation bits are moved from riscv_cpu_validate_v() to
prop_vlen_set() to be shared with KVM.

And, as done with every option we migrated to riscv_cpu_properties[],
vendor CPUs can't have their 'vlen' value changed.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 63 +++++++++++++++++++++++++++++++++++++-
 target/riscv/tcg/tcg-cpu.c |  5 ---
 2 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d6625399a7..c2ff50bcab 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -29,6 +29,7 @@
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
+#include "hw/core/qdev-prop-internal.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
 #include "sysemu/kvm.h"
@@ -53,6 +54,15 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
 #define BYTE(x)   (x)
 #endif
 
+/* Hash that stores general user set numeric options */
+static GHashTable *general_user_opts;
+
+static void cpu_option_add_user_setting(const char *optname, uint32_t value)
+{
+    g_hash_table_insert(general_user_opts, (gpointer)optname,
+                        GUINT_TO_POINTER(value));
+}
+
 #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
     {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
 
@@ -1244,6 +1254,8 @@ static void riscv_cpu_init(Object *obj)
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
 
+    general_user_opts = g_hash_table_new(g_str_hash, g_str_equal);
+
     /*
      * The timer and performance counters extensions were supported
      * in QEMU before they were added as discrete extensions in the
@@ -1664,8 +1676,54 @@ static const PropertyInfo prop_vext_spec = {
     .set = prop_vext_spec_set,
 };
 
+static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!is_power_of_2(value)) {
+        error_setg(errp, "Vector extension VLEN must be power of 2");
+        return;
+    }
+
+    /* Always allow setting a default value */
+    if (cpu->cfg.vlen == 0) {
+        cpu->cfg.vlen = value;
+        return;
+    }
+
+    if (value != cpu->cfg.vlen && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, cpu->cfg.vlen);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.vlen = value;
+}
+
+static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    uint16_t value = RISCV_CPU(obj)->cfg.vlen;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_vlen = {
+    .name = "vlen",
+    .get = prop_vlen_get,
+    .set = prop_vlen_set,
+    .set_default_value = qdev_propinfo_set_default_value_uint,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
     DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
@@ -1687,6 +1745,9 @@ static Property riscv_cpu_properties[] = {
     {.name = "priv_spec", .info = &prop_priv_spec},
     {.name = "vext_spec", .info = &prop_vext_spec},
 
+    {.name = "vlen", .info = &prop_vlen,
+     .set_default = true, .defval.u = 128},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 6501c29d8e..8ec858e096 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -178,11 +178,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                                  Error **errp)
 {
-    if (!is_power_of_2(cfg->vlen)) {
-        error_setg(errp, "Vector extension VLEN must be power of 2");
-        return;
-    }
-
     if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
         error_setg(errp,
                    "Vector extension implementation only supports VLEN "
-- 
2.43.0


