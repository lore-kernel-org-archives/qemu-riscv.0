Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGd7-0007d3-Ix
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 22:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGd4-0007cI-Ka; Sun, 15 Jan 2023 22:57:50 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGcn-0001bC-Cu; Sun, 15 Jan 2023 22:57:34 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id k4so27843141vsc.4;
 Sun, 15 Jan 2023 19:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=54s5sY9wHfUM7Myt1094eNvwMqve0Qi7RZp9Mc8ByHs=;
 b=YW4xs5ivjHMipAqtQGvnBkTDGgktxPuUES5RQAvbZwuU5AhTZRJrXL3lGRq0RbWQWC
 ofu6tXOGUoCVtfvtoqUfpJecHn79PAyxTfyqMl4RcQ8sVCE6DT6zIruKpX28IVIsOgnN
 xMB7quA+mciAxWjtobce0RR7zIHUU3U8GqzKlb9Np+jDvu+esCD/IbF9EUkTKiRVkOBe
 dZWzAzokv8TtE1jZOQ/HDPzUpV+LD4/YA8/9aMYrV1/jTJuz9ZCWw5Wm05KLHp5Hn2KX
 TrIygDDTjjwvzDVjJmc2K57kHnkPVUedjtNo+ZIEbRuzWtRnHtxEEL5yWmZfom2ruPUw
 BVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54s5sY9wHfUM7Myt1094eNvwMqve0Qi7RZp9Mc8ByHs=;
 b=uvB3GpAS283WVhXjizgXGm0q1s+3EMEwE0bfmbMA25TJRSt8DK6edZwSOOgF55Xoj8
 W0UODto/UF0v6jwyvIK08MiStIURLwF3LvStN44EyOaRjisULqVFOwihB9i4xAF8/mwF
 2kTJ30wmquxg3oA3sgR6txh55h9Rty3PogF58CPiL0t4iXfsmxb3m+Cr2vpHTJTFrE8x
 1StbLG3qUzXvdK2XfN4kQ1NETsr0iv3jGIs1zwhLMzGU84WepELovr1cnrtGH4qK9jVf
 9xibl+3ujyt+ZSOufvlgyhg4HW/ggAABbsPdJmX2TuaYXLLv8xhJzpLTBbQxYeGhr1sn
 40kQ==
X-Gm-Message-State: AFqh2kqV5+9szqCl+gcPtG+CFGfywB3aFxv0fGZ2qaIt1c/h5/kub8xR
 NZjZ1raBo/sAo9BR6/aZTrC39mLL3GRxvVY5kkM=
X-Google-Smtp-Source: AMrXdXvPC65LVXFZRVtfYcSwMEWjlc0tTrMtLkVoCeTBO5lozcnrbsW36W+JUKF75I9zEP1Pg1eGbMAx8yYIDffftYs=
X-Received: by 2002:a67:c508:0:b0:3d3:c7d9:7b62 with SMTP id
 e8-20020a67c508000000b003d3c7d97b62mr443380vsk.72.1673841451896; Sun, 15 Jan
 2023 19:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
 <20230111170948.316276-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230111170948.316276-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 13:57:05 +1000
Message-ID: <CAKmqyKOdXH36_LeEZzELm4NdgqFJe7fZYwJhjf=65o2KZLscNw@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/riscv/sifive_u.c: simplify create_fdt()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 03:57:51 -0000

On Thu, Jan 12, 2023 at 3:25 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'cmdline' isn't being used. Remove it.
>
> A MachineState pointer is being retrieved via a MACHINE() macro calling
> qdev_get_machine(). Use MACHINE(s) instead to avoid calling qdev().
>
>  'mem_size' is being set as machine->ram_size by the caller. Retrieve it
> via ms->ram_size.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 9a75d4aa62..ccad386920 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -94,9 +94,10 @@ static const MemMapEntry sifive_u_memmap[] = {
>  #define GEM_REVISION        0x10070109
>
>  static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
> -                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> +                       bool is_32_bit)
>  {
> -    MachineState *ms = MACHINE(qdev_get_machine());
> +    MachineState *ms = MACHINE(s);
> +    uint64_t mem_size = ms->ram_size;
>      void *fdt;
>      int cpu, fdt_size;
>      uint32_t *cells;
> @@ -560,8 +561,7 @@ static void sifive_u_machine_init(MachineState *machine)
>                            qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
>
>      /* create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc.u_cpus));
> +    create_fdt(s, memmap, riscv_is_32bit(&s->soc.u_cpus));
>
>      if (s->start_in_flash) {
>          /*
> --
> 2.39.0
>
>

