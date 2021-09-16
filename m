Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQjL1-00068E-Ha
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 00:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQjKz-00064S-GN; Thu, 16 Sep 2021 00:49:29 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mQjKy-0000DI-2D; Thu, 16 Sep 2021 00:49:29 -0400
Received: by mail-il1-x12d.google.com with SMTP id x2so5331831ila.11;
 Wed, 15 Sep 2021 21:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sknV2UMiropNNjSna0pI05byiO5L7LOje0sY/1z1gL0=;
 b=QzymybtL62M9uOClSJo/3DkBPHdHpXEMRe5OwvGxwjjC4DXU8v5o7ETZ2xCj4BzEqo
 Q6BAAGZvWwroHlwU6yb6i/BlyyxU30UjsrE8QSx4N4BRw6P02coSKoN/i+gHemPfDH6g
 +wuJ5qCo2bXBsTDod/bceRP9EIXmqZflVY+YgNwMJW2ysIZFrNivCrYvOsXXzddXd+2M
 /ZPaLAenB6X6BsQ5QQVb1+n39UV6dOqbDV0BokGMigU2Vd9LZO3ELFLDAFMpSAsli4/L
 Nw/sfSvVrbwgE4DmqV0E7dsxLL7Ll7ydd1sxvS8Vk0tOAwCr+MkWptUhAmdTvOGB8n5y
 QZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sknV2UMiropNNjSna0pI05byiO5L7LOje0sY/1z1gL0=;
 b=On4R7eEMYjtm4DuXze5uIg6L7rdyLFuo92M2YwLq8oUZHNkO+K7cSrbOAw8lSQC4Ui
 ajUHSGougjqVivzQFdd7pavMeqJrGRU6W+1Tmdp/zhovBpjnBYPCpWTFGOI2/XADt4Bn
 2uGuoex0H0wkqy03J4l3KTyzx8qQvaGaVvw6IT3lsv1xxO+B8tlOZK0/J/G91wPITI0w
 kCgc/jSRnjpV1EKOX6+wcyoHgddQ1BTArLqiGvmGQzmokqiDZCeGkrpx4fqucWLRNrL+
 AfOR17kgZsAUMy2t6mKax7M2WaFIS4XaFfv3sBo1LF3ii1QU+iOjWuW2TQMEovfkxdL9
 Rt5Q==
X-Gm-Message-State: AOAM531Sz/MgsK8mulZXWcxyHPSXsI9sMbeH8FVfesuecneEclKHELRz
 /8iL3RaFbJQTBX38YAEOxJzy9C5l32iDbA0KGyA=
X-Google-Smtp-Source: ABdhPJyMkzz/rW4frgWzXkM+b3FZ6H5T+CGMNsHYADQ9mzYIlWKpeTC+SK8cYJMOwME6XVDbnFBXPfCVGpByfHMe/cM=
X-Received: by 2002:a05:6e02:964:: with SMTP id
 q4mr2679368ilt.290.1631767766451; 
 Wed, 15 Sep 2021 21:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-3-atish.patra@wdc.com>
In-Reply-To: <20210909202639.1230170-3-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Sep 2021 14:49:00 +1000
Message-ID: <CAKmqyKOgCzZEJks63mbYCr4HqhpcU5rYFg1bQ7sp_+hOpq+D2w@mail.gmail.com>
Subject: Re: [ RFC v2 2/9] target/riscv: pmu: Rename the counters extension to
 pmu
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Thu, 16 Sep 2021 04:49:29 -0000

On Fri, Sep 10, 2021 at 6:28 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The PMU counters are supported via cpu config "Counters" which doesn't
> indicate the correct purpose of those counters.
>
> Rename the config property to pmu to indicate that these counters
> are performance monitoring counters. This aligns with cpu options for
> ARM architecture as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  target/riscv/cpu.h | 2 +-
>  target/riscv/csr.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb7604f..7a486450ebc6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -587,7 +587,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> +    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00b8..5e67003e58a3 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -293,7 +293,7 @@ struct RISCVCPU {
>          bool ext_u;
>          bool ext_h;
>          bool ext_v;
> -        bool ext_counters;
> +        bool ext_pmu;
>          bool ext_ifencei;
>          bool ext_icsr;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0515d851b948..c3ce7d83a6b2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -64,7 +64,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
>
> -    if (!cpu->cfg.ext_counters) {
> +    if (!cpu->cfg.ext_pmu) {
>          /* The Counters extensions is not enabled */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> --
> 2.31.1
>
>

