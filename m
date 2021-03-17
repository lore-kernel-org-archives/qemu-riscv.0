Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMaAO-0007sF-L9
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 13:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAM-0007nK-F2; Wed, 17 Mar 2021 13:41:06 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAI-0006oJ-Pg; Wed, 17 Mar 2021 13:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616002865; x=1647538865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FSOf/aQzhfvYzGDoa01B9JXnIoDV6XYAvP8ZXyhrNrw=;
 b=RzNtz5aLOtaix9mxX007bWeaKRq7yH1d3tWu1c1ntJfxOjqjNA9VffDX
 7qJIFhJi5+qctp/N8DvgyQSzCHoXSbZ/dA7H6bi1oxoWkl2Uf2ZbhGKa4
 CgItCIyClH54rpsDXfo6htmHWdlOAz92sCba+fbhs1+64PfakwwJRZ3lT
 fjXmZHRe3GkRRHHPkTos9/85Gm8dV+pg7E+KZ58zVoawzUOdW4GuP5yeM
 2u6akpW+QGVn0DYeyMwvhwTTaStuS7CjNJqO5oUIWE/V6l6GWBL1+zZay
 UzAyqEC9udflb1Guvk6ekxkRRBmVTKxWeenzHhtrfFLEk/QT9eyzfNexU Q==;
IronPort-SDR: Pje9ZrGgAhp/wPStM0Y2fV5SC7CNmcm/6msf59J1C0XUnng66FCVBeBIK89jq5rNm4LnwLG9WV
 1YmVmQLg0JPyas77PHrH6+8BzgQFGJErGkHGnT/4+N2xFCXpba8C0DXJSudaZaQGBzE3kb/mXa
 HCzIEzmdTrHIpk3RE6EKk1RYp2e6agjar4mP7jJuAGTscBBDs43YFCtXfJ9MMVtxNkvxIpjy5+
 GziaeYcwPWibbM41qsHM49ExIvefcLObFdFMje9uY9wELYU2vjOlMsLb97/UedXRtqPK3ioKYq
 MGU=
X-IronPort-AV: E=Sophos;i="5.81,257,1610380800"; d="scan'208";a="266778834"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Mar 2021 01:40:59 +0800
IronPort-SDR: 7DFcxZGtxvPJP2eE2itYty3JmRNkiycLgCVmwDfz9a0P5q5KLeZdX4wL0cXd/Vdr83lTnuHkYj
 AtmdP2kzzQksLwK7rlVRm2I9/fHwxh4P/3d9QGGxg3ohZzhJlQT6FeS1LhyQzaEhVGA4PoDJ4D
 jaZyIENmrklWnikrnigsDkfjbpxeA/WQ8p3iU2Q5ilDrNdEX6LJzkFsdXF9P6sctQ+6cqdK+2S
 apYQrXxcjylxMCYMRrVnYd2Tn8BVaUnq9ea2kC6Te09ORpD6qsAB4m8rbt1nzD6l+IbtOrBnAI
 EDso9bn84rbLhWpwsiyrD78R
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 10:23:16 -0700
IronPort-SDR: NSLCVTnPFaTxcRHfe/UpDVXdte5pux1FmI1IrMmIvrtERwXwIWSHWdarAAqGFzXUuHrmesiIte
 AtQaomscpERoVnvni9umEkVhS68Nobleo0Pwm2CVPwlhEGjYWqHuI/Nyg/4KHgtNf7M82crT8K
 Nua+Y/uPeOddG6niQqA6/fsNsLGkH65L+V5X5L28Sp6B9uaSZ7X3hBehPqV5M0/1zOXm9zRHfP
 RH0eBskF0CHGV8Ns/Equ3lwepxsvBl7EgYQYBbNsyD4vrQdma/1Yu+ND77Y3FvCfv1vj7Ruzqd
 RXA=
WDCIronportException: Internal
Received: from fvwlp12.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.223])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Mar 2021 10:40:57 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 0/5]  RISC-V: Convert the CSR access functions to use
Date: Wed, 17 Mar 2021 13:39:44 -0400
Message-Id: <cover.1616002766.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=703660e7d=alistair.francis@wdc.com;
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
X-List-Received-Date: Wed, 17 Mar 2021 17:41:06 -0000


Alistair Francis (5):
  target/riscv: Convert the RISC-V exceptions to an enum
  target/riscv: Use the RiscVException enum for CSR predicates
  target/riscv: Fix 32-bit HS mode access permissions
  target/riscv: Use the RiscVException enum for CSR operations
  target/riscv: Use RiscVException enum for CSR access

 target/riscv/cpu.h        |  28 +-
 target/riscv/cpu_bits.h   |  44 +--
 target/riscv/cpu.c        |   2 +-
 target/riscv/cpu_helper.c |   4 +-
 target/riscv/csr.c        | 753 ++++++++++++++++++++++----------------
 target/riscv/gdbstub.c    |   8 +-
 target/riscv/op_helper.c  |  18 +-
 7 files changed, 499 insertions(+), 358 deletions(-)

-- 
2.30.1


