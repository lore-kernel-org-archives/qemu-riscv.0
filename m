Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3CC4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 00:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r9x87-0004hO-RP; Sun, 03 Dec 2023 19:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x84-0004gI-Cz
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:48:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x82-00013Z-Tg
 for qemu-riscv@nongnu.org; Sun, 03 Dec 2023 19:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701650885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp1q/BWuHKtsyc0Pp2ZWNDYZQcuu4upOXCfcp+F1D/g=;
 b=CgNlTStTg9IHWiGTRFFccgA5fFDNVXjH/YTVkdJbDpl9vxeomL37losrJpURd0yOn7hk7z
 /BhTYDr6KYCwLGnYcM0b5i1LMXGkXZcBoFmSI+/hzwBv6gIxg+Z/7O7rfDas+4TUExxu5N
 MsZKKCPh8/uuH1EJo9BsHykP+ClU6Dk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-MLlmBdKgObKt-2QwCgrLaQ-1; Sun,
 03 Dec 2023 19:47:59 -0500
X-MC-Unique: MLlmBdKgObKt-2QwCgrLaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA2013C0E64C;
 Mon,  4 Dec 2023 00:47:57 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 277DF492BE0;
 Mon,  4 Dec 2023 00:47:49 +0000 (UTC)
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
Subject: [PATCH v9 1/9] machine: Use error handling when CPU type is checked
Date: Mon,  4 Dec 2023 10:47:18 +1000
Message-ID: <20231204004726.483558-2-gshan@redhat.com>
In-Reply-To: <20231204004726.483558-1-gshan@redhat.com>
References: <20231204004726.483558-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Functions that use an Error **errp parameter to return errors should
not also report them to the user, because reporting is the caller's
job. The principle is violated by machine_run_board_init() because
it calls error_report(), error_printf(), and exit(1) when the machine
doesn't support the requested CPU type.

Clean this up by using error_setg() and error_append_hint() instead.
No functional change, as the only caller passes &error_fatal.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
v9: Improved change log                                  (Markus)
---
 hw/core/machine.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0c17398141..bde7f4af6d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1466,15 +1466,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
 
         if (!machine_class->valid_cpu_types[i]) {
             /* The user specified CPU is not valid */
-            error_report("Invalid CPU type: %s", machine->cpu_type);
-            error_printf("The valid types are: %s",
-                         machine_class->valid_cpu_types[0]);
+            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            error_append_hint(errp, "The valid types are: %s",
+                              machine_class->valid_cpu_types[0]);
             for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_printf(", %s", machine_class->valid_cpu_types[i]);
+                error_append_hint(errp, ", %s",
+                                  machine_class->valid_cpu_types[i]);
             }
-            error_printf("\n");
 
-            exit(1);
+            error_append_hint(&errp, "\n");
+            return;
         }
     }
 
-- 
2.42.0


