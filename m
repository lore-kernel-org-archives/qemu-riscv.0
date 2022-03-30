Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZeDk-0008Py-B2
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 15:43:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZeDi-0008Nl-Qg
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 15:43:06 -0400
Received: from [2607:f8b0:4864:20::112c] (port=33186
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nZeDg-0002HK-0C
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 15:43:06 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2e68c95e0f9so231754127b3.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6ECsazU63iZoq96CaoeDUfKmSH//9GJjsA8oxeKJgEA=;
 b=Mkt60g7uKoc272JuGHLSEtU+dhWomGyj1PXYm/uwrZzyub0nV5pgyb6kvCT1RB6l9O
 OOrlxrIdGSQGyZ2cNV8nhSzg96jfs/SfkV6t3pqxNtLEsuAF3lNYkEJs3wmQRRYBSSyk
 uo4vq+YHwTHMN70zinJyEOxGRCTa00Lthpke0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6ECsazU63iZoq96CaoeDUfKmSH//9GJjsA8oxeKJgEA=;
 b=ew20c4XjiOSErO9aR9n2YYvLbZi3KIv/DGSK8ulccUOfD4YhSghf+wYrlu+gTeNk+v
 Fl4WUf9f0y9RfNAR56foBDkhoi0509UpyydrYZCOPhkJlvI+JUbjHLeJ5fCxE84icIRZ
 bYyIh8onin61lu/x7KN4gaOjOB2QOfK915oCVvSqddJoNBdR+kYqa2PCVsq8MKvrmngK
 yUxRNmNKI//wj/nm5OCsLkVrpQJIL78MjJMGMULAmSbjfOtQgO0m/NolAz4GXMjz9U7k
 eFzyKbFg93O1AIhq3slOWbXA7KpIsKZ8orcvFQMmSzByZuWYGiNPswlRdAbxbPoBn+qj
 9cuA==
X-Gm-Message-State: AOAM530Y2IjFqCt6bTMR97llsBxqYWZvPbgpAL/005nhBAtfRM89fgSg
 Rcr/qD1cCfp1f0x9oxQgceqhUJ2GuQyu7Y5LKr7buK1tVw==
X-Google-Smtp-Source: ABdhPJzxUs8E5rMuQ9ngsgf+AX9k/Bw8fcrkMIatp5EF3jTvhdg224T9nfBqCOB4Hn7xCBwz9yAKsRoa2tvYtsJMUYk=
X-Received: by 2002:a05:690c:16:b0:2db:cfed:de0e with SMTP id
 bc22-20020a05690c001600b002dbcfedde0emr1487703ywb.271.1648669382873; Wed, 30
 Mar 2022 12:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220303235440.638790-1-atishp@rivosinc.com>
 <20220303235440.638790-7-atishp@rivosinc.com>
 <CANzO1D1xT6VvMdwqUV-cYMq6L1=-G=-kuajp2bzSeK6gaUBc+A@mail.gmail.com>
In-Reply-To: <CANzO1D1xT6VvMdwqUV-cYMq6L1=-G=-kuajp2bzSeK6gaUBc+A@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 30 Mar 2022 12:42:52 -0700
Message-ID: <CAOnJCULdf+DA0W_WNybuy5pEK5o5qVf+kqnaSBcYRqM0aHTKQQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] target/riscv: Add support for
 hpmcounters/hpmevents
To: Frank Chang <frank.chang@sifive.com>
Cc: Atish Patra <atishp@rivosinc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 30 Mar 2022 19:43:07 -0000

