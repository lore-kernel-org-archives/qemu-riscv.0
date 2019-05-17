Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRl6C-00082K-OO
	for mharc-qemu-riscv@gnu.org; Fri, 17 May 2019 18:13:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=033a92d29=alistair.francis@wdc.com>)
	id 1hRl61-0007tp-Ci
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:13:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=033a92d29=alistair.francis@wdc.com>)
	id 1hRl60-0007Kz-FV
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:12:57 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:8700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=033a92d29=alistair.francis@wdc.com>)
	id 1hRl5u-0007Cj-5s; Fri, 17 May 2019 18:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558131170; x=1589667170;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=RPawglhrHzG/7peC8AZqsKuO5CHp1JP06eIpaNNiivo=;
	b=WEC98wOzTuX/6SZmR71TsnG6pzey8bcC0rkZRajpBKNTyVf0HKQdFYWC
	BNDnxz23oEkPS0fCBV57T1hgKgvsKNsG9U3kvQv4sdlpKkCB5oO1Et9R5
	OUuZDf2i0nywEADf8TMVVoO/BPFHKJt6oy+nhlX9zTVp+DIMW00kKC2gS
	ZfpXzYW45BgEzIHa2s527g6GSTmcgHccOzIe+usLpAnhpXWPn1jE/pqYV
	VXYY1Q0bm8SucTWM/rBi4jXFGwaQ9XcQlrEuU+MMdZPSoDFiq48dh+1oO
	R9sVNhfnd065LiCLJPD3u3UYiLteDyHr3HMSm4B8j5t+wBy0OuFY3GLn3 Q==;
X-IronPort-AV: E=Sophos;i="5.60,481,1549900800"; d="scan'208";a="109789991"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 May 2019 06:12:42 +0800
IronPort-SDR: Kal1SyPJNj9JAXRzHz3wzY54HC0+Cbcd3RMoajuK/SVvjbH6l5YwuuNpadPHskt+2jQDSIHuST
	+YNkVi3fWXoGROE4goNhgnhd2gn13VoInml6JYKXKAK7przaM2Sz1sfhmQhesaOXS1UNRWhhCh
	5huXYsLcq/zJwTwYLC6ZW/TM72lLmds0kpAJo3FnWEErfA+HOT5hNYWX7SjPLeam7hcmYGy3zS
	lN27/ekkGKbGxzUtMLyF1tQx3F7Gnh7ehkV6zTljGrKv12OcbMKGOrJzK//YWtU2vqY/rE7UBd
	yD4iqgHZ+QUSAN/+4WFilosZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP; 17 May 2019 14:50:34 -0700
IronPort-SDR: rFKZFoKrdfHmgkL47DcLq5bNNFP/XZLIksWdoz39j8lxNp0xKdGDpNQzJzx245fmftdfjqJ3K2
	fKMWouC2R34k2CPHbZL4qC0Cah7yO18E7okEzR01jpRLYN3WoqE8WGOqPKT8sgWayZxXuuDC0C
	cq5R9rdVBciHb2nju/ntXY+dHbknrFmTFISufAyGoFsXfjUCHy7+7uMpOz/Mo1OcE4hkCBjmn4
	MrdCigqsLdXzPrdbNE4i5CVYXmQ5Eyqr3oPh13Kxf5u2gpkpCvI3BmBV7dKqptwt4n6XVeO8NB
	Svc=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 17 May 2019 15:12:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Date: Fri, 17 May 2019 15:10:56 -0700
Message-Id: <cover.1558131003.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 0/4] Miscellaneous patches from the RISC-V
 fork
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2019 22:13:02 -0000

This should be the last series bringing the patches from the RISC-V fork
into mainline QEMU.

Dayeol Lee (1):
  target/riscv: Fix PMP range boundary address bug

Michael Clark (3):
  disas/riscv: Disassemble reserved compressed encodings as illegal
  disas/riscv: Fix `rdinstreth` constraint
  target/riscv: Implement riscv_cpu_unassigned_access

 disas/riscv.c             | 53 ++++++++++++++++++++++++++-------------
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 16 ++++++++++++
 target/riscv/pmp.c        |  2 +-
 5 files changed, 55 insertions(+), 19 deletions(-)

-- 
2.21.0


