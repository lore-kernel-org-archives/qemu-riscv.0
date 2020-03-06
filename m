Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jAKlW-0000AG-Gc
	for mharc-qemu-riscv@gnu.org; Fri, 06 Mar 2020 16:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=32724e9af=alistair.francis@wdc.com>)
 id 1jAKlU-00006C-9t
 for qemu-riscv@nongnu.org; Fri, 06 Mar 2020 16:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=32724e9af=alistair.francis@wdc.com>)
 id 1jAKlS-0002ej-T6
 for qemu-riscv@nongnu.org; Fri, 06 Mar 2020 16:44:16 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:5222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=32724e9af=alistair.francis@wdc.com>)
 id 1jAKlQ-0002Wr-BD; Fri, 06 Mar 2020 16:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1583531058; x=1615067058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oUDyZha+UP2T6K4Wg1D/+zB6S5n/oFK58M6oTJnOjPI=;
 b=Di/ChBGOByJMOKF/Wc2OAHfUD28xGsLnr0HRtEZ2OK1OJJJs5CC5VIXC
 zWgkc4IX1kdPjEGD7ucd2sV4fpCGkuNvcu5n1L/FFf1vh7neYppCzvIQn
 MXDXkrXzLR46zKN0j68T6OSG2AupjhwzZiQBDXcppr2FhVqFUHMtNbusl
 9W0F5frV6YRAT+CJrqCTvF/0xEAH5zVc2Npcaa6itCmcXYRUx7cioMlJt
 S5OEUtGnG5VrbE2XKqugryUJZ/yH4s+1R0YaU6NbtFwO+sxSXhxG4PY6Y
 t3yb8Vodt9DWYQq2glQ1A+SisqIlLs4KLd2anD6l3paiVxy9BKA/1aGUN w==;
IronPort-SDR: 75X+OYJkTMlSbyAbOkK4fGalRgO55Qe7hts7huQfz2aSyGg/omWN8yBXSeS+0617Eu3mRBTfjb
 kGx0V/kQp+o6ltLBrmr7qE2UZ69Jcwk6eiJQ+2yZitbZGoSaXbTdeBC30UzdtFRjLhFrG8/g4w
 An5wPww1XRRZ4qs2mtgq13Oe6/YYLKkCVYCofxr4uoSBGS/CYfA4WfmlBOdJTn5+1toSgxHy18
 W78/kCYubx/eQRhhkOwHZxm/MGzhg5Csxj17saQ8ZgNObWHl0PP/Cxmfyq5HEG5+vTnAFrJn2b
 tm4=
X-IronPort-AV: E=Sophos;i="5.70,523,1574092800"; d="scan'208";a="233784294"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2020 05:44:16 +0800
IronPort-SDR: eHtLSfL1ruD7D79YqyC+O7apdxR/hcaHf/bpa6vAI2fISuoz1MoZ6zvza2IoXiFSTVZELDILTP
 V/ZxVRNQL66T03tD26ptv/QeBQ+2FuzvlTvx6PZ0TzX4GyLtmVQoM63KdYc7DGb7X8C9o9nyO3
 AEb2TwYU9oVlqZkeIN736XRo6WsMSuUdjQOM7861NOU87NAbC1NBlhoTcLGwxmwBWoXxT/egou
 0Aceo2fJywI1i6loIOV0xqFMd9ib6OzaS24iEyXwkCnc5gPmn4YipX344kEza0l6Os6cWstIWK
 Kp5zl45Zy6qZ+MIVrw1vGMYF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 13:35:57 -0800
IronPort-SDR: Nvy4I/rMYB8hPlDRenNn91bQ0srciovlVXPUOEYD+Lm9DQB6whh8gBc6W6DokYzT2bqS/tV6ds
 HFZOvlUV48h6wmYohRGkdMAhAzTeON0nW+GSlrEGCFhVYd3mdAYv34Y/Jlj1CDrU/hMFbd/gQr
 25Vj/Z5P+tCeda6C/8Si19NCagpMTC7uJwSLeXECEGkwF+0djj8eDu7h7xQXW01sCOr7j74EL+
 19xRg9iIOQJ8d6oxLiCsuPbFYUTog0JuIiumwAf8eoXmwdZHJujZ85edo37pFJhT+FeIVaGAsC
 bF4=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 06 Mar 2020 13:44:12 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v3 3/3] riscv/sifive_u: Add a serial property to the sifive_u
 machine
Date: Fri,  6 Mar 2020 13:36:52 -0800
Message-Id: <6132e0b3554868acd16b45eb8ca365cae68a4712.1583530528.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1583530528.git.alistair.francis@wdc.com>
References: <cover.1583530528.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
X-List-Received-Date: Fri, 06 Mar 2020 21:44:17 -0000

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
index dc572c761a..44cb72f09e 100644
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
@@ -322,6 +323,8 @@ static void sifive_u_machine_init(MachineState *machine)
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             sizeof(s->soc), TYPE_RISCV_U_SOC,
                             &error_abort, NULL);
+    object_property_set_uint(OBJECT(&s->soc), s->serial, "serial",
+                            &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                             &error_abort);
 
@@ -413,6 +416,18 @@ static void sifive_u_machine_set_start_in_flash(Object *obj, bool value, Error *
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
@@ -424,6 +439,11 @@ static void sifive_u_machine_instance_init(Object *obj)
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
2.25.1


