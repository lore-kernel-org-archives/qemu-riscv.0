Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64007C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 00:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r9x8F-0004jV-P5; Sun, 03 Dec 2023 19:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x89-0004hj-4I
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x87-0001EN-6N
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701650890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpQAZaaun9SVQ9B+FBUJtZTWNDdCbSbBhnHehUA4e3s=;
 b=SJOBaE5xlKKV94AJWxPZth03Nr4bz+Hm+wKtNa2Wm2pljfE/tt69PWcDuDW73RScwZkjdQ
 HMkFlLpYtosxWfoU4rIHrr5jwku1z/J6+v8qGeHWXa7xDBL8rA0h4pdl/f5t7gbj1OBxnv
 jg1sJSVoXO9YHOGD4PuSZLpSaZNFdMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-Ce4Rt8oBP12oZ4iJ6jq7JA-1; Sun, 03 Dec 2023 19:48:07 -0500
X-MC-Unique: Ce4Rt8oBP12oZ4iJ6jq7JA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3BBB185A782;
 Mon,  4 Dec 2023 00:48:05 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1F3492BE0;
 Mon,  4 Dec 2023 00:47:58 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 armbru@redhat.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v9 2/9] machine: Introduce helper is_cpu_type_supported()
Date: Mon,  4 Dec 2023 10:47:19 +1000
Message-ID: <20231204004726.483558-3-gshan@redhat.com>
In-Reply-To: <20231204004726.483558-1-gshan@redhat.com>
References: <20231204004726.483558-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The logic, to check if the specified CPU type is supported in
machine_run_board_init(), is independent enough. Factor it out into
helper is_cpu_type_supported(). machine_run_board_init() looks a bit
clean with this. Since we're here, @machine_class is renamed to @mc to
avoid multiple line spanning of code. The comments are tweaked a bit
either.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c | 83 +++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index bde7f4af6d..1797e002f9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1387,13 +1387,53 @@ out:
     return r;
 }
 
+static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    ObjectClass *oc = object_class_by_name(machine->cpu_type);
+    CPUClass *cc;
+    int i;
+
+    /*
+     * Check if the user specified CPU type is supported when the valid
+     * CPU types have been determined. Note that the user specified CPU
+     * type is provided through '-cpu' option.
+     */
+    if (mc->valid_cpu_types && machine->cpu_type) {
+        for (i = 0; mc->valid_cpu_types[i]; i++) {
+            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
+                break;
+            }
+        }
+
+        /* The user specified CPU type isn't valid */
+        if (!mc->valid_cpu_types[i]) {
+            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            error_append_hint(errp, "The valid types are: %s",
+                              mc->valid_cpu_types[0]);
+            for (i = 1; mc->valid_cpu_types[i]; i++) {
+                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+            }
+
+            error_append_hint(errp, "\n");
+            return false;
+        }
+    }
+
+    /* Check if CPU type is deprecated and warn if so */
+    cc = CPU_CLASS(oc);
+    if (cc && cc->deprecation_note) {
+        warn_report("CPU model %s is deprecated -- %s",
+                    machine->cpu_type, cc->deprecation_note);
+    }
+
+    return true;
+}
 
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
 {
     ERRP_GUARD();
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
-    ObjectClass *oc = object_class_by_name(machine->cpu_type);
-    CPUClass *cc;
 
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
@@ -1448,42 +1488,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
         machine->ram = machine_consume_memdev(machine, machine->memdev);
     }
 
-    /* If the machine supports the valid_cpu_types check and the user
-     * specified a CPU with -cpu check here that the user CPU is supported.
-     */
-    if (machine_class->valid_cpu_types && machine->cpu_type) {
-        int i;
-
-        for (i = 0; machine_class->valid_cpu_types[i]; i++) {
-            if (object_class_dynamic_cast(oc,
-                                          machine_class->valid_cpu_types[i])) {
-                /* The user specified CPU is in the valid field, we are
-                 * good to go.
-                 */
-                break;
-            }
-        }
-
-        if (!machine_class->valid_cpu_types[i]) {
-            /* The user specified CPU is not valid */
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              machine_class->valid_cpu_types[0]);
-            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s",
-                                  machine_class->valid_cpu_types[i]);
-            }
-
-            error_append_hint(&errp, "\n");
-            return;
-        }
-    }
-
-    /* Check if CPU type is deprecated and warn if so */
-    cc = CPU_CLASS(oc);
-    if (cc && cc->deprecation_note) {
-        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
-                    cc->deprecation_note);
+    /* Check if the CPU type is supported */
+    if (!is_cpu_type_supported(machine, errp)) {
+        return;
     }
 
     if (machine->cgs) {
-- 
2.42.0


