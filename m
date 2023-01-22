Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJjEM-0006Lc-Ad
	for mharc-qemu-riscv@gnu.org; Sun, 22 Jan 2023 17:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJjEI-0006L2-UK; Sun, 22 Jan 2023 17:54:26 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJjEG-0006eS-I0; Sun, 22 Jan 2023 17:54:25 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id l125so11189891vsc.2;
 Sun, 22 Jan 2023 14:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4I40+AVbej6AAPnbz8AePv5s3N9ys0uSGtrAZHOJVn8=;
 b=fRm07AMhS+gbkHHOpiRPX+lL70vhaVxTI2dpRNeiUDe5Pah0157z3yY5Te/WzPQ9xc
 dw2u076lW4fpYhZ6uELmbbhBP0CRoz8YXHq0q3NCASw0aYOueRqSFDdIeRyB30+GE5lL
 TsTZyzR+0F8zM/D4doT3EUXhM3YOohGfZij6heND+5Xlg3nG+WQ8E/CU/ArZ7nQ2w76I
 DTMcPnp0E4IICJJTpiDDx/me9aLtp81lGbhxSr0kU0HbjpXC4acl2VLvxeC9nSvLewif
 T5zJeh/TmQ9QGFjNQ0uvVu994TjaT1pzjpi74/n77hzxS8HhwtJiV5xlZ746pvSM9Qil
 rHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4I40+AVbej6AAPnbz8AePv5s3N9ys0uSGtrAZHOJVn8=;
 b=XHS/KVfvbd/55vemQL43vqQwezok7YvRmhdtlr2orzfhXqiMsBS9kDXjtb8lLrkYB4
 fdb4mAEByv9vKBJthWxLuXsku3FEOuTBLOmXiSb+FHemHpY1SEjFw35j/GyrhBM6Pn3F
 4lDeK8KGIaFw3luHwrA798lZWkLTCp4yOp49qy7+00pLeTcwIozOrLla172ducOivUb/
 yBL5CrdHyE4z+Y/aQahjM4lp4VZIB9TpA9wNbnrzHC6JpYlOE6We7TFuBohsDRbu6OXE
 cyDI83Gx8aMqqqNGKJrd3SF+UXPdyCtOWU1WTrJaWUHSatNJHr8QBuMfZTfMbFbiVXYU
 CETA==
X-Gm-Message-State: AFqh2kqQHlUtZy42f04n/RyM+bDTgX2cNKbZFIYBSyKuseuQT99LuW2T
 jo2jh992qNh2hyQia3/DwbvNFnwGPJQ0x2UWcso=
X-Google-Smtp-Source: AMrXdXvMP6iQg7byFJnOocAZ9jS1FnPaN/15bOui+N4iv58hyZ6iI1bD0n9y4bskBPHsVaa+RVHyoPeZcHGwA6tJLpk=
X-Received: by 2002:a05:6102:f98:b0:3d3:c7d9:7b62 with SMTP id
 e24-20020a0561020f9800b003d3c7d97b62mr2701722vsv.72.1674428062864; Sun, 22
 Jan 2023 14:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com> <Y8ndFjv9prrRXLnL@spud>
 <385b977b-d15f-6c54-1d05-ab68e122dfe8@ventanamicro.com>
In-Reply-To: <385b977b-d15f-6c54-1d05-ab68e122dfe8@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 08:53:56 +1000
Message-ID: <CAKmqyKN=XquxtTDGCstEu7jEvoOn=1HpHc=ax8+zs3XxZO2G3w@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Sun, 22 Jan 2023 22:54:27 -0000

On Sun, Jan 22, 2023 at 5:16 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Conor,
>
> Thanks for the Icicle-kit walk-through! I'll not claim that I fully understood it,
> but I understood enough to handle the situation ATM.
>
> Without this change, this is where the FDT is being installed in the board when
> I start it with 8Gb of RAM (retrieved via 'info roms'):
>
> addr=00000000bfe00000 size=0x00a720 mem=ram name="fdt"
>
> Which surprised me at first because this is almost at the end of the LO area which has
> 1Gb and I figured it would be in the middle of another RAM area. I took another read
> at what we're doing in riscv_load_fdt():
>
> -----------
> temp = (dram_base < 3072 * MiB) ?  MIN(dram_end, 3072 * MiB) : dram_end;
> fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> -----------
>
> This code can be read as "if the starting address of the RAM is lower than 3Gb, put
> the FDT no further than 3Gb (0xc0000000). Otherwise, put it at the end of dram",
> where "dram_base" is the starting address of the RAM block that the function
> receives.
>
> For icicle-kit, this is being passed as  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> 0x80000000, which is 2Gb.
>
> So, regardless of how much RAM we have (dram_end), the FDT will always be capped at
> 3Gb. At this moment, this fits exactly at the end of the LO area for the Icicle Kit.
> Which is funny because this 3Gb restriction was added by commit 1a475d39ef54 to fix
> 32 bit guest boot and it happened to also work for the Microchip SoC.
>
> So yeah, I thought that I was fixing a bug and in the end I caused one. This patch
> needs to go.
>
>
> Alistair, I believe I should re-send v2, this time explaining why the existing function
> will not break the Microchip board because we'll never put the FDT out of the LO area
> of the board. Does this work for you?

I think that's fine. My only worry is that we are losing some
flexibility that some future board might want.

Alistair

