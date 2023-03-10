Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paQTB-0000iG-6N
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 19:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQT8-0000hk-QR; Thu, 09 Mar 2023 19:18:46 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQT6-0003DY-PC; Thu, 09 Mar 2023 19:18:46 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id x14so3226808vso.9;
 Thu, 09 Mar 2023 16:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678407523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5aq7e3bRxnNfv6pJGwT9ZfROZJqbGJaBjer/bMRRlw=;
 b=YN2MkNADfKmQyLQhL4GuAv9ox1/MKhlMLd0P8ZS2OwR9QXqBqLpxu/e8jB7MKw2fSk
 uQcRwR/QSoirptje3CYCxeGZBgxttBPPtPaoJCKVIzCd1wK6nfUsH5bNxMKKtn8+i1ud
 2PHruAwemnPOiceSPqcMklgRRR7Y7FScHsFKRf/3jZmWA2JcbDgNc3aZwOlO1QkEpve8
 KYudSeq6PE+Yvu6D6l88SAZFw6Rz3Yso2ZxK1QxX5RdBLZD8rrYmr50eKEoqSbUvaRew
 /XC/Qpu8YJ7xXLg1j8mXzcJfBWm4qpAHqi680JTdjSnPCQHWzMtBCGESD8ZLWrFMva/s
 bpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678407523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5aq7e3bRxnNfv6pJGwT9ZfROZJqbGJaBjer/bMRRlw=;
 b=uJ6dxVqCZUWd0tMJURtWfjLS+VgFldgrQ7MwnVF3cHG0Va1UrEQaooMyu7cmvuqvVC
 OAKp+2IwmiDnRjbXd1evDTasQHBw6qtZX+GMLNqLDYW2v1424w0HCCYvi6ublxpU2AKH
 SmFmmnmfaMmiBuPDK7Uj7BjanIA1zZcWmg8ORSUaeC+Vyn0+QYbqvW0kh80XoX6rllaZ
 Jt9d2MI2bDrTIR48tBBBL0hvjACfIP5k/Q+O3sPOztuRV5gwaFZ8sgQl7u6+go4A1YJc
 cy+CCwBjA/XawSdrGN/oc3ibZJvSvlgyAYoCdEYy/Dhdj5Yof29vh0OVetAFBCkwYGbF
 fnJA==
X-Gm-Message-State: AO0yUKXNhAp5wwtm9bhapvk3vMR3EXT0MCQ4dzfI5clWvm0Fyd3bruNr
 6dzECYpWNpmrtipTX9yzDnRxsxQFxWtkCZEKTfA=
X-Google-Smtp-Source: AK7set9ZN2r2qm4q7SkEy9S1YNVvKUNKYU3Q7IdhWBwegXlvElxEOsL86pmqLs8YFVqQwLqoXInrhe+/SXmYjmf/nqs=
X-Received: by 2002:a67:e3cb:0:b0:421:e25b:3d0c with SMTP id
 k11-20020a67e3cb000000b00421e25b3d0cmr9981021vsm.3.1678407523314; Thu, 09 Mar
 2023 16:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-4-dbarboza@ventanamicro.com>
 <9bb69365-f291-8515-2afa-1792998601b8@linux.alibaba.com>
 <34d490d3-0444-e312-a125-3c2b9d3220e1@ventanamicro.com>
In-Reply-To: <34d490d3-0444-e312-a125-3c2b9d3220e1@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 10:18:16 +1000
Message-ID: <CAKmqyKN0aeMkKikSNqUpHciX3oLYS7=JjxaNOH6HNm5nSek2vw@mail.gmail.com>
Subject: Re: [PATCH for-8.1 03/17] target/riscv/cpu.c: remove
 set_priv_version()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org, 
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Fri, 10 Mar 2023 00:18:47 -0000

On Fri, Mar 10, 2023 at 2:23=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 3/9/23 04:28, LIU Zhiwei wrote:
> >
> > On 2023/3/9 4:19, Daniel Henrique Barboza wrote:
> >> The setter is doing nothing special. Just set env->priv_ver directly.
> > IMHO, No better than the older implementation.
>
> In the current context having a setter means that the function is doing
> something else other than simply setting the attr. Because we're setting =
a
> lot of other 'env' attrs directly: env->pc, env->priv, env->menvcfg and
> so on. So a setter is a special function (e.g. set_misa()).
>
> But then set_priv_version() and set_vext_version() are just setting
> env->priv_ver/env->vext_version and nothing else. This means that every
> time we read
>
> "set_priv_version(env, val)"
>
> We're either required to remember that this is just a simple setter or we=
 spend
