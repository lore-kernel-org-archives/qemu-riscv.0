Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gthNL-00018k-4k
	for mharc-qemu-riscv@gnu.org; Tue, 12 Feb 2019 18:22:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gthNI-00018H-HO
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:22:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gthNH-0004cr-CR
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:22:00 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gthNH-0004bM-4A
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:21:59 -0500
Received: by mail-pl1-x642.google.com with SMTP id g9so211064plo.3
	for <qemu-riscv@nongnu.org>; Tue, 12 Feb 2019 15:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=bCo2abyVcrGKMee5v5BWBvw1DShvVhOQKjWwza/jHTU=;
	b=FEC4XQHielP7er7XAF2WWl70F6e+Xa0HWNcipeMW6TYx0/isF4SHhPaOHqVldxzyqO
	ezwuXxAgu+mSOaN5rOLS4d46BTNgiKP0RtSzW3BraJXcGs08vSavqswCPcV+KJpVHJ+n
	ogsfr7s3tM9Q4u6YE2aKARrwmiIRqEGH/eTCtYmzHNMCoZf9W1gQNUsSbrqDbt1OIzum
	nZaqOia3KeT2OdKiWa7QldfRAYgyn0fqgiGB4lc29+HtHgBIDbfJGWirYnWxMbIPC/Rp
	OObI52nyaCXb4ZCjPG+FtUT/gWi7H0L6GFQtv4OKr2JFOSiJJI/KGQUwLhsUUZM3J+vB
	5YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=bCo2abyVcrGKMee5v5BWBvw1DShvVhOQKjWwza/jHTU=;
	b=RJEnog4mY1mPGBzQ46A35sn4I98LU3DIuqxcz5XIBDuScz0bzditgxpbdTR/PLOatT
	epYZO7Ka0A2pUTSBWeFaxDJfc4foaZZNEhV3M9YZjJirRq7B/U/IaU5GTCYPRVI1XOVp
	3akpNsyNyELliOqRdATIwaLo84nhpMFa0XW2nFgCWClVSagAGaRcQYhJL+71aspW7pUe
	OCCpNp/Zr6JlVB03K+FgBKTFd2/rhsjQ0+SO/co4PDP/90evVO0Lvg7f+dUVB5LQkrbR
	2HOwsClYWTmCYjKa7SsR0Ib+tb8uPWowyV2V8zGCb7uc+5NEg9GZeANcOi3xUyaoDmHS
	Ak/Q==
X-Gm-Message-State: AHQUAua+2i8QmzoAMHvBl3CrUuxHdJvZetoACAspF3L/Q8g/AsXqEolf
	I0oBLiqWbXKWrTzFPcz/HSWAbA==
X-Google-Smtp-Source: AHgI3IYot1f5CZZ2mMHGQNoJd99Pdm0q8oOVGb6Rx3qbxbnsgND8E8ei+PNADZ4Qxhm4KUa7zM7SDQ==
X-Received: by 2002:a17:902:2ec1:: with SMTP id
	r59mr6629969plb.254.1550013717605; 
	Tue, 12 Feb 2019 15:21:57 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g128sm12926226pfb.121.2019.02.12.15.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 15:21:56 -0800 (PST)
Date: Tue, 12 Feb 2019 15:21:56 -0800 (PST)
X-Google-Original-Date: Tue, 12 Feb 2019 15:21:47 PST (-0800)
In-Reply-To: <20190123092538.8004-1-kbastian@mail.uni-paderborn.de>
CC: sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-0fc7cd00-deda-4e41-abb3-c78657c4f0f1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [PATCH v6 00/35] target/riscv: Convert to
 decodetree
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
X-List-Received-Date: Tue, 12 Feb 2019 23:22:01 -0000

