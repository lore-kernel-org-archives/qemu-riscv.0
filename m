Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq2p-0002rE-L2
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2h-0002gp-4X
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq2e-0001kJ-RB
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:07 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq2d-0001Z0-Pv
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:04 -0500
Received: by mail-pf1-x429.google.com with SMTP id v21so12007381pfm.12
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=rpSfOwuy/U2wu1nxdb16wpJgZcIJUyLZCMp7u14ro2A=;
	b=BOlfkZw87fyBpQpFZemowXX+2K3folXKdr4pdLqZ9zEKYFNBWbQ6wtZf2+YRQBA7PS
	OBx1l7dT0s0wpaMlUFbytGTfQ7ktEQtXJT845arBti+zxMC47ktf2NlYRtE10nKAwzHo
	WPAxrWSE8s34SG2tkOr5ii+xvtDWSzoWmmhCL4AdNJafCjOgcKoAiUk9otYPwBoKRy3O
	dTjEh4fs4jFcEXdRUqpsFR4AQAYGE1XS8C05cf9g0N21vrLm0zRfGK+eg0N9YtjbcPHi
	0YiTB2rfNJuLL7phsccTgFoeKZjUBolQv0xv00nRco3Fc6RcuACUlhfwbgKSup3jQ5DH
	o9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=rpSfOwuy/U2wu1nxdb16wpJgZcIJUyLZCMp7u14ro2A=;
	b=b44PzAm+q/+KKLcRlPO2RU748K6orsdc4uZv0T0mwtYW6SToLInRer6nWMziuDX3mG
	ogddLWubBXifOxaO3MKzONW1QSShwX5KAJO7Gz0e2dgm0IGzb006HR+xl0mK7jyatl1i
	B5oQENxNwYhyGVHXGcnbFo9+4/4W7LqJAtQjVNC11v0Jz5rkNP8AFB8ieGGUcn50zxsH
	ttROC4VNB6JSrMEuRohb1KjH203y2hPqrdazO7p28Sb8+nUHFviVkgQz96461fJLIJJ5
	GrdiH9tq4ZKCvtsaXXE4rtzzS7jL7JbdCI9zq1wsww+IQkV1Q9qy+7S6phh0qOL/BXnK
	T8+A==
X-Gm-Message-State: APjAAAWbpktUVP727IF8kvH7CUF8SkN6gdiA+XqXmhZqXeuqAOL2citQ
	FgU5mQRRUT+538SEi+HKf8NJvQ==
X-Google-Smtp-Source: APXvYqxnhzOTG83G54uCG1ZadhXxmGEjtDebULPTFbnISxDuc1FYR4lGylhzZidnosHprFFeS301Bg==
X-Received: by 2002:a63:2682:: with SMTP id m124mr6806716pgm.35.1551476996636; 
	Fri, 01 Mar 2019 13:49:56 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	s80sm19888147pgs.4.2019.03.01.13.49.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:49:55 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:11 -0800
Message-Id: <20190301214945.4353-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
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
X-List-Received-Date: Fri, 01 Mar 2019 21:50:09 -0000

merged tag 'i2c-for-release-20190228'
Primary key fingerprint: FD0D 5CE6 7CE0 F59A 6688  2686 61F3 8C90 919B FF81
The following changes since commit 20b084c4b1401b7f8fbc385649d48c67b6f43d44:

  Merge remote-tracking branch 'remotes/cminyard/tags/i2c-for-release-20190228' into staging (2019-03-01 11:20:49 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf2

for you to fetch changes up to 0bcba29464ea9969fc69cd729e4c8bddfb2e18e3:

  target/riscv: Remaining rvc insn reuse 32 bit translators (2019-03-01 13:16:18 -0800)

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

4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
   by Richard. [Patch 30-34]

Palmer: This passed Alistar's testing on rv32 and rv64 as well as my
testing on rv64, so I think it's good to go.  Thanks for the cleanup!

----------------------------------------------------------------
Bastian Koppelmann (34):
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
      target/riscv: Convert @cs_2 insns to share translation functions
      target/riscv: Convert @cl_d, @cl_w, @cs_d, @cs_w insns
      target/riscv: Splice fsw_sd and flw_ld for riscv32 vs riscv64
      target/riscv: Splice remaining compressed insn pairs for riscv32 vs riscv64
      target/riscv: Remaining rvc insn reuse 32 bit translators

 target/riscv/Makefile.objs                     |   22 +
 target/riscv/insn16-32.decode                  |   31 +
 target/riscv/insn16-64.decode                  |   33 +
 target/riscv/insn16.decode                     |  114 ++
 target/riscv/insn32-64.decode                  |   72 +
 target/riscv/insn32.decode                     |  203 +++
 target/riscv/insn_trans/trans_privileged.inc.c |  110 ++
 target/riscv/insn_trans/trans_rva.inc.c        |  218 +++
 target/riscv/insn_trans/trans_rvc.inc.c        |  149 ++
 target/riscv/insn_trans/trans_rvd.inc.c        |  442 ++++++
 target/riscv/insn_trans/trans_rvf.inc.c        |  439 ++++++
 target/riscv/insn_trans/trans_rvi.inc.c        |  568 +++++++
 target/riscv/insn_trans/trans_rvm.inc.c        |  120 ++
 target/riscv/translate.c                       | 1948 +++---------------------
 14 files changed, 2740 insertions(+), 1729 deletions(-)
 create mode 100644 target/riscv/insn16-32.decode
 create mode 100644 target/riscv/insn16-64.decode
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


