Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6nwG-00079y-9e
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 01:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6nwE-00077q-J9
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 01:13:50 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:58595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=002fe4623=alistair.francis@opensource.wdc.com>)
 id 1n6nwC-0001as-PH
 for qemu-riscv@nongnu.org; Mon, 10 Jan 2022 01:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641795227; x=1673331227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TpQMwSArOfK2lKrEdR5UHxT/VKAfGPd14SjLQAlEpG0=;
 b=kZbD8F5it1uiqJvaLWAhNBv0Aa80m5klW0D8VrwjriDYVOCLWYt3Eba2
 fO9Opsu/Ojy6zMLMBKieRTDEI1uWc5ETYF1GHVzTr//yAoXZXvB9DP256
 XQm3b+qRFdGcsZ0hPrjHO0s68Btjv++lmyz9yZWSttURx6JbdbNqwvV8L
 mWQgJ3Xw+ukZzYQksG0vNnQpEzut05mSovXr4PYWEjzsKs/8LYn0+HxH2
 Ax7y8qrb9jsbP5x8luNJ7m5PHBYIlVkhTR+3CE5f7munETdpdY8DlcOcq
 YfAhUKdhkZgpuBuVbVrKnh129mP938tK1ooC0lcJCFgBxUiKKnKIyK6lA g==;
X-IronPort-AV: E=Sophos;i="5.88,276,1635177600"; d="scan'208";a="194868375"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jan 2022 14:13:42 +0800
IronPort-SDR: idAxT7KKXpWONGmybt76XXFNbaGQxK2YItygY99gRtcQPxh16a7fcy6zRj+G6HGmL0IJCs6c+v
 V6fDdEz7QZze9b4vahEKO/ZWhQNCtzG5vZEP+LB5ksnY9WKIPsgIRgMFbwpVTGxFraRBggQoNQ
 nPvqruBHSbkyGks3SMRP1imXTr9tjWjzO020D8jWX1INuFPLSliTrXJEJf6DB/aenROr+5+u9a
 k8yjVX7ewPGh1PHMM4dlb+DZmgVjmeggeI+6uHISOLPConR5UuG0/eLdGjTQcWJaN+V1K92MJy
 zMUOXgWzHfbw3nxLU0rzNKvN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 21:46:09 -0800
IronPort-SDR: /8oC48hxBh4XsiGKJBtPHMd3URz+OStEo+FHoKb6ps1vT/aSdfeofgQTPj2foYGmYKpJNY1kky
 gpHDiM5eSl2XZ098ihGVM+HbePXF2UIRRPP2qH6PWeqw9yIoeYsaHYEJsDADq9+zgmSNDJ7+be
 WzyyoOL2qeRDIcQW3BNCSYaIy7E2e/kZ3r7d+4YY8kiQ+HD0tvP9VmMzDMmgs4vK9EZBYq+8CI
 uZWWJ9OMzMOkbyRTZuJdwtVKkX+u1Y7AIev/9pARNmJf9H2X48lVo7Gsqo88tAr0UBrePfTBxe
 yfE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 22:13:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JXNn42Bspz1VSkg
 for <qemu-riscv@nongnu.org>; Sun,  9 Jan 2022 22:13:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641795223; x=1644387224; bh=TpQMwSArOfK2lKrEdR
 5UHxT/VKAfGPd14SjLQAlEpG0=; b=S1UvfpCgSKYKvDAwLsqQcyaUkbMms4yWYw
 CGbu2GJcXsSvA4lRcxXQkJzbm05lI8HuTQjVhNZ3ecbIdfjIY7gYV2d4sH8KyAzF
 0LOYVT2zIGRxrMhom/n+pt4Vw+q2g7nYbAHJI1fmy5Oi9kfYbar+5H1QwyowGo6N
 2XHCmCCPdHlP9gWhyfRM8+eeILpUS4X0Wy+7+2Aq4VHPKRZCvmuehNwyBfXB4lLC
 iNNop+MmX6zwtilkkAiu9x68WwNkXzG6eM1+CQLiMFYQUGn9pjN2ouvJxw/wo4kC
 tSAi+eJdf8p3cJAMCRZk1XHUNg1a2/ANTR4Mqg2oLxOZRlKuUBeA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SnJrsOAquyuC for <qemu-riscv@nongnu.org>;
 Sun,  9 Jan 2022 22:13:43 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JXNmz5cSwz1VSkW;
 Sun,  9 Jan 2022 22:13:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH 2/2] hw: timer: ibex_timer: update/add reg address
Date: Mon, 10 Jan 2022 16:13:21 +1000
Message-Id: <20220110061321.4040589-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
References: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
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
X-List-Received-Date: Mon, 10 Jan 2022 06:13:50 -0000

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


