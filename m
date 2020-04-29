Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTraD-0008NS-9Z
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 14:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra6-0008AJ-TG
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra4-0003Ro-MJ
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:14 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra4-0003PL-1G; Wed, 29 Apr 2020 14:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588185432; x=1619721432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7VGekjimGFhnrQH5Hz5SIJjCxpJHUdEtoAbd78NbRG8=;
 b=GAM+082ffK3aQuuTeOouB/Glv5hH2CCS1/hC9f8HQ55gO1H13CvVS3hJ
 ZeBYO3TcodZPd8powFfTyA3bWLaRzZ9zmDKCr0+3gsXHiZ1TbBYahst0S
 we9f2mI73GhHXuwzuZLSHKlFLxMcEn4PLCmHyXCkxiw/cS9ny9l7cav9p
 P0AvQzBDY+Iex1unsarFC5+9/KDVJuINy0xi3iEa9vxyN02zMqCDVRXKm
 reV+O1UDkJ90A4lyYEXYRMrIRZ/w0wB8enDuw2/yrIxov0QKbkXgRdP4J
 ZMqt4V4qd6JM/XvCDbMBxRsJ1QtT5LkfgfA3v87fxTgh9NrnE3UPXTm/y A==;
IronPort-SDR: xzr0QQRPZnPhio7n/HT7FZ3IjJwutYxSqnELfX/zUFBhwwWSHLKltR61iznfc/bhh+fy6mdwk1
 E+mS2EmnlYp2+VfqY3pzszgL9JA96zzLwO8fJdv7DJVb0Wyoe1Flk2UZfJW3BjbWwZUsjqrSEB
 RBUUfbyb/oMdE2jtxnIlZRxyx0oOoukWy4a5I25f1QNlzFHB5LD3X+MnmeFEVTUV0tgpeYdYsp
 1mdagGPlIXqVady9U/L9e12kr/VzhmrXh8lTtOhMVJ1N1k+ONygYLClC2zDV7FGKVTlh+ImOXm
 VLQ=
X-IronPort-AV: E=Sophos;i="5.73,332,1583164800"; d="scan'208";a="137935133"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 02:37:05 +0800
IronPort-SDR: a9ynhORNhhTXgl9LKkbsu5JDIfzD+Vt7JpQnY5k6liVQQV5SMK3cuMbpTcg59z7EkGyPa41BCh
 5va+J+QRezdZ2zDJ00fpym3/EvH5mgPMA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 11:27:09 -0700
IronPort-SDR: CcUvOX2SecHENtwkcMGXJ1efoTTs/22a46qxexE1kGCh2W2cR8lifkPlrOSsbe7DMW4HtYiAKm
 x+QeJZdweUXw==
WDCIronportException: Internal
Received: from cnf007834.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.55.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 11:37:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/14] riscv/sifive_u: Add a serial property to the sifive_u
 machine
Date: Wed, 29 Apr 2020 11:28:45 -0700
Message-Id: <20200429182856.2588202-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429182856.2588202-1-alistair.francis@wdc.com>
References: <20200429182856.2588202-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 14:37:03
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.45
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
X-List-Received-Date: Wed, 29 Apr 2020 18:37:17 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present the board serial number is hard-coded to 1, and passed
to OTP model during initialization. Firmware (FSBL, U-Boot) uses
the serial number to generate a unique MAC address for the on-chip
ethernet controller. When multiple QEMU 'sifive_u' instances are
created and connected to the same subnet, they all have the same
MAC address hence it creates a unusable network.

A new "serial" property is introduced to specify the board serial
number. When not given, the default serial number 1 is used.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <1573916930-19068-1-git-send-email-bmeng.cn@gmail.com>
[ Changed by AF:
 - Use the SoC's serial property to pass the info to the SoC
 - Fixup commit title
 - Rebase on file restructuring
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c         | 20 ++++++++++++++++++++
 include/hw/riscv/sifive_u.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9bfd16d2bb..eb0abcae89 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -34,6 +34,7 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
@@ -326,6 +327,8 @@ static void sifive_u_machine_init(MachineState *machine)
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             sizeof(s->soc), TYPE_RISCV_U_SOC,
                             &error_abort, NULL);
+    object_property_set_uint(OBJECT(&s->soc), s->serial, "serial",
+                            &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                             &error_abort);
 
@@ -417,6 +420,18 @@ static void sifive_u_machine_set_start_in_flash(Object *obj, bool value, Error *
     s->start_in_flash = value;
 }
 
+static void sifive_u_machine_get_serial(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
+static void sifive_u_machine_set_serial(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
 static void sifive_u_machine_instance_init(Object *obj)
 {
     SiFiveUState *s = RISCV_U_MACHINE(obj);
@@ -428,6 +443,11 @@ static void sifive_u_machine_instance_init(Object *obj)
                                     "Set on to tell QEMU's ROM to jump to " \
                                     "flash. Otherwise QEMU will jump to DRAM",
                                     NULL);
+
+    s->serial = OTP_SERIAL;
+    object_property_add(obj, "serial", "uint32", sifive_u_machine_get_serial,
+                        sifive_u_machine_set_serial, NULL, &s->serial, NULL);
+    object_property_set_description(obj, "serial", "Board serial number", NULL);
 }
 
 
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index a2baa1de5f..16c297ec5f 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -61,6 +61,7 @@ typedef struct SiFiveUState {
     int fdt_size;
 
     bool start_in_flash;
+    uint32_t serial;
 } SiFiveUState;
 
 enum {
-- 
2.26.2


