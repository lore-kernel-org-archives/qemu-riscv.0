Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJvMh-0005x8-8u
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 06:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJvMf-0005vY-GW; Mon, 23 Jan 2023 06:51:53 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJvMd-00077U-LT; Mon, 23 Jan 2023 06:51:53 -0500
Received: by mail-vs1-xe34.google.com with SMTP id t10so12560312vsr.3;
 Mon, 23 Jan 2023 03:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WXRZjU2/+Ku0v/DLnU6CS6vf7K9zE8FigBzKnXdHAcg=;
 b=grQETtIq1FnrngqPTPy5/gc41dmt1TqL2SCCZzrDvuyVSHF4DdWLWr6aBMJ4vJImz2
 j65xK+IeMlEitVRKVlP2NcQWw8EsjbYFV//J0jV53os+tTYoIQ2x9Qh8TTt4qFrlan9b
 HW+2ybIajIUbk4RhUJEHK/vwzHbMHNCRsIhlkx1bpdAfnkdMtzv9NeMqRSqYA8/IJYYF
 WCt5cF1FQqOu93jmd73/XAKn93lVWKsNcXXTZ8TB1Zgw64mFR2ECuH8OZINnHkY7c79N
 RPuGklN60pIkUe19rh/m83FNPl/PMilnQPz7YiW1A3F570aPa6ZDgtf4+EqtsZTc3D0q
 MucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WXRZjU2/+Ku0v/DLnU6CS6vf7K9zE8FigBzKnXdHAcg=;
 b=S+eit5sksC+T6UCMyGOodFyUJ6f+3Hei2sXV/+QDu43z2q5Kzj83BdbC0w645Uoqxa
 Wb8tuP2vTyDJBCRyqj9a70Gc5nW3cpYcDcoeVHXJByAEaZZ8LC8KApF/xMUutyolHpu3
 Xx6zt40Ps2+BDoDWM8GTt/Kzsq0JmVqEhnPoW3eS6fOG1pb1DunjZu2mDg010itS8ddz
 IKdK5Bp1ncU+R3akvhHaiQn6A2CE4DxYN8d0SMQgTQAyRI0OElx88NT+zl4x9sGpHxXg
 8dNEzvbEcO6lJ+esSbXK2YDQij4g9hT92gghPP/iDOofEFY2GX0Uo2Uy9KnUANWLUxAy
 Hqcw==
X-Gm-Message-State: AFqh2ko4bByraz5zNPqyOILff9XbiCU+Hrn/6Y2QiNOCrWVVIx/FGUIX
 sN2I/9QoTC1+XbJkGfT9buvoo2i1yWMDuoquQfo=
X-Google-Smtp-Source: AMrXdXsGHYmmdRCIvMnxYjfrj9IoekuWTLro7RvT5UtjKe2gbtCRQEk3CQgcNWLX2U9BmIkHbnxhf40DIUFHrj1tZVY=
X-Received: by 2002:a67:ba0c:0:b0:3ce:f2da:96a with SMTP id
 l12-20020a67ba0c000000b003cef2da096amr2769691vsn.64.1674474710082; Mon, 23
 Jan 2023 03:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
 <084f9a13-c74f-fa5e-19a7-e6b437f34cce@ventanamicro.com>
In-Reply-To: <084f9a13-c74f-fa5e-19a7-e6b437f34cce@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 21:51:23 +1000
Message-ID: <CAKmqyKNvuHKJPNn90JY5dvS2jNGj3Fkhov07Tpj2MJH9YPJZ=w@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 11:51:54 -0000

On Mon, Jan 23, 2023 at 8:25 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/23/23 00:57, Alistair Francis wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > If the CSRs and CSR instructions are disabled because the Zicsr
> > extension isn't enabled then we want to make sure we don't run any CSR
> > instructions in the boot ROM.
> >
> > This patches removes the CSR instructions from the reset-vec if the
> > extension isn't enabled. We replace the instruction with a NOP instead.
> >
> > Note that we don't do this for the SiFive U machine, as we are modelling
> > the hardware in that case.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
>
> Shouldn't we also handle the sifive_u/sifive_e boards? Their reset vectors
> aren't being covered by riscv_set_rom_reset_vec() (it's on my TODO, didn't
> send it yet because sifive uses an extra MSEL pin at the start of the vector).

I feel that those boards are modelling hardware, so in this case we
should model what the hardware does. I don't even think that a user
could disable the CSR extension on those boards.

Alistair

>
>
>
> Daniel
>
>
>
> >   hw/riscv/boot.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 2594276223..cb27798a25 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
> >           reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
> >       }
> >
> > +    if (!harts->harts[0].cfg.ext_icsr) {
> > +        /*
> > +         * The Zicsr extension has been disabled, so let's ensure we don't
> > +         * run the CSR instruction. Let's fill the address with a non
> > +         * compressed nop.
> > +         */
> > +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> > +    }
> > +
> >       /* copy in the reset vector in little_endian byte order */
> >       for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
> >           reset_vec[i] = cpu_to_le32(reset_vec[i]);

