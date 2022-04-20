Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh53l-0002Yj-2w
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 03:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh53j-0002WW-Ja; Wed, 20 Apr 2022 03:47:31 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh53h-0006Nv-Ky; Wed, 20 Apr 2022 03:47:31 -0400
Received: by mail-io1-xd31.google.com with SMTP id q22so1000976iod.2;
 Wed, 20 Apr 2022 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lm5TOuY+e33mfLQleRkcYm4Wx5nSKokagZP2zqjXIkA=;
 b=lvvnu8n4jhso4d+oRVd+v98SN6LsezlrHEGnUSOstCh/qntTWPhKPMAyQHIkyd7N4t
 WOCOdr3LwH89fWRcbe5MM+rJg9Naz9cXTnVq0MWdvsG1EZ096fQFfXYdlqpOpSQuV1qe
 6Ki57RSzMFe5FhyAycLjnbQ0TZ6XecqKmDWdsbh7EaQcwNhtRDHI0Ip+Tu0sUXt+/CGS
 +YPmChVV3amrmg4j6egUPy3k00wk3Ne1PpzYmJTXEu+OUULQqaxc2J9PPCz+vFG2rEHo
 neUg0hGyRJmauOw7MSUke7T31B0NHwfVugQv/q2YGenP9zXRslevrpXnHRdVnSrI4Ak1
 Q34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lm5TOuY+e33mfLQleRkcYm4Wx5nSKokagZP2zqjXIkA=;
 b=Rzelc5RQnJG+81hAJc6yKl0gw/fO7wxS2vUapCXETYymmf1kld0s5cAkTEmJ5DKAHD
 xAXvGHQwszYYPsOsvHO/LySD18I+ajJjLt8JPX8KzSOs080FLmY95RX1E/d5rpqSXrT1
 P7DGkb88AlaNKEpe6wFfS+V5JDnkHFcGQ7ui+QLfOM2mrnDxVAaa9WBXXf0WMmS6y20U
 gON0LgFkXNNkPBv/kya1kVabJ2Hi1Cav07kvGpWyJpmnbZCp0kB3VqPDek6Wk2dUW+Ip
 R9QH2CYwtagojM7a9/4XWUVKWvxQzQCawll+fcLqARy+ZNmjjNTv7ViAoCv8fZDl3Wc2
 uRBg==
X-Gm-Message-State: AOAM530CTfeg1+QKwTkuTVidSkfSvJPAxU67UsN23nSUGRiHbRqzTCeC
 8LgGV93OLpRlqeTqXAuWnNcWEUSDHqijW2126O0=
X-Google-Smtp-Source: ABdhPJx4bvErqgmgDCNCu01JUVA7hW1DCuyOcARm5lShUYtHd35fikWFYrV8KkOOHBpBSz2HTp7oDMxtozlCI+Sr+6Y=
X-Received: by 2002:a5d:948a:0:b0:64d:23a4:9afa with SMTP id
 v10-20020a5d948a000000b0064d23a49afamr8321289ioj.114.1650440848066; Wed, 20
 Apr 2022 00:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220415093727.15323-1-frank.chang@sifive.com>
 <CAKmqyKP=kgiH05o_h1FS=acz_fsU9QkvAQ-yHa05knrnh9H-Jg@mail.gmail.com>
 <CAK9=C2UF4mR17a2---02==MaSZJLCS1Fnryd2yg_u45T9rm4mg@mail.gmail.com>
 <CAE_xrPiK6uigny61dFOFcUiNN8w3ohOba0Vo26NSyQjOb30PSg@mail.gmail.com>
 <CAE_xrPjhNC2-XHydZ-1GBZSMvz-+qCm_ohVR16Z7WjRFRCQrKw@mail.gmail.com>
In-Reply-To: <CAE_xrPjhNC2-XHydZ-1GBZSMvz-+qCm_ohVR16Z7WjRFRCQrKw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Apr 2022 17:47:02 +1000
Message-ID: <CAKmqyKOp0WJifR4VeCv-q3O58EXmvC684c6Td79Oe4m665s0gw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support configuarable marchid, mvendorid,
 mipid CSR values
To: Frank Chang <frank.chang@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jim Shu <jim.shu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 07:47:31 -0000

