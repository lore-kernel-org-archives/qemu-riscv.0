Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJkLn-00011Z-9f
	for mharc-qemu-riscv@gnu.org; Sun, 22 Jan 2023 19:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380668d3b=wilfred.mallawa@opensource.wdc.com>)
 id 1pJkLl-000119-Sj
 for qemu-riscv@nongnu.org; Sun, 22 Jan 2023 19:06:13 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380668d3b=wilfred.mallawa@opensource.wdc.com>)
 id 1pJkLk-0007TV-CM
 for qemu-riscv@nongnu.org; Sun, 22 Jan 2023 19:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674432372; x=1705968372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5oa6UUini4nihWHrDxq/euHryq8YHHpTXQ5iJqv+FnE=;
 b=eAYHMgnLa70eUyBk3XfrwbFbDWyUY1h3S1EAUaCPrgCL4H+JCn9uBct+
 jh83DDjNwk5Pmjgyf7thy0bUH8zsremN0nlcwFALqY3sz/U+zYKZEYcTE
 Aim68fAEVUssV2G7CJzKsza7fiE0qSz6FMnGIggU9sJ29VI+Vo3ZEYLWg
 1dSXhqDs12ccXuBcBJj9Nsyp5g1iUA3pyQv345PJoBMBb5XXM47iXsgzX
 M4vMHJZuNUn8tDlbatYqqW1N8+foEO8XzTqEwuSywBIW4/B3SnIn3ZEaa
 Kf0rPCTHO0jhdwkAxfMuRuz96yRW1g57U5plUgQyzNWhdS2lek8PC9LgG g==;
X-IronPort-AV: E=Sophos;i="5.97,238,1669046400"; d="scan'208";a="333494697"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2023 08:06:02 +0800
IronPort-SDR: bLLkPAdqQAK9N200ZZgLwprdcc/RNZBdCZI3E4+8wzxfEM7jTF/deduCu/4VwH87OLKCnR2q98
 h9W1P7ScuNgzLSH2PAIUZ5fOFPCxpMRNtcOqp9shu60TNYYFlnBmsPwzw5mfliHf0cxk85RV6f
 3zNx+M6vLTWrxP/nA04NQAlFC1H7Wx7YXazT7OwpHti+MJK1uprwH9PPf52rJ2zVM/4MWbsBoE
 LJBnGSWONONH9jdzmpX/qTLZtOND+YKX7zvUQXaJpUJDjZi3w3pKesD4cEQ+NayuPY760On1p6
 H4Y=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 15:23:36 -0800
IronPort-SDR: Lt806tRO2Wn9nvBjamz6drsxyRcoEMuR5ekOLvy2RmlsF+To3dnNJPMyaJ6UhJMUnFV5CR0ydq
 W3qoDbWG8jvurpcrtYkCXvtNHWEX/wFqIg1F8MRuqvQq/g8mWuFzW71he+7VKT/PJd4xVpUh4B
 yUZ0EpV/6u/5j2hYQCtU2EWbChfQaMVB9zykhg4KWgkIZsTxyXw23L8iIRdrnFFwax5NSSWCyz
 Lh04PvXQ+4LErCAmrA6PKbaUQubLC82LZUtC0XUMK3QUs+2549kojRYa7MRAbEG4U8SphF5d5m
 cv4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 16:06:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P0VkK2QKmz1Rwt8
 for <qemu-riscv@nongnu.org>; Sun, 22 Jan 2023 16:06:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1674432360;
 x=1677024361; bh=5oa6UUini4nihWHrDxq/euHryq8YHHpTXQ5iJqv+FnE=; b=
 P3XTDTMhYw5Z8421mkigARHmzoK2kjb/coQ5tadiiXuPGQsMz3q49pBcFKbAcmFn
 s+GecnSZJZ+W8JzaoyT/+oyDR7CaYgDL0ONOIKRaWFhwB0czXA0+UBF/Cyu9yRuF
 xFg3a+F/ToNyfP6Uhhr1wyoqs+Y+OxnUGOgeA6p0u6Z1XTtZfeYloHu8YfCsUvVc
 HKOWVyj24h90emBmWA4MrciH+bGiJhxrp9ZiJWfe0M64rHZXaTyDkfGPU46gqWdy
 iHvNdWcaVClIxR6pFj/cJFe7epmPX4ROU/IaCayT63bL/jzVBhL3qynYj30Ajl9W
 I27IQ5nZFb5r4/n7WeRI+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BNBPYh9YdkZQ for <qemu-riscv@nongnu.org>;
 Sun, 22 Jan 2023 16:06:00 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.30])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P0VkG1vffz1RvLy;
 Sun, 22 Jan 2023 16:05:57 -0800 (PST)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH] include/hw/riscv/opentitan: update opentitan IRQs
Date: Mon, 23 Jan 2023 10:05:41 +1000
Message-Id: <20230123000540.58351-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=380668d3b=wilfred.mallawa@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Mon, 23 Jan 2023 00:06:14 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Updates the opentitan IRQs to match the latest supported commit of
Opentitan from TockOS.

OPENTITAN_SUPPORTED_SHA :=3D 565e4af39760a123c59a184aa2f5812a961fde47

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 include/hw/riscv/opentitan.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 7659d1bc5b..235728b9cc 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -108,11 +108,11 @@ enum {
     IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
     IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
-    IBEX_TIMER_TIMEREXPIRED0_0    =3D 127,
-    IBEX_SPI_HOST0_ERR_IRQ        =3D 134,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 135,
-    IBEX_SPI_HOST1_ERR_IRQ        =3D 136,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 137,
+    IBEX_TIMER_TIMEREXPIRED0_0    =3D 124,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 131,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 132,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 133,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 134,
 };
=20
 #endif
--=20
2.39.0


