Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7hRX-0000Ww-Jq
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 10:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRH-0000Q5-PH
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRF-0006S8-OK
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41378)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7hRF-0006RT-IB
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id h7so19839596wrw.8
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 07:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RiTHrpgU3B0MiYSbYNW6lylv7KMy24cPo0VecPYJQkA=;
 b=BJhyuP/TuRzgSn767lgRq1H2fQbGWH+bstyRNq19u5ci7FAAOKXjwA/diAyw7yxYV8
 /0SbvMoyjRCP9+RpQ+lwLl4DchX9KN//Thrcjpxd0zMp3YMeGUOdwSbWQ0Vfn5GTV9NZ
 uJk9GxsXZIWUJYS9jQas5IXxOBreF+h3jJHfgACXQptHhX+0QfmZ5b1EkHuZJfvg0ed6
 MJ7sWDZ805yMeixB3wmxD1UNlA1cKEDL+MVAX7GQXX388YdLdpl7lq3Hr2CYXKnlMPTQ
 J9r2u3wdQXkF8Mbwl/2lXbvEhEuRDW0XQpnLRMPECeMk6g4LhkZHuXH2jmoRP5711+KW
 16mA==
X-Gm-Message-State: APjAAAWAXmcZhi91NWa6kM17vC0ratIYh1fQf0LMJ/w8CdGRcP4+PJmC
 wrx8v6ZLTJVmfndPReRmY5zZDQ==
X-Google-Smtp-Source: APXvYqyk30GG6CN5yzq25be7Wl4lo1Q7sQMlBluWqN9jOgkuuuiwaF3xbnILXB92D5MMGUudcgnGSA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr24923813wrv.224.1568126892404; 
 Tue, 10 Sep 2019 07:48:12 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id c8sm5502766wrr.49.2019.09.10.07.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:48:11 -0700 (PDT)
Date: Tue, 10 Sep 2019 07:48:11 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 07:44:50 PDT (-0700)
In-Reply-To: <01efc597b0d12ec51e6bb829b4bfe0f6c4dca2a4.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-f51d57a7-0e18-4749-aad6-938b2f9f9ecf@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [PATCH v1 09/28] target/riscv: Add Hypervisor
 virtual CSRs accesses
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
X-List-Received-Date: Tue, 10 Sep 2019 14:48:21 -0000

On Fri, 23 Aug 2019 16:38:13 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h |  11 ++++
>  target/riscv/csr.c      | 119 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 204d9d9a79..78067901a2 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -191,6 +191,17 @@
>  #define HGATP_PPN            SATP64_PPN
>  #endif
>
> +/* Virtual CSRs */
> +#define CSR_VSSTATUS        0x200
> +#define CSR_VSIE            0x204
> +#define CSR_VSTVEC          0x205
> +#define CSR_VSSCRATCH       0x240
> +#define CSR_VSEPC           0x241
> +#define CSR_VSCAUSE         0x242
> +#define CSR_VSTVAL          0x243
> +#define CSR_VSIP            0x244
> +#define CSR_VSATP           0x280
> +
>  /* Physical Memory Protection */
>  #define CSR_PMPCFG0         0x3a0
>  #define CSR_PMPCFG1         0x3a1
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 388775d45a..e2e908fbc0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -817,6 +817,115 @@ static int write_hgatp(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +/* Virtual CSR Registers */
> +static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vsstatus;
> +    return 0;
> +}
> +
> +static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vsstatus = val;
> +    return 0;
> +}
> +
> +static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vsie;
> +    return 0;
> +}
> +
> +static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vsie = val;
> +    return 0;
> +}
> +
> +static int read_vstvec(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vstvec;
> +    return 0;
> +}
> +
> +static int write_vstvec(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vstvec = val;
> +    return 0;
> +}
> +
> +static int read_vsscratch(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vsscratch;
> +    return 0;
> +}
> +
> +static int write_vsscratch(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vsscratch = val;
> +    return 0;
> +}
> +
> +static int read_vsepc(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vsepc;
> +    return 0;
> +}
> +
> +static int write_vsepc(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vsepc = val;
> +    return 0;
> +}
> +
> +static int read_vscause(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vscause;
> +    return 0;
> +}
> +
> +static int write_vscause(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vscause = val;
> +    return 0;
> +}
> +
> +static int read_vstval(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vstval;
> +    return 0;
> +}
> +
> +static int write_vstval(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vstval = val;
> +    return 0;
> +}
> +
> +static int read_vsip(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = (target_ulong)atomic_read(&env->vsip);
> +    return 0;
> +}
> +
> +static int write_vsip(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    atomic_set(&env->vsip, val);
> +    return 0;
> +}
> +
> +static int read_vsatp(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->vsatp;
> +    return 0;
> +}
> +
> +static int write_vsatp(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->vsatp = val;
> +    return 0;
> +}
> +
>  /* Physical Memory Protection */
>  static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -1018,6 +1127,16 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HIDELEG] =             { hmode,   read_hideleg,     write_hideleg    },
>      [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
>
> +    [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
> +    [CSR_VSIE] =                { hmode,   read_vsie,        write_vsie       },
> +    [CSR_VSTVEC] =              { hmode,   read_vstvec,      write_vstvec     },
> +    [CSR_VSSCRATCH] =           { hmode,   read_vsscratch,   write_vsscratch  },
> +    [CSR_VSEPC] =               { hmode,   read_vsepc,       write_vsepc      },
> +    [CSR_VSCAUSE] =             { hmode,   read_vscause,     write_vscause    },
> +    [CSR_VSTVAL] =              { hmode,   read_vstval,      write_vstval     },
> +    [CSR_VSIP] =                { hmode,   read_vsip,        write_vsip       },
> +    [CSR_VSATP] =               { hmode,   read_vsatp,       write_vsatp      },
> +
>      /* Physical Memory Protection */
>      [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
>      [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

