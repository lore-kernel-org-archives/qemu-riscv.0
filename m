Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FF1C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33MB-0007XC-8B; Tue, 14 Nov 2023 19:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33M8-0007Tg-Q3
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33M6-0008H8-82
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdy4A49m0lh9KCTPcvMW/HvI2QDagmrHhW2miYWIFl8=;
 b=KLH9OhWTPPmjrJc/6WcdaP82aPq7q3mfvJbxNbwdNdpZhpXDV5n3BMYJDaFBaETDjVITtO
 uQOi3JzhMMflyyH+jso8wPVSapMjjX7Upm/ELOXYfEGjqtzyaekgmexQdmscP/oG/FMLgx
 uOujx+nG4mh5ZGgE/Zq/dad5ZwgUDd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-AVlOmE4ZPhmoxOozXHVhcA-1; Tue, 14 Nov 2023 19:01:59 -0500
X-MC-Unique: AVlOmE4ZPhmoxOozXHVhcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FBDA811E7D;
 Wed, 15 Nov 2023 00:01:56 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2003C15885;
 Wed, 15 Nov 2023 00:01:43 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 22/31] target: Use generic cpu_model_from_type()
Date: Wed, 15 Nov 2023 09:56:19 +1000
Message-ID: <20231114235628.534334-23-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Use generic cpu_model_from_type() when the CPU model name needs to
be extracted from the CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
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
index 358d9c0a65..b351f83246 100644
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