> a few seconds looking it up to see that it's a simple setter. We could, i=
nstead,
> just read
>
> "env->priv_ver =3D val"
>
> and moved on.
>
>
> I really think we should get rid of all these kind of setters in the code=
. It's not
> like these are user facing APIs that needs encapsulation.

I tend to agree. I don't think they add anything. I guess you could
debate they are kind of self commenting as the function name describes
what is happening, but I think in a lot of cases it's pretty clear as
is.

Alistair

>
>
> Thanks,
>
>
> Daniel
>
>
>
> >
> > Zhiwei
> >
> >>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   target/riscv/cpu.c | 30 +++++++++++++-----------------
> >>   1 file changed, 13 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 0baed79ec2..964817b9d2 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -240,11 +240,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL=
 mxl, uint32_t ext)
> >>       env->misa_ext_mask =3D env->misa_ext =3D ext;
> >>   }
> >> -static void set_priv_version(CPURISCVState *env, int priv_ver)
> >> -{
> >> -    env->priv_ver =3D priv_ver;
> >> -}
> >> -
> >>   #ifndef CONFIG_USER_ONLY
> >>   static uint8_t satp_mode_from_str(const char *satp_mode_str)
> >>   {
> >> @@ -343,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
> >>                                       VM_1_10_SV32 : VM_1_10_SV57);
> >>   #endif
> >> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
> >>       register_cpu_props(obj);
> >>   }
> >> @@ -355,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
> >>       set_misa(env, MXL_RV64, 0);
> >>       register_cpu_props(obj);
> >>       /* Set latest version of privileged specification */
> >> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
> >>   #endif
> >> @@ -366,7 +361,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
> >>       CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> >>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS =
| RVU);
> >>       register_cpu_props(obj);
> >> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> >>   #endif
> >> @@ -379,7 +374,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
> >>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> >>       register_cpu_props(obj);
> >> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
> >>       cpu->cfg.mmu =3D false;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >> @@ -392,7 +387,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
> >>       RISCVCPU *cpu =3D RISCV_CPU(obj);
> >>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS =
| RVU);
> >> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_11_0;
> >>       cpu->cfg.ext_g =3D true;
> >>       cpu->cfg.ext_c =3D true;
> >> @@ -431,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
> >>       set_misa(env, MXL_RV128, 0);
> >>       register_cpu_props(obj);
> >>       /* Set latest version of privileged specification */
> >> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
> >>   #endif
> >> @@ -444,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
> >>       set_misa(env, MXL_RV32, 0);
> >>       register_cpu_props(obj);
> >>       /* Set latest version of privileged specification */
> >> -    set_priv_version(env, PRIV_VERSION_1_12_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_12_0;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> >>   #endif
> >> @@ -454,8 +449,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
> >>   {
> >>       CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> >>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS =
| RVU);
> >> +
> >>       register_cpu_props(obj);
> >> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> >>   #endif
> >> @@ -468,7 +464,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
> >>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> >>       register_cpu_props(obj);
> >> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
> >>       cpu->cfg.mmu =3D false;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >> @@ -482,7 +478,7 @@ static void rv32_ibex_cpu_init(Object *obj)
> >>       set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> >>       register_cpu_props(obj);
> >> -    set_priv_version(env, PRIV_VERSION_1_11_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_11_0;
> >>       cpu->cfg.mmu =3D false;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >> @@ -497,7 +493,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj=
)
> >>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> >>       register_cpu_props(obj);
> >> -    set_priv_version(env, PRIV_VERSION_1_10_0);
> >> +    env->priv_ver =3D PRIV_VERSION_1_10_0;
> >>       cpu->cfg.mmu =3D false;
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >> @@ -1159,7 +1155,7 @@ static void riscv_cpu_realize(DeviceState *dev, =
Error **errp)
> >>       }
> >>       if (priv_version >=3D PRIV_VERSION_1_10_0) {
> >> -        set_priv_version(env, priv_version);
> >> +        env->priv_ver =3D priv_version;
> >>       }
> >>       /* Force disable extensions if priv spec version does not match =
*/
>

