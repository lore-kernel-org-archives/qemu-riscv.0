Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPX4j-0001XX-8h
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:18:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPX4h-0001VP-4d
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:18:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPX4g-0002kY-95
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:18:07 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPX4e-0002hV-6v; Wed, 21 Nov 2018 13:18:04 -0500
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so5669216ljd.12;
	Wed, 21 Nov 2018 10:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HzLYyDI8poK7bdMDCKuMeaIH6P5K2oWiN62CAvefNFM=;
	b=GugRPAY7yL5jgMFHRbOJnZVRP3V/CWGcHfKEsDyO5MKrtoCsBcYEElDUIpxp+HP/Ao
	EH0th6JC02+hpE1gfX60/sTSHrL/O2ZONfbxGld1vp1C4yLT8nUR4ZnMVLe7ks+CKX4e
	FZTJP1ZCIgvcGV04bJvdcPkg4OFctRmEkVUXn/bgTfMHG/r/limBVHCJBOIRlDILugxL
	cHJU4nkpYfgviQljnwjuqaNvyhLSzb0FLMUdiojY5pc/1TaPgUjN9w9CqjpqXNhmxbAl
	8/NFx+N8PEXJkJj6jXTL8a861qKA99CxkFReAX/50MDFhTPKC8OphC5Toyzce7wLphjS
	OWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HzLYyDI8poK7bdMDCKuMeaIH6P5K2oWiN62CAvefNFM=;
	b=F7aYkz5QJ08/yeIren4VnHWuaJw63bPQc4RdZO6ROtTQB7/ihIl3Iqc/7dGCgzYvzj
	8NxUnhzgjZl7iZXc6x/3IYNzxQ8R2DFKPWj2zB3yT25WXqGlLsd3z1Rgsat1jgoG5u88
	9ypJ2PtGuRjpteRgazMj3NKwjyWzMxA6vUGlxfNWvHp+t367NNTTVE9RxinCJoW5ntwd
	eBjQgbAXVHRGwiDX816DeHVUwYSafEc7fQgEtf/MNv04ScM1QCEl+QAvv1Y3R3+9Ig2r
	Q2S3n2PCjFZIncDgs9y7PTVFOFkOTzSSfMlc6e9TthaWxtEc9dNFxKkyiWM040sofzL3
	Rp/w==
X-Gm-Message-State: AA+aEWbSoPAtQeB1juJBp6DGj/z2/ZsljxCIWpP+A2ztGsZjQ7EQ2PNO
	qc7K7eSwf279lwCnDPGnW6JmM4sxVTi9BCN7kDQ=
X-Google-Smtp-Source: AFSGD/XWlCASHb76XF3fXuEViQq46Lp+FD7Jo+fi+pm+XG+jEQYGH4EpAAZ2+c4vCRznbthmX2uk+5+6jsu3lIigAvE=
X-Received: by 2002:a2e:449c:: with SMTP id
	b28-v6mr4579159ljf.47.1542824282857; 
	Wed, 21 Nov 2018 10:18:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<a2c70c88a145d2e239f113e28979c7a50d71aedf.1542819633.git.alistair.francis@wdc.com>
	<ff4ef556-0989-ec47-0424-3f153f10a8d0@deltatee.com>
In-Reply-To: <ff4ef556-0989-ec47-0424-3f153f10a8d0@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 10:17:34 -0800
Message-ID: <CAKmqyKOMsBda223ptqt2iVFi6oVifK_0L+=Mne=v9p_umwxVLg@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
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
X-List-Received-Date: Wed, 21 Nov 2018 18:18:08 -0000

On Wed, Nov 21, 2018 at 9:58 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> > Increase the number of interrupts to match the HiFive Unleashed board.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/virt.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index 91163d6cbf..7cb2742070 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -45,7 +45,7 @@ enum {
> >      UART0_IRQ = 10,
> >      VIRTIO_IRQ = 1, /* 1 to 8 */
> >      VIRTIO_COUNT = 8,
> > -    VIRTIO_NDEV = 10
> > +    VIRTIO_NDEV = 0x35
>
> Why 0x35? Based on the PCI patch we are using only 36 interrupts, not 53...

This is just for future proofing. There is no reason to set the number
lower then the number of interrupts we have, now hopefully this won't
keep churning every time we add a device.

Alistair

>
> Logan

