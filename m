Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A026C4167D
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33M3-0007NP-CT; Tue, 14 Nov 2023 19:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33LV-00079q-F7
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33LS-0008CS-22
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 19:01:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwHrw3QcDvP6vtNRpEI2GW8H/o8KdTjf8rIuv3BkvEA=;
 b=X2RpIWwQfu3+850RJd1BOgFLmuezQyxPpStTpxfy6XlbXTjsFF5e3oTmmLTqTM24zCwr1M
 /Q3MjoKBgcBFHzpHHRuIS5UpcJsUgHA269tnXGeoXnR2fNLrj8jwPFI+mX7qy63aT87CtS
 GkE1W26KpaDEghYDSCMtV08tnNaUjhE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-jeXBJGvTNh6s3qNRsGQtpA-1; Tue,
 14 Nov 2023 19:01:18 -0500
X-MC-Unique: jeXBJGvTNh6s3qNRsGQtpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1336D280D203;
 Wed, 15 Nov 2023 00:01:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2555C15885;
 Wed, 15 Nov 2023 00:01:02 +0000 (UTC)
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
Subject: [PATCH v5 19/31] target/sh4: Use generic cpu_list()
Date: Wed, 15 Nov 2023 09:56:16 +1000
Message-ID: <20231114235628.534334-20-gshan@redhat.com>
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

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
sh7750r
sh7751r
sh7785

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
Available CPUs:
  sh7750r
  sh7751r
  sh7785

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/sh4/cpu.c | 17 -----------------
 target/sh4/cpu.h |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a8ec98b134..806a0ef875 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -122,23 +122,6 @@ static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
     info->print_insn = print_insn_sh;
 }
 
-static void superh_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(SUPERH_CPU_TYPE_SUFFIX);
-
-    qemu_printf("%.*s\n", len, typename);
-}
-
-void sh4_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_SUPERH_CPU, false);
-    g_slist_foreach(list, superh_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 360eac1fbe..e6fc6b87d4 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -238,7 +238,6 @@ G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                                uintptr_t retaddr);
 
 void sh4_translate_init(void);
-void sh4_cpu_list(void);
 
 #if !defined(CONFIG_USER_ONLY)
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
@@ -272,8 +271,6 @@ void cpu_load_tlb(CPUSH4State * env);
 
 #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
 
-#define cpu_list sh4_cpu_list
-
 /* MMU modes definitions */
 #define MMU_USER_IDX 1
 static inline int cpu_mmu_index (CPUSH4State *env, bool ifetch)
-- 
2.41.0


