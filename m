Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKhXS-0004ki-7h
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 09:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxA-0007D6-Do
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:28 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZx8-0007gf-6E
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 01:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630301726; x=1661837726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nSm9A1goegV837KL+0Rg+vRf1hfDkOy/ABxNwnYYvqg=;
 b=pVrnEvDLLOOXuFSY7CudPXhKr0mJHa27oF+zPWildL7hmpnjnbydKCBD
 ShPlGuCweEaJM10/w+AZZERfStHod57+Dlg5zzAIibjs5zW61OhYtHkwd
 9p3S3KjlGMR5KUxZQMtTMfpgjaRKooNSLArVSV5p4+CoXvdW1UmNIreol
 uPsvejd6QWslPueuNqQaEw0G1z2SjsRuWeKFvoWi8LriC9e+6bIscSk04
 PYWC18U3FF9PgsuXnAYgdKIKYo6seMNTuxPCgNHF+BOR++7qHXkopqL7N
 Qf0awrTHQ/0LNaIxckm9GYM9E7EDFWRjSwvAkXl3i4ajzatpFE76pPL7S Q==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="290336834"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 13:34:32 +0800
IronPort-SDR: XsDC5TuSPyyr/C9sfCxdMP5VeNbLe2gILl4fGjoOFoGBD9yF5+KbNGV2yczQjcc2hLoavCn7O8
 AyIY8x3FBX45i1Mm2vC2QKE/hUcms4cKBlp5MPMVhJwLUFkyY8OIZGYwZYMN0xkyQlhG1n+mM7
 8h81cNfVKPs9hGA2Bi/OfyVyUqnkLs+a71pID0Ld12aKwVcFUrgOQC5OQeCsCVWZ1dXksuAOwb
 Ba8HScbVOK5F/qTqiisSDMxCjK+enWOWCBsejRzer4cAWsvRIqvArBeiy/JMNyAtCW3gD3JtFN
 GGgcqFMtYvLLH+ahddDYIM3q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:09:40 -0700
IronPort-SDR: 2fKPz3NX0XKvVhIWwWSexe/yYgMnZzK01XvjQLeSo5J9bdH/h6BFUufPugloENIDT9a3TsBiu9
 02/6IWoIoByGnXvr8hLLJdE5Q4drrEz5z0xdMvHFx4//DAAoc6a5ATK3NwDDwi+5S8+rWJTHK2
 9ccARszCP8uzk10jGkl/uQEVmnnyI+b6efIgAFJjzwLanzat/MjmCUk7GLba2EoIdMhFVmmgQn
 NZqK26dgtW0wCfcrTnT7gz5R9Z/Zp8+UnK0AZAD5KGvc0l653YKDkCurPAKRcuAbPmxuBnMV0s
 6mQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:34:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GyfCD1zfWz1RvlX
 for <qemu-riscv@nongnu.org>; Sun, 29 Aug 2021 22:34:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1630301671; x=1632893672; bh=nSm9A1goegV837KL+0Rg+vRf1hfDkOy/
 ABxNwnYYvqg=; b=gcdkcSpd8ysYF/I57jleF1QJ6wu0ZuDp/Ma9VOg3PsSRJTwZ
 Mp4jcPcfKW7DLodmDaTWa237HFSBUK+tEzrkYhZ/SFvkyDh+Y2ySpZrP27kRCRRw
 1bOmDAMIsuDUN/A8CShjKQfU+VsbNW5ZsCNjtc67UmYjZQbbhihZU769I9TIkcxM
 3xheU1p4xrUpF1+ADCAeHdkl893F2u0TdNgQjU0Pktfgawy5MR896S6Y2MkgOMpn
 kQx1A6j6iXDTuDqTWCS89wllt1J7s2ZiVAZpoRhnR/H5sMojc0Buw7CZWAlO5gqS
 HT8Rf9/nUA3awIbrYqlm2QrkCK3f5kQrlu7FmA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VuvNY4Sgil4l for <qemu-riscv@nongnu.org>;
 Sun, 29 Aug 2021 22:34:31 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GyfC71M6yz1Rvl9;
 Sun, 29 Aug 2021 22:34:26 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 1/5] target/riscv: Expose interrupt pending bits as GPIO
 lines
Date: Mon, 30 Aug 2021 15:34:20 +1000
Message-Id: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=8697c1236=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:41:23 -0400
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
X-List-Received-Date: Mon, 30 Aug 2021 05:35:28 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Expose the 12 interrupt pending bits in MIP as GPIO lines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..86321baf9f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -565,11 +565,41 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
     mcc->parent_realize(dev, errp);
 }
=20
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_set_irq(void *opaque, int irq, int level)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(opaque);
+
+    switch (irq) {
+    case IRQ_U_SOFT:
+    case IRQ_S_SOFT:
+    case IRQ_VS_SOFT:
+    case IRQ_M_SOFT:
+    case IRQ_U_TIMER:
+    case IRQ_S_TIMER:
+    case IRQ_VS_TIMER:
+    case IRQ_M_TIMER:
+    case IRQ_U_EXT:
+    case IRQ_S_EXT:
+    case IRQ_VS_EXT:
+    case IRQ_M_EXT:
+        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+#endif /* CONFIG_USER_ONLY */
+
 static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     cpu_set_cpustate_pointers(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+#endif /* CONFIG_USER_ONLY */
 }
=20
 static Property riscv_cpu_properties[] =3D {
--=20
2.31.1


