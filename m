Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pBETG-00049K-SQ
	for mharc-qemu-riscv@gnu.org; Fri, 30 Dec 2022 07:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pBET6-000454-Qr; Fri, 30 Dec 2022 07:26:38 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pBESz-0008F3-2q; Fri, 30 Dec 2022 07:26:31 -0500
Received: by mail-ed1-x529.google.com with SMTP id d14so30264206edj.11;
 Fri, 30 Dec 2022 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmdtYCtAP6i6jamsZTFaYC9wwLPKnCmxk9o1H6G0fWc=;
 b=eBb5RgvGO2LAFUqGNKizKUlwqypRHtipknsfI/fAr82X7mr4j9LyUtgFwFAvslhzY5
 wcQN/ft62oK37bgw8GS3hmeksVaHxXh5GNQ1UD0kLv3104bw2NF9CReKJfKigPz/DUsh
 4zfcMPejRzoGezbSm5NkPP9bUpVeiFOSNN4TDPxVLUrbwRJ7MgqtR4siofKr5ZqLyLnG
 h40JUGvaFM/egnwxwW8aNBRJjCgLfngcymkhH0DnX+GZM/au2RBVzR8xqr+nJbwrzl+T
 0rC0DaASsKJyD0Q9H2Bfh3HABasVjxZrYOPyhJGTVqXf8wqImjKNoU9B0XaHU65Ci/55
 Sz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmdtYCtAP6i6jamsZTFaYC9wwLPKnCmxk9o1H6G0fWc=;
 b=q3y+E2b5cjafaDUQ7aq0T5Lm5ZdM440S4WiWdY0/DC+Gx2xWC0qQwn1BXUJ3Y705GS
 Xd3jHIkd/uyt/A64j48B8qEhabfjDgJYwx8kZpJW+ZPR/7ivTSnRvRGY8kRDQtKgHvRI
 ReCL3VS4JK7vALDxWyraPVimgdIfycSj++ye+GTayXph4SSnzdB0kCStXG2n6Pc0QZrb
 aTqwgmmcxEg0Hm3pG18Ek4pU+nWYy0CPEazupcQrdMCT0h93Ay9YiWItrhO3YNVnOaQT
 7lUmmuz0c21+BIsfy8IGJC8V4DHx8xlH22yLn4RbQCotUPJCnktdKhXWNJLoGaCW4UFR
 rCCA==
X-Gm-Message-State: AFqh2krOP7DfAMBuzioMgPZIz1sMtvjaiYbpOUQ72v55hfbSXZdk2R/p
 hmB18sQdo/PrdOTUVvAhofuM6C5nLFNBjGFdMXs=
X-Google-Smtp-Source: AMrXdXsyUYWmTAF27lO4ZCUUVGYDAsnHl99/u1Gjm7CqMehfu0g1zTMC+7LebLuJowubiu722ieW+9SLHxnI5Z41qi0=
X-Received: by 2002:a05:6402:1843:b0:46b:1d60:f60a with SMTP id
 v3-20020a056402184300b0046b1d60f60amr3589361edy.193.1672403185750; Fri, 30
 Dec 2022 04:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-11-dbarboza@ventanamicro.com>
 <CAEUhbmVa8g-s0wD+EE6iZNXBfjD+M6edgq9vk7GdG2sx12J6Gg@mail.gmail.com>
 <797aa177-bb3a-8333-7a2b-79ee799e2633@ventanamicro.com>
In-Reply-To: <797aa177-bb3a-8333-7a2b-79ee799e2633@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Dec 2022 20:26:14 +0800
Message-ID: <CAEUhbmXSk6j5sCoY8U6A3GLH2Gq7qHsNCk-bBfh9EqWE4jE_bQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] hw/riscv/boot.c: introduce
 riscv_load_kernel_and_initrd()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 30 Dec 2022 12:26:40 -0000

On Fri, Dec 30, 2022 at 8:04 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 12/30/22 06:05, Bin Meng wrote:
> > On Fri, Dec 30, 2022 at 2:47 AM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >> The microchip_icicle_kit, sifive_u, spike and virt boards are now doin=
g
> >> the same steps when '-kernel' is used:
> >>
> >> - execute load_kernel()
> >> - load init_rd()
> >> - write kernel_cmdline in the fdt
> >>
> >> Let's fold everything inside riscv_load_kernel() to avoid code
> >> repetition. Every other board that uses riscv_load_kernel() will have
> >> this same behavior, including boards that doesn't have a valid FDT, so
> >> we need to take care to not do FDT operations without checking it firs=
t.
> >>
> >> Since we're now doing way more than just loading the kernel, rename
> >> riscv_load_kernel() to riscv_load_kernel_and_initrd().
> >>
> >> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   hw/riscv/boot.c            | 27 +++++++++++++++++++++------
> >>   hw/riscv/microchip_pfsoc.c | 12 ++----------
> >>   hw/riscv/opentitan.c       |  2 +-
> >>   hw/riscv/sifive_e.c        |  3 ++-
> >>   hw/riscv/sifive_u.c        | 12 ++----------
> >>   hw/riscv/spike.c           | 14 +++-----------
> >>   hw/riscv/virt.c            | 12 ++----------
> >>   include/hw/riscv/boot.h    |  6 +++---
> >>   8 files changed, 36 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> >> index 5606ea6f43..d18262c302 100644
> >> --- a/hw/riscv/boot.c
> >> +++ b/hw/riscv/boot.c
> >> @@ -171,12 +171,13 @@ target_ulong riscv_load_firmware(const char *fir=
mware_filename,
> >>       exit(1);
> >>   }
> >>
> >> -target_ulong riscv_load_kernel(MachineState *machine,
> >> -                               target_ulong kernel_start_addr,
> >> -                               symbol_fn_t sym_cb)
> >> +target_ulong riscv_load_kernel_and_initrd(MachineState *machine,
> >> +                                          target_ulong kernel_start_a=
ddr,
> >> +                                          symbol_fn_t sym_cb)
> > How about we keep the riscv_load_kernel() API, in case there is a need
> > for machines that just want to load kernel only?
> >
> > Then introduce a new API riscv_load_kernel_and_initrd() to do both
> > kernel and initrd loading?
>
> What about an extra flag to riscv_load_kernel(), e.g:
>
> riscv_load_kernel(MachineState *machine,  target_ulong kernel_start_addr,
>                                  bool load_initrd, symbol_fn_t sym_cb)
>
>
> And then machines that don't want to load initrd can opt out by using
> load_initrd =3D false. The name of the flag would also make our intention=
s with
> the API self explanatory (i.e. load_initrd makes load_kernel() loads init=
rd
> as well).
>

That sounds like a good idea!

Regards,
Bin

