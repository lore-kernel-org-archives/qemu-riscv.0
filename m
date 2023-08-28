Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846EAC83F13
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 08:50:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaXwR-0002eG-DD; Mon, 28 Aug 2023 04:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXwO-0002Kj-Jp; Mon, 28 Aug 2023 04:49:44 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXwL-0000WG-UL; Mon, 28 Aug 2023 04:49:44 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0VqiPhtQ_1693212575; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VqiPhtQ_1693212575) by smtp.aliyun-inc.com;
 Mon, 28 Aug 2023 16:49:36 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 6/6] linux-user: Move qemu_cpu_opts to cpu.c
Date: Mon, 28 Aug 2023 16:45:36 +0800
Message-Id: <20230828084536.231-7-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
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

Make qemu_cpu_opts also works for linux user mode. Notice, currently
qdev monitor is not included in linux user mode. We just output
current enabled extentions for RISC-V(without the hint to print all
properties with -device).

With this patch,
"""
qemu-riscv64 -cpu rv64,help
Enabled extensions:
	rv64_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zba_zbb_zbc_zbs_sstc_svadu
"""

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 cpu.c                     | 24 ++++++++++++++++++++++++
 include/exec/cpu-common.h |  2 ++
 linux-user/main.c         | 10 ++++++++++
 softmmu/vl.c              | 24 ------------------------
 target/riscv/cpu.c        |  8 +++++---
 5 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/cpu.c b/cpu.c
index 712bd02684..590d75def0 100644
--- a/cpu.c
+++ b/cpu.c
@@ -47,6 +47,30 @@
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
 
+QemuOptsList qemu_cpu_opts = {
+    .name = "cpu",
+    .implied_opt_name = "cpu_model",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_cpu_opts.head),
+    .desc = {
+        { /* end of list */ }
+    },
+};
+
+int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp)
+{
+    const char *cpu_model, *cpu_type;
+    cpu_model = qemu_opt_get(opts, "cpu_model");
+    if (!cpu_model) {
+        return 1;
+    }
+    if (!qemu_opt_has_help_opt(opts)) {
+        return 0;
+    }
+    cpu_type = cpu_type_by_name(cpu_model);
+    list_cpu_props((CPUState *)object_new(cpu_type));
+    return 1;
+}
+
 #ifndef CONFIG_USER_ONLY
 static int cpu_common_post_load(void *opaque, int version_id)
 {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index b3160d9218..4d385436a5 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -168,4 +168,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 void list_cpus(void);
 void list_cpu_props(CPUState *);
 
+int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp);
+extern QemuOptsList qemu_cpu_opts;
 #endif /* CPU_COMMON_H */
diff --git a/linux-user/main.c b/linux-user/main.c
index 96be354897..c3ef84b1a7 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -362,6 +362,15 @@ static void handle_arg_cpu(const char *arg)
         list_cpus();
         exit(EXIT_FAILURE);
     }
+    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("cpu"),
+                                             arg, true);
+    if (!opts) {
+        exit(1);
+    }
+    if (qemu_opts_foreach(qemu_find_opts("cpu"),
+                          cpu_help_func, NULL, NULL)) {
+        exit(0);
+    }
 }
 
 static void handle_arg_guest_base(const char *arg)
@@ -720,6 +729,7 @@ int main(int argc, char **argv, char **envp)
     cpu_model = NULL;
 
     qemu_add_opts(&qemu_trace_opts);
+    qemu_add_opts(&qemu_cpu_opts);
     qemu_plugin_add_opts();
 
     optind = parse_args(argc, argv);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index bc30f3954d..d6a395454a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -218,15 +218,6 @@ static struct {
     { .driver = "virtio-vga-gl",        .flag = &default_vga       },
 };
 
-static QemuOptsList qemu_cpu_opts = {
-    .name = "cpu",
-    .implied_opt_name = "cpu_model",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_cpu_opts.head),
-    .desc = {
-        { /* end of list */ }
-    },
-};
-
 static QemuOptsList qemu_rtc_opts = {
     .name = "rtc",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_rtc_opts.head),
@@ -1149,21 +1140,6 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
-static int cpu_help_func(void *opaque, QemuOpts *opts, Error **errp)
-{
-    const char *cpu_model, *cpu_type;
-    cpu_model = qemu_opt_get(opts, "cpu_model");
-    if (!cpu_model) {
-        return 1;
-    }
-    if (!qemu_opt_has_help_opt(opts)) {
-        return 0;
-    }
-    cpu_type = cpu_type_by_name(cpu_model);
-    list_cpu_props((CPUState *)object_new(cpu_type));
-    return 1;
-}
-
 static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     return qdev_device_help(opts);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index edcd34e62b..e4318fcc46 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2229,15 +2229,17 @@ void riscv_cpu_list(void)
 void riscv_cpu_list_props(CPUState *cs)
 {
     char *enabled_isa;
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
-    ObjectClass *oc = OBJECT_CLASS(mcc);
 
     enabled_isa = riscv_isa_string(RISCV_CPU(cs));
     qemu_printf("Enabled extensions:\n");
     qemu_printf("\t%s\n", enabled_isa);
+#ifndef CONFIG_USER_ONLY
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    ObjectClass *oc = OBJECT_CLASS(mcc);
     qemu_printf("To get all configuable options for this cpu, use"
                 " -device %s,help\n", object_class_get_name(oc));
+#endif
 }
 
 #define DEFINE_CPU(type_name, initfn)      \
-- 
2.17.1


