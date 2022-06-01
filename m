Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwDIB-0004Gy-LE
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 21:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144e506c5=alistair.francis@opensource.wdc.com>)
 id 1nwDI7-0004Cz-RK
 for qemu-riscv@nongnu.org; Tue, 31 May 2022 21:36:57 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144e506c5=alistair.francis@opensource.wdc.com>)
 id 1nwDI6-0005aC-0t
 for qemu-riscv@nongnu.org; Tue, 31 May 2022 21:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654047413; x=1685583413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OukH25Gcj4nFoBEfbxCTSATKh4p9aSC6BR5bVd73LfQ=;
 b=nNd04JEiMe8L2aHqc4pIq3W9EVje2JO+q1zskFPJnwiVydb0r9JDUH2E
 qc+/S8/MqZ9lVlFvJSeXR1iKHvDpR3U61ny77Hj40loMqVXhCVcgUvJ+6
 ezPxTVDeE0Hp/ZZwObL48yGZM9DAbpAp9UbFdTU1TIcQDo/tSSMDmrzxX
 K2Tz2/YaG0SmdM7cfIi6tRzxXCHjEiLAHAyw4sLob2Mgnv4/4BSg0LoHd
 Ubypp9id5ZmGAQtsFQdkAIe7koBRI1UgP7DLE3vkh5Gohh1tloGI7dO3X
 zf1GQDmZQZDTAo2nHjyjvUi2idBF5W3CthBwsyWzqjJ7NV6WGZ4VpjuoS g==;
X-IronPort-AV: E=Sophos;i="5.91,266,1647273600"; d="scan'208";a="200696996"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jun 2022 09:36:40 +0800
IronPort-SDR: jAJyLKxfmXaq+AHFCKt4ll+lTerkNp0Jr6SF8wKe8tJPU+Vz2myKzAb3m2bIt92yX7WHodWYuP
 y3KsWpB5jbju71aV3Hw/4yRC6SdEVVx4Cx+xnx45ioGROy6YMxcaq/1ADl/uLVLfnc1KQe/E46
 jaMAATUOsIWvWfSCL9OccwvvsZOoOlGjPyEPsE87yd/TKWkTHEPyYLXL0nhGf+rnIyj9pXldRA
 s+QnDi97VUq8GDRUvHo7DcbyT3VZhgwbK0vYhwuVxFjYyd3N4tQ/B4W7fJoqt3/y9M/aS9TT+u
 WuMgsVqgfo6X67+r3ZN++Ia1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 18:00:25 -0700
IronPort-SDR: g4lBB/Mm3ycqzlgyJKmMfzxH9ADpfo4aDDOCB6j2b/utmUYdGoXYxjsEbY7d3NFgoZyaTcZzS8
 rIYqmkfNOnPBkTHbuSZRQSHaWwEMrX+TNRbxHR0FUisxd6xjLQTamocV7Blv9lnPmi7a9Yy/ut
 39R2hvPHLUliUsp1vTSvwTqFqon6LG0oIaN1cXMvXbqYUT89pNVEh9uyz2UYxlG1EaSP392r5x
 RrBpDDzUK1Ogn2ciLtvIQcWYtDZ8zE3fwXNRhdCeTzY12ZT78X2Z8tY/nLETJv7QD0dV6L+rMt
 BEs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 18:36:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LCWvr59Szz1SVp3
 for <qemu-riscv@nongnu.org>; Tue, 31 May 2022 18:36:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1654047400;
 x=1656639401; bh=OukH25Gcj4nFoBEfbxCTSATKh4p9aSC6BR5bVd73LfQ=; b=
 oOIHZDgNr9Mjve3ABMezoipq1YrHqqfN0bstjiQFebwXfbGBV7jLnP6197NRQuWy
 7e1IXNuCTE6d7l8IL0Cea21VgcxJ7bTreY9mu9a1AD26LsbIjkNSQrmiky8vklFv
 qUwpayCZR4X1rkY/WYpa7EAW5ETElso9qwFsupZPKjt+RHZMNeTGXmCgx4NJjhQV
 2qd2/fvWdPnPp/+1kMcbUeM+e808nHtiD08KSOJEe3kN8PTZEU8noeAeGuVJzw10
 iwhHsgS4kDce/y7yQ/SnsWlqbDLf5UJPWJLzelPU609cLKS5yV1fz0eP6LMjR/D5
 EJq8mW+ZQ4W7FtzxISWt1Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Oh-t-Gz-PXFF for <qemu-riscv@nongnu.org>;
 Tue, 31 May 2022 18:36:40 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LCWvl2slwz1Rvlc;
 Tue, 31 May 2022 18:36:34 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: jiangyifei@huawei.com, limingwang@huawei.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: thuth@redhat.com, Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] hw/intc: sifive_plic: Avoid overflowing the addr_config buffer
Date: Wed,  1 Jun 2022 11:36:31 +1000
Message-Id: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=144e506c5=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jun 2022 01:36:57 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Since commit ad40be27 "target/riscv: Support start kernel directly by
KVM" we have been overflowing the addr_config on "M,MS..."
configurations, as reported https://gitlab.com/qemu-project/qemu/-/issues=
/1050.

This commit changes the loop in sifive_plic_create() from iterating over
the number of harts to just iterating over the addr_config. The
addr_config is based on the hart_config, and will contain interrup detail=
s
for all harts. This way we can't iterate past the end of addr_config.

Fixes: ad40be27084536 ("target/riscv: Support start kernel directly by KV=
M")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1050
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index eebbcf33d4..56d60e9ac9 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -431,7 +431,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
-    int i, j =3D 0;
+    int i;
     SiFivePLICState *plic;
=20
     assert(enable_stride =3D=3D (enable_stride & -enable_stride));
@@ -451,18 +451,17 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
=20
     plic =3D SIFIVE_PLIC(dev);
-    for (i =3D 0; i < num_harts; i++) {
-        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
=20
-        if (plic->addr_config[j].mode =3D=3D PLICMode_M) {
-            j++;
-            qdev_connect_gpio_out(dev, num_harts + i,
+    for (i =3D 0; i < plic->num_addrs; i++) {
+        int cpu_num =3D plic->addr_config[i].hartid;
+        CPUState *cpu =3D qemu_get_cpu(hartid_base + cpu_num);
+
+        if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
+            qdev_connect_gpio_out(dev, num_harts + cpu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
         }
-
-        if (plic->addr_config[j].mode =3D=3D PLICMode_S) {
-            j++;
-            qdev_connect_gpio_out(dev, i,
+        if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
+            qdev_connect_gpio_out(dev, cpu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
         }
     }
--=20
2.35.3


