Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUC6r-0008Oa-Mk
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 13:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUC6p-0008JY-LM; Wed, 07 Apr 2021 13:36:55 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUC6m-0006IF-AI; Wed, 07 Apr 2021 13:36:55 -0400
Received: by mail-io1-xd35.google.com with SMTP id j26so15101909iog.13;
 Wed, 07 Apr 2021 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQEnrvCoZwkzhvP3/1wBUZL+fcWiUeAoQ6TN+tK+HwM=;
 b=OsfB9Y3yfoeVFkOaSlYO/0K8ywl6qAEXBlmyXe4lDj6W3WRytVwO3SD8e7DiXgQ68A
 Mvx6IVgnnNcEDVqaJ2mRKYoXYVHJndiluOx3/NBDX9hd9wn8Jh3Jn2o2Zebkef+FhZjo
 Gsn9kk+xW2Y7YAuopnIzGov5A1zyvXBPs5x23wUkYj8WNAn2iBO4Mx8fZxNQuCNDQhX7
 ICMbq3PSHukPGRwjYzmSlykzgp0CKNOKPSTYvs6Lqn92/1cGeEEDnjZ7wjNUigftXFRD
 Em5zunMGWoFPs8Sg1GOn2MlmxC4tw/jhPGka5i1p23v6vB0lMkTlahQ/lkVccshXoWzz
 4ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQEnrvCoZwkzhvP3/1wBUZL+fcWiUeAoQ6TN+tK+HwM=;
 b=NcPmwNa9PMjmAzRKb/r0/bL3vcUJIoBbhCMrhOCyG8hy9JeY0lVaYLrN3WKI5JKQ9l
 QE0nOTBAqsz20b/DuQQrQNOsIEHNVq3VzlojpTTwTVitgjX2O3jpgEQjEmCicwVLNgpj
 MesQxZ3y2nxL0up6LMeOPf6N6ZKlvue8FdIwf8v8ih/OOzgdSVzAxnZQC99xcYaex/nn
 k0pgIDv+Gg4NaFltbWL36ZgecK7g3xjsEB3EIp6+P+Plp9D61tTzmMsPWfmIvbgXqM3p
 /7sCjZnSD5fG4E8Z04t5zptzbslpPbzobOE2aYglR+QZ8F1BfqDQroYOFtF2x/seUmmp
 kb/A==
X-Gm-Message-State: AOAM533P3+4XFroUxwbHJ0Q9I9VpNyo5Tu78tf4BkcKExNI11Kr9qcAP
 iwJS3L/JhdCOUovvK8J6VBJdIttw7j0KaQkLJe0=
X-Google-Smtp-Source: ABdhPJw776EU0KrsxJ7bImPs2BxHOzV3rCTAZEZEXKA2rf4bno/P28tlDELodSQL6fdJtOZ0nUfQsWAHh2/jO2oP5UE=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr4583174jak.91.1617817010339; 
 Wed, 07 Apr 2021 10:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210319194534.2082397-1-atish.patra@wdc.com>
 <20210319194534.2082397-5-atish.patra@wdc.com>
In-Reply-To: <20210319194534.2082397-5-atish.patra@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 13:34:29 -0400
Message-ID: <CAKmqyKP4_N7Y2c6brW0wk3AR+KJvyX1TBOZUGRrCGBm4KeYOZA@mail.gmail.com>
Subject: Re: [ RFC 4/6] target/riscv: Add support for hpmcounters/hpmevents
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 17:36:56 -0000

