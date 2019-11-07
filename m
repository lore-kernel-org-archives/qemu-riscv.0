Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSm65-0003AY-Vw
	for mharc-qemu-riscv@gnu.org; Thu, 07 Nov 2019 13:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iSm5z-00033l-4S
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:01:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iSm5x-0005xI-3L
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:01:22 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iSm5v-0005vm-7L
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:01:19 -0500
Received: by mail-ot1-x343.google.com with SMTP id n23so2766916otr.13
 for <qemu-riscv@nongnu.org>; Thu, 07 Nov 2019 10:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QLPMILH9Am1e1pRaM3fL2+ZRqB+1lVT4Qo02XzZ4mk4=;
 b=yKRP3LtmMcoAdqC26lP9ifieVNGgdNVwb4keCWDbt38lhhas1XCa37UV7/jxeC7eFg
 I4H9jFmDXyenZICG7X/ile7j8+NAyQzdyUOiEIPZR8bIYvkrb385tsVDcfp+05yZMmU+
 5PW1XBX7PqQfVSezFV4DvAdI20dNZ/WHd0wWskEaQmVvYN+FKU2H5VPeT9LHaqu0UnIB
 3uPUNRhOIP6NYVOwa7zBoFviHIuxFBYObPVSFqqVHMDFcLOaVcN6zDCkqv7ZoPS2//b8
 yGi1Bb8UHDZX6AcS8NqmMFgO8pua+jllIWBDX1ihLNBSvzhc040DLchggSdQ3/W8LtXf
 AQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QLPMILH9Am1e1pRaM3fL2+ZRqB+1lVT4Qo02XzZ4mk4=;
 b=jX/3uYSi0l/6ItfhUy1xyJQZVJYhKf0PB2JTefRVlua++C1q4SUjVAAT9yBkNewcew
 xOI82SRHYTzE7PtzW6bnpIcEqrcx/q8WXEdKjzhUyBywK0y8SR7WBy3L3Y2PUTDHID22
 5GaSdPVFXmJ9SbBPYcJgA6LTKEAUs3RFiYZ0LOf1fbegq1eYkNArEAuBqoWENcT7FKil
 Pt5q/oLeyW38llDeRnDilMBqeiilkiZWZGUVWSA9k+PITyhVnX3WFCwnHPOVe++LLAtm
 eXiR76frSd01Fhg5kE98NIg48QvOSgQuF/y1ynocOKVne+1qqIDW6U0dnhDzzUcKvUu7
 vcRQ==
X-Gm-Message-State: APjAAAWTCYCnmW76mlO7jHlgJoDdZJT1JpJQ72ZMi9tJEfnBXFersyms
 OiuSMTkKXWfLQTDU4o/AW6PA58nn3D4lI0+ryxxb7A==
X-Google-Smtp-Source: APXvYqwciffcph1l800dGrbynVRr12rMouK0JMs3akfp83xorl4Q2x5H7zDBmK152Kr1IcAOk+8vwsw7vJMWOi3jf3M=
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr4317335otg.232.1573149677554; 
 Thu, 07 Nov 2019 10:01:17 -0800 (PST)
MIME-Version: 1.0
References: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
 <mhng-35530489-a164-4825-90da-e550083fef9d@palmer-si-x1c4>
In-Reply-To: <mhng-35530489-a164-4825-90da-e550083fef9d@palmer-si-x1c4>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Nov 2019 18:01:06 +0000
Message-ID: <CAFEAcA8YU5pp5xwqJSBqLtChp1WFmGFLUsHjnWPGk6+k1MtV3Q@mail.gmail.com>
Subject: Re: [PATCH for 4.2 v1 1/1] riscv/virt: Increase flash size
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, 
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-List-Received-Date: Thu, 07 Nov 2019 18:01:25 -0000

On Thu, 7 Nov 2019 at 17:09, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 06 Nov 2019 16:47:20 PST (-0800), Alistair Francis wrote:
> > Coreboot developers have requested that they have at least 32MB of flash
> > to load binaries. We currently have 32MB of flash, but it is split in
> > two to allow loading two flash binaries. Let's increase the flash size
> > from 32MB to 64MB to ensure we have a single region that is 32MB.
> >
> > No QEMU release has include flash in the RISC-V virt machine, so this
> > isn't a breaking change.
>
> Even if we had, I wouldn't consider it a breaking change because it adds to
> the memory map so existing programs will continue to run fine.

I have a feeling you may find that some old command lines won't
work any more because they specified a flash contents binary
that was the old 32MB and now it needs to be padded out to 64MB.
But I haven't tested whether this theory is correct (it will
depend on how the flash contents are specified -- --bios will
be ok, as will loading contents directly as an ELF file or
similar, specifying contents by a -drive option intended to be
consumed by the pflash is the case which likely needs extra padding.)

thanks
-- PMM

