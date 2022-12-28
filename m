Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pANvZ-0006M9-1I
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 23:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANvW-0006Lp-V7; Tue, 27 Dec 2022 23:20:26 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANvV-0001l3-1m; Tue, 27 Dec 2022 23:20:26 -0500
Received: by mail-vs1-xe30.google.com with SMTP id h27so815756vsq.3;
 Tue, 27 Dec 2022 20:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WXhq6p6K8/o8RQx6lSskmJKBpyTSz018myzA/cngw5U=;
 b=CvfMd1fUq5k/OctEvswJv40iGgQjMYhrmCaT1QgfQ/7wLAZpAEpYu7mF1Z/fVAyRqR
 L7e+KOWwFqbJdcSHIzjhH0L0L5GQYwl5zLyc4zza63zTzTjcIloFOhsO7g58327kBNLk
 I9POTI8ISfIUInnMc/DFjupTp51bMnORC4JItC9qtNikqH77OVLQEyzNTA1OhrshwiSF
 Kzpkk+4/lhHWzx5ns+zOqSYQUkT57eJVymRpvL30H8r2oea1D4iq0wU3EoqGfSMPptrI
 p6B+ES1YpRcaxgnb4hAsZI4nVNqKxrJtSSapnMnlMGgOPvTfC+II4e/JkxSaMi4OxGs1
 fAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WXhq6p6K8/o8RQx6lSskmJKBpyTSz018myzA/cngw5U=;
 b=UhBZ8c5renbdkOkUkbqsbHGhhKQw3BAl2K558fb4VWXhqtEd65NS9MaXcAaID835XZ
 mEWOudzR2sP3fUwS/RKLXmLQ9tinobFrffaskDAeDCq958nNgXrLRhi75nlIp/tuCLnJ
 KYSMDkfSxWBlcGi0JuDD2tOgSf8pE8A7J/lPNAKEZ94Bk6yHmax06Y3W9/JFQY5+41Ia
 lDVea5SaZFePBQxtfhf6XUfCuyAZLo93S6gPb8/Z8KNdJh9tzRYAG6w3D3+e09tAxdQF
 eYxHyUXPWmvxXUY7mizV67purwE1C6f0NFSsdLcUM9Sak2YVJfMfz5HK+43+N5pcN38k
 tF0A==
X-Gm-Message-State: AFqh2krJaIB/5SL4X3C0GIo0Qc1tw3f3ovrWW7pk6JugVuMq1/Va1LUk
 p2rDrjs/rEQfSv6v48e0qiV/g8bHyJLBcd2Txhg=
X-Google-Smtp-Source: AMrXdXvVXOE3WyMn7OlFVFAICwdKPa+lLtLa3GC+WedOEiV6jXQyDCE7/O4H1s12nPiLTCjjpQL6jAeSmaC3DcNYD0w=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr2668339vsb.10.1672201223496; Tue, 27
 Dec 2022 20:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-6-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-6-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:19:57 +1000
Message-ID: <CAKmqyKPevB4g2m3qk_g4xXNn2EX4OMhvkB3DaME0bLjwAjtYZg@mail.gmail.com>
Subject: Re: [PATCH 05/12] hw/char: riscv_htif: Move registers from
 CPUArchState to HTIFState
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 04:20:27 -0000

