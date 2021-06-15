Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt3m4-0002qv-HC
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 03:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt3lz-0002nz-Dq; Tue, 15 Jun 2021 03:46:12 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:33748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt3lv-0005gI-Q9; Tue, 15 Jun 2021 03:46:11 -0400
Received: by mail-io1-xd34.google.com with SMTP id a6so42462787ioe.0;
 Tue, 15 Jun 2021 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r6MBq6riEs74phxAzBvGeW80X1CEh8c64y7E+2Ach3I=;
 b=WidclWP7dsmo0LkIRrW16zvwH8u2Tb65aJl9ZyJQafFb6qDWtp7Ngzx50UzVigtppK
 4h4Mbk/1ylwMaO5isKOI/fUSaRVli3v4jGu0ysXw+uCY/eHZj/S7+qmIIRdG0WaDMn7y
 MUyluCkzpTa1z79cQx8o/FBx7sAjNnncbVWpI/e2MbyVJxQBK9vLtW68K6gTjV3J+9ZZ
 a2F0jMxRxkqCjNbrCgG31Nhx4U5jCnG7XzlRgBizfaG/oDx6QSc8g9uAxFJSgUctW2GY
 RwoxzKl4eXGBU/p3JEA57BNXSbk28mXBEJXLAJoLpmGQKw+gc7QNQMEBKJPbVa87QKFS
 6bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r6MBq6riEs74phxAzBvGeW80X1CEh8c64y7E+2Ach3I=;
 b=Cf2e+Xtl22c04ZgtgWHkeR4ckWEvdeYXk+ZKSiek1nBa2OO6WEVmeqYmO5HtNJaULI
 dDquwfCT9BDAhFM+1CP3vm+Ch5VKx8HUOyKIkeI0bkEd0yUsKWZh84I2kdLsXS3Bwp+Z
 CMRjT922dPgnfdG4jMZgRB2RTmtjssCWrVK1gFQW6taIosuYzrrRH01FWej5PW3KSTPF
 9Yi9NHQE/Pxc775UZ49J8QINTFwEx1bZmHNAJrs56eNoLGUWE33hTaE2WHgf6gC1mu2+
 zjYYJlsG7CeTc01J4DyI8y9Ry6mtJNzKUiT+w8Gr9IqgRBY1Hotq16XHIz2j+5F7vt52
 gXGw==
X-Gm-Message-State: AOAM532K4N1eujU4nWiUI25lZ63OaB0CRBNZxxgJGVr9j6wVODRnTLFS
 B/U+N7UMnzVdv6D9eQtI7kzsYxCh+2luqlYRc1o=
X-Google-Smtp-Source: ABdhPJyqGzGm8akDzN8QPPyH4tl42fYWK219862jGUmvETeMPun+XqRHlzZt41BVKwyV7g6b/k9vtG2lnz7lAQE9wC8=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr17454176iov.42.1623743165857; 
 Tue, 15 Jun 2021 00:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-9-zhiwei_liu@c-sky.com>
 <CANzO1D1jotPbDxJj3ZxJZ7BdT0je64A9DAudEfm8=-m4DQFzoA@mail.gmail.com>
 <f3523b14-c13d-edf8-61e4-d251691130e0@c-sky.com>
 <CANzO1D00w9YBQC=nFaXVaR6ESpOvySEJkoeR5C9cPi=g667s8Q@mail.gmail.com>
 <b638f0ad-5b9e-60b3-5d5d-c7ea14172ef8@c-sky.com>
 <CANzO1D1tVhr--xVMCQ6WbxrrOLmXJFEmR2JkBc-=Q8R4j9YxnQ@mail.gmail.com>
In-Reply-To: <CANzO1D1tVhr--xVMCQ6WbxrrOLmXJFEmR2JkBc-=Q8R4j9YxnQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 17:45:39 +1000
Message-ID: <CAKmqyKNAxu9P_oefBNvcLLcFgJmk5uKDtm=j0FcSajoz+pRf-g@mail.gmail.com>
Subject: Re: [RFC PATCH 08/11] target/riscv: Update CSR xnxti in CLIC mode
To: Frank Chang <0xc0de0125@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 15 Jun 2021 07:46:13 -0000

