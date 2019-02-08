Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsCf7-0005an-Pv
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 15:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsCf5-0005ZH-Q2
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:22:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gsCf4-0003Ua-Ph
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 15:22:11 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:40572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gsCf4-000362-Er; Fri, 08 Feb 2019 15:22:10 -0500
Received: by mail-lj1-x22e.google.com with SMTP id z25-v6so4054410ljk.7;
	Fri, 08 Feb 2019 12:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qIBGMWiJLXaIN9nw3Xw0gSw602QqZ1YjIOCZN9X6nRA=;
	b=ojXOWhUBgzAqc48/xq7bwd+GHiJodQP13x758XhZW2SFyz2SgzMuhMssfJwQV4dt2A
	mQ8ntO18QGsdLat/bh2f5CbjA11qhtNMOe5cIpxo+LtG+WeDF9sesMVswoog+hLvKS6X
	gJtHcPnOq0r9QcQoX8Eu2ctx8Hn7z+WChx+1HkiYlVg/1jNZAhJRrpN0AOAB6n32Gn9R
	/EeG7pRsmG2ARZduo5hKp6/aj+oab+/Et/vjwG2vcYh6Vgyh6+9fatzCSQv1253GXLTB
	InsR5DEij2msR5nO2vWvC5RakWV4fDn91FCxyuMs6ii9Agu/BXbMHJ/D+mJbIm9kGCnn
	WSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qIBGMWiJLXaIN9nw3Xw0gSw602QqZ1YjIOCZN9X6nRA=;
	b=Df/G32bx+fhdLONKXm04wVbGF4W30TTa6jdGryp0ExquHalRve3cdZgr2R5EWJXq85
	UIRFyYxjFYChUDQTMZ36y3eik49O31ZigndiGdcH0WHbpWKJCTYnXeS+Ad82pjnnpvaz
	CCTEqpTWW4NhILpglmbgyB86fNfBe23J0R1RSNdNJiCY6HmyNHRlpwAlMzWTTlv1jNuJ
	3dPT7nFza+b+VQZ8K4mwWl2Mj+qmeCddRZU+gMgLLJeSUi/2XomWoIkUJWbgmEKwzM3o
	SAnvX8+xNm3Z/CpziY62mMpERvxuM4knLHEjZvjdVtTW01PO1g78y60PPH0C3FCBJ60f
	8q5A==
X-Gm-Message-State: AHQUAuY1EdqsygdGnBgySox+8rEi21H0+z+4vsseUWXZP9D/fvzMYeNG
	ODifrhcrIUGqTHngkaABM9JaEdiqXE22wB5GnlRF/kgk/QY=
X-Google-Smtp-Source: AHgI3IbOokkJr16ur/r+51U1RUFj0FhNDjnZTId/PNtxQGkek8U05B+K7oA4uLreDD1be/z7GqY/OTKaHjjZIfwhLP4=
X-Received: by 2002:a2e:9457:: with SMTP id
	o23-v6mr14297826ljh.7.1549651315715; 
	Fri, 08 Feb 2019 10:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20190130185242.12490-1-chouteau@adacore.com>
	<CAKmqyKMNqYBN9ZCESAxfqWSOidjFRhQNofN130MOPDOyRwQ28w@mail.gmail.com>
	<5cb673ce-930d-81d5-eb59-d33471f7318b@adacore.com>
In-Reply-To: <5cb673ce-930d-81d5-eb59-d33471f7318b@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Feb 2019 10:41:17 -0800
Message-ID: <CAKmqyKMWuqYD-_nYFR1dwvw7ZqPTqqsBdF_V0FBzryuWOgL4zQ@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Michael Clark <mjc@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::22e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/sifive_clint.c:
 avoid integer overflow in timecmp write
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
X-List-Received-Date: Fri, 08 Feb 2019 20:22:12 -0000

On Thu, Feb 7, 2019 at 2:08 AM Fabien Chouteau <chouteau@adacore.com> wrote:
>
> Hello Alistair,
>
> On 07/02/2019 01:42, Alistair Francis wrote:>
> > Can you describe what this fixes?
> >
>
> I encountered this problem when I tried to write 0xffffffffffffffff in timecmp.
>
> With the integer overflow in QEMU, writing this value means that the QEMU timer
> will be set in the past.
>
> > Won't an overflow be ok as we then just wrap around anyway? I guess
> > there is a problem if we want a value so large that we wrap around
> > past our current time though.
> >
>
> The overflow was in the computation of the value `next_ns`. It is used to set
> the QEMU timer:
>
> timer_mod(cpu->env.timer, next_ns);
>
> A negative `next_ns` -because of the overflow- means that the timer
> triggers immediately instead of far in the future.

Ah you are right here. The expired time of the timer will be set to
zero (it looks like QEMU ensures it can't be negative) but then it
detects that as being in the past and will trigger the timer event as
timer_expired_ns() will return true.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Regards,

