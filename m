Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKjk-0006Fy-V6
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKji-0006Do-Mb; Wed, 20 Oct 2021 19:11:06 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKjZ-0004zt-PM; Wed, 20 Oct 2021 19:11:02 -0400
Received: by mail-io1-xd36.google.com with SMTP id e144so26696121iof.3;
 Wed, 20 Oct 2021 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pwNCaV6ssjRvuTHSsfGpRlfb8HQu0HGdDTnmOVSRL8c=;
 b=MRrUTF+gyKYFTuaNnXGuTpJcZaOv/jljxNw1q6LUOTQd9BWg2axyLObix2BDqQjlNr
 V1rJysqElzXeAfA9YFDlj+w3MQCKd82+1/mw/gNKAo/gj+N5XJQAWzox0vmY3CDnRhMn
 ez57XRRbnbDXQT7bT58r1GPyHGHsl6ywHOh8IDPoV8aCgRLeMvkaVuo9uBArsI1+KVYL
 of6+Yq22OV6Bckitz0B2pSDejb2PIrPyOAVf81UhpGrmxUhuvotQQf++FTh9aRlU6G2A
 RxDBsrFHvvBLBqwUy86apbuDxOfPWE5ggCaJ8eGi1VuyZxglvwXme/yboGmCvQB6ncZ/
 PEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pwNCaV6ssjRvuTHSsfGpRlfb8HQu0HGdDTnmOVSRL8c=;
 b=4NeY67nDg7I8TqtAvj11CBPVInQgAkKjHDL8jEigH0sj8hfGzn9hG2orB1wp9lEyxb
 UhlVay++YAaJh1AqFYpioHCKqmqfzVwdSR7LboSm7//4Fd5aeDs6/KOjRweHwPO0dEZq
 6JAuL65wXXS2ozD6E62LVUmeDx5zodAEZP/5UN40oBTgm0aGwk0M7o+1kAeqCfjHe9bk
 4f83TKiw4dG9wXMKaqWSJ3C4oGwmmRhFmaKIUVqrfLD8zemAk1JMGLGV2rYr3xUqkAkh
 kKkskILS0Cu9M3fPbrUGBFe2CyAlQv4vnvuLudyJAGATCNKthqmg80QwVmz2gTZSvFWA
 cpkw==
X-Gm-Message-State: AOAM5321Pi/QA1hKUH9yR1JVfASmaXtP4RbdwZlUzzUYe6/u6U85kdw0
 knGuZEbqbut/cT2xof8aojhPUO59AiKELv2qe/Y=
X-Google-Smtp-Source: ABdhPJwb+2vBXbeIV1eXLW7edDvZrgGEDWeV4lKDJnR45UDqU++glz8F2JOd9PmEoyMDilsK1UU91Vc8+VOhWIN9/BY=
X-Received: by 2002:a05:6638:32a6:: with SMTP id
 f38mr1428830jav.63.1634771456303; 
 Wed, 20 Oct 2021 16:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-3-bmeng.cn@gmail.com>
In-Reply-To: <20211020014112.7336-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:10:29 +1000
Message-ID: <CAKmqyKOHMdRmBoy2dwCu7r=m71E0xnekeA3Qo9uqzxv6FwebMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 23:11:07 -0000

On Wed, Oct 20, 2021 at 11:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
>
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
>
> While at it add check for user supplied RAM size and error out if it
> mismatches board expected value.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - add RAM size check
> - assign mc->default_ram_size
>
>  hw/riscv/opentitan.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 9803ae6d70..5d568ea58a 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "hw/riscv/opentitan.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> @@ -64,20 +65,25 @@ static const MemMapEntry ibex_memmap[] = {
>
>  static void opentitan_board_init(MachineState *machine)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const MemMapEntry *memmap = ibex_memmap;
>      OpenTitanState *s = g_new0(OpenTitanState, 1);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> +
> +    if (machine->ram_size != mc->default_ram_size) {
> +        char *sz = size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be %s", sz);
> +        g_free(sz);
> +        exit(EXIT_FAILURE);
> +    }
>
>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc,
>                              TYPE_RISCV_IBEX_SOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>
> -    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
> -        memmap[IBEX_DEV_RAM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[IBEX_DEV_RAM].base, main_mem);
> +        memmap[IBEX_DEV_RAM].base, machine->ram);
>
>      if (machine->firmware) {
>          riscv_load_firmware(machine->firmware, memmap[IBEX_DEV_RAM].base, NULL);
> @@ -95,6 +101,8 @@ static void opentitan_machine_init(MachineClass *mc)
>      mc->init = opentitan_board_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
> +    mc->default_ram_id = "riscv.lowrisc.ibex.ram";
> +    mc->default_ram_size = ibex_memmap[IBEX_DEV_RAM].size;
>  }
>
>  DEFINE_MACHINE("opentitan", opentitan_machine_init)
> --
> 2.25.1
>
>

