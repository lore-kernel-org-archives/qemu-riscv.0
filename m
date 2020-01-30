Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ix7TJ-00024E-Qq
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 05:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ix7TH-000214-2I
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 05:54:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ix7TE-0003B9-Ry
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 05:54:49 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35817)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ix7TE-0003Ai-Mi
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 05:54:48 -0500
Received: by mail-ot1-x342.google.com with SMTP id r16so2727595otd.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Jan 2020 02:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PrdNuZsGgAmqluD6TrlybQm97PZNBfBcgKFfZrwCcKs=;
 b=DO21fH3KnhnPJl05poBk2M+MYyDyGBTtACn+EDyp5zuN7mnqsR/yE1cQRw7DGE6pgk
 +uE3SClonk7ylEC4MNc70EIOibrxV+kHQt/CwnEE7LYqM8CdI6Jx04IsIyFjyOQl28j0
 ttaSxXGqM6aAh4ujQ7WhQcNpAW4mqmslL/ZMNEB9k2mz7r8PsjFAD5JLDoGRMFVyUt1+
 wWDli8uSEd356mzoOBnNLefsMJnm12Wy+ikHnW8lJy0+xt2vDMz94zi3pmrO5XQv4KzN
 K99EnOzbhRprWMJ4T6l6Crr/uybaSBrM5LtgmXE39IfRhkpMocV5uBwXDdJbtmCaVN3W
 6jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PrdNuZsGgAmqluD6TrlybQm97PZNBfBcgKFfZrwCcKs=;
 b=dcd+l5X+0QLFxXQIa+SGEHYPNmd++j7T7CITaKi8EOtVbqe/uBOcVpNagT7cvi6u0y
 gyeO2+Bq0PhAFW+VNMOhXVyNYeNz5hvSlg0CRqNi+yWWiW8O1LEBb6e4Lb7r1KzQ83dc
 55swc5VagE/jdtaefKgyGNgSdxZF4DGS7oi3/qJjgdZd/EfFk/a5I1ADLClT1w0Sx/R+
 4CNeyslLwACCXWjXlNUOTzhRVNZ6PLDbbMom4LIWpmk8VLITi9ZW8V3OzYu3jt/mW/CQ
 PyuThE+EVb9prEWtYzbxrNxpVAVihNm7r5/XWFpiwAvzIojQC+AplN5OudnpxBPNSVw6
 ZL3Q==
X-Gm-Message-State: APjAAAUxR++nZx2sjocQaTvrYWS7P4+OQg/5XtpH0NwCZP4+9SSlLpqv
 31dpG4VHD0mtvTQoQNkp3PP5ZSf1p7cUYt1UqQnmXQ==
X-Google-Smtp-Source: APXvYqz01xLlTo7egXcYgsYmcrgtlKpwhsRKB3j7tnhm4qAofwwaFUDOsjjKjVXv8QyIU7RpkM6CUj1j9z7pakJXIFo=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr3020111otd.91.1580381687921; 
 Thu, 30 Jan 2020 02:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20200128233224.515233-1-keithp@keithp.com>
 <CAFEAcA_dD3eAfKvOGOoXe3NWKg1PiW8=s2Xk41w19Tk67R-R4A@mail.gmail.com>
 <877e1arz2w.fsf@keithp.org>
In-Reply-To: <877e1arz2w.fsf@keithp.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jan 2020 10:54:37 +0000
Message-ID: <CAFEAcA8Vs5Bp7tPgxLOG_T0350-Y_w7SitNzNuvHZN6AB=b0gg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add semihosting support [v4]
To: Keith Packard <keithp@keithp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2020 10:54:52 -0000

On Wed, 29 Jan 2020 at 16:45, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > True but irrelevant. You need to refer to a proper
> > risc-v specification for your semihosting.
>
> The RISC-V Foundation defined semihosting as relative to the existing
> ARM specification, so using a link to that is appropriate here.
>
> Here's the current specification of the unprivileged ISA, which includes
> the definition of semihosting
>
>         https://riscv.org/specifications/
>
> While it may be nice in some abstract sense to create a "better"
> semihosting spec, that's not what the RISC-V foundation has decided to
> do.

We've gone round this several times. You can't just
say "it's the arm spec", because you're not arm and
your architecture is different. You need to actually
document what the architecture-specific parts are,
even if you want to mostly say "and we follow the
Arm spec most of the time". If you really really want
to say "32 bit RISC-V is gratuitously different from
64-bit RISC-V in these areas because we just blindly
copied the way Arm happened to have historically
developed" then you can do that if you like, but you
need to actually write it down in a document somewhere.

You're trying to implement an ABI which has multiple
different implementations of both consumers and
producers; it's not a good idea to shortcut the
process of actually writing down what the requirements
between the two ends are.

thanks
-- PMM

