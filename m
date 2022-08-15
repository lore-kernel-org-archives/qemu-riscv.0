Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNQcI-0004gS-Hl
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 23:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQcB-0004Z0-Ge
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:18:09 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQc1-0007Sq-CV
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533477; x=1692069477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MdQobky66vKbHGU/y2zi8zZA1scl005jHEY18jAZWQg=;
 b=Sgx9glAwVf7w8vhlHQSxtuknwR/2HHPkIj6PuJFQphd60jT0jvGCWNMX
 uySOaZ+yeEtJcX1SkfJWt6fdEMaWjIu49Njtsxy4PifjjXqfhaIQpryZa
 3kUp6ACiI6aNh1Cv1V3H9va7d2toJwNDGvLjo4/ogKb1Rih361ioLBtaW
 tp888TFgfYCbH13TBAjxksoq55LIpBekOF8jnTE9F7XRgdv8P0sgKbLvS
 jNY+y8+hT/XLKwHr5worcf+CXEEvAmSPb5sMRA2lEQbXvVzdpxEs0qAv3
 b72CPHwIRySnXORRvV72SrT6ELqS53uIOm6e5rEDanhwPHdOgHjyQF8dL A==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="312972252"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:17:54 +0800
IronPort-SDR: n6ohjwCWG5oDui2JeEY5BY2Lw4fe8ZCBwD7VtFwVX49GZkhzR9DO0Ho9Pl3vbW1ARzr0McVhdG
 4z43J+BGC5Jib6UlctfvxKouAhe39EaIMewpWWS3Y2JC409J6G+jbX1bMcq7J5jcr+xaEtOlw9
 jBP+WS/V3zphcz82LLv4TMM6PKhBuU2C8VO67Ei1TDcso/sKmEfELsEQmjbjSPjUlQKjNekTZI
 WbEBQ6rF6G06gpB2Vqal4FMQdb2mLdWAusHwsLHxRdtBTzlJukieersukxK9T1+uuwgqHwVFiy
 lOrv6KruZdauSFX4oeoUXkWn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:38:43 -0700
IronPort-SDR: lfx261ERxBS7FVpiEWzmocJQ53WendH0YwQBc55EL4tMOsmIdEI10iLFJBtkFQSp8alx0HMpYL
 MWk5qG+SctQ0hnBfxzFqtnystuneAfIS+ZOsNXSjkLdu77CNQP7m06x2Phx4tachus33KgzhRB
 /9mZ2mQe1oBDMTCkoqQkienSaNLeOkQrcP87jeEtLyxrL6PEsdPEboUvSIRG8ntRIAq65iK05F
 sOKUu4goN70NDJnBoQ8ymjT0HyvfY4C9oCDWk4BttsudEybKyTFqpjq4FT93Cwvy4VPnzDSppV
 HyI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:17:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fc16d6Dz1Rw4L
 for <qemu-riscv@nongnu.org>; Sun, 14 Aug 2022 20:17:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660533473; x=1663125474; bh=MdQobky66vKbHGU/y2
 zi8zZA1scl005jHEY18jAZWQg=; b=saNCRPPmJf+X9QKgQUB35vObqRxbzAqT/r
 B1HaWcDHnwAG02MZ39FHlGB+bx7lsgJe5xTPEP88oip9iO4eHRt/zrMjuRQIf8TF
 S3FoQZmrmtDH95jR/KHQM95ja1YOt+WdkxpxebgmdE+Nj/eJMg70nhzeS2n8nxbP
 2I4RdviqgjO0Rqe3oTxk7+tkbVIGpYT1VcDvFGmZpxc/x/oqmSABEKlaSOelEI2k
 CIlt2XC+BaqerZCP9CMn5RZex5z3ybWFH1HCVgBQ7u+kN9nW8kcY/8h7LrBqiW76
 4MpuFsmsWCvCt5kFvqMQ+POeaUd5liAKU82ErD2RlY1yu/QCcKDQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2_SrP2dVT__x for <qemu-riscv@nongnu.org>;
 Sun, 14 Aug 2022 20:17:53 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fbz2sXZz1RtVk;
 Sun, 14 Aug 2022 20:17:51 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v2 4/4] hw/ssi: ibex_spi: update reg addr
Date: Mon, 15 Aug 2022 13:16:25 +1000
Message-Id: <20220815031624.170857-5-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
References: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Mon, 15 Aug 2022 03:18:13 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Updates the `EVENT_ENABLE` register to offset `0x34` as per
OpenTitan spec [1].

[1] https://docs.opentitan.org/hw/ip/spi_host/doc/#Reg_event_enable

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 19dd094d76..3b8dcbce05 100644
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
2.37.1


