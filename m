Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pANCo-0006zn-Qc
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 22:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANCm-0006ub-M6; Tue, 27 Dec 2022 22:34:12 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANCl-0004Hj-1O; Tue, 27 Dec 2022 22:34:12 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id k4so10371428vsc.4;
 Tue, 27 Dec 2022 19:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vG4pclImSVJBqrYwLDUKcSVN4T35KUaUPedZmhQ2+fs=;
 b=cGfZrYaoXO5pMRxSdAqeGsglQoAnrc3F5H3vcS07F5PoBkQ9BR4mSkiwctx0oBobLT
 lNLapTyzgIZlclYGm9H8MCFemWQ2a3cNFbxA7EZQAn322lP9Lj71CPzsRIsKjbO1Hci1
 9V5Nz7DzJdkXMZx7R3NO2iVbx8FauDEAzPztbuXU+UbWsdoFmVr2clYwni50D52CRM7Z
 5dVlslMt0LXqCdnuRZY8PYQe3eC3CpmBKfsvChPS/wzRFGrtz3p3aZvlHfAYn+5w8WP8
 A+mzSjXi64Gg7+pKDZ44GQUzxQnWCcX9OH+UGqVkjP2MQHNzYRc8h5enTdAzt5q1NuVT
 mUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vG4pclImSVJBqrYwLDUKcSVN4T35KUaUPedZmhQ2+fs=;
 b=uV230OazRPf+RcIPkPF8Sk/ZGgxhXiAesy48ZG1qNdM3D7ChoBTbwCRZURo4nomi/E
 6OGJ2mdMNYutVD7ebQpcfDQshIiCyAfhH7CDRgsEub3Y6ZJfLedeT8STn52020MR7twe
 FxBOf178ENE4eytDtrYkIEdUpG4dHgCPkk77VC6i4/jDwjgNfh0qS0RRU4QTo+UN1Z1u
 PLfOp/jgmE+RvC/fh60vdDxJ3aWUuzFsUMdp0XvbqXMFp1pVtLVxH3xjjiKSV8VQlvqt
 kCDXVBKEPKGBvw6qyjClZv02SpfTjZWp5nXCPouE+TNeMXuobJuMNTvNHSF5LYnGJCkq
 1AAA==
X-Gm-Message-State: AFqh2kpsG7GEN7epthnwY4DGuVLWJ3jcYkq3R1fTw7p/JgKZRxyEQzcW
 lwq2ufRmMHD4EjeTuz7RNWMjLtIlsFrPcVsTkuGqo5CK4Z8=
X-Google-Smtp-Source: AMrXdXsp6KboD+4O4fPJNp89pS7PGmc7oWMiQwYVAxVqi4AsUD1t+89LhrUbMDsnqYi/iQvpvl2vaVB9t0NtMGIkdiU=
X-Received: by 2002:a67:be0f:0:b0:3c7:c5d9:b841 with SMTP id
 x15-20020a67be0f000000b003c7c5d9b841mr869178vsq.64.1672198449745; Tue, 27 Dec
 2022 19:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-4-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-4-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 13:33:43 +1000
Message-ID: <CAKmqyKNRk4LL7wdUp=-pf7QoS8zZ+=ux-26YdOp6JjwPQmea3w@mail.gmail.com>
Subject: Re: [PATCH 03/12] hw/char: riscv_htif: Drop useless assignment of
 memory region
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
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
X-List-Received-Date: Wed, 28 Dec 2022 03:34:13 -0000

On Tue, Dec 27, 2022 at 4:50 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> struct HTIFState has 3 members for address space and memory region,
> and are initialized during htif_mm_init(). But they are actually
> useless. Drop them.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/char/riscv_htif.h | 7 ++-----
>  hw/char/riscv_htif.c         | 7 ++-----
>  hw/riscv/spike.c             | 5 ++---
>  3 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 3eccc1914f..6d172ebd6d 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -34,9 +34,6 @@ typedef struct HTIFState {
>      hwaddr tohost_offset;
>      hwaddr fromhost_offset;
>      MemoryRegion mmio;
> -    MemoryRegion *address_space;
> -    MemoryRegion *main_mem;
> -    void *main_mem_ram_ptr;
>
>      CPURISCVState *env;
>      CharBackend chr;
> @@ -54,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>  bool htif_uses_elf_symbols(void);
>
>  /* legacy pre qom */
> -HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> -    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
> +HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> +                        Chardev *chr, uint64_t nonelf_base);
>
>  #endif
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 088556bb04..e7e319ca1d 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
>      return (address_symbol_set == 3) ? true : false;
>  }
>
> -HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> -    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
> +HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> +                        Chardev *chr, uint64_t nonelf_base)
>  {
>      uint64_t base, size, tohost_offset, fromhost_offset;
>
> @@ -281,9 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
>      fromhost_offset = fromhost_addr - base;
>
>      HTIFState *s = g_new0(HTIFState, 1);
> -    s->address_space = address_space;
> -    s->main_mem = main_mem;
> -    s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
>      s->env = env;
>      s->tohost_offset = tohost_offset;
>      s->fromhost_offset = fromhost_offset;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 1e1d752c00..82cf41ac27 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -317,9 +317,8 @@ static void spike_board_init(MachineState *machine)
>                                fdt_load_addr);
>
>      /* initialize HTIF using symbols found in load_kernel */
> -    htif_mm_init(system_memory, mask_rom,
> -                 &s->soc[0].harts[0].env, serial_hd(0),
> -                 memmap[SPIKE_HTIF].base);
> +    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
> +                 serial_hd(0), memmap[SPIKE_HTIF].base);
>  }
>
>  static void spike_machine_instance_init(Object *obj)
> --
> 2.34.1
>
>

