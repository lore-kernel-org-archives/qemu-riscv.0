Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwta-0002AN-Dw
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtO-0001yn-Kk
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtM-0002wz-3Q
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:10 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtL-0000qC-Oc
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:07 -0500
Received: by mail-pg1-x52f.google.com with SMTP id i130so1323281pgd.1
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=smx3OqeB2JTeh9mGnu95iZWpQffS83tmuMIb87jUJtU=;
	b=F4dR0H1h58Zed9CMiwyTLHTiMHl0+VnWOZxOMju7wEz3L5xHFgwLzD5knnMbXNsrC6
	xqskz1wrNCyGOSqWI8nB/V7PLyQXgQFsWqBaTbdduIlk7l/zKuZF75hkdN4zobxcpq1z
	qGPUjpMrEnkgS2JYoxLtPs59fj47fRhpZymPP7uKmOXeIGAIMSdukSqWRj6J9u8Gmj1C
	GJECpEgHVA28n3Ce9TZY7p6VmNmLQJZsf6sKuHzTKnX/pjv8esI4s3jC6ETnwa0RypNt
	p9JOxohrJZ0ybjKW2K3PM2OVgRZxYX/tfgUlG3xpg31dvq0V2iHT1EXVXXxc8NBplScK
	sO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=smx3OqeB2JTeh9mGnu95iZWpQffS83tmuMIb87jUJtU=;
	b=EVxNiWBQ56nl812LGaiKgfwFjr9BIvbx6WSlka7rVvhaU+FQ8gICoROYkSe/5OuCzK
	e57wLfZAGCLqefVHJowf96PdOcJqU8rQE4hhC+GDqqDOQAl2bGjxtGw5j7Q6Ac5W+urE
	fivS7ETvFA427Bn3umVwTynlWXaFLlDXMQMug0htjuZDOZa4D8AZAKc7+CFf5AE+7R1G
	LGrT/JpLLzzICdiwI0nddmB9Vr06ykLJ1mSsB1Lspor24K/pR93oZMDyTW1ZWYsTbFE6
	SNurOH1Q66LB0cUuF9ah+JlZ9hbWuUvIG5z2O3UdUhop+/fDd8tpvlugSM4wzVCOh89B
	dS+g==
X-Gm-Message-State: AHQUAuZfiC0hXZ8Ic+GmUVljZcPz4qsz+am5h0liFTx6OqD5jRieMM8G
	WjNpa4UOp7DB416M3YJYg+uanQ5dluc=
X-Google-Smtp-Source: AHgI3IZXliVQTlX1Oy3LR4XQPBbXGIHI7kFqLOwOzGHrCVEiddBebmCKQ24phP4Xw6pHBUAeCPTOQg==
X-Received: by 2002:a63:5518:: with SMTP id j24mr1058334pgb.208.1550073276519; 
	Wed, 13 Feb 2019 07:54:36 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	125sm21327883pfg.39.2019.02.13.07.54.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:54:35 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:39 -0800
Message-Id: <20190213155414.22285-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52f
Subject: [Qemu-riscv] [PATCH v7 00/35] target/riscv: Convert to decodetree
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:21 -0000

Palmer: I caused some merge conflicts in Bastian's patch set so I
figured I'd attempt to clean these up.  As far as I'm concerned v6 was
good to go, but since the merge conflicts were fairly extensive (if
somewhat mechanical) I'd like to pass the baton back to Bastian here for
at least a sanity check.

Hi,

this patchset converts the RISC-V decoder to decodetree in four major steps:

1) Convert 32-bit instructions to decodetree [Patch 1-16]:
    Many of the gen_* functions are called by the decode functions for 16-bit
    and 32-bit functions. If we move translation code from the gen_*
    functions to the generated trans_* functions of decode-tree, we get a lot of
    duplication. Therefore, we mostly generate calls to the old gen_* function
    which are properly replaced after step 2).

    Each of the trans_ functions are grouped into files corresponding to their
    ISA extension, e.g. addi which is in RV32I is translated in the file
    'trans_rvi.inc.c'.

2) Convert 16-bit instructions to decodetree [Patch 17-19]:
    All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
    we convert the arguments in the 16 bit trans_ function to the arguments of
    the corresponding 32 bit instruction and call the 32 bit trans_ function.

3) Remove old manual decoding in gen_* function [Patch 20-30]:
    this move all manual translation code into the trans_* instructions of
    decode tree, such that we can remove the old decode_* functions.

4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
   by Richard. [Patch 31-35]

full tree available at
https://github.com/palmer-dabbelt/qemu/tree/riscv-dt-v7

Cheers,
Bastian

v6 -> v7:
    - Rebased on top of riscv-for-master-4.0-sf1, which contains a
      refactoring of the original translation code.
    - Added handling of mstatus.fs to the floating-point routines.

v5 -> v6:
    - fixed funky indentation



