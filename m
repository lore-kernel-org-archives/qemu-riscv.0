Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQWF0-0002np-SS
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 10:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEo-0002ld-5H; Wed, 15 Sep 2021 10:50:15 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEi-0000Sp-I6; Wed, 15 Sep 2021 10:50:13 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id y16so6281504ybm.3;
 Wed, 15 Sep 2021 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x1yR4ghg7YOKIzvcTGbz4ZFvblEibK1lCL8x3mLxukU=;
 b=VK0tVIpQmjEKeW+Bf9g2RUXEQQ0vhKHyAEemvpQaEP0O7sgvogNnc92W+3Ua+ZgOBM
 G9bmuRfyQmjeO+tiaKP3So1yNcr7owYOkQP9w+97mVFuF7fCJDFBOmC3jGPFg1qVqHPk
 huotjtk3WaqRnT0GjU2DNqxukqP975ISmnOckrVsbJYO9luyQKtNtJ2d4cfWer/XB7KE
 K0YcqhwEf+mJU/bR5OfSNrk2/rZMSePOJDUKfcf47s2vf56h4dkd9fJCzJBCnEuiHXFI
 H/NwOOALGcOKaf/WA+rakIM6grjZniyIAthgGfe/lU7gv4uUHdY2SpPhIU6PTWHzUNvn
 mbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x1yR4ghg7YOKIzvcTGbz4ZFvblEibK1lCL8x3mLxukU=;
 b=BfUxhSLouksmMzjTYeqkFMRWrXBCqnAtjZbFVFapr5MzwqN1tWtG6mfySUDCk75Zoc
 zxG1VU4AJ1GF7UvXfxDHNB7yUlMbd3aPXf8Q8fXrkB+xrzYpVZx2yxVfwHlweEtFSRHr
 Ld+n1fXBAZZFIkf6rs7bG3m8e+m6gJPZBoCvJTnURJy+Af34cYYdLOGoJUwQYDkWRqr1
 Va+mWZb8WFy60ahzFRq/jwiU3SU8iu5sZOQt1Rl5aYtxNC7iwE/3WA1NAdQIv9UQjz2K
 Ll7lZrAS9StE+RGZ//EYSXT7ztcXdigT1Te6BgagtJuvbXaMEAqIFGxJj79hpGUFeyRY
 4bLg==
X-Gm-Message-State: AOAM530juP4J03YSzYHygNlOQJtDpXaGsJsxQ7Hxg55JuZYaw5aoMnIB
 AVOemKW3V18MkQaSP5pf3hie+BQ1SUYvRV7YFTw=
X-Google-Smtp-Source: ABdhPJyO2D1QzdJOZp5bsMJmz1hk4HQdYshmkVkxDq9PIUF9YLTnipEZmemacIiivZNLUzK67UpWs+P4bhIDBGcwqPo=
X-Received: by 2002:a25:83:: with SMTP id 125mr441408yba.467.1631717407063;
 Wed, 15 Sep 2021 07:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-4-atish.patra@wdc.com>
In-Reply-To: <20210909202639.1230170-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Sep 2021 22:49:56 +0800
Message-ID: <CAEUhbmWFhsFMge6O+P+5zu_F-i46F4axmspnPFOOUve681FnsA@mail.gmail.com>
Subject: Re: [ RFC v2 3/9] target/riscv: pmu: Make number of counters
 configurable
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 14:50:21 -0000

On Fri, Sep 10, 2021 at 4:29 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The RISC-V privilege specification provides flexibility to implement
> any number of counters from 29 programmable counters. However, the Qemu

nits: %s/Qemu/QEMU

> implements all the counters.
>
> Make it configurable through pmu config parameter which now will indicate
> how many programmable counters should be implemented by the cpu.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/cpu.c |  2 +-
>  target/riscv/cpu.h |  2 +-
>  target/riscv/csr.c | 96 ++++++++++++++++++++++++++++++----------------
>  3 files changed, 65 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7a486450ebc6..eba6050324a0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -587,7 +587,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> -    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
> +    DEFINE_PROP_UINT16("pmu", RISCVCPU, cfg.ext_pmu, 16),

UINT8 should be enough. The name should better be changed to pmu-num
(cfg.pmu_num).

>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5e67003e58a3..0e2e88f3bbea 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -293,9 +293,9 @@ struct RISCVCPU {
>          bool ext_u;
>          bool ext_h;
>          bool ext_v;
> -        bool ext_pmu;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        uint16_t ext_pmu;
>
>          char *priv_spec;
>          char *user_spec;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c3ce7d83a6b2..fa014bac72ab 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -57,15 +57,45 @@ static RISCVException vs(CPURISCVState *env, int csrno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> +static RISCVException mctr(CPURISCVState *env, int csrno)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    int ctr_index;
> +    int base_csrno = CSR_MHPMCOUNTER3;
> +
> +    if (riscv_cpu_is_32bit(env) && csrno >= CSR_MCYCLEH) {
> +        /* Offset for RV32 hpmcounternh counters */

should be mhpmcounternh

> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
> +    if (!cpu->cfg.ext_pmu || ctr_index > cpu->cfg.ext_pmu) {

ctr_index >= cpu->cfg.ext_pmu

> +        /* The Counters extensions is not enabled or out of range*/

PMU extension

> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +#endif
> +}
> +
>  static RISCVException ctr(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
> +    int base_csrno = CSR_CYCLE;
> +    bool brv32 = riscv_cpu_is_32bit(env);
> +
> +    if (brv32 && csrno >= CSR_CYCLEH) {
> +        /* Offset for RV32 hpmcounternh counters */
> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
>
> -    if (!cpu->cfg.ext_pmu) {
> -        /* The Counters extensions is not enabled */
> +    if (!cpu->cfg.ext_pmu || ctr_index > (cpu->cfg.ext_pmu + 3)) {

ctr_index >=

> +        /* The Counters extensions is not enabled or out of range */

PMU extension

>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -93,7 +123,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>              }
>              break;
>          }
> -        if (riscv_cpu_is_32bit(env)) {
> +        if (brv32) {
>              switch (csrno) {
>              case CSR_CYCLEH:
>                  if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
> @@ -148,7 +178,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>              }
>              break;
>          }
> -        if (riscv_cpu_is_32bit(env)) {
> +        if (brv32) {
>              switch (csrno) {
>              case CSR_CYCLEH:
>                  if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
> @@ -1721,35 +1751,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
>      [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
>
> -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_zero },
> -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_zero },
> -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_zero },
> -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_zero },
> -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_zero },
> -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_zero },
> -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_zero },
> -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_zero },
> -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_zero },
> -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_zero },
> -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_zero },
> -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_zero },
> -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_zero },
> -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_zero },
> -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_zero },
> -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_zero },
> -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_zero },
> -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_zero },
> -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_zero },
> -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_zero },
> -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_zero },
> -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_zero },
> -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_zero },
> -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_zero },
> -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_zero },
> -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_zero },
> -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_zero },
> -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
> -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
>
>      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
>      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
> --

Regards,
Bin