On Wed, 23 Jan 2019 01:25:03 PST (-0800), Bastian Koppelmann wrote:
> Hi,
>
> this patchset converts the RISC-V decoder to decodetree in four major steps:
>
> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
>     Many of the gen_* functions are called by the decode functions for 16-bit
>     and 32-bit functions. If we move translation code from the gen_*
>     functions to the generated trans_* functions of decode-tree, we get a lot of
>     duplication. Therefore, we mostly generate calls to the old gen_* function
>     which are properly replaced after step 2).
>
>     Each of the trans_ functions are grouped into files corresponding to their
>     ISA extension, e.g. addi which is in RV32I is translated in the file
>     'trans_rvi.inc.c'.
>
> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
>     we convert the arguments in the 16 bit trans_ function to the arguments of
>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
>
> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
>     this move all manual translation code into the trans_* instructions of
>     decode tree, such that we can remove the old decode_* functions.
>
> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
>    by Richard. [Patch 31-35]
>
> full tree available at
> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v6
>
> Cheers,
> Bastian
>
> v5 -> v6:
>     - fixed funky indentation
>
>
> Bastian Koppelmann (35):
>   target/riscv: Move CPURISCVState pointer to DisasContext
>   target/riscv: Activate decodetree and implemnt LUI & AUIPC
>   target/riscv: Convert RVXI branch insns to decodetree
>   target/riscv: Convert RV32I load/store insns to decodetree
>   target/riscv: Convert RV64I load/store insns to decodetree
>   target/riscv: Convert RVXI arithmetic insns to decodetree
>   target/riscv: Convert RVXI fence insns to decodetree
>   target/riscv: Convert RVXI csr insns to decodetree
>   target/riscv: Convert RVXM insns to decodetree
>   target/riscv: Convert RV32A insns to decodetree
>   target/riscv: Convert RV64A insns to decodetree
>   target/riscv: Convert RV32F insns to decodetree
>   target/riscv: Convert RV64F insns to decodetree
>   target/riscv: Convert RV32D insns to decodetree
>   target/riscv: Convert RV64D insns to decodetree
>   target/riscv: Convert RV priv insns to decodetree
>   target/riscv: Convert quadrant 0 of RVXC insns to decodetree
>   target/riscv: Convert quadrant 1 of RVXC insns to decodetree
>   target/riscv: Convert quadrant 2 of RVXC insns to decodetree
>   target/riscv: Remove gen_jalr()
>   target/riscv: Remove manual decoding from gen_branch()
>   target/riscv: Remove manual decoding from gen_load()
>   target/riscv: Remove manual decoding from gen_store()
>   target/riscv: Move gen_arith_imm() decoding into trans_* functions
>   target/riscv: make ADD/SUB/OR/XOR/AND insn use arg lists
>   target/riscv: Remove shift and slt insn manual decoding
>   target/riscv: Remove manual decoding of RV32/64M insn
>   target/riscv: Rename trans_arith to gen_arith
>   target/riscv: Remove gen_system()
>   target/riscv: Remove decode_RV32_64G()
>   target/riscv: Convert @cs_2 insns to share translation functions
>   target/riscv: Convert @cl_d, @cl_w, @cs_d, @cs_w insns
>   target/riscv: Splice fsw_sd and flw_ld for riscv32 vs riscv64
>   target/riscv: Splice remaining compressed insn pairs for riscv32 vs
>     riscv64
>   target/riscv: Remaining rvc insn reuse 32 bit translators
>
>  target/riscv/Makefile.objs                    |   22 +
>  target/riscv/insn16-32.decode                 |   31 +
>  target/riscv/insn16-64.decode                 |   33 +
>  target/riscv/insn16.decode                    |  114 ++
>  target/riscv/insn32-64.decode                 |   72 +
>  target/riscv/insn32.decode                    |  203 ++
>  .../riscv/insn_trans/trans_privileged.inc.c   |  110 +
>  target/riscv/insn_trans/trans_rva.inc.c       |  207 ++
>  target/riscv/insn_trans/trans_rvc.inc.c       |  149 ++
>  target/riscv/insn_trans/trans_rvd.inc.c       |  388 ++++
>  target/riscv/insn_trans/trans_rvf.inc.c       |  388 ++++
>  target/riscv/insn_trans/trans_rvi.inc.c       |  568 ++++++
>  target/riscv/insn_trans/trans_rvm.inc.c       |  107 +
>  target/riscv/translate.c                      | 1781 ++---------------
>  14 files changed, 2611 insertions(+), 1562 deletions(-)
>  create mode 100644 target/riscv/insn16-32.decode
>  create mode 100644 target/riscv/insn16-64.decode
>  create mode 100644 target/riscv/insn16.decode
>  create mode 100644 target/riscv/insn32-64.decode
>  create mode 100644 target/riscv/insn32.decode
>  create mode 100644 target/riscv/insn_trans/trans_privileged.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rva.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvi.inc.c
>  create mode 100644 target/riscv/insn_trans/trans_rvm.inc.c

Do you, by any chance, have a v7?  It looks like there's quite a few merge 
conflicts here, and while I'm OK fixing them I don't want to do it if you 
already have.

