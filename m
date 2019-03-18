Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5p0H-0005bc-AX
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 05:56:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h5p0A-0005Ye-1s
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:56:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h5p08-0002nQ-Re
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:56:13 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h5p08-0002n6-EA
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 05:56:12 -0400
Received: by mail-ot1-x344.google.com with SMTP id i5so13845688oto.9
	for <qemu-riscv@nongnu.org>; Mon, 18 Mar 2019 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DjVtGwFQrm5Z1QeRalLidCIubJABXNWhZjZn1o3gAGk=;
	b=hAEfcVsPI5f+v/Tyc7eOGXL1FMgSDQbkpEd3MYS2+TRHnQ+e4SUknqC+kI2BvPX1vW
	oRQNDOhEygu0vPQdARq6ICKe/HR8MJemUYqaELGEZZ84Xs41wKBrlQYLzJW/BaRKeH5v
	/CppEeZt396uLkxuuTPAmCdA0ld9OKJWG9z5c8iXWS72oKYQIuWzQnXyJB8S+jp4xLly
	OFTQd9weXMy8NevfJ8bKFDtPVaOMjLXUDvV3O0BDCyZLDyz8QQm9wmPp18yIcVquWQWU
	ORDj0I7pFkqtC9HmBmUEocMyQgXUWpMs1jUY93xMJr1mlYEAO0h0gca953BgREv0iODC
	6BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DjVtGwFQrm5Z1QeRalLidCIubJABXNWhZjZn1o3gAGk=;
	b=ffr8cNnoQtsouWyevAEFHaC/ukkWBXMLI66GeHVNM6AnbXu8ngUC1H7luLJ7HFPWI9
	nrS36z/+eYh0K7dMcroaOt8t0OWjZTLWtwIO55DSbkwfKHh9FYFVTzy7NFfqDrxpIEaM
	nI1Vcf9463Ng5PQ5AIUS4mxE0WStGupXyjeDaob3h9XLFiVbMHkaBccECDhj1H0dIVls
	4xKHyw6zg968eh0WaDUS7m05UpK+LjnYlLIB3v/5zoOX9ta5X+oUZp125oAOGQX7YbMi
	OCfzPcgzqoGLQpm4mm67BdMfN0YBUJhEyOUC+oUqC2aHBuWwWHlDzp8U06SX3mqGi9lf
	18Pw==
X-Gm-Message-State: APjAAAWEdLJ54oWcsmTbLqnJr18Fv+HVMgsuj2dZ9xj62EV+wCpt7wZD
	o6DePyoglU28rKLRyR8Wy+vUweQoCC1r7Npeb9Z6WA==
X-Google-Smtp-Source: APXvYqz0I4EFXyLgG96iwnyFF0szS0ZIL5XQPvSDnf28GHw2yr67zGKh0a9ZPSHAY0PRfR+EM2rlioXPg6m/xSqXvHA=
X-Received: by 2002:a9d:130:: with SMTP id 45mr4639830otu.352.1552902971205;
	Mon, 18 Mar 2019 02:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <256afbb2da005dc62c159b0f4a4fc0d95c050660.1552679970.git.alistair.francis@wdc.com>
	<87imwgimot.fsf@dusky.pond.sub.org>
In-Reply-To: <87imwgimot.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Mar 2019 09:55:58 +0000
Message-ID: <CAFEAcA-i9N=W1e+UzO1Hxvw0Qv_GfUm-+9R7PhpMHPrUKyL0-w@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
	"palmer@sifive.com" <palmer@sifive.com>, 
	"rjones@redhat.com" <rjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"abologna@redhat.com" <abologna@redhat.com>,
	"alistair23@gmail.com" <alistair23@gmail.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv: plic: Set
 msi_nonbroken as true
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
X-List-Received-Date: Mon, 18 Mar 2019 09:56:19 -0000

On Mon, 18 Mar 2019 at 08:59, Markus Armbruster <armbru@redhat.com> wrote:
>
> Alistair Francis <Alistair.Francis@wdc.com> writes:
>
> > Set msi_nonbroken as true for the PLIC.
> >
> > According to the comment located here:
> > https://git.qemu.org/?p=qemu.git;a=blob;f=hw/pci/msi.c;h=47d2b0f33c664533b8dbd5cb17faa8e6a01afe1f;hb=HEAD#l38
> > the msi_nonbroken variable should be set to true even if they don't
> > support MSI. In this case that is what we are doing as we don't support
> > MSI.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reported-by: Andrea Bolognani <abologna@redhat.com>
> > Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > ---
> > This should allow working pcie-root-ports in QEMU and allow libvirt
> > to start using PCIe by default for RISC-V guests.
>
> Lovely!  If more people reviewed and updated their interrupt controllers
> this way, we'd be in better shape.

Why do we have a flag which each interrupt controller
has to set rather than just making the right thing the
default (and having the one or two interrupt controllers
that need the wrong thing for backwards compatibility reasons
be the ones that have to set the flag) ? This way round makes
it way to easy to add a new interrupt controller with this
bug without noticing it, I think.

thanks
-- PMM

