Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hbii7-0008Ca-N7
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jun 2019 05:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hbihz-00088j-S3
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:41:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hbihy-000626-Oj
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:41:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33106)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hbihy-00061L-I8
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:41:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so1824648wru.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Jun 2019 02:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sEWBGp8G/UULxSDitnnJIXQ9jsKma8nu50a+q3IMm4U=;
 b=nBlZ496W1fMp+8VwQvYuC5vMoKzqPkG8aKNFGtdiF4c+/301pJZDAeitFYfIhl4oId
 /tzea7yc+iPaC32PS/RvmmMBbEWlf6qkepcVd6saNKQnAenqnYLFwQOrJZ1VuIaOC7uz
 6JHwqxxqZEowZscNLIoAUVn37XVSlGVkMjboRbguuwRJmmQZEvLTlbMFtUHV9yjOhpvG
 J+zsvUe1TagrysP21XQZI8UyGRv3LVt44Wx+pv0DWlZuUmegCgW/ygpXjvNkHofxOpWJ
 a2e7c74GGjedMLd49mLfU9lKVqVQesXCwMNJMm87l3jUMYSfi76qHj8sSiEgiTeuk/fh
 +TPg==
X-Gm-Message-State: APjAAAV098nKomezAwJZthhyJdPhW1OVLP639/WuZOW67CilD73INRiH
 UcOGWXWp0wXPfTLSs4zFmYTDpg==
X-Google-Smtp-Source: APXvYqwZv/gF4TSR9gcOXHS6hnSKTL8pP1mtl+OC3fesqqwNdXY7i5zFjtIZXyGtCKwIO4kXumC/8w==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr122790wrw.131.1560505277063; 
 Fri, 14 Jun 2019 02:41:17 -0700 (PDT)
Received: from localhost ([83.137.6.186])
 by smtp.gmail.com with ESMTPSA id k125sm3380586wmf.41.2019.06.14.02.41.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 02:41:16 -0700 (PDT)
Date: Fri, 14 Jun 2019 02:41:16 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Jun 2019 02:41:10 PDT (-0700)
In-Reply-To: <7e9b4a6cc07a931e62da9c18c40849690eef7150.1558131003.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-d2259f3e-29d6-47f5-b6a8-7b9224ae7a4e@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-riscv] [PATCH v1 4/4] target/riscv: Implement
 riscv_cpu_unassigned_access
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
X-List-Received-Date: Fri, 14 Jun 2019 09:41:22 -0000

On Fri, 17 May 2019 15:11:06 PDT (-0700), Alistair Francis wrote:
> From: Michael Clark <mjc@sifive.com>
>
> This patch adds support for the riscv_cpu_unassigned_access call
> and will raise a load or store access fault.
>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> [Changes by AF:
>  - Squash two patches and rewrite commit message
>  - Set baddr to the access address
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_helper.c | 16 ++++++++++++++++
>  3 files changed, 19 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b7675707e0..bfe92235d3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -356,6 +356,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      cc->gdb_stop_before_watchpoint = true;
>      cc->disas_set_info = riscv_cpu_disas_set_info;
>  #ifndef CONFIG_USER_ONLY
> +    cc->do_unassigned_access = riscv_cpu_unassigned_access;
>      cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
>      cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c17184f4e4..8250175811 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -264,6 +264,8 @@ void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr);
> +void riscv_cpu_unassigned_access(CPUState *cpu, hwaddr addr, bool is_write,
> +                                 bool is_exec, int unused, unsigned size);
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 41d6db41c3..202b6f021d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -356,6 +356,22 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      return phys_addr;
>  }
>
> +void riscv_cpu_unassigned_access(CPUState *cs, hwaddr addr, bool is_write,
> +                                 bool is_exec, int unused, unsigned size)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (is_write) {
> +        cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> +    } else {
> +        cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> +    }
> +
> +    env->badaddr = addr;
> +    riscv_raise_exception(&cpu->env, cs->exception_index, GETPC());
> +}
> +
>  void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                     MMUAccessType access_type, int mmu_idx,
>                                     uintptr_t retaddr)

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

