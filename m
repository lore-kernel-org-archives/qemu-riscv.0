Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvZN7-0005c4-H7
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 01:27:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN2-0005X1-Qu
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 01:27:04 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:64254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN0-0006Fg-O6
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 01:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639117622; x=1670653622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mQ2cfmmWBb0w1+UGiKq5pAvPGgH1QD67RwSn7Kb7js0=;
 b=HB240CM6xnQQW3JoIi/ew3mPq4Q/N0kaB6TWivf5PzaVYLrZmAAy2pGx
 WYWchGGE1nckqSLBozwwYW/mGoqdu9rx8wj6D5a1+tWSQUQr5Wyq/TwEa
 liqlkkEKd/yjcnAL+BFUgzCjogvCHiqU9uaQ3MDGreg/RwG4/c1j9tlFd
 SJ7IAEYPlybrNt23iA2BuY8JbOmpRvLpacFeJH+VIasS7JnYT5pjzV93K
 7MSvilpeR6n8aXhZpnEcnZvyRC8vTCMAgtW+rUEVgFAknNXldxbWENaaS
 wbfHtIkrigzFRjMyV56RX72YknijAjGJloRrvOY9qE9eJ8MwMdzawEa1/ A==;
X-IronPort-AV: E=Sophos;i="5.88,194,1635177600"; d="scan'208";a="291899829"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2021 14:26:56 +0800
IronPort-SDR: xfML7L57dv2CYlYCqY3NRaNlh9d2kpQuktU60fWs7cQlqALRlBCANkyl+syrG0F+YUEY2T3MFm
 2y/7mRKYZZZ2EOR7EylsfyRwtGw7ExqFh7Hmo7NL4mttcgnf96DyLzQICxYZohkhLeiqY3Fg6Q
 zHAFvP3xlm3gylNcjYj6HPUqQ9oBXIOTbzNLoqDR/RVJlKsmoyLL7LKvRR1U5bZrXtVP0dkfcp
 99eTdi4oqsXZosAzM4axOktl4xoFJAB4pixZ5Ld/RIYLGZZrLV73d30IL3eTQ/ftzvFaTXf6gs
 cMVelm9ArwtOJ8l5fT7bqPld
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 21:59:58 -0800
IronPort-SDR: axBS72ldvQMxTiiJqT4o3Hc/6f0jCo48JrqqPUPLVe8bEY4U2xMGVDC3E4ycgerRNj+QkkjrYJ
 rMkK1CgV4AojN86gzKr9ahP6AUlnqd4G3DfE6JJ+O58QRJw3yb1Qr/5+A92ZwGALM/x0YkkTRI
 1yjQ2AR48Uk5WvE9yQ8+BMwc3fdBUuRa3mLT0KQTS+kTQBnPtr1/Blg7ymWCZqsYb/9ITqggX7
 k8/TBkaiXR6aSJAnALiunM+N3M4J3BENIWiY9F5f+iOsgu8eFP82ch6mUnNBWFgDmCHNRJRC0f
 4eQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:26:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J9LXc36S3z1Rwvd
 for <qemu-riscv@nongnu.org>; Thu,  9 Dec 2021 22:26:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1639117616; x=1641709617; bh=mQ2cfmmWBb0w1+UGiKq5pAvPGgH1QD67
 RwSn7Kb7js0=; b=tNtz/ecnXKV7kAtBxksisJQ/AEixbyzdWTuE6FLU0J1uE6dp
 6R4r03iATmE5CTuxLmoW7GIRjtS8uB72Hv6x/bAxmaduFIVe++CNrIQ11LhMPNWs
 YDVT9EGlP1tqQGDo5RUOjWZjjMxAVRZz6jOFWU0N3AIIHjxJfWKxmg0M3jt4bEf+
 3awFwa+P05TTo8kxs+CELLzXhzIy91oGr5k9BDp2wQ6PeYP6pS0Y9+5Vh03MSsza
 djGaRBKZxxcIUZ3ThZFn5vvBhrEA42j/ftIOAZG029dgNACiAlk4tRCqOFQe2Njb
 2IpKqDvIjd2ZmFgcsKrEvZamcNn72qOvv3+WDA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kHHpMhXIGxE9 for <qemu-riscv@nongnu.org>;
 Thu,  9 Dec 2021 22:26:56 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J9LXW48m8z1RtVG;
 Thu,  9 Dec 2021 22:26:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
Subject: [PATCH 0/2] RISC-V: Populate mtval and stval
Date: Fri, 10 Dec 2021 16:26:36 +1000
Message-Id: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9719c98f0=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 06:27:05 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

Populate mtval and stval when taking an illegal instruction exception.=0D
=0D
The RISC-V spec states that "The stval register can optionally also be=0D
used to return the faulting instruction bits on an illegal instruction=0D
exception...". In this case we are always writing the value on an=0D
illegal instruction.=0D
=0D
This doesn't match all CPUs (some CPUs won't write the data), but in=0D
QEMU let's just populate the value on illegal instructions. This won't=0D
break any guest software, but will provide more information to guests.=0D
=0D
*** BLURB HERE ***=0D
=0D
Alistair Francis (2):=0D
  target/riscv: Set the opcode in DisasContext=0D
  target/riscv: Implement the stval/mtval illegal instruction=0D
=0D
 target/riscv/cpu.h        |  2 ++=0D
 target/riscv/cpu_helper.c | 25 +++++++++++--------------=0D
 target/riscv/translate.c  |  5 +++++=0D
 3 files changed, 18 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

