Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1821C7115C
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 07:37:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uUKh4-0003B3-MP; Wed, 25 Jun 2025 03:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1uUKgn-00039X-Lu
 for qemu-riscv@nongnu.org; Wed, 25 Jun 2025 03:37:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1uUKgh-0006EQ-HS
 for qemu-riscv@nongnu.org; Wed, 25 Jun 2025 03:37:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-addcea380eeso1016081766b.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Jun 2025 00:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750837012; x=1751441812;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbWLVMD8aqO9UkiITCDU+b8qdjCijrEjch6RSbRo28M=;
 b=JXIAL/Bz6UAkR0q6U9U0uSzFDCFPSAPsbtARdtoLkUFUGWwFViTCMWPlAcaZspz4ez
 W3Iqvo+MfTrQOK6MBAUb3ziuDxKyunIlMudF6rH/2osqF5fA6NMFwDUPkt3vcH0J3/T1
 /0Y2cXiUwaVqzSvFX1mUunQqsYMEAN49ZdK6ekEWObokwdOYeuuryCQLNKEeXTJMYoiq
 Ef5hCSrIaKa8eVVkQ1+tdAvCjN/Iw6fh8Ys7LxGRrDgCGYdHSfEzaSyyDLwPzm8UaFyX
 GhuR4Fv5JaAhBI0pi9h9j/uUM8PC0UPdxdQqTPDnPHH5LhkEwRwW6idHwnamvDycV8AC
 9itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750837012; x=1751441812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbWLVMD8aqO9UkiITCDU+b8qdjCijrEjch6RSbRo28M=;
 b=CFrspk7MFKFqPQ4Od2zEV4Yz+0EaU9QHHeEzt4avqaoZ0DlDIepERZVXDJfRD7XTgb
 mkFAR6Mlo7qF7WPEfkKZl+IvjUixHj17uCc2un9ECVUixSawWKZkFO0paxc6Ckl5Z7BY
 YYQ06YMcV+idsK6dz+YkjOGaWnWg+7tDaFl4RAz0ABJgwevA4Efm9ceEWP1MOTWNFHsC
 0kiiztrsRmat9VeKcBd17mR9QpTYSnqgbAbVgsyOSmtukMErBCQp75hdcmfs/yKwKeKG
 j97hxMy5tfP2CkQDJs5pAjBgAD/g90AoPsF5rH1881B5W2sSpGs5R1R04UjPyZL1ybqz
 i9rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz+m3HmhUzhBDiOkMrW0KVeAyctMZ0ed+S9BxGLc8IzBECFUmU0MHk5IEbOvND8s1lOD+bIP9FRUND@nongnu.org
X-Gm-Message-State: AOJu0YzMfgtuSkBEapHOIlA9ktllKbYV63kvZwCpOVSaSW0FJByleuwm
 XjzQdfN2xljLXa0dPXVvZig8yAVvurq5f1F1QhiZfG2mOxVVFrErmgVhuJjNYEtNe6WJ+6irxgj
 uSCwo5lswR8Raa/ply5cnSDdGUPECFrWclulMyQcWsA==
X-Gm-Gg: ASbGncsB/fTGj8NEKg8p2Ziql4YkoYbC64T+ni/tzH0Qbk9pnoXLdIZO2rb9YK/5k8v
 7qWSR9o77lYxYEZq60Q25z9tSi2naphAPjUyky2jDmkdTdp5Et+/0ggdrqS9fhFNsL1xbj/qhum
 cqdTjvx1oUJqIpzX8R3TPisr3NdtYicbsIFXlSiIqmlR7n97mAB4TXUWPq9QAG5Es+xqimVO+lj
 g8f
X-Google-Smtp-Source: AGHT+IFuiuEE2q8m0VJ0O4Z913gqpAo8WSi1jpbT3TB+z0OGETp35Ed2QCktFhETtbOe1K4Tnxz4wvrApIQ/qCHzo60=
X-Received: by 2002:a17:906:115a:b0:ae0:bdc2:994d with SMTP id
 a640c23a62f3a-ae0bea627a0mr177621366b.55.1750837012315; Wed, 25 Jun 2025
 00:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250605142126.1939798-1-alexghiti@rivosinc.com>
 <4990220d-a4a6-49b4-a8db-929cf1100e31@ventanamicro.com>
In-Reply-To: <4990220d-a4a6-49b4-a8db-929cf1100e31@ventanamicro.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 25 Jun 2025 09:36:41 +0200
X-Gm-Features: Ac12FXyJ4HXMIL1CSYgqGir7Cf_VfVJhM7A8y82Ruq1zgjiV0Bip0jTA_spZXIs
Message-ID: <CAHVXubg3DM52H_1z1Yg5SSk2nZq3VL8xBREBP9Np9aC0OTAAuw@mail.gmail.com>
Subject: Re: [PATCH] target: riscv: Add Svrsw60t59b extension support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, debug@rivosinc.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alexghiti@rivosinc.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi Daniel,

