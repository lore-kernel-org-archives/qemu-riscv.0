Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHbLq-0001Hn-0N
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 18:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=3472fa30f=alistair.francis@wdc.com>)
 id 1jHbLm-0001CM-Sn
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 18:51:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=3472fa30f=alistair.francis@wdc.com>)
 id 1jHbLl-0001LR-UT
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 18:51:46 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23225)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=3472fa30f=alistair.francis@wdc.com>)
 id 1jHbLi-0001DZ-SR; Thu, 26 Mar 2020 18:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1585263117; x=1616799117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cx0sbsH5WZU0XL1xvk5K9rUby/RenU9Pf5m/Dm09K3o=;
 b=KSy5IDwbCVrJv1vvhpr5iTv4I0CSO5sa8Mas9YB+M5+cSiUnF2Es2Yc7
 lT5C9W6gYSe2/yZ6kGWqiaQh1mgkhSMQKp/jZwVXs/o1LVIoiBTw3veTv
 uWVP5XSyuMsUo90F9ku/N5LGkDaP53ruriZj4U+IfHy7vASOwcXDUC+pD
 tG8eEsYI79c4mc8DTRVJnDmNloy69tqC6f3tZUjzEPRWQXHnmMDYpo3vD
 8pslTm/sgqkavsFTi7boBB0SxJj3V3a+NPiQH5PeGzbuj+Cm/ooMVZNby
 DakvfhfBTcwg0oiKHZxw+8c+TkTSnKiFieQt94CjQUGvY/YBgHdW+5fWT w==;
IronPort-SDR: 3f63lRvU3jVA0fKqBKjlrwtHHcO+gGLbgVBAI/460Chin1wlUZ156O+dxYssdLrZuDKQQ2LX3o
 xxzwqhRDlhvlFXRe8JNF6RVscd/Lzd88dP/AyLWEXk6LBFg0UWYDEFUr+cGH1YkCCn/N1BPaIJ
 +qzPTOycDPXxgt8N3N+NNUtSE63MzBs451bvVadMDRDx9TEiFz5zfN2fK7Pba+PD8J4Pj6F2Dd
 v3XDW629drCOTEPXxWrEDMOyIIj2wEg1TJW07Jdd8J84ck+eNMGS61l5pJFD4zoxku8tEm15Ex
 hpk=
X-IronPort-AV: E=Sophos;i="5.72,310,1580745600"; d="scan'208";a="235858175"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Mar 2020 06:51:52 +0800
IronPort-SDR: 5tGSJxNxSs773aGbxe9PiJrY5tt1XIXZX2Qq2dXzRKemY0D8p9htZxtF6xab7NWf9L/FwA2avj
 5DwOoE4RDJTgfAzl7riSLIDDCzdT++GWYC7XJ8Q2v8Qqgwnd72nAe1cvNDblM3+Uup9GvfCPe8
 ksVQb9t3dv+2Jbb4QzIkumUAj6dLik/QnAMSJULcDMPIw4wLZFE7rR1dbo0Hc0CEJcunta0DdT
 +4ze4yygYtHi5INe1uvkZVhhf5Wge/dBQKoKj/MFSYDKOg7g5wcFIPraaruCuuSZ8r0EbJ4gB3
 QVXKayTgQJbEqYRHJRMAGiVE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 15:42:41 -0700
IronPort-SDR: zysQK7Gk4I6cDx1oM3UkMyS+Vyc7baA44FVlzY6axaHNvQwSdS+Lpz6/CYnwxccfTwvyBujhv0
 efaGQ8xk3aGTRMpptalYxnj2FS90uxv88tzsRr9R3Q50sPp2LK2PKge9Wfvu9XMckB94oZiYxd
 R8XioFrbNlJOxFW2ErDGDbCmX0Yym2IpjDdCFXXkgflICxtzLWYTNhVYOe2ZbKDSGGZfi8Nt1m
 w8vZeA0FHMMlyfjruGCMAcFjyJSsoaIfHk5DH+oU98EiktofSsbgsOC5QDuw1wOhEOVheb+2wa
 rxw=
WDCIronportException: Internal
Received: from 2j0d3g2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.54.250])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Mar 2020 15:51:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH for 5.0 v1 0/2]  RISC-V: Fix Hypervisor guest user space
Date: Thu, 26 Mar 2020 15:44:04 -0700
Message-Id: <cover.1585262586.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
X-List-Received-Date: Thu, 26 Mar 2020 22:51:48 -0000

This series fixes two bugs in the RISC-V two stage lookup
implementation. This fixes the Hypervisor userspace failing to start.

Alistair Francis (2):
  riscv: Don't use stage-2 PTE lookup protection flags
  riscv: AND stage-1 and stage-2 protection flags

 target/riscv/cpu_helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.26.0


