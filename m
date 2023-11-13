Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043F3C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 21:40:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2eeg-0006AQ-14; Mon, 13 Nov 2023 16:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eee-00069d-8C
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eec-0001VY-E9
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:36 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cc2fc281cdso36849855ad.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 13:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699911573; x=1700516373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qCqMpypxYhR2XXGBnvs8P3AJK9PzGYu4JOrjRZN4juc=;
 b=fBfKMuNq8Ygs1B/WyhGOlKdtIkXW78A55rSUmtdZStyOTjDId7Obp8rWGw793gX7On
 1lNJRh3V+Wgr5YnU+b+O6KZYKFphWWrSSKGEm5geX7k/NLrSexAQMQria0DnUScsIrSo
 K7jNwepddeo5CcgZTbVTSRkPZJxiT5FC97lEQk96FY9gFD4t75Dja3z2bJhYIwAD9ATu
 lT33/7J3JusAZKcJlWv77odlw7nRgb2L2mn3ZacDzo3EUEu4bFJCvo8kEHMmnDLBfxaz
 WQqDahrLlbjHO8Iq+sMHL3TKab0y/juoaXC4/aEbN/6FO+SDE5ga0Lk3Epqm5mM0uMkZ
 1leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699911573; x=1700516373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qCqMpypxYhR2XXGBnvs8P3AJK9PzGYu4JOrjRZN4juc=;
 b=oLtG/S65FuBliNsaGaAJaoZmCfjvpze5u2uktDQYgJRekHJgLxANVlQ+1Z0hP5Ra0n
 buVMKmWxcXb+MljUpt5gSkgqJzwx4Yq/WBTWrGXnS9enj8AQ28yV32ycnKeVkRvzvUA1
 DpJAnEV+umDbkGRn9f07MW+SMzRqOFC8D6Hj1Dso9nU5N1L5CqaHLy6Vn2Upa8nSDPbq
 ZNMgn1598Fpr7JUL8dQk2hvMCTUFxIbnuy3MaB4s2YTkMdByTw8tNAuj0SFiyi9JFSdW
 V5fPCFC9cdKp4SneXdSqaZZc29rmKTKyS8zNstNAKZkw3NNFMIss9aitSehGiC9eXscL
 i4zw==
X-Gm-Message-State: AOJu0YwLiM+0I6nkygLhgdsEOMXR3EVoVHGiWMw43TXu2UQ1m/e7JhUl
 y8SK4+X7NlcvnjsF0ugPwLbUiwtuKfOgVyFrE0A=
X-Google-Smtp-Source: AGHT+IF0+LzM7AX6PcgIaK3amHGT48pREfAOCC4/uo37bCL4/jYadOX0xdYrkS5n5ZQBDBDMV5+iVg==
X-Received: by 2002:a17:902:db07:b0:1cc:5dd4:7ce5 with SMTP id
 m7-20020a170902db0700b001cc5dd47ce5mr648135plx.19.1699911573238; 
 Mon, 13 Nov 2023 13:39:33 -0800 (PST)
Received: from grind.. ([152.250.131.148]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902900600b001c736746d33sm4455423plp.217.2023.11.13.13.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 13:39:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 6/6] target/riscv: add rv32e/rv64e CPUs
Date: Mon, 13 Nov 2023 18:39:04 -0300
Message-ID: <20231113213904.185320-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113213904.185320-1-dbarboza@ventanamicro.com>
References: <20231113213904.185320-1-dbarboza@ventanamicro.com>
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

In our internals we'll never allow RVI and RVE to be enabled at the same
time, and we require either RVI or RVE to be enabled to proceed with
machine boot. And all CPUs we have enables RVI by default.

This means that if one wants to create an embedded CPU he'll need to
disable RVI first then enable RVE, e.g.:

-cpu rv64i,i=false,e=true

Let's add two RVE CPUs to ease the burder when working with embedded
CPUs in QEMU.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h |  2 ++
 target/riscv/cpu.c     | 46 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index f345c17e69..34d1034cfc 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -36,6 +36,8 @@
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
 #define TYPE_RISCV_CPU_RV32I            RISCV_CPU_TYPE_NAME("rv32i")
 #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
+#define TYPE_RISCV_CPU_RV32E            RISCV_CPU_TYPE_NAME("rv32e")
+#define TYPE_RISCV_CPU_RV64E            RISCV_CPU_TYPE_NAME("rv64e")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 55cf114b61..7d5ff7a0aa 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -585,6 +585,28 @@ static void rv64i_bare_cpu_init(Object *obj)
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV64);
 #endif
 }
+
+static void rv64e_bare_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    riscv_cpu_set_misa(env, MXL_RV64, RVE);
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
@@ -688,6 +710,28 @@ static void rv32i_bare_cpu_init(Object *obj)
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
 }
+
+static void rv32e_bare_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    riscv_cpu_set_misa(env, MXL_RV32, RVE);
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
+    set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
+#endif
+}
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -1883,6 +1927,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E34,  rv32_imafcu_nommu_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U34,  rv32_sifive_u_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32I, rv32i_bare_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32E, rv32e_bare_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E51,  rv64_sifive_e_cpu_init),
@@ -1892,6 +1937,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64E, rv64e_bare_cpu_init),
 #endif
 };
 
-- 
2.41.0