On Fri, Jun 11, 2021 at 7:08 PM Frank Chang <0xc0de0125@gmail.com> wrote:
>
> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:56=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>>
>> On 6/11/21 4:42 PM, Frank Chang wrote:
>>
>> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B46=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:30=E5=AF=AB=E9=81=93=EF=BC=9A
>>>
>>>
>>> On 6/11/21 4:15 PM, Frank Chang wrote:
>>>
>>> LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>>>>
>>>> The CSR can be used by software to service the next horizontal interru=
pt
>>>> when it has greater level than the saved interrupt context
>>>> (held in xcause`.pil`) and greater level than the interrupt threshold =
of
>>>> the corresponding privilege mode,
>>>>
>>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>>> ---
>>>>  target/riscv/cpu_bits.h |  16 ++++++
>>>>  target/riscv/csr.c      | 114 +++++++++++++++++++++++++++++++++++++++=
+
>>>>  2 files changed, 130 insertions(+)
>>>>
>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>> index 7922097776..494e41edc9 100644
>>>> --- a/target/riscv/cpu_bits.h
>>>> +++ b/target/riscv/cpu_bits.h
>>>> @@ -166,6 +166,7 @@
>>>>  #define CSR_MCAUSE          0x342
>>>>  #define CSR_MTVAL           0x343
>>>>  #define CSR_MIP             0x344
>>>> +#define CSR_MNXTI           0x345 /* clic-spec-draft */
>>>>  #define CSR_MINTSTATUS      0x346 /* clic-spec-draft */
>>>>  #define CSR_MINTTHRESH      0x347 /* clic-spec-draft */
>>>>
>>>> @@ -187,6 +188,7 @@
>>>>  #define CSR_SCAUSE          0x142
>>>>  #define CSR_STVAL           0x143
>>>>  #define CSR_SIP             0x144
>>>> +#define CSR_SNXTI           0x145 /* clic-spec-draft */
>>>>  #define CSR_SINTSTATUS      0x146 /* clic-spec-draft */
>>>>  #define CSR_SINTTHRESH      0x147 /* clic-spec-draft */
>>>>
>>>> @@ -596,10 +598,24 @@
>>>>  #define MINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
>>>>  #define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
>>>>
>>>> +/* mcause */
>>>> +#define MCAUSE_MINHV                       0x40000000 /* minhv */
>>>> +#define MCAUSE_MPP                         0x30000000 /* mpp[1:0] */
>>>> +#define MCAUSE_MPIE                        0x08000000 /* mpie */
>>>> +#define MCAUSE_MPIL                        0x00ff0000 /* mpil[7:0] */
>>>> +#define MCAUSE_EXCCODE                     0x00000fff /* exccode[11:0=
] */
>>>> +
>>>>  /* sintstatus */
>>>>  #define SINTSTATUS_SIL                     0x0000ff00 /* sil[7:0] */
>>>>  #define SINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
>>>>
>>>> +/* scause */
>>>> +#define SCAUSE_SINHV                       0x40000000 /* sinhv */
>>>> +#define SCAUSE_SPP                         0x10000000 /* spp */
>>>> +#define SCAUSE_SPIE                        0x08000000 /* spie */
>>>> +#define SCAUSE_SPIL                        0x00ff0000 /* spil[7:0] */
>>>> +#define SCAUSE_EXCCODE                     0x00000fff /* exccode[11:0=
] */
>>>> +
>>>>  /* MIE masks */
>>>>  #define MIE_SEIE                           (1 << IRQ_S_EXT)
>>>>  #define MIE_UEIE                           (1 << IRQ_U_EXT)
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index e12222b77f..72cba080bf 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -774,6 +774,80 @@ static int rmw_mip(CPURISCVState *env, int csrno,=
 target_ulong *ret_value,
>>>>      return 0;
>>>>  }
>>>>
>>>> +static bool get_xnxti_status(CPURISCVState *env)
>>>> +{
>>>> +    CPUState *cs =3D env_cpu(env);
>>>> +    int clic_irq, clic_priv, clic_il, pil;
>>>> +
>>>> +    if (!env->exccode) { /* No interrupt */
>>>> +        return false;
>>>> +    }
>>>> +    /* The system is not in a CLIC mode */
>>>> +    if (!riscv_clic_is_clic_mode(env)) {
>>>> +        return false;
>>>> +    } else {
>>>> +        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
>>>> +                                  &clic_irq);
>>>> +
>>>> +        if (env->priv =3D=3D PRV_M) {
>>>> +            pil =3D MAX(get_field(env->mcause, MCAUSE_MPIL), env->min=
tthresh);
>>>> +        } else if (env->priv =3D=3D PRV_S) {
>>>> +            pil =3D MAX(get_field(env->scause, SCAUSE_SPIL), env->sin=
tthresh);
>>>> +        } else {
>>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                          "CSR: rmw xnxti with unsupported mode\n");
>>>> +            exit(1);
>>>> +        }
>>>> +
>>>> +        if ((clic_priv !=3D env->priv) || /* No horizontal interrupt =
*/
>>>> +            (clic_il <=3D pil) || /* No higher level interrupt */
>>>> +            (riscv_clic_shv_interrupt(env->clic, clic_priv, cs->cpu_i=
ndex,
>>>> +                                      clic_irq))) { /* CLIC vector mo=
de */
>>>> +            return false;
>>>> +        } else {
>>>> +            return true;
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +static int rmw_mnxti(CPURISCVState *env, int csrno, target_ulong *ret=
_value,
>>>> +                     target_ulong new_value, target_ulong write_mask)
>>>> +{
>>>> +    int clic_priv, clic_il, clic_irq;
>>>> +    bool ready;
>>>> +    CPUState *cs =3D env_cpu(env);
>>>> +    if (write_mask) {
>>>> +        env->mstatus |=3D new_value & (write_mask & 0b11111);
>>>> +    }
>>>> +
>>>> +    qemu_mutex_lock_iothread();
>>>
>>>
>>> Hi Zhiwei,
>>>
>>> May I ask what's the purpose to request the BQL here with qemu_mutex_lo=
ck_iothread()?
>>> Is there any critical data we need to protect in rmw_mnxti()?
>>> As far I see, rmw_mnxti() won't call cpu_interrupt() which need BQL to =
be held before calling.
>>> Am I missing anything?
>>>
>>> In my opinion, if you read or write any  MMIO register, you need to hol=
d the BQL. As you can quickly see,
>>> it calls riscv_clic_clean_pending. That's why it should hold the BQL.
>>>
>>> Zhiwei
>>
>>
>> Oh, I see.
>> The MMIO register reads and writes should also be protected by BQL.
>> Thanks for the explanation.
>>
>> I am glad to know that you are reviewing this patch set. As Sifive imple=
ments the initial v0.7 CLIC, I think you may need this patch set for your S=
OC.
>> If you like to, I am happy to see that you connect this patch set to you=
r SOC, and resend it again. I can also provide the qtest of this patch set =
if you need.
>>
>> As you may see, the v6.1 soft freeze will come in July. I am afraid I ca=
n't upstream a new SOC in so short time.
>>
>> Zhiwei
>
> Thanks, I think we will leverage the hard works you have done into our im=
plementation.
> However, I'm not sure I can catch up the deadline before v6.1's soft-free=
ze.
> But I think I can help to review the patches, at least we can speed up th=
e review process.

I just wanted to point out that in terms of *submitting* RISC-V
patches for QEMU, don't worry about the soft-freeze dates.

Feel free to send the patches during the freeze and they can be
reviewed (but not merged, unless they fix a bug). I will even apply
them to a local tree in preparation for the next merge window, after
the release.

Alistair

>
> Regarding qtest, I saw your head commit mentioned the repo you are using:=
 [1].
> Is it okay to just grab the qtest from this repo?
>
> [1]: https://github.com/romanheros/qemu/commit/bce1845ea9b079b4c360440292=
dc47725d1b24ab
>
> Thanks,
> Frank Chang
>
>>
>>
>> Regards,
>> Frank Chang
>>
>>>
>>>
>>> Regard,
>>> Frank Chang
>>>
>>>>
>>>> +    ready =3D get_xnxti_status(env);
>>>> +    if (ready) {
>>>> +        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
>>>> +                                  &clic_irq);
>>>> +        if (write_mask) {
>>>> +            bool edge =3D riscv_clic_edge_triggered(env->clic, clic_p=
riv,
>>>> +                                                  cs->cpu_index, clic=
_irq);
>>>> +            if (edge) {
>>>> +                riscv_clic_clean_pending(env->clic, clic_priv,
>>>> +                                         cs->cpu_index, clic_irq);
>>>> +            }
>>>> +            env->mintstatus =3D set_field(env->mintstatus,
>>>> +                                        MINTSTATUS_MIL, clic_il);
>>>> +            env->mcause =3D set_field(env->mcause, MCAUSE_EXCCODE, cl=
ic_irq);
>>>> +        }
>>>> +        if (ret_value) {
>>>> +            *ret_value =3D (env->mtvt & ~0x3f) + sizeof(target_ulong)=
 * clic_irq;
>>>> +        }
>>>> +    } else {
>>>> +        if (ret_value) {
>>>> +            *ret_value =3D 0;
>>>> +        }
>>>> +    }
>>>> +    qemu_mutex_unlock_iothread();
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  static int read_mintstatus(CPURISCVState *env, int csrno, target_ulon=
g *val)
>>>>  {
>>>>      *val =3D env->mintstatus;
>>>> @@ -982,6 +1056,44 @@ static int rmw_sip(CPURISCVState *env, int csrno=
, target_ulong *ret_value,
>>>>      return ret;
>>>>  }
>>>>
>>>> +static int rmw_snxti(CPURISCVState *env, int csrno, target_ulong *ret=
_value,
>>>> +                     target_ulong new_value, target_ulong write_mask)
>>>> +{
>>>> +    int clic_priv, clic_il, clic_irq;
>>>> +    bool ready;
>>>> +    CPUState *cs =3D env_cpu(env);
>>>> +    if (write_mask) {
>>>> +        env->mstatus |=3D new_value & (write_mask & 0b11111);
>>>> +    }
>>>> +
>>>> +    qemu_mutex_lock_iothread();
>>>> +    ready =3D get_xnxti_status(env);
>>>> +    if (ready) {
>>>> +        riscv_clic_decode_exccode(env->exccode, &clic_priv, &clic_il,
>>>> +                                  &clic_irq);
>>>> +        if (write_mask) {
>>>> +            bool edge =3D riscv_clic_edge_triggered(env->clic, clic_p=
riv,
>>>> +                                                  cs->cpu_index, clic=
_irq);
>>>> +            if (edge) {
>>>> +                riscv_clic_clean_pending(env->clic, clic_priv,
>>>> +                                         cs->cpu_index, clic_irq);
>>>> +            }
>>>> +            env->mintstatus =3D set_field(env->mintstatus,
>>>> +                                        MINTSTATUS_SIL, clic_il);
>>>> +            env->scause =3D set_field(env->scause, SCAUSE_EXCCODE, cl=
ic_irq);
>>>> +        }
>>>> +        if (ret_value) {
>>>> +            *ret_value =3D (env->stvt & ~0x3f) + sizeof(target_ulong)=
 * clic_irq;
>>>> +        }
>>>> +    } else {
>>>> +        if (ret_value) {
>>>> +            *ret_value =3D 0;
>>>> +        }
>>>> +    }
>>>> +    qemu_mutex_unlock_iothread();
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  static int read_sintstatus(CPURISCVState *env, int csrno, target_ulon=
g *val)
>>>>  {
>>>>      target_ulong mask =3D SINTSTATUS_SIL | SINTSTATUS_UIL;
>>>> @@ -1755,6 +1867,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
>>>>
>>>>      /* Machine Mode Core Level Interrupt Controller */
>>>>      [CSR_MTVT] =3D { "mtvt", clic,  read_mtvt,  write_mtvt      },
>>>> +    [CSR_MNXTI] =3D { "mnxti", clic,  NULL,  NULL,  rmw_mnxti   },
>>>>      [CSR_MINTSTATUS] =3D { "mintstatus", clic,  read_mintstatus },
>>>>      [CSR_MINTTHRESH] =3D { "mintthresh", clic,  read_mintthresh,
>>>>                           write_mintthresh },
>>>> @@ -1766,6 +1879,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
>>>>
>>>>      /* Supervisor Mode Core Level Interrupt Controller */
>>>>      [CSR_STVT] =3D { "stvt", clic,  read_stvt, write_stvt       },
>>>> +    [CSR_SNXTI] =3D { "snxti", clic,  NULL,  NULL,  rmw_snxti   },
>>>>
>>>>  #endif /* !CONFIG_USER_ONLY */
>>>>  };
>>>> --
>>>> 2.25.1
>>>>
>>>>

