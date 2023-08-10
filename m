Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1173C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:02:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU93K-0004ZH-Mz; Thu, 10 Aug 2023 13:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU93C-0004Ti-9p; Thu, 10 Aug 2023 13:02:20 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU938-0005Fp-Q2; Thu, 10 Aug 2023 13:02:17 -0400
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-4477a8ea6d7so459531137.3; 
 Thu, 10 Aug 2023 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691686931; x=1692291731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cccf7DgpwGb3MR4aT258G67njDIbf8B4UmIOb2CAOyE=;
 b=PhHYQIUA84JdTNaNL9Lsi6PHZ2e2ufZi73r+wU4wXdr301Pa8f0E8ZZMYJkMApwMCy
 RkthmnJ+UB5bTBBCr//N1GHcoFD8O27Q6pI/5QCwY2iFUDRPeKhQlwX/FAZu+EGn8kp/
 0SoIEPKn2J0PWQUvbPvwNrH9zv92HrQHopzfOhg8gUhOuyzNU3Oc1BtxuqmjqjxLwL9z
 wwpSuTRRBU67ZfFGi4XRJ4yCEl9hy7qRvcqiWBOa9Pawmo7p/2bwA3l/DpSJVWOZl4L+
 YW1RyJN92Y4iGp5JWpf8vB7xCqtMVtp0mN96rbf4+sOYMMtb2SDmDauaeu7MS/XFdLJV
 G4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691686931; x=1692291731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cccf7DgpwGb3MR4aT258G67njDIbf8B4UmIOb2CAOyE=;
 b=jfXdKKKWtf2zq9E9Fo1zoXPC00nmXgQZaJ43nXyyf++GX52tStbJ0yFQCQnlM7HEbJ
 PSi8m/VO/E0KZ+cHUKpMukifnGtv75zpvrFF98MuxYr09vqaiSCCYZOWW9haPcokcbIu
 bN9xEzEx6sVhpeRjLslSs2DBh+f3mz+UA1lEx1pclcax6gjWV0L8beSmAn15fUbZY4x7
 aOv/9a2J7S2CUnG9Io1if+vkotXBUVxji8+57A3JK4cv6DVUm2sFJixG3MZQdJs5l5Gw
 5yL+4PnIAmgtQUTR+OMnROH9mmoK92fWPEuVhOe+CeMlBRtxzrmvj+XxJnHdoqeeKRq5
 nm2A==
X-Gm-Message-State: AOJu0YyUfdbzKFZISuXixCVb1CmyXNKy7z+0+ikTVzsmCnLaP5PxNmtz
 pf9i6u+wLEbl3ke4T8oDn38wiAInajMSJ8l6JXc=
X-Google-Smtp-Source: AGHT+IE+J+Ju5xnnuwQkX3Jqqzlk+Apx2T8SJvI263Ir/1QTboSr9pDrklfWPrYzS4KMaT6JY8OW6kur7rQ2gYlTaxQ=
X-Received: by 2002:a67:ecd4:0:b0:443:3d62:77a with SMTP id
 i20-20020a67ecd4000000b004433d62077amr2301113vsp.1.1691686931042; Thu, 10 Aug
 2023 10:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230802180058.281385-1-dbarboza@ventanamicro.com>
 <20230803-3d2b378004c77196efc74f09@orel>
 <d9659727-2ba4-370c-32ac-9f5ade5bea60@ventanamicro.com>
 <20230803-70bedcfb60cb5b2efb87cedc@orel>
 <93cf5366-9723-3c08-6ce1-d0dbd1f4a76f@ventanamicro.com>
In-Reply-To: <93cf5366-9723-3c08-6ce1-d0dbd1f4a76f@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:01:44 -0400
Message-ID: <CAKmqyKOPMsRkgcppqxU1zHXqLDaJSh7VYMwYu+gHHzdB01e5nw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/kvm.c: fix mvendorid size in
 vcpu_set_machine_ids()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Aug 9, 2023 at 6:17=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Drew,
