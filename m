Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB41BC61DA7
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:01:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33Ja-00032i-9h; Tue, 14 Nov 2023 18:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JY-0002oJ-5E
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33JT-0007GE-0m
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TBvsx7B0k8hJV8+QCGoTyQ5MyH0KUDha/Z0IxzUuS4=;
 b=dTn+oJQJq7sroQmSzm/yvnDj3c1ityKDvPBcbK7BljX5rg7HHiYypv/78sf6CaV0+2Cbxq
 npFEP6Q/gIRMDk9dPlEC8E3p+cz11jRDQ3s/EC5szV+AVUAfaE/sV5rVtyOvuqy1l+7w9O
 A7Tce+wH/QwNFlf2knceXfQ0ZapLsDk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-lEk7sJlNMvmFlhhYJRQI6Q-1; Tue,
 14 Nov 2023 18:59:18 -0500
X-MC-Unique: lEk7sJlNMvmFlhhYJRQI6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 230A51C18CC5;
 Tue, 14 Nov 2023 23:59:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FDF6C15885;
 Tue, 14 Nov 2023 23:59:03 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 10/31] target/cris: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:07 +1000
Message-ID: <20231114235628.534334-11-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv8
  crisv9
  crisv10
  crisv11
  crisv17
  crisv32

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv10
  crisv11
  crisv17
  crisv32
  crisv8
  crisv9

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/cris/cpu.c | 38 --------------------------------------
 target/cris/cpu.h |  3 ---
 2 files changed, 41 deletions(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a5083a0077..9ba08e8b0c 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -99,44 +99,6 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-/* Sort alphabetically by VR. */
-static gint cris_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    CRISCPUClass *ccc_a = CRIS_CPU_CLASS(a);
-    CRISCPUClass *ccc_b = CRIS_CPU_CLASS(b);
-
-    /*  */
-    if (ccc_a->vr > ccc_b->vr) {
-        return 1;
-    } else if (ccc_a->vr < ccc_b->vr) {
-        return -1;
-    } else {
-        return 0;
-    }
-}
-
-static void cris_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename = object_class_get_name(oc);
-    char *name;
-
-    name = g_strndup(typename, strlen(typename) - strlen(CRIS_CPU_TYPE_SUFFIX));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cris_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_CRIS_CPU, false);
-    list = g_slist_sort(list, cris_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, cris_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 1be7f90319..d830dcac5b 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -287,7 +287,4 @@ static inline void cpu_get_tb_cpu_state(CPUCRISState *env, vaddr *pc,
 				     | X_FLAG | PFIX_FLAG));
 }
 
-#define cpu_list cris_cpu_list
-void cris_cpu_list(void);
-
 #endif
-- 
2.41.0


