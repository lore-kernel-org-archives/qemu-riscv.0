Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQN9w-0008Lh-8Y
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 02:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9p-0008Hw-JI
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:13:04 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:25208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9n-0000mf-TQ
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235178; x=1692771178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pKcENyi+KrJBbejZ9NVBAhqC+/2XPVYWc3tv7k6K+3A=;
 b=RVCeR+VJ9NfrqvI+gGBLT0y6knrBjt8RhCHL/mlhymtZh39z2/h5ucPh
 QLxcRThf2D8bZze0+H/vDd3niCAb4JnRxUduHOsSLTEnJkSaUkO057kvs
 CfV8DsTTz7rDoNprkz9SN3vsWela3qKec3xBcdDs9RMLluIdUMyGQlPAG
 I1Kc6Z+IxtJ8SDQFGoLQeqsDz7RTHJuXsccG180XierqWaIbutFQRI1CL
 cM5U13VtymV0eNEgzyBTFK9EgiPTqAQncl35vItsJHPDdPEkqq8Fq8YYB
 unkesRcHiHke6x8JgMslnI7SyNKxDfD24XWadvHMMiLpKQCqXUZLVpKGH g==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="209393019"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:57 +0800
IronPort-SDR: +B3Gi9BLqIsPyzKDA8fT4PSwOAJjvqFoLqdDO5J2eZOmfE1bcVyNNUfZ5qIBhsDmzQ++e6upii
 n5r0GJoDF2TwGysro/YRi1TIXei9M+2gbVh7mNrHPWMpxUS1wzKlAM4GaQoppbezJqBx//H1tk
 LZPlx/7PtDgEB/sHgX+69EUIPgKlwvyd7UGRX9ya7u+GRq6Q41mBtFu7lpf/Ppp6eD7vPpf3RW
 r4XLbpNKGzhwMetFIxwj2FqzUh90+YQcUqM7FK3eq6rPkokQ/TL+7qA391psVPpjDT1OTPJZGt
 /0QyzkWFZaLAKHMFNzI3PeyP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:28:16 -0700
IronPort-SDR: 55+p3KEMOm2Dprgt0eoGZ1IOSTaUIIoRmBhzAMAZpf+dFDDNhAu4/04nOWDhoPMIDftOFW7scH
 xnIzlOpHAHfdhIe343X8e3UvCGU6FCJLA7j7fQwxHxi1vP2JdfZSeIMtDIZ+6N+qmlB21RFQ4I
 c6kKisTxBnsg1ywo9NChZX9AMEzTNN7Yh68VunrtOLwEfWvCTNJqa0vwuwRFIE5g50+mp+bAx2
 Q8c/tE/CFwjOoaCVVLhoBz31V48AgEuIGsdxBfwkJqwYW99ODjzlXFLsslfqk17xvH8w5FzEWl
 slM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf6L1Gm4z1Rwnm
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 23:12:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661235177; x=1663827178; bh=pKcENyi+KrJBbejZ9N
 VBAhqC+/2XPVYWc3tv7k6K+3A=; b=rLs2zzoxjxkjAC+8893rCg9un0JdCNaeAx
 sR464uerRsnDaRxZbqF+80P/ZJBWU4m94IBijB6RlZxxQh9NUIqNN98K90cKvvtJ
 AR4mcYdvN6AM/gqCmGn+q+vx7e46w7MB9P4KZ10e6tiffyTXQdhGKVCAtEXSEcdt
 Q4/mBFCCPzlifdiFFRoqGLdcOVKyceBNM5VDGYEu1KZLJ6R2moIuSqnPfcgA0fdJ
 e54eASS4oDs5oUDVlv5c8zUoOHvfBJOexsaMhY6N/DNzwGC8Lapc+WpzfLCWUnT7
 Kri3yO8eOphhpKySuSdoIii0b0BEMEz6giWfzQIoUAbI9oyV4j4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0F8PR5B63otg for <qemu-riscv@nongnu.org>;
 Mon, 22 Aug 2022 23:12:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf6G6Sbmz1RtVk;
 Mon, 22 Aug 2022 23:12:54 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 4/4] hw/ssi: ibex_spi: update reg addr
Date: Tue, 23 Aug 2022 16:12:04 +1000
Message-Id: <20220823061201.132342-5-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2270691b0=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 23 Aug 2022 06:13:04 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Updates the `EVENT_ENABLE` register to offset `0x34` as per
OpenTitan spec [1].

[1] https://docs.opentitan.org/hw/ip/spi_host/doc/#Reg_event_enable

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 40d401ad47..0becad34e0 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -93,7 +93,7 @@ REG32(ERROR_STATUS, 0x30)
     FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
     FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
     FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
-REG32(EVENT_ENABLE, 0x30)
+REG32(EVENT_ENABLE, 0x34)
     FIELD(EVENT_ENABLE, RXFULL, 0, 1)
     FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
     FIELD(EVENT_ENABLE, RXWM, 2, 1)
--=20
2.37.2


