Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAnMx-0006lC-IN
	for mharc-qemu-riscv@gnu.org; Sun, 31 Mar 2019 23:12:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnMv-0006jq-EV
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hAnMr-0002oh-OL
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:15 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hAnMp-0002n7-00
	for qemu-riscv@nongnu.org; Sun, 31 Mar 2019 23:12:11 -0400
Received: by mail-pg1-x532.google.com with SMTP id q1so3971817pgv.13
	for <qemu-riscv@nongnu.org>; Sun, 31 Mar 2019 20:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ugxK8eULXBdhyHcUf6v17GiTsZ4C09/vJVq84MV6HpE=;
	b=Un+oCnGIvyCqPQOlHA8/FZbEpCn5hO0Mkdwm8mfQPxOjv2na/Z4EzGvbQ32JmoWUaj
	ZvBY0p50ztBo05X3xVwNhqVrShW2D1aSai9RTOq+UXE6WUEcejf6kUBtnZ2Ot2eTpcZr
	NctSFJS7BvyVpew2IXbQCyL6gZ+D/7BRYGB9HLw74yIugxVANzitSEyo4L2XI3Vzps/t
	S265GDTreHi7aO9QkLraj2ajDHjGbNclavVBPIco+5Moo5niIjmvS7QwTkPTxIlVYc3k
	ZEizELb+189/v5qotdd3cX6hp+Yjgo/W7T+JrePV+c8QAHKuAK1a95HyV4qCyc2D3wvy
	mIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ugxK8eULXBdhyHcUf6v17GiTsZ4C09/vJVq84MV6HpE=;
	b=M/XT0UcAZFkD5szeexMeYhJxe9gul7kt+7oUQF8DKSEtjG/gnhw+CN/ZOP0TNJDEXs
	26fFnGjO0VaURdk/EVPrFYpXjPHkcFT+ynUvzIo86otUjNliHQMsZmkhRGJabmlwQlgE
	+NGGSNpZrixhswyDFmKpdMrKooM25TU2FxiP1WwlWq/JgY7+knWAopjYr5YXMrz/g73T
	qHJ2reiXjhljJU8aJFFkE7WBYRM8K3zniy++XnzpTI4gEpAsU30JcNMECBKc7GFwIqBG
	iw28zGM/OsnCCK3TbCkjsfSA8LSK3LcQ11GnwPVAyfkFETUYheskEuJ/qtSq0LumBtu7
	4xBQ==
X-Gm-Message-State: APjAAAVAG+XZxsWOfuKLLVhbed9gdKDrZC8J66fkuP2Fz6tpYQC9ksnE
	VNCDv5MsOAJniTi0dlcedCRO6w==
X-Google-Smtp-Source: APXvYqzBRZf+aAR4Z+B995OjtkOMzfXsuNTe0IvhWkd2awW1+xKNtpnWRS16QBQ3OOPYrDAhet6mdA==
X-Received: by 2002:a63:c746:: with SMTP id v6mr6824874pgg.401.1554088327623; 
	Sun, 31 Mar 2019 20:12:07 -0700 (PDT)
Received: from cloudburst.imgcgcw.net ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	c1sm11843954pfd.114.2019.03.31.20.12.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 20:12:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com,
	palmer@sifive.com, qemu-riscv@nongnu.org
Date: Mon,  1 Apr 2019 10:11:47 +0700
Message-Id: <20190401031155.21293-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::532
Subject: [Qemu-riscv] [PATCH for-4.1 0/8] target/riscv: decodetree
 improvments
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
X-List-Received-Date: Mon, 01 Apr 2019 03:12:18 -0000

There's new support in decodetree for pattern groups.
I believe that patch 5, or something close to it, was
posted as an RFC as part of the original pattern group
patch set, but this cleans that up further.


r~


Richard Henderson (8):
  target/riscv: Name the argument sets for all of insn32 formats
  target/riscv: Use --static-decode for decodetree
  target/riscv: Merge argument sets for insn32 and insn16
  target/riscv: Merge argument decode for RVC shifti
  target/riscv: Use pattern groups in insn16.decode
  target/riscv: Split RVC32 and RVC64 insns into separate files
  target/riscv: Split gen_arith_imm into functional and temp
  target/riscv: Remove spaces from register names

 target/riscv/cpu.c                      |  16 +-
 target/riscv/insn_trans/trans_rvc.inc.c | 347 ------------------------
 target/riscv/insn_trans/trans_rvi.inc.c |  20 +-
 target/riscv/translate.c                |  40 ++-
 target/riscv/Makefile.objs              |  15 +-
 target/riscv/insn16-32.decode           |  28 ++
 target/riscv/insn16-64.decode           |  30 ++
 target/riscv/insn16.decode              | 154 ++++++-----
 target/riscv/insn32.decode              |  10 +-
 9 files changed, 205 insertions(+), 455 deletions(-)
 delete mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
 create mode 100644 target/riscv/insn16-32.decode
 create mode 100644 target/riscv/insn16-64.decode

-- 
2.17.1


