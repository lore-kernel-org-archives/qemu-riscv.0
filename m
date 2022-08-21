Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPubB-0001f1-3M
	for mharc-qemu-riscv@gnu.org; Sun, 21 Aug 2022 19:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPub4-0001dI-Ks
 for qemu-riscv@nongnu.org; Sun, 21 Aug 2022 19:43:15 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:43028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuaz-0003CL-K6
 for qemu-riscv@nongnu.org; Sun, 21 Aug 2022 19:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661125389; x=1692661389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkXq9BEmisYvxPBBnnF+3nWPoQ4uRWizUP6v4tzOoqo=;
 b=jKyJw7X1xmtSYNxYNZD+vn9TMvN38OtkiMJCZzFn4PA1oSYMXHbjSLiM
 krk+9Wtf1qSfqRBYtnL77qNkuf+SxdaJtjnPMcD4WGZtIO0sDi54DKm48
 yju6r8NoscFQXXTmO+4BNLy2s5yFC27+AaGmBiOM22HNRJjReHNYYNYAl
 noD6Y6oecZO3/R/4THhp9X0uE3YNPalTw2uN9rt3XD1xUBMpbqWfREe2I
 kk/3f3yTo5okeD1aunLJeO8JQohBQwOlLvHuJvsgTITP6gNBwByzsbkSg
 0QpAhX67F4MFopTEN6LhwFlsAO5BwEfx7gh2Mx0U/HKL7pMf2lNEiOiCg w==;
X-IronPort-AV: E=Sophos;i="5.93,253,1654531200"; d="scan'208";a="209788378"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2022 07:43:08 +0800
IronPort-SDR: Iim+64lRjfJL9EDcXvSIl/F/aE6mNUJy/zS+DNPl2/HRFhCAj9vvMyGr4jARVxk//W0HxcUmin
 lTAwt8RYJcyHcvJELn33n4ZtlACV/Ya5dyyxIYnbMlsTUJtsvyq+A751cM50Ic2FT11lm2f3Tj
 /i/PUWFCXwQg2Kklf6+b1X5YKIYh0vLU2XmfCwwAF4mRcahnhdCE4u80TgfUESapJwmmud/EnQ
 svIGDE2M0pwPdrloJMLKD477tj0fDpsJE1cpaBo2MrU46zf+xvEAfuHWvUrDSZyQKej5EsxwRH
 jwgDw63IaP65S7IgZUUES+ue
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 15:58:30 -0700
IronPort-SDR: agTDn4XvfEHdfHO3h7/rxXxLCO4iT83JIk4nsCUhU6PyRCnFnWKQYHsINAQdIni8bGOeVz8vKE
 /tXvMO8/8T1hfuNHOlQKaVPmmqHtuRG0h+Y8HGZSmcDG7rKAhxipyyK7x+Lz80eBOv2xe9n+v8
 Z8CSLL2j+O//sTDpORPKsuVCECvDeLwb8m6E3SxY7666oJt+eLXW8F+8nUSE5Q1vnlhnD+OxxP
 QrEwbiT6xSX8TsyYEZMJOAvo4dRJX7G5xly9q8SSMsanNwx7RxDd7dD1REiwyzgwOLcoksGcX+
 Qng=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 16:43:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M9sVz6fYRz1Rw4L
 for <qemu-riscv@nongnu.org>; Sun, 21 Aug 2022 16:43:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661125387; x=1663717388; bh=NkXq9BEmisYvxPBBnn
 F+3nWPoQ4uRWizUP6v4tzOoqo=; b=FfF95BDFbFITx1aVl5x8mJUYtNy/j7oyJm
 5EpKFFrTUWCeAZSHkem5PpKV/Jewa8QfSjidB18e2N21/SYdlKRNFLIXFCI4/Wna
 TIyVSUN3cHG1hj8gNRWpDCE3H27SV9DeDTWOl9LGLi2y3ucuoUCvmI5RBT2XSnw6
 ypKfs8zS+hiNDVoEuUtCJmKOcsBNBo/6AKkzezdIU9VczVSE8/f2zYr/aBZfGiux
 udRSdfefimCX7Y9N0QPHLBU1lsAaCrt+hiFKQHDg0Hgo77nDRS8k24Q9fIvnLCjK
 tM7jBuqb/FrkektE95cTVPDAH0HC9uJxg9fQ/vprEWSCh8gs1OUA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UyUoNo1ZKn8b for <qemu-riscv@nongnu.org>;
 Sun, 21 Aug 2022 16:43:07 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M9sVw1qqwz1RtVk;
 Sun, 21 Aug 2022 16:43:03 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 4/4] hw/ssi: ibex_spi: update reg addr
Date: Mon, 22 Aug 2022 09:42:01 +1000
Message-Id: <20220821234200.34052-5-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
References: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=225a36311=wilfred.mallawa@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Sun, 21 Aug 2022 23:43:16 -0000

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
index 3809febb0c..bafff8ca1f 100644
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


