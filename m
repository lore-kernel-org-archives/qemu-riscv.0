Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7xfo-0005kk-IG
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 05:49:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7xfn-0005gg-7m
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 05:49:39 -0500
Received: from [2a00:1450:4864:20::32b] (port=53922
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7xfl-00031A-9l
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 05:49:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id l4so3529943wmq.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iwzwcMjeIRLTmp1Nc8qaiwKB9cl/8zDZj3j/BN+fHaM=;
 b=qMCALjiZM4MeojUh2483Jd0458z5Ca0/Zy3GZz8dtnF2gdCLlUBkse23h3pXxLDXFl
 OWQT7WuCQ8xQ/8hI0cVOThInUdKnL+ZvK3Mnat5ahF5l6QWPCpWO0UDgqcYq1wigP4CZ
 DsBF19jv2IUrZvwMleSsyLD97zKUXHUj8fFbN49m3Z40CGvFUKYoQYWbsJyblJ0109mm
 ENEGJDOSO1AEazQG7FXzMhFx0kgnytj4mLKTSNPTtkadz/J/6pr97H7lB2EH3n8nsjEi
 8EbMvuM8bxorBgtQ6GrPGj+INZdGxsvo13Q/lyvAWEfXivTgGp1Oo2Lkzz+fy5NZ1pgJ
 StGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iwzwcMjeIRLTmp1Nc8qaiwKB9cl/8zDZj3j/BN+fHaM=;
 b=I7B+2Fvogc0fOkGw48X8+cvrtrImybaUJrcFF5uOLq025Bn+Z2SgLsVGLGBJnbCTPT
 uRe/hRDIsUZ5+hocZ/Ba0OeDmdbebH/1x1ufK3eC1hhAFH0JdZ95xGRjwFGA5+4IzVW+
 2j7P7OpSxvBdZmN7iQAQS7gwiqgeVegAV0DcgKsSnfuQP4ZObEPiK8U6GOa/nrQd6C7+
 2x6h5KV4FIfjWyDiBCiFGSYeqFJos8tYRDXW9VKk1JyIDpn7bbaWBrpTatQnPu/1AP8B
 rtBuESmVxUJSO9hofR0kaAHdEOXncSsX+YoL47SjV6J6ImHYiM4YhUInuDwccfy23QUK
 61xw==
X-Gm-Message-State: AOAM531O0P2NQz6KIY2M7+4d8K9v5OhRVQ7cB9GFHItuqro5eU2g/xhD
 /ArTAaU9N1M1044wtjayFSOu3Xd1ZRV7JydqLc8eqw==
X-Google-Smtp-Source: ABdhPJw8Vc6QqTV6K0kEyeCz+pV+DDrS0+A2016udBHzP0PIK/zRxV0QtEnvVvlqAG/gwIcdjBB6LmQoAEv5O3e0fnY=
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr509067wma.137.1642070975829; 
 Thu, 13 Jan 2022 02:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-12-anup@brainfault.org>
 <CANzO1D2yuux-O8U7s03r-nXq0kxK=cWkOja2qgorrtonyiT8CQ@mail.gmail.com>
In-Reply-To: <CANzO1D2yuux-O8U7s03r-nXq0kxK=cWkOja2qgorrtonyiT8CQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jan 2022 16:19:23 +0530
Message-ID: <CAAhSdy01buVaQgvbXufQx1ULppqjgot6gF+WZFm9AzyBaeqEHA@mail.gmail.com>
Subject: Re: [PATCH v6 11/23] target/riscv: Implement AIA hvictl and hviprioX
 CSRs
To: Frank Chang <frank.chang@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32b;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 13 Jan 2022 10:49:39 -0000

On Wed, Jan 12, 2022 at 6:45 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:41=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> From: Anup Patel <anup.patel@wdc.com>
>>
>> The AIA hvictl and hviprioX CSRs allow hypervisor to control
>> interrupts visible at VS-level. This patch implements AIA hvictl
>> and hviprioX CSRs.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  target/riscv/cpu.h     |   2 +
>>  target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
>>  target/riscv/machine.c |   2 +
>>  3 files changed, 130 insertions(+)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 72d03aa126..721727c577 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -199,6 +199,7 @@ struct CPURISCVState {
>>      uint64_t htimedelta;
>>
>>      /* Hypervisor controlled virtual interrupt priorities */
>> +    target_ulong hvictl;
>>      uint8_t hviprio[64];
>>
>>      /* Virtual CSRs */
>> @@ -475,6 +476,7 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *=
env)
>>      return env->misa_mxl;
>>  }
>>  #endif
>> +#define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
>>
>>  /*
>>   * Encode LMUL to lmul as follows:
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 06db5ab1a8..decb0376fc 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -230,6 +230,15 @@ static RISCVException pointer_masking(CPURISCVState=
 *env, int csrno)
>>      return RISCV_EXCP_ILLEGAL_INST;
>>  }
>>
>> +static int aia_hmode(CPURISCVState *env, int csrno)
>> +{
>> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +     }
>> +
>> +     return hmode(env, csrno);
>> +}
>> +
>>  static int aia_hmode32(CPURISCVState *env, int csrno)
>>  {
>>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
>> @@ -1070,6 +1079,9 @@ static RISCVException rmw_sie64(CPURISCVState *env=
, int csrno,
>>      uint64_t mask =3D env->mideleg & S_MODE_INTERRUPTS;
>>
>>      if (riscv_cpu_virt_enabled(env)) {
>> +        if (env->hvictl & HVICTL_VTI) {
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +        }
>>          ret =3D rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
>>      } else {
>>          ret =3D rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask)=
;
>> @@ -1268,6 +1280,9 @@ static RISCVException rmw_sip64(CPURISCVState *env=
, int csrno,
>>      uint64_t mask =3D env->mideleg & sip_writable_mask;
>>
>>      if (riscv_cpu_virt_enabled(env)) {
>> +        if (env->hvictl & HVICTL_VTI) {
>> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> +        }
>>          ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
>>      } else {
>>          ret =3D rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask)=
;
>> @@ -1654,6 +1669,110 @@ static RISCVException write_htimedeltah(CPURISCV=
State *env, int csrno,
>>      return RISCV_EXCP_NONE;
>>  }
>>
>> +static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val=
)
>> +{
>> +    *val =3D env->hvictl;
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val=
)
>> +{
>> +    env->hvictl =3D val & HVICTL_VALID_MASK;
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int read_hvipriox(CPURISCVState *env, int first_index,
>> +                         uint8_t *iprio, target_ulong *val)
>> +{
>> +    int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env) / 32)=
;
>> +
>> +    /* First index has to be multiple of numbe of irqs per register */
>
>
> typo: number

