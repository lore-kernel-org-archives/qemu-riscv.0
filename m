Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C2FEE14C3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:39:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe33X-0001uJ-8R; Wed, 06 Sep 2023 20:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33R-0001fO-GG
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe33P-0001CN-8Y
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHeRbe1aDL94lupPs+/BMLBD1wSoPr3zaknBi0ZyXHs=;
 b=hffkeaaFzQlQ4rjvJyIntAYvNWofTOR/T7gOb7i3xFbk6lQqIb79+HhfrPHnlRCbz3z2fd
 JlXSn/RHB7JnQ2Onr2wqyDVDVrkOK4/EBOfgJ/Qhm0nCF+ouQoslWYAT5rgI53bqH7dKwz
 tuJEX2KUm6IoleN/iDH0L2K0HP6PH8U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-fX3uU0-sOHSbYOY_XgOUTA-1; Wed, 06 Sep 2023 20:39:24 -0400
X-MC-Unique: fX3uU0-sOHSbYOY_XgOUTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B5D73C0EAA3;
 Thu,  7 Sep 2023 00:39:21 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2909C03295;
 Thu,  7 Sep 2023 00:39:06 +0000 (UTC)
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
Subject: [PATCH v3 10/32] target/mips: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:31 +1000
Message-ID: <20230907003553.1636896-11-gshan@redhat.com>
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

For target/mips, the CPU type name is always the combination of the
CPU model name and suffix. The CPU model names have been shown
correctly in mips_cpu_list(), which fetches the CPU model names from
the pre-defined array. It's different from other targets and lack
of flexibility.

Implement mips_cpu_list() by fetching the CPU model names from the
available CPU classes. Besides, the retrieved class needs to be
validated before it's returned in mips_cpu_class_by_name(), as other
targets do.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/mips/cpu-defs.c.inc         |  9 ---------
 target/mips/cpu.c                  | 25 ++++++++++++++++++++++++-
 target/mips/sysemu/mips-qmp-cmds.c |  3 +--
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index c0c389c59a..fbf787d8ce 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -1018,15 +1018,6 @@ const mips_def_t mips_defs[] =
 };
 const int mips_defs_number = ARRAY_SIZE(mips_defs);
 
-void mips_cpu_list(void)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(mips_defs); i++) {
-        qemu_printf("MIPS '%s'\n", mips_defs[i].name);
-    }
-}
-
 static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     int i;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 63da1948fd..3431acbd99 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -532,7 +532,12 @@ static ObjectClass *mips_cpu_class_by_name(const char *cpu_model)
     typename = mips_cpu_type_name(cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    return oc;
+    if (object_class_dynamic_cast(oc, TYPE_MIPS_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
+    }
+
+    return NULL;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -566,6 +571,24 @@ static const struct TCGCPUOps mips_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static void mips_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
+}
+
+void mips_cpu_list(void)
+{
+    GSList *list;
+    list = object_class_get_list_sorted(TYPE_MIPS_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, mips_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
 static void mips_cpu_class_init(ObjectClass *c, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
diff --git a/target/mips/sysemu/mips-qmp-cmds.c b/target/mips/sysemu/mips-qmp-cmds.c
index 6db4626412..7340ac70ba 100644
--- a/target/mips/sysemu/mips-qmp-cmds.c
+++ b/target/mips/sysemu/mips-qmp-cmds.c
@@ -19,8 +19,7 @@ static void mips_cpu_add_definition(gpointer data, gpointer user_data)
 
     typename = object_class_get_name(oc);
     info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_MIPS_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
-- 
2.41.0