On Fri, Mar 19, 2021 at 3:46 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> With SBI PMU extension, user can use any of the available hpmcounters to
> track any perf events based on the value written to mhpmevent csr.
> Add read/write functionality for these csrs.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     |   7 +
>  target/riscv/csr.c     | 444 +++++++++++++++++++++++++++--------------
>  target/riscv/machine.c |   3 +
>  3 files changed, 302 insertions(+), 152 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 47d6caeb7354..0a2b6da78110 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -220,9 +220,16 @@ struct CPURISCVState {
>      target_ulong mcycle_prev;
>      target_ulong minstret_prev;
>
> +    /* PMU counter configured values */
> +    target_ulong mphmcounter_val[32];
> +
>      /* for RV32 */
>      target_ulong mcycleh_prev;
>      target_ulong minstreth_prev;
> +    target_ulong mphmcounterh_val[32];
> +
> +    /* PMU event selector configured values */
> +    target_ulong mphmevent_val[29];
>
>      target_ulong sscratch;
>      target_ulong mscratch;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 61036649b044..a0430bbbd145 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -422,6 +422,88 @@ static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
>      return 0;
>  }
>
> +static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int evt_index = csrno - CSR_MHPMEVENT3;
> +
> +    *val = env->mphmcounter_val[evt_index];
> +
> +    return 0;
> +}
> +
> +static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    int evt_index = csrno - CSR_MHPMEVENT3;
> +
> +    env->mphmevent_val[evt_index] = val;
> +
> +    return 0;
> +}
> +
> +static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +
> +    if (csrno == CSR_MCYCLE) {
> +        env->mphmcounter_val[0] = val;
> +        env->mcycle_prev = get_icount_ticks(false);
> +     } else if (csrno == CSR_MINSTRET) {
> +        env->mphmcounter_val[2] = val;
> +        env->minstret_prev = get_icount_ticks(false);
> +    } else {
> +        env->mphmcounter_val[ctr_index] = val;
> +    }
> +
> +    return 0;
> +}
> +
> +static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +
> +    if (csrno == CSR_MCYCLEH) {
> +        env->mphmcounterh_val[0] = val;
> +        env->mcycleh_prev = get_icount_ticks(true);
> +    } else if (csrno == CSR_MINSTRETH) {
> +        env->mphmcounterh_val[2] = val;
> +        env->minstreth_prev = get_icount_ticks(true);
> +    } else {
> +        env->mphmcounterh_val[ctr_index] = val;
> +    }
> +
> +    return 0;
> +}
> +
> +static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int ctr_index;
> +
> +    if (env->priv == PRV_M) {
> +        ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +    } else {
> +        ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
> +    }
> +    *val = env->mphmcounter_val[ctr_index];
> +
> +    return 0;
> +}
> +
> +static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int ctr_index;
> +
> +    if (env->priv == PRV_M) {
> +        ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +    } else {
> +        ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
> +    }
> +
> +    *val = env->mphmcounterh_val[ctr_index];
> +
> +    return 0;
> +}
> +
> +
>  #if defined(CONFIG_USER_ONLY)
>  static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -1568,157 +1650,215 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
>
>      /* Performance Counters */
> -    [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
> -    [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
> -    [CSR_HPMCOUNTER5]    = { "hpmcounter5",    ctr,    read_zero },
> -    [CSR_HPMCOUNTER6]    = { "hpmcounter6",    ctr,    read_zero },
> -    [CSR_HPMCOUNTER7]    = { "hpmcounter7",    ctr,    read_zero },
> -    [CSR_HPMCOUNTER8]    = { "hpmcounter8",    ctr,    read_zero },
> -    [CSR_HPMCOUNTER9]    = { "hpmcounter9",    ctr,    read_zero },
> -    [CSR_HPMCOUNTER10]   = { "hpmcounter10",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER11]   = { "hpmcounter11",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER12]   = { "hpmcounter12",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER13]   = { "hpmcounter13",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER14]   = { "hpmcounter14",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER15]   = { "hpmcounter15",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER16]   = { "hpmcounter16",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER17]   = { "hpmcounter17",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER18]   = { "hpmcounter18",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER19]   = { "hpmcounter19",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER20]   = { "hpmcounter20",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER21]   = { "hpmcounter21",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER22]   = { "hpmcounter22",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER23]   = { "hpmcounter23",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER24]   = { "hpmcounter24",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER25]   = { "hpmcounter25",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER26]   = { "hpmcounter26",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER27]   = { "hpmcounter27",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER28]   = { "hpmcounter28",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER29]   = { "hpmcounter29",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
> -    [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
> -
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
> -
> -    [CSR_MCOUNTINHIBIT]  = { "mcountinhibi",   any,    read_mcountinhibit,
> -                                                       write_mcountinhibit },
> -
> -    [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
> -    [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
> -    [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
> -    [CSR_MHPMEVENT6]     = { "mhpmevent6",     any,    read_zero },
> -    [CSR_MHPMEVENT7]     = { "mhpmevent7",     any,    read_zero },
> -    [CSR_MHPMEVENT8]     = { "mhpmevent8",     any,    read_zero },
> -    [CSR_MHPMEVENT9]     = { "mhpmevent9",     any,    read_zero },
> -    [CSR_MHPMEVENT10]    = { "mhpmevent10",    any,    read_zero },
> -    [CSR_MHPMEVENT11]    = { "mhpmevent11",    any,    read_zero },
> -    [CSR_MHPMEVENT12]    = { "mhpmevent12",    any,    read_zero },
> -    [CSR_MHPMEVENT13]    = { "mhpmevent13",    any,    read_zero },
> -    [CSR_MHPMEVENT14]    = { "mhpmevent14",    any,    read_zero },
> -    [CSR_MHPMEVENT15]    = { "mhpmevent15",    any,    read_zero },
> -    [CSR_MHPMEVENT16]    = { "mhpmevent16",    any,    read_zero },
> -    [CSR_MHPMEVENT17]    = { "mhpmevent17",    any,    read_zero },
> -    [CSR_MHPMEVENT18]    = { "mhpmevent18",    any,    read_zero },
> -    [CSR_MHPMEVENT19]    = { "mhpmevent19",    any,    read_zero },
> -    [CSR_MHPMEVENT20]    = { "mhpmevent20",    any,    read_zero },
> -    [CSR_MHPMEVENT21]    = { "mhpmevent21",    any,    read_zero },
> -    [CSR_MHPMEVENT22]    = { "mhpmevent22",    any,    read_zero },
> -    [CSR_MHPMEVENT23]    = { "mhpmevent23",    any,    read_zero },
> -    [CSR_MHPMEVENT24]    = { "mhpmevent24",    any,    read_zero },
> -    [CSR_MHPMEVENT25]    = { "mhpmevent25",    any,    read_zero },
> -    [CSR_MHPMEVENT26]    = { "mhpmevent26",    any,    read_zero },
> -    [CSR_MHPMEVENT27]    = { "mhpmevent27",    any,    read_zero },
> -    [CSR_MHPMEVENT28]    = { "mhpmevent28",    any,    read_zero },
> -    [CSR_MHPMEVENT29]    = { "mhpmevent29",    any,    read_zero },
> -    [CSR_MHPMEVENT30]    = { "mhpmevent30",    any,    read_zero },
> -    [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_zero },
> -
> -    [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_zero },
> -    [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_zero },
> -    [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_zero },
> -    [CSR_HPMCOUNTER6H]   = { "hpmcounter6h",   ctr32,  read_zero },
> -    [CSR_HPMCOUNTER7H]   = { "hpmcounter7h",   ctr32,  read_zero },
> -    [CSR_HPMCOUNTER8H]   = { "hpmcounter8h",   ctr32,  read_zero },
> -    [CSR_HPMCOUNTER9H]   = { "hpmcounter9h",   ctr32,  read_zero },
> -    [CSR_HPMCOUNTER10H]  = { "hpmcounter10h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER11H]  = { "hpmcounter11h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER12H]  = { "hpmcounter12h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER13H]  = { "hpmcounter13h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER14H]  = { "hpmcounter14h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER15H]  = { "hpmcounter15h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER16H]  = { "hpmcounter16h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER17H]  = { "hpmcounter17h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER18H]  = { "hpmcounter18h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER19H]  = { "hpmcounter19h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER20H]  = { "hpmcounter20h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER21H]  = { "hpmcounter21h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER22H]  = { "hpmcounter22h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER23H]  = { "hpmcounter23h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER24H]  = { "hpmcounter24h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER25H]  = { "hpmcounter25h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER26H]  = { "hpmcounter26h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER27H]  = { "hpmcounter27h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER28H]  = { "hpmcounter28h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER29H]  = { "hpmcounter29h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER30H]  = { "hpmcounter30h",  ctr32,  read_zero },
> -    [CSR_HPMCOUNTER31H]  = { "hpmcounter31h",  ctr32,  read_zero },
> -
> -    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  any32,  read_zero },
> -    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  any32,  read_zero },
> -    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  any32,  read_zero },
> -    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  any32,  read_zero },
> -    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  any32,  read_zero },
> -    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  any32,  read_zero },
> -    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  any32,  read_zero },
> -    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
> -    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
> +    [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER5]    = { "hpmcounter5",    ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER6]    = { "hpmcounter6",    ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER7]    = { "hpmcounter7",    ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER8]    = { "hpmcounter8",    ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER9]    = { "hpmcounter9",    ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER10]   = { "hpmcounter10",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER11]   = { "hpmcounter11",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER12]   = { "hpmcounter12",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER13]   = { "hpmcounter13",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER14]   = { "hpmcounter14",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER15]   = { "hpmcounter15",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER16]   = { "hpmcounter16",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER17]   = { "hpmcounter17",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER18]   = { "hpmcounter18",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER19]   = { "hpmcounter19",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER20]   = { "hpmcounter20",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER21]   = { "hpmcounter21",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER22]   = { "hpmcounter22",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER23]   = { "hpmcounter23",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER24]   = { "hpmcounter24",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER25]   = { "hpmcounter25",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER26]   = { "hpmcounter26",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER27]   = { "hpmcounter27",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER28]   = { "hpmcounter28",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER29]   = { "hpmcounter29",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_hpmcounter },
> +    [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_hpmcounter },
> +
> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +
> +    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any, read_mcountinhibit,
> +                                                    write_mcountinhibit },
> +
> +    [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT6]     = { "mhpmevent6",     any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT7]     = { "mhpmevent7",     any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT8]     = { "mhpmevent8",     any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT9]     = { "mhpmevent9",     any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT10]    = { "mhpmevent10",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT11]    = { "mhpmevent11",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT12]    = { "mhpmevent12",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT13]    = { "mhpmevent13",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT14]    = { "mhpmevent14",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT15]    = { "mhpmevent15",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT16]    = { "mhpmevent16",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT17]    = { "mhpmevent17",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT18]    = { "mhpmevent18",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT19]    = { "mhpmevent19",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT20]    = { "mhpmevent20",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT21]    = { "mhpmevent21",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT22]    = { "mhpmevent22",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT23]    = { "mhpmevent23",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT24]    = { "mhpmevent24",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT25]    = { "mhpmevent25",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT26]    = { "mhpmevent26",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT27]    = { "mhpmevent27",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT28]    = { "mhpmevent28",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT29]    = { "mhpmevent29",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT30]    = { "mhpmevent30",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +    [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
> +                                                       write_mhpmevent },
> +
> +    [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER6H]   = { "hpmcounter6h",   ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER7H]   = { "hpmcounter7h",   ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER8H]   = { "hpmcounter8h",   ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER9H]   = { "hpmcounter9h",   ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER10H]  = { "hpmcounter10h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER11H]  = { "hpmcounter11h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER12H]  = { "hpmcounter12h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER13H]  = { "hpmcounter13h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER14H]  = { "hpmcounter14h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER15H]  = { "hpmcounter15h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER16H]  = { "hpmcounter16h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER17H]  = { "hpmcounter17h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER18H]  = { "hpmcounter18h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER19H]  = { "hpmcounter19h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER20H]  = { "hpmcounter20h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER21H]  = { "hpmcounter21h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER22H]  = { "hpmcounter22h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER23H]  = { "hpmcounter23h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER24H]  = { "hpmcounter24h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER25H]  = { "hpmcounter25h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER26H]  = { "hpmcounter26h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER27H]  = { "hpmcounter27h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER28H]  = { "hpmcounter28h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER29H]  = { "hpmcounter29h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER30H]  = { "hpmcounter30h",  ctr32,  read_hpmcounterh },
> +    [CSR_HPMCOUNTER31H]  = { "hpmcounter31h",  ctr32,  read_hpmcounterh },
> +
> +    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_hpmcounterh },
> +    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_hpmcounterh },
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index b1410419cc1f..d70531402d86 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -182,6 +182,9 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mcycleh_prev, RISCVCPU),
>          VMSTATE_UINTTL(env.minstret_prev, RISCVCPU),
>          VMSTATE_UINTTL(env.minstreth_prev, RISCVCPU),
> +        VMSTATE_UINTTL_ARRAY(env.mphmcounter_val, RISCVCPU, 32),
> +        VMSTATE_UINTTL_ARRAY(env.mphmcounterh_val, RISCVCPU, 32),
> +        VMSTATE_UINTTL_ARRAY(env.mphmevent_val, RISCVCPU, 29),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> --
> 2.25.1
>
>

