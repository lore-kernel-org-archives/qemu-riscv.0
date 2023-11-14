Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A8BC61D95
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:00:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33I4-0008Mi-31; Tue, 14 Nov 2023 18:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33I0-0008G9-G2
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Hx-0006rT-F2
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzUI5oPmdVdwDfoNNGjW7EDYek8Ei7dIFHRYnvSaIl8=;
 b=AhMSOy82MN7xoLVvY8Iygml4h7DqSPhNXaXQL16GNqfBJkQ0VhBo/tM9/lDhrPNeaMsfii
 eXSkw0gE/ijt0LJOzKYmtrEjhFpPfXqS4LxzHPHFlkgiIyQaxb+Uaim7ejC22cC1m3Urr+
 xTDxHVQLplZyXqDfxNtKgIRxLUb/7Ic=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-OG2Daf01NH20HTNlFvh3FA-1; Tue,
 14 Nov 2023 18:57:41 -0500
X-MC-Unique: OG2Daf01NH20HTNlFvh3FA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CEA028004EC;
 Tue, 14 Nov 2023 23:57:39 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE0CC15885;
 Tue, 14 Nov 2023 23:57:26 +0000 (UTC)
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
Subject: [PATCH v5 03/31] cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
Date: Wed, 15 Nov 2023 09:56:00 +1000
Message-ID: <20231114235628.534334-4-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

For all targets, the CPU class returned from CPUClass::class_by_name()
and object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE) need to be
compatible. Lets apply the check in cpu_class_by_name() for once,
instead of having the check in CPUClass::class_by_name() for individual
target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/core/cpu-common.c   | 8 +++++---
 target/alpha/cpu.c     | 3 ---
 target/arm/cpu.c       | 4 +---
 target/avr/cpu.c       | 8 +-------
 target/cris/cpu.c      | 4 +---
 target/hexagon/cpu.c   | 4 +---
 target/hppa/cpu.c      | 7 +------
 target/loongarch/cpu.c | 8 +-------
 target/m68k/cpu.c      | 4 +---
 target/openrisc/cpu.c  | 4 +---
 target/riscv/cpu.c     | 4 +---
 target/tricore/cpu.c   | 4 +---
 target/xtensa/cpu.c    | 4 +---
 13 files changed, 16 insertions(+), 50 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 82dae51a55..d0e7bbdf06 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -154,10 +154,12 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
     assert(cc->class_by_name);
     assert(cpu_model);
     oc = cc->class_by_name(cpu_model);
-    if (oc == NULL || object_class_is_abstract(oc)) {
-        return NULL;
+    if (object_class_dynamic_cast(oc, typename) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
     }
-    return oc;
+
+    return NULL;
 }
 
 static void cpu_common_parse_features(const char *typename, char *features,
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 91fe8ae095..83345c5c7d 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -141,9 +141,6 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
-        return NULL;
-    }
 
     return oc;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 25e9d2ae7b..4af33b9ada 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2401,9 +2401,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 44de1e18d1..a36cc48aae 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -154,13 +154,7 @@ static void avr_cpu_initfn(Object *obj)
 
 static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
 {
-    ObjectClass *oc;
-
-    oc = object_class_by_name(cpu_model);
-    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL) {
-        oc = NULL;
-    }
-    return oc;
+    return object_class_by_name(cpu_model);
 }
 
 static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 675b73ac04..a5083a0077 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -95,9 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
-        oc = NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9d1ffc3b4b..aa48f5fe89 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -63,9 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index fc4d2abad7..1a5fb6c65b 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -160,13 +160,8 @@ static void hppa_cpu_initfn(Object *obj)
 static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 {
     g_autofree char *typename = g_strconcat(cpu_model, "-cpu", NULL);
-    ObjectClass *oc = object_class_by_name(typename);
 
-    if (oc &&
-        object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {
-        return oc;
-    }
-    return NULL;
+    return object_class_by_name(typename);
 }
 
 static void hppa_cpu_list_entry(gpointer data, gpointer user_data)
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index fc075952e6..6fdf5e60f5 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -716,15 +716,9 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
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
index 11c7e0a790..6cd5b56d6f 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -111,9 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 1173260017..f7d53c592a 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -164,9 +164,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07..523e9a16ea 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -646,9 +646,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 034e01c189..8acacdf0c0 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -132,9 +132,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e20fe87bf2..93e782a6e0 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -141,9 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
-- 
2.41.0


