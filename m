Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D1C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:06:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33Ii-0000hh-Bq; Tue, 14 Nov 2023 18:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33If-0000Ya-CE
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Ic-00072J-SB
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiBQ8HNskbnGJakIHTbXcUveCafNXtneVERt1nHqLFo=;
 b=APuOwy2u6AuKd34eMLoHqys4e7ByknDFFHysteY5wjHkLkf9kn0zKCeSe5Rufxb79+zKAy
 E6/ErYQIS3NgDETbk1qRoOxSpFEdtvGmKrFzzR2QBgSBEsqeJ/zcMoBHFSz2Rn18P4YOBb
 VSzL8YbUqtxOe/9VNS51MnJf00R7Tyk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-SZ7MPvCIOgCBq8QawagQkw-1; Tue,
 14 Nov 2023 18:58:21 -0500
X-MC-Unique: SZ7MPvCIOgCBq8QawagQkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00A7129ABA0F;
 Tue, 14 Nov 2023 23:58:20 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56771C15885;
 Tue, 14 Nov 2023 23:58:07 +0000 (UTC)
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
Subject: [PATCH v5 06/31] cpu: Add generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:03 +1000
Message-ID: <20231114235628.534334-7-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add generic cpu_list() to replace the individual target's implementation
in the subsequent commits. Currently, there are 3 targets with no cpu_list()
implementation: microblaze and nios2. With this applied, those two targets
switch to the generic cpu_list().

[gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
Available CPUs:
  microblaze-cpu

[gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
Available CPUs:
  nios2-cpu

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 bsd-user/main.c |  5 +----
 cpu-target.c    | 29 ++++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index e6014f517e..4de226d211 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -378,10 +378,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "cpu")) {
             cpu_model = argv[optind++];
             if (is_help_option(cpu_model)) {
-                /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
-                cpu_list();
-#endif
+                list_cpus();
                 exit(1);
             }
         } else if (!strcmp(r, "B")) {
diff --git a/cpu-target.c b/cpu-target.c
index c078c0e91b..acfc654b95 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
+#include "qemu/qemu-print.h"
 #include "migration/vmstate.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
@@ -283,12 +284,34 @@ const char *parse_cpu_option(const char *cpu_option)
     return cpu_type;
 }
 
+#ifndef cpu_list
+static void cpu_list_entry(gpointer data, gpointer user_data)
+{
+    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    g_autofree char *model = cpu_model_from_type(typename);
+
+    if (cc->deprecation_note) {
+        qemu_printf("  %s (deprecated)\n", model);
+    } else {
+        qemu_printf("  %s\n", model);
+    }
+}
+
+static void cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list_sorted(TYPE_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+#endif
+
 void list_cpus(void)
 {
-    /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
     cpu_list();
-#endif
 }
 
 #if defined(CONFIG_USER_ONLY)
-- 
2.41.0


