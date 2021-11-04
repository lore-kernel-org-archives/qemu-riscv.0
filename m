Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mibBp-0008Bt-NR
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 07:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mibBk-0008AV-SV; Thu, 04 Nov 2021 07:45:51 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mibBi-0004qb-A8; Thu, 04 Nov 2021 07:45:48 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o12so13824594ybk.1;
 Thu, 04 Nov 2021 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uk+t6q1ReiE6klt/lc8i27f+JFTd6/GiQ01xmR/eDcQ=;
 b=aoIqvNRuAbCLb1/nuiRRgcxVod0W/cF53ouL/oUR0SWgNodcysaLfsxXdxQO/UImyn
 Ekzj2VU0FZZmPHvjrcLmM+Tp567COXjAsxtSdRDab/srxu/YgunSgARb7SfVOxGnXken
 ct3CEAvyBUBALrx2EoyY6p2++G1BKFEgZ/LG1wtKfrw5UBfH+vEDhUMYb4UV2e83qP+u
 hR5xRqXEubEFmc261YL3Q7UlH/RsEgaSFRX+hcAPvBc0MOIit/KYenLUlTDcfs3uKxZn
 4cZhyzeT8B3ixOUspEP0DXMd1lb0eNXOfuxoxbC+uW/ReEXCzwFFpFkvROXYSREUi5DZ
 CN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uk+t6q1ReiE6klt/lc8i27f+JFTd6/GiQ01xmR/eDcQ=;
 b=c3YQ3r2LVlC2F7WWkHznq4aNr6k4CZ/ijnCgoj/7eZt1/BbdKePBrvCXy+tRpKbmRb
 gQAk+x8YJwm/8QBrTNGOhcd1jQ0KCEBvwFS72Zzdef+m9V2idKkZ3ddrJWFMSgTgknTA
 PtZw8JdgSFqxR5UP0cf5vvxbGmKHpDl/MaCVYw1djxlVVeJhTmvEP/ZcHYf4JeDlw9BR
 c2xDI1YTyUwnBaf35KERSEpeSIYIgQugfeX8CH0ciyuzUH8SOp9XkY+xZtdXIJuyXNG5
 gGHo/eB4IojyCaQmTovK6tn/2VmSSDIYa1SBSg2wGUlPK6vqZ3YJf7IBkxfEIFr+T4ev
 w5MA==
X-Gm-Message-State: AOAM5303tGLQMCHWRRryGVL7BkbGQEZ0TZGa9axiXtDyGA2Bt2hLWCeH
 /1eIIAXGSLp+Ac/rQTcHCaq0x0pXFHtmeJHoFKPJAKNX
X-Google-Smtp-Source: ABdhPJxnnPZ1q8iinxEz+DpahOs2O8YiAYHk7SIjBHl+gGNpHxyHJw2N2BB2nEPsv4TSDrlKZdDr09GQ8nejM/FGE6Q=
X-Received: by 2002:a25:2346:: with SMTP id j67mr842409ybj.467.1636026344278; 
 Thu, 04 Nov 2021 04:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-5-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-5-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 4 Nov 2021 19:45:32 +0800
Message-ID: <CAEUhbmV0kH8ZG7A0jiWAKTj4j3rhHrTCZY1diDWibPhMgcoiFw@mail.gmail.com>
Subject: Re: [ PATCH v3 04/10] target/riscv: pmu: Make number of counters
 configurable
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 04 Nov 2021 11:45:52 -0000

On Tue, Oct 26, 2021 at 4:41 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The RISC-V privilege specification provides flexibility to implement
> any number of counters from 29 programmable counters. However, the QEMU
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
> index 3b55f5ed0036..aec94101a4c0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -598,7 +598,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> -    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ebc1a8754032..d0a722e7cbe1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -294,10 +294,10 @@ struct RISCVCPU {
>          bool ext_zbb;
>          bool ext_zbc;
>          bool ext_zbs;
> -        bool ext_pmu;
>          bool ext_ifencei;
>          bool ext_icsr;
>
> +        uint8_t pmu_num;
>          char *priv_spec;
>          char *user_spec;
>          char *bext_spec;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c486eeaffeb8..a7249eaf917f 100644
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
> +        /* Offset for RV32 mhpmcounternh counters */
> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
> +    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
> +        /* The PMU is not enabled or counter is out of range*/
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

Use CSR_HPMCOUNTER3 here, for consistency with the mctr version

> +    bool brv32 = riscv_cpu_is_32bit(env);

nits: the leading 'b' sounds useless. I would use rv32 instead.

> +
> +    if (brv32 && csrno >= CSR_CYCLEH) {
> +        /* Offset for RV32 hpmcounternh counters */
> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
>
> -    if (!cpu->cfg.ext_pmu) {
> -        /* The Counters extensions is not enabled */
> +    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num + 3)) {

so we can use "ctr_index >= cpu->cfg.pmu_num" here

> +        /* The PMU is not enabled or counter is out of range */
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
>                  if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> @@ -148,7 +178,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>              }
>              break;
>          }
> -        if (riscv_cpu_is_32bit(env)) {
> +        if (brv32) {
>              switch (csrno) {
>              case CSR_CYCLEH:
>                  if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> @@ -1720,35 +1750,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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

Regards,
Bin

