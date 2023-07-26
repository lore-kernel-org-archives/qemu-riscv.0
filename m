Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8ADC0015E
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 00:34:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qOSTk-0001yZ-5x; Tue, 25 Jul 2023 20:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSTh-0001wO-PJ
 for qemu-riscv@nongnu.org; Tue, 25 Jul 2023 20:34:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSTd-00038m-CP
 for qemu-riscv@nongnu.org; Tue, 25 Jul 2023 20:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690331626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNlHIxY/3NIS52D7SMkw4PFmgOcF6RXD+YEI+jhYGDc=;
 b=NmxWjvA32LMN1866d5VvqXQAijezDO6Q1H8QeUxAT8keotKDSwUFCAZCJ5Ef33Yv6j0wdl
 SZZUG9ufRAkjJlbhlex8A7NVsvOFJXkaT9qrfVS79BeQbBuf+dpF2rOCR7pQ16AaUOgGtb
 aY4nA08ujmPcmJ5ddeur4V+uD+JM75Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-FMms2AvTM8WlT8kLmb7IAw-1; Tue, 25 Jul 2023 20:33:39 -0400
X-MC-Unique: FMms2AvTM8WlT8kLmb7IAw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1C698002BF;
 Wed, 26 Jul 2023 00:33:37 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8806F46A3A9;
 Wed, 26 Jul 2023 00:33:28 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 imammedo@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
Date: Wed, 26 Jul 2023 10:32:00 +1000
Message-ID: <20230726003205.1599788-4-gshan@redhat.com>
In-Reply-To: <20230726003205.1599788-1-gshan@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

The supported CPU models instead of typenames should be printed when
the user specified CPU type isn't supported in is_cpu_type_supported(),
to be consistent with the CPU model specified by user through '-cpu
<model>' option.

Correct the error messages to print CPU models, maintained in the newly
added mc->valid_cpu_models because there is no fixed pattern for the
conversion between CPU model and typename. Besides, mc->valid_cpu_types
and mc->valid_cpu_models are further constified since we're here.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c   | 10 ++++++----
 hw/m68k/q800.c      |  8 +++++++-
 include/hw/boards.h |  3 ++-
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index fe110e9b0a..858f8ede89 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1362,6 +1362,8 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
      * type is provided through '-cpu' option.
      */
     if (mc->valid_cpu_types && machine->cpu_type) {
+        assert(mc->valid_cpu_models && mc->valid_cpu_models[0]);
+
         for (i = 0; mc->valid_cpu_types[i]; i++) {
             if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
                 break;
@@ -1371,10 +1373,10 @@ static void is_cpu_type_supported(MachineState *machine, Error **errp)
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
             error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              mc->valid_cpu_types[0]);
-            for (i = 1; mc->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+            error_append_hint(errp, "The valid models are: %s",
+                              mc->valid_cpu_models[0]);
+            for (i = 1; mc->valid_cpu_models[i]; i++) {
+                error_append_hint(errp, ", %s", mc->valid_cpu_models[i]);
             }
             error_append_hint(errp, "\n");
 
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index b770b71d54..1e360674a7 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -596,11 +596,16 @@ static GlobalProperty hw_compat_q800[] = {
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-static const char *q800_machine_valid_cpu_types[] = {
+static const char * const q800_machine_valid_cpu_types[] = {
     M68K_CPU_TYPE_NAME("m68040"),
     NULL
 };
 
+static const char * const q800_machine_valid_cpu_models[] = {
+    "m68040",
+    NULL
+};
+
 static void q800_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -609,6 +614,7 @@ static void q800_machine_class_init(ObjectClass *oc, void *data)
     mc->init = q800_machine_init;
     mc->default_cpu_type = M68K_CPU_TYPE_NAME("m68040");
     mc->valid_cpu_types = q800_machine_valid_cpu_types;
+    mc->valid_cpu_models = q800_machine_valid_cpu_models;
     mc->max_cpus = 1;
     mc->block_default_type = IF_SCSI;
     mc->default_ram_id = "m68k_mac.ram";
diff --git a/include/hw/boards.h b/include/hw/boards.h
index ed83360198..81747b0788 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -268,7 +268,8 @@ struct MachineClass {
     bool has_hotpluggable_cpus;
     bool ignore_memory_transaction_failures;
     int numa_mem_align_shift;
-    const char **valid_cpu_types;
+    const char * const *valid_cpu_types;
+    const char * const *valid_cpu_models;
     strList *allowed_dynamic_sysbus_devices;
     bool auto_enable_numa_with_memhp;
     bool auto_enable_numa_with_memdev;
-- 
2.41.0


