Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18177C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 08:47:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaXuR-00072k-M3; Mon, 28 Aug 2023 04:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXuP-00070J-5V; Mon, 28 Aug 2023 04:47:41 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXuL-0000LC-Uo; Mon, 28 Aug 2023 04:47:40 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0VqjBRIp_1693212448; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VqjBRIp_1693212448) by smtp.aliyun-inc.com;
 Mon, 28 Aug 2023 16:47:29 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 2/6] target/riscv: Add API list_cpu_props
Date: Mon, 28 Aug 2023 16:45:32 +0800
Message-Id: <20230828084536.231-3-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

This API used for output current configuration for one specified CPU.
Currently only RISC-V frontend implements this API.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 cpu.c                     |  8 ++++++++
 include/exec/cpu-common.h |  1 +
 target/riscv/cpu.c        | 14 ++++++++++++++
 target/riscv/cpu.h        |  2 ++
 4 files changed, 25 insertions(+)

diff --git a/cpu.c b/cpu.c
index e1a9239d0f..03a313cd72 100644
--- a/cpu.c
+++ b/cpu.c
@@ -299,6 +299,14 @@ void list_cpus(void)
 #endif
 }
 
+void list_cpu_props(CPUState *cs)
+{
+    /* XXX: implement xxx_cpu_list_props for targets that still miss it */
+#if defined(cpu_list_props)
+    cpu_list_props(cs);
+#endif
+}
+
 #if defined(CONFIG_USER_ONLY)
 void tb_invalidate_phys_addr(hwaddr addr)
 {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 87dc9a752c..b3160d9218 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -166,5 +166,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 
 /* vl.c */
 void list_cpus(void);
+void list_cpu_props(CPUState *);
 
 #endif /* CPU_COMMON_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453..c2f102fae1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2226,6 +2226,20 @@ void riscv_cpu_list(void)
     g_slist_free(list);
 }
 
+void riscv_cpu_list_props(CPUState *cs)
+{
+    char *enabled_isa;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    ObjectClass *oc = OBJECT_CLASS(mcc);
+
+    enabled_isa = riscv_isa_string(RISCV_CPU(cs));
+    qemu_printf("Enabled extensions:\n");
+    qemu_printf("\t%s\n", enabled_isa);
+    qemu_printf("To get all configuable options for this cpu, use"
+                " -device %s,help\n", object_class_get_name(oc));
+}
+
 #define DEFINE_CPU(type_name, initfn)      \
     {                                      \
         .name = type_name,                 \
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6ea22e0eea..af1d47605b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -443,9 +443,11 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
+void riscv_cpu_list_props(CPUState *cs);
 void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 
 #define cpu_list riscv_cpu_list
+#define cpu_list_props riscv_cpu_list_props
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
-- 
2.17.1


