Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzBbc-0005Tl-8d
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 01:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBbZ-0005QA-Nk; Fri, 02 Jul 2021 01:20:46 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBbV-000186-QU; Fri, 02 Jul 2021 01:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625203241; x=1656739241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AOJ/PADTDzw72zRUjnPf2wU1GJiBwuccU7jFDcejIEM=;
 b=STLfSMo2tECirhe//EoLCUujVkpDE9ahpDoKIuMV7lJglrWSQy9fxSNk
 kTfXxD1Bh3YaelrrHkvAY1WXa0iFhKtCE3Un03cJDb1drRaiKeW+m9q9W
 IFAvqvApEeNa46GcDLdmF64ct5Ybk2SJqc9bKAkM/LXrsnMIxkTsH8XuH
 Ia3s8QvK4EbPIy7f/9CW+kd5zxah0xGHz5ntJcmZcpYuDj21EIVvfFMM/
 Hb5hFzb9pBRZlu67WMXeZDnAwss0OXr4PFg3ZTueqMAutKYwuKabBAIri
 np8b8zSbzLQR2ew5v0E7hyL3uGIWOpncAb3HsChIT5SUe+1jSoM5E21uy w==;
IronPort-SDR: +O9+Ri9PM+rwk7+runuqiWFJbrE9k3f/APaqAEUsSLSCoeQxcHEn7tOdd7ZYHACsjh68b3ZeWH
 Mgx6+NmUgVzBjzADOYXATPiKFaCwdM7Vb1AZ4fhbNLckOg2O00iXAC05g2laqXWtCx2AiRfkVv
 j9Hp6GxVs0PppSFVV+fMjq8w6MfGAyE9i38HXNNHxJtP42puw0ARocTmG9uaoCHH+tIaz6v5D9
 e+Z9HN2VeexWagktg8/93IEkQLXBaTuinHGxngn5sp8p94vd2Og6bLQsmDlU2Q1LQJ0JSkBstD
 gBE=
X-IronPort-AV: E=Sophos;i="5.83,316,1616428800"; d="scan'208";a="178330334"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2021 13:20:37 +0800
IronPort-SDR: yAbc0jtdqawQL26L2wl2SGwcm5v2FwSzaOup90gyMYYjOY+NiO7vAgRx4guovzxrNzuaiAJzsz
 EoWtTKaGIuYqrUz/z3tmMC52b7EQTALnAg3X8BHWPEleZ+u0iCs5MFVKGTW6r8EPbO/64M2B7o
 rtWkJd5YatWtrx7f/UNzpLQx+plnp0v5OH0oQHXLGo6tq5HYDUYv6vYNqnpeouR2NgPAUhnysL
 DbbUt4uGXm0YnsbjM65vOMaReI7RCGj9kRcH8IegaO69d/v15R7Zt8cBTVE82ozE/egLr8FND0
 7HdvBgVi+MBhEs8sdNcI3fxo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 21:59:01 -0700
IronPort-SDR: RRNQXL/RmS5sCYMDuG4KymnHipZP2YWOlWwaqzRfieYKwWGcnEyZUr6hxRBIsFIsk7k2XO5Mfa
 Q278tRbLdzBvt4wnx4H6LkFoaPwM5bWM5H0o0LvsJ34Hqjz1zcHm7pcxv+fJRtSD0hzlfhaP/J
 IWQ1U9+CXzrNfe5dLq3cHczyiVRLivalESXym4juoApTYf9BheOxYy3bm22CCejdUTrRemfitT
 9tX8VNILfWUWxoL+Cmpf/s2RBMogirVQWObAgI4w2dx1wspflxY/2UtMxaJvFBlMUPUn9jX8jC
 2Ho=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Jul 2021 22:20:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/3] hw/riscv: opentitan: Add the flash alias
Date: Fri,  2 Jul 2021 15:20:14 +1000
Message-Id: <ee1dfb6bffc5e7f59da0b7de549d5f8b7eccad2e.1625202999.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625202999.git.alistair.francis@wdc.com>
References: <cover.1625202999.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=8103b7a7b=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Jul 2021 05:20:46 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 2 ++
 hw/riscv/opentitan.c         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index a488f5e8ec..9f93bebdac 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -40,6 +40,7 @@ struct LowRISCIbexSoCState {
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
+    MemoryRegion flash_alias;
 };
 
 typedef struct OpenTitanState {
@@ -54,6 +55,7 @@ enum {
     IBEX_DEV_ROM,
     IBEX_DEV_RAM,
     IBEX_DEV_FLASH,
+    IBEX_DEV_FLASH_VIRTUAL,
     IBEX_DEV_UART,
     IBEX_DEV_GPIO,
     IBEX_DEV_SPI,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 933c211b11..36a41c8b5b 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -59,6 +59,7 @@ static const MemMapEntry ibex_memmap[] = {
     [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
     [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
     [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
+    [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000 },
 };
 
 static void opentitan_board_init(MachineState *machine)
@@ -134,8 +135,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Flash memory */
     memory_region_init_rom(&s->flash_mem, OBJECT(dev_soc), "riscv.lowrisc.ibex.flash",
                            memmap[IBEX_DEV_FLASH].size, &error_fatal);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "riscv.lowrisc.ibex.flash_virtual", &s->flash_mem, 0,
+                             memmap[IBEX_DEV_FLASH_VIRTUAL].size);
     memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH].base,
                                 &s->flash_mem);
+    memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH_VIRTUAL].base,
+                                &s->flash_alias);
 
     /* PLIC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
-- 
2.31.1


