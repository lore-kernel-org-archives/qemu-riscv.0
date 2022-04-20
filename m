Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh3HN-0008MB-B1
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 01:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HL-0008HF-2W
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 01:53:27 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HJ-0004VD-BS
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 01:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650434005; x=1681970005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8cubxdE+5rkaf0Cjh3SiUez+sCYKeMPtlbdA9NTcPVM=;
 b=fimRTZCDSXWndBGYAt2YTENCXYcHkG1T2Yv/XDLsc0/Vh1fyUlHGS0tF
 2OnQdkd3xvWL5fSCNgrayA7lBibtkVFxu36fHSwurDXskdVyRvGU7/q/H
 /1NyPdMFRpkn/6k705BAPwqe6FWo8GWnOdaTx/1gCiP2JynbolQIknTvr
 psSvmSSScsbHBdW4LE7dV9XrbJut3mkucc9UiLiB5C79Erd19HqH+kwN7
 5EHsocX35w3k48sg6KaBj0TOuNiG2TTP/429af3ODfm8Xhi6VzapR4NVk
 mUREwySp6PB6hGtXNs1ghK3020cQdifmJPB4DIuQuSJeqvk+GRNPOeZBN w==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="302527771"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:53:22 +0800
IronPort-SDR: yJlfKGF6kbEQlZhhcrOYE8s2NOsFY3rwTZhci9JRlNXMNCPV22fbP3DzWfLFAm9AdI2S7R/E9Q
 TxnzhI7lOCq0nyTj8gtX9shH8tohkIqd5aP76ZhaZs3VFSA4YMOy6SxZKtjLo3RTSFhOG5WmUy
 3r500bU4mrZHj3b455nYjjIAG5bnDr3ZKMiyqmwFIPLPXJmgeTSQbMStzVo3bCWas3PFjR9UsF
 y7yU/zt03/N9qBkYx0p+RUG6CmEV7MV6T/Akyw+7cBwr16wJw6o76gSRDCF4nPfNRrxiUM/5+w
 ARB9pi+w2u5LQJSC5K/jjHCL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:23:41 -0700
IronPort-SDR: zLE2DWSDX7mfvV7I0NLwqh+gX7YSIyPxpQNDAagVxJQwKEg0XLFGLpjSKIZUXS9XAfGmYtpnwP
 vFAr12WbFAj2QP1t7+QgAeK2r2UHzEjlbUCx7LR1QRrkFylwV1dXeSUzE8E4ohqB5IcfkAOxiV
 8F4rICOkyfgCTLZFUXMTA1DOzGtNfP1Q2uhYb5zs9nnqUkbZIlqn8S6qNyYJ1DTQBGbVCXXrrC
 /m7U6og9XAO3REfaDljRAd41CdS8WFTMz9YEM7IjVKh7YFcAPrghbeIvd94yfDCFkSpDEu0xqE
 v/8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:53:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqbQ5Q0Lz1SVp9
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 22:53:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650434002; x=1653026003; bh=8cubxdE+5rkaf0Cjh3
 SiUez+sCYKeMPtlbdA9NTcPVM=; b=aWg+wnkJ/K9gVuumGk3SeA/cAfu3nOlC6P
 yLMQruIDB2Q/ofyEavPr77kljCeYbU6kcfQJwjWL4KO/wkhzkmHuxAb5/5ldvONO
 C1FSXVphRltiVob+oBBN9+/rrcv8zNtjd1XsAdvXJQ/PgPFR+n8qLpzjJI5EuZ3M
 D9S0dSG8VldqDHxrTWttslEipphmUPlzovZtFNLh9lMF94ndZzBbm9xcKicDGJB2
 Vm1/tJhUDCbAq4Jp83LVPZxSuOdBXsqrDfp/NNjoTl2gawwcBOszy3xMRb2TlVFT
 cQF9MfABIods3bPrOH9k31Bc9vYqqAybpLJCuXUafeT5EfDbKX+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PtfX-NzKNEXm for <qemu-riscv@nongnu.org>;
 Tue, 19 Apr 2022 22:53:22 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjqbK4Kntz1Rwrw;
 Tue, 19 Apr 2022 22:53:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 5/6] hw/riscv: virt: Add device plug support
Date: Wed, 20 Apr 2022 15:52:47 +1000
Message-Id: <20220420055248.960491-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 20 Apr 2022 05:53:27 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Add support for plugging in devices, this was tested with the TPM
device.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e4a5c6c28b..6eed1f4d70 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1564,10 +1564,37 @@ static void virt_set_aclint(Object *obj, bool val=
ue, Error **errp)
     s->have_aclint =3D value;
 }
=20
+static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *ma=
chine,
+                                                        DeviceState *dev=
)
+{
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
+static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(hotplug_dev);
+
+    if (s->platform_bus_dev) {
+        MachineClass *mc =3D MACHINE_GET_CLASS(s);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
+            platform_bus_link_device(PLATFORM_BUS_DEVICE(s->platform_bus=
_dev),
+                                     SYS_BUS_DEVICE(dev));
+        }
+    }
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     char str[128];
     MachineClass *mc =3D MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
=20
     mc->desc =3D "RISC-V VirtIO board";
     mc->init =3D virt_machine_init;
@@ -1579,6 +1606,10 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
     mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported =3D true;
     mc->default_ram_id =3D "riscv_virt_board.ram";
+    assert(!mc->get_hotplug_handler);
+    mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
+
+    hc->plug =3D virt_machine_device_plug_cb;
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
=20
@@ -1609,6 +1640,10 @@ static const TypeInfo virt_machine_typeinfo =3D {
     .class_init =3D virt_machine_class_init,
     .instance_init =3D virt_machine_instance_init,
     .instance_size =3D sizeof(RISCVVirtState),
+    .interfaces =3D (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+    },
 };
=20
 static void virt_machine_init_register_types(void)
--=20
2.35.1


