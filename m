Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1B5C61DF7
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 20:26:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6cix-0001u4-8b; Fri, 24 Nov 2023 15:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cio-0001pf-0v
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:20 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6cim-0005Dd-3g
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 15:24:17 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cfaaa79766so5137365ad.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 12:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700857454; x=1701462254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNzK71ptVkzN8LH9oIEjdELKVkAXXjFWm0PQTwTkQA4=;
 b=C+hbuwYFnIWW1SFwdiYz5EQS//0bSt0XJPosstp10t9y7zFVzE68VcEBwWV5Mx0itH
 8/XC7Kvb+YrVmiK+PRCYVtUjWfo6KGUJzkaKFTEHmaMlr3t0rmmAslb0KW5f4J++5J+1
 gX27opbRFMssiIcgbO8D+stY90rixIlGgKvFa3yl2126RpordwPImi4ZaTqCYQQgf9Xp
 WQp8+MyJrkl6SY8T6lQU8XzJlKy0f/M+UXo+J4cTJmN+r3TGF/oB7ZkM7BNVRjYnw/sc
 /NwOwSEZeVIWeD7akmoNf7PMvhZPII4XWLeYJQDGfa4DzJtPU+C5/asXpl9WO3Oy6TNd
 rEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700857454; x=1701462254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNzK71ptVkzN8LH9oIEjdELKVkAXXjFWm0PQTwTkQA4=;
 b=bfXEd9j4B8F8iXsG1TUgeOYDq9u/7cAkkc9LdFPctRpGOJvWaP80k7BEb6kKkVYgAc
 Vzl81biYXuTVecvE8FROym8g4IVZnBlJ7/KZmDuhBRH2MHcXlx60A/Fvt7AlYZy4pDoI
 VYKkxHmFdKR3IAu1BFQZn9e258JCijd+h87BCnYatZI/kt2Td4VHL3DYC/B8sn7Q+c7S
 FbxLAeQUCt0wdfHxr8yMNP29HzczV5+LQfJbLcOLifTuwVssVPb/aKWmYzI8H5Ditpt2
 qc6JYuX31YQN/dfKHUK9ngLstdCCYoR2GZ2/C/bKPykByNHE+AYGLG6h0ZlDSzc2wEJ6
 wvUA==
X-Gm-Message-State: AOJu0YzdszNzHGtJRVKA6FVsYtnrA0HwkEf/AVsGBEFprY18wdiRE5NF
 3+Ri5PMTmCU9+LV4B/ZLU9Pupg==
X-Google-Smtp-Source: AGHT+IGNUur1Ugg923EYH/0CeHiX3XnBTpcPIb6Li3UQSSoOu53yNCSFEZsqllsYeGWPRRwz4VcecQ==
X-Received: by 2002:a17:902:d50d:b0:1cc:5c8f:4056 with SMTP id
 b13-20020a170902d50d00b001cc5c8f4056mr5566784plg.42.1700857454476; 
 Fri, 24 Nov 2023 12:24:14 -0800 (PST)
Received: from grind.. ([152.250.131.119]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c59f23a3fesm3548267plo.251.2023.11.24.12.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:24:14 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v12 04/18] target/riscv: add rv64i CPU
Date: Fri, 24 Nov 2023 17:23:39 -0300
Message-ID: <20231124202353.1187814-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
References: <20231124202353.1187814-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
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

We don't have any form of a 'bare bones' CPU. rv64, our default CPUs,
comes with a lot of defaults. This is fine for most regular uses but
it's not suitable when more control of what is actually loaded in the
CPU is required.

A bare-bones CPU would be annoying to deal with if not by profile
support, a way to load a multitude of extensions with a single flag.
Profile support is going to be implemented shortly, so let's add a CPU
for it.

The new 'rv64i' CPU will have only RVI loaded. It is inspired in the
profile specification that dictates, for RVA22U64 [1]:

"RVA22U64 Mandatory Base
 RV64I is the mandatory base ISA for RVA22U64"

And so it seems that RV64I is the mandatory base ISA for all profiles
listed in [1], making it an ideal CPU to use with profile support.

rv64i is a CPU of type TYPE_RISCV_BARE_CPU. It has a mix of features
from pre-existent CPUs:

- it allows extensions to be enabled, like generic CPUs;
- it will not inherit extension defaults, like vendor CPUs.

This is the minimum extension set to boot OpenSBI and buildroot using
rv64i:

./build/qemu-system-riscv64 -nographic -M virt \
    -cpu rv64i,sv39=true,g=true,c=true,s=true,u=true

Our minimal riscv,isa in this case will be:

 # cat /proc/device-tree/cpus/cpu@0/riscv,isa
rv64imafdc_zicntr_zicsr_zifencei_zihpm_zca_zcd#

[1] https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu-qom.h |  2 ++
 target/riscv/cpu.c     | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index ca7dd509e3..4d1aa54311 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -24,6 +24,7 @@
 #define TYPE_RISCV_CPU "riscv-cpu"
 #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
 #define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
+#define TYPE_RISCV_BARE_CPU "riscv-bare-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
@@ -33,6 +34,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
+#define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 220113408e..a52bf1e33c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -370,6 +370,17 @@ static void set_satp_mode_max_supported(RISCVCPU *cpu,
 /* Set the satp mode to the max supported */
 static void set_satp_mode_default_map(RISCVCPU *cpu)
 {
+    /*
+     * Bare CPUs do not default to the max available.
+     * Users must set a valid satp_mode in the command
+     * line.
+     */
+    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_BARE_CPU) != NULL) {
+        warn_report("No satp mode set. Defaulting to 'bare'");
+        cpu->cfg.satp_mode.map = (1 << VM_1_10_MBARE);
+        return;
+    }
+
     cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported;
 }
 #endif
@@ -552,6 +563,28 @@ static void rv128_base_cpu_init(Object *obj)
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
 }
+
+static void rv64i_bare_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    riscv_cpu_set_misa(env, MXL_RV64, RVI);
+
+    /* Remove the defaults from the parent class */
+    RISCV_CPU(obj)->cfg.ext_zicntr = false;
+    RISCV_CPU(obj)->cfg.ext_zihpm = false;
+
+    /* Set to QEMU's first supported priv version */
+    env->priv_ver = PRIV_VERSION_1_10_0;
+
+    /*
+     * Support all available satp_mode settings. The default
+     * value will be set to MBARE if the user doesn't set
+     * satp_mode manually (see set_satp_mode_default()).
+     */
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV64);
+#endif
+}
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
@@ -1785,6 +1818,13 @@ void riscv_cpu_list(void)
         .instance_init = initfn              \
     }
 
+#define DEFINE_BARE_CPU(type_name, initfn) \
+    {                                      \
+        .name = type_name,                 \
+        .parent = TYPE_RISCV_BARE_CPU,     \
+        .instance_init = initfn            \
+    }
+
 static const TypeInfo riscv_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU,
@@ -1807,6 +1847,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .parent = TYPE_RISCV_CPU,
         .abstract = true,
     },
+    {
+        .name = TYPE_RISCV_BARE_CPU,
+        .parent = TYPE_RISCV_CPU,
+        .abstract = true,
+    },
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
 #if defined(TARGET_RISCV32)
@@ -1823,6 +1868,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906,  rv64_thead_c906_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
 #endif
 };
 
-- 
2.41.0


