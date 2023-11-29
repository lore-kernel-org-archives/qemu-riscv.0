Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97369C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 04:22:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8C4x-0002Ed-7C; Tue, 28 Nov 2023 23:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4s-000266-PG
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 23:21:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4q-0007PD-1W
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 23:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701231691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Jgzcsw4wi9TdGHuAd1FUF0BAgtVYLmWUIhdAchC7Ww=;
 b=Qono+N9qo0cKKdg+RueIRwWkth/z5i4IZUkJEOcGgkfhLuqQX4lAyb80CDh6QqELjahyqy
 n9mM733H+MlJ9uYArLYvyjx7riNheualj7DlQzUE4XsAkVYfmRh92t+0mizYWu0gxZwEpn
 ZrwcQ8Z/3ItHLJxsx6ahRtzuhOYvpLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-pTgUKQcYMyOt-JP8SmUFYg-1; Tue, 28 Nov 2023 23:21:26 -0500
X-MC-Unique: pTgUKQcYMyOt-JP8SmUFYg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA4BE80C343;
 Wed, 29 Nov 2023 04:21:25 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C3B7492BE0;
 Wed, 29 Nov 2023 04:21:18 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v8 6/9] hw/arm/virt: Check CPU type in machine_run_board_init()
Date: Wed, 29 Nov 2023 14:20:09 +1000
Message-ID: <20231129042012.277831-7-gshan@redhat.com>
In-Reply-To: <20231129042012.277831-1-gshan@redhat.com>
References: <20231129042012.277831-1-gshan@redhat.com>
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

Set mc->valid_cpu_types so that the user specified CPU type can be
validated in machine_run_board_init(). We needn't to do the check
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 62 +++++++++++++++++++--------------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 668c0d3194..04f9f5fa56 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,40 +204,6 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
-static const char *valid_cpus[] = {
-#ifdef CONFIG_TCG
-    ARM_CPU_TYPE_NAME("cortex-a7"),
-    ARM_CPU_TYPE_NAME("cortex-a15"),
-    ARM_CPU_TYPE_NAME("cortex-a35"),
-    ARM_CPU_TYPE_NAME("cortex-a55"),
-    ARM_CPU_TYPE_NAME("cortex-a72"),
-    ARM_CPU_TYPE_NAME("cortex-a76"),
-    ARM_CPU_TYPE_NAME("cortex-a710"),
-    ARM_CPU_TYPE_NAME("a64fx"),
-    ARM_CPU_TYPE_NAME("neoverse-n1"),
-    ARM_CPU_TYPE_NAME("neoverse-v1"),
-    ARM_CPU_TYPE_NAME("neoverse-n2"),
-#endif
-    ARM_CPU_TYPE_NAME("cortex-a53"),
-    ARM_CPU_TYPE_NAME("cortex-a57"),
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    ARM_CPU_TYPE_NAME("host"),
-#endif
-    ARM_CPU_TYPE_NAME("max"),
-};
-
-static bool cpu_type_valid(const char *cpu)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
-        if (strcmp(cpu, valid_cpus[i]) == 0) {
-            return true;
-        }
-    }
-    return false;
-}
-
 static void create_randomness(MachineState *ms, const char *node)
 {
     struct {
@@ -2041,11 +2007,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -2939,6 +2900,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+#ifdef CONFIG_TCG
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        ARM_CPU_TYPE_NAME("cortex-a35"),
+        ARM_CPU_TYPE_NAME("cortex-a55"),
+        ARM_CPU_TYPE_NAME("cortex-a72"),
+        ARM_CPU_TYPE_NAME("cortex-a76"),
+        ARM_CPU_TYPE_NAME("cortex-a710"),
+        ARM_CPU_TYPE_NAME("a64fx"),
+        ARM_CPU_TYPE_NAME("neoverse-n1"),
+        ARM_CPU_TYPE_NAME("neoverse-v1"),
+        ARM_CPU_TYPE_NAME("neoverse-n2"),
+#endif
+        ARM_CPU_TYPE_NAME("cortex-a53"),
+        ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+        ARM_CPU_TYPE_NAME("host"),
+#endif
+        ARM_CPU_TYPE_NAME("max"),
+        NULL
+    };
 
     mc->init = machvirt_init;
     /* Start with max_cpus set to 512, which is the maximum supported by KVM.
@@ -2965,6 +2948,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
 #endif
+    mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.42.0


