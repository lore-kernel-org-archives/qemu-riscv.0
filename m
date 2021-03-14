Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lLMIa-00013H-96
	for mharc-qemu-riscv@gnu.org; Sun, 14 Mar 2021 04:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lLMIW-0000yX-9V; Sun, 14 Mar 2021 04:40:28 -0400
Received: from sender-of-o52.zoho.in ([103.117.158.52]:2358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lLMIS-00046H-Hs; Sun, 14 Mar 2021 04:40:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615711220; cv=none; d=zohomail.in; s=zohoarc; 
 b=UdYeHOXW4JBNvb2Oq1OpXgtlluaL0L2fB7VWWzNHZAgmtnfRCJffUBZNa9SKTv7k1kEzl0WzAADsRl8WHNr1lzvikHNnS/QVT/SdWeyHDI4m6/FFki6wZPE2js4hvV0yD7JOIyVFm11j6mYWeiTUK/IQo/tMkaBvDO3WNIkR2gU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1615711220;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ZEght1ktl0FFWCL3PxeCjHhIJZGUzzjjHCzXLWt4ZlY=; 
 b=Fys7AQh1Igoo8lwB6xojEuMiaNehzdqdQgoDIFw7h0glUOsZ9s9rNy5YPGxc/wWu5+DrhvcDG87kbNYFbaY2HAdS2brpvzzMyafXTMArsmpMQf5NOJBG+9wxPbjPfoqQ4MtTRINgqX7GU8QpuSyjmYQ8spJxm6NHlaSZDlPIqTk=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1615711220; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=ZEght1ktl0FFWCL3PxeCjHhIJZGUzzjjHCzXLWt4ZlY=;
 b=PcHpnvrpyL/nM7pdzY/ZdUKjiEvQcxqEJs5GoN1Nfa817Ud4v+X35m+b8TIorfbS
 Grs4nJgVPmtheGoWP7NQbjO+TssVrXxKcd2KJ+3t48TYvH0XtsSmtAjJ9aiiAbAMbEY
 Ak4xSWh2OsoXM0BuGO9pSmALiPEYcSrvs+WyuNp8=
Received: from helium.Dlink (49.207.215.131 [49.207.215.131]) by mx.zoho.in
 with SMTPS id 1615711218491980.3533116837222;
 Sun, 14 Mar 2021 14:10:18 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Vijai Kumar K <vijai@behindbytes.com>
Message-ID: <20210314083936.76269-4-vijai@behindbytes.com>
Subject: [PATCH 3/3] hw/riscv: Connect Shakti UART to Shakti platform
Date: Sun, 14 Mar 2021 14:09:36 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314083936.76269-1-vijai@behindbytes.com>
References: <20210314083936.76269-1-vijai@behindbytes.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.52;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o52.zoho.in
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
X-List-Received-Date: Sun, 14 Mar 2021 08:40:28 -0000

Connect one shakti uart to the shakti_c machine.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 hw/riscv/shakti_c.c         | 7 +++++++
 include/hw/riscv/shakti_c.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index e96436a3bf..07cc42a380 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -133,6 +133,12 @@ static void shakti_c_soc_state_realize(DeviceState *de=
v, Error **errp)
         shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
         SIFIVE_CLINT_TIMEBASE_FREQ, false);
+    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
+    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
+                    shakti_c_memmap[SHAKTI_C_UART].base);
     /* ROM */
     memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
                            shakti_c_memmap[SHAKTI_C_ROM].size, &error_fata=
l);
@@ -151,6 +157,7 @@ static void shakti_c_soc_instance_init(Object *obj)
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



