Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8104C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:48:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qygRa-0006m7-CM; Thu, 02 Nov 2023 18:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRX-0006fd-It
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:39 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qygRV-0003Ud-OJ
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 18:45:39 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5b31c5143a0so17991857b3.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 15:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698965137; x=1699569937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ro0icYK71fZ1kwLHRmv02PhLlgsNL/aRf529X0R4GIg=;
 b=RFfSo5XewD9j+exh5J+z9kdHKGo/Z7Kz+6Yip5cgLk4YGSgWLOYnDaTD+fZrYYNYQ6
 gmSRUxxupaMd6IL0k42/yY94ro+sbriMLgo3w4UuyyZ2Ni6yOLYJ2d32JT9gRnSIx30g
 7Qizi178ApaIEPdV0yE4LlfqFgawPoI3tNAF9qIbJQB+fBgTQHO+qCkdv2ywdLoDXiH6
 a0d9bzrabJFdIQrya5YA8O46bx3f+zulNo+XHRDNci1A2qzXPLViyVpDJZNKA225vjen
 SPqFeLQfweL8mJe7yvHDUbfa7SD1gnUn3yq5jpdyXUhiRGw+thW51soL3vojFKXo/Ilj
 DAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698965137; x=1699569937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ro0icYK71fZ1kwLHRmv02PhLlgsNL/aRf529X0R4GIg=;
 b=XSVyjrdoxYJ7sjEP3jCgGx3k7nk0aIKUkht6x8xaaECCzgQR69c1A1ydDJskhThpTT
 1TbLioNmGzVmso+XqNg14O3ScIr+P5OSsMGMaZlySZ/xsE2RPMadhrNuQ8vUb8/nug5j
 nGJ6qagJjdtCYI/YNeGw4sxjFE2NJmXBfzqXdaub/UCL4pS0Bn2aoh5+zvZ+GQaZdx8v
 NIZfUn+CMmCIN/Ttb+pA/dJCpEU/Mvoep0mX/ApdGbLE34smV4QkafpA67325Nz+mjhH
 uMGn/yeVgnzPjQoOROvpyKEnWanTozf/Eu0YXDGYK3Xg0+VYrgXvJzTDtYw1alHHLfd3
 jnaw==
X-Gm-Message-State: AOJu0YwadsdYhsdNhhDNnWF6BqffpNolav8EjXoln9YQqYM05wGW9YWZ
 G53pqaGoqz9785jVJd2M2L1uew==
X-Google-Smtp-Source: AGHT+IGBb79oQLCegmBP7+X8vEVEwcSK3CgQvFCYIVeRbRnFYV20/hRX6TsKDMF3gt7rn+prbPX7HA==
X-Received: by 2002:a81:84c1:0:b0:5a7:c906:14f with SMTP id
 u184-20020a8184c1000000b005a7c906014fmr1158002ywf.11.1698965136903; 
 Thu, 02 Nov 2023 15:45:36 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 ce10-20020a05690c098a00b0059b24bd4f2asm259523ywb.57.2023.11.02.15.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:45:36 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v9 18/19] target/riscv: add 'rva22u64' CPU
Date: Thu,  2 Nov 2023 19:44:44 -0300
Message-ID: <20231102224445.527355-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231102224445.527355-1-dbarboza@ventanamicro.com>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
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

This CPU was suggested by Alistair [1] and others during the profile
design discussions. It consists of the bare 'rv64i' CPU with rva22u64
enabled by default, like an alias of '-cpu rv64i,rva22u64=true'.

Users now have an even easier way of consuming this user-mode profile by
doing '-cpu rva22u64'. Extensions can be enabled/disabled at will on top
of it.

We can boot Linux with this "user-mode" CPU by doing:

-cpu rva22u64,sv39=true,s=true,zifencei=true

[1] https://lore.kernel.org/qemu-riscv/CAKmqyKP7xzZ9Sx=-Lbx2Ob0qCfB7Z+JO944FQ2TQ+49mqo0q_Q@mail.gmail.com/

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h     |  1 +
 target/riscv/cpu.c         | 10 ++++++++++
 target/riscv/tcg/tcg-cpu.c |  9 +++++++++
 3 files changed, 20 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index ea9a752280..ac38ffc6cf 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -37,6 +37,7 @@
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
 #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
+#define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d24ffbf3f8..1f2932031a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1542,6 +1542,15 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#if defined(TARGET_RISCV64)
+static void rva22u64_bare_cpu_init(Object *obj)
+{
+    rv64i_bare_cpu_init(obj);
+
+    RVA22U64.enabled = true;
+}
+#endif
+
 static const gchar *riscv_gdb_arch_name(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -1876,6 +1885,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
+    DEFINE_BARE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_bare_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index ef43264cb3..553fb337e7 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1068,6 +1068,15 @@ static void riscv_cpu_add_profiles(Object *cpu_obj)
         object_property_add(cpu_obj, profile->name, "bool",
                             cpu_get_profile, cpu_set_profile,
                             NULL, (void *)profile);
+
+        /*
+         * CPUs might enable a profile right from the start.
+         * Enable its mandatory extensions right away in this
+         * case.
+         */
+        if (profile->enabled) {
+            object_property_set_bool(cpu_obj, profile->name, true, NULL);
+        }
     }
 }
 
-- 
2.41.0


