Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWSX6-0006qH-PN
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 19:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSX5-0006pE-Ch; Tue, 13 Apr 2021 19:33:23 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:47187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lWSWz-0003qc-4Y; Tue, 13 Apr 2021 19:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618356796; x=1649892796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u2xWnswPYxTcEkRKgacyVSK26cUkpoopvYwTAo7mwFU=;
 b=hx9R6BBNRbworzqA3NKk5DPK5MzA94oWkTDjvPOeV5dTdjaPiy/bv+Bh
 d6BSkBtvDa2nzWvH+8KVr6bvPv/ta56Iom4D21+rQ2cdLTYkHjfPC0v+f
 197xS0l4k1+0dMJ8+hgqPE64+ljRCvjvY0udaTavh6jcg0bpk+KZCzLjU
 Jbu/zSPaq+Ci3p2TM23HaJLPRLOREdOFTOXD+Zk1lPiSoqi2xjIQJ3rKe
 xDyxdTKqoIdshE0/GuA62vgOXLHzJ2C+1O6l80UAs6sUOGnugCZ5a/MyU
 7uUY1UgoPJk34KebZmsNpNgeVQCJxP+KEEDQU+I0sY56XOdPSNA/wWVoC g==;
IronPort-SDR: sGGMx2vQPVv9PBPHY31UxiajqDgcg8Ae7astv6b382TTA1mq/Z72l0R1YHLbbsTfMH1A5D3bWy
 MqoQUkLG1nE53Fi8iH7bNALwmNpF7effOIhLodwj3tdHYBlnsZ25Hw/TMov57q1oHZLNxumYZl
 pdg5pFouJfpue/jKraMu6olTckMZSUpoao/ERFH+16iYYZtIwzJjOFtWdb5RVxrXdu0QyBOUiO
 MSPb1UDXb6cH2xDqzGc7LaepLWRf/unaYFbi95lGpojAUicZ1F4DWaEk1tzbpg20223IsYfvHu
 4Uc=
X-IronPort-AV: E=Sophos;i="5.82,220,1613404800"; d="scan'208";a="164660103"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2021 07:33:13 +0800
IronPort-SDR: Q89fn77Bmu2GMJfSh78fxzmjwCGBYBbf/aQE0dZXZRbuaUwtc8MQVrxAkD+lr/ACRy7B/cgS6C
 DR0D2c54dxe38YniNBL/cQWLQdKiIm5DkRev1bTfKY0Cu37Wn/TnBIXa4NsAEQ1x/iOtMxHXXW
 NLogIvyoWeyNXEmOgGfFlOVN9vMxZWIIGtHp2/AUVmND7vhWHkxH/E+/GfYSy9YyjySzmHs+iw
 VvlT+uia91p7P89EnCRF6gLYg31JbU7eRF5QpkSxpdaUDHDxBwopIzweJRtxc01SSgGr/T6Pjq
 rm9i5wlfO3KJwtRtyCUs2tfA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 16:12:40 -0700
IronPort-SDR: ldyw01eKa4meVAEfHhBBaLyFceKkrEuSikXDt2XMssyx5sizQX7aUJWY8mAVXYmYt6xhXYWK/7
 azA1+pBC6L6E+0F2NAOP+drT3XZg/dnqJHyHU5AeEBVdFHEwdDIn21N4saSBnp0tkTU2/ZFfAa
 OmpmjiXL9rTHOq0NAHQCt5gCh8AYiVHr357iA5sc+NucNNDhk2ZUtuLHciyT/PPZs4f3dM+BDZ
 3SLoqucV+YsX00uLFls3ml9VVjEhF8Mm1lsCeqAKAkzjW5HxikldJoGtY92HMdnSyFRMMrMxeY
 6nU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.17])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Apr 2021 16:33:11 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/9]  RISC-V: Steps towards running 32-bit guests on
Date: Wed, 14 Apr 2021 09:32:59 +1000
Message-Id: <cover.1618356725.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 23:33:23 -0000

This is another step towards running 32-bit CPU code on the 64-bit
softmmu builds for RISC-V.

I have tested this and am able to run some 32-bit code, but eventually
hit some issue.  This series doesn't allow users to use 32-bit CPUs with
64-bit softmmu builds as it doesn't work yet. This series instead just
gets us a little closer to being able to and removes more hardcoded
macros so hopefully others also stop using them for new code.

v2:
 - Update the decode tree setup
 - Address other review comments

Alistair Francis (9):
  target/riscv: Remove the hardcoded RVXLEN macro
  target/riscv: Remove the hardcoded SSTATUS_SD macro
  target/riscv: Remove the hardcoded HGATP_MODE macro
  target/riscv: Remove the hardcoded MSTATUS_SD macro
  target/riscv: Remove the hardcoded SATP_MODE macro
  target/riscv: Remove the unused HSTATUS_WPRI macro
  target/riscv: Remove an unused CASE_OP_32_64 macro
  target/riscv: Consolidate RV32/64 32-bit instructions
  target/riscv: Consolidate RV32/64 16-bit instructions

 target/riscv/cpu.h                      |  6 --
 target/riscv/cpu_bits.h                 | 44 -------------
 target/riscv/helper.h                   |  2 -
 target/riscv/insn16-32.decode           | 28 --------
 target/riscv/insn16-64.decode           | 36 ----------
 target/riscv/insn16.decode              | 30 +++++++++
 target/riscv/insn32-64.decode           | 88 -------------------------
 target/riscv/insn32.decode              | 67 ++++++++++++++++++-
 target/riscv/cpu.c                      |  6 +-
 target/riscv/cpu_helper.c               | 46 +++++++++----
 target/riscv/csr.c                      | 41 ++++++++++--
 target/riscv/monitor.c                  | 22 +++++--
 target/riscv/translate.c                | 33 ++++++----
 target/riscv/vector_helper.c            |  4 --
 target/riscv/insn_trans/trans_rva.c.inc | 14 +++-
 target/riscv/insn_trans/trans_rvd.c.inc | 43 ++++++------
 target/riscv/insn_trans/trans_rvf.c.inc | 40 +++++------
 target/riscv/insn_trans/trans_rvh.c.inc |  5 +-
 target/riscv/insn_trans/trans_rvi.c.inc | 22 +++++--
 target/riscv/insn_trans/trans_rvm.c.inc |  7 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++------
 target/riscv/meson.build                | 13 ++--
 22 files changed, 311 insertions(+), 325 deletions(-)
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode
 delete mode 100644 target/riscv/insn32-64.decode

-- 
2.31.1


