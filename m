Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzBaN-0003le-T4
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 01:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBaJ-0003io-0y; Fri, 02 Jul 2021 01:19:28 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8103b7a7b=alistair.francis@wdc.com>)
 id 1lzBaF-00008P-LJ; Fri, 02 Jul 2021 01:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1625203163; x=1656739163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sDhj4FQFPRFqgsrv21COZV4eKOp8O1Hf58tzemRYuTM=;
 b=O54IivkMkNWuv7u/w+hSMBXNc5SHtey2IDqomH9K7G1qYTpX2kcH6vCG
 m9ONzK7wIViXWXr35ueBang9l5UyJN4kQr/Mxt285CyfxG3B9Lorj2gK/
 JJGrVyhWNj9p8B/aJRLUQml/fg+JGaSTi0a+ZJ71U9dZUBYGVLDvh50eg
 Obh4hl7lHGGiWUEAqgtSNHu0XLMsyyGIQV/AYHk/ZttZxZSdh19QPsC5+
 xFH3aRpc9ARurJFXc0syut6UZ1/DZvsCR6wEW6vA4Wx/wRX2UuMybODOd
 ocCfaTCoyT98OztgUs4SeHeArkMafwgyTpVNmLTt4QdjIwo+PrFXam6Jx g==;
IronPort-SDR: fzHzHqQccNHDrLaFiXayjA+ZJo49HZeEaWFkMJ3jPuADRf83y5JY2gXuuvuJZQD64jrdH17uiZ
 +m+ArExkNGQx6AkJ3GLYPSjdN3jHp+q6GuyokBfea5wltj47xcUIZyVe9moUy3gw35gGRm3KMA
 YwHQUh7pj6BOuzpvFQTZrSvR+cRQpVRNZZqzF9g08cWg6UHIcYkRA/kTdt8fn44ZnManVtNVUV
 AHFWlbB6PkL0f66KsU0UsqQB7KccytaITCaiOozVfYYO7J5Yglod2gGXvxWcyD8EZNQIqBebhS
 nng=
X-IronPort-AV: E=Sophos;i="5.83,316,1616428800"; d="scan'208";a="178330260"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2021 13:19:17 +0800
IronPort-SDR: MZVFyJXJi/ZsAO4vgW97t2qTOnnK3f1u3dDP7wvS+IoxKedxSVceoZ8MHIMjnb2B3G72i5qN5J
 mE8ejWQ1Pis2gL4TRxQuaW2UcMikUSkLqpcIBuuEcPq1Tpsjh3qOalMU3to9/e/rXPW6WGPhx9
 TUcbO4KItk6Ne/gpREaHAY+qWGWRIn+DWwI/o2I0qNYgUs+uFo7AKUy7CjOnebLpuYZyTWcjBE
 ptwipETqOZ29QXoG5TweOl64Z0exV62MXcmqz19uRH56U7X+EvAXyq2M3/DXAa3lHMLuV/s8dB
 /7z29821R5vdBWUHI6iG7Vs1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 21:56:23 -0700
IronPort-SDR: gUeCbTcZ14o1pUegGEKqsKhK2mXcKh2YpnvXFPLF7BGq9+XgW7RIS0tCaB46dsK1Jc/vAG6hH/
 9m+TOSuSNW9eQuplrNoU/axcsHuoCvZlBqnB4jV6tPcawdnNCnB2Pgnc3oKFwuWhBAA/6gy+mz
 KccfpGgZPWahVPq4rTdOjmwBhwgib0FR0VufwXovgJTpqax1Q3S+wQEuSddcvu1Zz3t2UQV4I7
 bYa2fnoS0JX2QsLt4SiTCLSq1ISZH8YqpweWN40+vuSEF7ZXZA2nO4CBtrKuhYcUevIg7Ol00p
 t8s=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Jul 2021 22:19:13 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 0/3]  Updates to the OpenTitan machine
Date: Fri,  2 Jul 2021 15:18:35 +1000
Message-Id: <cover.1625202999.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=8103b7a7b=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Jul 2021 05:19:29 -0000


Alistair Francis (3):
  char: ibex_uart: Update the register layout
  hw/riscv: opentitan: Add the unimplement rv_core_ibex_peri
  hw/riscv: opentitan: Add the flash alias

 include/hw/riscv/opentitan.h |  3 +++
 hw/char/ibex_uart.c          | 19 ++++++++++---------
 hw/riscv/opentitan.c         |  9 +++++++++
 3 files changed, 22 insertions(+), 9 deletions(-)

-- 
2.31.1


