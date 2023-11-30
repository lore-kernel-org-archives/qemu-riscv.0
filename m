Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998C6C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 14:39:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8iAC-0006XJ-Dr; Thu, 30 Nov 2023 09:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8iA8-0006Aa-3K; Thu, 30 Nov 2023 09:37:08 -0500
Received: from mgamail.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1r8iA6-0002CQ-3H; Thu, 30 Nov 2023 09:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701355026; x=1732891026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1TBuBuayUq5ep3LedB2XG6MRM6nllhfykxLgfM/A+kw=;
 b=myqWtp1P9nIxX3zGWkd+pg+VMXUsWniH8dQHsxW3R+KbkCEABxG17x8c
 ONKvlYZuYK5ox8SUFymjCAw00e/2uGgACySYv8IIggSRUloxftjDec4Ab
 c13nCqcDVwEce5HAdPunFvQaGAym4zsz/zGvsTs/Vx7JIekY5HDndp5KT
 DehAIe5ltwf+oi7OWyhQQNHcLDr/Sbkxe0GPRoYDcsnceuuHT/qci34hG
 QTXJqWQgYr2WnjLAxgjy6R3m63RnwXwzlM2T/cQ5Tk/iT1Bdim/V3f2vH
 uIsEq3C29nWVxklROcJCr+lF+KqcjbkNtctvz7gE73VaK77TvgaW6eIuL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532878"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="479532878"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730622"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="942730622"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:36:52 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 41/41] hw/i386: Cleanup non-QOM topology support
Date: Thu, 30 Nov 2023 22:42:03 +0800
Message-Id: <20231130144203.2307629-42-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

After i386 supports QOM topology, drop original topology logic.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 52 +++++++++++----------------------------------------
 1 file changed, 11 insertions(+), 41 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 99f6c502de43..cba8b806cdb6 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -118,7 +118,8 @@ out:
 
 void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 {
-    int i;
+    CPUCore *core;
+    int i, cpu_index = 0, core_idx = 0;
     const CPUArchIdList *possible_cpus;
     MachineState *ms = MACHINE(x86ms);
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
@@ -153,34 +154,17 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
 
     possible_cpus = mc->possible_cpu_arch_ids(ms);
 
-    /*
-     * possible_cpus_qom_granu means the QOM topology support.
-     *
-     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
-     * i386 completes QOM topology support.
-     */
-    if (mc->smp_props.possible_cpus_qom_granu) {
-        CPUCore *core;
-        int cpu_index = 0;
-        int core_idx = 0;
-
-        MACHINE_CORE_FOREACH(ms, core) {
-            for (i = 0; i < core->plugged_threads; i++) {
-                x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
-                            OBJECT(core), cpu_index, &error_fatal);
-                cpu_index++;
-            }
-
-            if (core->plugged_threads < core->nr_threads) {
-                cpu_index += core->nr_threads - core->plugged_threads;
-            }
-            core_idx++;
+    MACHINE_CORE_FOREACH(ms, core) {
+        for (i = 0; i < core->plugged_threads; i++) {
+            x86_cpu_new(x86ms, possible_cpus->cpus[cpu_index].arch_id,
+                        OBJECT(core), cpu_index, &error_fatal);
+            cpu_index++;
         }
-    } else {
-        for (i = 0; i < ms->smp.cpus; i++) {
-            x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
-                        NULL, i, &error_fatal);
+
+        if (core->plugged_threads < core->nr_threads) {
+            cpu_index += core->nr_threads - core->plugged_threads;
         }
+        core_idx++;
     }
 }
 
@@ -460,20 +444,6 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
-    /*
-     * possible_cpus_qom_granu means the QOM topology support.
-     *
-     * TODO: Drop the "!mc->smp_props.possible_cpus_qom_granu" case when
-     * i386 completes QOM topology support.
-     */
-    if (!mc->smp_props.possible_cpus_qom_granu) {
-        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
-        x86_cpu_assign_topo_id(cpu, &topo_ids, errp);
-        if (*errp) {
-            return;
-        }
-    }
-
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VPINDEX) &&
         kvm_enabled() && !kvm_hv_vpindex_settable()) {
         error_setg(errp, "kernel doesn't allow setting HyperV VP_INDEX");
-- 
2.34.1


