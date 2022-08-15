Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNQbX-0004CL-1Y
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 23:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQbV-0004Ae-6C
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:17:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQbT-0007Lw-3c
 for qemu-riscv@nongnu.org; Sun, 14 Aug 2022 23:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533442; x=1692069442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4GzVfAkvrf4UkgJX3Gd2cdwXyJJ91gEYqXUW4q6J+0=;
 b=MDlKegTwXVZbay/EUVQKu1kGyVcRfQZSNqxxna87bWM+97I2Y6CTYjzm
 zYzCg5WBzsrnCa2AzphcKGmJjLRi37Y0SY9MgtI9JXYotvP1C/6Zyt05+
 +poJjXXLqmLFfI1dlCfKCrN1GgwTadhNuh0Lk/9yKhURgaBxnWJYYikzA
 VeOEtvVgQz/IVY8nfucFt4igvUEptIYLbF8pL9YNjk2O92g1kFZ2B1F0t
 wF4id4kJ4PvT/qBEKpya0ZWKESpyeqzLmVxyAN8s9EqcW+m6aE1m2S51f
 6d4oN5fOMN9wuo6Xp625LIC9rEnaSlSAhxI+cE+emJOsJdS0/zE48ubPS w==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="208696399"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:17:19 +0800
IronPort-SDR: aGf6IB0FpdSlYpGW9lzpCpsP0BOB3+Ry64Nrcvvv8vmzgVaJ4kmMOAER1ZbMYig2KDltU5oQyl
 cfttOVhma2cMun/5Z90KQUyoThrqZrko70dyNDCox4ZCv7OWE5etScFLyLnoIorLTSiNPVgmY9
 M7Rrm3UbzOVT1uPoYWCkmV9+kgKhokytjUr93K2oRAaisiYoHiCjjK2FCbkMYuJZws//b7Vdos
 84E00xUk0w8cmFMMWtqapaQfaz3gnFoBuhU2nRj4ZtGi1mwjxO7jhUWZFTwKOoctpb7M8KWb8Q
 gjrVEniK6OifQebgXt6+va5O
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:38:09 -0700
IronPort-SDR: 3ePTHMKWDK3xTfE3o5PF3kyTbAOOPLgctWAqcmQ0o8dV6jDL9JKt4O2ZPdqxkeej6VgAVr/TWa
 r++5N4N0FY8h0AP6RY/hImD0TNTJafHOvCLbmofsEZXCPkUqjm7e2lNfK1ZVCfuBCCwRrcle41
 +P9P7bInItHgkpDdM0/u6lBK+OinmSqBFoHfBNeKZSI8I1aFzMzK50klkYFOaLhYJEVb2YltVT
 xMg7yFtp78d/2FYskWJCDtVydb22PgcjTG0StefXci5uhaol+Ag/i00/odWOEVZ7e4iVhBKc8v
 0EA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:17:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fbM4l7nz1Rw4L
 for <qemu-riscv@nongnu.org>; Sun, 14 Aug 2022 20:17:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660533439; x=1663125440; bh=w4GzVfAkvrf4UkgJX3
 Gd2cdwXyJJ91gEYqXUW4q6J+0=; b=ejr17W+ZHwlN2idAZ6lsD5Q+Gpj/nRUc2I
 4o6enwmGZqjJ14zBVXCaWe4lJ2CVyKPVCXMBxDyKGimAe441kekcY6zqKua2CGgG
 1xjzIbxyu2xIeGHnJHw2Y9TJpIJDKFfFwJiXJ0EVmYyVqAqDTctPKdv+CdN1fYuy
 /kKfMhGY/kZPfsfnWQiCvrR808KUQiijU0YlEcn3jRoI7+sT8PS1pRbiw+dWgRL2
 oXEYPCN+VThFSFibWcVmZlhqjFimVl9MTQOCKeqU2HSJlVwdrTVt7M1ECu3UGqLv
 lap/xh8naFlCXe9ucIm9x9kUJVFiSrT2bTeTNu6e9+GGmHhwU5qg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2ikfrUDuD2Jz for <qemu-riscv@nongnu.org>;
 Sun, 14 Aug 2022 20:17:19 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fbJ4v6Dz1RtVk;
 Sun, 14 Aug 2022 20:17:16 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/4] hw/ssi: ibex_spi: fixup typos in ibex_spi_host
Date: Mon, 15 Aug 2022 13:16:22 +1000
Message-Id: <20220815031624.170857-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
References: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Mon, 15 Aug 2022 03:17:25 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch fixes up minor typos in ibex_spi_host

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/ssi/ibex_spi_host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index d14580b409..601041d719 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -172,7 +172,7 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
                         & R_INTR_STATE_SPI_EVENT_MASK;
     int err_irq =3D 0, event_irq =3D 0;
=20
-    /* Error IRQ enabled and Error IRQ Cleared*/
+    /* Error IRQ enabled and Error IRQ Cleared */
     if (error_en && !err_pending) {
         /* Event enabled, Interrupt Test Error */
         if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
@@ -434,7 +434,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
     case IBEX_SPI_HOST_TXDATA:
         /*
          * This is a hardware `feature` where
-         * the first word written TXDATA after init is omitted entirely
+         * the first word written to TXDATA after init is omitted entire=
ly
          */
         if (s->init_status) {
             s->init_status =3D false;
@@ -487,7 +487,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
         break;
     case IBEX_SPI_HOST_ERROR_STATUS:
     /*
-     *  Indicates that any errors that have occurred.
+     *  Indicates any errors that have occurred.
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
--=20
2.37.1


