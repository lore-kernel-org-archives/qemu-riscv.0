Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTra9-0008GV-Kz
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 14:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra4-000867-Qo
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra2-0003Qc-Ff
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 14:37:12 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTra1-0003Ps-TV; Wed, 29 Apr 2020 14:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588185430; x=1619721430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ASdz2nYicMKK5KNiI4RW9fDQD1WYOAb17Mlu/b4oV8k=;
 b=OZ0R+257ng9vT2m+ckUqjewmMQRVEK3TUCYLIIMt97M8C8i5TK+Zynv9
 eAsXtl00g8YQTtuXYKDY7JEZkI5mmqEf0P4rEM1MIRXvOIbxlBrUnJ17x
 vIIty2iSCH3jlS1c00cSBvADxOV0mu+2B8qhKlHOccRcfkjAkWVMR6Dcr
 oEv8B523t6wah329QRhXRRspMYDqr3LgmzWnButCv5DifHQyetnSJCRQ/
 sP1jl8B0JX6doGXHn9oH9Ptqgtsj/5YW6H35ShLEpRMSihoqhf5C/wGSC
 EtLAEXj+PMQ1TtK/ShpKl7naFkHiqwuccvbqLwsavo8WLDNIuuaQf4U5Z Q==;
IronPort-SDR: S7xnt+2OBRptTe1WLzh2vACGbYkSk7jRQXzfNE0FZDW4DvG6iD3mJ/dcywVGQf8C2Y3JyfHlIX
 h+fIxpn1x29K79shAdJmfLX5C75qsK/PC1CuU5a//4nReEUDu6qJc5wR+fZYzK/YIzdAYm+7cb
 /n1ry/LDdnYSkdJU1QXWGBBrCMH5i8M0GblPzOgrrT+3VQE7auZgCInbyce6VTqlwvS/ccEp9c
 jJ1yE2fvFnZqa+Bxetkk11KVXeV4hU1lBJm59R6qFJEvFlpJVSM5C/6uTdg0RYu80Qf2UFnGPB
 0OQ=
X-IronPort-AV: E=Sophos;i="5.73,332,1583164800"; d="scan'208";a="137935131"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 02:37:05 +0800
IronPort-SDR: htJQjp3qBlqhyM08ayfFbd0zXI4ShCrDhitEpBejBDp88UAipLQOr3uK454Ol/4BPySim5tZIY
 /0GPi2omy3AcG3RkS/66Yh7FyBqDy1YwM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 11:27:08 -0700
IronPort-SDR: 3TYX+rbpLQGfzANF+eCG7AXToaNG5Nz6r+4ikVxQw9rl8wxZpwj+eNMGIxD1Xg2mwYJWLTOcTu
 5QvcDZHY8fiw==
WDCIronportException: Internal
Received: from cnf007834.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.55.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 11:37:02 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 02/14] riscv/sifive_u: Add a serial property to the sifive_u SoC
Date: Wed, 29 Apr 2020 11:28:44 -0700
Message-Id: <20200429182856.2588202-3-alistair.francis@wdc.com>
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
X-List-Received-Date: Wed, 29 Apr 2020 18:37:15 -0000

At present the board serial number is hard-coded to 1, and passed
to OTP model during initialization. Firmware (FSBL, U-Boot) uses
the serial number to generate a unique MAC address for the on-chip
ethernet controller. When multiple QEMU 'sifive_u' instances are
created and connected to the same subnet, they all have the same
MAC address hence it creates a unusable network.

A new "serial" property is introduced to the sifive_u SoC to specify
the board serial number. When not given, the default serial number
1 is used.

Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/sifive_u.c         | 8 +++++++-
 include/hw/riscv/sifive_u.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d0ea6803db..9bfd16d2bb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -492,7 +492,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
                           TYPE_SIFIVE_U_PRCI);
     sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
                           TYPE_SIFIVE_U_OTP);
-    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
                           TYPE_CADENCE_GEM);
 }
@@ -585,6 +584,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
 
+    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", s->serial);
     object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
 
@@ -611,10 +611,16 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].size);
 }
 
+static Property riscv_sifive_u_soc_props[] = {
+    DEFINE_PROP_UINT32("serial", SiFiveUSoCState, serial, OTP_SERIAL),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void riscv_sifive_u_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
+    device_class_set_props(dc, riscv_sifive_u_soc_props);
     dc->realize = riscv_sifive_u_soc_realize;
     /* Reason: Uses serial_hds in realize function, thus can't be used twice */
     dc->user_creatable = false;
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 82667b5746..a2baa1de5f 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -42,6 +42,8 @@ typedef struct SiFiveUSoCState {
     SiFiveUPRCIState prci;
     SiFiveUOTPState otp;
     CadenceGEMState gem;
+
+    uint32_t serial;
 } SiFiveUSoCState;
 
 #define TYPE_RISCV_U_MACHINE MACHINE_TYPE_NAME("sifive_u")
-- 
2.26.2


