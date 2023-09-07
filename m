Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDE8EE14C3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:37:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe30z-0002Xo-Nx; Wed, 06 Sep 2023 20:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe30y-0002XP-9I
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe30v-0000d8-Uu
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aY0vCT17ghdT+PeDe1lOFWysje3txmaFbEFFL/ifBWg=;
 b=i3pISO8C22Gsj8krwSbyTHp6MKGV0Leb7+P7vjnFJFQMzOgW7rKW7aINQzrodE/1+qjIlS
 SJoLHFq5Ezm9HhefWkCBqS+oFszL/dlfBtGPi7Ro4ud50wxSAgP3sZ0QxYO5/4dMwCdU9s
 V2/ua2heumNaN7/zMCuJqmh57H3NYh0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-tBh-EfmCMfOYP1VbbrVUlw-1; Wed, 06 Sep 2023 20:36:50 -0400
X-MC-Unique: tBh-EfmCMfOYP1VbbrVUlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DE263C0EAA5;
 Thu,  7 Sep 2023 00:36:46 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF97C03295;
 Thu,  7 Sep 2023 00:36:31 +0000 (UTC)
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
Subject: [PATCH v3 01/32] cpu: Add helper cpu_model_from_type()
Date: Thu,  7 Sep 2023 10:35:22 +1000
Message-ID: <20230907003553.1636896-2-gshan@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add helper cpu_model_from_type() to extract the CPU model name from
the CPU type name in two circumstances: (1) The CPU type name is the
combination of the CPU model name and suffix. (2) The CPU type name
is same to the CPU model name.

The helper will be used in the subsequent patches to conver the
CPU type name to the CPU model name.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 cpu.c                 | 16 ++++++++++++++++
 include/hw/core/cpu.h | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/cpu.c b/cpu.c
index 1c948d1161..a19e33ff96 100644
--- a/cpu.c
+++ b/cpu.c
@@ -284,6 +284,22 @@ const char *parse_cpu_option(const char *cpu_option)
     return cpu_type;
 }
 
+char *cpu_model_from_type(const char *typename)
+{
+    const char *suffix = "-" CPU_RESOLVING_TYPE;
+
+    if (!object_class_by_name(typename)) {
+        return NULL;
+    }
+
+    if (strlen(typename) > strlen(suffix) &&
+        !strcmp(typename + strlen(typename) - strlen(suffix), suffix)) {
+        return g_strndup(typename, strlen(typename) - strlen(suffix));
+    }
+
+    return g_strdup(typename);
+}
+
 void list_cpus(void)
 {
     /* XXX: implement xxx_cpu_list for targets that still miss it */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 92a4234439..6e76d95490 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -657,6 +657,18 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
+/**
+ * cpu_model_from_type:
+ * @typename: The CPU type name
+ *
+ * Extract the CPU model name from the CPU type name. The
+ * CPU type name is either the combination of the CPU model
+ * name and suffix, or same to the CPU model name.
+ *
+ * Returns: CPU model name
+ */
+char *cpu_model_from_type(const char *typename);
+
 /**
  * cpu_has_work:
  * @cpu: The vCPU to check.
-- 
2.41.0


