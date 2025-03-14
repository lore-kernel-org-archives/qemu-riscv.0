Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2128AC282EC
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tszzf-0005rN-SU; Fri, 14 Mar 2025 04:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1tszzb-0005nJ-TU
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 04:02:07 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1tszzY-0001zA-GV
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 04:02:06 -0400
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1tszzQ-00099c-1i; Fri, 14 Mar 2025 09:01:56 +0100
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy06.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1tszzP-000FxL-1G; Fri, 14 Mar 2025 09:01:56 +0100
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id CF650480168;
 Fri, 14 Mar 2025 09:01:55 +0100 (CET)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id u28cn2TMgDLS; Fri, 14 Mar 2025 09:01:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 8DBEE480194;
 Fri, 14 Mar 2025 09:01:55 +0100 (CET)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 2Ype6HO3brbW; Fri, 14 Mar 2025 09:01:55 +0100 (CET)
Received: from zimbra.eb.localhost (unknown [10.10.171.10])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 30F3B480168;
 Fri, 14 Mar 2025 09:01:53 +0100 (CET)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: devel@rtems.org
Cc: qemu-riscv@nongnu.org,
 =Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>
Subject: [PATCH] hw/riscv: Fix test for microchi-icicle-kit
Date: Fri, 14 Mar 2025 09:01:48 +0100
Message-ID: <20250314080148.26258-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27576/Thu Mar 13 09:48:52 2025)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Fix this test failure:

  $ QTEST_QEMU_BINARY=3D./build/qemu-system-riscv64 \
    ./build/tests/qtest/qom-test
  (...)
  # slow test /riscv64/qom/amd-microblaze-v-generic executed in 2.28 \
    secs
  # starting QEMU: exec ./build/qemu-system-riscv64 -qtest
    unix:/tmp/qtest-1361875.sock -qtest-log /dev/null -chardev \
    socket,path=3D/tmp/qtest-1361875.qmp,id=3Dchar0 -mon \
    chardev=3Dchar0,mode=3Dcontrol -display none -audio none -machine \
    microchip-icicle-kit -accel qtest
  **
  ERROR:../hw/riscv/boot.c:164:riscv_load_firmware: assertion failed: \
   (firmware_filename !=3D NULL)
  Bail out! ERROR:../hw/riscv/boot.c:164:riscv_load_firmware: \
    assertion failed: (firmware_filename !=3D NULL)

Use an approach similar to riscv_find_and_load_firmware().

Reported-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/riscv/microchip_pfsoc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 9068eed780..616bb63982 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -609,12 +609,14 @@ static void microchip_icicle_kit_machine_init(Machi=
neState *machine)
     }
=20
     /* Load the firmware if necessary */
+    firmware_end_addr =3D firmware_load_addr;
     if (firmware_name) {
-        const char *filename =3D riscv_find_firmware(firmware_name, NULL=
);
-        firmware_end_addr =3D riscv_load_firmware(filename, &firmware_lo=
ad_addr,
-                                                NULL);
-    } else {
-        firmware_end_addr =3D firmware_load_addr;
+        char *filename =3D riscv_find_firmware(firmware_name, NULL);
+        if (filename) {
+            firmware_end_addr =3D riscv_load_firmware(filename,
+                                                    &firmware_load_addr,=
 NULL);
+            g_free(filename);
+        }
     }
=20
     riscv_boot_info_init(&boot_info, &s->soc.u_cpus);
--=20
2.43.0


