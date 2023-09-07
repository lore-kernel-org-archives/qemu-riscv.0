Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB6EEE14AA
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:38:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe32m-0007Kx-Gk; Wed, 06 Sep 2023 20:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe32h-0007CL-U1
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe32f-000135-NV
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LANb4PqMzRmKrDj2eutGTKPlZDmFwMncEh+nEJ9UjDI=;
 b=UCkFAP3np1KioIyx4x6e2eD049PvuRhynMdq5OoMwMM1HiB5eSkruTgoL6qF4O1VmQhZdh
 uyjab1WhZcqQkHBIKYGJJ393hAHFaChHgosyBvbgBAZCiUqVaDqnpacFib7jTwy56lsOpa
 gWf86vyJarU0/MRoPj+Ulzi82vlzoik=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-mZLWOzSQOeyZHvcz6K7ttg-1; Wed, 06 Sep 2023 20:38:37 -0400
X-MC-Unique: mZLWOzSQOeyZHvcz6K7ttg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E20641C0514F;
 Thu,  7 Sep 2023 00:38:35 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34802C03295;
 Thu,  7 Sep 2023 00:38:20 +0000 (UTC)
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
Subject: [PATCH v3 07/32] target/i386: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:28 +1000
Message-ID: <20230907003553.1636896-8-gshan@redhat.com>
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

For target/i386, the CPU type name is always the combination of the
CPU model name and suffix. The CPU model names have been shown
correctly in x86_cpu_list_entry().

Use generic helper cpu_model_from_type() to get the CPU model name
from the CPU type name in x86_cpu_class_get_model_name(), and rename
@name to @model in x86_cpu_list_entry() since it points to the CPU
model name instead of the CPU type name.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/i386/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 00f913b638..31f1d0379e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1741,8 +1741,7 @@ static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
 {
     const char *class_name = object_class_get_name(OBJECT_CLASS(cc));
     assert(g_str_has_suffix(class_name, X86_CPU_TYPE_SUFFIX));
-    return g_strndup(class_name,
-                     strlen(class_name) - strlen(X86_CPU_TYPE_SUFFIX));
+    return cpu_model_from_type(class_name);
 }
 
 typedef struct X86CPUVersionDefinition {
@@ -5544,7 +5543,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
     X86CPUClass *cc = X86_CPU_CLASS(oc);
-    g_autofree char *name = x86_cpu_class_get_model_name(cc);
+    g_autofree char *model = x86_cpu_class_get_model_name(cc);
     g_autofree char *desc = g_strdup(cc->model_description);
     g_autofree char *alias_of = x86_cpu_class_get_alias_of(cc);
     g_autofree char *model_id = x86_cpu_class_get_model_id(cc);
@@ -5568,7 +5567,7 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s (deprecated)", olddesc);
     }
 
-    qemu_printf("x86 %-20s  %s\n", name, desc);
+    qemu_printf("x86 %-20s  %s\n", model, desc);
 }
 
 /* list available CPU models and flags */
-- 
2.41.0


