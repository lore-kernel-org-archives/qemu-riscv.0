Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8292FC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:28:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLXp-0000qi-1I; Wed, 01 Nov 2023 20:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLXm-0000pA-9Q
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLXi-0008PU-B9
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8uJyglK7vgL432BP6OO5ELd0iDtmc4xQmrd3D40v+yI=;
 b=hkc1IeLKYKyEWLIwDA/HsgwBVzN3NwLtLFoMbLs3a7iX64fiCVLe/V9Z3akDGVmVYV3wtO
 zxha/57IRdBhdaa0cFvoufAga6lJrfjacLxMJ3zAlBTN4lIpUJgjPSUhyBiVwUnehiRINP
 gkf3WxUCB5Vcl95TR3F3M6cdZDtIRGU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-xbcJORs9Pj6TJyD6vJLMlA-1; Wed,
 01 Nov 2023 20:26:33 -0400
X-MC-Unique: xbcJORs9Pj6TJyD6vJLMlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B2A73821563;
 Thu,  2 Nov 2023 00:26:31 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45D7C1290F;
 Thu,  2 Nov 2023 00:26:16 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imammedo@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 shan.gavin@gmail.com
Subject: [PATCH v4 03/33] cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
Date: Thu,  2 Nov 2023 10:24:30 +1000
Message-ID: <20231102002500.1750692-4-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

For all targets, the CPU class returned from CPUClass::class_by_name()
and object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE) need to be
compatible. Lets apply the check in cpu_class_by_name() for once,
instead of having the check in CPUClass::class_by_name() for individual
target. In order to make CPU_RESOLVING_TYPE visible to cpu_class_by_name(),
the helper has to be moved to cpu-target.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 cpu-target.c           | 15 +++++++++++++++
 hw/core/cpu-common.c   | 14 --------------
 target/arm/cpu.c       |  4 +---
 target/avr/cpu.c       |  8 +-------
 target/cris/cpu.c      |  4 +---
 target/hexagon/cpu.c   |  4 +---
 target/loongarch/cpu.c |  8 +-------
 target/m68k/cpu.c      |  4 +---
 target/openrisc/cpu.c  |  4 +---
 target/riscv/cpu.c     |  4 +---
 target/tricore/cpu.c   |  4 +---
 target/xtensa/cpu.c    |  4 +---
 12 files changed, 25 insertions(+), 52 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 79363ae370..876b498233 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -250,6 +250,21 @@ void cpu_exec_initfn(CPUState *cpu)
 #endif
 }
 
+ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
+{
+    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
+    ObjectClass *oc;
+
+    assert(cpu_model && cc->class_by_name);
+    oc = cc->class_by_name(cpu_model);
+    if (oc && !object_class_is_abstract(oc) &&
+        object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE)) {
+        return oc;
+    }
+
+    return NULL;
+}
+
 const char *parse_cpu_option(const char *cpu_option)
 {
     ObjectClass *oc;
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index bca0323e9f..1024de53bb 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -147,20 +147,6 @@ static bool cpu_common_has_work(CPUState *cs)
     return false;
 }
 
-ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
-{
-    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
-    ObjectClass *oc;
-
-    assert(cpu_model && cc->class_by_name);
-    oc = cc->class_by_name(cpu_model);
-    if (oc && !object_class_is_abstract(oc)) {
-        return oc;
-    }
-
-    return NULL;
-}
-
 static void cpu_common_parse_features(const char *typename, char *features,
                                       Error **errp)
 {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8c622d6b59..4942239b34 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2399,9 +2399,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 113d522f75..a36cc48aae 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -154,13 +154,7 @@ static void avr_cpu_initfn(Object *obj)
 
 static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
 {
-    ObjectClass *oc;
-
-    oc = object_class_by_name(cpu_model);
-    if (!object_class_dynamic_cast(oc, TYPE_AVR_CPU)) {
-        oc = NULL;
-    }
-    return oc;
+    return object_class_by_name(cpu_model);
 }
 
 static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 1cb431cd46..a5083a0077 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -95,9 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
-        oc = NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index bd5adb7acd..aa48f5fe89 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -63,9 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 06d1b9bb95..c6712e13f9 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -643,15 +643,9 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
         g_autofree char *typename
             = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
         oc = object_class_by_name(typename);
-        if (!oc) {
-            return NULL;
-        }
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)) {
-        return oc;
-    }
-    return NULL;
+    return oc;
 }
 
 void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index fe381cc5d3..6cd5b56d6f 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -111,9 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_M68K_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index cc94f37e77..f7d53c592a 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -164,9 +164,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 018bad6f82..8b4024338c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,9 +636,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 47e1c272cf..8acacdf0c0 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -132,9 +132,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 5d1c090467..93e782a6e0 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -141,9 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
-- 
2.41.0


