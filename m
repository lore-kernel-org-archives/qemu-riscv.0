Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D03EE14C3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:41:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe34n-0005ta-8y; Wed, 06 Sep 2023 20:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34m-0005s1-GC
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe34j-0001qE-2P
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJ3ZX76U634nIvhP7SZ8lESzSWQxOs38powANobbcpg=;
 b=ROd42SKO/whJ1dYj08t5pQvUc3oDXK9fjb55N/2x5vOIJ2jv8J/i/WASgTjnmoETvKUTzx
 3oUMvQ/ozHsKvJWQnF2j32EFU6eQwM54lENP9dVH3E0pcGLrHRtbRspsb+TF2t3txnvfIx
 ZZQGfuSaNd+O8KxRxFsr7LW1czrsZCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-KqEXUMoCObO4KuAAGjga-Q-1; Wed, 06 Sep 2023 20:40:42 -0400
X-MC-Unique: KqEXUMoCObO4KuAAGjga-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8094181792D;
 Thu,  7 Sep 2023 00:40:37 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E099C03295;
 Thu,  7 Sep 2023 00:40:23 +0000 (UTC)
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
Subject: [PATCH v3 15/32] target/s390x: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:36 +1000
Message-ID: <20230907003553.1636896-16-gshan@redhat.com>
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

For target/s390x, the CPU type name is always the combination of the
CPU modle name and suffix. The CPU model names have been correctly
shown in s390_print_cpu_model_list_entry() and create_cpu_model_list().

Use generic helper cpu_model_from_type() to show the CPU model names
in the above two functions. Besides, we need validate the CPU class
in s390_cpu_class_by_name(), as other targets do.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/s390x/cpu_models.c        | 18 +++++++++++-------
 target/s390x/cpu_models_sysemu.c |  9 ++++-----
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 91ce896491..103e9072b8 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -338,7 +338,8 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
 {
     const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
     CPUClass *cc = CPU_CLASS(scc);
-    char *name = g_strdup(object_class_get_name((ObjectClass *)data));
+    const char *typename = object_class_get_name((ObjectClass *)data);
+    char *model = cpu_model_from_type(typename);
     g_autoptr(GString) details = g_string_new("");
 
     if (scc->is_static) {
@@ -355,14 +356,12 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
         g_string_truncate(details, details->len - 2);
     }
 
-    /* strip off the -s390x-cpu */
-    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
     if (details->len) {
-        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, details->str);
+        qemu_printf("s390 %-15s %-35s (%s)\n", model, scc->desc, details->str);
     } else {
-        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
+        qemu_printf("s390 %-15s %-35s\n", model, scc->desc);
     }
-    g_free(name);
+    g_free(model);
 }
 
 static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
@@ -916,7 +915,12 @@ ObjectClass *s390_cpu_class_by_name(const char *name)
 
     oc = object_class_by_name(typename);
     g_free(typename);
-    return oc;
+    if (object_class_dynamic_cast(oc, TYPE_S390_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
+    }
+
+    return NULL;
 }
 
 static const TypeInfo qemu_s390_cpu_type_info = {
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sysemu.c
index 63981bf36b..c41af253d3 100644
--- a/target/s390x/cpu_models_sysemu.c
+++ b/target/s390x/cpu_models_sysemu.c
@@ -55,17 +55,16 @@ static void create_cpu_model_list(ObjectClass *klass, void *opaque)
     struct CpuDefinitionInfoListData *cpu_list_data = opaque;
     CpuDefinitionInfoList **cpu_list = &cpu_list_data->list;
     CpuDefinitionInfo *info;
-    char *name = g_strdup(object_class_get_name(klass));
+    const char *typename = object_class_get_name(klass);
+    char *model = cpu_model_from_type(typename);
     S390CPUClass *scc = S390_CPU_CLASS(klass);
 
-    /* strip off the -s390x-cpu */
-    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
     info = g_new0(CpuDefinitionInfo, 1);
-    info->name = name;
+    info->name = model;
     info->has_migration_safe = true;
     info->migration_safe = scc->is_migration_safe;
     info->q_static = scc->is_static;
-    info->q_typename = g_strdup(object_class_get_name(klass));
+    info->q_typename = g_strdup(typename);
     /* check for unavailable features */
     if (cpu_list_data->model) {
         Object *obj;
-- 
2.41.0


