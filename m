Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUp-00049m-Ht
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:31:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUk-0002x0-RT
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hFx-0007jP-CO
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hFw-0007iQ-L1
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:15:45 -0400
Received: by mail-pg1-x529.google.com with SMTP id r124so1829261pgr.3
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=+e0MlRD3z2Cahcb2KBbEOftYUp2XeMUlRySGW8tmrNE=;
	b=CuL0R0kCGns5ib+GzjzpLKAILKEzHBbTVORYGBlnl3ooy5j/ASy2I+MZy1d2AbxDqc
	ZdHOhfzjR8k3ekktEtHFs8fjG5NGmdlnKE6dw2FNiNoYqn8Mj2bY+t8CdBOJGkkwiuyL
	8d686hL0EwCaxz8EXR7lVSve+wMD+xfICi6RgPn4wRntsBPRDuVCFcXdQJj2CckF1W9d
	7Tx94H+PsLIfuPOcGFu7SiFWifLTlwOdhMtoc/rSxSO4RWozNLTGNUCftlJuVMgRryeT
	raN+Aj+7ayJL0ZI+ob+IUfXmlEafPTy/wWdR105q8s5JScw9H2RhgoJPgr6GTy+QjTy/
	WQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=+e0MlRD3z2Cahcb2KBbEOftYUp2XeMUlRySGW8tmrNE=;
	b=D8900/zqgY3YgTAmgufT7bgq1HnKf583/ShrwrFYC1M44E5YrnwMHoI9MjcGW4he/n
	2EpUGNHduoDldvwpSdNZLMAamH4s/PIUzJmDOOBJq31mFvKSwI5rTo2+Oz82ZV3kAy1V
	QqjQTMHhBSUr6yc8hAPcnGZc0ogVagbfgL7+DUI8Cg8RhthABKRfnLpM/mglAzRAblGO
	fm22VUPjTng9WHBnvvvKMq4UWEfhKO/yJXeplNI2HUpSUwoZOySYx/P85873ERMpliMV
	xoif7oXG0Ot67EyRyam3XBORTFkfIkcDJ00mjI5j6cuKKPjULv41XlRe9kyp7fnuPncp
	TxwA==
X-Gm-Message-State: APjAAAWR9x0Zje4HSljgJNwTpFwQstGULXdcCo0tEWrn4UvfgGE+pVUT
	l7QPNpcQd21oFqX/LliwacgGyA==
X-Google-Smtp-Source: APXvYqzzXH5K2o5OBjxYWhqKjeq+m+RiGtZlPs2P+foGPvfEXMpXGHUTMlcr5RSNU79O15zxTsJnSA==
X-Received: by 2002:a65:6554:: with SMTP id a20mr34955381pgw.170.1552396542704;
	Tue, 12 Mar 2019 06:15:42 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	d5sm14784421pfo.83.2019.03.12.06.15.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:15:41 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:14:57 -0700
Message-Id: <20190312131526.14710-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::529
Subject: [Qemu-riscv] [PULL] target/riscv: Convert to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2019 13:31:06 -0000

The following changes since commit 377b155bde451d5ac545fbdcdfbf6ca17a4228f5:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2019-03-11 18:26:37 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf3

for you to fetch changes up to a971f8ae0e8ab6fab1eee199961b1ea2f4d876f7:

  target/riscv: Remove decode_RV32_64G() (2019-03-12 03:08:34 -0700)

----------------------------------------------------------------
target/riscv: Convert to decodetree

Bastian: this patchset converts the RISC-V decoder to decodetree in four major steps:

1) Convert 32-bit instructions to decodetree [Patch 1-15]:
    Many of the gen_* functions are called by the decode functions for 16-bit
    and 32-bit functions. If we move translation code from the gen_*
    functions to the generated trans_* functions of decode-tree, we get a lot of
    duplication. Therefore, we mostly generate calls to the old gen_* function
    which are properly replaced after step 2).

    Each of the trans_ functions are grouped into files corresponding to their
    ISA extension, e.g. addi which is in RV32I is translated in the file
    'trans_rvi.inc.c'.

