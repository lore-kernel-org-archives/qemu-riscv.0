Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE0AC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:32:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLbT-0007Oz-Px; Wed, 01 Nov 2023 20:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLbJ-0007Gh-GK
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLb0-0001df-2z
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0TNBFYE0r6gaZ9lAyDU4zRusYEgfnZQ7PErz0ryNCc=;
 b=T9HY8kEaq13yAXl60+mkGFwPkOSi+lb/sCzsBdk1UpjrZRVxFTXEi9fyTHNTgBYXsKPc56
 oCr2OhNtz4BCtvPgljd0INh555Zfpe2egjL3u/+Jb+JKStKnPZ+DoyJNx3pJPNnNSfhgLI
 uXay7ppTlM1jvBbMscY3WRRLXv3B5lU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-52I1WpQzOEu7JTNoU_1jvg-1; Wed, 01 Nov 2023 20:29:51 -0400
X-MC-Unique: 52I1WpQzOEu7JTNoU_1jvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E6A6185A782;
 Thu,  2 Nov 2023 00:29:49 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AEDEC1290F;
 Thu,  2 Nov 2023 00:29:34 +0000 (UTC)
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
Subject: [PATCH v4 16/33] target/riscv: Use generic helper to show CPU model
 names
Date: Thu,  2 Nov 2023 10:24:43 +1000
Message-ID: <20231102002500.1750692-17-gshan@redhat.com>
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

For target/riscv, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Besides, @cpuname is renamed to @model in riscv_cpu_class_by_name()
since it points to CPU model name instead of CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c            | 14 ++++++++------
 target/riscv/riscv-qmp-cmds.c |  3 +--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8b4024338c..9f47379145 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -629,12 +629,12 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
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
 
     return oc;
@@ -1644,9 +1644,10 @@ static gint riscv_cpu_list_compare(gconstpointer a, gconstpointer b)
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
@@ -1655,6 +1656,7 @@ void riscv_cpu_list(void)
 
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


