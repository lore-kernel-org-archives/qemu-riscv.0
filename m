Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3vK4-0004hC-9I
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 02:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3vK3-0004f8-59; Thu, 15 Jul 2021 02:58:15 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:33413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3vK1-00047F-Od; Thu, 15 Jul 2021 02:58:14 -0400
Received: by mail-il1-x131.google.com with SMTP id z1so4131794ils.0;
 Wed, 14 Jul 2021 23:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3eoFtijaYrWwKtf7NTtMCkMOQW9Z50/BQzxQut73gyU=;
 b=HlhLOI5SbpuDtpHXt3Mk5KIUN9e2t6j4bIVqe666s8o0fQ6p1fSo82rlWAX1Dq3osG
 CAhUQUQwwR1YBOwkXp9JYYAUjXo+QwiXGlelwspQ9m6wHvAlZA7js9nXgqVzxqm4lXno
 vbKndFq+7e9QiIZP2WIDX49yQDrpSfvfeGXlCpgbA2DRD9VboPFB6Hkg8FQaSXSFCaJU
 CPuKpNcEfC9bPeR30ye4KlPk0JyxNrrDhTKDrzjgDdiDR0nXp1WX/nvHm55zOygnpHF5
 g0o/NteUz5W+6wE3ekhu6lUhSVfvmr+awq7WZQo6DR13AQuAWeQeDBdWE2D6h2/lF+dZ
 YeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3eoFtijaYrWwKtf7NTtMCkMOQW9Z50/BQzxQut73gyU=;
 b=PP5O+viCwehsmwyGwu+GCTMNjFCKM6ZOeORDhQz3yFCAuVnncT+zXcn3zZylE9Bgjh
 yQFnQgptwZF/GHK/kwOSVZKYlEShbN4NWYrFNKoYtaKwe5QjjWlPTr9IgfubGZ2yLBAc
 WQ5ESo4ZPfmGCdREnEZ/KS6+4uhR2086ooqj3A3JjM2ZOUWs27l9MYxmgaRqmBn7Lz15
 wV++A0ZT0WBtRkkXXJ8ZOWPy/SvNmK4N8alUhhk9zYIGB6FQKzVkZvBwHJMXeFy74eIC
 mszzzTvZlCImy2kKwxR3HS3m9456SOKEtYCwHvBqRD+QgUWRqMB9vr9kfJm6CszKZRoM
 PY5w==
X-Gm-Message-State: AOAM5314iueOLU3mwRKfZGd8MQbeZ+BYee6jLiEDIlXyVo4Sc8ZmgsVp
 Ue5a30bZ8KCLEF9yRZin69EPchPtcNcUsQHBVq0=
X-Google-Smtp-Source: ABdhPJwjI7Q6Xf8qCtrSOTRdg7dzpkM+snv6Tv+36v48vzt76O+pp5Alq4a9JaybjWTLUaXhmYIoLbvt+kXy1XzziNs=
X-Received: by 2002:a92:8707:: with SMTP id m7mr1672686ild.177.1626332292321; 
 Wed, 14 Jul 2021 23:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <da5acadd07eabd5a6e9fc8870fecb435173b8f47.1626247332.git.alistair.francis@wdc.com>
 <CAFEAcA_naB0ysANAZYhEEVG4XgN0He4zj7UTwUrKHY4SxJ76UA@mail.gmail.com>
In-Reply-To: <CAFEAcA_naB0ysANAZYhEEVG4XgN0He4zj7UTwUrKHY4SxJ76UA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 16:57:46 +1000
Message-ID: <CAKmqyKMaM9kjJ9mxta-u0DR057oFCu4_sV2MOy8K=NNmJdtKsQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv/boot: Check the error of fdt_pack()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 15 Jul 2021 06:58:15 -0000

On Wed, Jul 14, 2021 at 6:46 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 14 Jul 2021 at 08:22, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > Coverity reports that we don't check the error result of fdt_pack(), so
> > let's save the result and assert that it is 0.
> >
> > Fixes: Coverity CID 1458136
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/boot.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 0d38bb7426..25406a3f67 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -182,7 +182,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> >  {
> >      uint32_t temp, fdt_addr;
> >      hwaddr dram_end = dram_base + mem_size;
> > -    int fdtsize = fdt_totalsize(fdt);
> > +    int ret, fdtsize = fdt_totalsize(fdt);
> >
> >      if (fdtsize <= 0) {
> >          error_report("invalid device-tree");
> > @@ -198,7 +198,8 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> >      temp = MIN(dram_end, 3072 * MiB);
> >      fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> >
> > -    fdt_pack(fdt);
> > +    ret = fdt_pack(fdt);
> > +    g_assert(ret == 0);
> >      /* copy in the device tree */
> >      qemu_fdt_dumpdtb(fdt, fdtsize);
>
> Are we in the same situation as spapr.c where we believe the call
> will only fail if the fdt was corrupt somehow? If so, it would be
> nice to also have the comment from spapr.c:
>         /* Should only fail if we've built a corrupted tree */

Yes, we are the same. I added the comment.

Alistair

>
> thanks
> -- PMM

