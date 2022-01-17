Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9atr-0005sT-JS
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9ato-0005n9-RQ; Mon, 17 Jan 2022 17:54:53 -0500
Received: from [2607:f8b0:4864:20::12c] (port=34658
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9atk-000175-45; Mon, 17 Jan 2022 17:54:52 -0500
Received: by mail-il1-x12c.google.com with SMTP id d14so16061912ila.1;
 Mon, 17 Jan 2022 14:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lorhal5rSnlzQIlFbAWwO/Hh70y6KnUK6KDk6Ls5qhY=;
 b=Ed7qn25z+PvKPNS/7Zm53HHYDwytaWa7QNtqQgPzHH2wKWTNuB1Zfo22v8lPSY5Kul
 8js3YBVPMh7GS7DTbpeC3oo3AJq4uKgmtmdD6X7zmYqOKVtiyRiCk2XRgYpLFnzVH5kU
 1xHYMbfO4oUcjtue+VFTSjENwjPiXY2BJzLFTz8cgJgOlte9TmGK2Xqds1MtnPdc0em0
 YkoJDygY0kWhfhYqhULkJ2EnDa8iS+9Kc4fsksloQZZVCKo8pF+tMyr7ZXjF3Vzxek/X
 qYSLHfKch1BOByh7m6FnCFnBVjCzX8zDoHxAK42QigaQnxOuaTBv07vIW20Ep3Iar/Gf
 0l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lorhal5rSnlzQIlFbAWwO/Hh70y6KnUK6KDk6Ls5qhY=;
 b=7pnRUDLvl0SGksmV8N48GqScNSHyrisQQmWZdY9N9kMfn+B7FEHW3UIvdGOtNWnOUh
 Gb9sLS9IBT6u93FyPhBPpJaMWzFaqHP3BpgghGrukTTudufBDFGcl99684PfNnMO4MSc
 PUeGGtgPtUWrRnE4HXpezsmMrymVXY2g48/+31DatULCRXmSIQgqvkX3k+LDEVfjpPmA
 eyfj82/h6oaZ52U1EBDSIy4o3Xd1lokYU2H9oqdiwcwLTTbRDrC7YR+ZEpOgksGNBVzF
 kg3dtUsmn8xGfz2oJYXqD8BZpSEr/zpS76UNpguq3hT0WOTxEfIe4N5Lh7yEexR2wngW
 0zjg==
X-Gm-Message-State: AOAM531ipNzLk/J6DDL4ryq0kKms5QpPkb38HnIo/HLggUvCexXqiuo5
 DfnZuFRPeYj6ThKDjAWMg980PYcb4i+myh/ILL0=
X-Google-Smtp-Source: ABdhPJxmCImO7aZZhGLjWrJImjzWpRqb86ioAvHMXJalQrqHhoPXBFBLhZG6nA/I0i8rbeHq1Lxm7gKg5yG7g+Gbpho=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr9135382ils.74.1642460086951; 
 Mon, 17 Jan 2022 14:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-12-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-12-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:54:20 +1000
Message-ID: <CAKmqyKP6vDaXDAOf+dQOf_dA6Qzdh=-wmZUS6MbTdH88HLs-Bg@mail.gmail.com>
Subject: Re: [PATCH 11/17] target/riscv: rvv-1.0: Add Zve32f extension into
 RISC-V
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:54:54 -0000

On Wed, Dec 29, 2021 at 12:34 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        | 4 ++--
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_helper.c | 2 +-
>  target/riscv/csr.c        | 2 +-
>  target/riscv/translate.c  | 2 ++
>  5 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 38cd11a8ae..5e98860a09 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -562,8 +562,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>              set_vext_version(env, vext_version);
>          }
> -        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
> -            error_setg(errp, "Zve64f extension depends upon RVF.");
> +        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> +            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF.");
>              return;
>          }
>          if (cpu->cfg.ext_j) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d7b2db2b2f..3f3b3bb062 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -317,6 +317,7 @@ struct RISCVCPU {
>          bool ext_icsr;
>          bool ext_zfh;
>          bool ext_zfhmin;
> +        bool ext_zve32f;
>          bool ext_zve64f;
>
>          char *priv_spec;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 52d93a41fd..7d8b34cf1a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -77,7 +77,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>      *pc = env->pc;
>      *cs_base = 0;
>
> -    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
> +    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
>          /*
>           * If env->vl equals to VLMAX, we can use generic vector operation
>           * expanders (GVEC) to accerlate the vector operations.
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 340b9661a8..7bd3a5d1af 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -51,7 +51,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
>      RISCVCPU *cpu = RISCV_CPU(cs);
>
>      if (env->misa_ext & RVV ||
> -        cpu->cfg.ext_zve64f) {
> +        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
>  #if !defined(CONFIG_USER_ONLY)
>          if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>              return RISCV_EXCP_ILLEGAL_INST;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8c3b0168b7..3d89a6650d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -78,6 +78,7 @@ typedef struct DisasContext {
>      bool ext_ifencei;
>      bool ext_zfh;
>      bool ext_zfhmin;
> +    bool ext_zve32f;
>      bool ext_zve64f;
>      bool hlsx;
>      /* vector extension */
> @@ -706,6 +707,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
>      ctx->ext_zfh = cpu->cfg.ext_zfh;
>      ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
> +    ctx->ext_zve32f = cpu->cfg.ext_zve32f;
>      ctx->ext_zve64f = cpu->cfg.ext_zve64f;
>      ctx->vlen = cpu->cfg.vlen;
>      ctx->elen = cpu->cfg.elen;
> --
> 2.31.1
>
>

