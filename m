Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxVlF-0006Os-IS
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 10:00:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxVl7-0006Kf-5L
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 09:59:58 -0500
Received: from [2a00:1450:4864:20::431] (port=45616
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxVl4-00056W-6h
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 09:59:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id o13so38638745wrs.12
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 06:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idg0JHwnigHF3Mw2XPMfh2O4vI0/PwM7HnDqsuQBCgw=;
 b=AXbt57fMudQI9ihz1rVQvIUpEUOOIYTYrDWDXicUWG1Qkc3yqWclXXH5CkH8p/+4iO
 2HKYNzvUHxFaCPoNgmdMN7EvZo3ekbrZ5GVBCfqEFzshKA4TCN64Lpht79E/NtlfsTB8
 E8aH2yRGnWtciw6SFLC/Dn2JhcpwU/aPKebmul8ar1NzFtHpX1Y5aHUs8JaFIulyW9iF
 HYtv8Tx57NA0OOByTNH6XqxgCupgD7dORltPWeO3wchYa/Td1DiIUCwvaRwXARVmHPD7
 tmZGOoNGjVozuLx/khqtA51lEAKTFQF5hCbrYLdMDLKphNMqfZU7HF65r7P2ETikeY6Z
 qhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idg0JHwnigHF3Mw2XPMfh2O4vI0/PwM7HnDqsuQBCgw=;
 b=mZwBryMIX7ozHvhmq6II/pruehcheMyYIjMIYTcrIRcV9tPBs7fTrZBoiqmliGhRi4
 8h2kXECbY/fZWy8iXbqE0yRHnGclCR46Q8uyuJvp+za042N5FBxGA8xkVlKgPpahSaHR
 E9GNHqo0QFcRpcCa7l9Bo6ZARDbcupbZaD2SMcHSL8+24kKt7mkG4mirPJ7JbZya4/dl
 3Cgzq7BA2zzNDtiShBbGgVD1zwsFVN+IY39cWtlYr27kFBiMqWDjB76dhvV8k0A6Qjza
 sTPBtQQ/98zKqco5twvysrpvlBqP9YN1KocDsIhSYBfzKQ8tWigwsnxtAIc1kpkj0CGm
 O54Q==
X-Gm-Message-State: AOAM5303RAmhsUitJt2PPSQABzsA2WvzZWb0LdNCiVsphWc+3CWhbgwn
 LM+ny+3/3uxpFEf8ahMprUh6nRTyQPk2WdgJvi6qeg==
X-Google-Smtp-Source: ABdhPJzU/75ndt4hZGJHyeVbP8l6BymiGKHBCToM+Tgw4NCrranEMgv3UMc8Pbxz0R8mwp3+6L1fsG8hugClwGUbsdI=
X-Received: by 2002:adf:efd0:: with SMTP id i16mr3770906wrp.86.1639580389962; 
 Wed, 15 Dec 2021 06:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-17-anup.patel@wdc.com>
 <CABYrWZ95qCu8QiEfpQEy+=1cecLf+ruODAEg-vL8z58aBJffXw@mail.gmail.com>
In-Reply-To: <CABYrWZ95qCu8QiEfpQEy+=1cecLf+ruODAEg-vL8z58aBJffXw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Dec 2021 20:29:38 +0530
Message-ID: <CAAhSdy0KXNAFAxWgoozj73LP7_QO776PC5VEGzeuYzp+0Lk6RQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/23] hw/riscv: virt: Use AIA INTC compatible string
 when available
To: Kip Walker <kip@rivosinc.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <atishp@atishpatra.org>, 
 Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::431;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Dec 2021 14:59:59 -0000

On Wed, Dec 15, 2021 at 6:38 AM Kip Walker <kip@rivosinc.com> wrote:
>
> On Fri, Dec 10, 2021 at 8:35 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We should use the AIA INTC compatible string in the CPU INTC
> > DT nodes when the CPUs support AIA feature. This will allow
> > Linux INTC driver to use AIA local interrupt CSRs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/virt.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 3af074148e..936156554c 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> >          qemu_fdt_add_subnode(mc->fdt, intc_name);
> >          qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
> >              intc_phandles[cpu]);
> > -        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> > -            "riscv,cpu-intc");
> > +        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> > +                          RISCV_FEATURE_AIA)) {
> > +            static const char * const compat[2] = {
> > +                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> > +            };
> > +            qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
> > +                                      (char **)&compat, ARRAY_SIZE(compat));
>
> I think this should be intc_name rather than name.

Ahh, good catch. I will fix this typo in the next revision.

Thanks,
Anup

>
> Kip
>
> > +        } else {
> > +            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> > +                "riscv,cpu-intc");
> > +        }
> >          qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
> >          qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
> >
> > --
> > 2.25.1
> >
> >

