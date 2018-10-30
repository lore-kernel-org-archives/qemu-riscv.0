Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHbTm-0008FW-GG
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 17:23:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTh-0008DW-Nf
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gHbTd-000654-I5
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:09 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gHbTd-00064g-3M
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 17:23:05 -0400
Received: by mail-pf1-x434.google.com with SMTP id h4-v6so6486606pfi.10
	for <qemu-riscv@nongnu.org>; Tue, 30 Oct 2018 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=ICPC+mOQyH+/o7XLA1FEhrt/46+pNRSQwFc7DuOSU1U=;
	b=dW0mSA4Pgcb21YJIG5HWkrTcJ62aZKCIxkGVgvhrpq18gF6doTS+iaFirzQaoPldjT
	dTl/ccqutODsfaYAO0I3c7gRGbIxdYg4AVcoDwIWCjtitI0mM2FlkrstwgFAVE0k58cv
	qXJNruEsLITyI4DDC2J/DcM+8zUrSKRu96UUckKusFcFnCtfv8ZUHrP4rFRwMnYrk7m6
	yr/zvzOM/KJD7b9LKXqnFWEXHiiuBz40eSFH+MIyORatAUcxlcuF2dClhdYLkuMA/rFB
	LnM59VsK+6R40vXiHYENtK9z3SFgndnrShvyYEbuz8rqh2jLgQwgd+eJ4fiUt4XFhaqy
	kwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=ICPC+mOQyH+/o7XLA1FEhrt/46+pNRSQwFc7DuOSU1U=;
	b=GLiCni5UmqL/fK4HTPyouOk80g2lA6OXPYTZAVZJIxFyPSYO7uTKxYHiGO4DVM5hcz
	5Ayf1bkHFqnzw9UtmcsQYVNuFxci+/R4U8SyIVRAu4VEgYTf1DQeogkiAyw60fk9nLe4
	Ld/4lveupCFS22HyFsqNW1UW8g8zC3tlO43wy+p1eSeLH2YFd9RWVzDHUZEWufFs9A54
	imAaLCEzwXKfLYK5NU/eWA7G2Ff5e9tCmWLrxbjVXo9GSU+PVbvJN97kF05lcMO6iRgD
	byMoerJ/27V7JmKNC0elaN+X24v0tCreFJB03jtRujPyXkYmTObwt1s/1sZ+tq/o1Jpm
	uRAA==
X-Gm-Message-State: AGRZ1gLX3N1IXgsooVc2NAzBUWFme1ZzRYqitbNJpVvsKhgnQp6aNerm
	fp+kE2eSIAZqVp/0wG/ceETZOtGxfiA=
X-Google-Smtp-Source: AJdET5cpmsWJTPQxxTds4WyJWLCsv0MGX8mGX5ogtVVaWaPXj0yGh8S7e3VoxG/zv8Y9jkIYU8ioUg==
X-Received: by 2002:a63:8ac4:: with SMTP id y187mr362700pgd.446.1540934582162; 
	Tue, 30 Oct 2018 14:23:02 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f14-v6sm3295195pgr.87.2018.10.30.14.23.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 14:23:01 -0700 (PDT)
Date: Tue, 30 Oct 2018 14:22:46 -0700
Message-Id: <20181030212249.7117-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::434
Subject: [Qemu-riscv] [PR RFC] RISC-V Patches for the 3.1 Soft Freeze, Part 2
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
X-List-Received-Date: Tue, 30 Oct 2018 21:23:13 -0000

Since this is the first time I've actually done this for QEMU, I thought
I'd write up a bit of a header describing how I intend to handle RISC-V
pull requests.  This is modeled after how I've been doing things in
Linux, where it seems to work out fairly well.

My flow is to:

* Collect reviews over the course of the week.
* Tag what I intend to submit on Tuesday
* Push the tag up and send an RFC PR
* Assuming there's no major issues, actually send out the full pull
  request on Thursday

I've been doing this for a while (on Monday/Wednesday) and have found it
works well.  So far we've never had an issue where I had to pull back a
proposed PR, but I do like having the extra few days just so everyone
can stay on the same page as to what is going in.

---

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


