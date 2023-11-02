Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BD3C4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:33:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLa9-0004bF-FR; Wed, 01 Nov 2023 20:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZl-0003xb-Mt
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:28:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLZj-0000vS-Gp
 for qemu-riscv@nongnu.org; Wed, 01 Nov 2023 20:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698884920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWuM8KoXEbBiZd6goD7A83eMe3YIM2InEy9tKhZ47iA=;
 b=d3ZlcGI8qcKowlrfmjzv7GrDFXIieFjvEnfInuVKj7iPi27uenXxGcjLx72uC91PHy9hEB
 pRZY8lWaHxHymeJxp7fDtymvBidBlsYYoUFiAzeShONV/uMyNSX8cQcMuAv/+JQAr1V2NA
 yMzT+/836ZgjaaR62O4Ha0Htv/HVUO8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-dsoQOapfPiSZUEN68-Lntw-1; Wed,
 01 Nov 2023 20:28:35 -0400
X-MC-Unique: dsoQOapfPiSZUEN68-Lntw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 010B21C05AA4;
 Thu,  2 Nov 2023 00:28:31 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C39BFC1290F;
 Thu,  2 Nov 2023 00:28:16 +0000 (UTC)
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
Subject: [PATCH v4 11/33] target/loongarch: Use generic helper to show CPU
 model names
Date: Thu,  2 Nov 2023 10:24:38 +1000
Message-ID: <20231102002500.1750692-12-gshan@redhat.com>
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

For target/loongarch, the registered CPU type name is always the
combination of the CPU model name and suffix. Use cpu_model_from_type()
to show the CPU model names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/loongarch/cpu.c                | 5 ++++-
 target/loongarch/loongarch-qmp-cmds.c | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index c6712e13f9..8c6b6f47ed 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -477,14 +477,17 @@ static void loongarch_la132_initfn(Object *obj)
 static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
 {
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("%s\n", typename);
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void loongarch_cpu_list(void)
 {
     GSList *list;
     list = object_class_get_list_sorted(TYPE_LOONGARCH_CPU, false);
+    qemu_printf("Available CPUs:\n");
     g_slist_foreach(list, loongarch_cpu_list_entry, NULL);
     g_slist_free(list);
 }
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
index 6c25957881..815ceaf0ea 100644
--- a/target/loongarch/loongarch-qmp-cmds.c
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -17,8 +17,7 @@ static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
     CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
     const char *typename = object_class_get_name(oc);
 
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->name = cpu_model_from_type(typename);
     info->q_typename = g_strdup(typename);
 
     QAPI_LIST_PREPEND(*cpu_list, info);
-- 
2.41.0


