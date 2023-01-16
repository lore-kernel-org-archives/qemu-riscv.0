Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGhl-0000uj-5F
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 23:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGhY-0000sn-Ma; Sun, 15 Jan 2023 23:02:36 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGhW-0002C3-8i; Sun, 15 Jan 2023 23:02:27 -0500
Received: by mail-vs1-xe31.google.com with SMTP id i185so27880652vsc.6;
 Sun, 15 Jan 2023 20:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M2iaegwmrT5K5aEMa0ZkIczVeVodwfUdiZR3a/iMLt0=;
 b=HN8CdHxyLll89w1DZeVEufwuVkYwxovWCFBFP0b8cVfdD3WCb/yosWDfOfXyBS4rw5
 /H8DxGbUPGL7NYLb1ljv6bI77mRrdBk9hKvCghK9EgvZAQ78ozvgz7YWKAiSSQNGq4cj
 ihv6pDiyMFwEyAHTX84llffiKMiFQ5tQ9AGoxAVPXlbPd4P3dn/navca521KumMp9tnI
 Ori7haf+8q9YaNwPUQ2iicQWxkLyQnTN2hneF5O8IoxxSVXffiFo78AbwOCzgz7eaPCj
 eOZdLj1kWBeeefudX1nR9jkOxv8oOBHh6qDjruPetxoM4CmLYY0js9L8Dlg7tkatb3UZ
 eQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M2iaegwmrT5K5aEMa0ZkIczVeVodwfUdiZR3a/iMLt0=;
 b=0pN7Psnqi+Wtzs+TmFDzXtlBO3pK6HcpAOerWhshquAawBtjgBkfrPcAny7WviWitz
 pS6uLhPuHM7xEAUNbpik/EIXk3BgJrI5RRh5Mu1F+536MjmPm4Ccj6ravWIZuaM3v53K
 qwEiOacFeCEa8Eih5k12XL45CEWi4dhvlY5chJLF+yaKF+oyHtpmhrJej9Hu2UIaLQCq
 zWWbk/Ntg0Du1wVPWHFslkin2OrOyaibyDYzid652Xu3ElRD64KEQ3uNNZZz+G0auj6E
 Fxot2ZE0iA1dDGKLzuChwsEk0CxQTovyQdKdiLv+ZeH65ZSlNNOgcYv50K4dbNdZRoOT
 WsTg==
X-Gm-Message-State: AFqh2krofQHEnQl3RJZPCfEunywUys6Yn4/JB6f//ZtFLneTLLoeFtvk
 kuzAmn2pg6Oh/qx1nDMK97ovIomE51oM+2ugagM=
X-Google-Smtp-Source: AMrXdXvfqHjMrTiyI3ry6F1gGpjoIZDrFppLYtrtZGRCor899FYeGoycHg/ELkuJbh5dHvpgWFTaFyRDrHrOGRSo3fM=
X-Received: by 2002:a67:e052:0:b0:3d0:c2e9:cb77 with SMTP id
 n18-20020a67e052000000b003d0c2e9cb77mr3018866vsl.54.1673841744844; Sun, 15
 Jan 2023 20:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
 <20230111170948.316276-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230111170948.316276-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 14:01:58 +1000
Message-ID: <CAKmqyKPxKuE1eEk-=zSpbCHfbi=mb+_eEvxsK0PU2QY31=OT=g@mail.gmail.com>
Subject: Re: [PATCH 05/10] hw/riscv: use MachineState::fdt in
 riscv_socket_fdt_write_id()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 04:02:38 -0000

