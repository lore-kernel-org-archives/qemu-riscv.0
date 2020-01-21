Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itrj5-0005gh-G5
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 06:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1itrj2-0005fO-DA
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 06:29:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1itrj1-0000Hd-C7
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 06:29:40 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33884)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1itrj0-0000Es-Sy
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 06:29:39 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so2799872wrr.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2020 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lydaG8bVLqnVOyu1nadKohiTA5PIw0cXjo6ZrAjWbjY=;
 b=PQejQbJErEwrIW+pIg5LmvrDWYnBeKv6rSuK62BxMmNN010r+J7xvNqP4ccpgf5/h3
 cMEAUJESQ/3FbZjXC8U4nPRVjP2/Ezb+YFmI/wVGHUNQFIY1Xj4GGd64tygW8hojMXbI
 zctjIitEAdvtL0ydE3Jil0BWUDGNVQP0NneLKI8OsfX3izLCX1dWKQ0Fw2wtzrH9E1nU
 r0GzAWNncdbUuGpeSBbcnw9exEaPoyp1y0sEpchGq1CppCG89PP5mcJ0lf6i+OCjpliY
 g2Q+FkLCL7NBt7I52hNNx+XI/2HT2dLejLvy3vM7kopMYPebQouxjam4dpJvmUhX8DwE
 C2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lydaG8bVLqnVOyu1nadKohiTA5PIw0cXjo6ZrAjWbjY=;
 b=Czd5wNVmQOzb2QbCarugVJ8SI2taM32bA/6ETK1naQKeDRuGvbn2yQZXBPDsSwrvlY
 /3g3J1Cvx8IY1KoCT9R36EGC6bCjUnO0ECMtx/UU5GAfppQWk03L0p9aM5j2A865GLFO
 t8tm+PjqH7VjdOWv+DkhuQJb9EhnqbcWp4IXk7sGAIEms0TMjA1obBFEyx26Mi6X9sdo
 Lgh6TgDGXq6wELQbVKYbzaXm3z1uaQrV4vzkp9w46rK8Oq9tqjQFbxXptWSAKJiqGjII
 RU0BQ7gWXAv7v9gGwNGQKyL617YNtyNZEwlZGf9ADiMwHEiiJd8IBRGMFZTQ97UueoMx
 D4/g==
X-Gm-Message-State: APjAAAXUhOdlxIPox/VuM46O/0Qnz5BjRDMHXIx0sIEH2M3mLcDKVdGj
 JgOLJ1wvNRYOM0JHty9CFMURWbRgCRaMwT82aveq4Q==
X-Google-Smtp-Source: APXvYqxLIY73pPZwumCqJezxhUDfu/EFg/R+RRS10+I++enEAGYbK+WwGKfxq722u3SuPcbjXkPhb1G5dyswTiw8XFg=
X-Received: by 2002:a5d:5345:: with SMTP id t5mr5079984wrv.0.1579606177368;
 Tue, 21 Jan 2020 03:29:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575914822.git.alistair.francis@wdc.com>
 <b1313a76928acfe101247e33248f000e1f82f558.1575914822.git.alistair.francis@wdc.com>
 <mhng-1d91cb12-dd7c-4160-9e39-a1d5a9f5023a@palmerdabbelt-glaptop>
 <CAKmqyKOfqHn9PBsDeb65JSovszT4qF_3eNRUGA5AaG4_zhyiTA@mail.gmail.com>
In-Reply-To: <CAKmqyKOfqHn9PBsDeb65JSovszT4qF_3eNRUGA5AaG4_zhyiTA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jan 2020 16:59:24 +0530
Message-ID: <CAAhSdy0efUTu3LOayfD__TYcWN9h7dkz_w=PkK-sS6t2fdpFnA@mail.gmail.com>
Subject: Re: [PATCH v1 17/36] target/riscv: Set VS bits in mideleg for Hyp
 extension
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Tue, 21 Jan 2020 11:29:41 -0000

On Tue, Jan 21, 2020 at 4:43 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jan 8, 2020 at 12:07 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> >
> > On Mon, 09 Dec 2019 10:11:24 PST (-0800), Alistair Francis wrote:
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/csr.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index a4b598d49a..fc38c45a7e 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -449,6 +449,9 @@ static int read_mideleg(CPURISCVState *env, int csrno, target_ulong *val)
> > >  static int write_mideleg(CPURISCVState *env, int csrno, target_ulong val)
> > >  {
> > >      env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
> > > +    if (riscv_has_ext(env, RVH)) {
> > > +        env->mideleg |= VS_MODE_INTERRUPTS;
> > > +    }
> > >      return 0;
> > >  }
> >
> > Do you have any idea why?  The spec is explicit that this is the case, but I'm
> > surprised.
>
> I'm not sure why, maybe to simplfy hardware design?

As-per my understanding, the VS-mode interrupts can be
taken only when V=1 and these are injected by HS-mode
using HIP CSR.

If we allow VS-mode interrupts to be taken in M-mode then
it means HS-mode can now inject interrupts for M-mode using
HIP CSR. This cannot be allowed hence VS-mode interrupts
are force delegated to S-mode in MIDELEG.

Regards,
Anup

