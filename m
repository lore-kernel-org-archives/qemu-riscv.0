Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2tZn-0006LX-HO
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 06:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2tZm-0006LM-Jv
 for qemu-riscv@nongnu.org; Mon, 12 Jul 2021 06:54:14 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m2tZk-0004D9-Bk
 for qemu-riscv@nongnu.org; Mon, 12 Jul 2021 06:54:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so11188921wmc.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Jul 2021 03:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wNkWSY1YbUCbzeo6wFNyg3zcAVVxzv1tEuGIPymw67E=;
 b=W0DEglZnKbC3mGuLGbov/7qNSUy2QndmoGQlLvPLQXW8p68WUUagML1RKX4O3vkrWP
 qnW8FeqySsQ3Krvtnul0q1XuOwwbB7CVgMKmg+PPDpnxdPm0E0FmyyHGXqs6M883NV8N
 9JuWbt4BCFwVMUC+EiVrs5okMd1/7OShzKIQAu6kb39UXmNGI7N6YrOb144Mp1MWQXai
 buu0GzoGJm7reVII+yHfvBtCl4grh/mNzRzYxSH1sURCHtl3TreA/gs6w3eRlsbRJsF1
 XoY5XeODMxGW/d8VrOrltD03/jWpSPEygcYgF/yAvlx6b4rxx2bQ4I4Vx+1S3YjXKq51
 pxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wNkWSY1YbUCbzeo6wFNyg3zcAVVxzv1tEuGIPymw67E=;
 b=PonpWm/X9u9jG465NH4SZfMrVgS7DcQF/0oxvWsv3XE607NN4Ky6qSrD2+fyNLzeFl
 ra4QqhMRnFUrOZav09HXbWPUUsaMPDkZF48RFKOwR9o9hswSWs5zq/+P2R1MH4in2etx
 ha29mCmmyj8y4LeZzh28GCWOcbXBUfxwDD7l62G+vEiiGYMfz/UHNAQegua/8LB74/6O
 ANd99jAXguhoyDAPgczB8zkz+RpQwsRlQ1T9u3UzGoi+QChj7R8joTsEVYI7gTpyZeIz
 8oQU4xJTZzuWxVtQxS6rscpJdCnlc3lqkbJKf6rW2WWxUeEqdrDmYcbhSpOZWmwSPa6k
 QU2w==
X-Gm-Message-State: AOAM531r8CrLXxt1KR7TvR0jP8CQun5xowwDqYKnoZgjDe5gncTnb3WT
 w+FichGTSjrxxSXsmKmsQF9axNpsTBfUg8K+vpS1oA==
X-Google-Smtp-Source: ABdhPJwjgR238dxfbU/RQOV7URze+x3buIv4mYB0ArmM1qMCmlZdiGB7RIkbSPDarr19KXszhD11keNVB8AuGLjAg9E=
X-Received: by 2002:a05:600c:3501:: with SMTP id
 h1mr47570754wmq.157.1626087250692; 
 Mon, 12 Jul 2021 03:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-4-anup.patel@wdc.com>
 <CAEUhbmV1L7sL+9=3=onkXZoR0FYpV93gKCVxFJ5O5-Jw36PQgA@mail.gmail.com>
 <CAAhSdy2q7S08eF8NfqvEeFORkrGDaZsDJftCTaq7c9zi7WU2SQ@mail.gmail.com>
 <CAEUhbmW9XEk0rZivzQTMhFwL4Egjh0jR9HxEnwJMSOyBntiQig@mail.gmail.com>
In-Reply-To: <CAEUhbmW9XEk0rZivzQTMhFwL4Egjh0jR9HxEnwJMSOyBntiQig@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jul 2021 16:23:59 +0530
Message-ID: <CAAhSdy1QW+sQi0L+NfCSfL6k4ZQaU9sqt=ZdDQ=ZK8ygykZnxg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: virt: Add optional ACLINT support to
 virt machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 12 Jul 2021 10:54:14 -0000

On Mon, Jul 12, 2021 at 11:45 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jul 12, 2021 at 1:39 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jun 14, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Sun, Jun 13, 2021 at 12:14 AM Anup Patel <anup.patel@wdc.com> wrote:
> > > >
> > > > We extend virt machine to emulate ACLINT devices only when "aclint=on"
> > > > parameter is passed along with machine name in QEMU command-line.
> > > >
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > ---
> > > >  hw/riscv/virt.c         | 110 +++++++++++++++++++++++++++++++++++++++-
> > > >  include/hw/riscv/virt.h |   2 +
> > > >  2 files changed, 111 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > > index 977d699753..a35f66af13 100644
> > > > --- a/hw/riscv/virt.c
> > > > +++ b/hw/riscv/virt.c
> > > > @@ -50,6 +50,7 @@ static const MemMapEntry virt_memmap[] = {
> > > >      [VIRT_TEST] =        {   0x100000,        0x1000 },
> > > >      [VIRT_RTC] =         {   0x101000,        0x1000 },
> > > >      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> > > > +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
> > >
> > > How about we reuse the same register space to support both CLINT and
> > > ACLINT? This saves some register space for future extension.
> >
> > The intention of placing ACLINT SSWI separate from ACLINT MTIMER and
> > MSWI is to minimize PMP region usage.
>
> Okay, so this leaves spaces for 240 ACLINT MTIMER and MSWI devices in
> total, if we put ACLINT SSWI at 0x2F00000, and we still have spaces
> for 64 ACLINT SSWI devices. Is this enough?

We just need one instance of MTIMER, MSWI, and SSWI per-socket.
Current limit of max sockets in RISC-V virt machine is 8. We will be
reducing this to 4 due space required by IMSICs. This means no matter
what 8 instances of each MTIMER, MSWI, and SSWI is the max we
can go for RISC-V virt machine. This limits are due to the fact that
we want to fit devices in first 2GB space.

Regards,
Anup

>
> >
> > When we have multiple sockets, each socket will have it's own set of
> > ACLINT devices so we deliberately keep ACLINT MTIMER and MSWI
> > devices of all sockets next to each other so that we need just 1-2 PMP
> > regions to cover all M-level ACLINT devices.
> >
> > In general, RISC-V platform vendors will have to carefully design
> > memory layout of M-level devices so that M-mode runtime firmware
> > needs fewer PMP regions. The spare PMP regions can be used by
> > M-mode runtime firmware to partition the system into domains and
> > implement TEE.
> >
> > >
> > > >      [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
> > > >      [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
> > > >      [VIRT_UART0] =       { 0x10000000,         0x100 },
> > > > @@ -279,6 +280,78 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
> > > >      g_free(clint_cells);
> > > >  }
>
> Regards,
> Bin