On Tue, Dec 27, 2022 at 4:55 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> At present for some unknown reason the HTIF registers (fromhost &
> tohost) are defined in the RISC-V CPUArchState. It should really
> be put in the HTIFState struct as it is only meaningful to HTIF.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/char/riscv_htif.h |  8 ++++----
>  target/riscv/cpu.h           |  4 ----
>  hw/char/riscv_htif.c         | 35 +++++++++++++++++------------------
>  hw/riscv/spike.c             |  3 +--
>  target/riscv/machine.c       |  6 ++----
>  5 files changed, 24 insertions(+), 32 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 6d172ebd6d..55cc352331 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -23,7 +23,6 @@
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
>  #include "exec/memory.h"
> -#include "target/riscv/cpu.h"
>
>  #define TYPE_HTIF_UART "riscv.htif.uart"
>
> @@ -31,11 +30,12 @@ typedef struct HTIFState {
>      int allow_tohost;
>      int fromhost_inprogress;
>
> +    uint64_t tohost;
> +    uint64_t fromhost;
>      hwaddr tohost_offset;
>      hwaddr fromhost_offset;
>      MemoryRegion mmio;
>
> -    CPURISCVState *env;
>      CharBackend chr;
>      uint64_t pending_read;
>  } HTIFState;
> @@ -51,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>  bool htif_uses_elf_symbols(void);
>
>  /* legacy pre qom */
> -HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> -                        Chardev *chr, uint64_t nonelf_base);
> +HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> +                        uint64_t nonelf_base);
>
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 443d15a47c..6f04d853dd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -309,10 +309,6 @@ struct CPUArchState {
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> -    /* temporary htif regs */
> -    uint64_t mfromhost;
> -    uint64_t mtohost;
> -
>      /* Sstc CSRs */
>      uint64_t stimecmp;
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index f28976b110..3bb0a37a3e 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -100,7 +100,7 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
>      uint64_t val_written = s->pending_read;
>      uint64_t resp = 0x100 | *buf;
>
> -    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->fromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
>  }
>
>  /*
> @@ -175,7 +175,7 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>          if (cmd == HTIF_CONSOLE_CMD_GETC) {
>              /* this should be a queue, but not yet implemented as such */
>              s->pending_read = val_written;
> -            s->env->mtohost = 0; /* clear to indicate we read */
> +            s->tohost = 0; /* clear to indicate we read */
>              return;
>          } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
>              qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
> @@ -195,11 +195,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>       * HTIF needs protocol documentation and a more complete state machine.
>       *
>       *  while (!s->fromhost_inprogress &&
> -     *      s->env->mfromhost != 0x0) {
> +     *      s->fromhost != 0x0) {
>       *  }
>       */
> -    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> -    s->env->mtohost = 0; /* clear to indicate we read */
> +    s->fromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->tohost = 0; /* clear to indicate we read */
>  }
>
>  #define TOHOST_OFFSET1      (s->tohost_offset)
> @@ -212,13 +212,13 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>  {
>      HTIFState *s = opaque;
>      if (addr == TOHOST_OFFSET1) {
> -        return s->env->mtohost & 0xFFFFFFFF;
> +        return s->tohost & 0xFFFFFFFF;
>      } else if (addr == TOHOST_OFFSET2) {
> -        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
> +        return (s->tohost >> 32) & 0xFFFFFFFF;
>      } else if (addr == FROMHOST_OFFSET1) {
> -        return s->env->mfromhost & 0xFFFFFFFF;
> +        return s->fromhost & 0xFFFFFFFF;
>      } else if (addr == FROMHOST_OFFSET2) {
> -        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
> +        return (s->fromhost >> 32) & 0xFFFFFFFF;
>      } else {
>          qemu_log("Invalid htif read: address %016" PRIx64 "\n",
>              (uint64_t)addr);
> @@ -232,22 +232,22 @@ static void htif_mm_write(void *opaque, hwaddr addr,
>  {
>      HTIFState *s = opaque;
>      if (addr == TOHOST_OFFSET1) {
> -        if (s->env->mtohost == 0x0) {
> +        if (s->tohost == 0x0) {
>              s->allow_tohost = 1;
> -            s->env->mtohost = value & 0xFFFFFFFF;
> +            s->tohost = value & 0xFFFFFFFF;
>          } else {
>              s->allow_tohost = 0;
>          }
>      } else if (addr == TOHOST_OFFSET2) {
>          if (s->allow_tohost) {
> -            s->env->mtohost |= value << 32;
> -            htif_handle_tohost_write(s, s->env->mtohost);
> +            s->tohost |= value << 32;
> +            htif_handle_tohost_write(s, s->tohost);
>          }
>      } else if (addr == FROMHOST_OFFSET1) {
>          s->fromhost_inprogress = 1;
> -        s->env->mfromhost = value & 0xFFFFFFFF;
> +        s->fromhost = value & 0xFFFFFFFF;
>      } else if (addr == FROMHOST_OFFSET2) {
> -        s->env->mfromhost |= value << 32;
> +        s->fromhost |= value << 32;
>          s->fromhost_inprogress = 0;
>      } else {
>          qemu_log("Invalid htif write: address %016" PRIx64 "\n",
> @@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
>      return (address_symbol_set == 3) ? true : false;
>  }
>
> -HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> -                        Chardev *chr, uint64_t nonelf_base)
> +HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> +                        uint64_t nonelf_base)
>  {
>      uint64_t base, size, tohost_offset, fromhost_offset;
>
> @@ -281,7 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
>      fromhost_offset = fromhost_addr - base;
>
>      HTIFState *s = g_new0(HTIFState, 1);
> -    s->env = env;
>      s->tohost_offset = tohost_offset;
>      s->fromhost_offset = fromhost_offset;
>      s->pending_read = 0;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 82cf41ac27..8606331f61 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -317,8 +317,7 @@ static void spike_board_init(MachineState *machine)
>                                fdt_load_addr);
>
>      /* initialize HTIF using symbols found in load_kernel */
> -    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
> -                 serial_hd(0), memmap[SPIKE_HTIF].base);
> +    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
>  }
>
>  static void spike_machine_instance_init(Object *obj)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c2a94a82b3..2e8beef06e 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -298,8 +298,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
>
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
> -    .version_id = 5,
> -    .minimum_version_id = 5,
> +    .version_id = 6,
> +    .minimum_version_id = 6,
>      .post_load = riscv_cpu_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -349,8 +349,6 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, RISCVCPU, RV_MAX_MHPMEVENTS),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> -        VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> -        VMSTATE_UINT64(env.mtohost, RISCVCPU),
>          VMSTATE_UINT64(env.stimecmp, RISCVCPU),
>
>          VMSTATE_END_OF_LIST()
> --
> 2.34.1
>
>

