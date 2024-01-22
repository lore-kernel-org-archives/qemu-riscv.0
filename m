Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CEEC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRtV9-0002qa-KB; Mon, 22 Jan 2024 07:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRtV6-0002q4-Q6
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:34:04 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rRtV4-0003XP-Tr
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:34:04 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5cf495b46caso1224703a12.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 04:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705926841; x=1706531641; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DHODmQ6bFHA5OygOFcOdnmCvx2+mEm+4ihSAMSxYDNM=;
 b=OKpQIKRclu08V/MREVcGR/iwt4J/JTYmbGYwJFEOvzks8nnbwGUYGb5HmCuj0QuEQt
 8UnF4db9WcePUUYm13z/88KYPry3pn3Oyoq61tXGliZpbM9JClGkuV3pGoGMJn8SmpUd
 BlM4bt70DzvIO/e7TtJ/UDZPuA2Mb4QzKupeBOTZ0gqwYPGj75hEoZax6HwhQDWJRBzn
 0pgV8wVdfowpgwtIY9iCSFKJyTIxeIDYOwsMQrq83V6R1mS8moIPNQZq7kaNT2N+66go
 lkcRVS+5Q/ra0wUkKOxAj/6x1Rq60K8nN+j53E/T1KRN28FZRc/t0sAZtLwZJm+bD/ZW
 Tc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705926841; x=1706531641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHODmQ6bFHA5OygOFcOdnmCvx2+mEm+4ihSAMSxYDNM=;
 b=MrHEgwx1GgxDH7K6ex1XzKTbPsm9Uc0zWq0Pj3NOGwbguHw/Ej5dxCCAH7ZCgFaNof
 J+kBghbwV22SfpKuJ3xz6lPM9MXim1DAqCPn4D3WG2vJJxjHMJSfBBTiae4RuWGempwB
 PACzzPkJR6npKMcrznHhUkfzfVegufWCcoLdChwl9XKjhWdeXNPPPrL0vKSs1g54sJFD
 y0TFtVp5z9yOu2XK10ErTGKiqHmYFjSb8ejUQ42tHCv8QQxtH1fG5TJktmZElpdSBWKW
 NoZY4j2sOnUFg9i0jQUdAjsEp0FLXzhIYpL0fFUmG6aTmU7/daWlsU6AtC7Jolo0D+zu
 QVhQ==
X-Gm-Message-State: AOJu0YwvMN9yXfTXUWYvTo2d+Fox5d5K3wDqQwQMquZfulxy3VPbZ2bh
 Kv0UcP5SixsVA0KfpCh0oNXcosh26M08E/Qax/rpx7szg8YTvFCNeoB8xMHvI3NP1PPOBbps9o+
 z
X-Google-Smtp-Source: AGHT+IHAucIsK7wXABlTssiCjGz2GAzmJhTkMOKcUha1v+NlL7D4VAnWeNn8C+r6KQOjf0FtA63FAA==
X-Received: by 2002:a05:6a20:3627:b0:19b:7d50:fe8f with SMTP id
 r39-20020a056a20362700b0019b7d50fe8fmr1090281pze.40.1705926841569; 
 Mon, 22 Jan 2024 04:34:01 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b006d9b2694b0csm9414305pfu.200.2024.01.22.04.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 04:34:01 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/2] target/riscv: add rv32i, rv32e and rv64e CPUs
Date: Mon, 22 Jan 2024 09:33:48 -0300
Message-ID: <20240122123348.973288-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122123348.973288-1-dbarboza@ventanamicro.com>
References: <20240122123348.973288-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x530.google.com
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

A bare bones 32 bit RVI CPU, rv32i, will make users lives easier when a
full customized 32 bit CPU is desired, and users won't need to disable
defaults by hand as they would with the rv32 CPU. [1] has an example of
a situation that would be avoided with rv32i.

In fact, add bare bones CPUs for RVE as well. Trying to use RVE in QEMU
requires one to disable every single default extension, including RVI,
and then add the desirable extension set. Adding rv32e/rv64e makes it
more pleasant to use embedded CPUs in QEMU.

[1] https://lore.kernel.org/qemu-riscv/258be47f-97be-4308-bed5-dc34ef7ff954@Spark/

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu-qom.h |  3 +++
 target/riscv/cpu.c     | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 9219c2fcc3..3670cfe6d9 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -34,7 +34,10 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
+#define TYPE_RISCV_CPU_RV32I            RISCV_CPU_TYPE_NAME("rv32i")
+#define TYPE_RISCV_CPU_RV32E            RISCV_CPU_TYPE_NAME("rv32e")
 #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
+#define TYPE_RISCV_CPU_RV64E            RISCV_CPU_TYPE_NAME("rv64e")
 #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
 #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9b6e03a655..687d647c0c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -610,6 +610,12 @@ static void rv64i_bare_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     riscv_cpu_set_misa(env, MXL_RV64, RVI);
 }
+
+static void rv64e_bare_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    riscv_cpu_set_misa(env, MXL_RV64, RVE);
+}
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
@@ -696,6 +702,18 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     cpu->cfg.ext_zicsr = true;
     cpu->cfg.pmp = true;
 }
+
+static void rv32i_bare_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    riscv_cpu_set_misa(env, MXL_RV32, RVI);
+}
+
+static void rv32e_bare_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    riscv_cpu_set_misa(env, MXL_RV32, RVE);
+}
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -2428,6 +2446,8 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E31,  rv32_sifive_e_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E34,  rv32_imafcu_nommu_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U34,  rv32_sifive_u_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32I, rv32i_bare_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32E, rv32e_bare_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E51,  rv64_sifive_e_cpu_init),
@@ -2437,6 +2457,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64E, rv64e_bare_cpu_init),
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_init),
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64, rva22s64_profile_cpu_init),
 #endif
-- 
2.43.0


