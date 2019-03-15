Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4c6P-0006Gw-Br
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 21:57:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h4c6N-0006CN-EP
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 21:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h4c3j-0006rb-At
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 21:54:58 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:45269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1h4c3j-0006r7-0B; Thu, 14 Mar 2019 21:54:55 -0400
Received: by mail-ed1-x541.google.com with SMTP id d21so4850459edx.12;
	Thu, 14 Mar 2019 18:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ajc6GWfVGkoBMdktNCdOavrAxXhqpupoUEPlN0TnEtw=;
	b=qGbGIFRdRPHXKqTp//TiaVD/xDA4ehUwzhLb0iIIvLZcA8mfaqPas0Vuy4tBe8M956
	J19P69z3V8ENzPdhEFAhrzse+ldtwadvNK7BmaNGhaTx1WGrhPbDQuHk1WK4zl14N+Ls
	CfL/3yvug0DkCyij7gBLsltwPViLnImfwMuj+ZoEatYdOE7BNK3mJu9epNdme8pLHzgH
	hK4l/NRq1JzyKLXDDmrJgdP/OQqzYCsgC2hZOYfOOce1f1dVSkxr+jt5qXDb8XmwzSxm
	DIUSs5TYpmjrBoMedsUpa9G8s+jwQHR61PsuE5Ua6el7ZEps59WIRhRtteUTLa0+8AE8
	SmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ajc6GWfVGkoBMdktNCdOavrAxXhqpupoUEPlN0TnEtw=;
	b=Y7cV1QggfpN5PmAOVf+y0jZ8RtnnESGCAsarQQypcdGZjWIAvc6xxQXT6rE8CBoqjW
	tYjH7LvkV74/1q56ZAcx+jtA/ITpIBGgcAnTyn+wlMda7EjwpV3sW+A+0tb1LjcA8Npm
	gqkc78I1+xkWWWeCr2RyPUmtb6Fjlok6QaMIEoD4cKJKSf3LZ0QTr7lOunwvCXDZszoj
	AvdTRBVFrUNO3g2F2VGYdN8uBd4BRsqxYcEt5Rkia5/D+04PxUJndOLIHXLwLNh3coXB
	hCtk6mTGF6qXOt3wPj/A6CBqu3s/dalWLjBOB7KmS+qCffEyYUggneyCAvGi0vTlGftb
	N14w==
X-Gm-Message-State: APjAAAU/mqY9r6Ox4jkuZMS5hlUMiOG30V2sl+SSW/hfeR06QQq7z7B0
	Ff8fqmV5k9hfSydbY1Tg9tuszJzmXP/nyZKNGV4=
X-Google-Smtp-Source: APXvYqz9QEJEM5ywTiem/LMRQdt+l+r3Ak7y6NPsM8NcF4Pqsda15qbEwPxPIt4w0zCmFaWUmCysc0eiylIHQtgYaIo=
X-Received: by 2002:a05:6402:74d:: with SMTP id
	p13mr876082edy.245.1552614892661; 
	Thu, 14 Mar 2019 18:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
	<c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
	<CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
	<e131b4b0eb9109547ce0ed0993665206d6bf983a.camel@aisec.fraunhofer.de>
	<CAEUhbmX=PT-46nqtMqSaGn5xu2tRJ50Sm6kK7b97Xc_Y+6stPw@mail.gmail.com>
	<33758c6945c9b1968247c5b6dfb12418e57e71e0.camel@aisec.fraunhofer.de>
	<CAEUhbmX5ygthHtEoMvRMND3hbmhXrp-ok_hyvAqC+REafNSNbQ@mail.gmail.com>
	<9beff9a660f1c3fd1317a52c6d1b7c7ae211a2dd.camel@aisec.fraunhofer.de>
In-Reply-To: <9beff9a660f1c3fd1317a52c6d1b7c7ae211a2dd.camel@aisec.fraunhofer.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Mar 2019 09:54:41 +0800
Message-ID: <CAEUhbmV9TS1wXfcSFX7P-JEWooXX8JHxW34vtGHLgFy7-z+evA@mail.gmail.com>
To: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
Cc: "palmer@sifive.com" <palmer@sifive.com>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>, 
	"sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>, 
	"Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/virt: re-add
 machine-specific compatible string to /soc/ node
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
X-List-Received-Date: Fri, 15 Mar 2019 01:57:40 -0000

Hi Lukas,

