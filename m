Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nR7pj-0008Fh-6a
	for mharc-qemu-riscv@gnu.org; Mon, 07 Mar 2022 02:31:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nR7pa-0008CG-Rc
 for qemu-riscv@nongnu.org; Mon, 07 Mar 2022 02:30:58 -0500
Received: from [2607:f8b0:4864:20::42b] (port=39870
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nR7pY-00051J-AF
 for qemu-riscv@nongnu.org; Mon, 07 Mar 2022 02:30:58 -0500
Received: by mail-pf1-x42b.google.com with SMTP id d17so4153628pfv.6
 for <qemu-riscv@nongnu.org>; Sun, 06 Mar 2022 23:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdeU+sjY6VX/2oE75mtjm4Y8EaSVUCRuD/mTH+0DUKE=;
 b=Gz/psIc9SqsuB36SvkJesXClyv/GZuiy3AoYH8SqbXNDtnEBdhSYSCDyrhk3K75PIn
 u5f17am4wVCeoMEKWd1ez/5WAK90iB4XG5+sVuYyNHsYZgBW6VMoaNpqHhDr6i5JkJTM
 /76bh+ScIzQnqjKMgOl7BwOXLUyilU0QJj+URHuhY0Gn9I5mFRn6t5w26SgdLLHERvkr
 L5ne+1+PjM2jTEuzrF1Zr4dLlWkYiybygAdCkXyv6ZuDTrCnPXWgJP2W0sD/Nb/l1yM+
 kytJ8esuyu3wDpHMSom01vq048WmNHhwlFiejEGi1CB9M1ojZ1J0lKA08yXaD5aMk918
 dHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdeU+sjY6VX/2oE75mtjm4Y8EaSVUCRuD/mTH+0DUKE=;
 b=4lTmMbrRZcXZf8UPpnS34IP+m4wK6JFVg7NSp/c9WXcLNE3iNxl2NukG0xZKw0WFKL
 tJvA774+ObRxGn/3a0l+qRBvQGcUUx0Pp+DwwNVfHvxzvZwFYj0zYsBXW4KkrCyFWwn1
 uuqosKW3sjEdi2rHJFQBofH0iePLu3LNVQ4BoPCFzT4a7KOqUFL94xptOnJl7XMR22CX
 Qcb1PL1H+MQwGfkSeNo21K9OBm5LQgSoSKUu98Hkan2FPVmdFovBkpxx34JkXvoDTqD9
 Fj/20QqZFWSoLcQ1zVXpOY+pJYWEY7fgI6Na9j3I1mnb6S/xR0hIsEcMJZvla1DjKcGZ
 HhHw==
X-Gm-Message-State: AOAM530i6hYg65EgO5dLRN7D47A06LYIz122icYpBH3mxvHKxmB5EhQh
 UmhMnaKFgta9OQhgcInGjY1zrtnbbva1vQ==
X-Google-Smtp-Source: ABdhPJwvm/raXQGHYt5rq5IF1yL8HbVP3kbtlK1FPpOzpIys7qQqLTtvT+AAx3TWjym+RgG1FtHmKg==
X-Received: by 2002:a05:6a00:1950:b0:4f6:369b:4c4d with SMTP id
 s16-20020a056a00195000b004f6369b4c4dmr11385753pfk.79.1646638253280; 
 Sun, 06 Mar 2022 23:30:53 -0800 (PST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com.
 [209.85.214.171]) by smtp.gmail.com with ESMTPSA id
 f6-20020a056a00228600b004f709f5f3c1sm1520730pfe.28.2022.03.06.23.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 23:30:52 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id s1so12984806plg.12;
 Sun, 06 Mar 2022 23:30:52 -0800 (PST)
X-Received: by 2002:a17:902:d48b:b0:151:a5a0:e117 with SMTP id
 c11-20020a170902d48b00b00151a5a0e117mr10814166plg.119.1646638251769; Sun, 06
 Mar 2022 23:30:51 -0800 (PST)
MIME-Version: 1.0
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <20220216154839.1024927-3-cmuellner@linux.com>
 <2c0fcafe-868a-ba7a-bf42-3a4ed2df19ba@iscas.ac.cn>
 <CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com>
In-Reply-To: <CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 7 Mar 2022 15:30:40 +0800
X-Gmail-Original-Message-ID: <CANzO1D32StU_rteH5J+Xfd5hCzE99MKbCnscw=HaJeOS6w+KcQ@mail.gmail.com>
Message-ID: <CANzO1D32StU_rteH5J+Xfd5hCzE99MKbCnscw=HaJeOS6w+KcQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/riscv: Enable Zicbo[m,z,p] instructions
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>, 
 Atish Patra <atishp@rivosinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: multipart/alternative; boundary="0000000000001202fa05d99bd865"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Mon, 07 Mar 2022 07:30:59 -0000

--0000000000001202fa05d99bd865
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Christoph M=C3=BCllner <cmuellner@linux.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=
=8817=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:00=E5=AF=AB=E9=81=93=
=EF=BC=9A

>
>
> On Thu, Feb 17, 2022 at 3:15 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>>
>> =E5=9C=A8 2022/2/16 =E4=B8=8B=E5=8D=8811:48, Christoph Muellner =E5=86=
=99=E9=81=93:
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 39ffb883fc..04500fe352 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -764,6 +764,10 @@ static Property riscv_cpu_properties[] =3D {
>> >       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>> >       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>> >       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>> > +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
>> > +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
>> > +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize=
,
>> 64),
>> > +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize=
,
>> 64),
>> Why use two different cache block size here? Is there any new spec
>> update for this?
>>
>
> No, we are talking about the same specification.
>
> Section 2.7 states the following:
> """
> The initial set of CMO extensions requires the following information to b=
e
> discovered by software:
> * The size of the cache block for management and prefetch instructions
> * The size of the cache block for zero instructions
> * CBIE support at each privilege level
> """
>
> So at least the spec authors did differentiate between the two block size=
s
> as well.
>
>
>> >       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>> >       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>> >       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>> > +
>> > +/* helper_zicbom_access
>> > + *
>> > + * Check access permissions (LOAD, STORE or FETCH as specified in
>> section
>> > + * 2.5.2 of the CMO specification) for Zicbom, raising either store
>> > + * page-fault (non-virtualised) or store guest-page fault
>> (virtualised).
>> > + */
>> > +static void helper_zicbom_access(CPURISCVState *env, target_ulong
>> address,
>> > +                                 uintptr_t ra)
>> > +{
>> > +    int ret;
>> > +    void* phost;
>> > +    int mmu_idx =3D cpu_mmu_index(env, false);
>> > +
>> > +    /* Get the size of the cache block for management instructions. *=
/
>> > +    RISCVCPU *cpu =3D env_archcpu(env);
>> > +    uint16_t cbomlen =3D cpu->cfg.cbom_blocksize;
>> > +
>> > +    /* Mask off low-bits to align-down to the cache-block. */
>> > +    address &=3D ~(cbomlen - 1);
>> > +
>> > +    /* A cache-block management instruction is permitted to access
>> > +     * the specified cache block whenever a load instruction, store
>> > +     * instruction, or instruction fetch is permitted to access the
>> > +     * corresponding physical addresses.
>> > +     */
>> > +    ret =3D probe_access_range_flags(env, address, cbomlen,
>> MMU_DATA_LOAD,
>> > +                                   mmu_idx, true, &phost, ra);
>> > +    if (ret =3D=3D TLB_INVALID_MASK)
>> > +        ret =3D probe_access_range_flags(env, address, cbomlen,
>> MMU_INST_FETCH,
>> > +                                       mmu_idx, true, &phost, ra);
>> > +    if (ret =3D=3D TLB_INVALID_MASK)
>> > +        probe_access_range_flags(env, address, cbomlen, MMU_DATA_STOR=
E,
>> > +                                 mmu_idx, false, &phost, ra);
>> > +}
>> > +
>>
>>
>> I think it's a little different here. Probe_access_range_flags may
>> trigger different execptions for different access_type. For example:
>>
>> If  the page for the address  is executable and readable but not
>> writable,  and the access cannot pass the pmp check for all access_type,
>>
>> it may trigger access fault for load/fetch access, and  trigger page
>> fault for  store access.
>>
>
> Just to be clear:
> The patch does not trigger any fault for LOAD or FETCH because nonfault i=
s
> set
> to true (6th argument of probe_access_range_flags()).
> Only the last call to probe_access_range_flags() raises an exception.
>
> Section 2.5.2 states the following:
> """
> If access to the cache block is not permitted, a cache-block management
> instruction raises a store page fault or store guest-page fault exception
> if address translation does not permit any
> access or raises a store access fault exception otherwise.
> """
>
> In your scenario we have (1...allowed; 0...not allowed):
> * read: perm:1, pmp:0
> * fetch: perm:1: pmp:0
> * write: perm:0, pmp:0
>
> Address translation would allow read and fetch access, but PMP blocks tha=
t.
> So the "does not permit any"-part is wrong, therefore we should raise a
> store page fault.
>
> In fact, I can't predict what will happen, because the code in
> target/riscv/cpu_helper.c does
> not really prioritize page faults or PMP faults. it returns one of them,
> once they are encountered.
>

