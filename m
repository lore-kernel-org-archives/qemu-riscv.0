Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1la8yE-0003nm-NS
	for mharc-qemu-riscv@gnu.org; Fri, 23 Apr 2021 23:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la8yC-0003nO-P6; Fri, 23 Apr 2021 23:28:36 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7413b051c=alistair.francis@wdc.com>)
 id 1la8yA-00085A-AW; Fri, 23 Apr 2021 23:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1619234917; x=1650770917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jHZh+RVgSHw+/SI3pJn2UayRYEt05wHcNNMDZtkdzKk=;
 b=IX6Wlf3FOhD0UnPV8VfaBTvJTZ3WgOIACb8e3c/XhdiFY3RCCUWcYV1i
 Qlcqp0kVHDey/3nQmwUwJbu5MqOQrpOSfxGwL4EaSXmz1euLPZ/Fye7Zx
 nyEWdW5FI/ZRCcRIjwLfFmfoYliG3VF9j2AvtR7OQb1203ATw+MP/nxK0
 6GmcG7jUbGDjUtZrvSm/kj7MRsqKqJOlyO9wMEUXMfl6erKWIDbjsK5Zw
 3h+9/E4ELlD8K7/nQubZUgBWOXm17znVHo7k4aXri88zD951R3X05+bEn
 alGtJEQL26PlOD0o51lpD44mIaZkgB7nYQ+aUvo7ZpTp+V8VjUexaFoW8 w==;
IronPort-SDR: uldoPbG3EE8trQTetl/WvVKQ+HL2GvWx0t7fZxX5XTC/HNWltce/zalwKTXhIqjQAhw5nFQD7q
 xCeomTH0VuBYkuIgPXrEZEHAYyxQLl9pG7bG+S8HIOzEM5jti0ZyPTGlRDOwr91s9hGM77cNaT
 +7VomKUMWZZDlVG+7NyguNhwbkkb3uc5dPF3z0TVzC/00Zb3hwVGmK+l0+bzGMoyobxHZDJQQc
 9tcvlEy7pQt9jvYNNF/oQXvkdrhQHOd+/RXeRJuRMlX+3aXzIJv+ngfL0AAyygf2rU5vN8ECEI
 jM8=
X-IronPort-AV: E=Sophos;i="5.82,247,1613404800"; d="scan'208";a="270019489"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Apr 2021 11:29:16 +0800
IronPort-SDR: vDhU+48XIg6xtFGLnImgWft+mIT980Xg6zI3Jj/69T1V4MSoQD7cU3vOig7N7/AUP28GGdKBPL
 6aW3t7WZPBWkPQealqTW+qAY1PqQMSl3EgB106Fs33Y3cZR7i5K13g2+LV7c6lWwa7+QMLg4oy
 Cq9gh+jMmpt1R86UuV+nCiVRxhUkXS3APnK/KIbQ7GWW78EpTLKnvlcO+yGnJqzeobS+RMCfej
 vEo/V9NtQIOANkjsi+v+kOz8zHKyo0PnEJktvDh5bgtiMu/LC8j7VMo0YpR4DzTgf6kwAWirhW
 3nG70aK0bKLbzc+Wb6E2Gthc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 20:07:32 -0700
IronPort-SDR: 316ejJebhDrpIoDUXvKSxjIwORc9AgSQLP9wUbhNRf7NnHasKyZISYoxyj88zGr+FF4oUg1Cuf
 /EmZF8ga36/sxVVSzGIuVCb0smv/8iS/Aje8AO3eq5K0X8WayhcEAcHPuUz/hlSuLtILMC7ioU
 tzoss1hWuqIAbo9xmAWgxmHvYyfsBMKXlAw15pDfabofunlhOiZwAFNsA8t28JmvOo4ZiAUlxr
 g/4wCMO+8ryIq+uw7jtuG0YWr95EVggPrR1RUBQfwfsm0HobSXHOYckZ20AOeTyVpH+g0rabZS
 ZFk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.34])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Apr 2021 20:28:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 00/10]  RISC-V: Steps towards running 32-bit guests on
Date: Sat, 24 Apr 2021 13:28:20 +1000
Message-Id: <cover.1619234854.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=7413b051c=alistair.francis@wdc.com;
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
X-List-Received-Date: Sat, 24 Apr 2021 03:28:37 -0000

This is another step towards running 32-bit CPU code on the 64-bit
softmmu builds for RISC-V.

I have tested this and am able to run some 32-bit code, but eventually
hit some issue.  This series doesn't allow users to use 32-bit CPUs with
64-bit softmmu builds as it doesn't work yet. This series instead just
gets us a little closer to being able to and removes more hardcoded
macros so hopefully others also stop using them for new code.

v3:
 - Remove casts from the decoder
 - Add a patch to fix a comment
 - Rebase on the RISC-V tree
v2:
 - Update the decode tree setup
 - Address other review comments

Alistair Francis (10):
  target/riscv: Remove the hardcoded RVXLEN macro
  target/riscv: Remove the hardcoded SSTATUS_SD macro
  target/riscv: Remove the hardcoded HGATP_MODE macro
  target/riscv: Remove the hardcoded MSTATUS_SD macro
  target/riscv: Remove the hardcoded SATP_MODE macro
  target/riscv: Remove the unused HSTATUS_WPRI macro
  target/riscv: Remove an unused CASE_OP_32_64 macro
  target/riscv: Consolidate RV32/64 32-bit instructions
  target/riscv: Consolidate RV32/64 16-bit instructions
  target/riscv: Fix the RV64H decode comment

 target/riscv/cpu.h                      |  6 --
 target/riscv/cpu_bits.h                 | 44 -------------
 target/riscv/helper.h                   | 18 +++--
 target/riscv/insn16-32.decode           | 28 --------
 target/riscv/insn16-64.decode           | 36 ----------
 target/riscv/insn16.decode              | 30 +++++++++
 target/riscv/insn32-64.decode           | 88 -------------------------
 target/riscv/insn32.decode              | 67 ++++++++++++++++++-
 target/riscv/cpu.c                      |  6 +-
 target/riscv/cpu_helper.c               | 48 ++++++++++----
 target/riscv/csr.c                      | 40 +++++++++--
 target/riscv/fpu_helper.c               | 16 ++---
 target/riscv/monitor.c                  | 22 +++++--
 target/riscv/translate.c                | 32 +++++----
 target/riscv/vector_helper.c            |  4 --
 target/riscv/insn_trans/trans_rva.c.inc | 14 +++-
 target/riscv/insn_trans/trans_rvd.c.inc | 17 ++++-
 target/riscv/insn_trans/trans_rvf.c.inc |  6 +-
 target/riscv/insn_trans/trans_rvh.c.inc |  8 ++-
 target/riscv/insn_trans/trans_rvi.c.inc | 22 +++++--
 target/riscv/insn_trans/trans_rvm.c.inc | 12 +++-
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++------
 target/riscv/meson.build                | 13 ++--
 23 files changed, 310 insertions(+), 306 deletions(-)
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode
 delete mode 100644 target/riscv/insn32-64.decode

-- 
2.31.1


