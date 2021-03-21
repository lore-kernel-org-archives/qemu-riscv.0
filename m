Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNqLR-0005bn-Pt
	for mharc-qemu-riscv@gnu.org; Sun, 21 Mar 2021 01:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNqLP-0005bR-1V; Sun, 21 Mar 2021 01:09:44 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNqLL-0007Wx-Jw; Sun, 21 Mar 2021 01:09:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616303370; cv=none; d=zohomail.in; s=zohoarc; 
 b=PRZ2MVjBRMFHmhJgTG1zTCtrJHg7dzPn5yTQPrBqxgbwUuzoSPfsSxKvlsuHVAMiFMo3zbvy/vjwElRTHIRwQ3GPD8Od7mldve6QQxkcsMPgqXtF639jfQLm/ejTiT6YVjPczfyfnLrwILLkEkAZIAJvSueUNp3hi9DwuaYA2Nk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1616303370;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=NeGMkLCyRzOrWrCVfoNa8ejZ4AI+lXIeZ7X1pOaEsdc=; 
 b=T/gMitCOBjdphPuxHf2PUxLiAP3518SHX7NnFqVp92HABw4x+BN6Z6+L5Ui1RYuO95p263DlJYh2yQr30etRDGIoh9csAlCvwqsh51/3PIwjnp47RT7BmABHi5zj5arbPVNVYe+KNKbzqv9cJkkpgpE2Ef2fcw+yUEp3RBr9+JA=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616303370; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=NeGMkLCyRzOrWrCVfoNa8ejZ4AI+lXIeZ7X1pOaEsdc=;
 b=sDSomJq/+prpxV5TAea8BXP+aGkua1HrsQcYft3Gcz52O4Qxx8b/mpw5ENe/jqwe
 qLkUb84c6YfqD8TcpQJNtNZzS9Jbf8PchTy9Lvlad1eqyVfJFOeiFltBILDrMElcFx9
 rmR95Ky1VcOkmnxB3C+CuWk9FnWOmt/VILrrwOUk=
Received: from helium.Dlink (49.207.205.35 [49.207.205.35]) by mx.zoho.in
 with SMTPS id 1616303369263805.7780473785069;
 Sun, 21 Mar 2021 10:39:29 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org,
	alistair23@gmail.com
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210321050917.24621-5-vijai@behindbytes.com>
Subject: [PATCH v2 4/4] hw/riscv: Connect Shakti UART to Shakti platform
Date: Sun, 21 Mar 2021 10:39:17 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210321050917.24621-1-vijai@behindbytes.com>
References: <20210321050917.24621-1-vijai@behindbytes.com>
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
X-List-Received-Date: Sun, 21 Mar 2021 05:09:44 -0000

Connect one shakti uart to the shakti_c machine.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 hw/riscv/shakti_c.c         | 8 ++++++++
 include/hw/riscv/shakti_c.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 45d0eedabd..6174136ffa 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -126,6 +126,13 @@ static void shakti_c_soc_state_realize(DeviceState *de=
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
@@ -144,6 +151,7 @@ static void shakti_c_soc_instance_init(Object *obj)
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
index 6c66a160f5..3abb080d3c 100644
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



