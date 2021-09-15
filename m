Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQWF6-0002pM-11
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 10:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEp-0002mT-Lf; Wed, 15 Sep 2021 10:50:18 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:47029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQWEn-0000Ua-To; Wed, 15 Sep 2021 10:50:15 -0400
Received: by mail-yb1-xb30.google.com with SMTP id k65so6165617yba.13;
 Wed, 15 Sep 2021 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zArwPCsYA9V6eSa3oV+NlXiDaER6ho7k11f768dGaw=;
 b=B7YUaJEb1OoEnWpFfc4Z9lKkREsoCIErRarijoCBd5gzKu32J1BSKUmNOISatYyQNH
 gFozTKj5Nxjk5rma5oGpulVvh9BEe9D194ZoQTv5jt+W24LD/CkdwCthHW6VNK4khLzr
 iBBKBns1cOluzGoXfn8QNMfm3RgqedpF+fpTF4YnW5RqbdmaXNMhPpDbrrnquJ8PJpQn
 fMExRPGShot9H8k+IWBj/2gCQrptAUahmqFh9qeF5gO5Wgp5f+JJJHzCmoSvOQbwxGP8
 RNLEBY4Vn5r7uUyMYAcCIpUep/KgtfIIp9qiHpKT5Np9oHIpTO5u6penaI+Msrwvr3yk
 Ph9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zArwPCsYA9V6eSa3oV+NlXiDaER6ho7k11f768dGaw=;
 b=spMdL8g5gdmzD53FUc1WYjqXurMMjnkV7IduHL8n47pv9szJakrMN8OiF1dpO1oAcT
 RBqoxyqWyt6F9hq/ytytntVg3RAYVMyzDHCSUqL1V7ywiyu7Hf9rNnTR93l/9GEqyCtH
 gXwZss+kN+PJ6bpqCuzgkvhvY546Torq2hxWitwPRLEd12aZPjGvhnEKTitZJpjRnm8I
 quge7a9RTpTXG4ALOiQBrxPef46hZqs3J4mBbq/iYQQ8C0sZFHevAxx+7o0hYLHKdJ9Z
 wRsHLPFOgMhoWCi4WNwKyEGOFfTPmq9UI/vmFHT9Ox8lZYXlABykrOzsxh1hZt+YT62b
 T5Jw==
X-Gm-Message-State: AOAM5336qXeYnzImwBNf2/yJzcJR75+zjRa0WWj+EhDD+IAWhEQTbfIO
 1QlKoQeXO7XanZst9ll7UPiTGO47QbB7cu/pfw0=
X-Google-Smtp-Source: ABdhPJwUIU0uBMYpKM2CrnEkbE1eNHjJTP19IDnBDCy1PO8UdmtYEcCxzkQlQVuTbssTe35ysZsXycvSHbt6/fHiCXs=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr418165ybm.345.1631717410685; 
 Wed, 15 Sep 2021 07:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210909202639.1230170-1-atish.patra@wdc.com>
 <20210909202639.1230170-5-atish.patra@wdc.com>
In-Reply-To: <20210909202639.1230170-5-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Sep 2021 22:49:59 +0800
Message-ID: <CAEUhbmUgEaxsT+FmkJ6E_A2mQASh8GwBsAD7=214snZsSjOXNg@mail.gmail.com>
Subject: Re: [ RFC v2 4/9] target/riscv: Implement mcountinhibit CSR
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 14:50:26 -0000

On Fri, Sep 10, 2021 at 4:29 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> As per the privilege specification v1.11, mcountinhibit allows to start/stop
> a pmu counter selectively.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  target/riscv/cpu.h      |  2 ++
>  target/riscv/cpu_bits.h |  4 ++++
>  target/riscv/csr.c      | 25 +++++++++++++++++++++++++
>  target/riscv/machine.c  |  5 +++--
>  4 files changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0e2e88f3bbea..bdb488cdbccc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -219,6 +219,8 @@ struct CPURISCVState {
>      target_ulong scounteren;
>      target_ulong mcounteren;
>
> +    target_ulong mcountinhibit;
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7330ff5a194c..ac519dcdc4df 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -275,6 +275,10 @@
>  #define CSR_MHPMCOUNTER29   0xb1d
>  #define CSR_MHPMCOUNTER30   0xb1e
>  #define CSR_MHPMCOUNTER31   0xb1f
> +
> +/* Machine counter-inhibit register */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  #define CSR_MHPMEVENT3      0x323
>  #define CSR_MHPMEVENT4      0x324
>  #define CSR_MHPMEVENT5      0x325
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fa014bac72ab..a155a4370d6b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -766,6 +766,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
> +                                         target_ulong *val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return -RISCV_EXCP_ILLEGAL_INST;

This should be RISCV_EXCP_ILLEGAL_INST

> +    }
> +
> +    *val = env->mcountinhibit;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
> +                                          target_ulong val)
> +{
> +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> +        return -RISCV_EXCP_ILLEGAL_INST;

ditto

> +    }
> +
> +    env->mcountinhibit = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>  {
> @@ -1781,6 +1803,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
>      [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
>
> +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibi",   any,    read_mcountinhibit,

missing 't' in the register name

> +                                                       write_mcountinhibit },
> +
>      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
>      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
>      [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 16a08302daff..20dea0843604 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper = {
>
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
>          VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
> @@ -177,6 +177,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mtval, RISCVCPU),
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> +        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> --

Regards,
Bin

