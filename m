Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gu2Ps-0003Wh-2X
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 16:50:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gu2Po-0003Ka-U0
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 16:50:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gu2CP-0003Sg-Ku
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 16:36:10 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gu2CP-0003Pf-Ec
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 16:36:09 -0500
Received: by mail-ot1-x341.google.com with SMTP id n8so6936836otl.6
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 13:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y9gPhmJtqmMToS8OhZhYpoGsv9XRtPCXAs3v49i0yog=;
	b=t/KfIwfwiyo0ZxTUO+Nm50e/h6LQm0c1+k9jYNSfMdRny538xDT/ldU4HL3lgeqsD+
	JZwX/nhkte7PXil4IxgcI2rKamk4miLaGTrqzyjdt7Cntj1vtHD5rttudRcUxAUFSNNC
	TOo8j0yK+sJ6sqHvk7QYe+vmG6qkbVlOpLHWodEp4950GvEPLbt2/3NbjV4+sz9sl3Ky
	Co9ELT0NTdzy+FkQFNuU+jEKRoqyNHyTCXYYira0CUe37fa+I1HzNkOX9ZQ8halNdjy9
	2t+lVuoxLfNTWXflFNtDAOPUMLyw3yIE1RACwAHjnA0XRJDkli4UkaWPkVC5XAy9izh5
	4qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y9gPhmJtqmMToS8OhZhYpoGsv9XRtPCXAs3v49i0yog=;
	b=ZJ11NYRoIki9YS848L0U8ktLZGeSdR3JebXogxOL0rTl/I9lJ+UX9ouauzkmOmy5TC
	ZekoL5FHsukqSeGZxgl8iOCqpgSeU3w4TWTXTX9DILsFiUAqWMQenk3j4BozrqTURhPT
	HRU8CidYssdVk7HUja3EWDGPhGuihLJjshNgh84zwHl5nyxWa3UdU8ehmleMB5CREmZ1
	YyaxAVsJ3XBu5weUjscSbrVRheMQkoPf5zJcC4jQO06/HCqZa1J6Aj6ITN7wvX8hwdxe
	NOcEVwuxAMCYI4ts0KsUU7PA5PVnKH4XKKRePTEzChy3JRefVfLv+EPszuHdb0/pJWwk
	b+ow==
X-Gm-Message-State: AHQUAua+OVR3XlqaKD6qq62T+34BBACA50zLcVcnRlvP977GR1H5rn/t
	WpSMBPofHTuXZ7QJHGFzbl0SvvHemkoiQUw4989xKg==
X-Google-Smtp-Source: AHgI3IZ4OdazCkMu7rUiu+u2HVDgLT8Ojj3eCLfDbudl+45n+TBuofIZvA+8i1fTe8iVVg1a22Uuwv78mWjf5hLU5gE=
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr185096otc.238.1550093768258; 
	Wed, 13 Feb 2019 13:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20190212173839.31587-1-chouteau@adacore.com>
	<CAKmqyKOAVDbJQ6avwWgDHP1fHD_EXdZmi+Sjucm05ZqNkQoUog@mail.gmail.com>
	<CAFEAcA_5jYqTWVBiTFjumkAHEEwvDkt_f_LHAo=00gkEfoY9sA@mail.gmail.com>
	<49bd9805-2f40-7d5d-8814-e0a59a9c5be1@redhat.com>
In-Reply-To: <49bd9805-2f40-7d5d-8814-e0a59a9c5be1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Feb 2019 21:35:56 +0000
Message-ID: <CAFEAcA9GD+Cr_nAgz1CxfrWi7OuEZHrz=Gnh1PLrFJo6-BkOtw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair23@gmail.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Fabien Chouteau <chouteau@adacore.com>, Michael Clark <mjc@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] SiFive RISC-V GPIO Device
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
X-List-Received-Date: Wed, 13 Feb 2019 21:50:02 -0000

On Wed, 13 Feb 2019 at 18:54, Thomas Huth <thuth@redhat.com> wrote:
>
> On 2019-02-13 18:14, Peter Maydell wrote:
> > On Wed, 13 Feb 2019 at 00:13, Alistair Francis <alistair23@gmail.com> w=
rote:
> >> I know the other RISC-V files don't do it, but this should go in the
> >> hw/gpio directory instead of hw/riscv.
> >
> > It might be nice to move those existing riscv devices into
> > their proper places at some point: should be a fairly easy
> > cleanup patch if somebody wants to take it on. (Advice
> > on what should live where available on request.)
>
> If devices only work on riscv, they should IMHO stay in hw/riscv/. I
> think hw/gpio/ and friends should primarily be used if a device is
> shared between architectures. If they stay in hw/riscv/ it is way easier
> to match the devices with wildcards in the MAINTAINERS file. Just my
> 0.02 =E2=82=AC only, of course.

This is not the way we generally arrange the source tree,
at least not the parts I'm familiar with. The rule of
thumb I use is that devices of type X go in hw/X, and
hw/$ARCH is only for board models and SoC container objects.
I think the model for this is the Linux kernel, which
splits drivers for devices into directories by device
family, rather than putting them all in arch/whatever.
A split that puts all the architecture-specific device
models in hw/$ARCH has the significant disadvantage that
it would put a huge number of files in hw/arm ...

(More generally, I don't think the exact way we split
the source files between directories matters much, but
I do think it helps if we try to be consistent about it.)

thanks
-- PMM