On Thu, Jan 12, 2023 at 3:28 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> There's no need to use a MachineState pointer and a fdt pointer now that
> all RISC-V machines are using the FDT from the MachineState.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/numa.c         |  6 +++---
>  hw/riscv/spike.c        |  6 +++---
>  hw/riscv/virt.c         | 18 +++++++++---------
>  include/hw/riscv/numa.h |  6 +++---
>  4 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 7fe92d402f..f4343f5cde 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -156,11 +156,11 @@ uint64_t riscv_socket_mem_size(const MachineState *ms, int socket_id)
>              ms->numa_state->nodes[socket_id].node_mem : 0;
>  }
>
> -void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
> -                               const char *node_name, int socket_id)
> +void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
> +                               int socket_id)
>  {
>      if (numa_enabled(ms)) {
> -        qemu_fdt_setprop_cell(fdt, node_name, "numa-node-id", socket_id);
> +        qemu_fdt_setprop_cell(ms->fdt, node_name, "numa-node-id", socket_id);
>      }
>  }
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 4a66016d69..05d34651cb 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -121,7 +121,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>              qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
>                  s->soc[socket].hartid_base + cpu);
>              qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
> -            riscv_socket_fdt_write_id(mc, fdt, cpu_name, socket);
> +            riscv_socket_fdt_write_id(mc, cpu_name, socket);
>              qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
>
>              intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
> @@ -154,7 +154,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>          qemu_fdt_setprop_cells(fdt, mem_name, "reg",
>              addr >> 32, addr, size >> 32, size);
>          qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
> -        riscv_socket_fdt_write_id(mc, fdt, mem_name, socket);
> +        riscv_socket_fdt_write_id(mc, mem_name, socket);
>          g_free(mem_name);
>
>          clint_addr = memmap[SPIKE_CLINT].base +
> @@ -167,7 +167,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>              0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
>          qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
>              clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> -        riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
> +        riscv_socket_fdt_write_id(mc, clint_name, socket);
>
>          g_free(clint_name);
>          g_free(clint_cells);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 99a0a43a73..1d3bd25cb5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -253,7 +253,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
>              s->soc[socket].hartid_base + cpu);
>          qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
> -        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
> +        riscv_socket_fdt_write_id(mc, cpu_name, socket);
>          qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
>
>          intc_phandles[cpu] = (*phandle)++;
> @@ -291,7 +291,7 @@ static void create_fdt_socket_memory(RISCVVirtState *s,
>      qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
>          addr >> 32, addr, size >> 32, size);
>      qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
> -    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
> +    riscv_socket_fdt_write_id(mc, mem_name, socket);
>      g_free(mem_name);
>  }
>
> @@ -327,7 +327,7 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
>          0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
>      qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
>          clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
> -    riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
> +    riscv_socket_fdt_write_id(mc, clint_name, socket);
>      g_free(clint_name);
>
>      g_free(clint_cells);
> @@ -372,7 +372,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
>              aclint_mswi_cells, aclint_cells_size);
>          qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
> -        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
> +        riscv_socket_fdt_write_id(mc, name, socket);
>          g_free(name);
>      }
>
> @@ -396,7 +396,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
>          0x0, RISCV_ACLINT_DEFAULT_MTIME);
>      qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
>          aclint_mtimer_cells, aclint_cells_size);
> -    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
> +    riscv_socket_fdt_write_id(mc, name, socket);
>      g_free(name);
>
>      if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
> @@ -412,7 +412,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
>              aclint_sswi_cells, aclint_cells_size);
>          qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
> -        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
> +        riscv_socket_fdt_write_id(mc, name, socket);
>          g_free(name);
>      }
>
> @@ -471,7 +471,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>          0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
>                            VIRT_IRQCHIP_NUM_SOURCES - 1);
> -    riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
> +    riscv_socket_fdt_write_id(mc, plic_name, socket);
>      qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
>          plic_phandles[socket]);
>
> @@ -663,7 +663,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>          aplic_s_phandle);
>      qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
>          aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
> -    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
> +    riscv_socket_fdt_write_id(mc, aplic_name, socket);
>      qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandle);
>      g_free(aplic_name);
>
> @@ -691,7 +691,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
>          0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
>      qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
>          VIRT_IRQCHIP_NUM_SOURCES);
> -    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
> +    riscv_socket_fdt_write_id(mc, aplic_name, socket);
>      qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandle);
>
>      if (!socket) {
> diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
> index 1a9cce3344..634df6673f 100644
> --- a/include/hw/riscv/numa.h
> +++ b/include/hw/riscv/numa.h
> @@ -90,10 +90,10 @@ bool riscv_socket_check_hartids(const MachineState *ms, int socket_id);
>   * @ms: pointer to machine state
>   * @socket_id: socket index
>   *
> - * Write NUMA node-id FDT property for given FDT node
> + * Write NUMA node-id FDT property in MachineState->fdt
>   */
> -void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
> -                               const char *node_name, int socket_id);
> +void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
> +                               int socket_id);
>
>  /**
>   * riscv_socket_fdt_write_distance_matrix:
> --
> 2.39.0
>
>