On Sat, Jun 7, 2025 at 7:54=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 6/5/25 11:21 AM, Alexandre Ghiti wrote:
> > The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 5=
9
> > for software to use.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >
> > Changes in v2:
> >   - Add support for IOMMU
> >   - Make svrsw60t59b depend on sv39 (deepak)
> >
> > Open question: svrsw60t59b in IOMMU should also depend on 64bit, but I
> > did not find an easy to way in riscv_iommu_realize() to detect that, ho=
w
> > should I do?
>
>
> What controls the IOMMU behavior is the set of IOMMU capabilities that th=
e driver
> chooses to use. Other than that the device should be oblivious to the CPU=
 word
> size.
>
>  From what I see in this patch you did the right thing: you added a new c=
apability
> to be advertised to software and that's it. It's up to software to decide=
 whether
> it's going to use it or not. You can advertise a 64 bit only IOMMU capabi=
lity running
> in a 32 bit CPU and it's up to the OS to not use/ignore it. In fact we al=
ready do
> that: satp_mode related caps (e.g. RISCV_IOMMU_CAP_SV32X4) are 32/64 bits=
 exclusive
> but are always advertised.
>
>
>
> Now, Svrsw60t59b being a 32 bit only extension requires special handling =
in
> riscv_init_max_cpu_extensions() because the 'max' CPU has a 32 bit varian=
t and
> enabled everything by default. You can use this diff:
>
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index f93cd53f37..96201e15c6 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -1612,6 +1612,8 @@ static void riscv_init_max_cpu_extensions(Object *o=
bj)
>
>       if (env->misa_mxl !=3D MXL_RV32) {
>           isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
> +    } else {
> +        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_svrsw60t59b), fal=
se);
>       }
>
>       /*
>
>
> To fix this test break in 'make check-functional':
>
>         Command: /home/danielhb/work/qemu/build/qemu-system-riscv32 -disp=
lay none -vga none -chardev socket,id=3Dmon,fd=3D5 -mon chardev=3Dmon,mode=
=3Dcontrol -machine virt -chardev socket,id=3Dconsole,fd=3D10 -serial chard=
ev:console -cpu max -kernel /home/danielhb/.cache/qemu/download/872bc8f8e0d=
4661825d5f47f7bec64988e9d0a8bd5db8917d57e16f66d83b329 -append printk.time=
=3D0 root=3D/dev/vda console=3DttyS0 -blockdev driver=3Draw,file.driver=3Df=
ile,file.filename=3D/home/danielhb/work/qemu/build/tests/functional/riscv32=
/test_riscv32_tuxrun.TuxRunRiscV32Test.test_riscv32_maxcpu/scratch/511ad34e=
63222db08d6c1da16fad224970de36517a784110956ba6a24a0ee5f6,node-name=3Dhd0 -d=
evice virtio-blk-device,drive=3Dhd0
>         Output: qemu-system-riscv32: svrsw60t59b is not supported on RV32=
 and MMU-less platforms

Sorry for the late answer and thanks for the fix ^! I have just sent the v2=
.

Thanks,

Alex

>
>
> Thanks,
>
> Daniel
>
>
> >
> >   hw/riscv/riscv-iommu-bits.h       | 1 +
> >   hw/riscv/riscv-iommu.c            | 3 ++-
> >   target/riscv/cpu.c                | 2 ++
> >   target/riscv/cpu_bits.h           | 3 ++-
> >   target/riscv/cpu_cfg_fields.h.inc | 1 +
> >   target/riscv/cpu_helper.c         | 3 ++-
> >   target/riscv/tcg/tcg-cpu.c        | 6 ++++++
> >   7 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> > index 1017d73fc6..47fe01bee5 100644
> > --- a/hw/riscv/riscv-iommu-bits.h
> > +++ b/hw/riscv/riscv-iommu-bits.h
> > @@ -79,6 +79,7 @@ struct riscv_iommu_pq_record {
> >   #define RISCV_IOMMU_CAP_SV39            BIT_ULL(9)
> >   #define RISCV_IOMMU_CAP_SV48            BIT_ULL(10)
> >   #define RISCV_IOMMU_CAP_SV57            BIT_ULL(11)
> > +#define RISCV_IOMMU_CAP_SVRSW60T59B     BIT_ULL(14)
> >   #define RISCV_IOMMU_CAP_SV32X4          BIT_ULL(16)
> >   #define RISCV_IOMMU_CAP_SV39X4          BIT_ULL(17)
> >   #define RISCV_IOMMU_CAP_SV48X4          BIT_ULL(18)
> > diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> > index a877e5da84..36eda95a1c 100644
> > --- a/hw/riscv/riscv-iommu.c
> > +++ b/hw/riscv/riscv-iommu.c
> > @@ -2355,7 +2355,8 @@ static void riscv_iommu_realize(DeviceState *dev,=
 Error **errp)
> >       }
> >       if (s->enable_g_stage) {
> >           s->cap |=3D RISCV_IOMMU_CAP_SV32X4 | RISCV_IOMMU_CAP_SV39X4 |
> > -                  RISCV_IOMMU_CAP_SV48X4 | RISCV_IOMMU_CAP_SV57X4;
> > +                  RISCV_IOMMU_CAP_SV48X4 | RISCV_IOMMU_CAP_SV57X4 |
> > +                  RISCV_IOMMU_CAP_SVRSW60T59B;
> >       }
> >
> >       if (s->hpm_cntrs > 0) {
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 629ac37501..13f1f56d95 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -228,6 +228,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> >       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> >       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> > +    ISA_EXT_DATA_ENTRY(svrsw60t59b, PRIV_VERSION_1_13_0, ext_svrsw60t5=
9b),
> >       ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
> >       ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
> >       ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
> > @@ -1282,6 +1283,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions=
[] =3D {
> >       MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
> >       MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
> >       MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
> > +    MULTI_EXT_CFG_BOOL("svrsw60t59b", ext_svrsw60t59b, false),
> >       MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
> >
> >       MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index a30317c617..51eb7114da 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -675,7 +675,8 @@ typedef enum {
> >   #define PTE_SOFT            0x300 /* Reserved for Software */
> >   #define PTE_PBMT            0x6000000000000000ULL /* Page-based memor=
y types */
> >   #define PTE_N               0x8000000000000000ULL /* NAPOT translatio=
n */
> > -#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
> > +#define PTE_RESERVED(svrsw60t59b)            \
> > +             (svrsw60t59b ? 0x07C0000000000000ULL : 0x1FC0000000000000=
ULL) /* Reserved bits */
> >   #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits=
 */
