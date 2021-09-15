Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQWEn-0002kY-QP
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 10:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEg-0002ii-Ei; Wed, 15 Sep 2021 10:50:06 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEe-0000PU-UE; Wed, 15 Sep 2021 10:50:06 -0400
Received: by mail-yb1-xb33.google.com with SMTP id i12so6219374ybq.9;
 Wed, 15 Sep 2021 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqHAhHdgwpxWo43wpgQo1vCUHOBViy5yZQwGft1kdzs=;
 b=GUWhLRPb9emukULIbrhCoQ9ItSAZYlvPqjIF+ECU0RDBJPfryWm9J6ZmwHSnZWUk7X
 BkOlMWrxgyoduaOfEKRt1f/zUkvfx5o9GdvacPlRLB3ZaiQMgCmkKus5PvLN4t9Ja+yB
 2alcvSU7x+S+Rqygr/IEblZHIj7dxZhCLhMczAkr3h/6quy304uTQhpsd0jMnMQdp2ss
 7IOL7CrePrWxlrmcWjMRVkLn7Vvnx+gWjAtc2Mm2vSn2kOP9KGpSWay23SFNMJsZatpF
 C700QNI1k6WdsTM9kCW2Zkr8kbRJUfQMKIeUs3Qne899+8P62D/B3iNAR2jwqYMBmRro
 4rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqHAhHdgwpxWo43wpgQo1vCUHOBViy5yZQwGft1kdzs=;
 b=BkhID37kOHHz4uHkbyoj1zBcM6Z1SqyF0OOWpfhTTsyIMWb3cdGU2P/R8SVGd8u4Yn
 KwJmAywU/+ihvNTvQyHPJpUh9geQD+TRBtgNgXA8hWO94PhwXLLgyI/lINXAqLVPczZK
 azQ4ixmSxpQO0tROD/7gMndl+PbhpvHpnm2xshUH9PKJCZYgaTsCzm1eid51NxDRBxyV
 sTw0K34gHvZC/9LWkxyQQVYz4CPKPtqGMgvLp8we8GOSE91bRGqOfi8fyi6fgJM6F6Jm
 9OSTzyxDhEMSWda4rOfCGN/kpV6Rv7X+s34UWyat1edvRa7Pqd0cvPHCcAQl1L49eHdu
 O95g==
X-Gm-Message-State: AOAM533mWsmtaXgCSeDrGz0NzRYN2LAhUjqKSLLbtVSyuO54ofuySw7q
 o/NM7TdxtJ7QodKu7opk7V7TyitkiZT9Y+AvJpA=
X-Google-Smtp-Source: ABdhPJxOYBaQYt5v9Fn2cz5zIXi4UEg6xujF7DqDCK9jM6hIYOqRKMbGt+7iZsiOvEaIZR7iixWXzgpRLNCGbLA3Agw=
X-Received: by 2002:a05:6902:70b:: with SMTP id
 k11mr437297ybt.313.1631717403679; 
 Wed, 15 Sep 2021 07:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-3-atish.patra@wdc.com>
In-Reply-To: <20210909202639.1230170-3-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Sep 2021 22:49:52 +0800
Message-ID: <CAEUhbmU4XYbZ7fVQu2S0aAyq=MRK7d77pdhFOC-tv-E5e6C5FQ@mail.gmail.com>
Subject: Re: [ RFC v2 2/9] target/riscv: pmu: Rename the counters extension to
 pmu
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 15 Sep 2021 14:50:07 -0000

On Fri, Sep 10, 2021 at 4:27 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The PMU counters are supported via cpu config "Counters" which doesn't
> indicate the correct purpose of those counters.
>
> Rename the config property to pmu to indicate that these counters
> are performance monitoring counters. This aligns with cpu options for
> ARM architecture as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
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

The PMU extension

>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

