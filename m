Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPees-0002Ua-6i
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 21:23:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPeeq-0002TI-2o
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPeeo-0004EX-Lu
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:23:56 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPeeo-0004Cc-CY; Wed, 21 Nov 2018 21:23:54 -0500
Received: by mail-lf1-x142.google.com with SMTP id f23so5401895lfc.13;
	Wed, 21 Nov 2018 18:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4L8tzEIkR7vE+cOmkP93tmmOvQpNEkOsYhibpeH48QA=;
	b=CpPONhqVSQlosVKoOcN9qFCPVzAfzHUsYsr7oERT/HR93/x0vz4jRQBHSz6S7d2qpw
	n5nF4X3XNx2OpLro01jnChslOQvteYZxWZPA2AIJwdYgCgiFv530aaCGsAlT4pX2SQ0Z
	hKBnGPGMW770BWO60aGe8KM+XN1F+VdV5kqd4OzeKIEjroNEaLf/qc3CFZcc+Qa9X7Gs
	CGGwtryxGAZOP4ZsPOjRSNv+wzmpmv5OclougjyLa+SiQN7mjqc/e/sh55/fARmzH+Be
	ChHU8l4MxsSVejDy4/m6ItDH4aiJHpR4ErTEBwS0y1wiSQasVj29P3OQza1zIGuYyZbI
	CJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4L8tzEIkR7vE+cOmkP93tmmOvQpNEkOsYhibpeH48QA=;
	b=DuoYKyvASHqqfU62XtE5yRVtXbMDCT4VPyP3Thwitxo0zSJdvxp1V2BTGRwXr7YwTL
	uIN+9wqPvuUiTGJYxZfbttoxJU8EB4ejqMEphsD+Bd1NrxN/2PQuWTulps3IcoNz+nw/
	0bxRpUERH5B4CmHkTbW9kPxF98fGof/zrKqGemqyXdaaP2MqFT1jEFV35se1VQCPWcDS
	Ragf/XaKhpWd1CE5TcQlDX+XPX7LVp39THCArJ06lUcB6+81thoPKzC/rdCp2x+3jmOz
	ieVgo/P+JTaCZIFV/zodISxp2VrOBETi+Og0Kq7g/t/PFZEfnfNONbJfC4Tae++ELN6X
	x8NA==
X-Gm-Message-State: AGRZ1gIBjspguypljrZPsoEkU2szmPFMi8nEMJvC0yDpQ+i/uP3Zqsbs
	u3YviBSEQ5NOFjEOLGXRPB/kh/v5X1GeiKb+5A8=
X-Google-Smtp-Source: AJdET5ddx7C9FV7fRjnn1g9GjeWdtB4eI/xZXvKS53Iyg5XUCCIMrlN5ehpqX8cFQWo4qix+4pZdmwMto/URG2vmuC8=
X-Received: by 2002:a19:5782:: with SMTP id l124mr4983550lfb.91.1542853432806; 
	Wed, 21 Nov 2018 18:23:52 -0800 (PST)
MIME-Version: 1.0
References: <9ee74477-105f-db2e-b69c-e67d485b9c2f@deltatee.com>
	<mhng-105c249c-fc1f-4d85-bf75-5aeb17d95854@palmer-si-x1c4>
In-Reply-To: <mhng-105c249c-fc1f-4d85-bf75-5aeb17d95854@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 18:23:26 -0800
Message-ID: <CAKmqyKPVif8MQs_aGXxx=aOi9mrRJz94AFv2B41JVETqY9BQRA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, Guenter Roeck <linux@roeck-us.net>,
	qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2 v7 5/6]
 hw/riscv/sifive_u: Connect the Xilinx PCIe
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
X-List-Received-Date: Thu, 22 Nov 2018 02:23:57 -0000

On Wed, Nov 21, 2018 at 6:13 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 21 Nov 2018 15:26:01 PST (-0800), logang@deltatee.com wrote:
> >
> >
> > On 2018-11-21 4:10 p.m., Guenter Roeck wrote:
> >> FWIW, I absoutely agree. If the board can only be used to boot an initrd,
> >> it is quite pointless to have it around. Actually it is worse than pointless,
> >> since it will result in people wasting their time trying to get it to work.
> >
> > As someone who has wasted their time on it, I second this sentiment.
>
> So it sounds like I should target that deprecation patch set for 3.1?  Who
> wants to review it?

I think it's a little late for 3.1. Let's leave it for 3.2

Alistair

