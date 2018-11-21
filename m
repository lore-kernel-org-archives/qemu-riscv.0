Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXa2-0005Ro-8H
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:50:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXZz-0005Pv-Fc
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:50:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPXZy-0008LY-II
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:50:27 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:44418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPXZw-0008GJ-K2; Wed, 21 Nov 2018 13:50:24 -0500
Received: by mail-lj1-x242.google.com with SMTP id k19-v6so5743792lji.11;
	Wed, 21 Nov 2018 10:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TmDH0OjTFeqMYzVpdB8pQb/DUVOV347R05qz3Jv59aA=;
	b=OC1Fu8UmSO/RunWpFSH1TjfUkK4D23Ant8kTF4LM8I5Gh614CfQ4lJ9jd4cBLcLXtM
	E1NVmgmS/ic2/002if9Xgt3nbSBta2MfasfYgZL24UU8MLBFbnnW4bmLTUJbCyttTAbK
	lLyrqRbol64ZylcnppLRhANal09axxujLgKfgKoz0NeygLiAN16u3yqsWT+6dnEOlXTc
	0yoRz2CBDF+ix3D6rb0f8wCCYxk0N5z1K4aRZ8hoXYV+leNvXSIUiWI9NYNQrT3GHQ+j
	0QwU5oxs8u1WibrQXe8WiNbFBY24j61aBR2ugPP83yxmG2vHZnHKS47HYGeDN1aQJzkK
	Rqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TmDH0OjTFeqMYzVpdB8pQb/DUVOV347R05qz3Jv59aA=;
	b=R/PdOBHaDOje5aAxT3+lFHC7muk5k8M4q2LdmMIfdD3rYx0d8zwCkEU5iCEQt8c6WS
	pewhQGygNwWEgKkR37FMk9RDHzMM72NfuRg5vWnU8leKEek+ORpNB+JRI8ieWAAo359o
	4ZSvFBPE1GNfxku37/LzaTVqmhySUcStGU1VInURHRN16U4J81HSUH9Sj8vACeJiZa/s
	ZyDGqDmYde7VkZ9NBOT1aYAO3L0metXoMUZgzQIgbNQzWAgZ5I7/FAvhLjqkr7AJ5W7/
	RGsAliEUO5nAF2Ome08FXzn11Xa+EzFGrWhU6YTG2hxd1ZVttLv1vvxUvcbd5cj1i1gP
	ShXA==
X-Gm-Message-State: AGRZ1gKodObvgeS4b4ncpxem227pzaRjCocIskiLt5qh/5imEWfQKex5
	Y+5jRAxlQuRGo8WlcDIzHKmx6Y05svU+5K3krxI=
X-Google-Smtp-Source: AFSGD/X2ahyrO7XfOKG57nDkT0iIuXUaETHut6zz7n5zfyqOBaneZ5QPA1w62sfgAFJl18pkpqiHOMxIWl5A9DkJFgE=
X-Received: by 2002:a2e:8605:: with SMTP id
	a5-v6mr4760633lji.145.1542826223088; 
	Wed, 21 Nov 2018 10:50:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<a2c70c88a145d2e239f113e28979c7a50d71aedf.1542819633.git.alistair.francis@wdc.com>
	<ff4ef556-0989-ec47-0424-3f153f10a8d0@deltatee.com>
	<CAKmqyKOMsBda223ptqt2iVFi6oVifK_0L+=Mne=v9p_umwxVLg@mail.gmail.com>
	<ed679475-5ba2-c2ce-c468-b531188d6b7e@deltatee.com>
In-Reply-To: <ed679475-5ba2-c2ce-c468-b531188d6b7e@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 10:49:55 -0800
Message-ID: <CAKmqyKOA0xa0RhNatt9JybpGMLGds+E8CytOXr8rQuSYi7VrxA@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 1/6] hw/riscv/virt: Increase the
 number of interrupts
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
X-List-Received-Date: Wed, 21 Nov 2018 18:50:28 -0000

On Wed, Nov 21, 2018 at 10:45 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 11:17 a.m., Alistair Francis wrote:
> > On Wed, Nov 21, 2018 at 9:58 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >>
> >>
> >>
> >> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> >>> Increase the number of interrupts to match the HiFive Unleashed board.
> >>>
> >>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>> ---
> >>>  include/hw/riscv/virt.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> >>> index 91163d6cbf..7cb2742070 100644
> >>> --- a/include/hw/riscv/virt.h
> >>> +++ b/include/hw/riscv/virt.h
> >>> @@ -45,7 +45,7 @@ enum {
> >>>      UART0_IRQ = 10,
> >>>      VIRTIO_IRQ = 1, /* 1 to 8 */
> >>>      VIRTIO_COUNT = 8,
> >>> -    VIRTIO_NDEV = 10
> >>> +    VIRTIO_NDEV = 0x35
> >>
> >> Why 0x35? Based on the PCI patch we are using only 36 interrupts, not 53...
> >
> > This is just for future proofing. There is no reason to set the number
> > lower then the number of interrupts we have, now hopefully this won't
> > keep churning every time we add a device.
>
> Makes sense. Still 53 is an odd number.

Agreed. It's the same number as the last interrupt in the QEMU SiFive
U machine. So that is where it came from.

Alistair

>
> Logan

