Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu1tf-0004GB-2W
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jan 2020 17:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iu1ta-0004Eg-G6
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 17:21:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iu1tZ-0006Gk-Dh
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2020 17:21:14 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iu1tV-0006FO-1e; Tue, 21 Jan 2020 17:21:09 -0500
Received: by mail-lj1-x242.google.com with SMTP id j26so4496721ljc.12;
 Tue, 21 Jan 2020 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYZMgwadz2QGt4ko1mVT+Mcscb5ua0TuSusD9PwSbas=;
 b=AbEjcW/PsztCHasKs7jWD1AnikxQF9AzeU5u4WvPTp0Rdxyp/wBVGxW/1INIQmjUJa
 ccDO0gmRy0uENbpjAUsLGuUiaJANBq9YSMmdTTsYnmKFko/ErUJn5gxLF4ILZZIcwsyb
 NLsPksBKaa2zF+Q4t+UKni9I/Pt55l3SXaGJ7DH1jR/D6Eo5dOkGE9gN62vjAqLhR7Ou
 VQKBvZtPiRWiwiTf5H0rp33bHUazks/g98jeTXcyx17CbfwKXgB1cuT1l2wbBlw5sk2N
 TIq93UG+t9RbPM6dTc3wYjjk0ha2ryYGZomNoex5wufmKUSv5WWgpvKtGQ1omEJAj8/E
 Oeqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYZMgwadz2QGt4ko1mVT+Mcscb5ua0TuSusD9PwSbas=;
 b=X6+h0icg7R0moDBAv/NKZJMcbi57VDHamitqdrDJApGDxJDWIShtwwvcxnesTz+Rr2
 e1Y0Kwz/rJq3aeaGR0KZ+KxIZs4auSAyOOGPbFCr31bi+vIP5egmt6OIIgtw2kaVVVr+
 KWQ+q7CiFmFPpmetlf8LRwb5xyFwtwAlVhNePqY8atGcXTSJ2/ufE2GKcO0lojlhuJLW
 NvMwrrzmdWtVFPMCTFjW929CHhCQml5WWcomsC1P8a+UNajhnsCiO+CN19EBHmwHCCPg
 NJYmj3GtHEyJpulwpYP0vAyWwxVF8Ry+FyJVPscDfOQCnI2UOwzuq/k/EA+Af+0Wk+rB
 XNhw==
X-Gm-Message-State: APjAAAVqBTqWRv1zSa2g7uJzubduAViI56VZNm+fuPX9SwibOnhbKwdw
 cqQyyObNBdBtaq3jqF6bIN6pBKHmiQEaLuMkUEqLqLak
X-Google-Smtp-Source: APXvYqyG8+9KT0DXVNR/1sMJTN6ZZKHxwjoOl5SPez9Al5at76GDth25kAyAVuPHGvQgPLz9em2FbwSj9tX1ofsf9ZA=
X-Received: by 2002:a2e:8946:: with SMTP id b6mr3682544ljk.1.1579645267920;
 Tue, 21 Jan 2020 14:21:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1566573576.git.alistair.francis@wdc.com>
 <5cc26abb98a9534720f09674b4b9caafb8f2cf0a.1566573576.git.alistair.francis@wdc.com>
 <20200105163640.GA1752551@aurel32.net> <20200105165916.GA1834646@aurel32.net>
 <CAKmqyKNd8ihSXTcdS9da_pGkinFVnJKAAsg4fR4LzBEUH8NZ2A@mail.gmail.com>
 <20200121203710.GA3061510@aurel32.net>
In-Reply-To: <20200121203710.GA3061510@aurel32.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Jan 2020 08:20:40 +1000
Message-ID: <CAKmqyKNwTPCxiAi=giYOPaxnKL8LcG1LuU53qJ6pE38XNWJH+w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4 3/7] target/riscv: Create function to test
 if FP is enabled
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Tue, 21 Jan 2020 22:21:17 -0000

On Wed, Jan 22, 2020 at 6:37 AM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2020-01-20 10:31, Alistair Francis wrote:
> > On Mon, Jan 6, 2020 at 2:59 AM Aurelien Jarno <aurelien@aurel32.net> wrote:
> > >
> > > On 2020-01-05 17:36, Aurelien Jarno wrote:
> > > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > > > index e0d4586760..2789215b5e 100644
> > > > > --- a/target/riscv/csr.c
> > > > > +++ b/target/riscv/csr.c
> > > >
> > > > [ snip ]
> > > >
> > > > > @@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
> > > > >  {
> > > > >      target_ulong mstatus = env->mstatus;
> > > > >      target_ulong mask = 0;
> > > > > +    int dirty;
> > > > >
> > > > >      /* flush tlb on mstatus fields that affect VM */
> > > > >      if (env->priv_ver <= PRIV_VERSION_1_09_1) {
> > > > > @@ -340,8 +341,9 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
> > > > >
> > > > >      mstatus = (mstatus & ~mask) | (val & mask);
> > > > >
> > > > > -    int dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
> > > > > -                ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> > > > > +    dirty = (riscv_cpu_fp_enabled(env) &&
> > > > > +             ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
> > > > > +            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> > > > >      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
> > > > >      env->mstatus = mstatus;
> > > >
> > > > This patch, and more precisely the above two hunks broke
> > > > qemu-system-riscv64. More precisely, when running a Debian sid system
> > > > inside QEMU, sshd hangs during key exchange.
> > >
> > > The problem is that at this stage, mstatus != env->status. Prior to that
> > > patch, dirty was computed exclusively on the new mstatus status, after
> > > the update by val. With this patch, riscv_cpu_fp_enabled() refers to the
> > > old value of mstatus. Therefore when FS is changed from "Off" (FS = 00)
> > > to "Dirty" (FS == 11), the SD bit is not set.
> >
> > Thanks for reporting this!
> >
> > Can you try this branch (it should be a PR to mainline QEMU soon) and
> > let me know if that fixes the issue?
> >
> > https://github.com/palmer-dabbelt/qemu/commits/for-master
>
> Thanks for the patchset. I confirm this fixes the issue.

Great! Sorry we were so slow in replying to you, I was traveling.
Hopefully this is pushed to master soon.

Alistair

>
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                 http://www.aurel32.net