>
> On 8/3/23 09:05, Andrew Jones wrote:
> > On Thu, Aug 03, 2023 at 08:36:57AM -0300, Daniel Henrique Barboza wrote=
:
> >>
> >>
> >> On 8/3/23 06:29, Andrew Jones wrote:
> >>> On Wed, Aug 02, 2023 at 03:00:58PM -0300, Daniel Henrique Barboza wro=
te:
> >>>> cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always wr=
ite
> >>>> a target_ulong val, i.e. a 64 bit field in a 64 bit host.
> >>>>
> >>>> Given that we're passing a pointer to the mvendorid field, the reg i=
s
> >>>> reading 64 bits starting from mvendorid and going 32 bits in the nex=
t
> >>>> field, marchid. Here's an example:
> >>>>
> >>>> $ ./qemu-system-riscv64 -machine virt,accel=3Dkvm -m 2G -smp 1 \
> >>>>      -cpu rv64,marchid=3D0xab,mvendorid=3D0xcd,mimpid=3D0xef(...)
> >>>>
> >>>> (inside the guest)
> >>>>    # cat /proc/cpuinfo
> >>>> processor  : 0
> >>>> hart               : 0
> >>>> isa                : rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> >>>> mmu                : sv57
> >>>> mvendorid  : 0xab000000cd
> >>>> marchid            : 0xab
> >>>> mimpid             : 0xef
> >>>>
> >>>> 'mvendorid' was written as a combination of 0xab (the value from the
> >>>> adjacent field, marchid) and its intended value 0xcd.
> >>>>
> >>>> Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' a=
nd
> >>>> use it as input for kvm_set_one_reg(). Here's the result with this p=
atch
> >>>> applied and using the same QEMU command line:
> >>>>
> >>>>    # cat /proc/cpuinfo
> >>>> processor  : 0
> >>>> hart               : 0
> >>>> isa                : rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> >>>> mmu                : sv57
> >>>> mvendorid  : 0xcd
> >>>> marchid            : 0xab
> >>>> mimpid             : 0xef
> >>>>
> >>>> This bug affects only the generic (rv64) CPUs when running with KVM =
in a
> >>>> 64 bit env since the 'host' CPU does not allow the machine IDs to be
> >>>> changed via command line.
> >>>>
> >>>> Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid fo=
r KVM CPUs")
> >>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >>>> ---
> >>>>    target/riscv/kvm.c | 9 ++++++++-
> >>>>    1 file changed, 8 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> >>>> index 9d8a8982f9..b1fd2233c0 100644
> >>>> --- a/target/riscv/kvm.c
> >>>> +++ b/target/riscv/kvm.c
> >>>> @@ -852,12 +852,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
> >>>>    static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
> >>>>    {
> >>>>        CPURISCVState *env =3D &cpu->env;
> >>>> +    target_ulong reg;
> >>>
> >>> We can use the type of cfg since KVM just gets an address and uses th=
e
> >>> KVM register type to determine the size. So here,
> >>>
> >>>    uint32_t reg =3D cpu->cfg.mvendorid;
> >>>
> >>> and then...
> >>>
> >>>>        uint64_t id;
> >>>>        int ret;
> >>>>        id =3D kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> >>>>                              KVM_REG_RISCV_CONFIG_REG(mvendorid));
> >>>> -    ret =3D kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
> >>>> +    /*
> >>>> +     * cfg.mvendorid is an uint32 but a target_ulong will
> >>>> +     * be written. Assign it to a target_ulong var to avoid
> >>>> +     * writing pieces of other cpu->cfg fields in the reg.
> >>>> +     */
> >>>
> >>> ...we don't need this comment since we're not doing anything special.
> >>
> >> I tried it out and it doesn't seem to work. Here's the result:
> >>
> >> / # cat /proc/cpuinfo
> >> processor    : 0
> >> hart         : 0
> >> isa          : rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> >> mmu          : sv57
> >> mvendorid    : 0xaaaaaa000000cd
> >> marchid              : 0xab
> >> mimpid               : 0xef
> >>
> >>
> >> The issue here is that the kernel considers 'mvendorid' as an unsigned=
 long (or
> >> what QEMU calls target_ulong). kvm_set_one_reg() will write an unsigne=
d long
> >> regardless of the uint32_t typing of 'reg', meaning that it'll end up =
writing
> >> 32 bits of uninitialized stuff from the stack.
> >
> > Indeed, I managed to reverse the problem in my head. We need to to worr=
y
> > about KVM's notion of the type, not QEMU's. I feel like we still need s=
ome
> > sort of helper, but one that takes the type of the KVM register into
> > account. KVM_REG_RISCV_CONFIG registers are KVM ulongs, which may be
> > different than QEMU's ulongs, if we ever supported 32-bit userspace on
> > 64-bit kernels. Also, not all KVM register types are ulong, some are
> > explicitly u32s and others u64s. I see kvm_riscv_reg_id() is used to tr=
y
> > and get the right KVM reg size set, but it's broken for RISCV_FP_F_REG(=
),
> > since those are all u32s, even when KVM has 64-bit ulong (I guess nobod=
y
> > is testing get/set-one-reg with F registers using that helper, otherwis=
e
> > we'd be getting EINVAL from KVM). And KVM_REG_RISCV_FP_D_REG(fcsr) is a=
lso
> > broken and RISCV_TIMER_REG() looks broken with 32-bit KVM, since it sho=
uld
> > always be u64. I guess all that stuff needs an audit.
> >
> > So, I think we need a helper that has a switch on the KVM register type
> > and provides the right sized buffer for each case.
>
> Is this a suggestion to do this right now in this patch? I didn't underst=
and
> whether you're ok with the fix as is for 8.1 or if you want more things d=
one
> right away.

Do you want this in for 8.1? It might be a bit late. It helps a lot if
you put in the title [PATCH 8.1]

Alistair

>
>
> Thanks,
>
> Daniel
>
> >
> > Thanks,
> > drew
> >
> >
> >>
> >> target_ulong seems that the right choice here. We could perhaps work w=
ith
> >> uint64_t (other parts of the code does that) but target_ulong is nicer=
 with
> >> 32-bit setups.
> >>
> >>
> >> Thanks,
> >>
> >> Daniel
> >>
> >>>
> >>>> +    reg =3D cpu->cfg.mvendorid;
> >>>> +    ret =3D kvm_set_one_reg(cs, id, &reg);
> >>>>        if (ret !=3D 0) {
> >>>>            return ret;
> >>>>        }
> >>>> --
> >>>> 2.41.0
> >>>>
> >>>
> >>> We should audit and fix all uses of &cpu->cfg.* with KVM ioctls. We c=
an
> >>> also consider introducing wrappers like
> >>>
> >>> #define kvm_set_one_reg_safe(cs, id, addr)  \
> >>> ({                                          \
> >>>     typeof(*(addr)) _addr =3D *(addr);        \
> >>>     kvm_set_one_reg(cs, id, &_addr)         \
> >>> })
> >>>
> >>> Thanks,
> >>> drew
>

