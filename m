Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j72Rv-0002tD-EQ
	for mharc-qemu-riscv@gnu.org; Wed, 26 Feb 2020 14:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j72Rs-0002s0-I2
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 14:34:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j72Rr-0001c5-Hb
 for qemu-riscv@nongnu.org; Wed, 26 Feb 2020 14:34:24 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:41311)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j72Rp-0001Rh-Aj; Wed, 26 Feb 2020 14:34:21 -0500
Received: by mail-lf1-x144.google.com with SMTP id y17so195900lfe.8;
 Wed, 26 Feb 2020 11:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OeiRmisirQs53fzEc62MznQFb5IgvCH23fAHr5mJWbU=;
 b=TGLBKNAIwS5ydt0gZehymmplQc7g9o1AgUx8CEKxNQLxufN4AXP2OTFP0LI0+bK5pY
 WPFyuTHbTzdVo3q6PkjM88Sjzp0TA1DpoIDLzotcI5P2TTDzt/mBGWk4kfPAIXiYIUwn
 DwQdZNZepxrgihx0m3Qu32P+PWjmxj4N6wGYqX+VyTyazKY9TSXxms2rbInEfghE5wT6
 sWNGl0In69j5of2ko7tezMWSbGirQiJI7DGvdrqsYEMs8N3ZOqGV8GGWZVe1EJcrpr66
 zY901GrBzGmM+hVL7VxYLucIv6HU9ilR26YrWo5fpTNB/e8s1M6eSzCTZ/3vl1RizCLY
 6aPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OeiRmisirQs53fzEc62MznQFb5IgvCH23fAHr5mJWbU=;
 b=mEs0bRX2yTRRoyfaXcvscxBwdN/9cByhSEfQ2fJhQxNRGXkxsx97y9NJwPAZgmG3K0
 aq99ve9rfW/os9vWqvf+eALvBySQDTMDLdqpAz/NK4WeS1kf009g4qfuwcb7KSnKI1b9
 4F/3cwczPh/L04KL4TKSPd3tEupUJM22ybJstFBLJCtKQTH6UKWr7E+fcm5pgV+ls37+
 b+her4v+ec1BxgiLDCpF2+HH9/U1dz/TEbjHijl06IESindZs4jkc4T/rpvzkoiA5y0l
 l3kg3OuNdk44ipNEA1LdBn7tyCUHkhlWpS+7tXg5SuXvGVs9b5QgWMtrT5t0DIf85gZ4
 WbLw==
X-Gm-Message-State: ANhLgQ1PgHmWa/6TIvDTY9VE/amrHRBbB/pxO99zAw6bT+bLdnXD+bwg
 D4ndGWgkJXaA20deknubSfKGmjklX2Bm15RCFNQ=
X-Google-Smtp-Source: ADFU+vt3wqoyl7GWQb+IXa56Chxq9CNai8I342JuyQSM/taMnxOKThGdniPlqKrH9gP7uiigGnmMF5ZDl13gDoExCJE=
X-Received: by 2002:ac2:5111:: with SMTP id q17mr113214lfb.51.1582745659727;
 Wed, 26 Feb 2020 11:34:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582586444.git.alistair.francis@wdc.com>
 <306320d5-b305-1890-3185-05353363cce5@vivier.eu>
In-Reply-To: <306320d5-b305-1890-3185-05353363cce5@vivier.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Feb 2020 11:26:38 -0800
Message-ID: <CAKmqyKNwgVV+HuTa9RqYy4wJ2c=z23_gU=x3teukJ1+zjsfgbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] linux-user: generate syscall_nr.sh for RISC-V
To: Laurent Vivier <laurent@vivier.eu>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2020 19:34:26 -0000

On Tue, Feb 25, 2020 at 5:39 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 25/02/2020 =C3=A0 00:21, Alistair Francis a =C3=A9crit :
> > This series updates the RISC-V syscall_nr.sh based on the 5.5 kernel.
> >
> > There are two parts to this. One is just adding the new syscalls, the
> > other part is updating the RV32 syscalls to match the fact that RV32 is
> > a 64-bit time_t architectures (y2038) safe.
> >
> > we need to make some changes to syscall.c to avoid warnings/errors
> > during compliling with the new syscall.
> >
> > I did some RV32 user space testing after applying these patches. I ran =
the
> > glibc testsuite in userspace and I don't see any regressions.
> >
> > Alistair Francis (2):
> >   linux-user: Protect more syscalls
> >   linux-user/riscv: Update the syscall_nr's to the 5.5 kernel
> >
> >  linux-user/riscv/syscall32_nr.h | 314 ++++++++++++++++++++++++++++++++
> >  linux-user/riscv/syscall64_nr.h | 303 ++++++++++++++++++++++++++++++
> >  linux-user/riscv/syscall_nr.h   | 294 +-----------------------------
> >  linux-user/strace.c             |   2 +
> >  linux-user/syscall.c            |  20 ++
> >  5 files changed, 641 insertions(+), 292 deletions(-)
> >  create mode 100644 linux-user/riscv/syscall32_nr.h
> >  create mode 100644 linux-user/riscv/syscall64_nr.h
> >
>
> I have written a shell script to generate the syscall_nr.h from the
> asm-generic, but as it uses a lot of cpp, tr, sed and grep, the result
> needs to be checked.
>
> If it can help, it is in attachment.
>
> Put it in scripts, and run it as:
>
> scripts/gensyscalls.sh /path/to/linux
>
> then check the result with something like "git diff -w"

Thanks! That seems to be pretty correct :)

Alistair

>
> Thanks,
> Laurent

