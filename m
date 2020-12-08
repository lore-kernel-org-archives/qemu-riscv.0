Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlu5-0007k4-BJ
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu2-0007el-Vj; Tue, 08 Dec 2020 17:56:15 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:43219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu0-00047S-Ea; Tue, 08 Dec 2020 17:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468173; x=1639004173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/2dCN3e7xKq9x8gf/FjO1Pq0+6aiiGo/toRyXiJ1fAI=;
 b=FTymLv1wiXYmuJEeNa4QwTwzG90iXY0XFF2gxJzjFdBDKiUF5MzLEvwo
 MZljuFOmfZOkOx7KbuVsS0lKqeGr2dqyVw698aSf+2ip5iR+fYmYvfuiL
 x9p4g4eUzZTNg+fNSJDe82VWrTdGByimaHo8D96kl3WktQnn4l7EZ9okm
 vnQagAq0LaBZS/6oyC0azs6EK01UNL54ej1YUPHt7sSftDzHXYStsGAqg
 zOfDVL/Zw1xirLP5EUuQeFfxyF4EsCifPizzkmtbkrtMOUrQLjGfogqOA
 ijjJpdobXKJHXNyd/pra5EI+/Sxk3K0Q0COMxVmzwizEn2jBAXcqKZyiR g==;
IronPort-SDR: 46RX4cIx/iEO7go9UHiEFLnTgArQL+lSSrSz+JBQRJv3DNBMsoqD3WD0lUxPEBNuaYePfd80hX
 cu8UslHkyEKthburxlto9Fg/eKdpfeBPewqKV4h//pk73o2+F14G9YzPrVSs+MIvrbNNMSEe4M
 GHSRKJPkLUHZtWBTcthE0MjxGSGJIPusaqhcIti3koDejfau266vWcJfgosxn6YueZ2sRtJDhE
 Oc8WdKQiNYnubMAOVjUuTTsp3egB6e+eXoKrmMYWrz+LLfiCReotgRmR0AcCkg/yPPZDhvLbIv
 BBI=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="155938388"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:10 +0800
IronPort-SDR: EqeXSc+hsJD4APxcrh7Nfvt/iqMOaCTzZiAPgVmnhcCyXNndBZT+Lf8PwKAkWQKaMA9Lzx/VJh
 GsNgeXwfxJshGVlVqDK/ZzOcIP9+EFK7s=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:41:36 -0800
IronPort-SDR: Dq7xVyvoyfZ25K5z0NXGrOnOWjMaKXXPa59FyTxx8/nv/mDN9Yd2sFHcxDgsvuctvifhgUJxLc
 TEVll20wKpKw==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:09 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 00/15]  RISC-V: Start to remove xlen preprocess
Date: Tue,  8 Dec 2020 14:56:08 -0800
Message-Id: <cover.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:15 -0000

The RISC-V QEMU port currently has lot of preprocessor directives that
check if we are targetting a 32-bit or 64-bit CPU. This means that the
64-bit RISC-V target can not run 32-bit CPUs. This is different to most
other QEMU architectures and doesn't allow us to mix xlens (such as when
running Hypervisors with different xlen guests).
This series is a step toward removing some of those to allow us to use
32-bit CPUs on 64-bit RISC-V targets.
v2:
 - Rebase on the latest RISC-V tree

Alistair Francis (15):
  hw/riscv: Expand the is 32-bit check to support more CPUs
  target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
  riscv: spike: Remove target macro conditionals
  riscv: virt: Remove target macro conditionals
  hw/riscv: boot: Remove compile time XLEN checks
  hw/riscv: virt: Remove compile time XLEN checks
  hw/riscv: spike: Remove compile time XLEN checks
  hw/riscv: sifive_u: Remove compile time XLEN checks
  target/riscv: fpu_helper: Match function defs in HELPER macros
  target/riscv: Add a riscv_cpu_is_32bit() helper function
  target/riscv: Specify the XLEN for CPUs
  target/riscv: cpu: Remove compile time XLEN checks
  target/riscv: cpu_helper: Remove compile time XLEN checks
  target/riscv: csr: Remove compile time XLEN checks
  target/riscv: cpu: Set XLEN independently from target

 include/hw/riscv/boot.h   |   8 +-
 include/hw/riscv/spike.h  |   6 --
 include/hw/riscv/virt.h   |   6 --
 target/riscv/cpu.h        |   8 ++
 target/riscv/cpu_bits.h   |   4 +-
 hw/riscv/boot.c           |  69 +++++++++------
 hw/riscv/sifive_u.c       |  57 ++++++------
 hw/riscv/spike.c          |  50 ++++++-----
 hw/riscv/virt.c           |  36 ++++----
 target/riscv/cpu.c        |  84 ++++++++++++------
 target/riscv/cpu_helper.c |  12 +--
 target/riscv/csr.c        | 182 ++++++++++++++++++++------------------
 target/riscv/fpu_helper.c |  16 ++--
 13 files changed, 302 insertions(+), 236 deletions(-)

-- 
2.29.2


