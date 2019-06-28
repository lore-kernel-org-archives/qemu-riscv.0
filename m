Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgtZe-0003ta-1E
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 12:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38323)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=075cc3f16=alistair.francis@wdc.com>)
 id 1hgtZZ-0003q7-29
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 12:18:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=075cc3f16=alistair.francis@wdc.com>)
 id 1hgtZW-0004PB-RA
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 12:18:00 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63621)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=075cc3f16=alistair.francis@wdc.com>)
 id 1hgtZT-0004It-IR; Fri, 28 Jun 2019 12:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1561738741; x=1593274741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s9wRAO6C8hWPO5VAyLqjZCKMAchxKjpN7eIm/4AxpTY=;
 b=DtdPoa5DdI/O+eGsQGKhosVm51C1jYQptsT8LXeej4gOmcfEX/XO6Yak
 GU19d1NOmdLQ2by9V3EVY3KhvYaqBrt+cvi6DTpTkFZygxooYpnYwHmMz
 iidtUURMfF07h0YPnKMGdMk9PJezktvv3q0ES7rzesvTrj3ANCD2Goccy
 u1bDmm+evVuSXJqzC5xYJRvzLLg172GHOMBpso00E4TXNvmhW0x+Eabwq
 djw2ty8jq6jY0s5DxB2g9W5iQy4khZOjUNs5C4n/hiUs49X0UlwA1y80/
 aKXt5SuBTMMmyTpGUbTqmmZxzXDT6nTwdXMxDpH3Ght0FPd1esGzGR2WO g==;
X-IronPort-AV: E=Sophos;i="5.63,428,1557158400"; d="scan'208";a="211619633"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2019 00:18:42 +0800
IronPort-SDR: 4poUFJKLkehlElB4ml2LBEsOC+1k5e1lnyK1cMRiTqVXZE3WFQbBAPrxMqKynM+RiV8LDA015S
 UwPuzWyESeeyOxXZSiQoFZqWDlMEe1vK+Y3LxkM1mOZX7YrjK4zxUxgIynnpMQ9v1Vm3yaRNOJ
 fQP7TjzXO2oLmw3ve21MGvAhZkVXOY3o0L+jwgBTKbc5b9L/VphcNNRh8CRYOusoOVOkosmlwU
 EX00yxw3ws5ful0MYoEiuGYy/kgKXPcwuGieGtkmqAoGw+3sVZl5SXPNKvX/y4fMQ/84fEqBJ0
 8IkfHPRm7gz1j/+N+DpRGRk/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 28 Jun 2019 09:16:48 -0700
IronPort-SDR: XUtBhMnO7xi1KTZ892JExVz2LtgjRVBTbT4TE3f03+PXE712QBWQXQMSmZWv/PxBTFidHMSwH/
 golFUsmnPLf1GlY0MEnp7n0apX+oHzZCxRl7fAs4pP++OrzAxzAP/UjwMrZv6MQ69M/swXwIdJ
 2w6CiQs6Qknszgj43HE8DE6llQCGixIzJlNOFGyTcPETOHl1FDYV1srUtfs/nmfd5obC9CZ9LZ
 XFzVQ9WcfLI9+lfuUOwOM4hQkrBIKzunzMS+p/EBmdp6KgUXs/bvf+zrkdW6sUa+ilCtVnyxzB
 1TI=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.140])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 Jun 2019 09:17:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	palmer@sifive.com
Cc: Alistair Francis <alistair.francis@wdc.com>
Date: Fri, 28 Jun 2019 09:15:03 -0700
Message-Id: <20190628161503.16760-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH] fixup! roms: Add OpenSBI version 0.3
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
X-List-Received-Date: Fri, 28 Jun 2019 16:18:03 -0000

---
 roms/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/Makefile b/roms/Makefile
index 562ed726fd..dc70fb5aea 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -179,7 +179,7 @@ opensbi64-virt:
 		PLATFORM="qemu/virt"
 	cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-virt-fw_jump.bin
 
-opensbi64-virt:
+opensbi64-sifive_u:
 	$(MAKE) -C opensbi \
 		CROSS_COMPILE=$(riscv64_cross_prefix) \
 		PLATFORM="qemu/sifive_u"
-- 
2.22.0


