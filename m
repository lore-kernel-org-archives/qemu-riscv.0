Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDA6C0018C
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:34:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLbs-0008E1-Qf; Wed, 01 Nov 2023 20:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLbn-00089j-J1
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:30:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLbQ-0002FK-Ik
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CS9WAK+dqktcYzoU9u7efV8+Qe490a5JgjTWZMkrZyU=;
 b=Ka1zEToMHQ/iSDpPf/x+TKDq4BZ5evgaz97vaPSv9vRkBpy/d7dMwVqvyZMxsdwvmp2YNC
 JERqbVSdbcYMArq+n565zfPymIjZKp2EkC0HHoE+q2GrBch8nj6yQKziZrBJ0Z7F9cXu2T
 /0dkUKt2ipnj1P8eI4f+vHVv6yhCIhY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-JC9Gl2lnN4WQSwQUkQvJTA-1; Wed,
 01 Nov 2023 20:30:22 -0400
X-MC-Unique: JC9Gl2lnN4WQSwQUkQvJTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C6D928211A4;
 Thu,  2 Nov 2023 00:30:20 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8BFC1290F;
 Thu,  2 Nov 2023 00:30:04 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imammedo@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 shan.gavin@gmail.com
Subject: [PATCH v4 18/33] target/s390x: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:45 +1000
Message-ID: <20231102002500.1750692-19-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

For target/s390x, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/s390x/cpu_models.c        | 12 ++++++------
 target/s390x/cpu_models_sysemu.c |  9 ++++-----
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 4dead48650..71635b92c8 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -339,7 +339,8 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
 {
     const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
     CPUClass *cc = CPU_CLASS(scc);
-    char *name = g_strdup(object_class_get_name((ObjectClass *)data));
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
     g_autoptr(GString) details = g_string_new("");
 
     if (scc->is_static) {
@@ -356,14 +357,12 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
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
@@ -408,6 +407,7 @@ void s390_cpu_list(void)
 
     list = object_class_get_list(TYPE_S390_CPU, false);
     list = g_slist_sort(list, s390_cpu_list_compare);
+    qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, s390_print_cpu_model_list_entry, NULL);
     g_slist_free(list);
 
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


