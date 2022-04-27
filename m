Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrIf-000511-NP
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIc-0004yQ-1w
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:22 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIa-0004Xq-0c
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102940; x=1682638940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TRafi5SdzHuV4X0PCy+jdQib6Lt3hEKxPFu/WBMaC5c=;
 b=mAZKVB7EG4mvxdM5y3gWnAwQYSn4jQf9iZZwXcqe+bd63+jrGyuaEpdg
 rgYrM4XKAPCCeCaUU7b4FdjPbXlw93b6l/ZQJ8tDOSXMVMPlpFsr/4MaN
 Fz3Y702ev5RaVnPPS12WvBf93QCP+4f/hwsqKOqzN8TAKriPjI/n6H/sh
 RZM9iNnYHRRGoWR4p885fK7lLZR54grvYnfijP6KCWTSdpREurmHTST15
 xuUCHWJ3oBqlwqT2vzVph419+FGBWzVjLnN+dUtpMuQ1SVzbPKXvLwOo2
 T9Ynk0BOucno2XktX2HX5EJmVZdFc2OwnozhjQfKdG8iKcPSxcFYoQGPF w==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844552"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:17 +0800
IronPort-SDR: yyw9BspzFicnp4ym3re64ZuNHq/7/MyFHcDc8Paprdp3EZwzoBOn5ZseLU1zTJayymgaPY+O/k
 bTAgBy/K66Y+nMvMaxcYLZs+Q6954TGJ/O7dDjyqYekwmkRKhnfjjApnOx4+x/fuVuo3wMAbcE
 Wnl11yGdxbKvoTLR7ckH8XptDjgbw2juuKxFBQAQyWRC45ubG67NLg/87r/DpOuZRm3BQmQUFT
 6NViWkEbMteTRp79RgREkCBJ6y0q0eW7qveBjmV9UEtbau4D/bGEZl90jO6paUjJuAqykk0ViY
 e40CktT2FgxfQgDrH6B4E6F7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:27 -0700
IronPort-SDR: 9bdwlwipW5MV5xN+Ipla0e8SZexywkvuH47oNdRSQjEsJAgX568Pm11P0V1zZky7wOMrc06er4
 b0f2ZDtsxRuEvxtf7lgdfvGL46K+vsH8hgXdqW1CneyDTEfea1fW6pUqumDsWHjXsb1JLBET2p
 QdjmJ4w81atRIJvR+4E171Jn2iU8lPX+jMsSXOGKeZMEOo7Yd2br8ge5XiNrya+A+DL3RIcZP0
 hI+Ia/5EGgdIFGjYSpezR2d+jnr2f+IZ5GjMUvnhiCBCESu7ZOPPs5tcCTef29vo59HbGWZOu1
 9jc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzY1Lbpz1SVp1
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 16:42:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102936; x=1653694937; bh=TRafi5SdzHuV4X0PCy
 +jdQib6Lt3hEKxPFu/WBMaC5c=; b=EEgllN2nTrDwxEODlSH5eLnAF4eUKpbLMQ
 0kToOKCQQRXAhdY1Xd/g1XVg+TqaU4+MERWzQXaR0GsvHYnfF83DUH/bLh3KvcJi
 sIOCwoGh7swo4heV42CleWdiKXZj6B7axNqSruAsNNCAoWzO6Dqn9Dela6i1zO0u
 e2qJaJAEcbbPDviCb88S4hb3Zd4fdEfhKOEwpret9/LAVhAoKzs7PHOfbRXGQJ3H
 WqRkmr22wYa48Zy0cX32acetWfwHSl8sk6tc+IfptKh1gzX1DwLZ4f4IN17aDW4W
 BWei8frQbAtiMEZ+jBHyEVdQxijwdA4mHecV45g1yl10en2IVmOg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id H6IFvfZ_Bi9q for <qemu-riscv@nongnu.org>;
 Wed, 27 Apr 2022 16:42:16 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzS2MYsz1Rwrw;
 Wed, 27 Apr 2022 16:42:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 5/6] hw/riscv: virt: Add device plug support
Date: Thu, 28 Apr 2022 09:41:45 +1000
Message-Id: <20220427234146.1130752-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Apr 2022 23:42:22 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Add support for plugging in devices, this was tested with the TPM
device.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a2ffd04a78..da098917dd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1569,10 +1569,37 @@ static void virt_set_aclint(Object *obj, bool val=
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
@@ -1584,6 +1611,10 @@ static void virt_machine_class_init(ObjectClass *o=
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
@@ -1614,6 +1645,10 @@ static const TypeInfo virt_machine_typeinfo =3D {
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


