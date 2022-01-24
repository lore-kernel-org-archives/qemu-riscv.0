Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBnkK-0003K9-9v
	for mharc-qemu-riscv@gnu.org; Sun, 23 Jan 2022 20:02:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnji-0003Dn-RS
 for qemu-riscv@nongnu.org; Sun, 23 Jan 2022 20:01:34 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:31092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=01678aa48=alistair.francis@opensource.wdc.com>)
 id 1nBnjf-0003kC-Lr
 for qemu-riscv@nongnu.org; Sun, 23 Jan 2022 20:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642986089; x=1674522089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z/jLsWth+gcXxCWJwaPtYp6g1S1gAjwBId85xThuZkY=;
 b=K1scaEcYhAqZ4vJvFAFfAOpoycXmpTbsqfdL7RObSRoYBE+CX2verx9+
 tmRPJBQer5YHSh2qNCUZUKC6lDq59MJg9D4UsU49cQfhhc2u+d2Gg7Wum
 jpzNfoB0P7o7Sw/saBy4gJBvBi0umycOpOdOTTAde624+mQo8FAsjPF0t
 XBGKyqTqSovyKiUBAy6CE4dM1773CnNN9yCvrUu42ia7cDy/9mYyUpc1A
 5BTf8AOlveXJYH+MYD8zCK5XQCR7P+Osr1BLHmufGsUwLcCWNykFGfzpo
 M52DE1w/OimWhQ8h/PEU1Hk6Cl5izetgYNDGM/QuJi+Ba6+zXVLefgKcE Q==;
X-IronPort-AV: E=Sophos;i="5.88,311,1635177600"; d="scan'208";a="191176029"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2022 09:00:12 +0800
IronPort-SDR: DYxZ/KJjyeGNRLJA/63HFL6M6tDLAQFw7IcfbttOco6xRQoBjFdN3r4bm3z5wLw4yDDYCvevM6
 nUWI9voYcx0pLtQX3rAyZ4V/mxl2PPxcz9WNKOXGW22W3sQVFH3aemKUTjLzwz4lCIbnYvu7CB
 fYmz6txGLgPIh8YzoZwhLd25zpnVmQ4E3BJ9n/ZxA1zLVPBYEcBMQZF2rvwskJUXw+bqNrIvRk
 ughJEWPLn6xXWJWyMCRf0OqeCBhROMC+XodlTyffYN9qNpp07yFd5QkXB0DNMl/qt4C9/vRWqf
 u1q7PvrN5E5ZZS6zPRg256yl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 16:33:35 -0800
IronPort-SDR: wXPHkHbTbfKramSlb90AXengH+kCSaBfPSIIwwF0xjafBtqa9OkeErnAES3ojxAywuuw2O0u6M
 qESzdaETws+7UbTEVsAPirqH77ssdieel/4kKGKizaXlP3kE3jJO4bFgVp0hwKcWdkG2xuTaLC
 KwCOA6rpSehdxiTJ0tiJWh/oVVtq1ynK9GgIJlCo8M6SCRCLPyfwqJJGocOuccA/xiCbExYMF6
 nMSJoJ1Sq71l+l1775zm8fnkjgky+OMRA0hnZ0PnfCE0i7RzyLMO1EcmbJibWs5LMLmtrlaOh1
 XfM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:00:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jhs8r0Wnhz1SVp1
 for <qemu-riscv@nongnu.org>; Sun, 23 Jan 2022 17:00:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1642986010; x=1645578011; bh=z/jLsWth+gcXxCWJwaPtYp6g1S1gAjwB
 Id85xThuZkY=; b=sFS+PvIQWUrRixa5Y0YCWO+KXLFu1g+UW1+WPMq1gJuEefVH
 qpVZ7OsBT80TaU643IvGlUl9ZqoGIeowUU8Dkx0mMBr7EKR1yTVqGvjnk5xjMtjz
 4bHluIOMqjZYOA8qAlvs0e8dqQp8/0MXxGmSbQvpsaX3hFeYO9L2sD31nKyp4r/7
 DY1GjHjimcbGOilKO+UK6uitVorIIW6S1DQWY9W/5m3Jwf9Z71KMsXB906paEJ0U
 ldv677Mq9fhNdp3q7rwxPzfWNqjfCU629t5FBKdsiwQxS3tjqKFyeYLH95pXaDd6
 we73cQs1271C4swYR2iajik5eKpkE/v9+3KNzw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DQQIEvRSbgvV for <qemu-riscv@nongnu.org>;
 Sun, 23 Jan 2022 17:00:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.84])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jhs8h2GQcz1RvlN;
 Sun, 23 Jan 2022 17:00:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 bmeng.cn@gmail.com
Subject: [PATCH 0/2] RISC-V: Correctly generate store/amo faults
Date: Mon, 24 Jan 2022 10:59:56 +1000
Message-Id: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=01678aa48=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Mon, 24 Jan 2022 01:01:35 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

This series adds a MO_ op to specify that a load instruction should=0D
produce a store fault. This is used on RISC-V to produce a store/amo=0D
fault when an atomic access fails.=0D
=0D
This fixes: https://gitlab.com/qemu-project/qemu/-/issues/594=0D
=0D
Alistair Francis (2):=0D
  accel: tcg: Allow forcing a store fault on read ops=0D
  targett/riscv: rva: Correctly generate a store/amo fault=0D
=0D
 include/exec/memop.h                    |  2 +=0D
 accel/tcg/cputlb.c                      | 11 ++++-=0D
 target/riscv/insn_trans/trans_rva.c.inc | 56 ++++++++++++++++---------=0D
 3 files changed, 48 insertions(+), 21 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

