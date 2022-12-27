Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pADpf-0006OZ-CG
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 12:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADpd-0006Ne-4u
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 12:33:41 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADpb-00009q-6k
 for qemu-riscv@nongnu.org; Tue, 27 Dec 2022 12:33:40 -0500
Received: by mail-oi1-x231.google.com with SMTP id e205so12932394oif.11
 for <qemu-riscv@nongnu.org>; Tue, 27 Dec 2022 09:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJ17tO4guIb10QHB81eN40Ok+A//v6Pf9+g8d764zyc=;
 b=EcNYrbEtVAc4QqY8yXpglmO5UETexbJH5XRlRiBO40eaZqMb/DclEAqvSyfuoBYwmO
 5odybQuefl6Rs8A8zaxYo3f0EXXUqeMWxnwUQQjjYhIuaK24DJkX/M7CH2GsvtWcr/CG
 TrBoUY29M/k5A3SAaT5byrdgb6IEqmmFhJVl9weatlU6wG4a8rJ6BRnRY6KKrPnoNw7j
 s6hIxMfQ1HPIvdrZoT5fqyDgP4KUZ+/x8rvcSks2hQMKWVapHmIL/jlexdDI32gSeLT0
 +udCKvI+cS1eNlsVr+KZZO3u4odclymWruEQn1ELqv15Xt02pptL2CVbalksNv52M3Ai
 ssmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJ17tO4guIb10QHB81eN40Ok+A//v6Pf9+g8d764zyc=;
 b=z/OrKZJLiuinADKItMRah/fyMH4Hlk7Re4ZqUbIaNMceX09wdwBB4/6oGQTco50xjK
 ySX3LvWfrJ/2JGhy29yFUux43VDQvlvmNChB82nTDX6p6x3sySAb42+U3jHcNKkwb3a7
 DxxJkhKrOSMCchk9b0l49MsKMDrLBHglPCQtlWnmSKidOncRKcstP5sa7NjdOfx25KRs
 uWE3eWIh2Hc0zE6NA9PmtTKeZZp2WC1xQ7Ll80kKVFs685eGH4xHKkaNwNAqMVgIxVRU
 v/GUREZ9nASD3eZ/fe5I3zCoux1C33wcO+DcBWi3dDFSICfdKHMZD7ks1gKOQrPtyPhy
 EgyA==
X-Gm-Message-State: AFqh2krC6CXd9NuPnnaYfJlHtr8VWKwO6B58ie5h8YSurQhCDxNJf2+d
 eOWi2NR7otbByAfGp/P/VpOWvA==
X-Google-Smtp-Source: AMrXdXstJwIIxWd3EehIF/PYD4PKh0sjhWAXoMEBQzcfbLgk9YCYu2g+8zzMu550xbsrNsmr27ymMg==
X-Received: by 2002:a05:6808:2222:b0:35b:dea6:18fa with SMTP id
 bd34-20020a056808222200b0035bdea618famr13363290oib.36.1672162417296; 
 Tue, 27 Dec 2022 09:33:37 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056830334a00b0066eb4e9242esm6773702ott.67.2022.12.27.09.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:33:36 -0800 (PST)
Message-ID: <90ea5cc0-f185-7497-0b64-440ae95b249c@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:33:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 05/12] hw/char: riscv_htif: Move registers from
 CPUArchState to HTIFState
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-6-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-6-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 27 Dec 2022 17:33:41 -0000



