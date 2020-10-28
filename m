Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXmzJ-0002mX-9a
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 11:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXmzG-0002jj-Uz; Wed, 28 Oct 2020 11:03:42 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXmzF-0004LQ-6d; Wed, 28 Oct 2020 11:03:42 -0400
Received: by mail-io1-xd44.google.com with SMTP id h21so5646937iob.10;
 Wed, 28 Oct 2020 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/2iRcRlGqky2TLFd0C5KAzKIRtplTwX92ZY/erxF9RI=;
 b=GoqbDGYBaBiBKYYe6GXyJbzwE3XnLeogvKkHP+oJEUU0HcwUHbUBYwkaX/22J9rIdl
 o1BVBCuKPkmxeS/uSUidcdb0CS2Xmc5L8cm4FFrSn24oPD//erZDw5op31GkrhYM/35N
 pSP8qflSn6Sw9eq5ILQ76WBIVm+f3d3xC0q2juZz1LRxKqpP434uHufxdXMMuyQHZCwc
 CRj2PsiNG+MSsKeZigdAJF0ix6MTK/H2qn6qnBMc0IUpYp39MJJ/Y0lSX94MOgX/Gjed
 9ESZJI+XG8x445G4XPPOWZ9qDv0w+9UuWj57kuRRKzKCjquFw/bHLT0jptIi+ihM2ap5
 LW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/2iRcRlGqky2TLFd0C5KAzKIRtplTwX92ZY/erxF9RI=;
 b=nxlQkcDjSoyQEmTn/CcppblCP/RzkU4Ifvd5btwHcJ8/NlJxjX0TvQGyvuafWtyIIl
 VqoPEbJZsnRzuUXyO0BbOTyIGR8Wgcqazpcnx4M/Fb51LYLQWtgLC51J3/NZAMe/V4MI
 W3l3YWxLu0ZFio4yopQjOI8iVgEur1uB2GZTb+6v1NGo0rq3Z0j6is/OOwmZCZj/e9XR
 ygG+EdKdKKEKTdPxnJeo+Of/pXU4puG+EEhxkIZZuKy1q+Oz2jo+FdKHnEJBu5aO4EBs
 o6ETGNgGRo/QlSzAsMiw6/Mq1FRReBsaQDaw+lKQQHfUBc/ePIDZ8SIfiatpB9jiYYzI
 2qCA==
X-Gm-Message-State: AOAM530W5EvXUxjXhpiUR3urAE5Fxwse8C/1opUU5vNFYQO7u4VSQ90H
 mvPs3Kr5smjvQ7ZllxHRTrFixQHvWK3qySbhbZM=
X-Google-Smtp-Source: ABdhPJz42qV2JxKhO1Zhy7CanV3pS6cFURslhmGLwjzVJp29+ol1YjgcKigVjF38iiK7wWIwH3BftLGqv27Kswybrxk=
X-Received: by 2002:a02:84c3:: with SMTP id f61mr7334749jai.8.1603897419776;
 Wed, 28 Oct 2020 08:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <1603863010-15807-1-git-send-email-bmeng.cn@gmail.com>
 <1603863010-15807-9-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1603863010-15807-9-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Oct 2020 07:51:48 -0700
Message-ID: <CAKmqyKOcKsvbKcniZipe8qq4E=HAc3UAFYxkQRwdcfJyT-h2hg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] hw/riscv: microchip_pfsoc: Map the reserved
 memory at address 0
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Ivan Griffin <ivan.griffin@emdalo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 28 Oct 2020 15:03:43 -0000

On Tue, Oct 27, 2020 at 10:36 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Somehow HSS needs to access address 0 [1] for the DDR calibration data
> which is in the chipset's reserved memory. Let's map it.
>
> [1] See the config_copy() calls in various places in ddr_setup() in
>     the HSS source codes.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - change to map the reserved memory at address 0 instead of debug memory
>
>  hw/riscv/microchip_pfsoc.c         | 11 ++++++++++-
>  include/hw/riscv/microchip_pfsoc.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index bc908e0..44a8473 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -90,7 +90,8 @@ static const struct MemmapEntry {
>      hwaddr base;
>      hwaddr size;
>  } microchip_pfsoc_memmap[] = {
> -    [MICROCHIP_PFSOC_DEBUG] =           {        0x0,     0x1000 },
> +    [MICROCHIP_PFSOC_RSVD0] =           {        0x0,      0x100 },
> +    [MICROCHIP_PFSOC_DEBUG] =           {      0x100,      0xf00 },
>      [MICROCHIP_PFSOC_E51_DTIM] =        {  0x1000000,     0x2000 },
>      [MICROCHIP_PFSOC_BUSERR_UNIT0] =    {  0x1700000,     0x1000 },
>      [MICROCHIP_PFSOC_BUSERR_UNIT1] =    {  0x1701000,     0x1000 },
> @@ -176,6 +177,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
>      const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
>      MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *rsvd0_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *envm_data = g_new(MemoryRegion, 1);
> @@ -195,6 +197,13 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
>      qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
>
> +    /* Reserved Memory at address 0 */
> +    memory_region_init_ram(rsvd0_mem, NULL, "microchip.pfsoc.rsvd0_mem",
> +                           memmap[MICROCHIP_PFSOC_RSVD0].size, &error_fatal);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_RSVD0].base,
> +                                rsvd0_mem);
> +
>      /* E51 DTIM */
>      memory_region_init_ram(e51_dtim_mem, NULL, "microchip.pfsoc.e51_dtim_mem",
>                             memmap[MICROCHIP_PFSOC_E51_DTIM].size, &error_fatal);
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index 245c82d..f34a6b3 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -74,6 +74,7 @@ typedef struct MicrochipIcicleKitState {
>                   TYPE_MICROCHIP_ICICLE_KIT_MACHINE)
>
>  enum {
> +    MICROCHIP_PFSOC_RSVD0,
>      MICROCHIP_PFSOC_DEBUG,
>      MICROCHIP_PFSOC_E51_DTIM,
>      MICROCHIP_PFSOC_BUSERR_UNIT0,
> --
> 2.7.4
>
>

