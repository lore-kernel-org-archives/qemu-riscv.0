Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gu39F-0002fR-UV
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 17:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gu39D-0002dB-SV
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 17:36:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gu39C-0007Xl-Uv
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 17:36:55 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:46150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gu395-0007Qy-Ur; Wed, 13 Feb 2019 17:36:48 -0500
Received: by mail-lj1-x243.google.com with SMTP id v16so3441561ljg.13;
	Wed, 13 Feb 2019 14:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SF9RnM52o+4eacfmJ5CwSY/eMyVFPKEmNdEmScWXHMc=;
	b=U2IU9EzJNKEwrot5Fe8dscxUR9KUMX+0ShY0EOWPPsEdKPaj6wCBBvjFTUQZ1Cg2IF
	8sZobysq4rd0ivlep59p74/MUW7mmVRR95uuvNNQ9hkix3bGb64OcLaLu/3yzV6jK/8j
	bqYJQtqoqDOYRhphuq75JoIJP2uUzjTTCbhPt5gGTqtciRpfT0t958Pih999VFSnNtmg
	gyXItudBCfriASb+yt6Nv8X29WN9sP28uwbNA27FMd9ivReAwWrWlx/GZzG7EdHE/SZb
	Avvkn2xhcSFE0YQggM4BWAhnNtDeGBt05t4YLOCNFIv3tukeX4b1Dv1ZQ3354Xj5rxXK
	O3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SF9RnM52o+4eacfmJ5CwSY/eMyVFPKEmNdEmScWXHMc=;
	b=RVEkxD3ul1Ae7+vy6M/1Kg4rQjTa6f+oghqYqAxxiQwjyswATEESzIOCoO2hcqfp8Q
	+XWW4WRLzmHOYmyIZ9nlML/T2Sb4wInK7PkpY/VMMTE8IJM4Q65oOq0K8q/dlU/gI80p
	wm9bP73oZb0r2ahKscYlXyzIa36bCjJfa/qjW5DuIr6HY20Yei8xBXUS7QYe7Z2ehk/+
	mSZO0V7tgHoQVD0I0oceZ4tgaz54KfydFtpe5UBzqRTiNs2+aDhq4gcWv1ILG/HqWn7G
	Nq6svVhZPSyAJXlB2JNuVDis+LttNKARguKyAcsac79ZV1+iavHh64Vjay4+eIofEpDi
	gurg==
X-Gm-Message-State: AHQUAuZ/MHoSAGAivAmj8gZgLfQQ99UXKimwx0TOIY/AKgrXmUPHZSt+
	nagrum8CBv5cM+zwaSNQZs2+3WoXbaugd9pNngI=
X-Google-Smtp-Source: AHgI3IaZcpH/5dCw2umLqglL8S0ntTMqlOLqR0d9AchuirC1BeQtS8LCPz7Xr07/Gux4uyB9l1vUX4CptXBJ9Pnj4ck=
X-Received: by 2002:a2e:3308:: with SMTP id d8-v6mr294346ljc.38.1550097399976; 
	Wed, 13 Feb 2019 14:36:39 -0800 (PST)
MIME-Version: 1.0
References: <20190212173839.31587-1-chouteau@adacore.com>
	<CAKmqyKOAVDbJQ6avwWgDHP1fHD_EXdZmi+Sjucm05ZqNkQoUog@mail.gmail.com>
	<CAFEAcA_5jYqTWVBiTFjumkAHEEwvDkt_f_LHAo=00gkEfoY9sA@mail.gmail.com>
	<49bd9805-2f40-7d5d-8814-e0a59a9c5be1@redhat.com>
	<CAFEAcA9GD+Cr_nAgz1CxfrWi7OuEZHrz=Gnh1PLrFJo6-BkOtw@mail.gmail.com>
In-Reply-To: <CAFEAcA9GD+Cr_nAgz1CxfrWi7OuEZHrz=Gnh1PLrFJo6-BkOtw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Feb 2019 14:35:58 -0800
Message-ID: <CAKmqyKNBVusma92pD-Ad5k=2LNqpm7M=Euvih-MhRuDzW4EymA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Fabien Chouteau <chouteau@adacore.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
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
X-List-Received-Date: Wed, 13 Feb 2019 22:36:56 -0000

On Wed, Feb 13, 2019 at 1:36 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 13 Feb 2019 at 18:54, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 2019-02-13 18:14, Peter Maydell wrote:
> > > On Wed, 13 Feb 2019 at 00:13, Alistair Francis <alistair23@gmail.com>=
 wrote:
> > >> I know the other RISC-V files don't do it, but this should go in the
> > >> hw/gpio directory instead of hw/riscv.
> > >
> > > It might be nice to move those existing riscv devices into
> > > their proper places at some point: should be a fairly easy
> > > cleanup patch if somebody wants to take it on. (Advice
> > > on what should live where available on request.)
> >
> > If devices only work on riscv, they should IMHO stay in hw/riscv/. I
> > think hw/gpio/ and friends should primarily be used if a device is
> > shared between architectures. If they stay in hw/riscv/ it is way easie=
r
> > to match the devices with wildcards in the MAINTAINERS file. Just my
> > 0.02 =E2=82=AC only, of course.
>
> This is not the way we generally arrange the source tree,
> at least not the parts I'm familiar with. The rule of
> thumb I use is that devices of type X go in hw/X, and
> hw/$ARCH is only for board models and SoC container objects.
> I think the model for this is the Linux kernel, which
> splits drivers for devices into directories by device
> family, rather than putting them all in arch/whatever.
> A split that puts all the architecture-specific device
> models in hw/$ARCH has the significant disadvantage that
> it would put a huge number of files in hw/arm ...

That is how I understood it as well.

I think some of the current files in hw/riscv/ could be moved, but
they are somewhat border line and we don't have many files yet so I
wasn't bothering yet.

This GPIO device doesn't have to be RISC-V specific so it makes sense
to put it under hw/gpio. The maintainers file will need to be updated
though.

Alistair

>
> (More generally, I don't think the exact way we split
> the source files between directories matters much, but
> I do think it helps if we try to be consistent about it.)
>
> thanks
> -- PMM

