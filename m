Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6nwE-00077u-K6
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 01:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6nwC-00077O-Gh
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 01:13:48 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:58595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6nwA-0001as-6M
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 01:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641795224; x=1673331224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gE8Qlt3HSTD4xJo1vxOYA7bkRrLG1Gmw/VIXHoJ7Uw4=;
 b=qaXjAdCOFnjCuFgQOAQ2q2lO1hgBkB6VbhES5LcPqHpAAWATb3bDa71E
 GIZArXx9lbVp9OUcdm3bT1raq1gRHOqkgHw6JH+yJz4HhRVGSscj60eDj
 /BczfMAYFrd6651/R08qOBLIzTGsH757POd62fv5OMC1++HE8p1Da9Fgq
 JUBrFGya/wfhb0iPwSa57x/zLyPhOTzl7i/wMISlhGCdUtnuvWoRgVbqM
 liJJbua6M2m9VqCmSzTjiF7k3kfIqfcrMSS7jqzD9T/oitWwdZsJaQrD4
 7DC4U7Xfe2b0STx07LXOy747b4KnReH5Io3+TvihCkoJwcstkugEA0nty g==;
X-IronPort-AV: E=Sophos;i="5.88,276,1635177600"; d="scan'208";a="194868374"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2022 14:13:37 +0800
IronPort-SDR: cXf47xvrVTk5SOPMOAPk6N62Gc9aLfbdhsL45Q+1Yn7cXOx0MTPTQL9yzWDzHhzzcnkJnovuhZ
 GWkOYC5TJ8nq9zYfe5A4/Dh9L7l9G55Z+72ofTg6LSSH+nhe09S6wybOxrQDDP9l1wf8AtC6KI
 3Hnglb4IOlJCIIBhaaR54ZcXFF2Y0b9LmQizaQpJF3r4yZUe9chjoauTBa2Ce4cc4O4dJvwLAB
 b51pK+N57hyOvRy6t7OSRwhyjoyRbHECAdX48y6vlM0KhUSRZG7Lhqe22mrzYQkHw2qmqed/id
 haJ/ZnM1zYW/PFVooVdLQ9Om
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 21:46:04 -0800
IronPort-SDR: k/nwrHXm4vsgXWkVXq6E4f0dIcoqdua8Jl/R8bBN4Bx8JgfRFpy8klgonFqrmXOR6e3P9/cooP
 8b8qILu7OEkr49FOfmLUkxJbyS9JtTYtJMoqfF/fZay5G/BUPVUdqzSchMwws4iM9c0jkb4Wr6
 yll5NuE5AMhJWg0EB37NyFYlsdD/HZKfVm7itVK+unUdi8mP/NYku4i6t8kJEfRpglj/doNlGc
 arNbenMIGbJW3mDdf1u3cbv8rbibU1zTHO/NFefoCl+QuoyTNkubIqbnlCjjvyzhnNdxdghs69
 58Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 22:13:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JXNmz3Jhgz1VSkf
 for <qemu-riscv@nongnu.org>; Sun,  9 Jan 2022 22:13:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1641795219;
 x=1644387220; bh=gE8Qlt3HSTD4xJo1vxOYA7bkRrLG1Gmw/VIXHoJ7Uw4=; b=
 BPiZOrm4bFOv5VXevx0JdXV3vIT0WvFCH4KkMgxFHd6ayxaknlqN8zdgCGxFXz25
 hE0YoSdDm5Rcz7qdxxRG1+bGT+ePsHaHK7Rxfwfpxn7hrXPrw981QGFAVCytJ767
 8uVtb2VcS26SfQSaRRcJpm9a6nUcbykOnny7qa27lsa7TdgUnRyIk+vGbf7BAm8c
 FOUezdTOQv+rvbiHl8Uks+XxtZnEueKUv2QE1L1Xuke9frLE0oQnK0i5nRowdm73
 Rmz6vdVh/fCXRT6iEp9daLdX2PpbfK7X+meHGlrgskCBviXazOe/dtVbPP+DIEIg
 fp4wKIiQ7B8O/uQoOXGngA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tD2ZSQiH7N6e for <qemu-riscv@nongnu.org>;
 Sun,  9 Jan 2022 22:13:39 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JXNmt5Qy5z1VSkW;
 Sun,  9 Jan 2022 22:13:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH 1/2] riscv: opentitan: fixup plic stride len
Date: Mon, 10 Jan 2022 16:13:20 +1000
Message-Id: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=002fe4623=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 06:13:48 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The following change was made to rectify incorrectly set stride length
on the PLIC. Where it should be 32bit and not 24bit (0x18). This was
discovered whilst attempting to fix a bug where a timer_interrupt was
not serviced on TockOS-OpenTitan.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c531450b9f..5144845567 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -160,7 +160,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
--=20
2.34.1


