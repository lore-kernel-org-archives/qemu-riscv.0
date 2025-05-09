Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF56C3ABBC
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 May 2025 16:04:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uDQDO-0006Wc-BC; Fri, 09 May 2025 12:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDQD5-0006CF-6c
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 12:04:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDQCz-0004XY-E8
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 12:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746806659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMOeXTqXFsYkgCRn4QYaUzZ6C7YdcKAYjPWcjG5hKjQ=;
 b=WuUhWrgAuR8jWi3EK0dR6XiE2bt+oMyNzlSfwF74ok3inXPUk8hr+c3ehJ/fM3K0Fn4qsr
 hKmtUmxMNbQenwAoi+pgFQs3U5TJqOjJOc73JKKh0ct/ZDkQGaF5l8AEIYyDS96TbWXp2f
 uzIkyNPpewaeUQf2lh92kdHFtLyj1BY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-yb8IojahPO608iHikWTA1g-1; Fri, 09 May 2025 12:04:17 -0400
X-MC-Unique: yb8IojahPO608iHikWTA1g-1
X-Mimecast-MFC-AGG-ID: yb8IojahPO608iHikWTA1g_1746806656
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a0b7124b5fso1460900f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 09 May 2025 09:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746806656; x=1747411456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9SGTty9vioSZ28fB68+a+8ZO7FqN4j+nQiW9zGlb68=;
 b=HPALGr7skwFVN3Hf/yxgltEMXfgCZ/qQ4VdmRtcOTGY4j66cd8XPPbkrschAcRqH9R
 Ea6fLxsA22JCPrT272ClmaXbOuYrLs7KzQeG516JHBE2B6d+oSAdgpFKvHCTV12fYAMh
 x2ValTH6ZapOLWUUaUwSiZAMQNvs0dZJ6CiBMISk5wY7Q9ewLWTL+OCY79L/JracOgXH
 QqeAjuGPWUEEFrhu2x+y3WjXGbU+Sf45dk10Dp5upI5V1Q3ouzk5iuG67wA5G8QXdnK4
 eYd00lXhmB2AblovusS1mRU9DezJLbFLIREclluMkk7kVnkBxjoSgZi84CkA8L/oght+
 4sFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJBr5KK29i/jFlRnJ18TWRTdvMM3C/kLM92I0dHZ30n92ru9cmTKFQ9kgIwPPfOXP8xf9gd0TTq52x@nongnu.org
X-Gm-Message-State: AOJu0YzwgYILbJ08U6M35UIjN3kk5tIdASNuky5aulwLKuDqqxd5JeTM
 AS3d07TGHPn+NKCBshHuBbfQtW3ZGZTXcppYzNy4GHC+/68MHjX5r5YC7h91hDclQsKbPhx3mTt
 ywfxnrd5kuy5gHQwMFDntefFAvYeu84y4EBLp3VCGnorpEn/SEqoD
X-Gm-Gg: ASbGncu2zJPB5kCOhHslMgTSTjQxTe5FteCevby981gauQjmWYbtyaH6YXiBUWkxV85
 vIZUqxwY9eZd4TL6na3YZ9WUPzRI4wwJDnVmGkWOnp4Os4CgfrFMrY5yoMNZU/+p2GuFcQIDFr6
 YiO+uMy6UvlXOzA5XALz4hJfDPRF0blkeC6VfwH1ypJR/pfDiJuRemYqkLILHOZF8D/8HAQTVIX
 rQY9Wdz31jyExRcxjiiNEOdA6nGS21/JVLbRduON9SyhJ0V+15uC/L6WVy3Xksm/JQkDcg0JadX
 FpVF7qlyCEN3hfv/nI1ZjgUk4ejgZ+1W
X-Received: by 2002:a05:6000:3113:b0:39c:1f0e:95af with SMTP id
 ffacd0b85a97d-3a1f64279d3mr3602011f8f.3.1746806656211; 
 Fri, 09 May 2025 09:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6cQYF6EWJWz+6FcQdM7QsRdpFYn7ZHkZ4Tmns/dMEuuVwt/TrFHlK5zhhQj3FktvxJlzsog==
X-Received: by 2002:a05:6000:3113:b0:39c:1f0e:95af with SMTP id
 ffacd0b85a97d-3a1f64279d3mr3601929f8f.3.1746806655504; 
 Fri, 09 May 2025 09:04:15 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a2d2d3sm3674769f8f.63.2025.05.09.09.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:04:15 -0700 (PDT)
Date: Fri, 9 May 2025 18:04:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 10/27] hw/i386/pc: Remove linuxboot.bin
Message-ID: <20250509180411.10f6e683@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-11-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-11-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rcM-DUcco2zdLvSbUSGeNtRgek7_A_t2YeMLv2WXwjM_1746806656
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.413,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu,  8 May 2025 15:35:33 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> All PC machines now use the linuxboot_dma.bin binary,
> we can remove the non-DMA version (linuxboot.bin).
>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/pc.c                  |   3 +-


