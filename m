Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hLj-0006bK-3e
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLd-0006Zy-7d; Thu, 08 Jul 2021 23:38:41 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:20838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=81790befc=alistair.francis@wdc.com>)
 id 1m1hLa-0001L9-Ge; Thu, 08 Jul 2021 23:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625801917; x=1657337917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Va/QI/0pXbJcOTp35xblyv2FFoQ/OeR8biIch+I7WzA=;
 b=mic6G8J9ZOZ37gZtDOUS7YIKVmJgOxSuDX4BBnUJH8Htvcqfj01UNOA7
 Paf6hMqOugutpASzFvlXtJnxxHl1KcGr4eVqoTuKYKCKKnzxX4PTpcS6O
 60bPTF6Q4DWau0wo/fk3s4K4UzMW0F9BscJ+kcXLS+IHJgN5oHlqmFhwT
 jUKmsPeD3OzRqlZLTKlh3bj7hDlKpXRJxdlb8eU7NRd1gF6AcF5Go0Svk
 73DrPIYJGzkgjjt8hN1ETym+WhQnagrhR67UheR3VA3VjHkX1f9gZOoCw
 Qg/vXKRaqExNrKXpsCVnz7VEbYPMx00WE37ygmvq1RpAG/0yArzaDjm1B w==;
IronPort-SDR: UYX7kkPu6/woH38y4q/Bfei9AlNLaLG13nR1PoWCoaELm7NFcgNMFnaJ5RRU76i68If+3XNJqy
 3wt+mMb91QVKhrjFBuNkFB5coasojN924bxEufgJi9vqWoVu6m9s4vZZve+1DRGyNNEvkcuuBd
 YDtv2pJcxe/g5cNgZlL7j2weRSJXs8fJUapBkH14vkzfM1SQAbZFW/84gJ16r+E2RQFbaSkjTr
 +4EQwaAf5Mz0A2k8UcgEzHOA1t3v7afKfvCQ0cBsprtNski+NIBJYpvmHAQwBcN2swAVtGvzuT
 goE=
X-IronPort-AV: E=Sophos;i="5.84,225,1620662400"; d="scan'208";a="174125679"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2021 11:38:35 +0800
IronPort-SDR: 58Ea4uiqu8eKPdsmq7JopIB8aTOzNHF+L2alorUXVoTvO5eQF/4dSxIu6ulSYBSQWKAEiXp+Tl
 q41vTd07ldSzg50dWVV6GrM7LaBR5SpiWfJ6w5TImiUXawcNcL/0fx6uJZYIBlE4So+h7UYdO2
 VMajVHV+UDrIebN1u3avdtIu82qFPwNpgvao8ZP3GoKmJJG12Z27Q2uYMhxW4VOkW1PWxfB+i9
 s7C1KgRzL2HyVxLnj5t0Y7ZueGnV1ntRgioM8nTYWX1MyISzkpYDBYYc/nqorsUF/ixw1A2g3t
 nStjRMUQr71lhHFRKTiBtjzS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:15:34 -0700
IronPort-SDR: PCJ0nLkta6HlAyUa5lkExjM2WBTjCEI/y5ERbrFpnMI06h6C+xGNdDj5k43723Qjr7TVovwn7v
 ecvEtBokxaZycIKXWSjcjBbib4UqNBuqyD2eT8O5yaw1/HQivBovisfStDsNn9etr8V8Drh/T1
 8wCOGxd7u4xPsAi5N2krfBVtVEuuAc1wvsdIBl9FbXaqiFVVMQtlG0YvGrH0NIgntsLFG9/F1I
 34li5UxV08kukl4IM364F4p4J3FCoqKZpp+OSTfvOV2oUIg8CSWUgaVmJ2MKJkgGFw55U7Jdb9
 sV0=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.165.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2021 20:38:32 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 1/3] char: ibex_uart: Update the register layout
Date: Fri,  9 Jul 2021 13:38:30 +1000
Message-Id: <25c8377d32f3e0f0a1a862c8a5092f8a9e3f9928.1625801868.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625801868.git.alistair.francis@wdc.com>
References: <cover.1625801868.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=81790befc=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 09 Jul 2021 03:38:43 -0000

Update the register layout to match the latest OpenTitan bitstream.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/char/ibex_uart.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index fe4b6c3c9e..6b0c9330bf 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -42,7 +42,8 @@ REG32(INTR_STATE, 0x00)
     FIELD(INTR_STATE, RX_OVERFLOW, 3, 1)
 REG32(INTR_ENABLE, 0x04)
 REG32(INTR_TEST, 0x08)
-REG32(CTRL, 0x0C)
+REG32(ALERT_TEST, 0x0C)
+REG32(CTRL, 0x10)
     FIELD(CTRL, TX_ENABLE, 0, 1)
     FIELD(CTRL, RX_ENABLE, 1, 1)
     FIELD(CTRL, NF, 2, 1)
@@ -52,25 +53,25 @@ REG32(CTRL, 0x0C)
     FIELD(CTRL, PARITY_ODD, 7, 1)
     FIELD(CTRL, RXBLVL, 8, 2)
     FIELD(CTRL, NCO, 16, 16)
-REG32(STATUS, 0x10)
+REG32(STATUS, 0x14)
     FIELD(STATUS, TXFULL, 0, 1)
     FIELD(STATUS, RXFULL, 1, 1)
     FIELD(STATUS, TXEMPTY, 2, 1)
     FIELD(STATUS, RXIDLE, 4, 1)
     FIELD(STATUS, RXEMPTY, 5, 1)
-REG32(RDATA, 0x14)
-REG32(WDATA, 0x18)
-REG32(FIFO_CTRL, 0x1c)
+REG32(RDATA, 0x18)
+REG32(WDATA, 0x1C)
+REG32(FIFO_CTRL, 0x20)
     FIELD(FIFO_CTRL, RXRST, 0, 1)
     FIELD(FIFO_CTRL, TXRST, 1, 1)
     FIELD(FIFO_CTRL, RXILVL, 2, 3)
     FIELD(FIFO_CTRL, TXILVL, 5, 2)
-REG32(FIFO_STATUS, 0x20)
+REG32(FIFO_STATUS, 0x24)
     FIELD(FIFO_STATUS, TXLVL, 0, 5)
     FIELD(FIFO_STATUS, RXLVL, 16, 5)
-REG32(OVRD, 0x24)
-REG32(VAL, 0x28)
-REG32(TIMEOUT_CTRL, 0x2c)
+REG32(OVRD, 0x28)
+REG32(VAL, 0x2C)
+REG32(TIMEOUT_CTRL, 0x30)
 
 static void ibex_uart_update_irqs(IbexUartState *s)
 {
-- 
2.31.1


