Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9gTl-00072h-RQ
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gTj-00071D-6a; Mon, 17 Jan 2022 23:52:19 -0500
Received: from [2607:f8b0:4864:20::134] (port=35508
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gTh-0007j9-Hv; Mon, 17 Jan 2022 23:52:18 -0500
Received: by mail-il1-x134.google.com with SMTP id b1so16591414ilj.2;
 Mon, 17 Jan 2022 20:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fMiT8Aq+6tj/ohNmIsWxJuK9Ib7GPcXccgEE4md1XF4=;
 b=BcSB0I8PswThKFgOVNs4M1E+XNeECXVkOEKEzIQ2SswKtpf4S/Fsa8y76Wl7d7m+9i
 QrSK3ST3W9N0EhM/ntQbTJxsxs9akiMeF0pt5IXJ5Hhj1vApKRCpxa2l75CFqULVSrO8
 rTINugdbBGdj1CBXGDZNfkXJdTdQViuF95+FyEgm4tsIRVuYy5iGGSbJLV65n8JER8sV
 s4glJ5sKPB+XAmVSdNjtYxvWPUy9Ol9YS+nfQWLbdegHxK4nicXISssP02iJSvR2XliO
 qDRFSkGQz9CpFR4fuLNYTHpLy3SeNFTKCLRKo+uP5uDTShv+AEOkdUI2TNzKLL8PIwmh
 Sofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fMiT8Aq+6tj/ohNmIsWxJuK9Ib7GPcXccgEE4md1XF4=;
 b=LlG4AljoyIEVNZxZAVYtzDLO2SePrejhUp4Q0wJaKaq86Lg0ww69dEFqLCrzDJHJwr
 jWULjVFpNxO0noCb3QRd5F58tQJkUk820apFUaLW8DL1MZiU/mRf5cbSKaDta/ViVPk5
 8vQ6h1qk9fLGAaAbZZ7E3/sMSIlaIQXBr9J77P3jqJ4e6fTl1BKqVu1HsTiVPDzuT+j+
 mcJ1oVXBbbdqqDJs2Qf9l9FQl99wasBCzr8RoW5z1tQc/8s7ZczylEIBxkS9i/1bkq9A
 PR0R5j2gZ+ca0NoJ9W9vXb/hcyyObjnG0Hw8i9dwEoIXMCNhl50cfGBqIC7YZM01NooW
 aATw==
X-Gm-Message-State: AOAM5317bDgoVLmdhUVCepB4buGmRQxskOaSomYkeVB9U4mLaSF3hsBv
 RsU11tLU/I8Y9UUSVcx8VSjGhq4yvgcuoJgjffdXCbVHGU7azKoPHGs=
X-Google-Smtp-Source: ABdhPJwpGGL9ixNlLeDMNn2A7psd3lLesCCzgyrBqFgOz4LuH+Sw0qjmPyLU6q+bbK1cHox3mw+/Z17iPbrriOsZ+6Y=
X-Received: by 2002:a92:3012:: with SMTP id x18mr11983404ile.221.1642481534847; 
 Mon, 17 Jan 2022 20:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
In-Reply-To: <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:51:48 +1000
Message-ID: <CAKmqyKNajL8kJL4HExN8CDCYwrVcUx4dcnn77wY5zCZu9M6SGg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Anup Patel <anup@brainfault.org>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 04:52:20 -0000

On Tue, Jan 18, 2022 at 1:31 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >
> > From: Guo Ren <ren_guo@c-sky.com>
> >
> > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > need to ignore them. They cannot be a part of ppn.
> >
> > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architectur=
e
> >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> >
> > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-d=
iff.pdf
> >
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu_bits.h   | 7 +++++++
> >  target/riscv/cpu_helper.c | 2 +-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 5a6d49aa64..282cd8eecd 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -490,6 +490,13 @@ typedef enum {
> >  /* Page table PPN shift amount */
> >  #define PTE_PPN_SHIFT       10
> >
> > +/* Page table PPN mask */
> > +#if defined(TARGET_RISCV32)
> > +#define PTE_PPN_MASK        0xffffffffUL
> > +#elif defined(TARGET_RISCV64)
> > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > +#endif
> > +
>
> Going forward we should avoid using target specific "#if"
> so that we can use the same qemu-system-riscv64 for both
> RV32 and RV64.
>
> >  /* Leaf page shift amount */
> >  #define PGSHIFT             12
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 434a83e66a..26608ddf1c 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -619,7 +619,7 @@ restart:
> >              return TRANSLATE_FAIL;
> >          }
> >
> > -        hwaddr ppn =3D pte >> PTE_PPN_SHIFT;
> > +        hwaddr ppn =3D (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>
> Rather than using "#if", please use "xlen" comparison to extract
> PPN correctly from PTE.

This will need to be dynamic based on get_xl()

It does look like we should check the existence of the extensions though:

"Bit 63 is reserved for use by the Svnapot extension in Chapter 5. If
Svnapot is not implemented, bit 63 remains reserved and must be zeroed
by software for forward compatibility, or else a page-fault exception
is raised. Bits 62=E2=80=9361 are reserved for use by the Svpbmt extension =
in
Chapter 6. If Svpbmt is not implemented, bits 62=E2=80=9361 remain reserved
and must be zeroed by software for forward compatibility, or else a
page-fault exception is raised."

Alistair

>
> Regards,
> Anup
>
> >
> >          if (!(pte & PTE_V)) {
> >              /* Invalid PTE */
> > --
> > 2.17.1
> >
>

