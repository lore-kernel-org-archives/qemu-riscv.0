Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCFC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:47:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmPC-0002zK-59; Fri, 05 Jan 2024 10:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOM-0001YU-1w
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:45:57 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOE-0003lX-G7
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:45:45 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d76923ec4so16157885e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469539; x=1705074339; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4mZu4dIothIAeIYl7XbtHN8Q7Ylsc498FBOxXuUI0M=;
 b=HH2M+j4yRxWzQcnuQvd5Y/pUTR+1/p1Y2UdaJ6hbg9KQ4DP94ihA8QEvcVHoqzAFUY
 m6O4jdu1aPujtudvL8mX4+zdeif6w/9+jYsFxkpSATRzjxYLvWLsHEbU8fsXpzb2hma/
 Qok1uLqIBr6PQhkc2VPbwPLTD9wgqOFNi8jAFBcnwYD7R6W+NhST/5wSoIJgs1oy0EIq
 kosYve95eJM13WZgIeHUC6xQxnfmwG7a8KIOIWOE4xZX2i3oA8T1BaEAVQt+Z9dzElIT
 vjufjMlLkWwhvIARBhsxNfuJ8EgINQEIEFPoOg1GXX+k6h5hyjLNTX8Aj2YtUJW4uU4o
 +owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469539; x=1705074339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e4mZu4dIothIAeIYl7XbtHN8Q7Ylsc498FBOxXuUI0M=;
 b=wp8IXIpmlr/grt0nLByF8Ki+o18oFr+zBPndC+QwpPYE8Hg7nT2Be5LqPiFSSJeHF7
 tD3mqTsj29uk7Xm0bn+45lxZS97Iz9ZA/7Q0hp9a7O+Z63TR5cBmkkPr14NXHgDgCesp
 ndcrd0xhKdKMc+UN5I6sfWNesNVhQYsSZqb0PmcBOZ1V7cfDDYAoUlcsmXWBObzQu2aq
 8fwsTKofGG3ENhyR3JMI0pk84apaTl/m3vgcUeHuap4rm9uWzfXzmWW5bfdsKUg/Xi6A
 GOh8q6AIXhr1WSlup1qHOI9/WRgtFHgOiSE5jRKboMqHDwiQHqumhcl0eIxMnbrBIxKB
 TbCQ==
X-Gm-Message-State: AOJu0Yw6DyIeXioca9zHLvdv5X17N5cGLfwvUW5OB32j1Akl//RPWt4+
 AF4zuSE0qQVN70+77l3TqD8GfeYCNaArSh5y6OcqGKMwfUA=
X-Google-Smtp-Source: AGHT+IFcVp0qR9MGObXw9lQNSxmy+uatTj5gwKdD6WMxmUrW8rksiYX3pMmatWQHOxh1RrOMRB/8nQ==
X-Received: by 2002:a05:600c:5487:b0:40d:877d:ca1 with SMTP id
 iv7-20020a05600c548700b0040d877d0ca1mr1218741wmb.54.1704469539200; 
 Fri, 05 Jan 2024 07:45:39 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b0040d81ca11casm1930040wmo.28.2024.01.05.07.45.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:45:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 22/71] target: Use generic cpu_model_from_type()
Date: Fri,  5 Jan 2024 16:42:15 +0100
Message-ID: <20240105154307.21385-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Gavin Shan <gshan@redhat.com>

Use generic cpu_model_from_type() when the CPU model name needs to
be extracted from the CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-23-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-qmp-cmds.c             | 3 +--
 target/i386/cpu.c                     | 3 +--
 target/loongarch/loongarch-qmp-cmds.c | 3 +--
 target/mips/sysemu/mips-qmp-cmds.c    | 3 +--
 target/ppc/cpu_init.c                 | 3 +--
 target/ppc/ppc-qmp-cmds.c             | 3 +--
 target/riscv/cpu.c                    | 3 +--
 target/riscv/riscv-qmp-cmds.c         | 3 +--
 8 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index b53d5efe13..2250cd7ddf 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -237,8 +237,7 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
 
     typename = object_class_get_name(oc);
     info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fd47ee7def..2524881ce2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1744,8 +1744,7 @@ static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
 {
     const char *class_name = object_class_get_name(OBJECT_CLASS(cc));
     assert(g_str_has_suffix(class_name, X86_CPU_TYPE_SUFFIX));
-    return g_strndup(class_name,
-                     strlen(class_name) - strlen(X86_CPU_TYPE_SUFFIX));
+    return cpu_model_from_type(class_name);
 }
 
 typedef struct X86CPUVersionDefinition {
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
index 645672ff59..ec33ce81f0 100644
--- a/target/loongarch/loongarch-qmp-cmds.c
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -22,8 +22,7 @@ static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
     CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
     const char *typename = object_class_get_name(oc);
 
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
diff --git a/target/mips/sysemu/mips-qmp-cmds.c b/target/mips/sysemu/mips-qmp-cmds.c
index 6db4626412..7340ac70ba 100644
--- a/target/mips/sysemu/mips-qmp-cmds.c
+++ b/target/mips/sysemu/mips-qmp-cmds.c
@@ -19,8 +19,7 @@ static void mips_cpu_add_definition(gpointer data, gpointer user_data)
 
     typename = object_class_get_name(oc);
     info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_MIPS_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 40fe14a6c2..344196a8ce 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7036,8 +7036,7 @@ static void ppc_cpu_list_entry(gpointer data, gpointer user_data)
         return;
     }
 
-    name = g_strndup(typename,
-                     strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
+    name = cpu_model_from_type(typename);
     qemu_printf("PowerPC %-16s PVR %08x\n", name, pcc->pvr);
     for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
         PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
diff --git a/target/ppc/ppc-qmp-cmds.c b/target/ppc/ppc-qmp-cmds.c
index f9acc21056..c0c137d9d7 100644
--- a/target/ppc/ppc-qmp-cmds.c
+++ b/target/ppc/ppc-qmp-cmds.c
@@ -181,8 +181,7 @@ static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
 
     typename = object_class_get_name(oc);
     info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
+    info->name = cpu_model_from_type(typename);
 
     QAPI_LIST_PREPEND(*first, info);
 }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 22d7422c89..b07a76ef6b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -657,8 +657,7 @@ char *riscv_cpu_get_name(RISCVCPU *cpu)
 
     g_assert(g_str_has_suffix(typename, RISCV_CPU_TYPE_SUFFIX));
 
-    return g_strndup(typename,
-                     strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX));
+    return cpu_model_from_type(typename);
 }
 
 static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 2f2dbae7c8..c5551d2cfe 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -44,8 +44,7 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
     const char *typename = object_class_get_name(oc);
     ObjectClass *dyn_class;
 
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_RISCV_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     dyn_class = object_class_dynamic_cast(oc, TYPE_RISCV_DYNAMIC_CPU);
-- 
2.41.0


