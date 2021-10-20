Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKlz-0000Ix-J1
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKlx-0000EF-Kr; Wed, 20 Oct 2021 19:13:25 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdKlr-0007jh-94; Wed, 20 Oct 2021 19:13:25 -0400
Received: by mail-il1-x12d.google.com with SMTP id a8so23835861ilj.10;
 Wed, 20 Oct 2021 16:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+N6ILkKEpapPlQtU0qsNkf4yzLbVT98AaPkfrkM3V14=;
 b=LQobo42CvDIz5Z/sBtRTgwCKWKDVj9eonp93earZ4q79GOEFn5xlWGxucHK4Bpnj4k
 Q0/aEXVVPcN1TVU0DPkt44xz7juGVOViWXv2DaiPjRDjEp1PqrShv0AqDlrP3tqa7RYK
 2CTgkk/8BnHvy2GuzGFxywqRkRqPAgygaW31iMI0Xo2KXUIkKPbqXN3rWsO8TLliywVE
 QAR5XICIYdBu+cUIatrJ61zhYcv/gOUnzs3R/+4wL/wRvvysbNdIDQ68E0hTrdA3x6Sa
 wIrzUbBOTEheK68OCLHreNhX0qnRUnG9VRCkkEo6TIVhfESz5F1KV/GSRryde52c8Ka9
 zewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+N6ILkKEpapPlQtU0qsNkf4yzLbVT98AaPkfrkM3V14=;
 b=Bh6fP7EB25SkiKR53qnNDUgYQEY3a1ubDSgXcS+oS8Q/jJ8K8KjTJvfzJzB2Jkz2fS
 4CBrWGLnS8kllFi6rOASBDWWeyS0DlUWw08TJxPyBGx/GcfROzhcLBZI+8s3ot99cKJU
 p/tXK7kjjbzq8yCiwM30Mq7OECrxZclMdia47q8EZbdQGqjlj4JaQ9fGmqG8JbcpYoHt
 KhsO2CXhd1Bwc4ymvqt1SmJlH7vDwq14i3NQvYkJoClSV9nR5md6F4i8DrlQq2LAEamp
 kKQaAPUGsUXNqMnnUKvJrj9zvwZUE37Ns6Y/yq6bRW783z6lvkUhluDQIfW4MpiN2Xt6
 zO7A==
X-Gm-Message-State: AOAM5326eyEXeeMpYUMkMD+lcExfNHbSwuyGJrBwgQMYmslApagIkQvo
 xnXxhEOMYQNVK3fbSfbhRLwgCoRxPTHRxYjsm4s=
X-Google-Smtp-Source: ABdhPJwse+nUml95yyAaWi2PaJnjvguPYjnE37erjgMROzHGzKlmJWGl/SDM/l3G2Fwm8+4qzGe8BrEQUgOsbjNpsjE=
X-Received: by 2002:a92:c88c:: with SMTP id w12mr154730ilo.46.1634771598046;
 Wed, 20 Oct 2021 16:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-6-bmeng.cn@gmail.com>
In-Reply-To: <20211020014112.7336-6-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 09:12:52 +1000
Message-ID: <CAKmqyKOTf9YgG0SyGYcsNWa8AJ2Fc9ztg4hMKwVNerSnKvdNxg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/riscv: sifive_u: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:13:26 -0000

On Wed, Oct 20, 2021 at 11:48 AM Bin Meng <bmeng.cn@gmail.com> wrote:
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

> ---
>
> (no changes since v1)
>
>  hw/riscv/sifive_u.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index fc5790b8ce..0217006c27 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -528,7 +528,6 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>      const MemMapEntry *memmap =3D sifive_u_memmap;
>      SiFiveUState *s =3D RISCV_U_MACHINE(machine);
>      MemoryRegion *system_memory =3D get_system_memory();
> -    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
>      MemoryRegion *flash0 =3D g_new(MemoryRegion, 1);
>      target_ulong start_addr =3D memmap[SIFIVE_U_DEV_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
> @@ -549,10 +548,8 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>
>      /* register RAM */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.u.ram",
> -                           machine->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DEV_DRAM]=
.base,
> -                                main_mem);
> +                                machine->ram);
>
>      /* register QSPI0 Flash */
>      memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
> @@ -748,6 +745,7 @@ static void sifive_u_machine_class_init(ObjectClass *=
oc, void *data)
>      mc->min_cpus =3D SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpu_type =3D SIFIVE_U_CPU;
>      mc->default_cpus =3D mc->min_cpus;
> +    mc->default_ram_id =3D "riscv.sifive.u.ram";
>
>      object_class_property_add_bool(oc, "start-in-flash",
>                                     sifive_u_machine_get_start_in_flash,
> --
> 2.25.1
>
>

