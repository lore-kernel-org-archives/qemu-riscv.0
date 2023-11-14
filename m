Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82BBC3DA79
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:03:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33Lz-0007M5-8B; Tue, 14 Nov 2023 19:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Ls-0007Gi-BE
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33Lb-0008D3-NT
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVpSfOoz03h777B/rb6Tl132+Io9+3dWRLTS26mmxwY=;
 b=BZO18xtf4Po+tDD7ZJfb9+JN79F1rcPml8lJ8Aj2JlBfSM6lz3Ac/WnEkGZRNpxx+5Kebf
 JDG5JNAB56kYVgsydqDf3IGXTXox3hCuqrm3gKq4IyBNoSV82eo+YrUMgbNN7NRCPtJNoL
 jTnNfGL3oNkicQgAezovFANGe8T/fxI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-kDujcUSEPguZ7CIxUmsmhQ-1; Tue,
 14 Nov 2023 19:01:31 -0500
X-MC-Unique: kDujcUSEPguZ7CIxUmsmhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 722323800083;
 Wed, 15 Nov 2023 00:01:29 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DA01C15887;
 Wed, 15 Nov 2023 00:01:16 +0000 (UTC)
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
Subject: [PATCH v5 20/31] target/tricore: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:17 +1000
Message-ID: <20231114235628.534334-21-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

No changes in the output from the following command.

[gshan@gshan q]$ ./build/qemu-system-tricore -cpu ?
Available CPUs:
  tc1796
  tc1797
  tc27x
  tc37x

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/tricore/cpu.h    |  4 ----
 target/tricore/helper.c | 22 ----------------------
 2 files changed, 26 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index de3ab53a83..2d4446cea5 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -246,10 +246,6 @@ void fpu_set_state(CPUTriCoreState *env);
 
 #define MMU_USER_IDX 2
 
-void tricore_cpu_list(void);
-
-#define cpu_list tricore_cpu_list
-
 static inline int cpu_mmu_index(CPUTriCoreState *env, bool ifetch)
 {
     return 0;
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 7e5da3cb23..174f666e1e 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -96,28 +96,6 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 }
 
-static void tricore_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_TRICORE_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void tricore_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_TRICORE_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, tricore_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 void fpu_set_state(CPUTriCoreState *env)
 {
     switch (extract32(env->PSW, 24, 2)) {
-- 
2.41.0


