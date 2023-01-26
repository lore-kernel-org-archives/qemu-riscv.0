Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pL12y-0003GK-W5
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 07:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pL12r-0003AF-2n; Thu, 26 Jan 2023 07:07:58 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pL12p-0005k8-7x; Thu, 26 Jan 2023 07:07:56 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kt14so4506722ejc.3;
 Thu, 26 Jan 2023 04:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ozZDDQPu756cdggNVo7hNGEpna7Trfyoz81RZ42y4VY=;
 b=MdsV64vqKhMaf78PyKmquIxNLfxmO0ahIMOIpuuAVVP+X0oTOLjcb+vq8p2hIfPu+D
 wwuyMKpBo6RttpotDOyDKaV66KQcx4hIytw5rZf4z136Y6MoR3NsjZxI8hr/L1acUb33
 T9ueCE5BwjxXKOwvUkqFGvlvpszerL4kh/iKmYknqFu8KmEVcr53DFNkRUxAEjzmBmq4
 RtCsi7hXXk9dHr32y/vv3Q/F4s8GYOxVHRHVqznw16IxCYYE4ejwTjQ+Sso0vyaHEMgN
 1r7RtPy94UdVnopG0xCoZnL0yePd47GFN8WjQszThXPNMj6XHgn7FRnCwTEQ9ettKpdd
 Qvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ozZDDQPu756cdggNVo7hNGEpna7Trfyoz81RZ42y4VY=;
 b=DXd0llux7X9HJ735Gd8XTw0ahY+nUMOVCWEQ3GaRrCGDpbZhg+RePMNA4DmfGT6LUX
 058JnBJ5eKaDKpdn0WoQy14IDIgdETnv6+Xb1BGlID6YHCEFTibuY66P3eeEcX9cMpxU
 tpIQwoh9kaNSG3ByYNBB38onKqyvqUJb+HqmsPcRZ7xgqq6cuiCZgLw8IyWwyYGJiYht
 XhuWYZjovI/hRWaDFOJzB7BXVpgCCvcruvmY0ZSQcjAz/EIUZGhawlFlsuSoKRX7Qdrj
 X93YyJQZXF3OsrsS9lGlhD2A/y2cF3eQn91N87+3CQ/XwUxg2S03etnaG9NB4esz89lU
 CK9A==
X-Gm-Message-State: AO0yUKWAovLfPr9mJrlRkjo1rHoXlg5E4cG+ZgyczjnwrRnU+MJ7pIy/
 Q8Iwumb1f6lpZm7HL3Iu0USVafteJX8yIquFOiEEWqbY
X-Google-Smtp-Source: AK7set/zby+EGgWdFCPSsduz2ZbIj2gP+ARvJKvQEQDMv4OMZkKohoGnXZhm+jA6QWTNyOTH/owbwyNWZ34HxgdoddA=
X-Received: by 2002:a17:906:8514:b0:878:786e:8c39 with SMTP id
 i20-20020a170906851400b00878786e8c39mr138062ejx.105.1674734871894; Thu, 26
 Jan 2023 04:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
 <20230113171805.470252-4-dbarboza@ventanamicro.com>
 <CAEUhbmUKEHX5bQ2=7GfgjPY1YVFs-5MqzkbwEy_SgG43WdeAfg@mail.gmail.com>
 <CAKmqyKOGrdcoVWBzhuUpdDVwHdK6PREsLO1MypMQyggWdcHjJA@mail.gmail.com>
In-Reply-To: <CAKmqyKOGrdcoVWBzhuUpdDVwHdK6PREsLO1MypMQyggWdcHjJA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 26 Jan 2023 20:07:40 +0800
Message-ID: <CAEUhbmUhF_vd1yj0O=Kap__yjh9a4eFzWgsPA2k4a4sHZ9TbLA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Thu, 26 Jan 2023 12:08:03 -0000

Hi Alistair,

On Mon, Jan 16, 2023 at 12:28 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jan 14, 2023 at 11:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sat, Jan 14, 2023 at 1:18 AM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> > >
> > > Recent hw/risc/boot.c changes caused a regression in an use case with
> > > the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> > > stopped working. The reason seems to be that Xvisor is using 64 bit to
> > > encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> > > sign-extending the result with '1's [1].
> >
> > I would say it's not a regression of QEMU but something weird happened
> > to Alistair's 32-bit Xvisor image.
>
> I don't think it's a Xvisor issue.
>
> >
> > I just built a 32-bit Xvisor image from the latest Xvisor head
> > following the instructions provided in its source tree. With the
> > mainline QEMU only BIN file boots, but ELF does not. My 32-bit Xvisor
> > image has an address of 0x10000000. Apparently this address is not
> > correct, and the issue I saw is different from Alistair's. Alistair,
> > could you investigate why your 32-bit Xvisor ELF image has an address
> > of 0xffffffff80000000 set to kernel_load_base?
>
> Looking in load_elf() in include/hw/elf_ops.h at this line:
>
>     if (lowaddr)
>         *lowaddr = (uint64_t)(elf_sword)low;
>
> I can see that `low` is 0x80000000 but lowaddr is set to
> 0xffffffff80000000. So the address is being sign extended with 1s.
>

I don't understand the sign extension here. This seems intentional as
the codes does the signed extension then casted to unsigned 64-bit.

Do you know why?

> This patch seems to be the correct fix.
>

Regards,
Bin

