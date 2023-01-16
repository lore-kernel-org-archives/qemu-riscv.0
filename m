Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGaW-0006iX-JF
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 22:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGaU-0006hq-6u; Sun, 15 Jan 2023 22:55:10 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGaS-0001BG-Rk; Sun, 15 Jan 2023 22:55:09 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id 3so27861741vsq.7;
 Sun, 15 Jan 2023 19:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4uxeO3Ibpb7NyPQHwBJX49btxBwrJwpNKMDlHoHJg9o=;
 b=qD+XS6rnF5zJTdC14kBLEOKak9a4+XzEo01cSn3O9Uwg+H33v1YcEe513NO/A7qXud
 NS6Pvd8lP+8gqUrSY/MiuT081H4gESC7x5iRPzoH047cKQVSvkbYH+eCS/3RC1hfg8u2
 vFji3ppNXdgsw8dxa7fzlk3cz2Z5o0lUXeIm4F2D8ZddRp8H9lt2LI40t0awymy4rrTw
 dFs59p3O1DjmWQQmMp1cOuHipJ7WjTX2PF96TLy8mzKpeSr0NfiLle9lwe4sHmLPXDfv
 XqblZO40bVQM3o5yO0GlnQltYv3OY+5TRKSBrMBTd7ASPLk3gdDOIVct8QbCI8Uo8D/D
 C9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4uxeO3Ibpb7NyPQHwBJX49btxBwrJwpNKMDlHoHJg9o=;
 b=vOC8ahmKCwMJi0X2VRz5i4mDxpeP+xrshS6GeOTrqHl7wGOzvm73qjwdBAxbKJQC8c
 WlIlefuomr3wAbi2Lbbg69g3Cr7O0XV2c5+qJC6x9RAaOySsbfTkByLkFlcFsX/NYAeY
 n7aXnwNkrldNzmQi+7j7XM8C1TxhB8xf67I9WaVBp2PcHSeJ6rx3MDPPxGNGazuG+3xt
 TczP9AZNMQciLTGHKopca19oOxed7msXkVDLuyRKj4K0fln5GbkM3BM5mYz3GVTWGEF+
 3ap2wzgQQE6mz5EuVGZSOXwGCn+pKAgig/O5Uu1GjFbuKA+1EKG5zexJHzzfsdy6N27o
 NtfA==
X-Gm-Message-State: AFqh2kpoQZ6kL//xreOMUIrKB9aqlJxijjdpKN3DkpbbDHswnjIgd7/q
 JO7Y+gVB59ZqCeieNC/1oJ451NMnI3+QIiiflaY=
X-Google-Smtp-Source: AMrXdXtUO0UaEp6xYuhsI30me4yd8CkXNqnNepmTfWxb9hXa++1QCZ+7cythE6Pk/P6mNZCdtfSjwpFYV0h1FIoNb4Q=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr10388516vsv.73.1673841307579; Sun, 15
 Jan 2023 19:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
 <20230111170948.316276-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230111170948.316276-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 13:54:41 +1000
Message-ID: <CAKmqyKO6a0CCcprmbcReXBV_q8_+2-v1ndwB1-5e0_FwmoDG+A@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt.c: simplify create_fdt()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 03:55:10 -0000

On Thu, Jan 12, 2023 at 3:18 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'mem_size' and 'cmdline' aren't being used. Remove them.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a931ed05ab..89c99ec1af 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -999,7 +999,7 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
>  }
>
>  static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
> -                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> +                       bool is_32_bit)
>  {
>      MachineState *mc = MACHINE(s);
>      uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
> @@ -1499,8 +1499,7 @@ static void virt_machine_init(MachineState *machine)
>      virt_flash_map(s, system_memory);
>
>      /* create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> +    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]));
>
>      s->machine_done.notify = virt_machine_done;
>      qemu_add_machine_init_done_notifier(&s->machine_done);
> --
> 2.39.0
>
>

