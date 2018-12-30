Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gdhCg-0007ix-99
	for mharc-qemu-riscv@gnu.org; Sun, 30 Dec 2018 14:56:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gdhCd-0007i9-Om
	for qemu-riscv@nongnu.org; Sun, 30 Dec 2018 14:56:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gdhCc-0007VH-T2
	for qemu-riscv@nongnu.org; Sun, 30 Dec 2018 14:56:51 -0500
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:33110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gdhCc-0007Uq-OG
	for qemu-riscv@nongnu.org; Sun, 30 Dec 2018 14:56:50 -0500
Received: by mail-ua1-x942.google.com with SMTP id t8so8227778uap.0
	for <qemu-riscv@nongnu.org>; Sun, 30 Dec 2018 11:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=imCq807nB1pkD2IllxlKhjSLyWGJXtMcu5RIBMKifR8=;
	b=nPkDKc4PyoV+d464mUglgTbgxOGnAOBYMfZlBafZSPQE71InuvaqYIOAR5dqrvFWQS
	6+jANBfke3sUBngD9v12zaTEKjb9K4TYpmRTSl9bjP+S9e6lt5j4axIcOq0lfSN0PYJi
	1em1iBG8eZKQRQyZmdFJyAaCp+q5xfdR2HKLwAyA1CFs2OIEYbo8X+HYqDBtBHjgPEmX
	DN0UMU99prxa16OmhRxEiwrZH88k7BcqN6bfmTXwFXCoC5oQferO0gTq+rDtuZj3D9Fp
	crFy1Q6kzfWaN/lvpxVwP4ITQA9dKNcUsbwa6jhyn0X3vj6YfWFjc3NWfMZhJlG8f1r3
	HfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=imCq807nB1pkD2IllxlKhjSLyWGJXtMcu5RIBMKifR8=;
	b=KMyAVYX33Ki7BEle81UgLLytpXT37lSIdcPm8BcpwxzR5AEgCRR2YqKdIem9SC7WXy
	FTd5tLqMyIE1aLxWNXonIORR3vzNTG+Bllc698nZtnYiY6YVAnXScTEioKerTlzZTM3s
	u7TtglFd4Z4J4Qfpu0FTFeL1xUwCXQmI8Azp6RDFvKewoQqoojcqg143KmK0FJXAKvWo
	8ufyCZbEk6HJMNEyelzQ4KWZHxZOdmnado5IoikoBbooEbr8IrqDPZFK9NVdg/bL015y
	BNxarDRxmKYnTpmW2IElDZxu9o406Dlm+j9WR5+bld6uKyW2dAQNe8wUGOMTsfLrS3jg
	2tYg==
X-Gm-Message-State: AJcUukdTXOku5hFA0sVjpS7a1Yy63VHH0Iy163RAmk/zx6JEaXO5Lb2v
	i1AISkp95UDyyWJkp//eJlyINxt0hJ3E7iT27A9aMA==
X-Google-Smtp-Source: ALg8bN4NM4jt1IyrrYz/41mflR0O45iRFHmM+wQn/nqFKORX/tkxmWd4Cl2Mdw5WIHV3fnd5RXFczSxwpJBNJGyoMCI=
X-Received: by 2002:ab0:7db:: with SMTP id d27mr12346588uaf.4.1546199810051;
	Sun, 30 Dec 2018 11:56:50 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228220731.4753-1-jimw@sifive.com>
	<bcf78767-a96e-8ba4-52da-97b34b3cb3ba@linaro.org>
In-Reply-To: <bcf78767-a96e-8ba4-52da-97b34b3cb3ba@linaro.org>
From: Jim Wilson <jimw@sifive.com>
Date: Sun, 30 Dec 2018 11:56:39 -0800
Message-ID: <CAFyWVaaTk_0cimE1z3p6vyT9hCvC4bF46KkooedFkz-QKP6g=w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::942
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/5 v2] RISC-V: Add 32-bit gdb
 xml files.
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
X-List-Received-Date: Sun, 30 Dec 2018 19:56:52 -0000

On Sat, Dec 29, 2018 at 2:20 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 12/29/18 9:07 AM, Jim Wilson wrote:
> Don't the csr's vary between priv-1.9.1 and priv-1.10?

There are a few csr's that disappear in 1.10, but there is no known
hardware that implements them.  There are a few csr's new in 1.10, but
I don't know of any 1.9.1 systems that can run the software that
requires the new registers.  There are a few that change name; the
toolchain supports both the old and new names.  On the toolchain side,
currently, none of the tools care about the privilege spec version.
And the linux kernel doesn't care about the priv spec version either.
This will eventually have to change, maybe with 1.11, but so far it
hasn't been an issue with any software I've seen.

qemu has an option to specify the priv spec version.  But looking at
the csr's, this affects two of the registers that disappeared, which
were never implemented in hardware, and aren't supported by gdb.  This
also affects a few registers that have new fields in 1.10, but gdb
doesn't know about those internal register fields, so this doesn't
affect gdb either.

> I wonder if it would be better to auto-generate these, via the
> gdb_get_dynamic_xml hook.  That way you don't need near identical copies for
> 32-bit vs 64-bit.

I haven't tried looking at this, but I don't see a convenient list of
implemented csr's.  This list would be every csr that the
csr_read_helper function in target/riscv/op_helper.c supports  That
function requires some machine state that includes the register
values, so it doesn't look convenient to use, unless we add more
hackery to it.

Long term, it would be useful to have target specific csr register
lists.  Most csr's are optional, and most hardware only implements a
subset of them.  This is somewhat orthogonal to what I'm trying to do
here, but this would require a list of supported csr's in the target
hardware file, then this would have to be fed back into
csr_read_helper somehow, and then we could also use this to generate
an appropriate xml csr register file for that target for use with gdb.
Openocd already does something like this for a few supported targets.

Jim

