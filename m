Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gr5bT-0003Vl-48
	for mharc-qemu-riscv@gnu.org; Tue, 05 Feb 2019 13:37:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gr5bR-0003Tr-4f
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 13:37:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gr5bP-0004Hi-7K
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 13:37:49 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:40251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gr5bH-0003w6-AF; Tue, 05 Feb 2019 13:37:39 -0500
Received: by mail-lf1-x143.google.com with SMTP id v5so3403129lfe.7;
	Tue, 05 Feb 2019 10:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5br4pgBG7qKVz4Lcsk8slzd8zvSd+AHkTsZ3iJS+Fac=;
	b=HLLnkPm0YxRbegMp0I7htPfCYtAuxlXG+ZwABqHAH3pDUD4nqN6icqgQrA9UICWuyG
	4fimrrG8o+1VEWjeSyhMAXIsiqywz0jXgqPLfhBqwPWH7rdrf0In4nSOPdzuN4S8Pdu3
	zDU70wggoGxmJsuVWyy36HQMzoxIBhdABXt9KNmA2oRzGxu9OUJ6wlBgU61U2hK7Rg5o
	4VSd8ngjyVlZsYjIFXHK3MFO4+o+VSKx7T6HNXG4F5Vc1BcI1xCAnl1/UTd06AOU4VyL
	5s3kDB6j0bqy/fUZHksCUdtWX21mDdH4g5JG8PbJLsgykq9+Zsds2LRtUkCvmEMDUooq
	5BOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5br4pgBG7qKVz4Lcsk8slzd8zvSd+AHkTsZ3iJS+Fac=;
	b=RpziMRb8Nv228aPFAyhqa3As35MH42pGu1WHVwd0bsJqBa9bPdwbhtDkcpU8AgGNye
	az7ky4iy1Q4dcvG7Vo6uz49qA6okNrwrH2PC8hbjsKk4nRO+9dHrq4Oc9r7TIR8MNHOr
	yT0k9x7CYff2iIU8CVBnkB51aNVdzbtfd18TiFjyw2q1JHqxKEsZqxX1ytWwAPBU3ClW
	ffczke0WKeidDrzQ50i64uyEu6ikqTqdQa9SKWLxu8V6KNOmIYitEZ82pJ/Cwhc6vkvW
	2DdfNSifDISJo1R54nK/iEOAO8t0Rsxk82C/OEolEJThgBUEUTwsrvFfRg6o5IKhgeUg
	21bw==
X-Gm-Message-State: AHQUAuZ4Er/vquQkOqvF3DU5erNp248AtXFwvinHTsbjgSNpCI07YZVk
	qgwftDfclvpluR74vOFzmimgCe53f6gHwmCyO0M=
X-Google-Smtp-Source: AHgI3IZEh2r5J7rkyyWztGIlJk3xFBwBPKpOw8es0Vs/K0PYj+74jRlgOgDGSQesYqfCM44Qd9GG0wGaJYlm5n9ZKNo=
X-Received: by 2002:ac2:5483:: with SMTP id t3mr3909871lfk.79.1549391844223;
	Tue, 05 Feb 2019 10:37:24 -0800 (PST)
MIME-Version: 1.0
References: <154905879413.25667.2843143192142684785.malonedeb@chaenomeles.canonical.com>
	<a667006b-44e2-f72d-8164-c52a9374cb84@redhat.com>
In-Reply-To: <a667006b-44e2-f72d-8164-c52a9374cb84@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Feb 2019 10:36:46 -0800
Message-ID: <CAKmqyKMBF23CJTNtdqiQ7gO7kA5ZSAu3aXr1uoF+=rE_RKwgFw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Bug 1814343 <1814343@bugs.launchpad.net>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Alistair Francis <alistair@alistair23.me>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [Bug 1814343] [NEW] Initrd not loaded
 on riscv32
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
X-List-Received-Date: Tue, 05 Feb 2019 18:37:50 -0000

On Fri, Feb 1, 2019 at 3:26 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Hi Jonathan,
>
> On 2/1/19 11:06 PM, Jonathan Behrens wrote:
> > Public bug reported:
> >
> > I attempted to run qemu with a ram disk. However, when reading the
> > contents of the disk from within the VM I only get back zeros.
> >
> > I was able to trace the issue to a mismatch of expectations on line 93
> > of hw/riscv/virt.c. Specifically, when running in 32-bit mode the value
> > of kernel_entry is sign extended to 64-bits, but load_image_targphys
> > expects the start address to not be sign extended.
> >
> > Straw man patch (works for 32-bit but would probably break 64-bit VMs?)=
:
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index e7f0716fb6..32216f993c 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -90,7 +90,7 @@ static hwaddr load_initrd(const char *filename, uint6=
4_t mem_size,
> >       * halfway into RAM, and for boards with 256MB of RAM or more we p=
ut
> >       * the initrd at 128MB.
> >       */
> > -    *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
> > +    *start =3D (kernel_entry & 0xffffffff) + MIN(mem_size / 2, 128 * M=
iB);
> >
> >      size =3D load_ramdisk(filename, *start, mem_size - *start);
> >      if (size =3D=3D -1) {
> >
> >
> > Run command:
> >
> > $ qemu/build/riscv32-softmmu/qemu-system-riscv32 -machine virt -kernel
> > mykernel.elf -nographic -initrd payload
> >
> > Commit hash:
> >
> > 3a183e330dbd7dbcac3841737ac874979552cca2
> >
> > ** Affects: qemu
> >      Importance: Undecided
> >          Status: New
>
> I believe this is fixed by the following patch:
> "Ensure the kernel start address is correctly cast"
> https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06358.html
>
> Can you test it?
> If if works you can reply to it with a
> "Tested-by: Jonathan Behrens <your-email>"
> to increases the odds it get merged ;)

Did you get a chance to test this Jonathan?

Alistair

>
> Thanks,
>
> Phil.
>

