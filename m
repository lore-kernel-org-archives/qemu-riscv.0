Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B8EEE14C3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:37:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe31d-0002uy-2r; Wed, 06 Sep 2023 20:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe31W-0002nS-3q
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe31R-0000iV-8l
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqwxxr4yZoKfnJOBXIlU5BCpSoMY4uKlGYZR7LGfgSg=;
 b=KsktOQ2PU0/DQsDDf7SHcR/YDbeRYWElOh9rshR8Foqa6bE0mv2lPZNKJ96/gZxxWzzpZo
 nLz/Nt5F5LTUUnfqixKRdnoccuMVOzgZtI6ZuJr9KR+QatSlnVS2c+D2bqvrJTfFtp0lg3
 A3htKSlMZWD8ghyJrEtxtXRGu4WlvVI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-XI9HwlAPPhqqvQixahl3vg-1; Wed, 06 Sep 2023 20:37:20 -0400
X-MC-Unique: XI9HwlAPPhqqvQixahl3vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0A2538149AB;
 Thu,  7 Sep 2023 00:37:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4199EC03295;
 Thu,  7 Sep 2023 00:37:02 +0000 (UTC)
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
Subject: [PATCH v3 03/32] target/arm: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:24 +1000
Message-ID: <20230907003553.1636896-4-gshan@redhat.com>
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

For target/arm, the CPU type name can be: (1) the combination of
the CPU model name and suffix; (2) alias "any" corresponding to
"max-arm-cpu" when CONFIG_USER_ONLY is enabled. The CPU model names
have been already shown in cpu_list() and query_cpu_definitions()
by following (1).

Use generic helper cpu_model_from_type() to show the CPU model names.
The variable @name is renamed to @model in arm_cpu_list_entry() since
it points to the CPU model name instead of the CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/arm-qmp-cmds.c |  6 ++----
 target/arm/helper.c       | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index c8fa524002..51fddaefc3 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -233,12 +233,10 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
     ObjectClass *oc = data;
     CpuDefinitionInfoList **cpu_list = user_data;
     CpuDefinitionInfo *info;
-    const char *typename;
+    const char *typename = object_class_get_name(oc);
 
-    typename = object_class_get_name(oc);
     info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3f5a7d2bd..7b8257b496 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9409,17 +9409,15 @@ static void arm_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     CPUClass *cc = CPU_CLASS(oc);
-    const char *typename;
-    char *name;
+    const char *typename = object_class_get_name(oc);
+    char *model = cpu_model_from_type(typename);
 
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
     if (cc->deprecation_note) {
-        qemu_printf("  %s (deprecated)\n", name);
+        qemu_printf("  %s (deprecated)\n", model);
     } else {
-        qemu_printf("  %s\n", name);
+        qemu_printf("  %s\n", model);
     }
-    g_free(name);
+    g_free(model);
 }
 
 void arm_cpu_list(void)
-- 
2.41.0


