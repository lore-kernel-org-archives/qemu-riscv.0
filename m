Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKFT-0007bc-Nf
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFR-0007Xa-IE
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38432
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFQ-0008Bw-8N
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCf98bap8NX9iIcnvvB/aw+3vfPbNUjO6+kAZbeXlU0=;
 b=EPGSEvmzGyflkyLSSC0wRZFTlJxkv8HzVn4ze9dYa0ARQeZvpgumnmffzV5aprDGPGMRFL
 IplkPkMb/T4RZZ15isV5s5pH65/umIzcIVLc2jZNALz84pwAOO/PIaczhtB4xLCoXBJZwB
 KChRD3hPaYVAt6frKJUnt3O+mpY0mHI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-thTLJm1xPk26hsKJ6aFqRA-1; Mon, 08 Jun 2020 12:03:31 -0400
X-MC-Unique: thTLJm1xPk26hsKJ6aFqRA-1
Received: by mail-wr1-f69.google.com with SMTP id o1so7300691wrm.17
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCf98bap8NX9iIcnvvB/aw+3vfPbNUjO6+kAZbeXlU0=;
 b=YFIje/R/JwMQNCxB9nYbXSlTuSEpb65iHhR8+YOWMCGuBEoe8w8b25+fWWLPS0P599
 LzVFQ5GPLTZQrERFasI3Jlb++mMaOjCoImoMMzMIn/FzLSQFzqN8AAGnfOyjVqh1kADO
 bq0jjLMlFEdQSjZ5QJM5InOqLF3S23L2tlu9JzeC/ehqDg+mswFnQDmqnI+a9EciCons
 z+axLznV8/dUykYOTkK7XCZAe+swxogiDaM290+JnfBFD0cE9ySrEuRvoBaT0Btkt6t1
 lJkyDcg/4PXmd+u2s1PKjhLoNc401aE7uw4A7iMwquuKmSk6coDOG28u7v7UikCITe7a
 7G8A==
X-Gm-Message-State: AOAM533sO0bq0WcX5QyUO63DUiNLVwVyuWg+6pHrOlkS1opvM0f86mib
 50LLhUGqf0fNuWCCPHlY3AephaB/JTDV6bOmxV/TUP1yyEVUgO8rhYKnbESKD18x8hp77WilIAN
 XNTUhGPZB8qy8ub8=
X-Received: by 2002:adf:a41a:: with SMTP id d26mr25031322wra.324.1591632210358; 
 Mon, 08 Jun 2020 09:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnZLr9C0tJY5bkNMLswKxTqLiEkka8PUdpib6I0kPKfuiid5c8nSc5Z6uKzVsdfUes5d8k3w==
X-Received: by 2002:adf:a41a:: with SMTP id d26mr25031279wra.324.1591632210107; 
 Mon, 08 Jun 2020 09:03:30 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id n204sm42276wma.5.2020.06.08.09.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 28/35] hw/ppc/ppc4xx: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:37 +0200
Message-Id: <20200608160044.15531-29-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:05:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:03:42 -0000

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/ppc405_boards.c |  5 +++++
 hw/ppc/ppc405_uc.c     | 21 +++++++++++++++++++++
 hw/ppc/ppc4xx_devs.c   |  7 +++++++
 3 files changed, 33 insertions(+)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 6198ec1035..eb1216b5f0 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -41,6 +41,7 @@
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "qemu/cutils.h"
+#include "hw/qdev-deprecated.h"
 
 #define BIOS_FILENAME "ppc405_rom.bin"
 #define BIOS_SIZE (2 * MiB)
@@ -129,6 +130,8 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
     ref405ep_fpga_t *fpga;
     MemoryRegion *fpga_memory = g_new(MemoryRegion, 1);
 
+    qdev_warn_deprecated_function_used();
+
     fpga = g_malloc0(sizeof(ref405ep_fpga_t));
     memory_region_init_io(fpga_memory, NULL, &ref405ep_fpga_ops, fpga,
                           "fpga", 0x00000100);
@@ -408,6 +411,8 @@ static void taihu_cpld_init(MemoryRegion *sysmem, uint32_t base)
     taihu_cpld_t *cpld;
     MemoryRegion *cpld_memory = g_new(MemoryRegion, 1);
 
+    qdev_warn_deprecated_function_used();
+
     cpld = g_malloc0(sizeof(taihu_cpld_t));
     memory_region_init_io(cpld_memory, NULL, &taihu_cpld_ops, cpld, "cpld", 0x100);
     memory_region_add_subregion(sysmem, base, cpld_memory);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 381720aced..160604c62e 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -36,6 +36,7 @@
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_OPBA
 //#define DEBUG_SDRAM
