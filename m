Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2jc-0000EC-JK
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2jW-0008RY-J2
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2jR-0006wq-4Z
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUA7IgeB5RYl+qZYzoL+znUhF73/ifVtnM5Z3ysYhdM=;
 b=ADzQdwDY/wI/ZUn0Pybfp2poPw4T3ynBiD8zd8Z5GWC2ayyUlrkehhZusERKKbVmXEgXIo
 1Ak9JheyucjneGa2Npztf/3TIGj0jAQr/fhguuVDtK/f1CZhH/pCi6a1zoqT1nZ+CZHM2E
 O0drsfOShUlY+fMPnzI8wxF5rj0IZns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-7eZEGYkOOtOWjAYionviwA-1; Tue, 31 Aug 2021 08:19:11 -0400
X-MC-Unique: 7eZEGYkOOtOWjAYionviwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 071D918C9F49;
 Tue, 31 Aug 2021 12:19:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B25B104B51C;
 Tue, 31 Aug 2021 12:18:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1937F18009EC; Tue, 31 Aug 2021 14:15:47 +0200 (CEST)
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
Subject: [PATCH 25/29] tcg_i386_funcs: Add x86_register_ferr_irq to
 TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:41 +0200
Message-Id: <20210831121545.2874233-26-kraxel@redhat.com>
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
X-List-Received-Date: Tue, 31 Aug 2021 12:19:21 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h       | 2 +-
 target/i386/cpu.h                   | 1 -
 accel/tcg/tcg-module-i386.c         | 5 +++++
 hw/i386/pc_piix.c                   | 2 +-
 hw/i386/pc_q35.c                    | 2 +-
 target/i386/tcg/sysemu/fpu_helper.c | 9 ++++++++-
 6 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index 576e0a63f01f..7b99b9836a20 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -5,7 +5,7 @@ struct TCGI386ModuleOps {
     void (*update_fp_status)(CPUX86State *env);
     void (*update_mxcsr_status)(CPUX86State *env);
     void (*update_mxcsr_from_sse_status)(CPUX86State *env);
-
+    void (*x86_register_ferr_irq)(qemu_irq irq);
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index deba8eb04d1f..d1819166ae11 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1835,7 +1835,6 @@ int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 int cpu_get_pic_interrupt(CPUX86State *s);
 /* MSDOS compatibility mode FPU exception support */
-void x86_register_ferr_irq(qemu_irq irq);
 void fpu_check_raise_ferr_irq(CPUX86State *s);
 void cpu_set_ignne(void);
 void cpu_clear_ignne(void);
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index 6908fe34cef6..f6d367912c17 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -5,8 +5,13 @@ static void i386_update_cpu_stub(CPUX86State *cpu)
 {
 }
 
+static void x86_register_ferr_irq_stub(qemu_irq irq)
+{
+}
+
 struct TCGI386ModuleOps tcg_i386 = {
     .update_fp_status = i386_update_cpu_stub,
     .update_mxcsr_status = i386_update_cpu_stub,
     .update_mxcsr_from_sse_status = i386_update_cpu_stub,
+    .x86_register_ferr_irq = x86_register_ferr_irq_stub,
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1bc30167acc0..d02edaa7e611 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -224,7 +224,7 @@ static void pc_init1(MachineState *machine,
     }
 
     if (tcg_enabled()) {
-        x86_register_ferr_irq(x86ms->gsi[13]);
+        tcg_i386.x86_register_ferr_irq(x86ms->gsi[13]);
     }
 
     pc_vga_init(isa_bus, pcmc->pci_enabled ? pci_bus : NULL);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index eeb0b185b118..9c2623fe61e0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -266,7 +266,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     if (tcg_enabled()) {
-        x86_register_ferr_irq(x86ms->gsi[13]);
+        tcg_i386.x86_register_ferr_irq(x86ms->gsi[13]);
     }
 
     assert(pcms->vmport != ON_OFF_AUTO__MAX);
diff --git a/target/i386/tcg/sysemu/fpu_helper.c b/target/i386/tcg/sysemu/fpu_helper.c
index 1c3610da3b91..9caf164a7269 100644
--- a/target/i386/tcg/sysemu/fpu_helper.c
+++ b/target/i386/tcg/sysemu/fpu_helper.c
@@ -23,7 +23,7 @@
 
 static qemu_irq ferr_irq;
 
-void x86_register_ferr_irq(qemu_irq irq)
+static void x86_register_ferr_irq(qemu_irq irq)
 {
     ferr_irq = irq;
 }
@@ -55,3 +55,10 @@ void cpu_set_ignne(void)
      */
     qemu_irq_lower(ferr_irq);
 }
+
+static void tcgi386_module_ops_fpu_sys(void)
+{
+    tcg_i386.x86_register_ferr_irq = x86_register_ferr_irq;
+}
+
+type_init(tcgi386_module_ops_fpu_sys);
-- 
2.31.1


