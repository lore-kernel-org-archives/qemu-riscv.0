Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNHX-0001oJ-85
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNHV-0001nu-6F; Tue, 10 Jan 2023 17:39:45 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNHT-00021v-Cd; Tue, 10 Jan 2023 17:39:44 -0500
Received: by mail-ua1-x92f.google.com with SMTP id z23so3228315uae.7;
 Tue, 10 Jan 2023 14:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWHULFqUq5iI9+wP4W1931WEnHGL0C5BjETCp7Jjb6o=;
 b=lNfndP0FaejaF3KFx1GuHgK6fszF7o0UZkfevGZsfGIXlP8N7HZ2zaNooAaycYBbYA
 XnJVa+bNw/BMecyAeYT41nM54WTLd2QokQOtfQt8Eaz4Rkq+YKaOtQ2Y9zjdvlUReIly
 BEreTNedWxudgOehJRlOpLqslKsFP2zWNgT4Fq855bVLIewASwnuRqMGfMlYAdjNX2mF
 26Bvw4CucF3cEV6rlz3twBDwbQQMSQIuN6jhGvPnurCu87eBarPUOZpFSy24LK5lWf/b
 sTARVa7v1AwqcZ/ZSETmXd36S1H5bvJsNbVuCJG1hw88+K0f8wzTGoPuBT5GIDliGb4J
 PUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWHULFqUq5iI9+wP4W1931WEnHGL0C5BjETCp7Jjb6o=;
 b=QtISzXiQlA+kFVutNknhCjiCdFNjhd8cuUs2tFYttFFkYpksR+6jNDN+bAg3bvdGmG
 +n7W1CqqCFlzyTJ4MmG+HmcLYEyx/AhbBu4ehYpy+z9tekI668NY1RO61dP1nf3P+18W
 tCIJsZrM7HI6G7B0KCuAzowJK8V9lTV8dxZUUk0Mr61A7jCzdUdVe2fmdy/ilEy8zWez
 axTJFxLIivDD0Jnwz06RXxYTOzioOnj+b/Qj21YAo/h4c0GgIpFHo3IJ+9VloL6kcnAH
 7TtEQj6KXiaRHH02RsrJGNVAaBNLcJ55ZJrOJNmagA7f3fVRihkSStdg+N43b72jXoG9
 3FQw==
X-Gm-Message-State: AFqh2koXpr2Wz5erYCeGtcCz+apPjRqW3BvRs8p7bWHyGksxhFu46Nk4
 O8SuKBQm3E9yKWYeJrfJaaZKVhBt8ywLlIZpAhY=
X-Google-Smtp-Source: AMrXdXssSr0qn7abo3whv+CIVjVif1WcnfjSeM0e2wcm72TVV5xXryc7NHUiyJyNAl2NCmivLJJuj/pVFN97V6r406Y=
X-Received: by 2002:ab0:4926:0:b0:5c7:f152:3f4a with SMTP id
 z35-20020ab04926000000b005c7f1523f4amr3662912uac.23.1673390381851; Tue, 10
 Jan 2023 14:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:39:15 +1000
Message-ID: <CAKmqyKNn3hBoiyWH+Kw8xhBZO5DbdzY08xDhkHFLaYkgTmJ35A@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] hw/riscv/boot.c: use MachineState in
 riscv_load_initrd()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:39:46 -0000

On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
> retrieved by the MachineState object for all callers.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            | 6 ++++--
>  hw/riscv/microchip_pfsoc.c | 3 +--
>  hw/riscv/sifive_u.c        | 3 +--
>  hw/riscv/spike.c           | 3 +--
>  hw/riscv/virt.c            | 3 +--
>  include/hw/riscv/boot.h    | 3 +--
>  6 files changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 6b948d1c9e..d3e780c3b6 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -208,9 +208,11 @@ target_ulong riscv_load_kernel(const char *kernel_fi=
lename,
>      exit(1);
>  }
>
> -void riscv_load_initrd(const char *filename, uint64_t mem_size,
> -                       uint64_t kernel_entry, void *fdt)
> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>  {
> +    const char *filename =3D machine->initrd_filename;
> +    uint64_t mem_size =3D machine->ram_size;
> +    void *fdt =3D machine->fdt;
>      hwaddr start, end;
>      ssize_t size;
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 593a799549..1e9b0a420e 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -633,8 +633,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
>                                           kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
> -            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> -                              kernel_entry, machine->fdt);
> +            riscv_load_initrd(machine, kernel_entry);
>          }
>
>          if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 3e6df87b5b..c40885ed5c 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -602,8 +602,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>                                           kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
> -            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> -                              kernel_entry, machine->fdt);
> +            riscv_load_initrd(machine, kernel_entry);
>          }
>
>          if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 60e2912be5..99dec74fe8 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -312,8 +312,7 @@ static void spike_board_init(MachineState *machine)
>                                           htif_symbol_callback);
>
>          if (machine->initrd_filename) {
> -            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> -                              kernel_entry, machine->fdt);
> +            riscv_load_initrd(machine, kernel_entry);
>          }
>
>          if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 6c946b6def..02f1369843 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1285,8 +1285,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>                                           kernel_start_addr, NULL);
>
>          if (machine->initrd_filename) {
> -            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
> -                              kernel_entry, machine->fdt);
> +            riscv_load_initrd(machine, kernel_entry);
>          }
>
>          if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index e37e1d1238..cfd72ecabf 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -46,8 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_f=
ilename,
>  target_ulong riscv_load_kernel(const char *kernel_filename,
>                                 target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
> -void riscv_load_initrd(const char *filename, uint64_t mem_size,
> -                       uint64_t kernel_entry, void *fdt);
> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>  uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
>  void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
>                                 hwaddr saddr,
> --
> 2.39.0
>
>