On Tue, Mar 15, 2022 at 12:41 AM Frank Chang <frank.chang@sifive.com> wrote=
:
>
> Atish Patra <atishp@rivosinc.com> =E6=96=BC 2022=E5=B9=B43=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=888:06=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> From: Atish Patra <atish.patra@wdc.com>
>>
>> With SBI PMU extension, user can use any of the available hpmcounters to
>> track any perf events based on the value written to mhpmevent csr.
>> Add read/write functionality for these csrs.
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>  target/riscv/cpu.h     |  11 +
>>  target/riscv/csr.c     | 466 +++++++++++++++++++++++++++--------------
>>  target/riscv/machine.c |   3 +
>>  3 files changed, 328 insertions(+), 152 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 6667ec963707..3eedd7a5888a 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -109,6 +109,8 @@ typedef struct CPURISCVState CPURISCVState;
>>  #endif
>>
>>  #define RV_VLEN_MAX 1024
>> +#define RV_MAX_MHPMEVENTS 29
>> +#define RV_MAX_MHPMCOUNTERS 32
>>
>>  FIELD(VTYPE, VLMUL, 0, 3)
>>  FIELD(VTYPE, VSEW, 3, 3)
>> @@ -261,6 +263,15 @@ struct CPURISCVState {
>>
>>      target_ulong mcountinhibit;
>>
>> +    /* PMU counter configured values */
>> +    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
>> +
>> +    /* for RV32 */
>> +    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
>> +
>> +    /* PMU event selector configured values */
>> +    target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
>> +
>>      target_ulong sscratch;
>>      target_ulong mscratch;
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 9cfbd60aaeb4..10b6e498f059 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -86,6 +86,15 @@ static RISCVException mctr(CPURISCVState *env, int cs=
rno)
>>      return RISCV_EXCP_NONE;
>>  }
>>
>> +static RISCVException mctr32(CPURISCVState *env, int csrno)
>> +{
>> +    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +
>> +    return mctr(env, csrno);
>> +}
>> +
>>  static RISCVException ctr(CPURISCVState *env, int csrno)
>>  {
>>  #if !defined(CONFIG_USER_ONLY)
>> @@ -568,6 +577,72 @@ static RISCVException read_instreth(CPURISCVState *=
env, int csrno,
>>      return RISCV_EXCP_NONE;
>>  }
>>
>> +static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *=
val)
>> +{
>> +    int evt_index =3D csrno - CSR_MHPMEVENT3;
>> +
>> +    *val =3D env->mhpmevent_val[evt_index];
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>>
>> +
>> +static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong =
val)
>> +{
>> +    int evt_index =3D csrno - CSR_MHPMEVENT3;
>> +
>> +    env->mhpmevent_val[evt_index] =3D val;
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulon=
g val)
>> +{
>> +    int ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;
>> +
>> +    env->mhpmcounter_val[ctr_index] =3D val;
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulo=
ng val)
>> +{
>> +    int ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;
>> +
>> +    env->mhpmcounterh_val[ctr_index] =3D val;
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong =
*val)
>> +{
>> +    int ctr_index;
>> +
>> +    if (env->priv =3D=3D PRV_M) {
>> +        ctr_index =3D csrno - CSR_MHPMCOUNTER3 + 3;
>> +    } else {
>> +        ctr_index =3D csrno - CSR_HPMCOUNTER3 + 3;
>> +    }
>> +    *val =3D env->mhpmcounter_val[ctr_index];
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong=
 *val)
