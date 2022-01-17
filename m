Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aPl-0002Zr-IU
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aPj-0002W7-Dj; Mon, 17 Jan 2022 17:23:47 -0500
Received: from [2607:f8b0:4864:20::12a] (port=34526
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aPh-0005SB-Nv; Mon, 17 Jan 2022 17:23:46 -0500
Received: by mail-il1-x12a.google.com with SMTP id d14so16010684ila.1;
 Mon, 17 Jan 2022 14:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qqj2eDYYegV7RumMuF3lGIoyGPymVa15N0wqTPh7j70=;
 b=GOyZonUrtYFeYsnb9OH/ZrJMCwlqAQua7MEEWQ2031frQOIYHjy1u/RRU4ywrVmB8l
 UCMn2rekL8OVDY+6cSG+2ZmNFiimQyEqOCNLlHOqRRycfD6Xe7djVrarua54MMXyY5g5
 o6ivqtak1GsV1bt+VIjWeguL0ZSIRscVMPC0q5+z5Fx3hkB02EhvWzQiOfZ3ZwgasSci
 QE6VefBlBX322Viq117bVpbFmEG2cufrHKKsARDWE0QqsIC9AuygYAt4AmFlQGaVfy+S
 WIgqf3y3li7r2jzfIfIdDBlv8mHrRU3h/vvjUDjTWu7WdyO4h5tUVmReE4/zDZFcZCPJ
 QIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qqj2eDYYegV7RumMuF3lGIoyGPymVa15N0wqTPh7j70=;
 b=DbAtqGt6Gn9buRUFsWbFUbJjZZdtBNLhX2dYcWRbtFZZaT0ItbSkuAknuhDca2xZbq
 eqUHNVh8i6LWbzrrkInQy1g6lIM/2e07xn3K2FPV4uk+xx+xNTbWANW4KzbmX4KOi+Zd
 eC8Tgcp39hxfRMLZi9/JqOS8/lSuYnwQtuM6YVMiT4FHdHuzRPdsnNQJ+/wlPtLul66x
 SrOsWcSoIBcLsJfRproEiv3cuPE200DibcF3e1uxold4uAH3b78KUc+giWZluQws1IT2
 JesMC6/4UCozJ0AIDD5zBkw9k5nP6LDGRyC6KNNGZ88O8dx7+X2jeD4jUf5KfepoYexY
 Uf4w==
X-Gm-Message-State: AOAM533CTcdvi2mp9H1KN0wITdoIGYFGaZS1jlw1LfXB+M+OWd2w4SVy
 Yw6YOXcxRT9SjHCVfU9uutcv8Va8NQL4cBSSYjc=
X-Google-Smtp-Source: ABdhPJwCTH9+gorOchiNz+/V/suWejqBAOZ5qEOlunsWfel4GciJxOoaHwMfhY5UyclZGW94y6ldThfodKCuyxOK82U=
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr12264917ilu.290.1642458224279; 
 Mon, 17 Jan 2022 14:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-2-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:23:18 +1000
Message-ID: <CAKmqyKPrBcROVj=ykv3F-wwtYUGu=jTT_F055n8nHC8_K=USKw@mail.gmail.com>
Subject: Re: [PATCH 01/17] target/riscv: rvv-1.0: Add Zve64f extension into
 RISC-V
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 22:23:47 -0000

On Wed, Dec 29, 2021 at 12:34 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        | 4 ++++
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_helper.c | 5 ++++-
>  target/riscv/csr.c        | 6 +++++-
>  target/riscv/translate.c  | 2 ++
>  5 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bce..01239620ca 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -562,6 +562,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>              set_vext_version(env, vext_version);
>          }
> +        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
> +            error_setg(errp, "Zve64f extension depends upon RVF.");
> +            return;
> +        }
>          if (cpu->cfg.ext_j) {
>              ext |= RVJ;
>          }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index dc10f27093..d7b2db2b2f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -317,6 +317,7 @@ struct RISCVCPU {
>          bool ext_icsr;
>          bool ext_zfh;
>          bool ext_zfhmin;
> +        bool ext_zve64f;
>
>          char *priv_spec;
>          char *user_spec;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 10f3baba53..52d93a41fd 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -69,12 +69,15 @@ static RISCVMXL cpu_get_xl(CPURISCVState *env)
>  void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
>      uint32_t flags = 0;
>
>      *pc = env->pc;
>      *cs_base = 0;
>
> -    if (riscv_has_ext(env, RVV)) {
> +    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
>          /*
>           * If env->vl equals to VLMAX, we can use generic vector operation
>           * expanders (GVEC) to accerlate the vector operations.
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 146447eac5..340b9661a8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -47,7 +47,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>
>  static RISCVException vs(CPURISCVState *env, int csrno)
>  {
> -    if (env->misa_ext & RVV) {
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (env->misa_ext & RVV ||
> +        cpu->cfg.ext_zve64f) {
>  #if !defined(CONFIG_USER_ONLY)
>          if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>              return RISCV_EXCP_ILLEGAL_INST;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 5df6c0d800..8c3b0168b7 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -78,6 +78,7 @@ typedef struct DisasContext {
>      bool ext_ifencei;
>      bool ext_zfh;
>      bool ext_zfhmin;
> +    bool ext_zve64f;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -705,6 +706,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
>      ctx->ext_zfh = cpu->cfg.ext_zfh;
>      ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
> +    ctx->ext_zve64f = cpu->cfg.ext_zve64f;
>      ctx->vlen = cpu->cfg.vlen;
>      ctx->elen = cpu->cfg.elen;
>      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
> --
> 2.31.1
>
>

