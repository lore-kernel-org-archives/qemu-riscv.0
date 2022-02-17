Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKXxe-0006r9-Kx
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 23:00:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKXxd-0006qe-2z; Wed, 16 Feb 2022 23:00:05 -0500
Received: from mail-vs1-f47.google.com ([209.85.217.47]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKXxa-0005im-DD; Wed, 16 Feb 2022 23:00:04 -0500
Received: by mail-vs1-f47.google.com with SMTP id g21so4826330vsp.6;
 Wed, 16 Feb 2022 20:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acgzlMs8+2Yrufr6o620i2RHe1oEK5N6TpDz6ZtW7No=;
 b=sJC7jaNACuHUyqzg/u/XltNgvdflAIW2z1P5DwRy/zdon+RjIGI1WTg+nTU0mse9Lc
 zpOwSyhVi2Y9yLgWtFZdjEppueUK43LBAbQBAhgCz6WFFmrVxp6t86n07ZtouiJgedIz
 TU1/jA3wYZqtoeqi/+yDKSQXBVagWYSaZe0hBGN5QKqT74PdwMtB9YtlDnqYIblcKj3B
 l2wc76/G1dDCkP0M1jbuWiRICPJ0SaWoMMusQtobOfVzJUEGCmgM6VXfNls6xKEg+XqC
 J7/9T5MmDrTz4qx6WDxCHSThqN7/YiZkpNmRNkENoh6+ktWK7s3tNaMd5bLSn/UOwe6E
 9WJQ==
X-Gm-Message-State: AOAM533Kupoza/EILD0FbIgK5NAV5UmfiRff3b6IvqPoiI94dM5eVk/L
 oOGNiI2N7OLEC2tnJ7os0nbhjRSBrLWzHvbC
X-Google-Smtp-Source: ABdhPJxlVfmyJ4P+GJlp246gd7q/aAapK+f59euUYS/bd7uxg9ll8tF4h6yei2ji0UJCkn3UCqJBtw==
X-Received: by 2002:a05:6102:956:b0:31b:1b52:ed9f with SMTP id
 a22-20020a056102095600b0031b1b52ed9fmr473378vsi.28.1645070400772; 
 Wed, 16 Feb 2022 20:00:00 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id 137sm2361548vkz.2.2022.02.16.20.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 20:00:00 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id e26so4849019vso.3;
 Wed, 16 Feb 2022 20:00:00 -0800 (PST)
X-Received: by 2002:a67:d48d:0:b0:31b:9467:3e1b with SMTP id
 g13-20020a67d48d000000b0031b94673e1bmr378314vsj.46.1645070400037; Wed, 16 Feb
 2022 20:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20220216154839.1024927-1-cmuellner@linux.com>
 <20220216154839.1024927-3-cmuellner@linux.com>
 <2c0fcafe-868a-ba7a-bf42-3a4ed2df19ba@iscas.ac.cn>
In-Reply-To: <2c0fcafe-868a-ba7a-bf42-3a4ed2df19ba@iscas.ac.cn>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Date: Thu, 17 Feb 2022 04:59:48 +0100
X-Gmail-Original-Message-ID: <CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com>
Message-ID: <CAHB2gtTOrFWq7=Y-ALCtp6H6JAUKDG1fhojxQ-xNV8LLxcop4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/riscv: Enable Zicbo[m,z,p] instructions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d3296705d82ecc73"
Received-SPF: pass client-ip=209.85.217.47;
 envelope-from=christophm30@gmail.com; helo=mail-vs1-f47.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 17 Feb 2022 04:00:05 -0000

--000000000000d3296705d82ecc73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 3:15 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/2/16 =E4=B8=8B=E5=8D=8811:48, Christoph Muellner =E5=86=99=
=E9=81=93:
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 39ffb883fc..04500fe352 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -764,6 +764,10 @@ static Property riscv_cpu_properties[] =3D {
> >       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> > +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> > +    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize,
> 64),
> > +    DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize,
> 64),
> Why use two different cache block size here? Is there any new spec
> update for this?
>

No, we are talking about the same specification.

