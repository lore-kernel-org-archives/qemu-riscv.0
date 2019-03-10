Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2ztz-0002oa-6Y
	for mharc-qemu-riscv@gnu.org; Sun, 10 Mar 2019 10:58:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h2ztw-0002nx-Pa
	for qemu-riscv@nongnu.org; Sun, 10 Mar 2019 10:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1h2ztv-0007MU-0y
	for qemu-riscv@nongnu.org; Sun, 10 Mar 2019 10:58:07 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:45774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1h2ztu-0007KM-Nb; Sun, 10 Mar 2019 10:58:06 -0400
Received: by mail-ed1-x541.google.com with SMTP id f19so1825786eds.12;
	Sun, 10 Mar 2019 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jrk7FpL/HHgs96QR265NQTICX1Nd6As+asKg9Qqovho=;
	b=Wh8q4xZeXXHRCYKI1RbdAvvJ+mguWMf7iNNxjGB1b1mr8GjQ2ZADo/A2zYjvDtxlRl
	iYKFQR9hwWnPwcH0hvgNnOMQOat6DDZhkSshRHh6yFo2PrmclQh+WPJyCTjEY9/TUU2b
	m+ChgW5fN75COwNcW0u8H90LO1Ggcz9c8Q2ZyhC94e7UO7rnZCble2mtDMDfbCWNwyae
	6CYRlOAnPL2TGMB2JZzmcS4xydk6Jb5dsRPXgEjtsnz+SgdOIiQzborj4qArW8/AvGg9
	krpyTIa4XvucP0IM0jrZGFKtz6LC5hCsMvQkotr9jY5VYZf6v3tF5RavKS9dnb3bPE5C
	RvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jrk7FpL/HHgs96QR265NQTICX1Nd6As+asKg9Qqovho=;
	b=krd8G/2qjItsOdpeQ2RleynXvWZMXOLnD3luF/e9f2uYW+jd2+lF4Np3U5STmpgXeI
	zUOSg8xXyaprB5iPJzEly98d5d/524GGHZosl5Dmp5JuSiy2TI+/n9yfgCyQ1aQd4vel
	HBGBb0KNqmWR+UAQme4EJoeg4os429G8mBCS5P7A2ScdcbNm2OeR8Lby3HTBsscyMoea
	fZ75sLgVTNKfMsmJlB9/nzxoMEtDbSk7jEaZIACuKZfmTn0oYPctE633QhCoK/WUZA66
	1ey9foIAksj87LlLL7aHeRt3EJsupsa/uWJtdfNTlM65rQluyead10JIYh7cb+HPeIIZ
	7reg==
X-Gm-Message-State: APjAAAWRtKIHce1jt1+NfIBLlOAC6UC6xPvzirYP7PXoE83KqFsgJEoA
	slnVbJpUyNGY1kXvrfASLXcU/V3JK+V2deClmH4=
X-Google-Smtp-Source: APXvYqykaAVdtknhcB5Cwuq51K9l+gEKQCEOk05L3WceeIPTp7CvpVupkelt9wkafBzUavAlzmJmPXlzFWb6lZHdb88=
X-Received: by 2002:a50:92fb:: with SMTP id l56mr40602294eda.114.1552229884472;
	Sun, 10 Mar 2019 07:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
	<c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
In-Reply-To: <c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 10 Mar 2019 22:57:52 +0800
Message-ID: <CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
To: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
Cc: "palmer@sifive.com" <palmer@sifive.com>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mjc@sifive.com" <mjc@sifive.com>, 
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
X-List-Received-Date: Sun, 10 Mar 2019 14:58:09 -0000

Hi Lukas,

On Sun, Mar 10, 2019 at 9:44 PM Auer, Lukas
<lukas.auer@aisec.fraunhofer.de> wrote:
>
> Hi Bin,
>
> On Sun, 2019-03-10 at 09:07 +0800, Bin Meng wrote:
> > Hi Lukas,
> >
> > On Mon, Feb 11, 2019 at 6:13 AM Lukas Auer
> > <lukas.auer@aisec.fraunhofer.de> wrote:
> > > Re-add the previous compatible string "riscv-virtio-soc" to the soc
> > > device tree node to allow U-Boot and Linux to bind machine-specific
> > > drivers to it. The current compatible string "simple-bus" is
> > > retained.
> > >
> > > This is required by U-Boot to bind devices early, as part of the
> > > pre-relocation driver model.
> > >
> >
> > I see no problem with U-Boot working with current compatible string
> > "simple-bus". In fact I had planned to remove the compatible string
> > "riscv-virtio-soc" in U-Boot but did not get time to work on it.
> >
>
> It is only required if U-Boot is running in machine-mode. For
> relocation it needs to use the CLINT driver to send appropriate IPIs to
> the other harts. To be able to probe the driver, the device and its
> parent device tree node (soc) must therefore be available in the pre-
> relocation device model.
> This patch was the easiest way I could think of for achieving this. It
> could be that there is a better way of solving this.
>

I tested your SMP U-Boot series in both M-mode and S-mode, using a 4
core 'virt' target. Works fine. I am using QEMU 3.1.0 so it is
"simple-bus".

Regards,
Bin

