Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m34zd-0006vm-3X
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 19:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m34zb-0006ub-Nf; Mon, 12 Jul 2021 19:05:39 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m34zZ-0006ww-QL; Mon, 12 Jul 2021 19:05:39 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id o139so31607837ybg.9;
 Mon, 12 Jul 2021 16:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GiHMqpTL0s3+XVD0egmP3P2blIqnpZat3tJ3moQX65U=;
 b=bpaDZ/M5wP8kCiWCrP1Fv7GMdvrbdi1EnPfD74A3GlbaDV67rp6NQ6JdBr7E14tUUK
 SoRnokNA0BFp3ZppGjrXdVhmsZ8JnSGfxFBkKMYsr/ESayKGkdU6135/4XAsu/GApD/Z
 Mmgukt2bjoG8jMyzhXJiHuap5NxwA7sRzj+/Hwz3g2/AFbrKq/luPnfgrkSsgpOFt2lm
 GokXkht8porjJV3RH2s5psx5Hef4x6Vkb7NtSr10kOgkNdkIZDv15o8L/B3nUUNrEda0
 QF43yvVlPTngDiK/nol0MYJr71xJscMfJbBh8igAEMRyoE9Sd+rt8ahsIEKuyePGjTn+
 oe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GiHMqpTL0s3+XVD0egmP3P2blIqnpZat3tJ3moQX65U=;
 b=hxiTEk/+eqbpV1wDLwawkK/H+mERr4rFaXOXlD9oc/4vpAOhHaWDZd9FFSTvq8GvRp
 iiuLflYAcGaQW/PJhx/5HriRPyWcSwGenmr89qRswvMXksWZAysBzu9m4MjkLI/cTZgg
 gMmn0aULuD+wVk0avCWjccbz/MkEXfjMj1URfE3308bu7RN6xmtmE+zU/2Z5h/rklcnP
 jzk4Ygt5lPHqNzmuwyuIAe6RvYovm0gEPY3IxgTA30mWjcsKZoDuvJnftCZrXowUHJxp
 56qQS7ZAj/Np4tgxYrabGsmPjLVnNHeYGGrM7NFqu1tgwDtiEL3jfoTZiMG+TsgTPaxD
 HGDA==
X-Gm-Message-State: AOAM532eaT0Y3M+/5qrkRn9xXQm6mE+L+cB8AnFUN7E7JJrJcjw0sLZ8
 zfgWGAoXuwQSF4ZnaF3+TTkxE3J9/F3TKhT84d0=
X-Google-Smtp-Source: ABdhPJxCCSQN8WqZhMeXSfgoPl41z3lSez7qiKinlNchtU7mGI/f2EQuVIvIMmQdd1LeVrYbOEiFx/SWAei8V3iNXss=
X-Received: by 2002:a25:be09:: with SMTP id h9mr1926964ybk.239.1626131136529; 
 Mon, 12 Jul 2021 16:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-4-anup.patel@wdc.com>
 <CAEUhbmV1L7sL+9=3=onkXZoR0FYpV93gKCVxFJ5O5-Jw36PQgA@mail.gmail.com>
 <CAAhSdy2q7S08eF8NfqvEeFORkrGDaZsDJftCTaq7c9zi7WU2SQ@mail.gmail.com>
 <CAEUhbmW9XEk0rZivzQTMhFwL4Egjh0jR9HxEnwJMSOyBntiQig@mail.gmail.com>
 <CAAhSdy1QW+sQi0L+NfCSfL6k4ZQaU9sqt=ZdDQ=ZK8ygykZnxg@mail.gmail.com>
 <CAEUhbmXLcgF59QXFveqpJJ-QzexfR++b+JE-ECKntgMnFQ_boA@mail.gmail.com>
 <CAAhSdy195JTXoZsk=XOZmQog2X4ZP2Npty-74SvorC8Kjjdm9g@mail.gmail.com>
