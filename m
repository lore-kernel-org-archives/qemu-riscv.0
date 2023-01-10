Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNIs-0002ia-Q6
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNIr-0002iF-Lm; Tue, 10 Jan 2023 17:41:09 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNIp-0002Q0-UY; Tue, 10 Jan 2023 17:41:09 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id s127so13894028vsb.5;
 Tue, 10 Jan 2023 14:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0HIt8dF1tonwj/2/j2rsHglq6LnlMrliqx16mdGNiE=;
 b=lrmOFD2zyOwxt4+nsz+ph/NhK9MmitMlcwn5p+A/6F24p+GEwwA4rrapUT+/RzWE5z
 gz9y24LcyRHh13gBCIQFE5YV3vaM3lLwHmlWw4i2x9XDuMEKaJqvPpp0cV5Vhr9lbs1o
 IwZv/IMDKOcYJgJ/KpkPFrz6bMY5S4R5IhqJTlIMedQPxQBH5yOiT3n6BJmAbLr55Ig9
 Xn0pIE+4kzXGF9gjus+b2T4xRPzrFGlEv9Qo71AzSavjrE28/YWBni0lcSvtT3EWlvEp
 dH7PnMpstD6XbU3lZssrht/GCb01CBd2pVmEiK9PQM04EIGprsbMh1OMwlv8Z+F3tonn
 CIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0HIt8dF1tonwj/2/j2rsHglq6LnlMrliqx16mdGNiE=;
 b=C5yjh35G2QtUCsDWqpkMeuAoLtJ9gSvmzws689ZQGATE4xrYniqZVMuFrtMB7co9Qt
 JvxDZ6vD2csD/ktS3NHAu4Re89ZQm6VowE2f9GEaYSzEgnC/0+la4KK2mOBMWjPSJRMi
 DstOiAvZtOGNMYfRmLpDHOE715f+Ze//c2qcAUdeIvE0NupSRotfKXpUpOb6PaW5SAww
 9oigG4CVXa5n60pcWgt1jJbOrQSSgpIGW3qMay4C7o8bpkZ4qxabLfN70iVfzS8YEpCf
 EXjTA6tYxlKmlswGwGzkDQqCuUkXVyCndK0gIn6jLkDwh23UaTN8SjwjLCEJtEYIEppY
 PmcQ==
X-Gm-Message-State: AFqh2kqx4QeRRJxwHXlXiZDnK6mlHkkXY4whEYaXxyxK6fykgligiDJm
 0waWO2kns1j+xU8PEe1l1evkkS6B2weIW5269hk+Hur4arc=
X-Google-Smtp-Source: AMrXdXvpbtlbOKVfJtdJ/nxx2i+35eL7JxzOs9jESihHk1u+vMTlwKgIIozPbEI9VC2b2hQRKQynYQy6dUOVdk2ixYw=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr9281981vsb.10.1673390466153; Tue, 10
 Jan 2023 14:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-10-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:40:40 +1000
Message-ID: <CAKmqyKNk1PG6aDDghivPPWO4Cfm8H1UuXZBA5XhD=ghkSkqUxw@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] hw/riscv/boot.c: use MachineState in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:41:10 -0000

On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All callers are using kernel_filename as machine->kernel_filename.
>
> This will also simplify the changes in riscv_load_kernel() that we're
> going to do next.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            | 3 ++-
>  hw/riscv/microchip_pfsoc.c | 3 +--
>  hw/riscv/opentitan.c       | 3 +--
>  hw/riscv/sifive_e.c        | 3 +--
>  hw/riscv/sifive_u.c        | 3 +--
>  hw/riscv/spike.c           | 3 +--
>  hw/riscv/virt.c            | 3 +--
>  include/hw/riscv/boot.h    | 2 +-
>  8 files changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index d3e780c3b6..2594276223 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -173,10 +173,11 @@ target_ulong riscv_load_firmware(const char *firmwa=
re_filename,
>      exit(1);
>  }
>
> -target_ulong riscv_load_kernel(const char *kernel_filename,
> +target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong kernel_start_addr,
>                                 symbol_fn_t sym_cb)
>  {
> +    const char *kernel_filename =3D machine->kernel_filename;
>      uint64_t kernel_load_base, kernel_entry;
>
>      g_assert(kernel_filename !=3D NULL);
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 1e9b0a420e..82ae5e7023 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -629,8 +629,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
> -                                         kernel_start_addr, NULL);
> +        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 85ffdac5be..64d5d435b9 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -101,8 +101,7 @@ static void opentitan_board_init(MachineState *machin=
e)
>      }
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename,
> -                          memmap[IBEX_DEV_RAM].base, NULL);
> +        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index d65d2fd869..3e3f4b0088 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -114,8 +114,7 @@ static void sifive_e_machine_init(MachineState *machi=
ne)
>                            memmap[SIFIVE_E_DEV_MROM].base, &address_space=
_memory);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine->kernel_filename,
> -                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
> +        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL)=
;
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index c40885ed5c..bac394c959 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -598,8 +598,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
> -                                         kernel_start_addr, NULL);
> +        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 99dec74fe8..bff9475686 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -307,8 +307,7 @@ static void spike_board_init(MachineState *machine)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
> -                                         kernel_start_addr,
> +        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
>                                           htif_symbol_callback);
>
>          if (machine->initrd_filename) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 02f1369843..c8e35f861e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1281,8 +1281,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>          kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_ad=
dr);
>
> -        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
> -                                         kernel_start_addr, NULL);
> +        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
>
>          if (machine->initrd_filename) {
>              riscv_load_initrd(machine, kernel_entry);
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index cfd72ecabf..f94653a09b 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -43,7 +43,7 @@ char *riscv_find_firmware(const char *firmware_filename=
,
>  target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb);
> -target_ulong riscv_load_kernel(const char *kernel_filename,
> +target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
> --
> 2.39.0
>
>

