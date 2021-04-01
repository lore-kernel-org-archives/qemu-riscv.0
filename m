Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lS1r7-0003VV-Ns
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 14:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS1qi-0003Mw-Ut; Thu, 01 Apr 2021 14:15:26 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lS1qa-0003aV-4t; Thu, 01 Apr 2021 14:15:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617300902; cv=none; d=zohomail.in; s=zohoarc; 
 b=Kzr34rbnS5bkSIUTtxm3z/f3nmybkF82MEwo/yJLrjREclHmLdOOoz9hKiiUtJVweAbTYCdy+r9+83PsQPMaNsV7rD1gcQXXsvy7tn3a0gmrd9pRJ3bzXQff1yh/E1sHFVqhQ5lQ3l2B81Kox54x+Md2qtfVtFG5nfrbx1Y9iLo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1617300902;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=cxJVZM9ZM6+4B2D9Pg4gna5ePlVlLPvrT90ci3H9teI=; 
 b=DQ8zSLUIcGcIDMXUk9H9+f/3rE2WL1R5eiB2E34T00V1ZIEgN0Lauh8qPT6j9oIR3+dVxPWFv/+8vfhD/UQif2jF+wasbj4ig1vcEzhwFuD8v13eUyfeecvUrJFwCw2jCTNYRY4X0kdh4u0+bohTbQ+9DVWfbOD+vXFYbtqXuUQ=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617300902; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=cxJVZM9ZM6+4B2D9Pg4gna5ePlVlLPvrT90ci3H9teI=;
 b=alOyF1a9o2n5qNLZmi56+XDfPtlnvPR/ZuwJ3fUtkyRqpAbVOCm9jLiplSsep0RS
 /hNsHw9UkvTA06GBF/n/GNU9OtYzVn3N0laXHBA0eEybkDG6rnajrx76TYPUgYTR2n/
 AqtpYk5+i5a44brf9fUNVcyLMBFeYRbpR1D1V/zU=
Received: from localhost.localdomain (49.207.218.164 [49.207.218.164]) by
 mx.zoho.in with SMTPS id 1617300901740308.9275616478026;
 Thu, 1 Apr 2021 23:45:01 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org,
	alistair23@gmail.com
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210401181457.73039-5-vijai@behindbytes.com>
Subject: [PATCH v3 4/4] hw/riscv: Connect Shakti UART to Shakti platform
Date: Thu,  1 Apr 2021 23:44:57 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401181457.73039-1-vijai@behindbytes.com>
References: <20210401181457.73039-1-vijai@behindbytes.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 01 Apr 2021 18:15:31 -0000

Connect one shakti uart to the shakti_c machine.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 hw/riscv/shakti_c.c         | 8 ++++++++
 include/hw/riscv/shakti_c.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index c8205d3f22..e207fa83dd 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -125,6 +125,13 @@ static void shakti_c_soc_state_realize(DeviceState *de=
v, Error **errp)
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
         SIFIVE_CLINT_TIMEBASE_FREQ, false);
=20
+    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
+    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
+                    shakti_c_memmap[SHAKTI_C_UART].base);
+
     /* ROM */
     memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
                            shakti_c_memmap[SHAKTI_C_ROM].size, &error_fata=
l);
@@ -143,6 +150,7 @@ static void shakti_c_soc_instance_init(Object *obj)
     ShaktiCSoCState *sss =3D RISCV_SHAKTI_SOC(obj);
=20
     object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY=
);
+    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART);
=20
     /*
      * CPU type is fixed and we are not supporting passing from commandlin=
e yet.
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index 8ffc2b0213..50a2b79086 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -21,6 +21,7 @@
=20
 #include "hw/riscv/riscv_hart.h"
 #include "hw/boards.h"
+#include "hw/char/shakti_uart.h"
=20
 #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
 #define RISCV_SHAKTI_SOC(obj) \
@@ -33,6 +34,7 @@ typedef struct ShaktiCSoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    ShaktiUartState uart;
     MemoryRegion rom;
=20
 } ShaktiCSoCState;
--=20
2.25.1



