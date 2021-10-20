Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKlW-0008Mr-1l
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKlQ-0008J9-Ck; Wed, 20 Oct 2021 19:12:53 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKlN-0007LF-5T; Wed, 20 Oct 2021 19:12:50 -0400
Received: by mail-io1-xd2f.google.com with SMTP id x1so26669751iof.7;
 Wed, 20 Oct 2021 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NAbTQedUHEw9KOuSHLwN0HKs7vbjtzvUhJBWiwZD87g=;
 b=TlKL73yogaNUctOxcoSe61aIOR3zwKv/4C/FlTWM3C0YVTftAt6RbFhzqPwQ9wbTsL
 L2rZ2DIfSmt0LOFZP8nEDTRLi8+YZeIUgykIEX3C9CeozK/jupvwVkzdSgoqvo/Bo9Qh
 5Z8JQLGLmAKc9S49Vy+u7JF7IeZxCHg/zMsrvI0azhhxpi2nU/5M5fccecjZ/ZOWDLAi
 EwonT6LWmlatWQFCc/Xw0/AXnoFcZML4Gk/IkgwsTS4JJEGWp+jTUKOM8QyC1OTLZgDY
 yT3lyaTTC7s3hbrDef6ZmPCV4S2zlLpDeIbWofWb7wbpz8l1uksvkN/Dy1byLE98ROXx
 VKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NAbTQedUHEw9KOuSHLwN0HKs7vbjtzvUhJBWiwZD87g=;
 b=jzTiK2AYFYTI1OBY+0HhVESQPV3A+r7YrGuXlC2B/40iar7zwb4ffiYVSHLZ8y8cLG
 KargPVn0ktwPthXB1FGF6pnDiVCYFZiwjrBNi9XhqpbySYhsGSqtCMcSxlJ7IFtnORGs
 K4CRABim8fHqeK7GkPW/m00lqgIww1fpA1GTX+7D0BqwORpU3DoYO5fmDYIbEHWATGCr
 uEf10XVfR70w042ak5v5k541uHke0eSavQvPPLjV0PEGG62/j3ow0nnwAv5D8GnEs0xs
 is7DpZKOJZQFboEpDNTpjtNLDdT2xmJRKu9BoB2bIQLVIXZ6p7x2rcMr7KxF1p+BY/9L
 nvaQ==
X-Gm-Message-State: AOAM530Y6Xw8GIPY6nfXZYVOmVHHrgbZdLKssZ495a1CaiSZKt3yXUh9
 8ArzJx4Mhp0hvgiZOCOFzMrwhS/pq6W4L/fhmFQ=
X-Google-Smtp-Source: ABdhPJwIkDshvLP4vkh8mqsCQrBxeRPkZvqsBU5a9k2RMmMXiNz0oUyAuRzRZQDG1R9BbOEa5Y9fQzve4V13SuG86H8=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr1525573jak.18.1634771567851; 
 Wed, 20 Oct 2021 16:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-5-bmeng.cn@gmail.com>
In-Reply-To: <20211020014112.7336-5-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:12:21 +1000
Message-ID: <CAKmqyKMsZbw_hygiGPxB1eUYMvt+HdXJK8z_yU_agBP9M2BFsQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:12:55 -0000

On Wed, Oct 20, 2021 at 11:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
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
>  hw/riscv/sifive_e.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 6e95ea5896..9b206407a6 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -29,6 +29,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> @@ -71,22 +72,27 @@ static const MemMapEntry sifive_e_memmap[] = {
>
>  static void sifive_e_machine_init(MachineState *machine)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const MemMapEntry *memmap = sifive_e_memmap;
>
>      SiFiveEState *s = RISCV_E_MACHINE(machine);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      int i;
>
> +    if (machine->ram_size != mc->default_ram_size) {
> +        char *sz = size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be %s", sz);
> +        g_free(sz);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_E_SOC);
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>
>      /* Data Tightly Integrated Memory */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
> -        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
> +        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
>
>      /* Mask ROM reset vector */
>      uint32_t reset_vec[4];
> @@ -142,6 +148,8 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_e_machine_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = SIFIVE_E_CPU;
> +    mc->default_ram_id = "riscv.sifive.e.ram";
> +    mc->default_ram_size = sifive_e_memmap[SIFIVE_E_DEV_DTIM].size;
>
>      object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
>                                     sifive_e_machine_set_revb);
> --
> 2.25.1
>
>