>> +{
>> +    int ctr_index;
>> +
>> +    if (env->priv =3D=3D PRV_M) {
>> +        ctr_index =3D csrno - CSR_MHPMCOUNTER3H + 3;
>> +    } else {
>> +        ctr_index =3D csrno - CSR_HPMCOUNTER3H + 3;
>> +    }
>> +
>> +    *val =3D env->mhpmcounterh_val[ctr_index];
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +
>>  #if defined(CONFIG_USER_ONLY)
>>  static RISCVException read_time(CPURISCVState *env, int csrno,
>>                                  target_ulong *val)
>> @@ -3531,157 +3606,244 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
>>      [CSR_SPMBASE] =3D    { "spmbase", pointer_masking, read_spmbase, wr=
ite_spmbase },
>>
>>      /* Performance Counters */
>> -    [CSR_HPMCOUNTER3]    =3D { "hpmcounter3",    ctr,    read_zero },
>> -    [CSR_HPMCOUNTER4]    =3D { "hpmcounter4",    ctr,    read_zero },
>> -    [CSR_HPMCOUNTER5]    =3D { "hpmcounter5",    ctr,    read_zero },
>> -    [CSR_HPMCOUNTER6]    =3D { "hpmcounter6",    ctr,    read_zero },
>> -    [CSR_HPMCOUNTER7]    =3D { "hpmcounter7",    ctr,    read_zero },
>> -    [CSR_HPMCOUNTER8]    =3D { "hpmcounter8",    ctr,    read_zero },
>> -    [CSR_HPMCOUNTER9]    =3D { "hpmcounter9",    ctr,    read_zero },
>> -    [CSR_HPMCOUNTER10]   =3D { "hpmcounter10",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER11]   =3D { "hpmcounter11",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER12]   =3D { "hpmcounter12",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER13]   =3D { "hpmcounter13",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER14]   =3D { "hpmcounter14",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER15]   =3D { "hpmcounter15",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER16]   =3D { "hpmcounter16",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER17]   =3D { "hpmcounter17",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER18]   =3D { "hpmcounter18",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER19]   =3D { "hpmcounter19",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER20]   =3D { "hpmcounter20",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER21]   =3D { "hpmcounter21",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER22]   =3D { "hpmcounter22",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER23]   =3D { "hpmcounter23",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER24]   =3D { "hpmcounter24",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER25]   =3D { "hpmcounter25",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER26]   =3D { "hpmcounter26",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER27]   =3D { "hpmcounter27",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER28]   =3D { "hpmcounter28",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER29]   =3D { "hpmcounter29",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER30]   =3D { "hpmcounter30",   ctr,    read_zero },
>> -    [CSR_HPMCOUNTER31]   =3D { "hpmcounter31",   ctr,    read_zero },
>> -
>> -    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr,   read_zero },
>> -    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr,   read_zero },
>> -
>> -    [CSR_MCOUNTINHIBIT]  =3D { "mcountinhibit",   any,    read_mcountin=
hibit,
>> -                                                       write_mcountinhi=
bit },
>> -
>> -    [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_zero },
>> -    [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_zero },
>> -    [CSR_MHPMEVENT5]     =3D { "mhpmevent5",     any,    read_zero },
>> -    [CSR_MHPMEVENT6]     =3D { "mhpmevent6",     any,    read_zero },
>> -    [CSR_MHPMEVENT7]     =3D { "mhpmevent7",     any,    read_zero },
>> -    [CSR_MHPMEVENT8]     =3D { "mhpmevent8",     any,    read_zero },
>> -    [CSR_MHPMEVENT9]     =3D { "mhpmevent9",     any,    read_zero },
>> -    [CSR_MHPMEVENT10]    =3D { "mhpmevent10",    any,    read_zero },
>> -    [CSR_MHPMEVENT11]    =3D { "mhpmevent11",    any,    read_zero },
>> -    [CSR_MHPMEVENT12]    =3D { "mhpmevent12",    any,    read_zero },
>> -    [CSR_MHPMEVENT13]    =3D { "mhpmevent13",    any,    read_zero },
>> -    [CSR_MHPMEVENT14]    =3D { "mhpmevent14",    any,    read_zero },
>> -    [CSR_MHPMEVENT15]    =3D { "mhpmevent15",    any,    read_zero },
>> -    [CSR_MHPMEVENT16]    =3D { "mhpmevent16",    any,    read_zero },
>> -    [CSR_MHPMEVENT17]    =3D { "mhpmevent17",    any,    read_zero },
>> -    [CSR_MHPMEVENT18]    =3D { "mhpmevent18",    any,    read_zero },
>> -    [CSR_MHPMEVENT19]    =3D { "mhpmevent19",    any,    read_zero },
>> -    [CSR_MHPMEVENT20]    =3D { "mhpmevent20",    any,    read_zero },
>> -    [CSR_MHPMEVENT21]    =3D { "mhpmevent21",    any,    read_zero },
>> -    [CSR_MHPMEVENT22]    =3D { "mhpmevent22",    any,    read_zero },
>> -    [CSR_MHPMEVENT23]    =3D { "mhpmevent23",    any,    read_zero },
>> -    [CSR_MHPMEVENT24]    =3D { "mhpmevent24",    any,    read_zero },
>> -    [CSR_MHPMEVENT25]    =3D { "mhpmevent25",    any,    read_zero },
>> -    [CSR_MHPMEVENT26]    =3D { "mhpmevent26",    any,    read_zero },
>> -    [CSR_MHPMEVENT27]    =3D { "mhpmevent27",    any,    read_zero },
>> -    [CSR_MHPMEVENT28]    =3D { "mhpmevent28",    any,    read_zero },
>> -    [CSR_MHPMEVENT29]    =3D { "mhpmevent29",    any,    read_zero },
>> -    [CSR_MHPMEVENT30]    =3D { "mhpmevent30",    any,    read_zero },
>> -    [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_zero },
>> -
>> -    [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER6H]   =3D { "hpmcounter6h",   ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER7H]   =3D { "hpmcounter7h",   ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER8H]   =3D { "hpmcounter8h",   ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER9H]   =3D { "hpmcounter9h",   ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER10H]  =3D { "hpmcounter10h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER11H]  =3D { "hpmcounter11h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER12H]  =3D { "hpmcounter12h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER13H]  =3D { "hpmcounter13h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER14H]  =3D { "hpmcounter14h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER15H]  =3D { "hpmcounter15h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER16H]  =3D { "hpmcounter16h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER17H]  =3D { "hpmcounter17h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER18H]  =3D { "hpmcounter18h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER19H]  =3D { "hpmcounter19h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER20H]  =3D { "hpmcounter20h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER21H]  =3D { "hpmcounter21h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER22H]  =3D { "hpmcounter22h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER23H]  =3D { "hpmcounter23h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER24H]  =3D { "hpmcounter24h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER25H]  =3D { "hpmcounter25h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER26H]  =3D { "hpmcounter26h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER27H]  =3D { "hpmcounter27h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER28H]  =3D { "hpmcounter28h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER29H]  =3D { "hpmcounter29h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER30H]  =3D { "hpmcounter30h",  ctr32,  read_zero },
>> -    [CSR_HPMCOUNTER31H]  =3D { "hpmcounter31h",  ctr32,  read_zero },
>> -
>> -    [CSR_MHPMCOUNTER3H]  =3D { "mhpmcounter3h",  any32,  read_zero },
>> -    [CSR_MHPMCOUNTER4H]  =3D { "mhpmcounter4h",  any32,  read_zero },
>> -    [CSR_MHPMCOUNTER5H]  =3D { "mhpmcounter5h",  any32,  read_zero },
>> -    [CSR_MHPMCOUNTER6H]  =3D { "mhpmcounter6h",  any32,  read_zero },
>> -    [CSR_MHPMCOUNTER7H]  =3D { "mhpmcounter7h",  any32,  read_zero },
>> -    [CSR_MHPMCOUNTER8H]  =3D { "mhpmcounter8h",  any32,  read_zero },
>> -    [CSR_MHPMCOUNTER9H]  =3D { "mhpmcounter9h",  any32,  read_zero },
>> -    [CSR_MHPMCOUNTER10H] =3D { "mhpmcounter10h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER11H] =3D { "mhpmcounter11h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER12H] =3D { "mhpmcounter12h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER13H] =3D { "mhpmcounter13h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER14H] =3D { "mhpmcounter14h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER15H] =3D { "mhpmcounter15h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER16H] =3D { "mhpmcounter16h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER17H] =3D { "mhpmcounter17h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER18H] =3D { "mhpmcounter18h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER19H] =3D { "mhpmcounter19h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER20H] =3D { "mhpmcounter20h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER21H] =3D { "mhpmcounter21h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER22H] =3D { "mhpmcounter22h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER23H] =3D { "mhpmcounter23h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER24H] =3D { "mhpmcounter24h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER25H] =3D { "mhpmcounter25h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER26H] =3D { "mhpmcounter26h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER27H] =3D { "mhpmcounter27h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER28H] =3D { "mhpmcounter28h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER29H] =3D { "mhpmcounter29h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER30H] =3D { "mhpmcounter30h", any32,  read_zero },
>> -    [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", any32,  read_zero },
>> +    [CSR_HPMCOUNTER3]    =3D { "hpmcounter3",    ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER4]    =3D { "hpmcounter4",    ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER5]    =3D { "hpmcounter5",    ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER6]    =3D { "hpmcounter6",    ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER7]    =3D { "hpmcounter7",    ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER8]    =3D { "hpmcounter8",    ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER9]    =3D { "hpmcounter9",    ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER10]   =3D { "hpmcounter10",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER11]   =3D { "hpmcounter11",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER12]   =3D { "hpmcounter12",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER13]   =3D { "hpmcounter13",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER14]   =3D { "hpmcounter14",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER15]   =3D { "hpmcounter15",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER16]   =3D { "hpmcounter16",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER17]   =3D { "hpmcounter17",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER18]   =3D { "hpmcounter18",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER19]   =3D { "hpmcounter19",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER20]   =3D { "hpmcounter20",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER21]   =3D { "hpmcounter21",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER22]   =3D { "hpmcounter22",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER23]   =3D { "hpmcounter23",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER24]   =3D { "hpmcounter24",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER25]   =3D { "hpmcounter25",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER26]   =3D { "hpmcounter26",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER27]   =3D { "hpmcounter27",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER28]   =3D { "hpmcounter28",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER29]   =3D { "hpmcounter29",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER30]   =3D { "hpmcounter30",   ctr,    read_hpmcounte=
r },
>> +    [CSR_HPMCOUNTER31]   =3D { "hpmcounter31",   ctr,    read_hpmcounte=
r },
>> +
>> +    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr,    read_hpmcount=
er,
>> +                                                       write_mhpmcounte=
r },
>> +
>> +    [CSR_MCOUNTINHIBIT]  =3D { "mcountinhibit",  any, read_mcountinhibi=
t,
>> +                                                    write_mcountinhibit=
 },
