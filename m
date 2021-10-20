Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKma-0000x5-19
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKmN-0000qO-4l; Wed, 20 Oct 2021 19:13:52 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKmG-0008NL-Uz; Wed, 20 Oct 2021 19:13:48 -0400
Received: by mail-io1-xd29.google.com with SMTP id h196so26740783iof.2;
 Wed, 20 Oct 2021 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H9VEtIMolVLSWN8PBX0Wu9nzRQcejBjTBTdiudWqkRw=;
 b=LSQeI/2Oc+Tr1yR+P6Y+MDMz4oCBoW9/0qG7/KYE20djkdWRH4HmqiMkoUEb+C56fm
 hFE1LtaBWzjqpN4J9t39Qx/IzYm7RVLYRmR2DMgiEgpaC7FK/voK942+KT0Vu9pMvbv3
 AZ+7AbqIOD/+lhl0FyadfeNqYa9TGXsTe9w2RSrxT//uTA4qipPYwZP2GRzTws3jvs0U
 xo9Pniop+tS5QtrQnxw4ZF7IsOn0PkRywjIBqV+UDgi96s/CJR7VUQyUhCYpuVXouAJo
 hVRpJwijbZlmVAq8mrTkR5ABvQfUzE+d2hVd/9O/T5XN2xNjMZIwUY0p9YdNcvCx6gjG
 sCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H9VEtIMolVLSWN8PBX0Wu9nzRQcejBjTBTdiudWqkRw=;
 b=Q70tUuvHh/DmngJSOAfhrQEf9OpBxjgZks5TI7QfML77kb/oMGPSzlxh9l9tGbrHSj
 nNXxoZriDk+6booxXj2qx4EDAjFI/wrrMlQyBKVV6cgBjTixoOE355vbPsXveHdvfx4S
 xpBzcKO/GkyHdzd/1+gKf20tGpffLapqSZPhaMjGTFRl973v3ye+9tGPIrfiHPWGqiUO
 rJWshSpemhWy7HMOPHvF47MWmhu+XBVEgRj32qhlaQlSuHprk2Sk2Tm6dXhF4nlCKxwy
 3yCbSBFL70X36nlPlPeRR55RkIBGKItVcpb9MSpZzQmep60MJOuWeabjDGy0+ulBi69N
 JZtQ==
X-Gm-Message-State: AOAM530QpZdrSxU0UA8/PHYYNAzdnAN199XcIqknvHuOd8DR1kWUfcnJ
 2dOH9FWbGbUVHgs7kMtdUQVZ43ovNbiDYPaOlhs=
X-Google-Smtp-Source: ABdhPJwM5kkEM/SI1A1wmyYPHxO7nVBLKLuPKr9kiu3XOBMhkAmKNk2lGnHCdENe4FO1WqO7O38GiCkMSjdRbyqVix8=
X-Received: by 2002:a05:6638:2581:: with SMTP id
 s1mr1462154jat.35.1634771622461; 
 Wed, 20 Oct 2021 16:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-7-bmeng.cn@gmail.com>
In-Reply-To: <20211020014112.7336-7-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:13:16 +1000
Message-ID: <CAKmqyKMoDCJfGffKFKj8ACunOObKD50nn2CiKD-1=S4vuq8B+w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] hw/riscv: spike: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:13:54 -0000

On Wed, Oct 20, 2021 at 11:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
>
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v1)
>
>  hw/riscv/spike.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 79ae355ae2..288d69cd9f 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -180,7 +180,6 @@ static void spike_board_init(MachineState *machine)
>      const MemMapEntry *memmap =3D spike_memmap;
>      SpikeState *s =3D SPIKE_MACHINE(machine);
>      MemoryRegion *system_memory =3D get_system_memory();
> -    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
>      MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
>      target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t fdt_load_addr;
> @@ -239,10 +238,8 @@ static void spike_board_init(MachineState *machine)
>      }
>
>      /* register system main memory (actual RAM) */
> -    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
> -                           machine->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
> -        main_mem);
> +        machine->ram);
>
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> @@ -326,6 +323,7 @@ static void spike_machine_class_init(ObjectClass *oc,=
 void *data)
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
> +    mc->default_ram_id =3D "riscv.spike.ram";
>  }
>
>  static const TypeInfo spike_machine_typeinfo =3D {
> --
> 2.25.1
>
>