Hi Christoph,

May I ask what does "page faults or PMP faults are not prioritized" here
mean?

In target/riscv/cpu_helper.c, if "pmp_violation" flag is not set to true,
page fault will be picked.
So as long as the TRANSLATE_PMP_FAIL is returned, it will be indicated as a
PMP fault.
(The only exception I can see is that TRANSLATE_PMP_FAIL may be converted
to TRANSLATE_G_STAGE_FAIL
  if it's the second stage translation and PMP fault on PTE entry's PA.)
As the "final PA" is checked only after the page table is walked,
shouldn't the "pmp_violation" flag only be set after all the translation
accesses are checked and granted?

Regards,
Frank Chang


>
> In order to model this properly, we would have to refactor cpu_helper.c t=
o
> separate page permissions
> from PMP. However, that seems a bit out of scope for a Zicbo* support
> patchset.
>
>
>
>>
>> I think the final exception should be access fault instead of the page
>> fault caused by probe_access_range_flags with MMU_DATA_STORE.
>>
>> Regards,
>>
>> Weiwei Li
>>
>>

--0000000000001202fa05d99bd865
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Christoph M=C3=BCllner &lt;<a href=3D"mai=
lto:cmuellner@linux.com">cmuellner@linux.com</a>&gt; =E6=96=BC 2022=E5=B9=
=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8812:00=E5=AF=
=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Feb 17, 2022 at 3:15 AM Weiwei Li &lt;<a href=3D"mailto:liweiwei@iscas.=
ac.cn" target=3D"_blank">liweiwei@iscas.ac.cn</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2022/2/16 =E4=B8=8B=E5=8D=8811:48, Christoph Muellner =E5=86=99=
=E9=81=93:<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 39ffb883fc..04500fe352 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -764,6 +764,10 @@ static Property riscv_cpu_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCV=
CPU, cfg.ext_counters, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCV=
CPU, cfg.ext_ifencei, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU=
, cfg.ext_icsr, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zicbom&quot;, RISCVCPU, cfg.ext_=
icbom, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zicboz&quot;, RISCVCPU, cfg.ext_=
icboz, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;cbom_blocksize&quot;, RISCVCPU=
, cfg.cbom_blocksize, 64),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;cboz_blocksize&quot;, RISCVCPU=
, cfg.cboz_blocksize, 64),<br>
Why use two different cache block size here? Is there any new spec <br>
update for this?<br></blockquote><div><br></div><div>No, we are talking abo=
ut the same specification.</div><div><br></div><div>Section 2.7 states the =
following:<br></div><div>&quot;&quot;&quot;</div><div>The initial set of CM=
O extensions requires the following information to be discovered by softwar=
e:<br>* The size of the cache block for management and prefetch instruction=
s<br>* The size of the cache block for zero instructions<br>* CBIE support =
at each privilege level<br></div><div>&quot;&quot;&quot;</div><div><br></di=
v><div>So at least the spec authors did differentiate between the two block=
 sizes as well.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, =
