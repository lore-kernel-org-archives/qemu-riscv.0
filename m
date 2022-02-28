Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOXTw-000322-7j
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 23:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOXTv-00031i-Aj; Sun, 27 Feb 2022 23:17:55 -0500
Received: from [2607:f8b0:4864:20::d36] (port=45710
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nOXTs-00044L-2S; Sun, 27 Feb 2022 23:17:54 -0500
Received: by mail-io1-xd36.google.com with SMTP id c14so13402331ioa.12;
 Sun, 27 Feb 2022 20:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xx+1VhpHD3qQcVE1Zgb3kUH01ZOhSaVGhOJEcHYwpZQ=;
 b=T25uaNm2bi/bNxX8RaCDST9nEEcWn6Zzw02i5t97tm6w8UvmSL0XP1RpUW+59UOCJj
 Ffn8YVrNX7t+oyNkkPrJe/v5R9OHf1Zg07AkqGo3WQNyJ9jbt0B7APk55gQ4gyB1pOzz
 NfycM2tY+dZkYdL/UlEzcAY5SE4Bv6nqJ/QBNKb4gvO/O/6Bd2v8RsRbSYTlrjzm9jSW
 dsFoa3FGFM//4jYSaHbc4KhmbpTYRxp/hUQti3wCxKKE2ddHyQdLeniZARpCviK/GABR
 bahjQIuEzHUelZoX/UwjhSjmoli8lmM0wgTaduzDMAzWbsE3dYQAmUwJba0SFtVT4eKL
 PuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xx+1VhpHD3qQcVE1Zgb3kUH01ZOhSaVGhOJEcHYwpZQ=;
 b=NK+uz44GcW/LzL89g9iDOpvx5ONVYrmVy+Y0n9uHWxlrV/UgbcNvLdg4V7NcI7g+Ry
 76sRM4kY2gmYZmW64uzAjlUtiXuKhGNeEMH2e650YJcfRY9Go6hLNxtkcZEwPuf9ca1y
 VZZzApksY3BNsgAQ4oxsHZQOWppwc6icJyAT2g605WQy+D1JXBktI+qOllHCPmNgaida
 5gNkKCbYbdJzCiqXNgVdZfBmyKoKKcHFy/sz37fNcZKu41q8O2GEg8w6zm3DBRKnd2Hb
 3VjmFOPDa/ovAH+gKY5nkjP8GgQqhfgcg16pWRRNpeQXi+Qb8lUQJzovf4j66yZ2Iv+P
 X8hQ==
X-Gm-Message-State: AOAM530P3j+Wieo9gwgJ8CF6lfbfxS/mbbAMMYWaZQvINjSqD1/UXKnQ
 4pdNp2e5g6P1sQaVC95ljcq7+PJJLzswjeOiAio=
X-Google-Smtp-Source: ABdhPJxVAhu6PFlAmN7EnxjhE1W0yqrYgVJDp4d84xhrSuX7DPcm7eVZt/Q/+qJBdSnkEMHuhZVz4BsYi0zxdoo7zLw=
X-Received: by 2002:a02:9529:0:b0:314:5808:5de2 with SMTP id
 y38-20020a029529000000b0031458085de2mr15160941jah.68.1646021870166; Sun, 27
 Feb 2022 20:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20220219002518.1936806-1-atishp@rivosinc.com>
 <20220219002518.1936806-7-atishp@rivosinc.com>
In-Reply-To: <20220219002518.1936806-7-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Feb 2022 14:17:20 +1000
Message-ID: <CAKmqyKPdnUMGTyePoywZE_Pis_Trx6YxCP7ji=5HAdNJyzcO_g@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] target/riscv: Add support for
 hpmcounters/hpmevents
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Mon, 28 Feb 2022 04:17:55 -0000

On Sat, Feb 19, 2022 at 10:58 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> With SBI PMU extension, user can use any of the available hpmcounters to
> track any perf events based on the value written to mhpmevent csr.
> Add read/write functionality for these csrs.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     |  11 +
>  target/riscv/csr.c     | 466 +++++++++++++++++++++++++++--------------
>  target/riscv/machine.c |   3 +
>  3 files changed, 328 insertions(+), 152 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ea3862ccbf5c..cce5c3538c89 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -109,6 +109,8 @@ typedef struct CPURISCVState CPURISCVState;
>  #endif
>
>  #define RV_VLEN_MAX 1024
> +#define RV_MAX_MHPMEVENTS 29
> +#define RV_MAX_MHPMCOUNTERS 32
>
>  FIELD(VTYPE, VLMUL, 0, 3)
>  FIELD(VTYPE, VSEW, 3, 3)
> @@ -261,6 +263,15 @@ struct CPURISCVState {
>
>      target_ulong mcountinhibit;
>
> +    /* PMU counter configured values */
> +    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
> +
> +    /* for RV32 */
> +    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
> +
> +    /* PMU event selector configured values */
> +    target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2283ff33a5d7..dbb723a3307b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -84,6 +84,15 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException mctr32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return mctr(env, csrno);
> +}
> +
>  static RISCVException ctr(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -560,6 +569,72 @@ static RISCVException read_instreth(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int evt_index = csrno - CSR_MHPMEVENT3;
> +
> +    *val = env->mhpmevent_val[evt_index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    int evt_index = csrno - CSR_MHPMEVENT3;
> +
> +    env->mhpmevent_val[evt_index] = val;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
> +
> +    env->mhpmcounter_val[ctr_index] = val;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> +
> +    env->mhpmcounterh_val[ctr_index] = val;
> +
> +    return RISCV_EXCP_NONE;
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
> +    *val = env->mhpmcounter_val[ctr_index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    int ctr_index;
> +
> +    if (env->priv == PRV_M) {
> +        ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
> +    } else {
> +        ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
> +    }
> +
> +    *val = env->mhpmcounterh_val[ctr_index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +
>  #if defined(CONFIG_USER_ONLY)
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
> @@ -3515,157 +3590,244 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },
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
> -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
> -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
> -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
> -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
> -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
> -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
> -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
> -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
> -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
> -
> -    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
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
> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,    read_hpmcounter,
> +                                                       write_mhpmcounter },
> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,    read_hpmcounter,
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
> +    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
> +    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
> +                                                       write_mhpmcounterh },
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index a34cc3f69c4b..042d655ce3ef 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -300,6 +300,9 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
>          VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> +        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
> +        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
> +        VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVENTS),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> --
> 2.30.2
>
>

