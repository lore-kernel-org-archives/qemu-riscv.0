Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2i3-0005qA-PR
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2i1-0005j7-IJ
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hz-000634-6B
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCmd4O4HkpJQDqHqb3kEpsKWXrKqloX8kyxaEEA97UM=;
 b=LJlmvVsGaPJy8rRVlpzFPRD0z+tTkwleM+41CH1lc5WsPQM6q6kEenlwlRDvuXyJz2n0C2
 FtiGcqiTMewUPcAONvpDbVx2F5UpIGkmEZpGwEMkDNcmc+x/S0rZvEmaYI/c8xc69DcYyM
 2EIPRh2+iBTo797CVStPjXyqEZC5dog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-e_b-rrf6PoCAL8m62aXggA-1; Tue, 31 Aug 2021 08:17:41 -0400
X-MC-Unique: e_b-rrf6PoCAL8m62aXggA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE2BF8799E0;
 Tue, 31 Aug 2021 12:17:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CDD91007611;
 Tue, 31 Aug 2021 12:17:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0733718009CC; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 14/29] tcg_funcs:Add  tcg_exec_{realizefn,
 unrealizefn} to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:30 +0200
Message-Id: <20210831121545.2874233-15-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Aug 2021 12:17:46 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/cpu-all.h   |  2 --
 include/tcg/tcg-module.h |  2 ++
 accel/tcg/cpu-exec.c     | 12 ++++++++++--
 accel/tcg/tcg-module.c   |  6 ++++++
 cpu.c                    |  4 ++--
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 32cfb634c6a0..c2bfd0ea1de1 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -440,8 +440,6 @@ void dump_opcount_info(void);
 #ifdef CONFIG_TCG
 /* accel/tcg/cpu-exec.c */
 int cpu_exec(CPUState *cpu);
-void tcg_exec_realizefn(CPUState *cpu, Error **errp);
-void tcg_exec_unrealizefn(CPUState *cpu);
 #endif /* CONFIG_TCG */
 
 /* Returns: 0 on success, -1 on error */
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 159cbd3e7ce6..5dd4deb9ed57 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -11,6 +11,8 @@ struct TCGModuleOps {
     bool (*tlb_plugin_lookup)(CPUState *cpu, target_ulong addr, int mmu_idx,
                               bool is_store, struct qemu_plugin_hwaddr *data);
 #endif
+    void (*tcg_exec_unrealizefn)(CPUState *cpu);
+    void (*tcg_exec_realizefn)(CPUState *cpu, Error **errp);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e5c0ccd1a2ab..d41d1d2bd24f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -981,7 +981,7 @@ int cpu_exec(CPUState *cpu)
     return ret;
 }
 
-void tcg_exec_realizefn(CPUState *cpu, Error **errp)
+static void tcg_exec_realizefn(CPUState *cpu, Error **errp)
 {
     static bool tcg_target_initialized;
     CPUClass *cc = CPU_GET_CLASS(cpu);
@@ -999,7 +999,7 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
 }
 
 /* undo the initializations in reverse order */
-void tcg_exec_unrealizefn(CPUState *cpu)
+static void tcg_exec_unrealizefn(CPUState *cpu)
 {
 #ifndef CONFIG_USER_ONLY
     tcg_iommu_free_notifier_list(cpu);
@@ -1031,3 +1031,11 @@ void dump_drift_info(void)
 }
 
 #endif /* !CONFIG_USER_ONLY */
+
+static void tcg_module_ops_exec(void)
+{
+    tcg.tcg_exec_realizefn = tcg_exec_realizefn;
+    tcg.tcg_exec_unrealizefn = tcg_exec_unrealizefn;
+}
+
+type_init(tcg_module_ops_exec);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index db3d3e9e9318..36c1df564f31 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -21,6 +21,10 @@ static bool tlb_plugin_lookup_stub(CPUState *cpu, target_ulong addr, int mmu_idx
 }
 #endif
 
+static void tcg_exec_realizefn_stub(CPUState *cpu, Error **errp)
+{
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -28,4 +32,6 @@ struct TCGModuleOps tcg = {
     .tlb_reset_dirty = tlb_reset_dirty_stub,
     .tlb_plugin_lookup = tlb_plugin_lookup_stub,
 #endif
+    .tcg_exec_realizefn = tcg_exec_realizefn_stub,
+    .tcg_exec_unrealizefn = update_cpu_stub,
 };
diff --git a/cpu.c b/cpu.c
index 26277f387baf..d1c9f68a26e7 100644
--- a/cpu.c
+++ b/cpu.c
@@ -140,7 +140,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
-        tcg_exec_realizefn(cpu, errp);
+        tcg.tcg_exec_realizefn(cpu, errp);
     }
 #endif /* CONFIG_TCG */
 
@@ -172,7 +172,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
-        tcg_exec_unrealizefn(cpu);
+        tcg.tcg_exec_unrealizefn(cpu);
     }
 #endif /* CONFIG_TCG */
 
-- 
2.31.1