cfg.ext_zfh, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfhmin&quot;, RISCVCP=
U, cfg.ext_zfhmin, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zve32f&quot;, RISCVCP=
U, cfg.ext_zve32f, false),<br>
&gt; +<br>
&gt; +/* helper_zicbom_access<br>
&gt; + *<br>
&gt; + * Check access permissions (LOAD, STORE or FETCH as specified in sec=
tion<br>
&gt; + * 2.5.2 of the CMO specification) for Zicbom, raising either store<b=
r>
&gt; + * page-fault (non-virtualised) or store guest-page fault (virtualise=
d).<br>
&gt; + */<br>
&gt; +static void helper_zicbom_access(CPURISCVState *env, target_ulong add=
ress,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t ra)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +=C2=A0 =C2=A0 void* phost;<br>
&gt; +=C2=A0 =C2=A0 int mmu_idx =3D cpu_mmu_index(env, false);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Get the size of the cache block for management instr=
uctions. */<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt; +=C2=A0 =C2=A0 uint16_t cbomlen =3D cpu-&gt;cfg.cbom_blocksize;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Mask off low-bits to align-down to the cache-block. =
*/<br>
&gt; +=C2=A0 =C2=A0 address &amp;=3D ~(cbomlen - 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* A cache-block management instruction is permitted to=
 access<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* the specified cache block whenever a load instr=
uction, store<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* instruction, or instruction fetch is permitted =
to access the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* corresponding physical addresses.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 ret =3D probe_access_range_flags(env, address, cbomlen,=
 MMU_DATA_LOAD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmu_idx, true, &amp=
;phost, ra);<br>
&gt; +=C2=A0 =C2=A0 if (ret =3D=3D TLB_INVALID_MASK)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D probe_access_range_flags(env, add=
ress, cbomlen, MMU_INST_FETCH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmu_i=
dx, true, &amp;phost, ra);<br>
&gt; +=C2=A0 =C2=A0 if (ret =3D=3D TLB_INVALID_MASK)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 probe_access_range_flags(env, address, cb=
omlen, MMU_DATA_STORE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmu_idx, false, &amp;phost=
, ra);<br>
&gt; +}<br>
&gt; +<br>
<br>
<br>
I think it&#39;s a little different here. Probe_access_range_flags may <br>
trigger different execptions for different access_type. For example:<br>
<br>
If=C2=A0 the page for the address=C2=A0 is executable and readable but not =
<br>
writable,=C2=A0 and the access cannot pass the pmp check for all access_typ=
e,<br>
<br>
it may trigger access fault for load/fetch access, and=C2=A0 trigger page <=
br>
fault for=C2=A0 store access.<br></blockquote><div><br></div><div>Just to b=
e clear:</div><div>The patch does not trigger any fault for LOAD or FETCH b=
ecause nonfault=C2=A0is set</div><div>to true (6th argument of probe_access=
_range_flags()).</div><div>Only the last call to probe_access_range_flags()=
 raises an exception.</div><div><br></div><div>Section 2.5.2 states the fol=
