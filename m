Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8g5D-0002CI-34
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 03:01:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8g5A-00024s-J5
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 03:01:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8fyI-0002iO-Du
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 02:54:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40775)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h8fyI-0002hw-6L
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 02:54:06 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b11so1186490plr.7
	for <qemu-riscv@nongnu.org>; Mon, 25 Mar 2019 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:mime-version:content-transfer-encoding:cc
	:from:to; bh=Qp6PdpskFFFXZCSL+8uXVw2Wm3rLxgkaSCENALC20OQ=;
	b=Wm1leYNGnO0mnM78Sn0yuzA+xLinDlH789CMF1sR9htBSdx8DyLvvxEHFLbRjv2KSO
	6WV/+ziIEWX9eKUcn+vOdwcwuQy7yEvzxSalcX/AW3mPsNoOieT3cabR1vAVPuHFckCY
	6sM0tFjnRrkLLsau2b1+ga7uSVJLQ/rpu8pcdZMNgUph9j8ENTEGtBZTp8cdiYUot0yX
	Q/U35TIT+0PmldaiJ0mvr4hMtIRh25J1D5u9EUiZrJQvJd5YC75Y1ceCAqbFnw2ukli5
	/+1OBV/+f48ish/I9LhxUQivT8xPtSqBCkEOpI6SppKvJjoceLvFzuOVgReKyFp2EAhi
	C8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=Qp6PdpskFFFXZCSL+8uXVw2Wm3rLxgkaSCENALC20OQ=;
	b=caOkCwQsa6U/APRs2HiTbtiJNcxiIRxouBI8SwmKhiau78R32poZe/JthUX68YyoQ5
	HTETOjHdqIOqxaYfZbWlO3fCicBJ1tT5C+HSmlFC73M2ME93/xUCLW6/X/Ji8IEV+ZWp
	EDGiPgm/fFZQqBecVeV3XA9HfXA8e9CIUYxK72ayNhe3//ttUCpJEMylGrckOUJEdE1G
	3HPYmCrs9kdjGrrMTcnv4Dj539nLSGkMxcLuPIVWPE+aJBtRJbKFv73EN6OCNNmVGiM7
	Qjyzp8LP1Liy4x1QnRFVTQp3BufJBvnmDTF8bXbfmlfgOmRHQu091S8ZXj8F4MFMgjfy
	07iQ==
X-Gm-Message-State: APjAAAV84KikcOJfj9Lc5hdnghbQ4yyucpZDuaPPBK753coWFxxHWcJg
	XdlH7nVViXIvFS12N908tIySXg==
X-Google-Smtp-Source: APXvYqx2RJh8DIaLpqA5qczioJNlNksKOR1wIDyGeSzMolOca1fJoG7CrcQZuYMQvKGOiHcVVq2fpw==
X-Received: by 2002:a17:902:5a5:: with SMTP id
	f34mr29754791plf.35.1553583244426; 
	Mon, 25 Mar 2019 23:54:04 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
	[2001:b011:7001:1270:b809:36ef:31ed:7980])
	by smtp.gmail.com with ESMTPSA id
	g67sm23670790pfg.94.2019.03.25.23.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 23:54:03 -0700 (PDT)
Date: Mon, 25 Mar 2019 22:56:06 -0700
Message-Id: <20190326055607.14694-1-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62b
Subject: [Qemu-riscv] [PULL] A Single RISC-V Patch for 4.0-rc1
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
X-List-Received-Date: Tue, 26 Mar 2019 07:01:13 -0000

The following changes since commit 62a172e6a77d9072bb1a18f295ce0fcf4b90a4f2:

  Update version for v4.0.0-rc0 release (2019-03-19 17:17:22 +0000)

are available in the Git repository at:

  git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-rc1

for you to fetch changes up to f17e02cd3731bdfe2942d1d0b2a92f26da02408c:

  target/riscv: Zero extend the inputs of divuw and remuw (2019-03-22 00:26:39 -0700)

----------------------------------------------------------------
A Single RISC-V Patch for 4.0-rc1

If this is too late I'm OK with it being in rc2, but it fixes a concrete
regression and nobody has complained yet so I'd prefer it to be in rc1
if possible.

The fix is to zero-extend the inputs to DIVUW and REMUW, which was
exposed by the GCC test suite.

----------------------------------------------------------------
Palmer Dabbelt (1):
      target/riscv: Zero extend the inputs of divuw and remuw

 target/riscv/insn_trans/trans_rvm.inc.c |  4 ++--
 target/riscv/translate.c                | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)


