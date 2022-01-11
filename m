Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7BJI-0006LU-41
	for mharc-qemu-riscv@gnu.org; Tue, 11 Jan 2022 02:11:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=003f2f281=alistair.francis@opensource.wdc.com>)
 id 1n7BJ1-0006Dp-OF
 for qemu-riscv@nongnu.org; Tue, 11 Jan 2022 02:10:57 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=003f2f281=alistair.francis@opensource.wdc.com>)
 id 1n7BIz-00082r-Hx
 for qemu-riscv@nongnu.org; Tue, 11 Jan 2022 02:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641885053; x=1673421053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZMtERUzgB9AU0L8sqctO/oL6rbEA+cS6+PhXQRQH2M=;
 b=PvePCdIEnrb3AD/kVrDS5y2E+G8AzDoxAWeMGkxmxnr58Kf0XBJ9ZZ3/
 qcphWvjA3kokZ7aayZPoE+g7BT+o1WowCDafRJ6TNKGCPw7JuOpoWBLgr
 j6vdItZT02A1qPD8INlcvu6vNxpe0B70UPCN7rmqAR6GWJ7FJ/fhk8gPy
 bZ2JrU2kk5wdObOL3EkrTTC1R87fblm7gnqWsqQmU0dS3kEduAQu9bbDi
 9k3czfd2TAYzMdhneplXBLLpkQ/5EWe8U1qE2EwTQsGh6UPwp1aqMGx2F
 Yr+h7KmhMFTTrVakLwIP7xsLlckkY9J/ofvwiCfgDZlfuROSxCA/aAVE/ w==;
X-IronPort-AV: E=Sophos;i="5.88,279,1635177600"; d="scan'208";a="189132671"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2022 15:10:52 +0800
IronPort-SDR: KDgbCsU6HqizHNKm7+uhVOCP99yEK7UYtCDRUpDVEZGOy+cuoz0d17BHQOfNws8nYVee9AQcPx
 Ewgz6QfvEK8LvpXP9EjXiyyfFa0v5B2myyHIkMBuXne9QULa+R311GYQDARk34QKtkNlzL71HX
 pWkzindGS7bYqSxjGcrMhN27oInm0Yr1EaethYvBOgQGGkelbZb3RX68R7kNrsa4F0Iz08rb2s
 iQWGG3xGbEnLDUwFpaKRMUIcP+Ftn3+Iq0OlpoZvEYf8/gfJV1OBTx2Y8tf32P1cfGYiP7+gPz
 F1jP4rmaeX9UDGpWxQXlHeyw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 22:44:34 -0800
IronPort-SDR: DjPnKpTiJ1X94+9AcbVwGnU9OvaPKcZSPb/rsM+8bgrK3ctn+8ZeYqvezvTJDGxeJ9+dsLBM6z
 rfv+MIAt/aasdCAO6KwkRTlHGylw85uGtQjUk22HFmg8+IDxjiFOUQ/0RfFqlsg/4HGFsRLoOy
 fM7+NxdtlY5e6v6sw/+P/Ps0ZOad+0HSX8XwNxyevbJblHrf3zwH7I1SLrdxrPCO3bciFN2hO2
 FqZT5RnPK1fsjZjsVPFoQdQ+SpiXWNcrkHOzFnk0Mll9rTgypjLSzyEBkpyBLQKwd+M2kxB5d9
 VtM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 23:10:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JY20W6JK4z1VSkX
 for <qemu-riscv@nongnu.org>; Mon, 10 Jan 2022 23:10:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641885051; x=1644477052; bh=wZMtERUzgB9AU0L8sq
 ctO/oL6rbEA+cS6+PhXQRQH2M=; b=S4CNowUD1boTt3Yva2uhw0vAGEsgMm8jFj
 TKYMQWjD5uGU/27GxGfXPzhD1TJl9x5GTOkC/eINP6ZCdva3A4JTB3cOO+kzapUP
 3DD/TZIQqOVssFJsZDfdZcBPdG0e5bpYWkHWmmIQ3NPGdK83UrlpXggLmZ1HR20+
 W9AIb6iTJxYxP+MoWY1tUT2spy8gaSJQwHSDgEJ2ObJaa7qHYqZ8S4udm9arXYkU
 noS+ndImdkzdvG6KUifILOPxHb+rtiGc79FcKOEKCqa1wU5QNM8K+QWWzYsX5H4K
 VLvfhhXRTVSwWB8TO+6Y16PzCU+sEWdud3KiCLvtRAuF3BLzlMxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qvNzRNJCKFSY for <qemu-riscv@nongnu.org>;
 Mon, 10 Jan 2022 23:10:51 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JY20R200Zz1VSkW;
 Mon, 10 Jan 2022 23:10:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v2 2/2] hw: timer: ibex_timer: update/add reg address
Date: Tue, 11 Jan 2022 17:10:25 +1000
Message-Id: <20220111071025.4169189-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220111071025.4169189-1-alistair.francis@opensource.wdc.com>
References: <20220111071025.4169189-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=003f2f281=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 11 Jan 2022 07:10:59 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The following changes:
1. Fixes the incorrectly set CTRL register address. As
per [1] https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table

The CTRL register is @ 0x04.

This was found when attempting to fixup a bug where a timer_interrupt
was not serviced on TockOS-OpenTitan.

2. Adds ALERT_TEST register as documented on [1], adding repective
   switch cases to error handle and later implement functionality.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/timer/ibex_timer.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 66e1f8e48c..096588ac8a 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -34,7 +34,9 @@
 #include "target/riscv/cpu.h"
 #include "migration/vmstate.h"
=20
-REG32(CTRL, 0x00)
+REG32(ALERT_TEST, 0x00)
+    FIELD(ALERT_TEST, FATAL_FAULT, 0, 1)
+REG32(CTRL, 0x04)
     FIELD(CTRL, ACTIVE, 0, 1)
 REG32(CFG0, 0x100)
     FIELD(CFG0, PRESCALE, 0, 12)
@@ -143,6 +145,10 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr=
 addr,
     uint64_t retvalue =3D 0;
=20
     switch (addr >> 2) {
+    case R_ALERT_TEST:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "Attempted to read ALERT_TEST, a write only regi=
ster");
+        break;
     case R_CTRL:
         retvalue =3D s->timer_ctrl;
         break;
@@ -186,6 +192,9 @@ static void ibex_timer_write(void *opaque, hwaddr add=
r,
     uint32_t val =3D val64;
=20
     switch (addr >> 2) {
+    case R_ALERT_TEST:
+        qemu_log_mask(LOG_UNIMP, "Alert triggering not supported");
+        break;
     case R_CTRL:
         s->timer_ctrl =3D val;
         break;
--=20
2.34.1


