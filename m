Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os2n4-0006o4-BP
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 09:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1orytE-0002R0-LB; Mon, 07 Nov 2022 04:58:00 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>)
 id 1orytC-0004VH-83; Mon, 07 Nov 2022 04:58:00 -0500
Received: from loongson.cn (unknown [10.20.42.170])
 by gateway (Coremail) with SMTP id _____8AxTbeZ1mhjyAEFAA--.4838S3;
 Mon, 07 Nov 2022 17:57:45 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxd1eZ1mhj_WUOAA--.22038S3; 
 Mon, 07 Nov 2022 17:57:45 +0800 (CST)
Message-ID: <80ccc060-32a7-bc38-bf2b-2ef5959a7e0c@loongson.cn>
Date: Mon, 7 Nov 2022 17:57:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxd1eZ1mhj_WUOAA--.22038S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCrW5ZFyxAw15ZF1rtw48Xrb_yoW5Zw4rpF
 WFkFs3Jr1kJFn7ur1xGw43G345Gw1fJF1UWrWI9w40kr13W3W2gFWrKa48Gry0yr1DXFyD
 CF98JrZFkFs7XrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Nov 2022 09:07:53 -0500
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
X-List-Received-Date: Mon, 07 Nov 2022 09:58:01 -0000



在 2022/11/6 22:39, Sunil V L 写道:
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
How about add one sentence?
       assert(real_size <= size);   

As defined VIRT_FLASH memory space, the total memory space size 64M,
Pflash0/Pflash1 cannot be more than 32M. Supposing real size of pflash0
is 33M, there will be conflict with address space of pflash1.

regards
bibo, mao

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


