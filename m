Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oYPN9-0001dS-3d
	for mharc-qemu-riscv@gnu.org; Wed, 14 Sep 2022 06:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPMz-0001Yg-24; Wed, 14 Sep 2022 06:11:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2494fb295=alistair.francis@wdc.com>)
 id 1oYPMt-0005ve-Ti; Wed, 14 Sep 2022 06:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663150303; x=1694686303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4fE+Nu6cfo9MwOVZEMLpBUSBjg6qBC0SbrgpmYBFgyA=;
 b=l1WOs/4KVaL9pkjlfkR6PYq9UWSxB8Be8zc/fs4izYwyAqBe8Z0lzxyf
 UfUgCa337Elh8yiEQn/pNGHaSUeoeiFMbIDJnLYSn+L7tYAxb1FbdK22Z
 D0m+34E1hpbVjpBJLZasbeAtFkqHGGfQRucOOb4GYHH5EHCpSaOinAyky
 9MO2OdRS0wBmtAroDJJEsPMUSEnPD86O7RhQFjPQEVkJ6KcOVYmgvMb6K
 Y6Pb49Pm45K6nsjRbsY3i7AfUetc0d6EeyO0HeKcQuf33uDWgHgcKMjUy
 zWqEF7l2Ga4JGAHXPvyg5eVbzcPvU83jAQUNINZ4PyW3X07BquwuL7MF+ A==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654531200"; d="scan'208";a="315604479"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2022 18:11:32 +0800
IronPort-SDR: 4ccm03LIUplJvl2WP6a97JrChbMFmgUkSxjvpqjFUV+840iXYBE5fz6XDJakvXHvbxfprDQz19
 6xoVqAQ27kcV2u7niQkRTq5webvCRrDDpVCNO5gLPluJ/JFoWYX6lQXw1YHzvvOmYtM/zHFvvk
 fj/CAnI31OvqqVbCwdRvyPTekJLkdXkKfA3Q2BBz0bVAgbO/w06uuWb5PGJoONeZtERyu+lYZP
 /65GO9f/w2RbjEjzOBVE2t4nUKUcAo4TnULF11NeCzAbsT7psgREQzv5FV194ADo5qc10NP1kT
 m60d1wRe2MrBbf0hunUVudhE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2022 02:26:18 -0700
IronPort-SDR: 1ulWRhZeybZ3zZ2Eobdhfm2bU3JkBdr7ehcb9yKvDyFL9qlHQQgxfmIdVSlsx0v/tgFMxwl1vy
 4Qe5P+ziN5UO1aOW4PCyVpE9Ek3+KKC/2uVl6omV35WSF2tBlDBI51f3tjkfLwU5yRUVHlTPsQ
 gXvYL6OQat/88auiCtjvD6CybkRm8ZBb7pPEWQEoq0PL4bEvYO2i35axkDt0tE+fcOIvHgdcw6
 6USHU/Lte6pte2iYVWBGZlfNv5JrNippCESBI7inmNaWrNOBibRupvVSKiFYJq0TegZWJN6XIS
 9iU=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.107])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Sep 2022 03:11:31 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
Subject: [PATCH 0/3] hw/riscv: opentitan: Fixup resetvec issues
Date: Wed, 14 Sep 2022 12:11:05 +0200
Message-Id: <20220914101108.82571-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2494fb295=alistair.francis@wdc.com;
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
X-List-Received-Date: Wed, 14 Sep 2022 10:11:54 -0000

The OpenTitan resetvec is dynamic on QEMU as we don't run the full boot
ROM flow. This series makes it more configurguable from the command line
and fixes the default.

Alistair Francis (3):
  target/riscv: Set the CPU resetvec directly
  hw/riscv: opentitan: Fixup resetvec
  hw/riscv: opentitan: Expose the resetvec as a SoC property

 include/hw/riscv/opentitan.h |  2 ++
 target/riscv/cpu.h           |  3 +--
 hw/riscv/opentitan.c         |  8 +++++++-
 target/riscv/cpu.c           | 13 +++----------
 target/riscv/machine.c       |  6 +++---
 5 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.37.2


