Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2vip-00039P-Oa
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 09:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m2vio-00037D-Lo; Mon, 12 Jul 2021 09:11:42 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m2vin-00010X-5N; Mon, 12 Jul 2021 09:11:42 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r135so28953365ybc.0;
 Mon, 12 Jul 2021 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hVycRudzHLn8GrmOX28fmHXLn4kkizA0cxFd3cvzEbY=;
 b=lXYnRCSHvWlS5/N6GBDjxSzmA2DWeqKZksX082eB1hfHW37V8yfY3IYtSXD8dyR7id
 f29NL9XD9HkecvSqo9RxOtFleF6eqn/o49lBV129mRn6GH9NKsxbAwkNXASz0oFnKTwL
 dbAygIhZOQla4RYiB9VMgaUPZfoLnWywNSebxthLLBel49GOf0EXw+Dzd/xzEsl0a2gA
 1M/KS7qi0WCO/7yoFKDzYoi+4nWLlQOjm02456dFQm9aiewCNFiPSab/R0D+Gwt0pr+o
 mhlw+sFCapRP9Efh9UtsjJStHhOuiMGAnXmTEUtb0g5KiBBqsTTIRbCRslgn36Warjk5
 uoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVycRudzHLn8GrmOX28fmHXLn4kkizA0cxFd3cvzEbY=;
 b=LCTZOkQAJa9Gp8SlgQuDKTj+G5wnC+dbyG/1INbutoohkauP0z6uE4Rhdv6X1Zhnz9
 p8rPJuZGX7bcKCfr9R2Hi/eI3hJOmhWDN9fSp3Y3mfyJRTZhc5niGv5yfrxlkt0/9SUd
 Rt7PaEski4tR4EXxg3ojluFO+ew0kRIItksXP0ff5RhnuuFhWOTe6QosM9GsIDpKcp75
 JK+Pkub8PASCaGz2fNLOzd5YX6ajqHzDbZxEGuC9dr9tRex5zEH34UnSqxzs3iCI66TO
 R98ZFBZh3iPKbTVkCLrD7kW09dmufPq1H79x8SdIzmlyOnGnJ9lSsj0nRkuKU2pz5IRB
 30pw==
X-Gm-Message-State: AOAM533M/vqXsTIXr6BdjrNU5SFKApCxBRZUBDOILiLPcs+A3nXtAURV
 a0gygKw9huBDBXOxbJx5+NFHSoZOMGH2fyatS7M=
X-Google-Smtp-Source: ABdhPJxw1SQEHLpt3ScKb7IrlNbTOUtL/GKLXccTDu9mbxiMRg7i0X8vH4I2xlEYyDxUKiOiw4pbzQVIzilUVvZXML8=
X-Received: by 2002:a25:be09:: with SMTP id h9mr69012076ybk.239.1626095498654; 
 Mon, 12 Jul 2021 06:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-4-anup.patel@wdc.com>
 <CAEUhbmV1L7sL+9=3=onkXZoR0FYpV93gKCVxFJ5O5-Jw36PQgA@mail.gmail.com>
 <CAAhSdy2q7S08eF8NfqvEeFORkrGDaZsDJftCTaq7c9zi7WU2SQ@mail.gmail.com>
 <CAEUhbmW9XEk0rZivzQTMhFwL4Egjh0jR9HxEnwJMSOyBntiQig@mail.gmail.com>
 <CAAhSdy1QW+sQi0L+NfCSfL6k4ZQaU9sqt=ZdDQ=ZK8ygykZnxg@mail.gmail.com>
In-Reply-To: <CAAhSdy1QW+sQi0L+NfCSfL6k4ZQaU9sqt=ZdDQ=ZK8ygykZnxg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Jul 2021 21:11:27 +0800
Message-ID: <CAEUhbmXLcgF59QXFveqpJJ-QzexfR++b+JE-ECKntgMnFQ_boA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Mon, 12 Jul 2021 13:11:42 -0000

On Mon, Jul 12, 2021 at 6:54 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jul 12, 2021 at 11:45 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Mon, Jul 12, 2021 at 1:39 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Mon, Jun 14, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Sun, Jun 13, 2021 at 12:14 AM Anup Patel <anup.patel@wdc.com> wrote:
> > > > >
> > > > > We extend virt machine to emulate ACLINT devices only when "aclint=on"
> > > > > parameter is passed along with machine name in QEMU command-line.
> > > > >
> > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > ---
> > > > >  hw/riscv/virt.c         | 110 +++++++++++++++++++++++++++++++++++++++-
> > > > >  include/hw/riscv/virt.h |   2 +
> > > > >  2 files changed, 111 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > > > index 977d699753..a35f66af13 100644
> > > > > --- a/hw/riscv/virt.c
> > > > > +++ b/hw/riscv/virt.c
> > > > > @@ -50,6 +50,7 @@ static const MemMapEntry virt_memmap[] = {
> > > > >      [VIRT_TEST] =        {   0x100000,        0x1000 },
> > > > >      [VIRT_RTC] =         {   0x101000,        0x1000 },
> > > > >      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> > > > > +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
> > > >
> > > > How about we reuse the same register space to support both CLINT and
> > > > ACLINT? This saves some register space for future extension.
> > >
> > > The intention of placing ACLINT SSWI separate from ACLINT MTIMER and
> > > MSWI is to minimize PMP region usage.
> >
> > Okay, so this leaves spaces for 240 ACLINT MTIMER and MSWI devices in
> > total, if we put ACLINT SSWI at 0x2F00000, and we still have spaces
> > for 64 ACLINT SSWI devices. Is this enough?
>
> We just need one instance of MTIMER, MSWI, and SSWI per-socket.
> Current limit of max sockets in RISC-V virt machine is 8. We will be
> reducing this to 4 due space required by IMSICs. This means no matter
> what 8 instances of each MTIMER, MSWI, and SSWI is the max we
> can go for RISC-V virt machine. This limits are due to the fact that
> we want to fit devices in first 2GB space.
>

Can you list the maximum ACLINT devices and their memory map we intend
to support and with that we can see how many PMP is used?

Regards,
Bin