Section 2.7 states the following:
"""
The initial set of CMO extensions requires the following information to be
discovered by software:
* The size of the cache block for management and prefetch instructions
* The size of the cache block for zero instructions
* CBIE support at each privilege level
"""

So at least the spec authors did differentiate between the two block sizes
as well.


> >       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > +
> > +/* helper_zicbom_access
> > + *
> > + * Check access permissions (LOAD, STORE or FETCH as specified in
> section
> > + * 2.5.2 of the CMO specification) for Zicbom, raising either store
> > + * page-fault (non-virtualised) or store guest-page fault (virtualised=
).
> > + */
> > +static void helper_zicbom_access(CPURISCVState *env, target_ulong
> address,
> > +                                 uintptr_t ra)
> > +{
> > +    int ret;
> > +    void* phost;
> > +    int mmu_idx =3D cpu_mmu_index(env, false);
> > +
> > +    /* Get the size of the cache block for management instructions. */
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    uint16_t cbomlen =3D cpu->cfg.cbom_blocksize;
> > +
> > +    /* Mask off low-bits to align-down to the cache-block. */
> > +    address &=3D ~(cbomlen - 1);
> > +
> > +    /* A cache-block management instruction is permitted to access
> > +     * the specified cache block whenever a load instruction, store
> > +     * instruction, or instruction fetch is permitted to access the
> > +     * corresponding physical addresses.
> > +     */
> > +    ret =3D probe_access_range_flags(env, address, cbomlen, MMU_DATA_L=
OAD,
> > +                                   mmu_idx, true, &phost, ra);
> > +    if (ret =3D=3D TLB_INVALID_MASK)
> > +        ret =3D probe_access_range_flags(env, address, cbomlen,
> MMU_INST_FETCH,
> > +                                       mmu_idx, true, &phost, ra);
> > +    if (ret =3D=3D TLB_INVALID_MASK)
> > +        probe_access_range_flags(env, address, cbomlen, MMU_DATA_STORE=
,
> > +                                 mmu_idx, false, &phost, ra);
> > +}
> > +
>
>
> I think it's a little different here. Probe_access_range_flags may
> trigger different execptions for different access_type. For example:
>
> If  the page for the address  is executable and readable but not
> writable,  and the access cannot pass the pmp check for all access_type,
>
> it may trigger access fault for load/fetch access, and  trigger page
> fault for  store access.
>

Just to be clear:
The patch does not trigger any fault for LOAD or FETCH because nonfault is
set
to true (6th argument of probe_access_range_flags()).
Only the last call to probe_access_range_flags() raises an exception.

Section 2.5.2 states the following:
"""
If access to the cache block is not permitted, a cache-block management
instruction raises a store page fault or store guest-page fault exception
if address translation does not permit any
access or raises a store access fault exception otherwise.
"""

In your scenario we have (1...allowed; 0...not allowed):
* read: perm:1, pmp:0
* fetch: perm:1: pmp:0
* write: perm:0, pmp:0

Address translation would allow read and fetch access, but PMP blocks that.
So the "does not permit any"-part is wrong, therefore we should raise a
store page fault.

In fact, I can't predict what will happen, because the code in
target/riscv/cpu_helper.c does
not really prioritize page faults or PMP faults. it returns one of them,
once they are encountered.

In order to model this properly, we would have to refactor cpu_helper.c to
separate page permissions
from PMP. However, that seems a bit out of scope for a Zicbo* support
patchset.



>
> I think the final exception should be access fault instead of the page
> fault caused by probe_access_range_flags with MMU_DATA_STORE.
>
> Regards,
>
> Weiwei Li
>
>

--000000000000d3296705d82ecc73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 17, 2022 at 3:15 AM Weiwe=
i Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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
MP faults. it returns one of them, once they are encountered.</div><div><br=
></div><div>In order to model this properly, we would have to refactor cpu_=
helper.c to separate page permissions</div><div>from PMP. However, that see=
ms a bit out of scope for a Zicbo* support patchset.</div><div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I think the final exception should be access fault instead of the page <br>
fault caused by probe_access_range_flags with MMU_DATA_STORE.<br>
<br>
Regards,<br>
<br>
Weiwei Li<br>
<br>
</blockquote></div></div>

--000000000000d3296705d82ecc73--

