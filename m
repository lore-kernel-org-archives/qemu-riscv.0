Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l7Nop-0004U5-8b
	for mharc-qemu-riscv@gnu.org; Wed, 03 Feb 2021 14:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7Non-0004Q8-Ty; Wed, 03 Feb 2021 14:28:01 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:37985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7Noj-000491-GC; Wed, 03 Feb 2021 14:28:01 -0500
Received: by mail-il1-x12d.google.com with SMTP id a16so328683ilq.5;
 Wed, 03 Feb 2021 11:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsMH2SYUwl4FmVURapXdw1cZIOy+0YQVzKHqvjmgP9A=;
 b=Vh2AquHXSkYvJ+ba5pVSdPsFHpXF4dq7l6BHGiPovEw6nkFyr0zKqK8mNtYgn6xgzb
 rbg/JOdlwem3dQax+1u8kjeVwnJSZQrB7ujFdck3e20+0aBFDNxyKh3OTCRAxvG/KIaN
 j4dJmGAkCYtKHHDFO08jvvYncysJICM232ysjcXE9ftB6QCr315wT1efMG/i6SDtEs5u
 L6KMborFG5PUYVNpS6ckvv9u+JabLghC7EQuhDz5Y2lr01ZLSuJks6FmZ0dU+CcdwT8O
 lwqHL40HoRGySBk4NuhB1E5w9qzz37zoFMiTZ621jxQDU8mwnRtKtzk8HA65qgcr0zx7
 bpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsMH2SYUwl4FmVURapXdw1cZIOy+0YQVzKHqvjmgP9A=;
 b=V6eY3ep2QpRn4OAUFteZez8puSegmmEKa20XXF5xeEs3k/EPsZmU4gEjPLl2WHI5yo
 XjPEVUnYNpmC05sLXDkNDF5DbcYtxBZwnZDA65uG0sf4UxDk6vuQW5RICt07h7vegq8V
 H2FBT+xgrpy3ZXy4yRkvRmW24l0oc5JRRJcs1ijYPfei2vY6xkiCfEk7dYhFfnZG847c
 9iUVDDJMV8iTmLy/Zywh8ySy+/OOII+3twcH/a8+gGbTaGMXuDNgnjRcOQY0t4tLHAQ4
 cEIat7d7lL1ixNPgHEJqKGL8MIeRB1Du/nZb5g8ak6BTHxKGaT56z8aaxZ++xX4UF1Es
 22uQ==
X-Gm-Message-State: AOAM533XBXnUQGeRWvL1x6iCdWIb2EkMaZhVJP7khriOLwQnnDmxJ9IE
 Oj74eW2HG1AEC27pgvb6y2snv7IzfRl8lpbbuYA=
X-Google-Smtp-Source: ABdhPJysR9NrOm8xGZSr6dC8BkzCH3k1ZHSSij+kB+UHY/v65FV0A4DjnDyJxJ9iJhkMl+rayipVLcByz+PVipo2EsE=
X-Received: by 2002:a92:d445:: with SMTP id r5mr2840760ilm.227.1612380474957; 
 Wed, 03 Feb 2021 11:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-6-space.monkey.delivers@gmail.com>
In-Reply-To: <20210110185109.29841-6-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Feb 2021 11:27:29 -0800
Message-ID: <CAKmqyKNXStzu5kv7R+EGXHuAvchpWi9bDjM300b8SgB=JgNLgw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] [RISCV_PM] Implement address masking functions
 required for RISC-V Pointer Masking extension
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Wed, 03 Feb 2021 19:28:02 -0000

On Sun, Jan 10, 2021 at 10:53 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> From: Anatoly Parshintsev <kupokupokupopo@gmail.com>
>
> Signed-off-by: Anatoly Parshintsev <kupokupokupopo@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.h       | 19 +++++++++++++++++++
>  target/riscv/translate.c | 34 ++++++++++++++++++++++++++++++++--
>  2 files changed, 51 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 37ea7f7802..b3c63ca5ff 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -397,6 +397,7 @@ FIELD(TB_FLAGS, SEW, 5, 3)
>  FIELD(TB_FLAGS, VILL, 8, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, PM_ENABLED, 10, 1)

Can you add a comment above this for what this is? PM could be lots of
different things.

>
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
> @@ -454,6 +455,24 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>              flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>          }
>      }
> +    if (riscv_has_ext(env, RVJ)) {
> +        int priv = cpu_mmu_index(env, false);
> +        bool pm_enabled = false;
> +        switch (priv) {
> +        case PRV_U:
> +            pm_enabled = env->mmte & U_PM_ENABLE;
> +            break;
> +        case PRV_S:
> +            pm_enabled = env->mmte & S_PM_ENABLE;
> +            break;
> +        case PRV_M:
> +            pm_enabled = env->mmte & M_PM_ENABLE;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        flags = FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, pm_enabled);
> +    }
>  #endif
>
>      *pflags = flags;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 5da7330f33..980604935d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -36,6 +36,9 @@ static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
>  static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>  static TCGv load_res;
>  static TCGv load_val;
> +/* globals for PM CSRs */
> +static TCGv pm_mask[4];
> +static TCGv pm_base[4];
>
>  #include "exec/gen-icount.h"
>
> @@ -64,6 +67,10 @@ typedef struct DisasContext {
>      uint16_t vlen;
>      uint16_t mlen;
>      bool vl_eq_vlmax;
> +    /* PointerMasking extension */
> +    bool pm_enabled;
> +    TCGv pm_mask;
> +    TCGv pm_base;
>  } DisasContext;
>
>  #ifdef TARGET_RISCV64
> @@ -103,13 +110,19 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>  }
>
>  /*
> - * Temp stub: generates address adjustment for PointerMasking
> + * Generates address adjustment for PointerMasking
>   */
>  static void gen_pm_adjust_address(DisasContext *s,
>                                    TCGv_i64      dst,
>                                    TCGv_i64      src)
>  {
> -    tcg_gen_mov_i64(dst, src);
> +    if (!s->pm_enabled) {
> +        /* Load unmodified address */
> +        tcg_gen_mov_i64(dst, src);
> +    } else {
> +        tcg_gen_andc_i64(dst, src, s->pm_mask);
> +        tcg_gen_or_i64(dst, dst, s->pm_base);
> +    }
>  }
>
>  /*
> @@ -828,6 +841,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->pm_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
> +    int priv = cpu_mmu_index(env, false);

Can you AND this with TB_FLAGS_PRIV_MMU_MASK?

Alistair

> +    ctx->pm_mask = pm_mask[priv];
> +    ctx->pm_base = pm_base[priv];
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> @@ -947,4 +964,17 @@ void riscv_translate_init(void)
>                               "load_res");
>      load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
>                               "load_val");
> +    /* Assign PM CSRs to tcg globals */
> +    pm_mask[PRV_U] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmmask), "upmmask");
> +    pm_base[PRV_U] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmbase), "upmbase");
> +    pm_mask[PRV_S] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmmask), "spmmask");
> +    pm_base[PRV_S] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmbase), "spmbase");
> +    pm_mask[PRV_M] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmmask), "mpmmask");
> +    pm_base[PRV_M] =
> +      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmbase), "mpmbase");
>  }
> --
> 2.20.1
>
>

