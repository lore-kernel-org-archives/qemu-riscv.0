Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWtY0-00057c-Tv
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 20:42:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtJ8-0000zw-7d
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:27:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gWtJ7-0008Ca-Gb
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:27:26 -0500
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:42862)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gWtJ7-0008CE-Bn
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 20:27:25 -0500
Received: by mail-vs1-xe44.google.com with SMTP id b74so10112236vsd.9
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 17:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=oz3JpcIKLpmlN/zSYZhA8LMMJDRJ2BXVdQT+TUa0TpE=;
	b=mJjlA22Ct5tgGdspM7YnlHb/6OlJIqVxsjjLFjeXwyEflgpdhzFzDBMJUBn5TxGMPg
	ihqhn9JkpdDs4b1HBXNJcRDqWX70XE2Na8wqvCuthyj7fPqOCSq3xRSA2SgvrwniKT88
	bS7H8r2yiWnSAE78JIlFL3HFpNmlD5Co6JOI+NBctgjD5BeUf0PECH/jtPNmZVOtkAUC
	oooz2aPlpQlVeMpuJhhc6COgo1cMX3v8t2h59cl1YMZmFGzzE2U0w6rlvP1SUOjlDqcc
	7tgMdEYA2AAeOwn1WHvEGoFVcgPhvqkBHIELvrt/bQaW1qFigxg/uuxsZp7pvMtSWyfI
	DZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=oz3JpcIKLpmlN/zSYZhA8LMMJDRJ2BXVdQT+TUa0TpE=;
	b=NSOXm2ZJA9vwBRoOQ/H58k7AwvZkEEL3G8eUZlRC3tcJzHFFAC5Mm9rfHwLhlcCHJw
	QB6fjphk8AtRVqM9puFgL3hd6GTJM5HHw6WpxRcs0Ug48TXK8yy6PnfM0pqkr7cYjgJK
	hRo4A1DMkFHiCbam4YUef95ZCr6PKcRTE7pzzDf6Xctv46cOAGvpWjcTzWC6Xel5CZ7p
	JvnZHsOQds+K/SLRu14jFqfc8U0gP23asLMD5RxRAf8iH6CUq9lGemNq78wEzL4u1vF/
	B2Ed0NmD/lovBap56K61EqS+Vu+A50FgtCHCbBKa4u/qGjziDzIMOzv3cWx/6RTWhzjP
	Gckg==
X-Gm-Message-State: AA+aEWZrjtbQm7phGyDQFCdemh7InUuCpO6k9j4t4H/YC3V4b7atQJ7T
	LTCkaBiiFHdUu8e+MHz+i9ZQjKwrO2Nm51KYxt5afRhLsgg=
X-Google-Smtp-Source: AFSGD/WqkaghOryh4g2KhNDZMq2/uNJdECwKlurxFA8PNekNQIxAhS4eDHOQakCwIERqmwQCFin2vcCADL3mMxsfVxY=
X-Received: by 2002:a67:1803:: with SMTP id 3mr8391295vsy.172.1544578043376;
	Tue, 11 Dec 2018 17:27:23 -0800 (PST)
MIME-Version: 1.0
From: Jim Wilson <jimw@sifive.com>
Date: Tue, 11 Dec 2018 17:27:12 -0800
Message-ID: <CAFyWVaYFqbGoGkksxYKDJZejOhGOSk6qkEcRm4J4YDwG-pYN=A@mail.gmail.com>
To: qemu-riscv@nongnu.org
Cc: Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e44
X-Mailman-Approved-At: Tue, 11 Dec 2018 20:42:42 -0500
Subject: [Qemu-riscv] [PATCH 0/5] RISC-V: Add gdb xml files and gdbstub
 support.
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
X-List-Received-Date: Wed, 12 Dec 2018 01:27:27 -0000

This is the first version of the patch.  I figure changes will be
required, and I can widen the audience when the patch is closer to
final form.

With these patches, I can run system qemu with -s -S, connect to it
with gdb, and then print any integer, FP, or CSR register.  This
support is currently broken.

The first two patches in the series are just dropping in xml files
from gdb unchanged, with configure support to point at them.  The next
two patches are the inconvenient stuff.  The gdb CSR files are in
documentation order not numerical order, so I need an array to map the
gdb numbers to the actual hardware numbers.  The gdb files should
probably be improved, but I don't know when that will happen.  That is
the third patch.  The fourth patch is to disable all of the illegal
instruction checks when accessing CSRs from the debugger, as it needs
to be able to access them without traps.  The last patch adds the
gdbstub support to use the new xml files which is pretty simple,
though there is an unanswered question in there about what to do with
the FP registers.  Should we try to configure them based on the
target?  Right now I just always enable them which is the simple
solution.  I'm not sure if enabling them based on the target will even
work with gdb or not.

Jim

