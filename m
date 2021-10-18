Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLie-000435-9H
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 02:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLic-0003zu-H1; Mon, 18 Oct 2021 02:01:54 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLiZ-0004pe-Qd; Mon, 18 Oct 2021 02:01:54 -0400
Received: by mail-io1-xd33.google.com with SMTP id b188so9986402iof.8;
 Sun, 17 Oct 2021 23:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zdPl9hO+GQFmUC0US72pf60uXnUrSCi8Z6FKRvNa0Q=;
 b=nHzaVTEV6EHHL5tI/8cMET0jEz71tHtkziGS8yso6DRcYvn3dn6b1gGfU1tCfvf/+V
 wKzQ90VDF3mzpU/B8k35Amn83TirOCN1JFZ7b80YOQOqAnGbpH2WQuHlB/yP4EKtubaa
 LhhnivUqcScLUqkorRwnI0TczPRXpp5wqDCRXI8cekLbUdDXNDLQFmRWnyCV1E47TlSW
 WMS8mnlWGFLzBus4hmzJggmD1Oai4uyc7ej8wstvjBuTqUxzDq7bFV9KFDChQ8FpT/xZ
 QJOaihRjIZ9C/5VHrWYYmDsfKHwy8UP90PSMIJi9AUjjS2BDwyTW0bxourYlsD5rxwMM
 xAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zdPl9hO+GQFmUC0US72pf60uXnUrSCi8Z6FKRvNa0Q=;
 b=GbdZkADSwKjjVsXzS+RaYKNXF1jm+EGqGN0otsKaAxbrmKDqcThMlzfsNTjW3TVhDL
 KN55SOyDmcp/k0jAEHD7fux3EeiVTMfTCMlv4uB4LWi/NZ4hS3+0E6yUpl6jxWjprKmr
 EuwqopU8W2+oW2Yr82O6P3QS5f0XuI0ut0aQWJzLmvmag+JcPK+iEtn+/3V7Wv1/QQZb
 qR8qH6gYTHmSxeifDQZv4ZsZrkL5SXsrg6JpQ16kYrXeKbi9p59nNESg5WKkTz7C5y6+
 cmpMje+tWRdwaFs2N2b8in6j/dzw6Mi/W/rry70Mq8a/tX09+VM8Q1R4bLHsdO001q3f
 bbrg==
X-Gm-Message-State: AOAM532x/8Vi/Zq+082fVcUAlbamjOJSGVHeVlU+XYYmmzOCItgBczGW
 gy+An+tXvQgHojSPcTRmVobtVlVj+2lZ8PEWE/M=
X-Google-Smtp-Source: ABdhPJyoSf3nGdo+Q7EYzl0JBTnyRAqO4wiS0qXAKt0xIJNCHZupylAb3p44aaQ81Iu8gWr/Ln0DqlAq6msys5pmobU=
X-Received: by 2002:a02:2124:: with SMTP id e36mr16959286jaa.35.1634536909930; 
 Sun, 17 Oct 2021 23:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-2-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 16:01:24 +1000
Message-ID: <CAKmqyKMOcGU3Vi9hJe3i7TqKA1YZ56JhH_+h_eXUw=dS3ZN1TQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/78] target/riscv: fix TB_FLAGS bits overlapping bug
 for rvv/rvh
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 06:01:55 -0000

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

Thanks!

Applied to this patch to riscv-to-apply.next

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

