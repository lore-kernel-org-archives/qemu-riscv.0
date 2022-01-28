Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDJwb-0007UV-5W
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 00:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJwO-0007SY-V7; Fri, 28 Jan 2022 00:36:58 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=42942
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJwI-0008WQ-RV; Fri, 28 Jan 2022 00:36:55 -0500
Received: by mail-io1-xd2a.google.com with SMTP id r144so6431602iod.9;
 Thu, 27 Jan 2022 21:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Txon+R8nrLpm1fdvxswvn3MrBm0Tn47Y1L0x5DGVfqM=;
 b=Es51y5B/Vz3RRjJe0fgMNm44RdWJzGTKTL8ub9uqbzedxqbR3nv7vkZyOTleqXuFR3
 yB+b7FEpDf3R/MsnnDHjw2pwF1CEvnUB2vn0ec5oD013TzmCWDn1dUuzzj23GEV6wmIg
 tzR918JPmSRpWFyqGYMYJoER1HJkSSnFIgkzSkGfmOAmlAc/J2iwu0wWBr1bhBwxve06
 sKlspeKQau/i0XeIf/GDVWBqB1UoHNrySoXl7Q+jzM+REtV2SSyRlHhZUZTiSplRruNV
 SNBNsdFxJkB8bjRl80vxHHkNwES9wFjtb1WKUmQ46Hy2+jKga8sFnqV/zkt3KdrDtHcq
 tRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Txon+R8nrLpm1fdvxswvn3MrBm0Tn47Y1L0x5DGVfqM=;
 b=NKzNsR+l+ZQ0y3S9s0JK21V+2l58BeoIhutfbv64Ejmg09ABSr2l1UL8Y9dnFJfbmt
 qlCT8jijWohGOJhK6adXKz0nE2Z9CFjzl4+lKKrB3AhvpFFPKhGmF3pPjpFWRvGhgGDA
 1gZClhIUEhiZof9RskNtfruQywpwF3PDDNPXz0xmF8RbAr5whmlhq77dtBWqw2VuN0tM
 COkckVlJOhfDEtnSllfcSuZp9ZJfGYGMo1l26207qJOsRCFkq8J+U4NsjWdNgaZl+WCh
 9/SNS2+u3SHvryBhAn6YqECF7N7C8wLgDHLraPF3mLZMZaC6PqhiUfAIoyLEQt3Z8Obt
 oWMw==
X-Gm-Message-State: AOAM53325AYHRLRxXAeaG84f/GDKnqYl31+P9QWZCa1q7VwohlTWx0Vj
 6axAkO2E2X+ac2WWyEV5GhQWSyAHGVLlXXxjdGo=
X-Google-Smtp-Source: ABdhPJyBbALijKq1imbP2ZTAVn/zuPkDqZfw2a5YXhvO8o6VU4HSe/SgdtZywL/ZJ7kkhLmeqEVZbPufSBvDbswyRYQ=
X-Received: by 2002:a02:c956:: with SMTP id u22mr3726844jao.63.1643348209394; 
 Thu, 27 Jan 2022 21:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20220113014959.21429-1-liweiwei@iscas.ac.cn>
 <20220113014959.21429-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20220113014959.21429-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jan 2022 15:36:23 +1000
Message-ID: <CAKmqyKMVgg0W_vJ7qwA5mHWadq86GJ6a2Cd5kk_H7AE9zOja4Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, ardxwe@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Jan 2022 05:37:00 -0000

On Thu, Jan 13, 2022 at 11:52 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Co-authored-by: ardxwe <ardxwe@gmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c |  6 +++++-
>  target/riscv/csr.c        | 25 ++++++++++++++++++++-----
>  target/riscv/translate.c  |  4 ++++
>  3 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 434a83e66a..3854acf7fe 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -222,9 +222,13 @@ bool riscv_cpu_vector_enabled(CPURISCVState *env)
>
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
>  {
> -    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
> +    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM |
>                              MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
>                              MSTATUS64_UXL | MSTATUS_VS;
> +
> +    if (riscv_has_ext(env, RVF)) {
> +        mstatus_mask |= MSTATUS_FS;
> +    }
>      bool current_virt = riscv_cpu_virt_enabled(env);
>
>      g_assert(riscv_has_ext(env, RVH));
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index adb3d4381d..f4466cba05 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -38,7 +38,8 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>  static RISCVException fs(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env) &&
> +        !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> @@ -234,7 +235,9 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->mstatus |= MSTATUS_FS;
> +    if (riscv_has_ext(env, RVF)) {
> +        env->mstatus |= MSTATUS_FS;
> +    }
>  #endif
>      riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
>      return RISCV_EXCP_NONE;
> @@ -251,7 +254,9 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->mstatus |= MSTATUS_FS;
> +    if (riscv_has_ext(env, RVF)) {
> +        env->mstatus |= MSTATUS_FS;
> +    }
>  #endif
>      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
>      return RISCV_EXCP_NONE;
> @@ -269,7 +274,9 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    env->mstatus |= MSTATUS_FS;
> +    if (riscv_has_ext(env, RVF)) {
> +        env->mstatus |= MSTATUS_FS;
> +    }
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
>      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
> @@ -564,10 +571,14 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>          tlb_flush(env_cpu(env));
>      }
>      mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
> -        MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
> +        MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
>          MSTATUS_TW | MSTATUS_VS;
>
> +    if (riscv_has_ext(env, RVF)) {
> +        mask |= MSTATUS_FS;
> +    }
> +
>      if (riscv_cpu_mxl(env) != MXL_RV32) {
>          /*
>           * RV32: MPV and GVA are not in mstatus. The current plan is to
> @@ -697,6 +708,10 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>          return RISCV_EXCP_NONE;
>      }
>
> +    if (!(val & RVF)) {
> +        env->mstatus &= ~MSTATUS_FS;
> +    }
> +
>      /* flush translation cache */
>      tb_flush(env_cpu(env));
>      env->misa_ext = val;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 9687fa3e7c..8f01063618 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -406,6 +406,10 @@ static void mark_fs_dirty(DisasContext *ctx)
>  {
>      TCGv tmp;
>
> +    if (!has_ext(ctx, RVF)) {
> +        return;
> +    }
> +
>      if (ctx->mstatus_fs != MSTATUS_FS) {
>          /* Remember the state change for the rest of the TB. */
>          ctx->mstatus_fs = MSTATUS_FS;
> --
> 2.17.1
>
>

