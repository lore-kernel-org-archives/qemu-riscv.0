Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01900EE14D0
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:41:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe353-0006DR-M2; Wed, 06 Sep 2023 20:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34x-00069P-KZ
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34u-0001tE-4V
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKDsmqdKXW/52OHgWrNIrks6OR99NisUwEAqLjed2eQ=;
 b=KSH9WqGUDEez7y0tclAFjhUwlIBqmf+xgoU1Nn4emDxM7KP14xI82vJld93M8rltcC7FFK
 d4p7UJmb3r/H+HoTWjkCb+mt0tLh7F+el+63IVGePxB5v8DcArizCReIU8LFTVhdl9Ijl7
 qYwiHr4BZ14pb24OMEx9i3s6jLfb4Dg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-Zrx_wl5zOQCtWyT1uYgbyA-1; Wed, 06 Sep 2023 20:40:55 -0400
X-MC-Unique: Zrx_wl5zOQCtWyT1uYgbyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 290BD181792B;
 Thu,  7 Sep 2023 00:40:53 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C8CAC03295;
 Thu,  7 Sep 2023 00:40:38 +0000 (UTC)
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
Subject: [PATCH v3 16/32] target/sh4: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:37 +1000
Message-ID: <20230907003553.1636896-17-gshan@redhat.com>
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

For target/sh4, the CPU type name can be: (1) the combination of the
CPU model name and suffix; (2) TYPE_SH7750R_CPU when the CPU model
name is "any". The CPU model names have been correctly shown in
superh_cpu_list_entry().

Use generic helper cpu_model_from_type() to show the CPU model name
in the above function. Besides, superh_cpu_class_by_name() is improved
by avoiding "goto out" and validating the CPU class.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/sh4/cpu.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 61769ffdfa..ca06e2ce99 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -125,9 +125,10 @@ static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 static void superh_cpu_list_entry(gpointer data, gpointer user_data)
 {
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(SUPERH_CPU_TYPE_SUFFIX);
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("%.*s\n", len, typename);
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void sh4_cpu_list(void)
@@ -135,6 +136,7 @@ void sh4_cpu_list(void)
     GSList *list;
 
     list = object_class_get_list_sorted(TYPE_SUPERH_CPU, false);
+    qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, superh_cpu_list_entry, NULL);
     g_slist_free(list);
 }
@@ -146,20 +148,20 @@ static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
 
     s = g_ascii_strdown(cpu_model, -1);
     if (strcmp(s, "any") == 0) {
-        oc = object_class_by_name(TYPE_SH7750R_CPU);
-        goto out;
+        typename = g_strdup(TYPE_SH7750R_CPU);
+    } else {
+        typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
     }
 
-    typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
     oc = object_class_by_name(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
-
-out:
     g_free(s);
     g_free(typename);
-    return oc;
+    if (object_class_dynamic_cast(oc, TYPE_SUPERH_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
+    }
+
+    return NULL;
 }
 
 static void sh7750r_cpu_initfn(Object *obj)
-- 
2.41.0


