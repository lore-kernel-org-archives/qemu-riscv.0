Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B46EE14AA
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:44:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe37g-00072A-IQ; Wed, 06 Sep 2023 20:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe37U-0006ba-L4
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe37S-0002kh-Cg
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbGwHB4mWijPQ+/fg6B1+QfkYHpL/exZfBoZeVN3H+k=;
 b=aC/Ioq9zUhUt7e5ZMOe2D6Q6zUb5LHZ3amNBO/ErwIz/oWx4LqPP4La89IFK9zaz0D8O9c
 kmnczlmb9/ezGVdSkgxAobRaqt3u5qdYWJGY1xShyxy10Q/pcstcMiV4g+e2QPcoctgQWa
 Lz9Uil4bJdpYk7L/+qUHSGmNA84THpA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-58uiBHwbNNGgQY5h80IhCw-1; Wed, 06 Sep 2023 20:43:31 -0400
X-MC-Unique: 58uiBHwbNNGgQY5h80IhCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BE321C09A4A;
 Thu,  7 Sep 2023 00:43:29 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF219C03295;
 Thu,  7 Sep 2023 00:43:14 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com, ysato@users.sourceforge.jp,
 david@redhat.com, thuth@redhat.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 26/32] machine: Introduce helper is_cpu_type_supported()
Date: Thu,  7 Sep 2023 10:35:47 +1000
Message-ID: <20230907003553.1636896-27-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
machine_run_board_init(), is independent enough. Factor it out
into helper is_cpu_type_supported(). With this, machine_run_board_init()
looks a bit clean. Since we're here, @machine_class is renamed to
@mc to avoid multiple line spanning of code. The comments are tweaked
a bit either.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 82 +++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 6d3f8e133f..93a327927f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1352,12 +1352,50 @@ out:
     return r;
 }
 
+static void is_cpu_type_supported(MachineState *machine, Error **errp)
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
+            return;
+        }
+    }
+
+    /* Check if CPU type is deprecated and warn if so */
+    cc = CPU_CLASS(oc);
+    if (cc && cc->deprecation_note) {
+        warn_report("CPU model %s is deprecated -- %s",
+                    machine->cpu_type, cc->deprecation_note);
+    }
+}
 
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
-    ObjectClass *oc = object_class_by_name(machine->cpu_type);
-    CPUClass *cc;
     Error *local_err = NULL;
 
     /* This checkpoint is required by replay to separate prior clock
@@ -1409,42 +1447,10 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
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
-                /* The user specificed CPU is in the valid field, we are
-                 * good to go.
-                 */
-                break;
-            }
-        }
-
-        if (!machine_class->valid_cpu_types[i]) {
-            /* The user specified CPU is not valid */
-            error_setg(&local_err, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(&local_err, "The valid types are: %s",
-                              machine_class->valid_cpu_types[0]);
-            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_append_hint(&local_err, ", %s",
-                                  machine_class->valid_cpu_types[i]);
-            }
-            error_append_hint(&local_err, "\n");
-
-            error_propagate(errp, local_err);
-        }
-    }
-
-    /* Check if CPU type is deprecated and warn if so */
-    cc = CPU_CLASS(oc);
-    if (cc && cc->deprecation_note) {
-        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
-                    cc->deprecation_note);
+    /* Check if the CPU type is supported */
+    is_cpu_type_supported(machine, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
     }
 
     if (machine->cgs) {
-- 
2.41.0


