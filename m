Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPYY4-0000Sv-8L
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 14:52:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPYY2-0000Rk-Ec
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPYY1-0002CQ-D1
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 14:52:30 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:33889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPYXz-00025O-1l; Wed, 21 Nov 2018 14:52:27 -0500
Received: by mail-lj1-x244.google.com with SMTP id u6-v6so5927911ljd.1;
	Wed, 21 Nov 2018 11:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9F0/N8xju9mFX82EeNn84byLutwAEM8ADtcyjn7QPTc=;
	b=YuB4mhGjFXbYuu2IdN8s7W6fMqu9rD/ROFAr63uhVRhTDBWctymFAoU1zXh927n4kK
	1vlHMqV2njsDscud9mtcaynuI16/yebGEcg54SCn/bVd73OoYO+acorcKR3mLzeZePVg
	je5T+JoGBcY2ftFMIVxrSp6SnySaTQ3ovG5HjuSmy5VMv70rbtxLm67tdkUGJjscmTpQ
	wSVY8fRseq9IV7v1Pu8faMQ2/JfGWSA2nKFXX8PwwnGti3DTDrOFWKAMrleqZ6qEW4Zs
	En+ABF6XY2E5u6TbsT8Kw6Alx4YuzNL7MEtFhUIjvDKMoPZxpOQWYEAxdHNgdTSntN5H
	wxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9F0/N8xju9mFX82EeNn84byLutwAEM8ADtcyjn7QPTc=;
	b=s8VyAhRnUWSKnJI0T5XFeswm9daydzQoQ7HO0DFLpRg1ZPFGSml55f8yyciSL7uueO
	zccxwwCTUv7nH2EeodzsBpi4PW8VQ+VW0A6T5dswEf+y80byB9/ym8I0rb3mwtLchpvR
	bMWUU76U/oaBBHKb75sJBR3Xw3QZSfum5nOFcWcshfrPQRuVOUtgdAHvbY/RqxVl+KmC
	VuHl8A+yuxcM73/Lv33AjpGLji9YgIQk/0Qw7latIzYUUCP/W+OwNOEIv8jhwIv/uzo+
	g2lZwYA5Qr0kfZreaGvPnk3gEQvuqsKr52//4rQ93I9wGnkV9Vw8xeV+yNbhrcrrtuAg
	kEVA==
X-Gm-Message-State: AA+aEWYlQ9xMz3HGLML2t9wtM0Dnfz2/FM4oqWIQrVJKQjyoF7200nBC
	IcpP4Svc6lIJXEp4JwY0e+bj3+hxsLzpVQqx750=
X-Google-Smtp-Source: AJdET5f53AsNU24EJaGC8jHffVYbMtFDIJyqR9vL+2Rer3riBMFIv4ufgBZDmPzQVdQOe+I/XsFIo7Ptkd1sXOo+GhQ=
X-Received: by 2002:a2e:4601:: with SMTP id
	t1-v6mr5302450lja.111.1542829945482; 
	Wed, 21 Nov 2018 11:52:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
	<CAKmqyKMtTqi=D-PKZFnt40MaA8+e6Sj8nUr0VmBFajScw1MYng@mail.gmail.com>
	<ffd80fff-55bf-0578-4fe5-00f07ef6bdc6@deltatee.com>
	<CAKmqyKMhpAPXFF5cQkqKYcNjD5aciDW7Ek53+W=1XNp3RGFLmw@mail.gmail.com>
	<33646fef-adb7-26b4-ba01-79f9a0f5bdae@deltatee.com>
	<CAKmqyKMJvTb=JebfA1N-40-MqgHkAj98JOH51t6K--zjYLXSnA@mail.gmail.com>
	<d316a936-c726-dd4c-f90a-9690b4e3fc3d@deltatee.com>
	<CAKmqyKM1pf1zJVMuqZvocN07LxDGrRjoSNLojt=06UbN4P-bpg@mail.gmail.com>
	<6480496b-dbb5-37bb-57e2-7a4819c61511@deltatee.com>
In-Reply-To: <6480496b-dbb5-37bb-57e2-7a4819c61511@deltatee.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Nov 2018 11:51:58 -0800
Message-ID: <CAKmqyKMPHg7nGr-Ua1Cb7yvdZzWAs6HOM4eB+SinMypXQ5Ni6w@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
	Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 5/6] hw/riscv/sifive_u: Connect
 the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 19:52:31 -0000

On Wed, Nov 21, 2018 at 11:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2018-11-21 12:21 p.m., Alistair Francis wrote:
> > On Wed, Nov 21, 2018 at 11:19 AM Logan Gunthorpe <logang@deltatee.com> wrote:
> >> Well, I also have a kernel (one I've built myself) without microsemi
> >> support, but with Xilinx support and it also doesn't work (see my dmesg
> >> logs I sent).
> >
> > So this one should work.
>
> It does not, see the dmesgs I sent a few emails ago.
>
> >>
> >>> For people who have modified the standard bbl to edit the device tree
> >>> before passing it to Linux to add the MicroSemi PCIe node, it won't
> >>> work. That's a very small number of people who have modified the
> >>> standard boot loader. I don't think we need to document how those
> >>> people get back to the default set-up.
> >>
> >> I have not done that. And it's not working for me.
> >
> > If you haven't done this then how can Linux know to probe the
> > MicroSemi PCIe root complex?
>
> Oh, well actually, in this case I was using the bbl/kernel you sent us,
> so I'm not actually sure what's in it. The stuff I built myself doesn't
> have any of the microsemi stuff, so it sounds like all that was a red
> herring.

Ah ok. There was some confusion there then.

So now it sounds like it's not working and there is no MicroSemi
device. I will check and see what I find.

Alistair

>
> Logan

