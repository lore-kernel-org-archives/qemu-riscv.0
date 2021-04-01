Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRz7H-0007EK-Dw
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 11:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz7B-0007AF-BN; Thu, 01 Apr 2021 11:20:09 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:10230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=718ae7c5e=alistair.francis@wdc.com>)
 id 1lRz78-0004o1-MN; Thu, 01 Apr 2021 11:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617290446; x=1648826446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MqMsiLhFSKM1kLtvUh6Jm0AXIxCncv22CCRXKda6ivw=;
 b=r0Omzio3GXFhn5yBwenkcNjH/Iaa5I8ieVQGOhr3Dr1uxjBHmov4jj5p
 jKIPiUXRZDSRaHel3C8632d0Vzjyb/HmY6UaLaBV5Tqh+mMUFIST+ALZx
 01Ry4sxCuUt2rJWp7SQCs896GVffFYFnCXEqhyYM9sIhSOfj9PfB9vyw4
 TNIlT0YvFRSneAXoIHWaw5xT2lrAvycW7iBTEbrkmTg9qU9XJRNcuz5+U
 J6OQfOX2FqkhXfXZ0n4/DUasyBnoeBkdWAPnwNhso/igE+xtpZXvcAmq/
 KNMmt8FCmYoA7GoRvf2KbzIzPmQ0ysW8YlyUPJvDHywXc5UMO8CSfJjhh A==;
IronPort-SDR: hTMnSDKSQWB0CAz4PJMX2qnI2CKLCPH2ln8bm95TIuBulJckjIJfFvRd2hYJiWwiUqmdA6ZAA9
 gz5MMOI/StLMzjumlVKiWNsOoSRuZtUafAk3UGaC+Jp/wGz8c8jEdJq6c6lFtEoTDytjn8fuzx
 KKdKnHRmlFonlgCyh9jq/wrZh8Ui8+mCyZHOgc+MKmBszvgeX0FKEuFUU/EMcz4Ty0TcNO5PGo
 lqSrNdcl1jGaKlPkhv6GMEZFrWzmKbZsMB9XLeCt4eh/1X5r8pzCeQ+Ik3S3P9y0cQV+zRUtPI
 lYg=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="267973372"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 23:19:37 +0800
IronPort-SDR: X78RzwfNNqSQ7ffNF98Fb5wrf3xH/zAKVhmHzNQy+ks+5jZTq/ulRkc1duspkSbCOyyDZVco2N
 5+8uzO/2BJzE5y+b7a8/9X/ULYNVhCfPP5QDEw1XxidDz2dPtpL64zMFjta1Ppqdsa5O9eW/o/
 8k9q79GZFFBWyeIhTnd2RXTjCpCgLtn0SqxlJrLn62KVXUnMDIDPMhZeZ2dqdw6XFG0yde4IZb
 rT6803ZaPOVo6jVQA6xbv8AzaD5u0N1IN3jyLZwQHDmau1JqDMfQvRgoKcBOHtBAJTP/uniHZM
 BK9jRut7b/cWA4cArZxvNmSy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 08:00:52 -0700
IronPort-SDR: nObKNaKHBj6o5tsdjLrwXhs+1tTdCHYmXvYnNhucreMVsK3t4t6s/t+wEXf9ngjg6dvvjfQcAw
 WxQulP8rfr11gj98MACdGamk8Hd3e8UWrSeewfRjzPqFd0n+ohsw0tfsqCIJtZLHn95nqICJQM
 pzkjMLWwltV3QRlTJSUhNuweSrQ/LRctVD+ny4TomLwbg9Jfndy/wsvv4qOekl3N78QYJPwALn
 zqPaNb4tHhtaiqAAhKkIazo2gyvDNSKQqfYqWicJsGgkFTEw3lU9YahTIzpcBCu3WMvW1x2JUy
 YXo=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.75])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Apr 2021 08:19:10 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/5]  RISC-V: Convert the CSR access functions to use
Date: Thu,  1 Apr 2021 11:17:20 -0400
Message-Id: <cover.1617290165.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=718ae7c5e=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Thu, 01 Apr 2021 15:20:11 -0000

V2:
     - Renmae the enum
     - Rebase on master
     - Fix a few incorrect returns

Alistair Francis (5):
  target/riscv: Convert the RISC-V exceptions to an enum
  target/riscv: Use the RISCVException enum for CSR predicates
  target/riscv: Fix 32-bit HS mode access permissions
  target/riscv: Use the RISCVException enum for CSR operations
  target/riscv: Use RISCVException enum for CSR access

 target/riscv/cpu.h        |  28 +-
 target/riscv/cpu_bits.h   |  44 +--
 target/riscv/cpu.c        |   2 +-
 target/riscv/cpu_helper.c |   4 +-
 target/riscv/csr.c        | 740 ++++++++++++++++++++++----------------
 target/riscv/gdbstub.c    |   8 +-
 target/riscv/op_helper.c  |  18 +-
 7 files changed, 492 insertions(+), 352 deletions(-)

-- 
2.31.0


