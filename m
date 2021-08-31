Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2i8-000670-PW
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2i6-00061V-Tj
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2i3-00066V-MM
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQiK4bWtRrqmM36pafXOjhA9xBq0N4cfLs1R/Rm2l08=;
 b=Ims33BzMeUvmEXd/ERQuJnRFH3sr40v+o1u0t2mNKzbNfoQRcIxBND062xr4NyAj09j9GM
 l6ieTyNcZSyoszGrI52hoXqvbVXHaSk1dabvk/NJcligpzagcWzxd5VOwHfy5eMfi4/2Wm
 x+1g0jeDDPFHtKoqQ52AHlmc/KIOjBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-cOXVx2-rPHmP1KuEi-nyVw-1; Tue, 31 Aug 2021 08:17:45 -0400
X-MC-Unique: cOXVx2-rPHmP1KuEi-nyVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D535718C89DD;
 Tue, 31 Aug 2021 12:17:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36784282DC;
 Tue, 31 Aug 2021 12:17:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E378318009CB; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 13/29] tcg_funcs: Add tlb_plugin_lookup to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:29 +0200
Message-Id: <20210831121545.2874233-14-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
X-List-Received-Date: Tue, 31 Aug 2021 12:17:51 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module.h | 2 ++
 accel/tcg/cputlb.c       | 3 +++
 accel/tcg/tcg-module.c   | 7 +++++++
 plugins/api.c            | 4 ++--
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index a14dcdb002db..159cbd3e7ce6 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -8,6 +8,8 @@ struct TCGModuleOps {
     void (*tlb_flush_page)(CPUState *cpu, target_ulong addr);
 #if defined(CONFIG_SOFTMMU)
     void (*tlb_reset_dirty)(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+    bool (*tlb_plugin_lookup)(CPUState *cpu, target_ulong addr, int mmu_idx,
+                              bool is_store, struct qemu_plugin_hwaddr *data);
 #endif
 };
 extern struct TCGModuleOps tcg;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index fa9c9064848c..6a7872dff488 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2773,6 +2773,9 @@ static void tcg_module_ops_tlb(void)
     tcg.tlb_flush = tlb_flush;
     tcg.tlb_flush_page = tlb_flush_page;
     tcg.tlb_reset_dirty = tlb_reset_dirty;
+#ifdef CONFIG_PLUGIN
+    tcg.tlb_plugin_lookup = tlb_plugin_lookup;
+#endif
 }
 
 type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index febf4e49981c..db3d3e9e9318 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -13,6 +13,12 @@ static void tlb_flush_page_stub(CPUState *cpu, target_ulong addr)
 static void tlb_reset_dirty_stub(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
 {
 }
+
+static bool tlb_plugin_lookup_stub(CPUState *cpu, target_ulong addr, int mmu_idx,
+                                   bool is_store, struct qemu_plugin_hwaddr *data)
+{
+    return false;
+}
 #endif
 
 struct TCGModuleOps tcg = {
@@ -20,5 +26,6 @@ struct TCGModuleOps tcg = {
     .tlb_flush_page = tlb_flush_page_stub,
 #if defined(CONFIG_SOFTMMU)
     .tlb_reset_dirty = tlb_reset_dirty_stub,
+    .tlb_plugin_lookup = tlb_plugin_lookup_stub,
 #endif
 };
diff --git a/plugins/api.c b/plugins/api.c
index 2d521e6ba825..12b4cb914320 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -280,8 +280,8 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
     unsigned int mmu_idx = info >> TRACE_MEM_MMU_SHIFT;
     hwaddr_info.is_store = info & TRACE_MEM_ST;
 
-    if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
-                           info & TRACE_MEM_ST, &hwaddr_info)) {
+    if (!tcg.tlb_plugin_lookup(cpu, vaddr, mmu_idx,
+                               info & TRACE_MEM_ST, &hwaddr_info)) {
         error_report("invalid use of qemu_plugin_get_hwaddr");
         return NULL;
     }
-- 
2.31.1


