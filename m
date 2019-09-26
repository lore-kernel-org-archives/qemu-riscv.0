Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDWSd-00082C-Nv
	for mharc-qemu-riscv@gnu.org; Thu, 26 Sep 2019 12:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iDWSX-0007ur-PX
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 12:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iDWSW-0006DM-I9
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 12:17:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iDWS2-0005u2-Co; Thu, 26 Sep 2019 12:17:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so2784669ljg.8;
 Thu, 26 Sep 2019 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uqsguunlShpqJNqDpG6lT6Vkk/vUY2GxbBa3kyTdV2Q=;
 b=l2pYd1AkoxmHr7LHM4VVfFpuHI0MY5Uv5wtL1RSWoNnWPKicoIU7khFPfKHu/0hs+4
 cY05pyOOlCBsH+nACIq9802l+7N4pkXHL9EZPkByVdiIOi+z597Gq+BL1q3t8xyLmvuG
 Xxp7GdQOflqcZE6qoUHTWbgGCDbnucRmXtyCFueYnZAM5cr/dUsGLLdIA+TvtJ4NocF6
 T+Xk8bnuXUVR/5dMTDPRk9vnE1zMo/o4yhGtfa3co5fEPdiqw60oJhoYsVE/wxWSte80
 0m1Wtv1y4HMgtyQ9mfpgc9QRF2c9RIZU01q/9jiuZ0GMqI7mDc2m0PqoRJ7Ev6y7W0Ch
 1EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uqsguunlShpqJNqDpG6lT6Vkk/vUY2GxbBa3kyTdV2Q=;
 b=AWrmLH0Kyz1ZYkxlZE8syfJ+dKPgbiIidM20xvTXPj+Ry62ixZtoiWLYQyEzinHeZn
 NPKZFNJj+diBwCxWvAVsprmKxetbZHyOwulPLu5Nk7Dc+oQzvU2hq69URuPl0wMaIN50
 2ltFJdy7WEV3LOcr0x9SiQac/3sPV6AA6/B5gjz7nwbhyshBorweMfR55OcYWIqUWu9U
 F38NEyHlFfrCD5C1aaQ1z9ZKa/3rnCBqa0MqFXmtHPh4dq4MuqyFMpavF1BTkw1owhvX
 USV3csdbWtv+XfH0OeY9fjFb11DQV0LAMXWaU/VeIAKOiCSRkoGyBT/5w3RhWD+3mqVd
 klfw==
X-Gm-Message-State: APjAAAW4HNmdbAWnL7FtSbkoDcJgm2lFeP/gIBfeSt2a0bhbAqwh9Hx4
 B7fvMryCeOU3JRLGAr48GIMc3QdOzWCgylKkaLk=
X-Google-Smtp-Source: APXvYqwkHW3JOaT++fWR+7HZQXosIMjUu9HNmt0jS9yHUo48urz3VedxfHaMj56jBuxlb9yiRCeqDKZxg5C4MPtRfP4=
X-Received: by 2002:a2e:890c:: with SMTP id d12mr3249154lji.85.1569514563687; 
 Thu, 26 Sep 2019 09:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <20190926125817.GB19660@redhat.com>
 <ea6b671a-0c05-d880-3b9f-62a4f8626ec1@de.ibm.com>
 <19efe3ee-a532-cf66-a5a7-03a7c053737c@redhat.com> <87d0fn9ix8.fsf@linaro.org>
In-Reply-To: <87d0fn9ix8.fsf@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 26 Sep 2019 09:11:17 -0700
Message-ID: <CAKmqyKOSyhd5zv0hOa_THCX8g1fxN69NXWxCw0m+=TA+8h0Wug@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-discuss <qemu-discuss@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "open list:New World" <qemu-ppc@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.194
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
X-List-Received-Date: Thu, 26 Sep 2019 16:17:41 -0000

On Thu, Sep 26, 2019 at 8:41 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > On 26/09/2019 15.46, Christian Borntraeger wrote:
> >>
> >>
> >> On 26.09.19 14:58, Daniel P. Berrang=C3=A9 wrote:
> >>> On Thu, Sep 26, 2019 at 08:50:36AM +0100, Peter Maydell wrote:
> >>>> On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg> wrote:
> >>>>>
> >>>>> The 32 bit hosts are already a second class citizen especially with
> >>>>> support for running 64 bit guests under TCG. We are also limited by
> >>>>> testing as actual working 32 bit machines are getting quite rare in
> >>>>> developers personal menageries. For TCG supporting newer types like
> >>>>> Int128 is a lot harder with 32 bit calling conventions compared to
> >>>>> their larger bit sized cousins. Fundamentally address space is the
> >>>>> most useful thing for the translator to have even for a 32 bit gues=
t a
> >>>>> 32 bit host is quite constrained.
> >>>>>
> >>>>> As far as I'm aware 32 bit KVM users are even less numerous. Even
> >>>>> ILP32 doesn't make much sense given the address space QEMU needs to
> >>>>> manage.
> >>>>
> >>>> For KVM we should wait until the kernel chooses to drop support,
> >>>> I think.
> >>>
> >>> What if the kernel is waiting for QEMU to drop support too ;-P
> >>
> >> For what its worth on kvm/s390 we never cared about implementing
> >> 32 bit.
> >
> > Looking at tcg/s390/tcg-target.inc.c :
> >
> > ...
> > /* We only support generating code for 64-bit mode.  */
> > #if TCG_TARGET_REG_BITS !=3D 64
> > #error "unsupported code generation mode"
> > #endif
> > ...
> >
> > ... it seems to me that TCG does not support 32-bit on s390 either. I
> > think we can remove s390 (32-bit) from the list completely?
>
> It's the same for riscv32 I think.

I think riscv32 host *should* work, although I don't think it was ever test=
ed.

Considering that we have enough trouble keeping the riscv32 kernel
booting it's probably ok to drop it from QEMU.

Alistair

>
> >
> >  Thomas
>
>
> --
> Alex Benn=C3=A9e
>

