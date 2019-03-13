Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456L-00016M-7o
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h456D-0000Ro-6T
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h450P-0003pj-LM
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:18 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h450P-0003oU-9z
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:17 -0400
Received: by mail-pg1-x52a.google.com with SMTP id b2so1653877pgl.9
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=LBUQiIjSsBLKRyRGlp7REqLGtSejSZCZd3VTQDbAQko=;
	b=AYeB1hR0jfCfmURXXCg6iHBPnuIung0/EmEUisKO1rfPOA88ycQLLvvjvXfz0demoR
	3j7eqEAmye3DYelHJW1tgnMkmEP+vhABjEeK4H5fSPD0ikQmmCyCl5JYUbNWJtQWwHxo
	thTspexw4V1gzOpNVEB+90zrpyue9Bd3cRZVQwsPMFEatuZoyGfDDbZQRkDMPX1afPqX
	K+7s6ev8q0Y7vW/pXFvICPNlupa8/4uubg48xvTHsslXUm2uMsjQ5xJxCJZuj0fcOlU0
	uJsRa7NVLE+G8pxMlWjm3ZCzxHXWY41Q/RHQyTcfti/Hp6D0MgZ0UBLKIG2jGHfs3eBl
	G1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=LBUQiIjSsBLKRyRGlp7REqLGtSejSZCZd3VTQDbAQko=;
	b=scF9ZSkZmWIdT+8q1ZqPFNMF1AIF39iEMO0/RcjazlWxq14teoBWS9qIrZm1dCtCef
	Nsuz0lbA799laUo8XaHfJHAS4GbU3LEsdJiJuwNsdRL07aGveW2j6nBg5rbGX2FXprHl
	jOq+C6qCR/cRms6h1pr+m8RR+kJaR9o9+ymjaTZ+wD+ZlGlm06okuyzixx9oeK4dFAO5
	tGecxmVcZ9njdPOSwbNxAkuVUbh1E2CQz7I1NvXLQIKz1Kvnf2g6onfCTZL3ffUEHTTX
	YDpfTSZbW+19QnbVcUZa+ovWjwuGMmhWb2uxU/xfiOBiePy6iRdDjINWmhGmcUhfVcZP
	knjQ==
X-Gm-Message-State: APjAAAXf5a3XNezRNYbzHHzQg+Prc71JkYemwdo9YhoG4Mtmy6ygASWn
	wTAvQkEMVrM5tyWAT4Nr7sbXQYugxwnUI8d6
X-Google-Smtp-Source: APXvYqxOqQSUZjaSuDfsn4B3jCTNqJBryDO3XiJN4isYVJWkbqZ+KUuteQzrEtfbvqi19ZIL3EHrBQ==
X-Received: by 2002:a17:902:6b48:: with SMTP id
	g8mr45947053plt.21.1552487835081; 
	Wed, 13 Mar 2019 07:37:15 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	r28sm25495771pgl.72.2019.03.13.07.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:14 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:36 -0700
Message-Id: <20190313143705.29129-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:18 -0000

merged tag 'pull-request-2019-03-12'
Primary key fingerprint: 27B8 8847 EEE0 2501 18F3  EAB9 2ED9 D774 FE70 2DB5
The following changes since commit 3f3bbfc7cef4490c5ed5550766a81e7d18f08db1:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-03-12' into staging (2019-03-12 21:06:26 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf4

for you to fetch changes up to 25e6ca30c668783cd72ff97080ff44e141b99f9b:

  target/riscv: Remove decode_RV32_64G() (2019-03-13 10:40:50 +0100)

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
good to go.  I've run my standard test against this exact tag.

I still don't have a Mac to try this on, sorry!  If this doesn't work
then I'll go try to find one tomorrow.

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
From Palmer Dabbelt <palmer@sifive.com> # This line is ignored.
From: Palmer Dabbelt <palmer@sifive.com>
Reply-To: 
Subject: 
In-Reply-To: 



