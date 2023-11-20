Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD01AC54E76
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 00:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r4s9Z-0005Nc-Cp; Sun, 19 Nov 2023 19:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s9Y-0005NE-Qm
 for qemu-riscv@nongnu.org; Sun, 19 Nov 2023 19:28:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s9W-0001By-TJ
 for qemu-riscv@nongnu.org; Sun, 19 Nov 2023 19:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700440118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRTz2OXY+BteRtjoKj83yO+c/KbuK6vMpHN9lwbaC6I=;
 b=WIDuoqAAyf6vvSdAT7Or9m0Lm0EV6Vnppl8jCaBpQzgPxbPb15U1vnTBPz+Z4BVoAqevG1
 BCyjTkB0CBVXfB49sHvnTponS2bi+AV7BgAyeb3TXcbR/mEeY5ceccpIZySAYGE2jf5GIp
 keMJ7u+Esky5tfRJr16MpiL0/+brr2s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-zomvGOJ6O-WhZ08FRBmG2g-1; Sun,
 19 Nov 2023 19:28:32 -0500
X-MC-Unique: zomvGOJ6O-WhZ08FRBmG2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 109791C0690B;
 Mon, 20 Nov 2023 00:28:31 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DAFD40C6EB9;
 Mon, 20 Nov 2023 00:28:23 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v6 3/8] machine: Print CPU model name instead of CPU type
Date: Mon, 20 Nov 2023 10:27:19 +1000
Message-ID: <20231120002724.986326-4-gshan@redhat.com>
In-Reply-To: <20231120002724.986326-1-gshan@redhat.com>
References: <20231120002724.986326-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The names of supported CPU models instead of CPU types should be
printed when the user specified CPU type isn't supported, to be
consistent with the output from '-cpu ?'.

Correct the error messages to print CPU model names instead of CPU
type names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d19aec11a3..2cdebcffaf 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1392,6 +1392,7 @@ static void is_cpu_type_supported(const MachineState *machine, Error **errp)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     ObjectClass *oc = object_class_by_name(machine->cpu_type);
     CPUClass *cc;
+    char *model;
     int i;
 
     /*
@@ -1408,17 +1409,25 @@ static void is_cpu_type_supported(const MachineState *machine, Error **errp)
 
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            model = cpu_model_from_type(machine->cpu_type);
+            g_assert(model != NULL);
+            error_setg(errp, "Invalid CPU type: %s", model);
+            g_free(model);
+
+            model = cpu_model_from_type(mc->valid_cpu_types[0]);
+            g_assert(model != NULL);
             if (!mc->valid_cpu_types[1]) {
-                error_append_hint(errp, "The only valid type is: %s",
-                                  mc->valid_cpu_types[0]);
+                error_append_hint(errp, "The only valid type is: %s", model);
             } else {
-                error_append_hint(errp, "The valid types are: %s",
-                                  mc->valid_cpu_types[0]);
+                error_append_hint(errp, "The valid types are: %s", model);
             }
+            g_free(model);
 
             for (i = 1; mc->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+                model = cpu_model_from_type(mc->valid_cpu_types[i]);
+                g_assert(model != NULL);
+                error_append_hint(errp, ", %s", model);
+                g_free(model);
             }
 
             error_append_hint(errp, "\n");
-- 
2.41.0