In-Reply-To: <CAAhSdy195JTXoZsk=XOZmQog2X4ZP2Npty-74SvorC8Kjjdm9g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Jul 2021 07:05:25 +0800
Message-ID: <CAEUhbmWgmu3UKfAtq31E=BrBhJeWUSC+KhQ2FTCD2PBqnact_g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: virt: Add optional ACLINT support to
 virt machine
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 12 Jul 2021 23:05:39 -0000

On Mon, Jul 12, 2021 at 11:03 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jul 12, 2021 at 6:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Jul 12, 2021 at 6:54 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Mon, Jul 12, 2021 at 11:45 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Mon, Jul 12, 2021 at 1:39 PM Anup Patel <anup@brainfault.org> wrote:
> > > > >
> > > > > On Mon, Jun 14, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > > >
> > > > > > On Sun, Jun 13, 2021 at 12:14 AM Anup Patel <anup.patel@wdc.com> wrote:
> > > > > > >
> > > > > > > We extend virt machine to emulate ACLINT devices only when "aclint=on"
> > > > > > > parameter is passed along with machine name in QEMU command-line.
> > > > > > >
> > > > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > > > ---
> > > > > > >  hw/riscv/virt.c         | 110 +++++++++++++++++++++++++++++++++++++++-
> > > > > > >  include/hw/riscv/virt.h |   2 +
> > > > > > >  2 files changed, 111 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > > > > > index 977d699753..a35f66af13 100644
> > > > > > > --- a/hw/riscv/virt.c
> > > > > > > +++ b/hw/riscv/virt.c
> > > > > > > @@ -50,6 +50,7 @@ static const MemMapEntry virt_memmap[] = {
> > > > > > >      [VIRT_TEST] =        {   0x100000,        0x1000 },
> > > > > > >      [VIRT_RTC] =         {   0x101000,        0x1000 },
> > > > > > >      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> > > > > > > +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
> > > > > >
> > > > > > How about we reuse the same register space to support both CLINT and
> > > > > > ACLINT? This saves some register space for future extension.
> > > > >
> > > > > The intention of placing ACLINT SSWI separate from ACLINT MTIMER and
> > > > > MSWI is to minimize PMP region usage.
> > > >
> > > > Okay, so this leaves spaces for 240 ACLINT MTIMER and MSWI devices in
> > > > total, if we put ACLINT SSWI at 0x2F00000, and we still have spaces
> > > > for 64 ACLINT SSWI devices. Is this enough?
> > >
> > > We just need one instance of MTIMER, MSWI, and SSWI per-socket.
> > > Current limit of max sockets in RISC-V virt machine is 8. We will be
> > > reducing this to 4 due space required by IMSICs. This means no matter
> > > what 8 instances of each MTIMER, MSWI, and SSWI is the max we
> > > can go for RISC-V virt machine. This limits are due to the fact that
> > > we want to fit devices in first 2GB space.
> > >
> >
> > Can you list the maximum ACLINT devices and their memory map we intend
> > to support and with that we can see how many PMP is used?
>
> For 4 sockets, we will have following layout:
> 0x2000000-0x200FFFF (Socket0 MTIMER and MSWI)
> 0x2010000-0x201FFFF (Socket1 MTIMER and MSWI)
> 0x2020000-0x202FFFF (Socket2 MTIMER and MSWI)
> 0x2030000-0x203FFFF (Socket3 MTIMER and MSWI)
> 0x2F00000-0x2F03FFF (Socket0 SSWI)
> 0x2F04000-0x2F07FFF (Socket1 SSWI)
> 0x2F08000-0x2F0bFFF (Socket2 SSWI)
> 0x2F0C000-0x2F0FFFF (Socket3 SSWI)
>
> OpenSBI will create one PMP region to protect all
> MTIMERs and MSWIs which is:
> 0x2000000-0x203FFFF

Thanks! This makes sense.

Regards,
Bin

