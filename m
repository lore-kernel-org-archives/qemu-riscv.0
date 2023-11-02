Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F98C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:27:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLXV-0000hm-OL; Wed, 01 Nov 2023 20:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLXU-0000fG-2H
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLXR-0008Ns-TK
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fdwsdg9xMPpFL242HTsTKI5/3qWGOT7NqszjRSdnRvw=;
 b=RlZi2rUlcvXP1anxutj0hyX71A0tAZ1biWZCud9hmf3C8/NrYQ8LjUwpqNEruWW/vVPj2F
 MQIBb/Wzy8qd775L2EqIrPSmcPQbeSY6gXev3vfiplZOYNoVyj1Qsv06VGtahj0KdtWM9u
 Y7badj66lhjp6RPZGHZ1bx24SJ9rZWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-FH4h3Lo4PLaZG0qI5xtByw-1; Wed, 01 Nov 2023 20:26:18 -0400
X-MC-Unique: FH4h3Lo4PLaZG0qI5xtByw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58431185A780;
 Thu,  2 Nov 2023 00:26:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1369AC1290F;
 Thu,  2 Nov 2023 00:26:01 +0000 (UTC)
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
Subject: [PATCH v4 02/33] hw/cpu: Call object_class_is_abstract() once in
 cpu_class_by_name()
Date: Thu,  2 Nov 2023 10:24:29 +1000
Message-ID: <20231102002500.1750692-3-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Let CPUClass::class_by_name() handlers to return abstract classes,
and filter them once in the public cpu_class_by_name() method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/cpu-common.c   | 8 +++++++-
 include/hw/core/cpu.h  | 7 ++++---
 target/alpha/cpu.c     | 2 +-
 target/arm/cpu.c       | 3 +--
 target/avr/cpu.c       | 3 +--
 target/cris/cpu.c      | 3 +--
 target/hexagon/cpu.c   | 3 +--
 target/loongarch/cpu.c | 3 +--
 target/m68k/cpu.c      | 3 +--
 target/openrisc/cpu.c  | 3 +--
 target/riscv/cpu.c     | 3 +--
 target/rx/cpu.c        | 5 +----
 target/sh4/cpu.c       | 3 ---
 target/tricore/cpu.c   | 3 +--
 target/xtensa/cpu.c    | 3 +--
 15 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index bab8942c30..bca0323e9f 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -150,9 +150,15 @@ static bool cpu_common_has_work(CPUState *cs)
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
     CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
+    ObjectClass *oc;
 
     assert(cpu_model && cc->class_by_name);
-    return cc->class_by_name(cpu_model);
+    oc = cc->class_by_name(cpu_model);
+    if (oc && !object_class_is_abstract(oc)) {
+        return oc;
+    }
+
+    return NULL;
 }
 
 static void cpu_common_parse_features(const char *typename, char *features,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 18593db5b2..ee85aafdf5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -102,7 +102,7 @@ struct SysemuCPUOps;
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
- * instantiatable CPU type.
+ *                 instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
@@ -772,9 +772,10 @@ void cpu_reset(CPUState *cpu);
  * @typename: The CPU base type.
  * @cpu_model: The model string without any parameters.
  *
- * Looks up a CPU #ObjectClass matching name @cpu_model.
+ * Looks up a concrete CPU #ObjectClass matching name @cpu_model.
  *
- * Returns: A #CPUClass or %NULL if not matching class is found.
+ * Returns: A concrete #CPUClass or %NULL if no matching class is found
+ *          or if the matching class is abstract.
  */
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
 
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index c7ae4d6a41..9436859c7b 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -126,7 +126,7 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     int i;
 
     oc = object_class_by_name(cpu_model);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) != NULL &&
+    if (object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) &&
         !object_class_is_abstract(oc)) {
         return oc;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 954328d72a..8c622d6b59 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2399,8 +2399,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 14d8b9d1f0..113d522f75 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -157,8 +157,7 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
 
     oc = object_class_by_name(cpu_model);
-    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL ||
-        object_class_is_abstract(oc)) {
+    if (!object_class_dynamic_cast(oc, TYPE_AVR_CPU)) {
         oc = NULL;
     }
     return oc;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index be4a44c218..1cb431cd46 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -95,8 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_CRIS_CPU) ||
-                       object_class_is_abstract(oc))) {
+    if (!object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
         oc = NULL;
     }
     return oc;
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 1adc11b713..bd5adb7acd 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -63,8 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index ef1bf89dac..06d1b9bb95 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -648,8 +648,7 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
         }
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)
-        && !object_class_is_abstract(oc)) {
+    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)) {
         return oc;
     }
     return NULL;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 538d9473c2..fe381cc5d3 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -111,8 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && (object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL ||
-                       object_class_is_abstract(oc))) {
+    if (!object_class_dynamic_cast(oc, TYPE_M68K_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index f5a3d5273b..cc94f37e77 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -164,8 +164,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU) ||
-                       object_class_is_abstract(oc))) {
+    if (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac4a6c7eec..018bad6f82 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,8 +636,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 4d0d3a0c8c..0063837e93 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -111,16 +111,13 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
     char *typename;
 
     oc = object_class_by_name(cpu_model);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL &&
+    if (object_class_dynamic_cast(oc, TYPE_RX_CPU) &&
         !object_class_is_abstract(oc)) {
         return oc;
     }
     typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
 
     return oc;
 }
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 788e41fea6..a8ec98b134 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -152,9 +152,6 @@ static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
 
     typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
     oc = object_class_by_name(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
 
 out:
     g_free(s);
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 5ca666ee12..47e1c272cf 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -132,8 +132,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index ea1dae7390..5d1c090467 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -141,8 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
         return NULL;
     }
     return oc;
-- 
2.41.0