> >
> >   /* Page table PPN shift amount */
> > diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_f=
ields.h.inc
> > index 59f134a419..ab61c1ccf2 100644
> > --- a/target/riscv/cpu_cfg_fields.h.inc
> > +++ b/target/riscv/cpu_cfg_fields.h.inc
> > @@ -57,6 +57,7 @@ BOOL_FIELD(ext_svadu)
> >   BOOL_FIELD(ext_svinval)
> >   BOOL_FIELD(ext_svnapot)
> >   BOOL_FIELD(ext_svpbmt)
> > +BOOL_FIELD(ext_svrsw60t59b)
> >   BOOL_FIELD(ext_svvptc)
> >   BOOL_FIELD(ext_svukte)
> >   BOOL_FIELD(ext_zdinx)
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 2ed69d7c2d..3479a62cc7 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -1309,6 +1309,7 @@ static int get_physical_address(CPURISCVState *en=
v, hwaddr *physical,
> >       bool svade =3D riscv_cpu_cfg(env)->ext_svade;
> >       bool svadu =3D riscv_cpu_cfg(env)->ext_svadu;
> >       bool adue =3D svadu ? env->menvcfg & MENVCFG_ADUE : !svade;
> > +    bool svrsw60t59b =3D riscv_cpu_cfg(env)->ext_svrsw60t59b;
> >
> >       if (first_stage && two_stage && env->virt_enabled) {
> >           pbmte =3D pbmte && (env->henvcfg & HENVCFG_PBMTE);
> > @@ -1376,7 +1377,7 @@ static int get_physical_address(CPURISCVState *en=
v, hwaddr *physical,
> >           if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> >               ppn =3D pte >> PTE_PPN_SHIFT;
> >           } else {
> > -            if (pte & PTE_RESERVED) {
> > +            if (pte & PTE_RESERVED(svrsw60t59b)) {
> >                   qemu_log_mask(LOG_GUEST_ERROR, "%s: reserved bits set=
 in PTE: "
> >                                 "addr: 0x%" HWADDR_PRIx " pte: 0x" TARG=
ET_FMT_lx "\n",
> >                                 __func__, pte_addr, pte);
> > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> > index 305912b8dd..886006abc3 100644
> > --- a/target/riscv/tcg/tcg-cpu.c
> > +++ b/target/riscv/tcg/tcg-cpu.c
> > @@ -804,6 +804,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
> >           cpu->cfg.ext_ssctr =3D false;
> >       }
> >
> > +    if (cpu->cfg.ext_svrsw60t59b &&
> > +        (!cpu->cfg.mmu || mcc->def->misa_mxl_max =3D=3D MXL_RV32)) {
> > +        error_setg(errp, "svrsw60t59b is not supported on RV32 and MMU=
-less platforms");
> > +        return;
> > +    }
> > +
> >       /*
> >        * Disable isa extensions based on priv spec after we
> >        * validated and set everything we need.
>

