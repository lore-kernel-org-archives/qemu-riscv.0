Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIYk-0003sV-EV
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYi-0003nc-Tq
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:39:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYg-0006FF-Kk
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524767; x=1666060767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sGvXZ7gbqwE2Gs2i+V2A5rZ4fDqWSNjQndpH3kVaf/Y=;
 b=Fb+5wh81glkKxwCE3PMAfIdZeUjmV12xMzQjB0X/WUPXW3CI1dhi/OUU
 Q1fSSGmIONqt8F8rdjg8iCsHHTux59UecoldAonT7baRWyUDKz0UL8l2m
 mlAzkePIB6QGEvxdfg6KVEGY20A8OJrNPVX7PkMZvLaIUHKFWiQk2tU9/
 rKeLilexJ60a8EAv5CSxkU9F022StP0AxJUvRJNj4V+arANWy/lYvlI1m
 OgCqlN6nbzR6Ktzp335ZPOP3PV6oTu7PjYbXCqI66Ey8BaiAK8TjILypg
 Vkc2Z1YRwbxRGHfb6bMytNshb+1WE7PqiONWzMhEJVqp6fPfLWd/Awq8F w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="184083886"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:39:24 +0800
IronPort-SDR: wuO93IpdmTcqIlPXMHyayhgsoAkwaA1TvX3iocMbwtO9k3AIbCbRQcGUFW84csgluuznIkH/ea
 DYm16WUdTzpUURoXGZpf3mQ+76mQmDx3T36oU2XUJkABBgyJFIwlu52ssvvAPO3+QGKvnCbvwa
 3AFxkX9LBJR0mvDVptDLgsLdfxCaLZpw3d3V7zQnpbtikqEF5+1QAc6Rx9V+IWJtJeKV/l2g+t
 K6gWDLvv5+vno0CHYIP/SVqRJDXBzbqvN1CNfdOPV854maLunfXtzf0Gf+GWBO/9NIIQg+t5Ly
 ANMj9QapnIUbP7gr2cV0/4Iz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:15:04 -0700
IronPort-SDR: U9Xc8SfpT1aSNmMOpZ6uFukl+0G4ZK0//unY+sn0uIeCNZTO8s9jtdsja8e1XzZrF4yFcBdPFo
 CC/u7XPAOSiVI3siRee499cVjz36xPCxHAYoInq/PimYBx17HbAazl54teXCHQBwmhtbfro8B/
 ZItw135vEhsey7AC9jqWqmJFM5zqgjr7nn8S1pePl/aTugkY3TEYr0+hQKbup+0MQm5w91lzfj
 UH23MDsTUr30dSCXTprlH5y6Oy3pJEUXPZnrxgXrnKDO5qTOWtmKFEiZBKiZy/UFLMvpM+28D3
 uGU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:39:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh0W4g39z1Rvm1
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 19:39:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524763; x=1637116764; bh=sGvXZ7gbqwE2Gs2i+V
 2A5rZ4fDqWSNjQndpH3kVaf/Y=; b=Fg0qphSGptDzHGvSBRXbr4GbWmBpb1MaaY
 Jr9VaeD4Y1nbt74q6+bSxKi2BScfQOg7HwzM8OTnxQ8++apExGs/Yv90EQMYzUb4
 MAriChJZktnZRC5vUMpKnckK2FsbhZ54d4aIIjD/gcePYf4H5HnnZ5/40wzJ3XsG
 cbsN+eiVTRisLRL2Qe1LC5cxkhnp7/N/COGnlXEGSG990sJKzrS1l9qMoJF+lZCn
 r3cpklR3RByKwHxfUC0bxEbQ66ihk/c2MpImaLbO3F4hBMFqeIdpdaIvbqAEe8sY
 ND693+68yyDG5VdOCaAtOAmv18QCECEDcZ3JLMkuMIhLqJIgyNZQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qOXooQXticuV for <qemu-riscv@nongnu.org>;
 Sun, 17 Oct 2021 19:39:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh0Q2v2rz1RvlJ;
 Sun, 17 Oct 2021 19:39:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/9] hw/intc: sifive_plic: Move the properties
Date: Mon, 18 Oct 2021 12:39:11 +1000
Message-Id: <3c125e27c49a4969df82bf8b197535ccd1996939.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Mon, 18 Oct 2021 02:39:29 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 9ba36dc0b3..f0e2799efc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,21 +355,6 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
-static Property sifive_plic_properties[] =3D {
-    DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
-    DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
-    DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
-    DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
-    DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
-    DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
-    DEFINE_PROP_UINT32("enable-stride", SiFivePLICState, enable_stride, =
0),
-    DEFINE_PROP_UINT32("context-base", SiFivePLICState, context_base, 0)=
,
-    DEFINE_PROP_UINT32("context-stride", SiFivePLICState, context_stride=
, 0),
-    DEFINE_PROP_UINT32("aperture-size", SiFivePLICState, aperture_size, =
0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 /*
  * parse PLIC hart/mode address offset config
  *
@@ -496,6 +481,21 @@ static const VMStateDescription vmstate_sifive_plic =
=3D {
         }
 };
=20
+static Property sifive_plic_properties[] =3D {
+    DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
+    DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
+    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
+    DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
+    DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
+    DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
+    DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
+    DEFINE_PROP_UINT32("enable-stride", SiFivePLICState, enable_stride, =
0),
+    DEFINE_PROP_UINT32("context-base", SiFivePLICState, context_base, 0)=
,
+    DEFINE_PROP_UINT32("context-stride", SiFivePLICState, context_stride=
, 0),
+    DEFINE_PROP_UINT32("aperture-size", SiFivePLICState, aperture_size, =
0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void sifive_plic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
--=20
2.31.1