On Fri, Mar 15, 2019 at 5:01 AM Auer, Lukas
<lukas.auer@aisec.fraunhofer.de> wrote:
>
> Hi Bin,
>
> On Wed, 2019-03-13 at 09:51 +0800, Bin Meng wrote:
> > Hi Lukas,
> >
> > On Tue, Mar 12, 2019 at 10:39 PM Auer, Lukas
> > <lukas.auer@aisec.fraunhofer.de> wrote:
> > > Hi Bin,
> > >
> > > On Mon, 2019-03-11 at 23:28 +0800, Bin Meng wrote:
> > > > Hi Lukas,
> > > >
> > > > On Mon, Mar 11, 2019 at 2:03 AM Auer, Lukas
> > > > <lukas.auer@aisec.fraunhofer.de> wrote:
> > > > > Hi Bin,
> > > > >
> > > > > On Sun, 2019-03-10 at 22:57 +0800, Bin Meng wrote:
> > > > > > Hi Lukas,
> > > > > >
> > > > > > On Sun, Mar 10, 2019 at 9:44 PM Auer, Lukas
> > > > > > <lukas.auer@aisec.fraunhofer.de> wrote:
> > > > > > > Hi Bin,
> > > > > > >
> > > > > > > On Sun, 2019-03-10 at 09:07 +0800, Bin Meng wrote:
> > > > > > > > Hi Lukas,
> > > > > > > >
> > > > > > > > On Mon, Feb 11, 2019 at 6:13 AM Lukas Auer
> > > > > > > > <lukas.auer@aisec.fraunhofer.de> wrote:
> > > > > > > > > Re-add the previous compatible string "riscv-virtio-
> > > > > > > > > soc" to
> > > > > > > > > the
> > > > > > > > > soc
> > > > > > > > > device tree node to allow U-Boot and Linux to bind
> > > > > > > > > machine-
> > > > > > > > > specific
> > > > > > > > > drivers to it. The current compatible string "simple-
> > > > > > > > > bus"
> > > > > > > > > is
> > > > > > > > > retained.
> > > > > > > > >
> > > > > > > > > This is required by U-Boot to bind devices early, as
> > > > > > > > > part
> > > > > > > > > of
> > > > > > > > > the
> > > > > > > > > pre-relocation driver model.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I see no problem with U-Boot working with current
> > > > > > > > compatible
> > > > > > > > string
> > > > > > > > "simple-bus". In fact I had planned to remove the
> > > > > > > > compatible
> > > > > > > > string
> > > > > > > > "riscv-virtio-soc" in U-Boot but did not get time to work
> > > > > > > > on
> > > > > > > > it.
> > > > > > > >
> > > > > > >
> > > > > > > It is only required if U-Boot is running in machine-mode.
> > > > > > > For
> > > > > > > relocation it needs to use the CLINT driver to send
> > > > > > > appropriate
> > > > > > > IPIs to
> > > > > > > the other harts. To be able to probe the driver, the device
> > > > > > > and
> > > > > > > its
> > > > > > > parent device tree node (soc) must therefore be available
> > > > > > > in
> > > > > > > the
> > > > > > > pre-
> > > > > > > relocation device model.
> > > > > > > This patch was the easiest way I could think of for
> > > > > > > achieving
> > > > > > > this.
> > > > > > > It
> > > > > > > could be that there is a better way of solving this.
> > > > > > >
> > > > > >
> > > > > > I tested your SMP U-Boot series in both M-mode and S-mode,
> > > > > > using
> > > > > > a 4
> > > > > > core 'virt' target. Works fine. I am using QEMU 3.1.0 so it
> > > > > > is
> > > > > > "simple-bus".
> > > > > >
> > > > >
> > > > > That is actually my fault, it should not work.
> > > > > What is happening is that U-Boot fails to relocate the
> > > > > secondary
> > > > > harts,
> > > > > because the CLINT driver cannot get the memory address of the
> > > > > CLINT
> > > > > device. This error is currently silently ignored.
> > > >
> > > > I still don't understand. Why does the CLINT driver fail to get
> > > > the
> > > > memory address? U-Boot has been supporting "simpile-bus" for a
> > > > long
> > > > time. It was because QEMU 3.0.0 generated the /soc node with
> > > > "riscv-virtio-soc" compatible string, U-Boot was taught to treat
> > > > such
> > > > compatible string as a "simple-bus" too (that was the U-Boot
> > > > commit
> > > > 27dc2c130e29)
> > >
> > > That's correct. The problem with the default simple-bus U-Boot
> > > driver
> > > is that it does not have the DM_FLAG_PRE_RELOC flag set. The /soc
> > > and
> > > /soc/clint nodes are therefore not available before relocation,
> > > meaning
> > > that IPIs cannot be sent to relocate the secondary harts.
> > >
> >
> > Thanks for the clarifications. Now I see the problem. But I think we
> > should fix U-Boot "simple-bus" driver instead. As seen on FU540 or
> > likely other hardware, QEMU generates the "simple-bus" compatible
> > string for the /soc node, as well as the DT provided by the hardware.
> >
>
> That makes sense, I can send a patch to set the DM_FLAG_PRE_RELOC flag
> in the simple-bus U-Boot driver. I think it's best to send it
> separately from the SMP patch series, since it could affect other
> boards and it's a bit late in the release cycle. What do you think?
>

Yes, agreed that the "simple-bus" driver changes should be next U-Boot
release. We should try to get the U-Boot SMP series in the v2019.04
release.

> This patch can be dropped then.
>

Regards,
Bin

