Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1merGa-0007QN-Cw
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 00:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9254359e1=alistair.francis@opensource.wdc.com>)
 id 1merGY-0007QE-Sy
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 00:07:19 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9254359e1=alistair.francis@opensource.wdc.com>)
 id 1merGV-0003zX-RA
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 00:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635134835; x=1666670835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G7htI3MtEAFSj41q9Py1+gLkw7fayjtsx/xaen0p8EY=;
 b=IrY5d0YS2Wq5UZPWmmukDIYf0OyTmjK7Q9WHkRlGCmWXT7kVfSpXkMzg
 BLH5GKwznnhapu+yxUGnW8OD0rnnhcZRMQZa1nhQGpSCdRQiMX6iY/7De
 up6lxDkPRY54Sj4Ey0Pj3JmYHK+vDdFa9Bfb0OrlMRbrijGcFq8d5MuU2
 cgz9EP5I3rX4i/+JFYRrSb63ZMwyan/6TosHlAqRMJRO3KVGOz3StTCSd
 4cAbC9Z9ccyYyrA/bpzTu/xDJjYoE4dN+gyDtTqfW5yEyK08I/obG/n1k
 ZMlz1nWiyAWGIHZiQ2+UdhuzTWTKAQ3vhDg22bac57dKeuPomrRtRxxIr A==;
X-IronPort-AV: E=Sophos;i="5.87,179,1631548800"; d="scan'208";a="182751320"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2021 12:07:11 +0800
IronPort-SDR: LtG7F4zIvwImPFC/+03cZ68xH1l91Z4k/zC3htQGweWbrns4LYtIpToBhB6iXchIWDSOtkIbal
 5nTJ1zqHtB4G1ov2JYyHW+YXBCbf7ubL9dN7u2hSyynVnIqw7yqYoiZmd70wqdB/V5lf4O26bn
 3pyOovHrFppOCNH451p0QFF6Wmm5dP3rH3HxG626q+wZLH2U/BhoV5mE0OoFa7rrapoEUvnp/b
 mmopTJNP2kUOSfejhmWrN1llA5cOZ0CvIEJVJFtCjoMDban41c50H4w7I0YISHtAHKWpNaskpY
 GXZObN2JIWvixyFufNAKdYOE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2021 20:41:09 -0700
IronPort-SDR: kfyp03IGKkSHt/NROeKTSswYRIEPge4Oh40e6U8aFqzNWelTbdKOt6g3p0G9uIPO2BrXVAkEp3
 CeqUyoY8pbVRimCD1WOjYSMGKW/1bcMt9oCXaGPVnTu4R4ZIXU10z2cxOfmJGzXG6NLx9sgGiU
 ekgWkiBKvklwiRJ0VwdckPZh/SgrX6QcISOwgV92jfC1DDoaYhYVu8qJTd36Vatp0isEmXUhLo
 HGRd7Zpfm2U7Komfy4gMxbTmCpRohNV3W20gz1Gl7I2gxJA2viCFq0Vst6WfUOM3+7GwRr7mLu
 zCg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2021 21:07:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Hd1cb1KzGz1RtVt
 for <qemu-riscv@nongnu.org>; Sun, 24 Oct 2021 21:07:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1635134830;
 x=1637726831; bh=G7htI3MtEAFSj41q9Py1+gLkw7fayjtsx/xaen0p8EY=; b=
 E+lzbxc65+r/gXJUC3hu0zFSDXHYeJZ18oycc1x5kLbWoqy3SWJX59a/j7QxcP6z
 zwZWhPE6jXTkABy2UXLRq5dnx3CMZ3a0aymlAZTeQYrAZgE0EI+eJG5NcLmUB0u/
 Po0dNJkcsHmomWue17Cl+mDsmifRw3FZOFcTB+6y6DI9he2stltC88i+omUlPaGP
 moDyOHmmGpiQ8jcxJbOPejHCg4hcByDnBALl+jkzNOmlrk/tZEdmLqeWg9xXIJDN
 GbPr93cnuu54TQndOwE+gBwoSHIHztN0/NrhUucMqMJFu9ZX7o1G83E1dg74Nurw
 MM6waaMryWwUxRzajg1NgA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eYna2pOl0mVA for <qemu-riscv@nongnu.org>;
 Sun, 24 Oct 2021 21:07:10 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hd1cV6z1nz1RtVl;
 Sun, 24 Oct 2021 21:07:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] hw/riscv: opentitan: Fixup the PLIC context addresses
Date: Mon, 25 Oct 2021 14:06:57 +1000
Message-Id: <20211025040657.262696-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9254359e1=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Mon, 25 Oct 2021 04:07:19 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Fixup the PLIC context address to correctly support the threshold and
claim register.

Fixes: ef63100648 ("hw/riscv: opentitan: Update to the latest build")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 83e1511f28..c531450b9f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -161,8 +161,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200004);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 4);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
--=20
2.31.1


