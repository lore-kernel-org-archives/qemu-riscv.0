Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A16C61D85
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 18:53:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6EoO-0000iW-4h; Thu, 23 Nov 2023 13:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6EoN-0000fc-DK
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:52:27 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6EoL-0000GL-Gg
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 13:52:27 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cf61eed213so9526385ad.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700765544; x=1701370344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIxFD40eOKN1PL7rHkZiTo9EZaqwS4IrnfEmvy9eNNo=;
 b=CBufSK6b7xKpOtfqwzY2as76qk6ZJuxlaNNqr/sMwzjb2CutycyCILoMKMZYNjJlwi
 vmOGH0z0GUjPGj/mgft6ue53DfbU4L7JdcshcT5RMqxjkrBPodm4VnIjgFrEPDlZYCpU
 Oi3CIXYyxF5uY5eoOYMkmM6vDFaCQ2nNJUsqUJdgwEEIiOrH1iBdFOOyZdzUD13EiNS2
 /Q3AnECi/0hyl2Ui/rxMlP/CgX6VE73ATjdbwehYVeMDn0PtMXjZ32deE+FeVefBN8gr
 GBWPKrub5MswsSJiY8RH+pDIPN/4zm9lP2OrH0Bakdkepbq0hQjsO4JmWvJMfEWymjZD
 W9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700765544; x=1701370344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nIxFD40eOKN1PL7rHkZiTo9EZaqwS4IrnfEmvy9eNNo=;
 b=Y2xWm9DW41EET2IaHnOZVo9FW+yC54zyuLJe5kMXWeXq+I4UkZi1rym73+NExkmVC+
 esmXjt1B7k9DkYNDVASApEIPvDXksJUnHuz6URZnEIzYAWcKTAV/iMp/rFIpZm5ozbq2
 akxyceO/1EpMVl/NCbKrfvPPxR3b3+WF4DMiELRg7oOTfctDuOTKY5g/io2MM/m15T3U
 50LSFrB9Jsj7lMaYekO/IbGhtzy+7tDeVJfZmk4sSFgEGdERCAxzeGrfxTLIM8cDGGeG
 SOWWplmtPD+BRpINc/C1gQykfGSYtAWHREww+dnYoBHc3neoTwHZLOkkANen5ive1HyT
 TQfQ==
X-Gm-Message-State: AOJu0YzpgspgmWfjHCR9GvJoKxoPyryxO/aroOPs2m6BamnR1c3Gzjzj
 ocSI/fUZZQCe1UG3QAWDzO/J+A==
X-Google-Smtp-Source: AGHT+IEfxiCO+2H3NuqbXwl7NGNGPC6eLlXrcp8idnvqykavA9HPP+t3OrWdaBW8ZWiDJ5ohAc9u4g==
X-Received: by 2002:a17:902:cec7:b0:1cf:8e9e:8812 with SMTP id
 d7-20020a170902cec700b001cf8e9e8812mr429223plg.21.1700765544331; 
 Thu, 23 Nov 2023 10:52:24 -0800 (PST)
Received: from grind.. ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090282c400b001bb1f0605b2sm1662638plz.214.2023.11.23.10.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 10:52:23 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 v11 18/18] target/riscv: add 'rva22u64' CPU
Date: Thu, 23 Nov 2023 15:51:22 -0300
Message-ID: <20231123185122.1100436-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
References: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu-qom.h     |  1 +
 target/riscv/cpu.c         | 17 +++++++++++++++++
 target/riscv/tcg/tcg-cpu.c |  9 +++++++++
 3 files changed, 27 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 4d1aa54311..12fe78fc52 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -35,6 +35,7 @@
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
 #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
+#define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f2be40ae21..3a230608cb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1576,6 +1576,15 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#if defined(TARGET_RISCV64)
+static void rva22u64_profile_cpu_init(Object *obj)
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
@@ -1866,6 +1875,13 @@ void riscv_cpu_list(void)
         .instance_init = initfn            \
     }
 
+#define DEFINE_PROFILE_CPU(type_name, initfn) \
+    {                                         \
+        .name = type_name,                    \
+        .parent = TYPE_RISCV_BARE_CPU,        \
+        .instance_init = initfn               \
+    }
+
 static const TypeInfo riscv_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU,
@@ -1910,6 +1926,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
     DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
+    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 6c1e54f540..8fa8d61142 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -1100,6 +1100,15 @@ static void riscv_cpu_add_profiles(Object *cpu_obj)
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


