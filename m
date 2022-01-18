Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9kDF-0000jJ-D2
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 03:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9kDA-0000hp-Hs
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 03:51:29 -0500
Received: from [2607:f8b0:4864:20::634] (port=39576
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9kD8-00013X-DH
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 03:51:27 -0500
Received: by mail-pl1-x634.google.com with SMTP id c6so15295997plh.6
 for <qemu-riscv@nongnu.org>; Tue, 18 Jan 2022 00:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E15Gt2XLm8DjBYjlAIAwUgpja/zxHmz+mgVIKW7NL+g=;
 b=kmvYnz1M2w7DN9mp9jwir2BWaQp7C+ia2mQV+peqk8dWmmiTFf8g8XIw/p2nim3kep
 ZigZt1ZcuNo+2gowt21xOMJ6hzsi1PbccqDdGgQ2Sd+ey4sR4lhf6pYtGRi58OAmjJK0
 jAw5jY2DFnMbqrh+/v36SNtkZyI//eaITSiUDXivKBi0bnKX0+42qmOHhN/fRl8CGDdd
 EVFE258RHjbrDIx95vC0oHyam/5bvLkzoGpDVWRt1Zp13ZixK6sMuILGkuVDN8B97Pn5
 zYY12KHpGdAD6+8c8nhyUCsY0J2wnbNdL62/faxOLsduco8ZIqCIaVzwu64+K4cb+PbB
 VyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E15Gt2XLm8DjBYjlAIAwUgpja/zxHmz+mgVIKW7NL+g=;
 b=3+4aItstAKAmpa0LyjD8XZtySMmKfnB+B5R7VhFPGMO6M5iETDSL1NBKlNRo4iTIPY
 oVri/nM1kLmd2YMXJ9muEsisPlWtC6QvgaeM/TOOWb4vo4YRZGM9QPpWza4EHSOhjo6f
 qIgDh7pzLCc/LsWWgEyPXwLS+MLdwwOatxnMmWnLRiYCc/m5OVfhFdHz04rOwAivWwz8
 x7QEkUKE1quCUKh9IMUAJlCEl9RXbQC1M2g757S5x4+XH7ucqP+7OhYVkgmS/qLOQIUb
 jXl2SFW1B5lYBly538RQdZN3Xt98TZuwF7NT1ad+Cb4sxS1iIboVBIX+h8dSK8O1ErSX
 Nj0g==
X-Gm-Message-State: AOAM533zQK3XR2NTwMawT2ya4zlXN8kfGF3WWVPWQP4xIvEjCm6QZaJn
 eees2tReF0YJoGmel48ycCeQHMOzrlifbqoXsG7xcw==
X-Google-Smtp-Source: ABdhPJzVaUJKigUcUtMAsghv4XtgwjDPHHOS+hJ3G88Zqk+EdwZ3/RJn4ag4Uj7YrT324o8GXZ3RGHqf1IFpcHKHtWs=
X-Received: by 2002:a17:902:bd94:b0:149:c926:7c26 with SMTP id
 q20-20020a170902bd9400b00149c9267c26mr26680849pls.64.1642495878056; Tue, 18
 Jan 2022 00:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
In-Reply-To: <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Jan 2022 14:21:06 +0530
Message-ID: <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 08:51:30 -0000

On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> > >
> > > From: Guo Ren <ren_guo@c-sky.com>
> > >
> > > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > > need to ignore them. They cannot be a part of ppn.
> > >
> > > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> > >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> > >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> > >
> > > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> > >
> > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu_bits.h   | 7 +++++++
> > >  target/riscv/cpu_helper.c | 2 +-
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index 5a6d49aa64..282cd8eecd 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -490,6 +490,13 @@ typedef enum {
> > >  /* Page table PPN shift amount */
> > >  #define PTE_PPN_SHIFT       10
> > >
> > > +/* Page table PPN mask */
> > > +#if defined(TARGET_RISCV32)
> > > +#define PTE_PPN_MASK        0xffffffffUL
> > > +#elif defined(TARGET_RISCV64)
> > > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > > +#endif
> > > +
> >
> > Going forward we should avoid using target specific "#if"
> > so that we can use the same qemu-system-riscv64 for both
> > RV32 and RV64.
> >
> > >  /* Leaf page shift amount */
> > >  #define PGSHIFT             12
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 434a83e66a..26608ddf1c 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -619,7 +619,7 @@ restart:
> > >              return TRANSLATE_FAIL;
> > >          }
> > >
> > > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> >
> > Rather than using "#if", please use "xlen" comparison to extract
> > PPN correctly from PTE.
> Do you mean?
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9fffaccffb..071b7ea4cf 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,7 +619,11 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
> +       } else {
> +               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
> +       }

Yes, something like this but use a define for 0x3fffffffffffffULL

Regards,
Anup

>
>          RISCVCPU *cpu = env_archcpu(env);
>          if (!(pte & PTE_V)) {
>
> >
> > Regards,
> > Anup
> >
> > >
> > >          if (!(pte & PTE_V)) {
> > >              /* Invalid PTE */
> > > --
> > > 2.17.1
> > >
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
>