Okay, I will update.

>
>>
>> +    if (first_index % num_irqs) {
>> +        return (riscv_cpu_virt_enabled(env)) ?
>> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_I=
NST;
>> +    }
>> +
>> +    /* Fill-up return value */
>> +    *val =3D 0;
>> +    for (i =3D 0; i < num_irqs; i++) {
>> +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)=
) {
>> +            continue;
>> +        }
>> +        if (rdzero) {
>> +            continue;
>> +        }
>> +        *val |=3D ((target_ulong)iprio[irq]) << (i * 8);
>> +    }
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int write_hvipriox(CPURISCVState *env, int first_index,
>> +                          uint8_t *iprio, target_ulong val)
>> +{
>> +    int i, irq, rdzero, num_irqs =3D 4 * (riscv_cpu_mxl_bits(env) / 32)=
;
>> +
>> +    /* First index has to be multiple of numbe of irqs per register */
>
>
> typo: number

Okay, I will update.

>
>>
>> +    if (first_index % num_irqs) {
>> +        return (riscv_cpu_virt_enabled(env)) ?
>> +               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_I=
NST;
>> +    }
>> +
>> +    /* Fill-up priority arrary */
>> +    for (i =3D 0; i < num_irqs; i++) {
>> +        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)=
) {
>> +            continue;
>> +        }
>> +        if (rdzero) {
>> +            iprio[irq] =3D 0;
>> +        } else {
>> +            iprio[irq] =3D (val >> (i * 8)) & 0xff;
>> +        }
>> +    }
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *v=
al)
>> +{
>> +    return read_hvipriox(env, 0, env->hviprio, val);
>> +}
>> +
>> +static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong v=
al)
>> +{
>> +    return write_hvipriox(env, 0, env->hviprio, val);
>> +}
>> +
>> +static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *=
val)
>> +{
>> +    return read_hvipriox(env, 4, env->hviprio, val);
>> +}
>> +
>> +static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong =
val)
>> +{
>> +    return write_hvipriox(env, 4, env->hviprio, val);
>> +}
>> +
>> +static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *v=
al)
>> +{
>> +    return read_hvipriox(env, 8, env->hviprio, val);
>> +}
>> +
>> +static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong v=
al)
>> +{
>> +    return write_hvipriox(env, 8, env->hviprio, val);
>> +}
>> +
>> +static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *=
val)
>> +{
>> +    return read_hvipriox(env, 12, env->hviprio, val);
>> +}
>> +
>> +static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong =
val)
>> +{
>> +    return write_hvipriox(env, 12, env->hviprio, val);
>> +}
>> +
>>  /* Virtual CSR Registers */
>>  static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
>>                                      target_ulong *val)
>> @@ -2308,9 +2427,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>>      [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,      w=
rite_mtval2      },
>>      [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,      w=
rite_mtinst      },
>>
>> +    /* Virtual Interrupts and Interrupt Priorities (H-extension with AI=
A) */
>> +    [CSR_HVICTL]      =3D { "hvictl",      aia_hmode, read_hvictl, writ=
e_hvictl },
>> +    [CSR_HVIPRIO1]    =3D { "hviprio1",    aia_hmode, read_hviprio1,   =
write_hviprio1 },
>> +    [CSR_HVIPRIO2]    =3D { "hviprio2",    aia_hmode, read_hviprio2,   =
write_hviprio2 },
>> +
>>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>>      [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw=
_hidelegh },
>>      [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL, rmw=
_hviph },
>> +    [CSR_HVIPRIO1H]   =3D { "hviprio1h",   aia_hmode32, read_hviprio1h,=
 write_hviprio1h },
>> +    [CSR_HVIPRIO2H]   =3D { "hviprio2h",   aia_hmode32, read_hviprio2h,=
 write_hviprio2h },
>>      [CSR_VSIEH]       =3D { "vsieh",       aia_hmode32, NULL, NULL, rmw=
_vsieh },
>>      [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw=
_vsiph },
>>
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index 44dca84ded..f027d5e307 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper =3D {
>>          VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>>          VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>>          VMSTATE_UINT64(env.htimedelta, RISCVCPU),
>> +
>> +        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>>          VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
>>
>>          VMSTATE_UINT64(env.vsstatus, RISCVCPU),
>> --
>> 2.25.1
>>
>>
>
> Otherwise,
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Regards,
Anup