linuxboot.bin is referenced in a few more files:

hw/i386/x86-common.c:    option_rom[nb_option_roms].name =3D "linuxboot.bin=
";
hw/nvram/fw_cfg.c:    { "genroms/linuxboot.bin", 60 },

are you sure we should keep it there?

>  pc-bios/meson.build           |   1 -
>  pc-bios/optionrom/Makefile    |   2 +-
>  pc-bios/optionrom/linuxboot.S | 195 ----------------------------------
>  4 files changed, 2 insertions(+), 199 deletions(-)
>  delete mode 100644 pc-bios/optionrom/linuxboot.S
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 524d2fd98e8..4e6fe68e2e0 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -654,8 +654,7 @@ void xen_load_linux(PCMachineState *pcms)
> =20
>      x86_load_linux(x86ms, fw_cfg, PC_FW_DATA, pcmc->pvh_enabled);
>      for (i =3D 0; i < nb_option_roms; i++) {
> -        assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
> -               !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
> +        assert(!strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
>                 !strcmp(option_rom[i].name, "pvh.bin") ||
>                 !strcmp(option_rom[i].name, "multiboot_dma.bin"));
>          rom_add_option(option_rom[i].name, option_rom[i].bootindex);
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index f2d4dc416a4..39a7fea332e 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -63,7 +63,6 @@ blobs =3D [
>    'efi-vmxnet3.rom',
>    'qemu-nsis.bmp',
>    'multiboot_dma.bin',
> -  'linuxboot.bin',
>    'linuxboot_dma.bin',
>    'kvmvapic.bin',
>    'pvh.bin',
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 1183ef88922..e694c7aac00 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -2,7 +2,7 @@ include config.mak
>  SRC_DIR :=3D $(TOPSRC_DIR)/pc-bios/optionrom
>  VPATH =3D $(SRC_DIR)
> =20
> -all: multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.=
bin
> +all: multiboot_dma.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
>  # Dummy command so that make thinks it has done something
>  =09@true
> =20
> diff --git a/pc-bios/optionrom/linuxboot.S b/pc-bios/optionrom/linuxboot.=
S
> deleted file mode 100644
> index ba821ab922d..00000000000
> --- a/pc-bios/optionrom/linuxboot.S
> +++ /dev/null
> @@ -1,195 +0,0 @@
> -/*
> - * Linux Boot Option ROM
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, see <http://www.gnu.org/licenses/>.
> - *
> - * Copyright Novell Inc, 2009
> - *   Authors: Alexander Graf <agraf@suse.de>
> - *
> - * Based on code in hw/pc.c.
> - */
> -
> -#include "optionrom.h"
> -
> -#define BOOT_ROM_PRODUCT "Linux loader"
> -
> -BOOT_ROM_START
> -
> -run_linuxboot:
> -
> -=09cli
> -=09cld
> -
> -=09jmp=09=09copy_kernel
> -boot_kernel:
> -
> -=09read_fw=09=09FW_CFG_SETUP_ADDR
> -
> -=09mov=09=09%eax, %ebx
> -=09shr=09=09$4, %ebx
> -
> -=09/* All segments contain real_addr */
> -=09mov=09=09%bx, %ds
> -=09mov=09=09%bx, %es
> -=09mov=09=09%bx, %fs
> -=09mov=09=09%bx, %gs
> -=09mov=09=09%bx, %ss
> -
> -=09/* CX =3D CS we want to jump to */
> -=09add=09=09$0x20, %bx
> -=09mov=09=09%bx, %cx
> -
> -=09/* SP =3D cmdline_addr-real_addr-16 */
> -=09read_fw=09=09FW_CFG_CMDLINE_ADDR
> -=09mov=09=09%eax, %ebx
> -=09read_fw=09=09FW_CFG_SETUP_ADDR
> -=09sub=09=09%eax, %ebx
> -=09sub=09=09$16, %ebx
> -=09mov=09=09%ebx, %esp
> -
> -=09/* Build indirect lret descriptor */
> -=09pushw=09=09%cx=09=09/* CS */
> -=09xor=09=09%ax, %ax
> -=09pushw=09=09%ax=09=09/* IP =3D 0 */
> -
> -=09/* Clear registers */
> -=09xor=09=09%eax, %eax
> -=09xor=09=09%ebx, %ebx
> -=09xor=09=09%ecx, %ecx
> -=09xor=09=09%edx, %edx
> -=09xor=09=09%edi, %edi
> -=09xor=09=09%ebp, %ebp
> -
> -=09/* Jump to Linux */
> -=09lret
> -
> -
> -copy_kernel:
> -=09/* Read info block in low memory (0x10000 or 0x90000) */
> -=09read_fw=09=09FW_CFG_SETUP_ADDR
> -=09shr=09=09$4, %eax
> -=09mov=09=09%eax, %es
> -=09xor=09=09%edi, %edi
> -=09read_fw_blob_addr32_edi(FW_CFG_SETUP)
> -
> -=09cmpw            $0x203, %es:0x206      // if protocol >=3D 0x203
> -=09jae             1f                     // have initrd_max
> -=09movl            $0x37ffffff, %es:0x22c // else assume 0x37ffffff
> -1:
> -
> -=09/* Check if using kernel-specified initrd address */
> -=09read_fw=09=09FW_CFG_INITRD_ADDR
> -=09mov=09=09%eax, %edi             // (load_kernel wants it in %edi)
> -=09read_fw=09=09FW_CFG_INITRD_SIZE     // find end of initrd
> -=09add=09=09%edi, %eax
> -=09xor=09=09%es:0x22c, %eax        // if it matches es:0x22c
> -=09and=09=09$-4096, %eax           // (apart from padding for page)
> -=09jz=09=09load_kernel            // then initrd is not at top
> -=09=09=09=09=09       // of memory
> -
> -=09/* pc.c placed the initrd at end of memory.  Compute a better
> -=09 * initrd address based on e801 data.
> -=09 */
> -=09mov=09=09$0xe801, %ax
> -=09xor=09=09%cx, %cx
> -=09xor=09=09%dx, %dx
> -=09int=09=09$0x15
> -
> -=09/* Output could be in AX/BX or CX/DX */
> -=09or=09=09%cx, %cx
> -=09jnz=09=091f
> -=09or=09=09%dx, %dx
> -=09jnz=09=091f
> -=09mov=09=09%ax, %cx
> -=09mov=09=09%bx, %dx
> -1:
> -
> -=09or=09=09%dx, %dx
> -=09jnz=09=092f
> -=09addw=09=09$1024, %cx            /* add 1 MB */
> -=09movzwl=09=09%cx, %edi
> -=09shll=09=09$10, %edi             /* convert to bytes */
> -=09jmp=09=093f
> -
> -2:
> -=09addw=09=09$16777216 >> 16, %dx  /* add 16 MB */
> -=09movzwl=09=09%dx, %edi
> -=09shll=09=09$16, %edi             /* convert to bytes */
> -
> -3:
> -=09read_fw         FW_CFG_INITRD_SIZE
> -=09subl            %eax, %edi
> -=09andl            $-4096, %edi          /* EDI =3D start of initrd */
> -=09movl=09=09%edi, %es:0x218       /* put it in the header */
> -
> -load_kernel:
> -=09/* We need to load the kernel into memory we can't access in 16 bit
> -=09   mode, so let's get into 32 bit mode, write the kernel and jump
> -=09   back again. */
> -
> -=09/* Reserve space on the stack for our GDT descriptor. */
> -=09mov             %esp, %ebp
> -=09sub             $16, %esp
> -
> -=09/* Now create the GDT descriptor */
> -=09movw=09=09$((3 * 8) - 1), -16(%bp)
> -=09mov=09=09%cs, %eax
> -=09movzwl=09=09%ax, %eax
> -=09shl=09=09$4, %eax
> -=09addl=09=09$gdt, %eax
> -=09movl=09=09%eax, -14(%bp)
> -
> -=09/* And load the GDT */
> -=09data32 lgdt=09-16(%bp)
> -=09mov=09=09%ebp, %esp
> -
> -=09/* Get us to protected mode now */
> -=09mov=09=09$1, %eax
> -=09mov=09=09%eax, %cr0
> -
> -=09/* So we can set ES to a 32-bit segment */
> -=09mov=09=09$0x10, %eax
> -=09mov=09=09%eax, %es
> -
> -=09/* We're now running in 16-bit CS, but 32-bit ES! */
> -
> -=09/* Load kernel and initrd */
> -=09read_fw_blob_addr32_edi(FW_CFG_INITRD)
> -=09read_fw_blob_addr32(FW_CFG_KERNEL)
> -=09read_fw_blob_addr32(FW_CFG_CMDLINE)
> -
> -=09/* And now jump into Linux! */
> -=09mov=09=09$0, %eax
> -=09mov=09=09%eax, %cr0
> -
> -=09/* ES =3D CS */
> -=09mov=09=09%cs, %ax
> -=09mov=09=09%ax, %es
> -
> -=09jmp=09=09boot_kernel
> -
> -/* Variables */
> -
> -.align 4, 0
> -gdt:
> -=09/* 0x00 */
> -.byte=090x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> -
> -=09/* 0x08: code segment (base=3D0, limit=3D0xfffff, type=3D32bit code e=
xec/read, DPL=3D0, 4k) */
> -.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x9a, 0xcf, 0x00
> -
> -=09/* 0x10: data segment (base=3D0, limit=3D0xfffff, type=3D32bit data r=
ead/write, DPL=3D0, 4k) */
> -.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00
> -
> -BOOT_ROM_END


