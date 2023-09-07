Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C530EE14AA
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe34d-0005XL-Ej; Wed, 06 Sep 2023 20:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34M-00055Z-1h
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:40:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34A-0001Y7-SX
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5T6POskXSuvPEg0D1DaKzXS3b4ah1wA83nl5zb8FYQ=;
 b=Jqq9RUhBoVtgJg1fvZM1qg9nzXnYrASb3vxMEclPGO/W6uMmpQ29TJLrnZQeKpvNWiVsfB
 1pEr4xrhbWhjahoqq22cHDuO3Hj755yGmAFY2kwqfqVL0i7+bOyfTTJXqEmYNtHOzhHpmb
 lWi9U6kkZh/aynZcYhuV9KXo2NKU59o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-ZYm2f91uMD6EXVBOHc_XJQ-1; Wed, 06 Sep 2023 20:40:09 -0400
X-MC-Unique: ZYm2f91uMD6EXVBOHc_XJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8109C89CB03;
 Thu,  7 Sep 2023 00:40:07 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8BDCC03295;
 Thu,  7 Sep 2023 00:39:52 +0000 (UTC)
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
Subject: [PATCH v3 13/32] target/riscv: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:34 +1000
Message-ID: <20230907003553.1636896-14-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

For target/riscv, the CPU type name is always the combination of the
CPU model name and suffix. The CPU model names have been correctly
shown in riscv_cpu_list_entry() and riscv_cpu_add_definition()

Use generic helper cpu_mdoel_from_type() to show the CPU model names
in the above two functions, and adjusted format of the output from
riscv_cpu_list_entry() to match with other targets. Besides, the
function riscv_cpu_class_by_name() is improved by renaming @cpuname
to @model since it's for the CPU model name, and merging the condtion
of "@oc == NULL" to object_class_dynamic_cast().

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/riscv/cpu.c            | 23 +++++++++++++----------
 target/riscv/riscv-qmp-cmds.c |  3 +--
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453..a525e24c5a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -612,18 +612,19 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
     char *typename;
-    char **cpuname;
+    char **model;
 
-    cpuname = g_strsplit(cpu_model, ",", 1);
-    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), cpuname[0]);
+    model = g_strsplit(cpu_model, ",", 1);
+    typename = g_strdup_printf(RISCV_CPU_TYPE_NAME("%s"), model[0]);
     oc = object_class_by_name(typename);
-    g_strfreev(cpuname);
+    g_strfreev(model);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
-        object_class_is_abstract(oc)) {
-        return NULL;
+    if (object_class_dynamic_cast(oc, TYPE_RISCV_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
     }
-    return oc;
+
+    return NULL;
 }
 
 static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
@@ -2211,9 +2212,10 @@ static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
 static void riscv_cpu_list_entry(gpointer data, gpointer user_data)
 {
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX);
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("%.*s\n", len, typename);
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void riscv_cpu_list(void)
@@ -2222,6 +2224,7 @@ void riscv_cpu_list(void)
 
     list = object_class_get_list(TYPE_RISCV_CPU, false);
     list = g_slist_sort(list, riscv_cpu_list_compare);
+    qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, riscv_cpu_list_entry, NULL);
     g_slist_free(list);
 }
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 5ecff1afb3..22f728673f 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -35,8 +35,7 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
     const char *typename = object_class_get_name(oc);
     ObjectClass *dyn_class;
 
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_RISCV_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     dyn_class = object_class_dynamic_cast(oc, TYPE_RISCV_DYNAMIC_CPU);
-- 
2.41.0