On 12/27/22 03:48, Bin Meng wrote:
> At present for some unknown reason the HTIF registers (fromhost &
> tohost) are defined in the RISC-V CPUArchState. It should really
> be put in the HTIFState struct as it is only meaningful to HTIF.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   include/hw/char/riscv_htif.h |  8 ++++----
>   target/riscv/cpu.h           |  4 ----
>   hw/char/riscv_htif.c         | 35 +++++++++++++++++------------------
>   hw/riscv/spike.c             |  3 +--
>   target/riscv/machine.c       |  6 ++----
>   5 files changed, 24 insertions(+), 32 deletions(-)
>
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index 6d172ebd6d..55cc352331 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -23,7 +23,6 @@
>   #include "chardev/char.h"
>   #include "chardev/char-fe.h"
>   #include "exec/memory.h"
> -#include "target/riscv/cpu.h"
>   
>   #define TYPE_HTIF_UART "riscv.htif.uart"
>   
> @@ -31,11 +30,12 @@ typedef struct HTIFState {
>       int allow_tohost;
>       int fromhost_inprogress;
>   
> +    uint64_t tohost;
> +    uint64_t fromhost;
>       hwaddr tohost_offset;
>       hwaddr fromhost_offset;
>       MemoryRegion mmio;
>   
> -    CPURISCVState *env;
>       CharBackend chr;
>       uint64_t pending_read;
>   } HTIFState;
> @@ -51,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>   bool htif_uses_elf_symbols(void);
>   
>   /* legacy pre qom */
> -HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> -                        Chardev *chr, uint64_t nonelf_base);
> +HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> +                        uint64_t nonelf_base);
>   
>   #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 443d15a47c..6f04d853dd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -309,10 +309,6 @@ struct CPUArchState {
>       target_ulong sscratch;
>       target_ulong mscratch;
>   
> -    /* temporary htif regs */
> -    uint64_t mfromhost;
> -    uint64_t mtohost;
> -
>       /* Sstc CSRs */
>       uint64_t stimecmp;
>   
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index f28976b110..3bb0a37a3e 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -100,7 +100,7 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
>       uint64_t val_written = s->pending_read;
>       uint64_t resp = 0x100 | *buf;
>   
> -    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->fromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
>   }
>   
>   /*
> @@ -175,7 +175,7 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>           if (cmd == HTIF_CONSOLE_CMD_GETC) {
>               /* this should be a queue, but not yet implemented as such */
>               s->pending_read = val_written;
> -            s->env->mtohost = 0; /* clear to indicate we read */
> +            s->tohost = 0; /* clear to indicate we read */
>               return;
>           } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
>               qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
> @@ -195,11 +195,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>        * HTIF needs protocol documentation and a more complete state machine.
>        *
>        *  while (!s->fromhost_inprogress &&
> -     *      s->env->mfromhost != 0x0) {
> +     *      s->fromhost != 0x0) {
>        *  }
>        */
> -    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> -    s->env->mtohost = 0; /* clear to indicate we read */
> +    s->fromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->tohost = 0; /* clear to indicate we read */
>   }
>   
>   #define TOHOST_OFFSET1      (s->tohost_offset)
> @@ -212,13 +212,13 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>   {
>       HTIFState *s = opaque;
>       if (addr == TOHOST_OFFSET1) {
> -        return s->env->mtohost & 0xFFFFFFFF;
> +        return s->tohost & 0xFFFFFFFF;
>       } else if (addr == TOHOST_OFFSET2) {
> -        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
> +        return (s->tohost >> 32) & 0xFFFFFFFF;
>       } else if (addr == FROMHOST_OFFSET1) {
> -        return s->env->mfromhost & 0xFFFFFFFF;
> +        return s->fromhost & 0xFFFFFFFF;
>       } else if (addr == FROMHOST_OFFSET2) {
> -        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
> +        return (s->fromhost >> 32) & 0xFFFFFFFF;
>       } else {
>           qemu_log("Invalid htif read: address %016" PRIx64 "\n",
>               (uint64_t)addr);
> @@ -232,22 +232,22 @@ static void htif_mm_write(void *opaque, hwaddr addr,
>   {
>       HTIFState *s = opaque;
>       if (addr == TOHOST_OFFSET1) {
> -        if (s->env->mtohost == 0x0) {
> +        if (s->tohost == 0x0) {
>               s->allow_tohost = 1;
> -            s->env->mtohost = value & 0xFFFFFFFF;
> +            s->tohost = value & 0xFFFFFFFF;
>           } else {
>               s->allow_tohost = 0;
>           }
>       } else if (addr == TOHOST_OFFSET2) {
>           if (s->allow_tohost) {
> -            s->env->mtohost |= value << 32;
> -            htif_handle_tohost_write(s, s->env->mtohost);
> +            s->tohost |= value << 32;
> +            htif_handle_tohost_write(s, s->tohost);
>           }
>       } else if (addr == FROMHOST_OFFSET1) {
>           s->fromhost_inprogress = 1;
> -        s->env->mfromhost = value & 0xFFFFFFFF;
> +        s->fromhost = value & 0xFFFFFFFF;
>       } else if (addr == FROMHOST_OFFSET2) {
> -        s->env->mfromhost |= value << 32;
> +        s->fromhost |= value << 32;
>           s->fromhost_inprogress = 0;
>       } else {
>           qemu_log("Invalid htif write: address %016" PRIx64 "\n",
> @@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
>       return (address_symbol_set == 3) ? true : false;
>   }
>   
> -HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
> -                        Chardev *chr, uint64_t nonelf_base)
> +HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
> +                        uint64_t nonelf_base)
>   {
>       uint64_t base, size, tohost_offset, fromhost_offset;
>   
> @@ -281,7 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
>       fromhost_offset = fromhost_addr - base;
>   
>       HTIFState *s = g_new0(HTIFState, 1);
> -    s->env = env;
>       s->tohost_offset = tohost_offset;
>       s->fromhost_offset = fromhost_offset;
>       s->pending_read = 0;
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 82cf41ac27..8606331f61 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -317,8 +317,7 @@ static void spike_board_init(MachineState *machine)
>                                 fdt_load_addr);
>   
>       /* initialize HTIF using symbols found in load_kernel */
> -    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
> -                 serial_hd(0), memmap[SPIKE_HTIF].base);
> +    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
>   }
>   
>   static void spike_machine_instance_init(Object *obj)
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c2a94a82b3..2e8beef06e 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -298,8 +298,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
>   
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 5,
> -    .minimum_version_id = 5,
> +    .version_id = 6,
> +    .minimum_version_id = 6,
>       .post_load = riscv_cpu_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -349,8 +349,6 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, RISCVCPU, RV_MAX_MHPMEVENTS),
>           VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> -        VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> -        VMSTATE_UINT64(env.mtohost, RISCVCPU),
>           VMSTATE_UINT64(env.stimecmp, RISCVCPU),
>   
>           VMSTATE_END_OF_LIST()


