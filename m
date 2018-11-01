Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gIMod-0007EU-Jg
	for mharc-qemu-riscv@gnu.org; Thu, 01 Nov 2018 19:55:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMoa-0007Ca-Bq
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIMoV-0005DA-Qp
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:52 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gIMoV-0005Bw-EG
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 19:55:47 -0400
Received: by mail-pl1-x631.google.com with SMTP id p7-v6so113164plk.5
	for <qemu-riscv@nongnu.org>; Thu, 01 Nov 2018 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=03iplpmlO8Zb7ngriQejI9ULMyAa34nqqzslAeC3OzE=;
	b=mFDgp4B4Wu1xUZRaN4eHYXOaJ8qo4v08M2J51R9eIiwAovVmAEUlSyaBDYRUwKq+Tq
	ZlAAHsizW6W0RGF2Fci00lXpT32JaJmV0ljLdhPiggp6tywu+WUyKJWQUsWfHnABtX/X
	nXMD2kf/CH8zlMmofO2oBa+lBgE1uGe61AZQZ3COhQOdLOUnATo7eMbcjJphmzpopbpu
	nE6GzTVpQIymfTWeHuorDnkxyYV7lTw9bdynMITnQhb3eCGKHjwMSt4V4FbNSwDUecKL
	gGpCxN4+llyNYyTElOWBVCA+6TFRC7No5PPHC2unL4td0sUOYE9RN7/G6uK3wmjFdoj2
	KBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=03iplpmlO8Zb7ngriQejI9ULMyAa34nqqzslAeC3OzE=;
	b=QGmHLIDnkgyooVLK5LYq7Au7aXl2uyrcbrbnMAyhMuaBVxsRglAtE+eS7hKXfeNtT2
	vEtyi13VoG9/t0uZ61Qy579XRSmWHtBrqOFsZamlCeoVjOPoO8GNHpYL7ygH9JiIU7lC
	F6B4TJwiRbZeb66ldrjjG5q+0E3TkCo9F2QZPzltFKBTDH+aqWaXwQylU7gPnSKMppm4
	RKKHiDN2FuX8CrS6ui+xDTZDQZFlO7uOAeLz/l7oAAs5L6AvQkocdbw/JUEf/mLMFKB0
	ALFxAnHlEacxe+uYyAsnQ8rthFI9CNYBS421r2vsIFaLv8vOpK8SJx0ILORa+zL7ncjU
	EaxQ==
X-Gm-Message-State: AGRZ1gKfVdYLk8R/11KVAADXWGsx+IbZvwPTYVYl+h8hTVnO2evXJhqq
	odXhjAG0kLx7Dzer5LlDw5dWmQhwwm4=
X-Google-Smtp-Source: AJdET5f/T074rQk/4xclkjSVQpOJZ2vtHCxbYeM50vh3yWQPL8GPrhBk/XsywUsvugo4Yp9V8r2F4w==
X-Received: by 2002:a17:902:bb89:: with SMTP id
	m9-v6mr6610903pls.66.1541116545655; 
	Thu, 01 Nov 2018 16:55:45 -0700 (PDT)
Received: from localhost (198-0-202-11-static.hfc.comcastbusiness.net.
	[198.0.202.11]) by smtp.gmail.com with ESMTPSA id
	131-v6sm4240151pfa.120.2018.11.01.16.55.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 16:55:44 -0700 (PDT)
Date: Thu,  1 Nov 2018 16:55:22 -0700
Message-Id: <20181101235525.29042-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-riscv] [PULL] RISC-V Patches for the 3.1 Soft Freeze, Part 2
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
X-List-Received-Date: Thu, 01 Nov 2018 23:55:53 -0000

The following changes since commit a2e002ff7913ce93aa0f7dbedd2123dce5f1a9cd:

  Merge remote-tracking branch 'remotes/vivier2/tags/qemu-trivial-for-3.1-pull-request' into staging (2018-10-30 15:49:55 +0000)

are available in the Git repository at:

  git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-sf1

for you to fetch changes up to a094b3544f2855c0489f5df3c938b14b9a5899e5:

  Add qemu-riscv@nongnu.org as the RISC-V list (2018-10-30 11:04:29 -0700)

----------------------------------------------------------------
RISC-V Patches for the 3.1 Soft Freeze, Part 2

This tag contains a few simple patches that I'd like to target for the
QEMU soft freeze.  There's only one code change: a fix to our PMP
implementation that avoids an internal truncation while computing a
partial PMP read.

I also have two updates to the MAINTAINERS file: one to add Alistair as
a RISC-V maintainer, and one to add our newly created mailing list.

----------------------------------------------------------------
Dayeol Lee (1):
      target/riscv/pmp.c: pmpcfg_csr_read returns bogus value on RV64

Palmer Dabbelt (2):
      Add Alistair as a RISC-V Maintainer
      Add qemu-riscv@nongnu.org as the RISC-V list

 MAINTAINERS        | 2 ++
 target/riscv/pmp.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)


