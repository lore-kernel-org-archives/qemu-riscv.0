Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJEl-0000zr-3m
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJEj-0000zQ-Ac; Fri, 02 Apr 2021 08:49:17 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:3489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJEh-0004eq-53; Fri, 02 Apr 2021 08:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367755; x=1648903755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IQH/pg7B/nUKWlB5rU6Yj9+hi8xCY3T4URtt0PTFIjc=;
 b=cvpZtVK7YhQWGl0FR7lu9Q6jimU3qplR/YX1riYOyd+FzzrANLgVilUA
 4jT7euaK0GR51rEyRE/zPkTWzFkF7/ezdUAXdZ4VMZfrst71Dcbx/0kp+
 SMlGX5u2R7aEV5dYHvZ+D2IPgjCKnqLj1o7jQCswH2bDVe4caiOyBZT7W
 MCIGksyQzmc/wrh0iUJZAn0hArKJF0K+q35l4cfWp2yFlahnqcCecGAkr
 RErOzEYl6chnkHEIUlLbpD36XShqSAanjeCd39Um2XV2wz8jurMttnh9H
 roqtdeufmebKuf3DPlGqhnXWTGgskq5VG646yhAhPhAP41uEZcdWppbY4 A==;
IronPort-SDR: 4jV0vS93r2AE9nOI3/v7eaqNREvyYhE1tvO0QmRsg/H3yYH488hDJ4vKxGCtq6gmZLb9iRcsnw
 VyORyfCcncHlcKGqD0dRwXy0GEotPKl6D42PhpER+ZYKT3e80lh8/xCXHXjuSLP7bdWA1Rj3v1
 s1kxtzJ1QW7GI4e3NOzU1nkKBLJvHJNMtDO+eSTl9LDBkmZvv7mPHwi6rwK4zkNPeNoiCld5Nl
 Td8Q7IMWBfKp8xt9Na0zJiQ31w91Hg6zYLVSvMzjDdMywLIfgb9UBGWos4pVPK+a77/36dquVv
 lkc=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="274495096"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:49:12 +0800
IronPort-SDR: 2+5OrYJAi8Ne1XH4Cl/8jzaoW0ZXuXEzcat+pU4iURFzLRybXLU4hgT5EFXhAotCbhhVR/8ysm
 mbhStUvW7jz2p0r3wBrRCofDvTZxjuL5EdQq8RxbZGjcc1fJVqO8k4RUn9jtC5RpkBYNVx/QBm
 BR13RQfInwJl/BR4gKjLHKozn0QyJnIUZv7L8eFwvFbSrxRluRQJtaW52oarxaYX7RsfItjb4A
 bhgbY1KnFno2jWD0EjwIMQ4AXjHB+XTytCTEhQzmfmS0DA+Pg2f5GPzuxfz/HMsIj4vMB1Mv6+
 T8CsAGDra7P/uMppKXRmq/bJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:29:18 -0700
IronPort-SDR: mYpcKAtjH6YGgPIJVR+YyYUwFT3pUDGj2tSg2wMGjIGZMRR+/aG8r60nlrqHUmEhKZ31NzRSL2
 /iKxfx1RMR+r2WmQpyjnkEFOzjLOIIZq4Y2vX3JovgHuTmDga7rOhaYGQW1vC/BrTA8JMedr3O
 hak3Du1qae6Gef1DgkSvsbK3TpTHH2DCS5Zyl9jjJ+C89a3zEdh9SxI5/UBf4PL3xRluX8GdkU
 Y8UYJ3JYLy2VCjmUaHXkVHLc71jTp8e/Rd3fuDRZxrz3YSVYX+Ffluy7JDDRJPZhvLJ7Q3QJLl
 w8Y=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Apr 2021 05:49:12 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 0/8]  RISC-V: Add support for ePMP v0.9.1
Date: Fri,  2 Apr 2021 08:47:16 -0400
Message-Id: <cover.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Apr 2021 12:49:17 -0000

This series adds support for ePMP v0.9.1 to the QEMU RISC-V target.

This is based on previous patches, but has been rebased on the latest
master and updated for the latest spec.

The spec is avaliable at: https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

This was tested by running Tock on the OpenTitan board.

This is based on the original work by
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
 Hou Weiying <weiying_hou@outlook.com>
 Myriad-Dreamin <camiyoru@gmail.com>

Alistair Francis (4):
  target/riscv: Fix the PMP is locked check when using TOR
  target/riscv: Add the ePMP feature
  target/riscv/pmp: Remove outdated comment
  target/riscv: Add ePMP support for the Ibex CPU

Hou Weiying (4):
  target/riscv: Define ePMP mseccfg
  target/riscv: Add ePMP CSR access functions
  target/riscv: Implementation of enhanced PMP (ePMP)
  target/riscv: Add a config option for ePMP

 target/riscv/cpu.h        |   3 +
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/pmp.h        |  14 +++
 target/riscv/cpu.c        |  11 ++
 target/riscv/csr.c        |  22 ++++
 target/riscv/pmp.c        | 228 +++++++++++++++++++++++++++++++++-----
 target/riscv/trace-events |   3 +
 7 files changed, 258 insertions(+), 26 deletions(-)

-- 
2.31.0


