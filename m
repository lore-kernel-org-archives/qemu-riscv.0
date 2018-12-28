Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gd0UB-0005rZ-SH
	for mharc-qemu-riscv@gnu.org; Fri, 28 Dec 2018 17:20:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gd0U7-0005Iz-Rv
	for qemu-riscv@nongnu.org; Fri, 28 Dec 2018 17:20:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gd0Gf-00056b-CM
	for qemu-riscv@nongnu.org; Fri, 28 Dec 2018 17:06:10 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:39565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gd0Gf-00056I-7W
	for qemu-riscv@nongnu.org; Fri, 28 Dec 2018 17:06:09 -0500
Received: by mail-vs1-xe42.google.com with SMTP id h78so13708159vsi.6
	for <qemu-riscv@nongnu.org>; Fri, 28 Dec 2018 14:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=W9/vjzhPdbumhkH9piUbeikPgVDyvN2D74ao/eJmjg4=;
	b=dd8xs0S9woHdAxNeIbAWFwVxoOG/mnCmgHExW9hky9YwgyC0WEBCcG/Q9OXo4RDxlN
	GtLoyivFLMa+76b+fxkssdgjHjvrLHMZfPM8Avp3ZFmEOyicfZkl3XvXcJXLa7uBIEB8
	AavN2+o2LqJhR9M0xN+qkv/axFDUf0VDElewstXdHQ8w8YIDGU3M40V6j7yfMDOcvfbZ
	1B9cbN+xcnekYL7bwx8D1eO3IMulFROGCn3f240E63s6dOpYXXIq2PduMQzgdcq0bA0F
	MFn+3LCjFBbE+U4YCnSDyKKeunF5DVlHUE4yaHZpHK0fmhj3kmCWUoONz9U+zDaEEFgg
	nHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=W9/vjzhPdbumhkH9piUbeikPgVDyvN2D74ao/eJmjg4=;
	b=EUsmRtfdKR/PTbHC4vm4Dvo3te44ZNXnsbhDNRor5KNBfZe8UKGVEe7lj1mNM9pQbM
	j8rufavBphETLFbFJ+CSLWRP4l8/+HDMSS7HB1m7iBenC85TfaY2xF/sIy3OrG/6+oPO
	4tolIzvD+4Jyu+sCd31Y7nAUADVQ/KZGV+yuQac+lAdl5+2K24YxQfZPqNRGfmKJ0nhP
	CPQLtii8Cxtlz4tsk02hfdXD5tcMGoLOSL2c9vEuRsY3iKTNfMCGb5OdI3HEApEzB/ZB
	Pnh//v5t64Yf1ONgMFDEzWA5KzZP3dGlevGGdRV2Ny1hkUAqFcgyQyG1VyNBfuvIv6AU
	742g==
X-Gm-Message-State: AA+aEWbpbIIbZwFQNTQ98B1gn1R9FqY+Pe6Or/d6D6FiMrLTGxqSM3NM
	rTPzilxoqV3iYJNO5FNPHpjbC1esCjhilTkZidv5xg==
X-Google-Smtp-Source: ALg8bN62x8xo/dFNcw/NeKM9YNdGJVRAEBJkR2oF+phH/b3dxehxA+ku92QGrNlvKJFZvMEoZMDxgUkq174XCluMFnQ=
X-Received: by 2002:a67:4e5d:: with SMTP id c90mr11953130vsb.72.1546034768060; 
	Fri, 28 Dec 2018 14:06:08 -0800 (PST)
MIME-Version: 1.0
From: Jim Wilson <jimw@sifive.com>
Date: Fri, 28 Dec 2018 14:05:57 -0800
Message-ID: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e42
Subject: [Qemu-riscv] [PATCH 0/5 v2] RISC-V: Add gdb xml files and gdbstub
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
X-List-Received-Date: Fri, 28 Dec 2018 22:20:05 -0000

This is the second version of the patch set.  I haven't gotten any bug
reports for the patches in the several weeks that they have been
available, and no review yet, so the only significant difference from
the first version is that I ran them through checkpatch to fix style
issues, and I sent them to the right mailing list this time.

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