@@ -182,6 +183,8 @@ void ppc4xx_plb_init(CPUPPCState *env)
 {
     ppc4xx_plb_t *plb;
 
+    qdev_warn_deprecated_function_used();
+
     plb = g_malloc0(sizeof(ppc4xx_plb_t));
     ppc_dcr_register(env, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
@@ -267,6 +270,8 @@ static void ppc4xx_pob_init(CPUPPCState *env)
 {
     ppc4xx_pob_t *pob;
 
+    qdev_warn_deprecated_function_used();
+
     pob = g_malloc0(sizeof(ppc4xx_pob_t));
     ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
     ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
@@ -351,6 +356,8 @@ static void ppc4xx_opba_init(hwaddr base)
 {
     ppc4xx_opba_t *opba;
 
+    qdev_warn_deprecated_function_used();
+
     opba = g_malloc0(sizeof(ppc4xx_opba_t));
 #ifdef DEBUG_OPBA
     printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
@@ -549,6 +556,8 @@ void ppc405_ebc_init(CPUPPCState *env)
 {
     ppc4xx_ebc_t *ebc;
 
+    qdev_warn_deprecated_function_used();
+
     ebc = g_malloc0(sizeof(ppc4xx_ebc_t));
     qemu_register_reset(&ebc_reset, ebc);
     ppc_dcr_register(env, EBC0_CFGADDR,
@@ -632,6 +641,8 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
 {
     ppc405_dma_t *dma;
 
+    qdev_warn_deprecated_function_used();
+
     dma = g_malloc0(sizeof(ppc405_dma_t));
     memcpy(dma->irqs, irqs, 4 * sizeof(qemu_irq));
     qemu_register_reset(&ppc405_dma_reset, dma);
@@ -735,6 +746,8 @@ static void ppc405_gpio_init(hwaddr base)
 {
     ppc405_gpio_t *gpio;
 
+    qdev_warn_deprecated_function_used();
+
     gpio = g_malloc0(sizeof(ppc405_gpio_t));
 #ifdef DEBUG_GPIO
     printf("%s: offset " TARGET_FMT_plx "\n", __func__, base);
@@ -897,6 +910,8 @@ static void ppc405_ocm_init(CPUPPCState *env)
 {
     ppc405_ocm_t *ocm;
 
+    qdev_warn_deprecated_function_used();
+
     ocm = g_malloc0(sizeof(ppc405_ocm_t));
     /* XXX: Size is 4096 or 0x04000000 */
     memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * KiB,
@@ -1142,6 +1157,8 @@ static void ppc4xx_gpt_init(hwaddr base, qemu_irq irqs[5])
     ppc4xx_gpt_t *gpt;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     gpt = g_malloc0(sizeof(ppc4xx_gpt_t));
     for (i = 0; i < 5; i++) {
         gpt->irqs[i] = irqs[i];
@@ -1410,6 +1427,8 @@ static void ppc405cr_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[7],
 {
     ppc405cr_cpc_t *cpc;
 
+    qdev_warn_deprecated_function_used();
+
     cpc = g_malloc0(sizeof(ppc405cr_cpc_t));
     memcpy(cpc->clk_setup, clk_setup,
            PPC405CR_CLK_NB * sizeof(clk_setup_t));
@@ -1755,6 +1774,8 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
 {
     ppc405ep_cpc_t *cpc;
 
+    qdev_warn_deprecated_function_used();
+
     cpc = g_malloc0(sizeof(ppc405ep_cpc_t));
     memcpy(cpc->clk_setup, clk_setup,
            PPC405EP_CLK_NB * sizeof(clk_setup_t));
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f1651e04d9..b09d7ab5c6 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -33,6 +33,7 @@
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-deprecated.h"
 
 /*#define DEBUG_UIC*/
 
@@ -303,6 +304,8 @@ qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
     ppcuic_t *uic;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     uic = g_malloc0(sizeof(ppcuic_t));
     uic->dcr_base = dcr_base;
     uic->irqs = irqs;
@@ -647,6 +650,8 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
 {
     ppc4xx_sdram_t *sdram;
 
+    qdev_warn_deprecated_function_used();
+
     sdram = g_malloc0(sizeof(ppc4xx_sdram_t));
     sdram->irq = irq;
     sdram->nbanks = nbanks;
@@ -908,6 +913,8 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
     ppc4xx_mal_t *mal;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     assert(txcnum <= 32 && rxcnum <= 32);
     mal = g_malloc0(sizeof(*mal));
     mal->txcnum = txcnum;
-- 
2.21.3


