Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIKVC-0008HR-MZ
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 21:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKUb-0008DS-7H; Wed, 18 Jan 2023 21:17:31 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIKUY-0000Zt-Cw; Wed, 18 Jan 2023 21:17:28 -0500
Received: by mail-vs1-xe34.google.com with SMTP id k4so750098vsc.4;
 Wed, 18 Jan 2023 18:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2X9XFCRayF/VihCiRsuRXPLuVRWvLw06VIpIbeE4bZQ=;
 b=UuY17FCEKUNC4Z9+u5aJGqZ2soijNGjdjhaal2t3BaYZVRlrlrp/D2t3Wo4RzmEw69
 oeT49WocJkGmFVJnHXa0yKGoKVc7Fxkk+bnDRopx1cgrg7gHiDPYHP5TRzmjGqIqeNhE
 mY3Kl5wLkiRFKi5Q1K8C27wVGwinFGrSeVuFhdBHhJHh89Qwyt8rdEqnBjxn0i4F/I/V
 WhjplhzGNqBSJcnuNC9W/H3zOyqUZzwhRGywOUSVOFyR6hhEXDk7luPWGcw6AveX5MEP
 ThlFXoq5EppbgQ+g69qML+h9241w0MMSLw2L5pX8DNhNHXg6ypZrx2FR/nDfzoqMyEBY
 5/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2X9XFCRayF/VihCiRsuRXPLuVRWvLw06VIpIbeE4bZQ=;
 b=HYN2FPTjOYhK82CPlM8Ac119qwBPHjRmGhqzNV/4i/4IZxPpxwgg1EM44NaaQ/DO3j
 sAnHR2wIzYbUUNIEBqN8wfN8SjilISHfk92fBIzkgfB9SNgfbH8iHZkz1c8U3+Xj3HfX
 JNcKu1VJOdFjJ6WHQ8XJMiQ1w3L4DcRC8YrBVBx3zFxd1IhiDIBBPP9r40NvNNPmufVX
 XVgsbKDj3IzMsstlTXVP70c993FWitAQY3Zjqhwb204+5inDb1WgRe9oQGIDQM3HK8mQ
 bjrLbF9zdzq1lxgbgtpiWoZIDzYoyJUn3wZCQIDhgXe9jJ4ACq9euiqvY8zwSf8tHudR
 NLsQ==
X-Gm-Message-State: AFqh2kpOmGuzJIaKttdwR+tt7LMLss3WSG5en5dNlHcmirskeyAHOT6Z
 R/ysYC0juqewQB84iyDVgYCy+s2JggHt2q0rGcw=
X-Google-Smtp-Source: AMrXdXuhJJngssFSpaFgb5cLcqfbAwOqsKspKX0sHgCKWiwQQEyqJdlRfZ2r6+G94n6/YEUbTyl3eHDcY9jyV5fR1P8=
X-Received: by 2002:a05:6102:f98:b0:3d3:c7d9:7b62 with SMTP id
 e24-20020a0561020f9800b003d3c7d97b62mr1175014vsv.72.1674094645180; Wed, 18
 Jan 2023 18:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20230116173420.1146808-1-dbarboza@ventanamicro.com>
 <20230116173420.1146808-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230116173420.1146808-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 12:16:59 +1000
Message-ID: <CAKmqyKPD4R5i1fkmqxyQ1nDD4ib862OCTY42wmNcDaoVN1T77w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] hw/riscv/spike.c: rename MachineState 'mc'
 pointers to' ms'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 02:18:04 -0000

On Tue, Jan 17, 2023 at 3:35 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Follow the QEMU convention of naming MachineState pointers as 'ms' by
> renaming the instances where we're calling it 'mc'.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index afd581436b..222fde0c5c 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -56,7 +56,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
>      uint64_t addr, size;
>      unsigned long clint_addr;
>      int cpu, socket;
> -    MachineState *mc =3D MACHINE(s);
> +    MachineState *ms =3D MACHINE(s);
>      uint32_t *clint_cells;
>      uint32_t cpu_phandle, intc_phandle, phandle =3D 1;
>      char *name, *mem_name, *clint_name, *clust_name;
> @@ -65,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
>          "sifive,clint0", "riscv,clint0"
>      };
>
> -    fdt =3D mc->fdt =3D create_device_tree(&fdt_size);
> +    fdt =3D ms->fdt =3D create_device_tree(&fdt_size);
>      if (!fdt) {
>          error_report("create_device_tree() failed");
>          exit(1);
> @@ -96,7 +96,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>      qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
>
> -    for (socket =3D (riscv_socket_count(mc) - 1); socket >=3D 0; socket-=
-) {
> +    for (socket =3D (riscv_socket_count(ms) - 1); socket >=3D 0; socket-=
-) {
>          clust_name =3D g_strdup_printf("/cpus/cpu-map/cluster%d", socket=
);
>          qemu_fdt_add_subnode(fdt, clust_name);
>
> @@ -121,7 +121,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
>              qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
>                  s->soc[socket].hartid_base + cpu);
>              qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu")=
;
> -            riscv_socket_fdt_write_id(mc, cpu_name, socket);
> +            riscv_socket_fdt_write_id(ms, cpu_name, socket);
>              qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle)=
;
>
>              intc_name =3D g_strdup_printf("%s/interrupt-controller", cpu=
_name);
> @@ -147,14 +147,14 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
>              g_free(cpu_name);
>          }
>
> -        addr =3D memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(mc, s=
ocket);
> -        size =3D riscv_socket_mem_size(mc, socket);
> +        addr =3D memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(ms, s=
ocket);
> +        size =3D riscv_socket_mem_size(ms, socket);
>          mem_name =3D g_strdup_printf("/memory@%lx", (long)addr);
>          qemu_fdt_add_subnode(fdt, mem_name);
>          qemu_fdt_setprop_cells(fdt, mem_name, "reg",
>              addr >> 32, addr, size >> 32, size);
>          qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
> -        riscv_socket_fdt_write_id(mc, mem_name, socket);
> +        riscv_socket_fdt_write_id(ms, mem_name, socket);
>          g_free(mem_name);
>
>          clint_addr =3D memmap[SPIKE_CLINT].base +
> @@ -167,14 +167,14 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
>              0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
>          qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
>              clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4=
);
> -        riscv_socket_fdt_write_id(mc, clint_name, socket);
> +        riscv_socket_fdt_write_id(ms, clint_name, socket);
>
>          g_free(clint_name);
>          g_free(clint_cells);
>          g_free(clust_name);
>      }
>
> -    riscv_socket_fdt_write_distance_matrix(mc);
> +    riscv_socket_fdt_write_distance_matrix(ms);
>
>      qemu_fdt_add_subnode(fdt, "/chosen");
>      qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
> --
> 2.39.0
>
>

