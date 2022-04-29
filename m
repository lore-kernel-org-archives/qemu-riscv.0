Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkOHb-0006gD-4q
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 06:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nkOHT-0006dv-K5; Fri, 29 Apr 2022 06:55:25 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nkOHS-0001Qk-5r; Fri, 29 Apr 2022 06:55:23 -0400
Received: by mail-io1-xd31.google.com with SMTP id e3so5583133ios.6;
 Fri, 29 Apr 2022 03:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IsL6a/oqVWcEuz27F4dCL1U+rw1O81oeooniZ0IuKRg=;
 b=iTEGGOVPXUsuFgKa0ZHX11uAgvkHyx8MfHRKT2FgD9BjamOB3DbGsJZKqv4ED+VwLy
 BlzsPjSgIGu2U1bn8bovtpQU3oa7Bf65HRDWCIg5bUGYaG9uOqRpC8PTEF3rfK0LNDI9
 brgHGjwwHA0OL5gp8xRTV5DXb1hB1rjNRBESK1k8mORGhyXP9Kl5x50aMM0Z/AqHPycr
 29eXHeq71SaCF+6UpoXeFqKJDSsWi0lK8lJD8i2tSkTx4GWXqZ0aRpECNGCYgjZXbWoT
 P/sHwAX8DGimCkuukAohZzfpjNa1iZtm/o3oHdMfqBBmGUxndnP2SWNsQfAwpzrDFc3v
 O0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IsL6a/oqVWcEuz27F4dCL1U+rw1O81oeooniZ0IuKRg=;
 b=WE88+eA4cm3xI/Mfp8ooqy377un9FMEBaKjigAAK3frBm0EHZuGBtfhNDZRmnMWYND
 3aFghnIp1ODwdSC1daUfpj9ewFG5xIkwv1PyJ/XrrriqWB7z/S22JWEeXY9rVdzQ0Wyv
 8FhV8TUU20anKG2nsv3330PIqXgUs88HbLSR/0ZRlKAo+ooQDFJbfseHLHH6OenUNxtq
 OA7gZ96b9QT4EgvMFJyho5XmlSfHV9z3BBPWGLYeIn3oQ4X8+CNKBecu29aHd2KZA+XQ
 fdJUmy8uwP6pLsqHsZMlf3c3zqdi1mqpAW+mkrEQk5mCuaObpa7BXjhBUSDu63lnfBvO
 5d0g==
X-Gm-Message-State: AOAM53265uoDCERmiYFA5xIhgN8h9w+y98LCCOTy8Ocy5zB8A3tMoc38
 nx0qWLNhjEQf49MLcNJzu6GeB5xroC48GhEbPlk=
X-Google-Smtp-Source: ABdhPJyb/C/kp33wPDYpWFjZiwv1Uw3rQTDKalTy+LdseWoncuVuxNk5eDdZ2fCXT++FAIiaiZmOH/qLbrWUckFVrtw=
X-Received: by 2002:a05:6602:2c07:b0:657:8347:d7c0 with SMTP id
 w7-20020a0566022c0700b006578347d7c0mr10236628iov.93.1651229720296; Fri, 29
 Apr 2022 03:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-2-apatel@ventanamicro.com>
In-Reply-To: <20220429033409.258707-2-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 29 Apr 2022 20:54:54 +1000
Message-ID: <CAKmqyKOaXXGD400vRLoj95kYPiaNrbCkRtq4GdRDbw3pM-ztmw@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Fix csr number based privilege checking
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 29 Apr 2022 10:55:25 -0000

On Fri, Apr 29, 2022 at 1:36 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
> the riscv_csrrw_check() function should generate virtual instruction
> trap instead illegal instruction trap.
>
> Fixes: 533c91e8f22c ("target/riscv: Use RISCVException enum for
> CSR access")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3500e07f92..2bf0a97196 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3139,7 +3139,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>      int read_only = get_field(csrno, 0xC00) == 3;
>      int csr_min_priv = csr_ops[csrno].min_priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
> -    int effective_priv = env->priv;
> +    int csr_priv, effective_priv = env->priv;
>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -3152,7 +3152,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          effective_priv++;
>      }
>
> -    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
> +    csr_priv = get_field(csrno, 0x300);
> +    if (!env->debugger && (effective_priv < csr_priv)) {
> +        if (csr_priv == (PRV_S + 1) && riscv_cpu_virt_enabled(env)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> --
> 2.34.1
>
>

