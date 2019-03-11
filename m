Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3Mvs-00065J-CV
	for mharc-qemu-riscv@gnu.org; Mon, 11 Mar 2019 11:33:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h3Mvq-0005vg-AX
	for qemu-riscv@nongnu.org; Mon, 11 Mar 2019 11:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h3Mqe-0001DY-0R
	for qemu-riscv@nongnu.org; Mon, 11 Mar 2019 11:28:17 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1h3Mqc-0001Cv-Hk; Mon, 11 Mar 2019 11:28:15 -0400
Received: by mail-ed1-x542.google.com with SMTP id p27so4382334edc.6;
	Mon, 11 Mar 2019 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7WM0+wID6VIWCBoulhe3P6hB7Us0u7T/c4aH9w4bQ4I=;
	b=ZkwqU2iOvUidygT3aJSTNFe9c3bm4uDCCFFFYYqcq6ct2KwQ1da7JQLZrCWILLZiCL
	gUu6MzDkObCGsrVwMPDRL9a4ql00HNQUFR3hFtoHllPZdWFE7o/gykJaTXRlYwBMACJs
	A53+c66sqBQpzKgHMsl2n/AtHRzQIrNhrCPs6Nsfs/pvPHM4uro5ecLcteM1ISc99pNl
	uSBauRIH69QZyJAlmT1fRAQIhRw6qHyU9ONScRroDaXz/Ayak3AuJz0ODLub7sEVVlRJ
	Y7xNiT/2vKEp+XTFkrFgMZh7w3AQkg8jVmMLpzv6vB5jZtWj23HrMMTW0uuOksqLkqmP
	Pb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7WM0+wID6VIWCBoulhe3P6hB7Us0u7T/c4aH9w4bQ4I=;
	b=VyXS1OReyOdeV4SBekfd6NAl1ym2vSgLefZ0VznwdrOWJB9QBWJ9OpTCg+KZyFMIdb
	vSkmWywvSXa5LJp/MaCLAzJIkjQwzb9LOKgJuAoPIm1vgN2UAo6WIkbymDBAPEqeRfxs
	LD8P1RnI4jYiVw0xgA4qyzltt9wSrSjmRSwgn5Emzq+VHdJhhTHq1eml6cx5I5uqQCP2
	da7ek4lctjgIa35wqPBjwxphiic56ta9qO8pNSVDY+bi8bovp68xf8/FxnvveA+Hf17F
	VylafrccVIdvjDRNLS61lpgER+sjQSFdQAzwMNgXhaO35BJpheSr4Rf9d4UV6mUgOF7G
	10pA==
X-Gm-Message-State: APjAAAUzY2es35ep0M9/C5IKflZr71ASA0OFlQrknwwuqfIpxWPqh8FE
	PLjqmye+72gJhbSBKwnsurJsxv2baiu0WJXrH0U=
X-Google-Smtp-Source: APXvYqyG7Rbt0Z8a5W5gFfDS0stt8kTyxlV+onfEQZPSvEvd4TwIJIHuouaCzeaADZ0wh6aH7YodjjKHd57Y3T0MXWM=
X-Received: by 2002:a50:92fb:: with SMTP id l56mr44610863eda.114.1552318092708;
	Mon, 11 Mar 2019 08:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
	<c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
	<CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
	<e131b4b0eb9109547ce0ed0993665206d6bf983a.camel@aisec.fraunhofer.de>
In-Reply-To: <e131b4b0eb9109547ce0ed0993665206d6bf983a.camel@aisec.fraunhofer.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 11 Mar 2019 23:28:01 +0800
Message-ID: <CAEUhbmX=PT-46nqtMqSaGn5xu2tRJ50Sm6kK7b97Xc_Y+6stPw@mail.gmail.com>
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
X-Received-From: 2a00:1450:4864:20::542
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
X-List-Received-Date: Mon, 11 Mar 2019 15:33:39 -0000

Hi Lukas,

On Mon, Mar 11, 2019 at 2:03 AM Auer, Lukas
<lukas.auer@aisec.fraunhofer.de> wrote:
>
> Hi Bin,
>
> On Sun, 2019-03-10 at 22:57 +0800, Bin Meng wrote:
> > Hi Lukas,
> >
> > On Sun, Mar 10, 2019 at 9:44 PM Auer, Lukas
> > <lukas.auer@aisec.fraunhofer.de> wrote:
> > > Hi Bin,
> > >
> > > On Sun, 2019-03-10 at 09:07 +0800, Bin Meng wrote:
> > > > Hi Lukas,
> > > >
> > > > On Mon, Feb 11, 2019 at 6:13 AM Lukas Auer
> > > > <lukas.auer@aisec.fraunhofer.de> wrote:
> > > > > Re-add the previous compatible string "riscv-virtio-soc" to the
> > > > > soc
> > > > > device tree node to allow U-Boot and Linux to bind machine-
> > > > > specific
> > > > > drivers to it. The current compatible string "simple-bus" is
> > > > > retained.
> > > > >
> > > > > This is required by U-Boot to bind devices early, as part of
> > > > > the
> > > > > pre-relocation driver model.
> > > > >
> > > >
> > > > I see no problem with U-Boot working with current compatible
> > > > string
> > > > "simple-bus". In fact I had planned to remove the compatible
> > > > string
> > > > "riscv-virtio-soc" in U-Boot but did not get time to work on it.
> > > >
> > >
> > > It is only required if U-Boot is running in machine-mode. For
> > > relocation it needs to use the CLINT driver to send appropriate
> > > IPIs to
> > > the other harts. To be able to probe the driver, the device and its
> > > parent device tree node (soc) must therefore be available in the
> > > pre-
> > > relocation device model.
> > > This patch was the easiest way I could think of for achieving this.
> > > It
> > > could be that there is a better way of solving this.
> > >
> >
> > I tested your SMP U-Boot series in both M-mode and S-mode, using a 4
> > core 'virt' target. Works fine. I am using QEMU 3.1.0 so it is
> > "simple-bus".
> >
>
> That is actually my fault, it should not work.
> What is happening is that U-Boot fails to relocate the secondary harts,
> because the CLINT driver cannot get the memory address of the CLINT
> device. This error is currently silently ignored.

I still don't understand. Why does the CLINT driver fail to get the
memory address? U-Boot has been supporting "simpile-bus" for a long
time. It was because QEMU 3.0.0 generated the /soc node with
"riscv-virtio-soc" compatible string, U-Boot was taught to treat such
compatible string as a "simple-bus" too (that was the U-Boot commit
27dc2c130e29)

> The secondary harts are still waiting to receive IPIs, so booting Linux
> works fine, because U-Boot can now send IPIs. This will however break
> if U-Boot overwrites the code the secondary harts are running, which
> could happen when loading an image.
>
> I will update my SMP U-Boot series to print a warning if sending an IPI
> fails.
>

Regards,
Bin

