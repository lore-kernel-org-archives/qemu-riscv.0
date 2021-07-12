Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2pEI-00042u-B7
	for mharc-qemu-riscv@gnu.org; Mon, 12 Jul 2021 02:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m2pEF-000425-J5; Mon, 12 Jul 2021 02:15:43 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m2pED-0005T1-Q2; Mon, 12 Jul 2021 02:15:43 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id p22so27157585yba.7;
 Sun, 11 Jul 2021 23:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M6SMl93cfZKlSg+WMb7uEQTDvqjpWYF2ZLPtOoPc9nQ=;
 b=UqB5EqR8nGamCHRc9E9hj2iJh1t+PsQ4SUsn6eYV/ViwaK2q5VDEyKrlV3j2n505bp
 UgNCEKfrJKOPVcl+gvfn5nxeD9L3QdMO7U165UzI8Ck28cwcxlzdGlRrB7lHNfztFMdv
 jyGri+s9wJi8vFS5aAyWRymuVXJwUpls/JCKAPGm8W+v/gT17ordmO7UI6uU5Tjq2LcL
 9AzMU1iJCtwx+Dj6P54xkLeR7RO9oSfWkEi47hSkexGbYy3s8efTy/F30Bbq6hDCuPC7
 VKgP79ZZqQz+l/GiG88ACID4+BK7UvunrtWyaQGGZ66tSpzNHPBgQrjwVHyr9NY0igVU
 YXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M6SMl93cfZKlSg+WMb7uEQTDvqjpWYF2ZLPtOoPc9nQ=;
 b=P7OXxA4XhKDepnkCX2kuyfp78qEuJwXbqgEFWgllxCTH4r/USXK07cSPEo+B8o0zc5
 UPPRB/xKLKK+lxCzM3+onjIH3el2ZD8jCmyRt8g2ZHdo8a4VRzQloQVJbfKxgG6n1kdF
 YAHZF5gqUJPttzpnpmLvJ4TkkqWPtEnEMJpo2qtjWMLDrTzti7mt19iaBd3lCM6WOSwF
 2eV21PC/4nA0L26HWAmTNkdI0yL04DqqMsUcZvsSXuuE2if/11GKK2n5ug9MqSmNO6D4
 eEscaa2nW9ODt18/h1r7ulxTVaeyZYEGw5h6DZIqHsH1j57QwSIBboaaa7+7uqQkzk8k
 Ot5w==
X-Gm-Message-State: AOAM531zlhxema3mPqn8NR+ZubSn3WRhbCg2n8f82McCYd+cAbMnxDhD
 P06sKTC9+ZEuo3nIMVRafREVYrDYmsRU96hIhqA=
X-Google-Smtp-Source: ABdhPJyyWAOtdavILXEBVJdXZEztFygJ0kqjijCZEKbBnjvvfNPp4xHORIOVEb+zh8aHq2nipNJ0OhH8vH7FGWb7EEw=
X-Received: by 2002:a25:dbce:: with SMTP id
 g197mr60076900ybf.152.1626070538942; 
 Sun, 11 Jul 2021 23:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160615.330768-1-anup.patel@wdc.com>
 <20210612160615.330768-4-anup.patel@wdc.com>
 <CAEUhbmV1L7sL+9=3=onkXZoR0FYpV93gKCVxFJ5O5-Jw36PQgA@mail.gmail.com>
 <CAAhSdy2q7S08eF8NfqvEeFORkrGDaZsDJftCTaq7c9zi7WU2SQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2q7S08eF8NfqvEeFORkrGDaZsDJftCTaq7c9zi7WU2SQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Jul 2021 14:15:28 +0800
Message-ID: <CAEUhbmW9XEk0rZivzQTMhFwL4Egjh0jR9HxEnwJMSOyBntiQig@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Mon, 12 Jul 2021 06:15:44 -0000

On Mon, Jul 12, 2021 at 1:39 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jun 14, 2021 at 5:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sun, Jun 13, 2021 at 12:14 AM Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > We extend virt machine to emulate ACLINT devices only when "aclint=on"
> > > parameter is passed along with machine name in QEMU command-line.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > ---
> > >  hw/riscv/virt.c         | 110 +++++++++++++++++++++++++++++++++++++++-
> > >  include/hw/riscv/virt.h |   2 +
> > >  2 files changed, 111 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > index 977d699753..a35f66af13 100644
> > > --- a/hw/riscv/virt.c
> > > +++ b/hw/riscv/virt.c
> > > @@ -50,6 +50,7 @@ static const MemMapEntry virt_memmap[] = {
> > >      [VIRT_TEST] =        {   0x100000,        0x1000 },
> > >      [VIRT_RTC] =         {   0x101000,        0x1000 },
> > >      [VIRT_CLINT] =       {  0x2000000,       0x10000 },
> > > +    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
> >
> > How about we reuse the same register space to support both CLINT and
> > ACLINT? This saves some register space for future extension.
>
> The intention of placing ACLINT SSWI separate from ACLINT MTIMER and
> MSWI is to minimize PMP region usage.

Okay, so this leaves spaces for 240 ACLINT MTIMER and MSWI devices in
total, if we put ACLINT SSWI at 0x2F00000, and we still have spaces
for 64 ACLINT SSWI devices. Is this enough?

>
> When we have multiple sockets, each socket will have it's own set of
> ACLINT devices so we deliberately keep ACLINT MTIMER and MSWI
> devices of all sockets next to each other so that we need just 1-2 PMP
> regions to cover all M-level ACLINT devices.
>
> In general, RISC-V platform vendors will have to carefully design
> memory layout of M-level devices so that M-mode runtime firmware
> needs fewer PMP regions. The spare PMP regions can be used by
> M-mode runtime firmware to partition the system into domains and
> implement TEE.
>
> >
> > >      [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
> > >      [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
> > >      [VIRT_UART0] =       { 0x10000000,         0x100 },
> > > @@ -279,6 +280,78 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
> > >      g_free(clint_cells);
> > >  }

Regards,
Bin