On Tue, Apr 19, 2022 at 5:04 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Tue, Apr 19, 2022 at 2:00 PM Frank Chang <frank.chang@sifive.com> wrote:
>>
>> On Tue, Apr 19, 2022 at 1:27 PM Anup Patel <apatel@ventanamicro.com> wrote:
>>>
>>> On Tue, Apr 19, 2022 at 10:52 AM Alistair Francis <alistair23@gmail.com> wrote:
>>> >
>>> > On Fri, Apr 15, 2022 at 7:37 PM <frank.chang@sifive.com> wrote:
>>> > >
>>> > > From: Frank Chang <frank.chang@sifive.com>
>>> > >
>>> > > Allow user to set core's marchid, mvendorid, mipid CSRs through
>>> > > -cpu command line option.
>>> > >
>>> > > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>>> > > Reviewed-by: Jim Shu <jim.shu@sifive.com>
>>> > > ---
>>> > >  target/riscv/cpu.c |  4 ++++
>>> > >  target/riscv/cpu.h |  4 ++++
>>> > >  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
>>> > >  3 files changed, 42 insertions(+), 4 deletions(-)
>>> > >
>>> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> > > index ddda4906ff..2eea0f9be7 100644
>>> > > --- a/target/riscv/cpu.c
>>> > > +++ b/target/riscv/cpu.c
>>> > > @@ -786,6 +786,10 @@ static Property riscv_cpu_properties[] = {
>>> > >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>>> > >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>>> > >
>>> > > +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>>> > > +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, 0),
>>> > > +    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, 0),
>>> >
>>> > Should we have non-zero defaults here?
>>>
>>> To do that, we need mvendorid for QEMU RISC-V.
>>>
>>> The marchid and mipid can be based on the QEMU version number.
>>>
>>> Regards,
>>> Anup
>>
>>
>> The original intention for this patch is to allow users to define
>> their own $mvendorid, $marchid, and $mipid through the command line
>> when they initiate QEMU.
>>
>> If we want to provide the default values for QEMU RISC-V CPU,
>> just like what Anup said.
>> We need to define our own mvendorid, which should be a JEDEC manufacturer ID.
>> (Perhaps it's fine to just give some random legal JEDEC manufacturer ID
>> as I don't think we would really want to spend the money on that.)

This is fine as zero I think.

>>
>> For $marchid and $mipid,
>> I agree that it could base on QEMU's version from the QEMU_FULL_VERSION macro.
>> (and $marchid should have MSB set to 1 for open-source projects.)

There could be some use in setting this to the QEMU version by
default. It doesn't really get us much though, but might be useful.

I'll take this patch as is, feel free to send a new patch if you want
to add a default value

Alistair

>>
>> Regards,
>> Frank Chang
>
>
> Another simpler way is to stick with the current approach
> and leave $mvendorid, $marchid and $mipid default to 0.
> Which is still legal as RISC-V privilege spec says:
> "A value of 0 can be returned to indicate the field is not implemented."
>
> Regards,
> Frank Chang
>
>>
>>
>>>
>>>
>>> >
>>> > Alistair
>>> >
>>> > > +
>>> > >      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>>> > >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>>> > >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>>> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> > > index c069fe85fa..3ab92deb4b 100644
>>> > > --- a/target/riscv/cpu.h
>>> > > +++ b/target/riscv/cpu.h
>>> > > @@ -370,6 +370,10 @@ struct RISCVCPUConfig {
>>> > >      bool ext_zve32f;
>>> > >      bool ext_zve64f;
>>> > >
>>> > > +    uint32_t mvendorid;
>>> > > +    uint64_t marchid;
>>> > > +    uint64_t mipid;
>>> > > +
>>> > >      /* Vendor-specific custom extensions */
>>> > >      bool ext_XVentanaCondOps;
>>> > >
>>> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> > > index 341c2e6f23..9a02038adb 100644
>>> > > --- a/target/riscv/csr.c
>>> > > +++ b/target/riscv/csr.c
>>> > > @@ -603,6 +603,36 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
>>> > >      return RISCV_EXCP_NONE;
>>> > >  }
>>> > >
>>> > > +static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
>>> > > +                                     target_ulong *val)
>>> > > +{
>>> > > +    CPUState *cs = env_cpu(env);
>>> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> > > +
>>> > > +    *val = cpu->cfg.mvendorid;
>>> > > +    return RISCV_EXCP_NONE;
>>> > > +}
>>> > > +
>>> > > +static RISCVException read_marchid(CPURISCVState *env, int csrno,
>>> > > +                                   target_ulong *val)
>>> > > +{
>>> > > +    CPUState *cs = env_cpu(env);
>>> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> > > +
>>> > > +    *val = cpu->cfg.marchid;
>>> > > +    return RISCV_EXCP_NONE;
>>> > > +}
>>> > > +
>>> > > +static RISCVException read_mipid(CPURISCVState *env, int csrno,
>>> > > +                                 target_ulong *val)
>>> > > +{
>>> > > +    CPUState *cs = env_cpu(env);
>>> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
>>> > > +
>>> > > +    *val = cpu->cfg.mipid;
>>> > > +    return RISCV_EXCP_NONE;
>>> > > +}
>>> > > +
>>> > >  static RISCVException read_mhartid(CPURISCVState *env, int csrno,
>>> > >                                     target_ulong *val)
>>> > >  {
>>> > > @@ -3098,10 +3128,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>>> > >      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
>>> > >
>>> > >      /* Machine Information Registers */
>>> > > -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
>>> > > -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
>>> > > -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
>>> > > -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
>>> > > +    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
>>> > > +    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
>>> > > +    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
>>> > > +    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
>>> > >
>>> > >      /* Machine Trap Setup */
>>> > >      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
>>> > > --
>>> > > 2.35.1
>>> > >
>>> > >
>>> >