lowing:<br></div><div>&quot;&quot;&quot;</div><div>If access to the cache b=
lock is not permitted, a cache-block management<br>instruction raises a sto=
re page fault or store guest-page fault exception if address translation do=
es not permit any<br>access or raises a store access fault exception otherw=
ise.<br></div><div>&quot;&quot;&quot;</div><div><br></div><div>In your scen=
ario we have (1...allowed; 0...not allowed):</div><div>* read: perm:1, pmp:=
0</div><div>* fetch: perm:1: pmp:0</div><div>* write: perm:0, pmp:0</div><d=
iv><br></div><div>Address translation would allow read and fetch access, bu=
t PMP blocks that.</div><div>So the &quot;does not permit any&quot;-part is=
 wrong, therefore we should raise a store page fault.</div><div><br></div><=
div>In fact, I can&#39;t predict what will happen, because the code in targ=
et/riscv/cpu_helper.c does</div><div>not really prioritize page faults or P=
MP faults. it returns one of them, once they are encountered.</div></div></=
div></blockquote><div><br></div><div>Hi Christoph,</div><div><br></div><div=
>May I ask what does &quot;page faults or PMP faults are not prioritized&qu=
ot; here mean?</div><div><br></div><div>In target/riscv/cpu_helper.c, if &q=
uot;pmp_violation&quot; flag is not set to true, page fault will be picked.=
</div><div>So as long as the=C2=A0TRANSLATE_PMP_FAIL is returned, it will b=
e indicated as a PMP fault.</div><div>(The only exception I can see is that=
=C2=A0TRANSLATE_PMP_FAIL may be converted to=C2=A0TRANSLATE_G_STAGE_FAIL</d=
iv><div>=C2=A0 if it&#39;s the second stage translation and PMP fault on PT=
E entry&#39;s PA.)</div><div>As the &quot;final PA&quot; is checked only af=
ter the page table is walked,<br></div><div>shouldn&#39;t the &quot;pmp_vio=
lation&quot; flag only be set after all the translation accesses are checke=
d and granted?</div><div><br></div><div>Regards,</div><div>Frank Chang<br>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>In order to model t=
his properly, we would have to refactor cpu_helper.c to separate page permi=
ssions</div><div>from PMP. However, that seems a bit out of scope for a Zic=
bo* support patchset.</div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
I think the final exception should be access fault instead of the page <br>
fault caused by probe_access_range_flags with MMU_DATA_STORE.<br>
<br>
Regards,<br>
<br>
Weiwei Li<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000001202fa05d99bd865--

