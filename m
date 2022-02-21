Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGQa-0000xJ-8Q
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:41:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGQV-0000uG-FL; Mon, 21 Feb 2022 16:40:59 -0500
Received: from [2607:f8b0:4864:20::136] (port=37500
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGQT-0000Mw-2B; Mon, 21 Feb 2022 16:40:58 -0500
Received: by mail-il1-x136.google.com with SMTP id c14so11068127ilm.4;
 Mon, 21 Feb 2022 13:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t3nI390NUMyAlqzvRknfBTOGemylHiw200IMPrYau00=;
 b=jXHQZQT/LAvBGHXeTkPu1MuGhsQ+xqgfUpK3vNIoMYyZxKbrWRiHY08OR40TMe/K/T
 cv6IISsXv31KjuMF2tV8bTAVRCfn2jFnVXIQ3PWcFJBqCU+iVgjO9vdD0tsBbEBkFR1j
 nrlZSBgrP27oACcgHmFIy+0E76KiDYXbrs5C1nI0IqDTmEJcDRyCsXIGzPAUdZoDCffB
 elKl7Y+8kThzOc0LP/7vw84YqVaT7JaW1jOI9+lQJ8L9B46IiV6Be7E/6XCIckBIFI75
 Wujcn5DcMexagDZPdiGCXCLZFonPwyA29HeZHt2DuqvdBDYntqFx36RfcgKalbdXYE9G
 BpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t3nI390NUMyAlqzvRknfBTOGemylHiw200IMPrYau00=;
 b=cUZ/P7liCtBw1Jfl6bD3UyWb000lCCKgX7x7R4y8u0sjhUn2nGWYw/uEsxWCFgPCjz
 HasLzhHVme5AWT6zbemIvP+ykCM9PEXzfaxGunnrSUfam+8fW0lL79M34rU7I5wtQqoi
 9wibPGYnuVd/B+tGcgyY1vFBwEhpoHJ8h/rAAXBb4/DckzFXdjof0j/0ofttw6SJOsCW
 /JkdUnkSdtSYzEfT6fkyoYEZqFMOu+F2HJ7OGlBUZQO9NjwT3wkg6+dDNnQql1vFyBJP
 dAWskXnaLq3x+BB6KMFRn1Rd3CMaI+Bq/scFmMdbviMU0RyCZ3Sm6B/QQvlLzNi/c6J5
 R08Q==
X-Gm-Message-State: AOAM53106R3LSLkZUjyCRKJ5RkA++f3sq/bWDCu0pXusze3odQQWHAuk
 RXHXcqKMCvm8ckVjUPeHn/1eX2DSNHyH5YSMdF0=
X-Google-Smtp-Source: ABdhPJyghAnfw9zEILJelEeJ046QU9w3O8SuKeXafkraG7ApgYDm5krXB9+/iqIjHS4S0BdZNW95wjqafzE7Ma5lbhI=
X-Received: by 2002:a05:6e02:1e0b:b0:2be:e272:e5b9 with SMTP id
 g11-20020a056e021e0b00b002bee272e5b9mr17222359ila.310.1645479655451; Mon, 21
 Feb 2022 13:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20220206091835.1244296-1-atishp@rivosinc.com>
 <20220206091835.1244296-7-atishp@rivosinc.com>
In-Reply-To: <20220206091835.1244296-7-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:40:29 +1000
Message-ID: <CAKmqyKMctr5J-EtzbGLr4yA_bwjMUO68STa2h6kYwFdZsejskg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] target/riscv: Enable privileged spec version 1.12
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
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
X-List-Received-Date: Mon, 21 Feb 2022 21:41:00 -0000

On Sun, Feb 6, 2022 at 7:51 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Virt machine uses privileged specification version 1.12 now.
> All other machine continue to use the default one defined for that
> machine unless changed to 1.12 by the user explicitly.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 8 +++++---
>  target/riscv/csr.c | 5 +++++
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2668f9c358b2..1c72dfffdc61 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -150,7 +150,7 @@ static void riscv_any_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -474,7 +474,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>
>      if (cpu->cfg.priv_spec) {
> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> +            priv_version = PRIV_VERSION_1_12_0;
> +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
>              priv_version = PRIV_VERSION_1_11_0;
>          } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
>              priv_version = PRIV_VERSION_1_10_0;
> @@ -489,7 +491,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      if (priv_version) {
>          set_priv_version(env, priv_version);
>      } else if (!env->priv_ver) {
> -        set_priv_version(env, PRIV_VERSION_1_11_0);
> +        set_priv_version(env, PRIV_VERSION_1_12_0);
>      }
>
>      if (cpu->cfg.mmu) {
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ff7e36596447..1c70c19cf9bd 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -2886,6 +2886,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>  {
>      /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>      int read_only = get_field(csrno, 0xC00) == 3;
> +    int csr_min_priv = csr_ops[csrno].min_priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
>
> @@ -2918,6 +2919,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    if (env->priv_ver < csr_min_priv) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      return csr_ops[csrno].predicate(env, csrno);
>  }
>
> --
> 2.30.2
>
>

