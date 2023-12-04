Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E57EC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 00:49:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r9x8M-0004lj-Nb; Sun, 03 Dec 2023 19:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8G-0004jv-Nz
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8F-0001VB-7j
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701650898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+sBfUbkBu8GbdgecjTf7+hqFuVu0mmAyZFP7UyKFg4=;
 b=T5xKehB3efeRnrLYYVuUrxayMtnxmbqT/3mSSMoHc1TZw052twty1D29PeZK6hVgHQ86Tp
 LIaL0s8vsMUnI1lKgxBRFG6ipdF/C/LZjfAP76qMBIEeVB/buJmOPSoegaSC5ZXcO3TZCd
 Gy114Gz0eeOAIHRSJu0ojsu/v1orNvo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-wjT2K2WkO3Wz5g1HrKdYmQ-1; Sun, 03 Dec 2023 19:48:15 -0500
X-MC-Unique: wjT2K2WkO3Wz5g1HrKdYmQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4265811E7B;
 Mon,  4 Dec 2023 00:48:13 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7793C492BE0;
 Mon,  4 Dec 2023 00:48:06 +0000 (UTC)
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
Subject: [PATCH v9 3/9] machine: Improve is_cpu_type_supported()
Date: Mon,  4 Dec 2023 10:47:20 +1000
Message-ID: <20231204004726.483558-4-gshan@redhat.com>
In-Reply-To: <20231204004726.483558-1-gshan@redhat.com>
References: <20231204004726.483558-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

It's no sense to check the CPU type when mc->valid_cpu_types[0] is
NULL, which is a program error. Raise an assert on this.

A precise hint for the error message is given when mc->valid_cpu_types[0]
is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
when we have mutiple valid entries there is avoided to increase the code
readability, as suggested by Philippe Mathieu-Daudé.

Besides, @cc comes from machine->cpu_type or mc->default_cpu_type. For
the later case, it can be NULL and it's also a program error. We should
use assert() in this case.

Signed-off-by: Gavin Shan <gshan@redhat.com>
v9: assert(mc->valid_cpu_types[0] != NULL)                   (Phil)
    assert(cc != NULL);                                      (Phil)
---
 hw/core/machine.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1797e002f9..4ae9aaee8e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1400,6 +1400,7 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
      * type is provided through '-cpu' option.
      */
     if (mc->valid_cpu_types && machine->cpu_type) {
+        assert(mc->valid_cpu_types[0] != NULL);
         for (i = 0; mc->valid_cpu_types[i]; i++) {
             if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
                 break;
@@ -1409,20 +1410,27 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
         /* The user specified CPU type isn't valid */
         if (!mc->valid_cpu_types[i]) {
             error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              mc->valid_cpu_types[0]);
-            for (i = 1; mc->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+            if (!mc->valid_cpu_types[1]) {
+                error_append_hint(errp, "The only valid type is: %s\n",
+                                  mc->valid_cpu_types[0]);
+            } else {
+                error_append_hint(errp, "The valid types are: ");
+                for (i = 0; mc->valid_cpu_types[i]; i++) {
+                    error_append_hint(errp, "%s%s",
+                                      mc->valid_cpu_types[i],
+                                      mc->valid_cpu_types[i + 1] ? ", " : "");
+                }
+                error_append_hint(errp, "\n");
             }
 
-            error_append_hint(errp, "\n");
             return false;
         }
     }
 
     /* Check if CPU type is deprecated and warn if so */
     cc = CPU_CLASS(oc);
-    if (cc && cc->deprecation_note) {
+    assert(cc != NULL);
+    if (cc->deprecation_note) {
         warn_report("CPU model %s is deprecated -- %s",
                     machine->cpu_type, cc->deprecation_note);
     }
-- 
2.42.0


