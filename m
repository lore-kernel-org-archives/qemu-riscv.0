Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659B9C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 20:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyI2p-0002cw-Dw; Wed, 01 Nov 2023 16:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2n-0002bu-VW
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:29 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyI2m-0000gH-3h
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 16:42:29 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-da041ffef81so216570276.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Nov 2023 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698871347; x=1699476147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j19jADic7A42loDpy3Do/I7i0K00Zw+KuiH/I8hQZA0=;
 b=UPRuMU7frfnFIB5q0yykTBjkrFHlRB4srFuCjiO7J+PWWZz04RIvxG5usbUDC+vvW0
 kygN/CXUwYFCgAyUiryos6gjAit6Tf0vkXhy0qo60GzH3GkwZJat3GeCHwE2hqB3wsKk
 Ba3XlGjDJTsLzLoL4ns6JuGVd0/gjkPEQ+F5otpouk2jyxkJ3kUWXVh3N2W5iQtjNptB
 VIAlA7bwqdSuwmE+MYf59Bw3RZe54OzI7O1YzYZNvmx9BTx1fxFbbO/p4KbMM5hhRCkJ
 GFG3yn5F0F6bH3gcT9vronYXBtsbo58kLCaHiGmOKscIa7kjdNEaVCdwK3ZylDD4sJEK
 c+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698871347; x=1699476147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j19jADic7A42loDpy3Do/I7i0K00Zw+KuiH/I8hQZA0=;
 b=wXXK2P5lXh30EVJXGpC4ZyZW0j3Z6mY0fL5v1w89sivAAF+b7KR00o1g/U02IKVQ/C
 a9pvjCFxfIDdWha4tFSAdcszBztGSrn69kmK9Iz9APNFIBCYP+LPwAKdVhsr/QViEvjp
 R11cBUK9zdWYZb4lCF2bFIiwXlaO2g5Epjc5iGBI/LUZmy+F5v73WkS1sp07tJs1/VrT
 Wq22Ndi9tHKJJvuWgZRSDemT+XUBQ8goKQm07SxybGEgRxBEyZcPC8SOF/XK6moszJpj
 GBOYmiWOBipFin9J7BHS+LHXSBwicPVj1m1Y6bKvNkRnbih6F+Cy6NpIyG2XgS5EyVfG
 Bu7g==
X-Gm-Message-State: AOJu0Yws6NyRlRxX5PFwGIPGYhEUViYOtSh9ptaYz1ta50kqsmNgPskl
 9cmZPdrdnC0DVf7yj22jHisfig==
X-Google-Smtp-Source: AGHT+IFo4DPM+BkNWUgLkSfYzQtw7WVkwZpm04b9ycsjS6ZkiUkxHabhF19oIEYVkgM3Ymef4OIgtw==
X-Received: by 2002:a25:aa85:0:b0:d9a:5244:32e5 with SMTP id
 t5-20020a25aa85000000b00d9a524432e5mr18212118ybi.35.1698871347101; 
 Wed, 01 Nov 2023 13:42:27 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 z187-20020a2533c4000000b00d9cc49edae9sm329724ybz.63.2023.11.01.13.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 13:42:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 06/19] target/riscv: add rv64i CPU
Date: Wed,  1 Nov 2023 17:41:51 -0300
Message-ID: <20231101204204.345470-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101204204.345470-1-dbarboza@ventanamicro.com>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb32.google.com
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
---
 target/riscv/cpu-qom.h |  2 ++
 target/riscv/cpu.c     | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 7831e86d37..ea9a752280 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -25,6 +25,7 @@
 #define TYPE_RISCV_CPU "riscv-cpu"
 #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
 #define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
+#define TYPE_RISCV_BARE_CPU "riscv-bare-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
@@ -35,6 +36,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
+#define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f7c1989d14..4a6e544eaf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -544,6 +544,16 @@ static void rv128_base_cpu_init(Object *obj)
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
+}
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
@@ -1753,6 +1763,13 @@ void riscv_cpu_list(void)
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
@@ -1775,6 +1792,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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
@@ -1791,6 +1813,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906,  rv64_thead_c906_cpu_init),
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
 #endif
 };
 
-- 
2.41.0


