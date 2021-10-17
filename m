Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcF52-0000hv-Rh
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 18:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcF4x-0000cx-5V; Sun, 17 Oct 2021 18:56:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcF4u-0002fK-2g; Sun, 17 Oct 2021 18:56:30 -0400
Received: by mail-pf1-x436.google.com with SMTP id v8so9126851pfu.11;
 Sun, 17 Oct 2021 15:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u5ge0/URul25AsObX6IEQcD8kVdVvwDcv7rdRNaDAI0=;
 b=is0fFJMKF4Z3Ybs5NbZD8Yt20v+2P2a+gjZQ4AQjyzPfj7JKzWlrsrhhkvuRbw6NGX
 M+AqObPgF8KybA8i1fI/IkPCfLlkjsZd+Ua88buWzf1m0IdYqiplUTKbJPO686N4SRCM
 6ucY+F83IjVYProE3rEql2jgZjBFpkl6xb0/x2eYa/Tk1BTBmdGVw2wbEe1KKxrMpwnz
 W+tyTyykhWecRdn/xowINDIAXddNUJOrvNdLYDRyIzfYfoXO5hbkP9bckFy6vX40NeSR
 OuWNiD2XjzZpcXbyiGdxnp/Bd+P9HKSx4PND6enDHtv3l4p/e2VYRd4znM9PJhn6JhDe
 AvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5ge0/URul25AsObX6IEQcD8kVdVvwDcv7rdRNaDAI0=;
 b=MO2xMrgRsejT5GOvfdEcBiPrNYYKRjxi3qrZF0b20OUvLW4Po0VuYqzacSbvOzJhkn
 xyVllNR0SfufPRSfIlPC+piyl9RhtVkalH2H/T1SW73SHHSYO/VNtrBdlZgF89GUgIb3
 9ywMDJxsheDJM08cj9vhjcobLd1myLpG1pDMVU4jZAWii3od6Dt3XfPoq0o36oTDaE9q
 equfSWFRSmKZ+pSmirTuEJyqiLYDjndni43Ak5lkqN+mWSMgBA1h9lLIHH4t/Qy0as1P
 XVxZmvpPt/B7pH9qukuUJAI9jps7B401F0wRJl7CeDQirvNtHOtnt9EYzdmFHezpgebi
 D3nw==
X-Gm-Message-State: AOAM5335OuaK2zG1D1sWorHSXRZIthtiwLepJ9BDlTpGcM3eKUUxyxGf
 yLwoBXUteqTQveKaFh+Lpf339CBxsiBhgfz+zwQ=
X-Google-Smtp-Source: ABdhPJw5if+SwKseup52l6alaF+NFZaxcOqLWGgzwtA4hhwUJDKDXhN8tVSGXoUvc4qDgLo5+cYo5bC79uNWjhq4vjc=
X-Received: by 2002:aa7:8bd4:0:b0:44c:f89d:7e72 with SMTP id
 s20-20020aa78bd4000000b0044cf89d7e72mr25160157pfd.71.1634511384350; Sun, 17
 Oct 2021 15:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-2-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 08:55:58 +1000
Message-ID: <CAKmqyKP8rx_vmO2MpVzxacUhx-H6W0+zDEfd0r5qrFtg+kiTEA@mail.gmail.com>
Subject: Re: [PATCH v8 01/78] target/riscv: fix TB_FLAGS bits overlapping bug
 for rvv/rvh
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Sun, 17 Oct 2021 22:56:33 -0000

On Fri, Oct 15, 2021 at 5:50 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
> commit: c445593, but other TB_FLAGS bits for rvv and rvh were
> not shift as well so these bits may overlap with each other when
> rvv is enabled.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h       | 14 +++++++-------
>  target/riscv/translate.c |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d70f63ddfe6..d63a08b6e4c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -380,7 +380,6 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>
> -#define TB_FLAGS_MMU_MASK   7
>  #define TB_FLAGS_PRIV_MMU_MASK                3
>  #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>  #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
> @@ -389,13 +388,14 @@ typedef CPURISCVState CPUArchState;
>  typedef RISCVCPU ArchCPU;
>  #include "exec/cpu-all.h"
>
> -FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
> -FIELD(TB_FLAGS, LMUL, 3, 2)
> -FIELD(TB_FLAGS, SEW, 5, 3)
> -FIELD(TB_FLAGS, VILL, 8, 1)
> +FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
> +FIELD(TB_FLAGS, LMUL, 4, 2)
> +FIELD(TB_FLAGS, SEW, 6, 3)
> +FIELD(TB_FLAGS, VILL, 9, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
> -FIELD(TB_FLAGS, HLSX, 9, 1)
> -FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
> +FIELD(TB_FLAGS, HLSX, 10, 1)
> +FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
>
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f23bc919c08..a7a66cf9db1 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -544,7 +544,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      uint32_t tb_flags = ctx->base.tb->flags;
>
>      ctx->pc_succ_insn = ctx->base.pc_first;
> -    ctx->mem_idx = tb_flags & TB_FLAGS_MMU_MASK;
> +    ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
>      ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
>      ctx->priv_ver = env->priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> --
> 2.25.1
>
>

