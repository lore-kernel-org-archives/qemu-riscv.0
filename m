Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWBsH-0005Pt-9p
	for mharc-qemu-riscv@gnu.org; Wed, 29 May 2019 23:37:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1hWBsE-0005PV-Iw
	for qemu-riscv@nongnu.org; Wed, 29 May 2019 23:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bmeng.cn@gmail.com>) id 1hWBsD-0005rQ-Qe
	for qemu-riscv@nongnu.org; Wed, 29 May 2019 23:37:02 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40008)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
	id 1hWBsD-0005mE-FF; Wed, 29 May 2019 23:37:01 -0400
Received: by mail-ed1-x544.google.com with SMTP id r18so5942275edo.7;
	Wed, 29 May 2019 20:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4eG+VP0ofgFTRUD96ocaiDBqUmzcXIw5Kumk2DTsAjo=;
	b=cadT/9j5INN3q10RicMlUsKTN/PpYo9/s4qZP5XPfRmBZOmLKFYTiUjUeakS6nZiwm
	cS16MOiSXgTur5T3+pOFWxXrbjNm/qLei6NBpfmtnf1ProS98m6uZxZ2Kjvx/xvH/tIF
	UOi/ZGa0lHOKnuNsvsvjkpe2WgZhppFcpP5Tf57ZlyAOwweM4BLKdcpiCwl+mEQqUDXW
	XJBVYCUEK/XI0roYjM/9EhdoHPOhpb/c3UqcMDiA5mGIrOXwlZ8+dkJGu3e2cmXIfP/8
	5a38UPOAPEOnEfMQk8qZQyYn3P5AqeXGcxZ8lJ2IASM4ij5SgMExNxsX9j9vHpa2rfaf
	hQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4eG+VP0ofgFTRUD96ocaiDBqUmzcXIw5Kumk2DTsAjo=;
	b=SIGXba7ZbID2ejedboMFmQxxU+dI4vCXHt6nc3mBT/A9a5Br/euGiB5tl08kQw2yHr
	xir/KuXvLMGRetvnUAGeQvRnufmEqbOoqY2n2SRQJyBxbygVc0879uOU8vu+mm0+H9JY
	aMddrkFejL8uD7PzQtDXuo5R2Tlf76h2e2xU2/OIPP+7jSDYn+hI7XZ2raNSl1hg+9U6
	bRQ5av6p2VgozDzeIo/lw9HMdaEpXWlE0vX1Co/4FSqPP/J8LGGF2zgG9IzSRqGW/mm0
	JuwSAEtZK3h0xSeSXh0ccqbngAwPLhhwAxPgJWwfj0XDuAj8wcW8pHnbDFSvTRDXUFRg
	rhug==
X-Gm-Message-State: APjAAAVUQyNLudkMBwOQM6xxa9KOS+r+LXV4iG1DrOtT7bxvC4Z0bTtz
	m4D4A20NIgxRqx9yw/PKFl/NK1rc04joU6VBAAQ=
X-Google-Smtp-Source: APXvYqx8Tikl0eEw5GmO5NSNwSH+0RcMLRAJ2nRJEiCHzG5Nni8jiupfT6nOTgSbj+69eVRbt8EibqMhYGHP7Y6KWOs=
X-Received: by 2002:aa7:c554:: with SMTP id s20mr308892edr.15.1559187418048;
	Wed, 29 May 2019 20:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <1559119921-6098-1-git-send-email-bmeng.cn@gmail.com>
	<CAKmqyKNAL8KtVgfCx6yhaNYEL=_wnZ5Vf1eSjxwtg0x6_q+UHw@mail.gmail.com>
In-Reply-To: <CAKmqyKNAL8KtVgfCx6yhaNYEL=_wnZ5Vf1eSjxwtg0x6_q+UHw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 30 May 2019 11:36:46 +0800
Message-ID: <CAEUhbmXLr3zXhbphXRvqfyW1FH9qo3yoPwnFoRoYNtbwkrBBKw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: virt: Correct pci
 "bus-range" encoding
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
X-List-Received-Date: Thu, 30 May 2019 03:37:03 -0000

Hi Alistair,

On Thu, May 30, 2019 at 11:14 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, May 29, 2019 at 1:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > The largest pci bus number should be calculated from ECAM size,
> > instead of its base address.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> This seems ok, can you maybe explain what this fixes?
>

The logic is wrong, as the commit message said. With current wrong
logic, the largest pci bus number encoded in "bus-ranges" property was
wrongly set to 0x2ff in this case. Per pci spec, the bus number should
not exceed 0xff.

Regards,
Bin