>> +
>> +    [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT5]     =3D { "mhpmevent5",     any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT6]     =3D { "mhpmevent6",     any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT7]     =3D { "mhpmevent7",     any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT8]     =3D { "mhpmevent8",     any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT9]     =3D { "mhpmevent9",     any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT10]    =3D { "mhpmevent10",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT11]    =3D { "mhpmevent11",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT12]    =3D { "mhpmevent12",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT13]    =3D { "mhpmevent13",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT14]    =3D { "mhpmevent14",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT15]    =3D { "mhpmevent15",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT16]    =3D { "mhpmevent16",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT17]    =3D { "mhpmevent17",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT18]    =3D { "mhpmevent18",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT19]    =3D { "mhpmevent19",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT20]    =3D { "mhpmevent20",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT21]    =3D { "mhpmevent21",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT22]    =3D { "mhpmevent22",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT23]    =3D { "mhpmevent23",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT24]    =3D { "mhpmevent24",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT25]    =3D { "mhpmevent25",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT26]    =3D { "mhpmevent26",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT27]    =3D { "mhpmevent27",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT28]    =3D { "mhpmevent28",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT29]    =3D { "mhpmevent29",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT30]    =3D { "mhpmevent30",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +    [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmevent=
,
>> +                                                       write_mhpmevent =
},
>> +
>> +    [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER6H]   =3D { "hpmcounter6h",   ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER7H]   =3D { "hpmcounter7h",   ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER8H]   =3D { "hpmcounter8h",   ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER9H]   =3D { "hpmcounter9h",   ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER10H]  =3D { "hpmcounter10h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER11H]  =3D { "hpmcounter11h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER12H]  =3D { "hpmcounter12h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER13H]  =3D { "hpmcounter13h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER14H]  =3D { "hpmcounter14h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER15H]  =3D { "hpmcounter15h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER16H]  =3D { "hpmcounter16h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER17H]  =3D { "hpmcounter17h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER18H]  =3D { "hpmcounter18h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER19H]  =3D { "hpmcounter19h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER20H]  =3D { "hpmcounter20h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER21H]  =3D { "hpmcounter21h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER22H]  =3D { "hpmcounter22h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER23H]  =3D { "hpmcounter23h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER24H]  =3D { "hpmcounter24h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER25H]  =3D { "hpmcounter25h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER26H]  =3D { "hpmcounter26h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER27H]  =3D { "hpmcounter27h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER28H]  =3D { "hpmcounter28h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER29H]  =3D { "hpmcounter29h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER30H]  =3D { "hpmcounter30h",  ctr32,  read_hpmcounte=
rh },
>> +    [CSR_HPMCOUNTER31H]  =3D { "hpmcounter31h",  ctr32,  read_hpmcounte=
rh },
>> +
>> +    [CSR_MHPMCOUNTER3H]  =3D { "mhpmcounter3h",  mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER4H]  =3D { "mhpmcounter4h",  mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER5H]  =3D { "mhpmcounter5h",  mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER6H]  =3D { "mhpmcounter6h",  mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER7H]  =3D { "mhpmcounter7h",  mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER8H]  =3D { "mhpmcounter8h",  mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER9H]  =3D { "mhpmcounter9h",  mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER10H] =3D { "mhpmcounter10h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER11H] =3D { "mhpmcounter11h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER12H] =3D { "mhpmcounter12h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER13H] =3D { "mhpmcounter13h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER14H] =3D { "mhpmcounter14h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER15H] =3D { "mhpmcounter15h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER16H] =3D { "mhpmcounter16h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER17H] =3D { "mhpmcounter17h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER18H] =3D { "mhpmcounter18h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER19H] =3D { "mhpmcounter19h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER20H] =3D { "mhpmcounter20h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER21H] =3D { "mhpmcounter21h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER22H] =3D { "mhpmcounter22h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER23H] =3D { "mhpmcounter23h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER24H] =3D { "mhpmcounter24h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER25H] =3D { "mhpmcounter25h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER26H] =3D { "mhpmcounter26h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER27H] =3D { "mhpmcounter27h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER28H] =3D { "mhpmcounter28h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER29H] =3D { "mhpmcounter29h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER30H] =3D { "mhpmcounter30h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>> +    [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", mctr32,  read_hpmcount=
erh,
>> +                                                       write_mhpmcounte=
rh },
>>  #endif /* !CONFIG_USER_ONLY */
>>  };
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index 2a48bcf81d3d..d706a97e65c8 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -300,6 +300,9 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>>          VMSTATE_UINTTL(env.scounteren, RISCVCPU),
>>          VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
>>          VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
>> +        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU, RV_MAX_MHPM=
COUNTERS),
>> +        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU, RV_MAX_MHP=
MCOUNTERS),
>> +        VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEV=
ENTS),
>>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
>> --
>> 2.30.2
>>
>>
>
> Hi Atish,
>
> I encountered the compilation error when compiling user-mode QEMU
> checked out from the branch in your repo:
> error: =E2=80=98CPURISCVState {aka struct CPURISCVState}=E2=80=99 has no =
member named =E2=80=98mhpmevent_val=E2=80=99
> error: =E2=80=98CPURISCVState {aka struct CPURISCVState}=E2=80=99 has no =
member named =E2=80=98mhpmeventh_val=E2=80=99
> error: =E2=80=98CPURISCVState {aka struct CPURISCVState}=E2=80=99 has no =
member named =E2=80=98pmu_ctrs=E2=80=99
> error: =E2=80=98CPURISCVState {aka struct CPURISCVState}=E2=80=99 has no =
member named =E2=80=98priv=E2=80=99
> error: =E2=80=98CPURISCVState {aka struct CPURISCVState}=E2=80=99 has no =
member named =E2=80=98mcounteren=E2=80=99
>
> Also, some functions are defined but not used in user-mode QEMU:
> error: =E2=80=98read_scountovf=E2=80=99 defined but not used [-Werror=3Du=
nused-function]
> error: =E2=80=98write_mhpmcounterh=E2=80=99 defined but not used [-Werror=
=3Dunused-function]
> error: =E2=80=98write_mhpmcounter=E2=80=99 defined but not used [-Werror=
=3Dunused-function]
> ... etc
>
> I think you need to add the #if !defined(CONFIG_USER_ONLY) macros
> to prevent using the variables which are available only in system-mode QE=
MU
> and excluding the functions which are called only in system-mode QEMU.
>

Yup. This was an oversight on my end. Fixed now.

> Regards,
> Frank Chang



--=20
Regards,
Atish

