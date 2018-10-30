Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHaCl-0000tQ-DN
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 16:01:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHYE5-0000EY-E0
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHYE4-0005lC-8K
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 13:54:49 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:36725)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHYE0-0005gZ-Px; Tue, 30 Oct 2018 13:54:46 -0400
Received: by mail-lf1-x142.google.com with SMTP id h192so9603420lfg.3;
	Tue, 30 Oct 2018 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FRG33DR7bWj4KjATvBcDdDNSfJg9ePLrjIDemlXoWDw=;
	b=lbmGTY7HKW0zJMC5I9+RlDbC7BHEEVdko9G/a3l95bAKCNt3CpoQpG8x2dyH5YOuVD
	0unsayhHAnHXHtL2k07p55i9aYuJopmadWmYx30nS1g3/R1dJAMr+uGzDT9pMXSa180m
	MDU3Zlv//8UAwhFLceHlhFFApVh9H7bamNqWtLn7+A2MehzCGeAMYR/PNNIpy8qkMfx0
	teC+lMc7NRv/Zah6yNNwVLG2JQLjcL6Raz9GAykpL3vYqTD2Lx+swxSf1IoG/tc/68KX
	maclO7rkKFRgXBpFrW9Q5cL48P8XIrcfSa6IxAYvqEHBB/p+jdDsj2LvjBHSy+Eu1WSw
	oZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FRG33DR7bWj4KjATvBcDdDNSfJg9ePLrjIDemlXoWDw=;
	b=hHLsNQRrR6Z4qKmma7PP7aaTruPHuwPyDrEu1UI4Dvk9BnjnnYXSDHEeTWM9v+41kU
	nE3AuWOWkPRKV3H4KEvfc5M0oWCdQ3SyE91v1eANw8rntuM3UiFJrPvrJGUB0vqsG0/X
	O2IBKe/wSk/8LYi9NEDm1/GC2MS1RMubF9fMlK9+xWPVP3bJNW7x6Q80a4VA6g8xUR02
	yhajsGXnN6ioMOSkd/09AF8IchaxkKmR8L6WqC4dbIkPui+21Pp60tdj48floLZ0+cnL
	5eLaJ08Z11IfaHkD9xUNHa2h8qrV9oqo3UlBuy4hOE6Svfvbg4v4oKfmlJrkZyxEQPNM
	03Kg==
X-Gm-Message-State: AGRZ1gIdfs+C1nR/a5EHxIWruhJVMiEJsnCNFHU15sPTFvpaOuAVAY4S
	BuqLo4SquPyYEwQr7u489pS7SK9+1jCHnnAJCVw=
X-Google-Smtp-Source: AJdET5dvyj4WiUrMSZbMA4vX/j7wbfaka61qtiLAJJyHiT4M5letWXRNIg+K479gnfZUryCqfgv+wlxTCbmBnpK+V0A=
X-Received: by 2002:a19:2a9a:: with SMTP id q26mr2440221lfq.94.1540922075227; 
	Tue, 30 Oct 2018 10:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20181030174356.16915-1-palmer@sifive.com>
	<dc417db4-7add-0870-b6b7-6a3e4ae92305@redhat.com>
In-Reply-To: <dc417db4-7add-0870-b6b7-6a3e4ae92305@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Oct 2018 10:54:08 -0700
Message-ID: <CAKmqyKPKgGuArcN+46sHt5iPmEzGGanaOtjke+ku6dKaAu_U0A@mail.gmail.com>
To: philmd@redhat.com
Cc: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
X-Mailman-Approved-At: Tue, 30 Oct 2018 16:01:34 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] Add qemu-riscv@nongnu.org as
 the RISC-V list
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
X-List-Received-Date: Tue, 30 Oct 2018 17:54:50 -0000

On Tue, Oct 30, 2018 at 10:53 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 30/10/18 18:43, Palmer Dabbelt wrote:
> > We now have a RISC-V specific QEMU development list.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

That's for testing, I was worried this would break the Linux boot :P

Alistair

>
> > ---
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d550fd8b809c..10983bd52d64 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -244,6 +244,7 @@ M: Palmer Dabbelt <palmer@sifive.com>
> >   M: Alistair Francis <Alistair.Francis@wdc.com>
> >   M: Sagar Karandikar <sagark@eecs.berkeley.edu>
> >   M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> > +L: qemu-riscv@nongnu.org
> >   S: Maintained
> >   F: target/riscv/
> >   F: hw/riscv/
> >
>

