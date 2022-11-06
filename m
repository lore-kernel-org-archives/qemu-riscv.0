Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ormTl-0003YP-Ei
	for mharc-qemu-riscv@gnu.org; Sun, 06 Nov 2022 15:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1orlD7-0000ch-Nh; Sun, 06 Nov 2022 14:21:37 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1orlD5-0007WY-2J; Sun, 06 Nov 2022 14:21:37 -0500
Received: by mail-yb1-xb33.google.com with SMTP id n85so5761494yba.1;
 Sun, 06 Nov 2022 11:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mIGZga6sxZI5IECtVO/JirjeqSSgYLR/Mfi6SAH2zSM=;
 b=NWRKhEYkCokitmfNugiUbP081woKSRZbh10ImWXf+Me1iXJxAfKF1il7Vso+sIqm5q
 Rqp7Z/XGVG8htduaAagHBhb/F/FoRKL5NEns7PMUku+kY3AmqCqqTYOeg7DOD/gBACG/
 eWdltNSIN6AmVvN02J8FGPq11ClWnNF7lXL8T99AdrB/tJiek8cu3BWrresRhW2Odshb
 fPu02URBxEp5C4fCFPC+v9UDIP5mVJpF3CPzVnPcHcL8tQnpvysx4hoq3bnSLxbYmXUr
 KRPQiJkjPnvxNFfMniseJJJYku0ebkppRD0YYtIU6wNgLCXygNPyb98SdwuEg3ixhgnX
 RHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mIGZga6sxZI5IECtVO/JirjeqSSgYLR/Mfi6SAH2zSM=;
 b=z/qisSXZlpf6/WwCENwb76v1HWR8R9VKCvNJ653QmnWoJdIbH3hjldiOQVeJns2gA0
 tNI4w1Nfk7MXqtS1TqYPOSijrGCqdKUGWSvqgZQHmSHL9IGICZfQyOG66770gs/Dy9s3
 xMnOAS73nbabcQXK2DJjw5wiLgzlCZKnj599BOAkXANLMoSOsRc1aRFrdJyHXHZQ8h+E
 1x46nfGn4IJ6PMqByQSJFBnpHn+hf43Xlpi8qm8uoIoHjwnTIQwflAnNHRMIQbQlm1rE
 lQSSuORfxpdgTHLdrsbbkoQO5Bs6sEPsqjGRaH+ZrXuHZPnjp0vd5ZIBKl/Ht2Wzp4cB
 F0vQ==
X-Gm-Message-State: ANoB5pmRxpiVagYPM68zFaZ96qrPGUNf6WGonYK3hZFp/9/IUffzw51q
 Ji/ZOfit9qzZhG7Oph6KSqFj0ZYcONgCgk8ZFuE=
X-Google-Smtp-Source: AA0mqf4btofABhayWgQ2ytwKqMAyL7Wf+TpahsB+5ZvX8WLGKub503BaSptIVYuewq/eJZ3JCx4hH+T0ghq6yCp9We8=
X-Received: by 2002:a25:748f:0:b0:6d4:f634:3be8 with SMTP id
 p137-20020a25748f000000b006d4f6343be8mr7699968ybc.235.1667762493029; Sun, 06
 Nov 2022 11:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
In-Reply-To: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Sun, 6 Nov 2022 22:20:57 +0300
Message-ID: <CAL77WPADAWY8+2FZSQ=4PRcuUrwuUQ22CU+NoVLABM_r+px0pw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 06 Nov 2022 15:42:52 -0500
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
X-List-Received-Date: Sun, 06 Nov 2022 19:21:38 -0000

Hello Sunil!

What about virt_machine_done() function?
kernel_entry variable still points to the second flash started from
virt_memmap[VIRT_FLASH].size / 2.

On Sun, Nov 6, 2022 at 5:41 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> The pflash implementation currently assumes fixed size of the
> backend storage. Due to this, the backend storage file needs to be
> exactly of size 32M. Otherwise, there will be an error like below.
>
> "device requires 33554432 bytes, block backend provides 3145728 bytes"
>
> Fix this issue by using the actual size of the backing store.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 33 +++++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a5bc7353b4..aad175fa31 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -49,6 +49,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
> +#include "sysemu/block-backend.h"
>
>  /*
>   * The virt machine physical address space used by some of the devices
> @@ -144,10 +145,17 @@ static void virt_flash_map1(PFlashCFI01 *flash,
>                              MemoryRegion *sysmem)
>  {
>      DeviceState *dev = DEVICE(flash);
> +    BlockBackend *blk;
> +    hwaddr real_size;
>
> -    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
> -    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> -    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
> +    blk = pflash_cfi01_get_blk(flash);
> +
> +    real_size = blk ? blk_getlength(blk): size;
> +
> +    assert(real_size);
> +    assert(QEMU_IS_ALIGNED(real_size, VIRT_FLASH_SECTOR_SIZE));
> +    assert(real_size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
> +    qdev_prop_set_uint32(dev, "num-blocks", real_size / VIRT_FLASH_SECTOR_SIZE);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      memory_region_add_subregion(sysmem, base,
> @@ -971,15 +979,24 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
>  {
>      char *name;
>      MachineState *mc = MACHINE(s);
> -    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
> -    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
> +    MemoryRegion *flash_mem;
> +    hwaddr flashsize[2];
> +    hwaddr flashbase[2];
> +
> +    flash_mem = pflash_cfi01_get_memory(s->flash[0]);
> +    flashbase[0] = flash_mem->addr;
> +    flashsize[0] = flash_mem->size;
> +
> +    flash_mem = pflash_cfi01_get_memory(s->flash[1]);
> +    flashbase[1] = flash_mem->addr;
> +    flashsize[1] = flash_mem->size;
>
> -    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
> +    name = g_strdup_printf("/flash@%" PRIx64, flashbase[0]);
>      qemu_fdt_add_subnode(mc->fdt, name);
>      qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
>      qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
> -                                 2, flashbase, 2, flashsize,
> -                                 2, flashbase + flashsize, 2, flashsize);
> +                                 2, flashbase[0], 2, flashsize[0],
> +                                 2, flashbase[1], 2, flashsize[1]);
>      qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
>      g_free(name);
>  }
> --
> 2.38.0
>
>