2) Convert 16-bit instructions to decodetree [Patch 16-18]:
    All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
    we convert the arguments in the 16 bit trans_ function to the arguments of
    the corresponding 32 bit instruction and call the 32 bit trans_ function.

3) Remove old manual decoding in gen_* function [Patch 19-29]:
    this move all manual translation code into the trans_* instructions of
    decode tree, such that we can remove the old decode_* functions.

Palmer: This, with some additional cleanup patches, passed Alistar's
testing on rv32 and rv64 as well as my testing on rv64, so I think it's
good to go.  I've run my standard test against this exact tag.  I
haven't tested the OSX build because I didn't find an OSX machine (I'm
traveling), but I removed the offending commits so hopefully we're safe.

----------------------------------------------------------------
Bastian Koppelmann (29):
      target/riscv: Activate decodetree and implemnt LUI & AUIPC
      target/riscv: Convert RVXI branch insns to decodetree
      target/riscv: Convert RV32I load/store insns to decodetree
      target/riscv: Convert RV64I load/store insns to decodetree
      target/riscv: Convert RVXI arithmetic insns to decodetree
      target/riscv: Convert RVXI fence insns to decodetree
      target/riscv: Convert RVXI csr insns to decodetree
      target/riscv: Convert RVXM insns to decodetree
      target/riscv: Convert RV32A insns to decodetree
      target/riscv: Convert RV64A insns to decodetree
      target/riscv: Convert RV32F insns to decodetree
      target/riscv: Convert RV64F insns to decodetree
      target/riscv: Convert RV32D insns to decodetree
      target/riscv: Convert RV64D insns to decodetree
      target/riscv: Convert RV priv insns to decodetree
      target/riscv: Convert quadrant 0 of RVXC insns to decodetree
      target/riscv: Convert quadrant 1 of RVXC insns to decodetree
      target/riscv: Convert quadrant 2 of RVXC insns to decodetree
      target/riscv: Remove gen_jalr()
      target/riscv: Remove manual decoding from gen_branch()
      target/riscv: Remove manual decoding from gen_load()
      target/riscv: Remove manual decoding from gen_store()
      target/riscv: Move gen_arith_imm() decoding into trans_* functions
      target/riscv: make ADD/SUB/OR/XOR/AND insn use arg lists
      target/riscv: Remove shift and slt insn manual decoding
      target/riscv: Remove manual decoding of RV32/64M insn
      target/riscv: Rename trans_arith to gen_arith
      target/riscv: Remove gen_system()
      target/riscv: Remove decode_RV32_64G()

 target/riscv/Makefile.objs                     |   19 +
 target/riscv/insn16.decode                     |  129 ++
 target/riscv/insn32-64.decode                  |   72 +
 target/riscv/insn32.decode                     |  201 +++
 target/riscv/insn_trans/trans_privileged.inc.c |  110 ++
 target/riscv/insn_trans/trans_rva.inc.c        |  218 +++
 target/riscv/insn_trans/trans_rvc.inc.c        |  327 +++++
 target/riscv/insn_trans/trans_rvd.inc.c        |  442 ++++++
 target/riscv/insn_trans/trans_rvf.inc.c        |  439 ++++++
 target/riscv/insn_trans/trans_rvi.inc.c        |  568 ++++++++
 target/riscv/insn_trans/trans_rvm.inc.c        |  120 ++
 target/riscv/translate.c                       | 1847 ++++--------------------
 12 files changed, 2897 insertions(+), 1595 deletions(-)
 create mode 100644 target/riscv/insn16.decode
 create mode 100644 target/riscv/insn32-64.decode
 create mode 100644 target/riscv/insn32.decode
 create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rva.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c
 create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c


