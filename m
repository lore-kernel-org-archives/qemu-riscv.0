Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gofwF-0001N0-2G
	for mharc-qemu-riscv@gnu.org; Tue, 29 Jan 2019 21:49:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gofwC-0001LA-Pp
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:49:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gofwA-00078P-R8
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:49:16 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:38790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gofw8-000771-Tn
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 21:49:13 -0500
Received: by mail-vs1-xe42.google.com with SMTP id x64so13354870vsa.5
	for <qemu-riscv@nongnu.org>; Tue, 29 Jan 2019 18:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=RMGv5xDl6uuIF6m8iK9B7NTx+OUzVaDD/G0rjtQ22sI=;
	b=Bb24JmSYhfOeXysK8/eALCO05XQgl/l3BjKm4CsR82HLyse3EtLM+omRiEMXS6iVRP
	7Y92emVaIqYSO6PpXhO7EOq6ZGeEh2mfayHtnUw/KjewUv4guhd8oI2mUYuRDtt1iHZX
	ibpJQRSN7Ydl/kTZMuSnLsy/ww3sWb2OqLcxny4yZp5hcvpXKWUV4Ce02qQF2eiZG0gt
	e25dbZokbmPA2cD8W5jJtJRh12NGPFW8dWPe7yMWR7GvlMAi0d+iy7Fs+zlCly95A2Uu
	wlfKWS4lgibzXzIgVAzfdjuTNPqkexID70M6DvofN4EStP3dfo1DP6eqUVmKTfltocgr
	DOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=RMGv5xDl6uuIF6m8iK9B7NTx+OUzVaDD/G0rjtQ22sI=;
	b=awjBbJWlclanshtltfsDCT0IimamioDhJ7V5lAslSABK5UVQya8GNScbpK4UrO8AIA
	yMpK4rC0h8+9mtHm0By3sFiiIUwsOp/7RsRCoT9bDkjB3quCLPTLURBabO9IX43JyYpf
	iC1E92QVSPM92KPqGrmYyZ+i46i/m2L/4V32fhO+2bQgJ8rf8NKA8j/1tqreBo6gpSBP
	YVkV7sEXmkgWjdXFfrp9jaGFpj0Z0cJNJt2UgINJpKxNFVsoHvpdPG6YGNn2RTH7QBLH
	Ni1LOrKIJ2W97SC4A3tm23JGhOJJrBhv5O4jGKlSNl1WFZUbM31gMYUBi0L7hwpEG7bl
	cx8A==
X-Gm-Message-State: AJcUukf08UMc1e2ZTV6LhlZXBIjboYRZRWQMfMDMn+o1FsIBokJIX7/0
	U+W/hhbNfAhTvXDmtB89JIocNNgIwz21FCvcQZ2E3A==
X-Google-Smtp-Source: ALg8bN4lPCMT4dmHL6NQ5OcvKQP40onThbJrdADeXvD6WwrqKTmcBxuY/FDSwS3588bOfTfQ9KWlW5OK+CB64lEdvtc=
X-Received: by 2002:a67:e0d4:: with SMTP id m20mr12120976vsl.182.1548816550857;
	Tue, 29 Jan 2019 18:49:10 -0800 (PST)
MIME-Version: 1.0
From: Jim Wilson <jimw@sifive.com>
Date: Tue, 29 Jan 2019 18:49:00 -0800
Message-ID: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e42
Subject: [Qemu-riscv] [PATCH 0/5 v3] RISC-V: Add gdb xml files and gdbstub
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
X-List-Received-Date: Wed, 30 Jan 2019 02:49:17 -0000

This is the 3rd version of the patch set, updated as per the review
from Richard and Alistair, and updated for current top of tree.  Parts
1 and 2 are the same.  Part 3 is smaller because some of it was moved
to part 5.  Part 5 is bigger because it received part of part 3.
Parts 4 and 5 have changed because the csr support was rewritten.  The
illegal instruction traps are no longer inside the csr support code,
but it still has mode checks that I need to disable, so I still need a
debugger mode, but it doesn't do as much as before.  Also, what was
one function is now about one hundred functions, so rather than add a
debugger parameter to lots of functions that don't need it, I put it
in the CPURISCVState struct.  This also helps fix a bug, because
debugger mode is only appropriate for system qemu, and should not be
enabled for user qemu.  The new patch set gets this right.  As a
result of this, part 4 also ends up smaller, and part 5 is rewritten a
bit to use the new interface to the csr support.  Otherwise it is
effectively the same code as before.

Jim

