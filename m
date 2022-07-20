Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oE0lG-00076f-IN
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jul 2022 23:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oE0lF-00075w-As
 for qemu-riscv@nongnu.org; Tue, 19 Jul 2022 23:52:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oE0lD-0003S6-5Q
 for qemu-riscv@nongnu.org; Tue, 19 Jul 2022 23:52:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id v5so1322580wmj.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Jul 2022 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WgM1J7pE9ac9NuSRBe024EFBZvZM2e7cPzlPoas81IU=;
 b=FbjNJdsT+bncF0wDpze/Nbtt1DhRZL+VMRUkyX9/TEjAIi5xmEMOHe1gg7/gbD4BuO
 cxrjb30ew7N7RP1ijQhJvoA7jTyAT8qv0u0Ewbm9inCBROxUG37nIRlnp4FsQ8ffv13U
 2qyefwj505Cc15wPxgqaVKdXOQr/eAFHsdnnktBuLxU6MeKixIeF+AiEi2d/0BujLr5y
 4Pkw1qoQ0kGggxAAL0IAPsIFRz3q9UgZH2CJDWBxyH94BRirixX9dBby+o7wDhaYXbEo
 wdvt8pvSmTAA0zNFEKLB3NQRyKKNRoJJFTMk5ZwnuBUOy5tEBiXienxuNwWQuQiWFFNs
 +pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WgM1J7pE9ac9NuSRBe024EFBZvZM2e7cPzlPoas81IU=;
 b=ZSQhqP0lVN6u60TzlYtCVtJJwMU13Qe0R662LRWLOo/WgwuniSTEGQ4mEGBZgd63an
 RRg3SVjsVbOJjkYO2+WueiR/x1oqQv2JrvXsxewA+EEODZ1vEWD4WlEnOtqVdoNJNxso
 9LCU/PoIgCQH3o21tuKV8NEha1u7Nin9lnCoTl8iwNVHSNj2m+wld53SnS1OnklXPUGo
 bWaFZMNcexCTiFGRGdGcMVMcN0SJPYB/v+6TkbJPgTxFw0ul3aQgVs1ZYVfQ5bVjJpRq
 W1xsEKa53RBwhIh2jJsWKFjJwx3xoe+R3jO1wbvq9N7kQZ1zBk2xhsuEsI3yLDWvIc+S
 Ob3w==
X-Gm-Message-State: AJIora/erqwatpYCrge6/AP6zWSJ33A1D2r6fOFkDY39ZR24kJ1bdvTT
 JCXf8W8xEkJxbxVN805jUAj+4wFK3QVXNFOXNhgjZw==
X-Google-Smtp-Source: AGRyM1uZm+Bu2A6bwqdItcqwLCbTq902pW3pdzMcovudRL7V/TIB2pU/16LFFq0Obhf8WB1CxZ+gX0HU2nI4vQLwGtk=
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id
 bg42-20020a05600c3caa00b003948fb80716mr1833392wmb.105.1658289148866; Tue, 19
 Jul 2022 20:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220718035249.17440-1-jim.shu@sifive.com>
 <CAAhSdy0XUp1KGvmiPhG0eaTk1bnzwVGrW83jDXSLsrzK_NtXDw@mail.gmail.com>
 <CALw707qqVxROpindXhxPjAvccjTYaYoC_vTjtfkM+Do_pMLQRA@mail.gmail.com>
In-Reply-To: <CALw707qqVxROpindXhxPjAvccjTYaYoC_vTjtfkM+Do_pMLQRA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Jul 2022 09:22:16 +0530
Message-ID: <CAAhSdy2dm5p8wb4YSppS=yT8L4ctZc9J9mT=-jPdLe5p=VR6=A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support SW update of PTE A/D bits and
 Ssptwad extension
To: Jim Shu <jim.shu@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Jul 2022 03:52:33 -0000

On Wed, Jul 20, 2022 at 5:02 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> Hi Anup,
>
> Do you think it is OK if we only use ssptwad as a CPU option name
> but not a RISC-V extension? just like MMU and PMP options of RISC-V.
> (And we could change it to RISC-V extension in the future
> if Ssptwad becomes the formal RISC-V extension)
>
> Both HW/SW update schemes are already defined in RISC-V priv spec,
> so I think it's reasonable to implement them in QEMU. The only issue here is
> to choose a proper CPU option name to turn on/off HW update of A/D bits.

I am not saying that we should avoid implementing it in QEMU.

My suggestion is to differentiate HW optionalities from ISA extensions
in QEMU. For example, instead of referring to this as Ssptwad, we should
call it "hw_ptwad" or "opt_ptwad" and don't use the "ext_" prefix.

@Alistair Francis might have better suggestions on this ?

Regards,
Anup

>
> Regards,
> Jim Shu
>
> On Mon, Jul 18, 2022 at 12:02 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> +Atish
>>
>> On Mon, Jul 18, 2022 at 9:23 AM Jim Shu <jim.shu@sifive.com> wrote:
>> >
>> > RISC-V priv spec v1.12 permits 2 PTE-update schemes of A/D-bit
>> > (Access/Dirty bit): HW update or SW update. RISC-V profile defines the
>> > extension name 'Ssptwad' for HW update to PTE A/D bits.
>> > https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
>>
>> The Ssptwad (even though used by profiles) is not a well defined RISC-V
>> ISA extension. Rather, Ssptwad is just a name used in profiles to represent
>> an optional feature.
>>
>> In fact, since it is not a well-defined ISA extension, QEMU cannot include
>> Ssptwad in the ISA string as well.
>>
>> I think for such optionalities which are not well-defined ISA extensions,
>> QEMU should treat it differently.
>>
>> Regards,
>> Anup
>>
>> >
>> > Current QEMU RISC-V implements HW update scheme, so this commit
>> > introduces SW update scheme to QEMU and uses the 'Ssptwad' extension
>> > as the CPU option to select 2 PTE-update schemes. QEMU RISC-V CPU still
>> > uses HW update scheme (ext_ssptwad=true) by default to keep the backward
>> > compatibility.
>> >
>> > SW update scheme implemention is based on priv spec v1.12:
>> > "When a virtual page is accessed and the A bit is clear, or is written
>> > and the D bit is clear, a page-fault exception (corresponding to the
>> > original access type) is raised."
>> >
>> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
>> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> > ---
>> >  target/riscv/cpu.c        | 2 ++
>> >  target/riscv/cpu.h        | 1 +
>> >  target/riscv/cpu_helper.c | 9 +++++++++
>> >  3 files changed, 12 insertions(+)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 1bb3973806..1d38c1c1d2 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -857,6 +857,7 @@ static void riscv_cpu_init(Object *obj)
>> >
>> >      cpu->cfg.ext_ifencei = true;
>> >      cpu->cfg.ext_icsr = true;
>> > +    cpu->cfg.ext_ssptwad = true;
>> >      cpu->cfg.mmu = true;
>> >      cpu->cfg.pmp = true;
>> >
>> > @@ -900,6 +901,7 @@ static Property riscv_cpu_extensions[] = {
>> >      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>> >      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>> >      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>> > +    DEFINE_PROP_BOOL("ssptwad", RISCVCPU, cfg.ext_ssptwad, true),
>> >
>> >      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>> >      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 5c7acc055a..2eee59af98 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -433,6 +433,7 @@ struct RISCVCPUConfig {
>> >      bool ext_zve32f;
>> >      bool ext_zve64f;
>> >      bool ext_zmmul;
>> > +    bool ext_ssptwad;
>> >      bool rvv_ta_all_1s;
>> >
>> >      uint32_t mvendorid;
>> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> > index 59b3680b1b..a8607c0d7b 100644
>> > --- a/target/riscv/cpu_helper.c
>> > +++ b/target/riscv/cpu_helper.c
>> > @@ -981,6 +981,15 @@ restart:
>> >
>> >              /* Page table updates need to be atomic with MTTCG enabled */
>> >              if (updated_pte != pte) {
>> > +                if (!cpu->cfg.ext_ssptwad) {
>> > +                    /*
>> > +                     * If A/D bits are managed by SW, HW just raises the
>> > +                     * page fault exception corresponding to the original
>> > +                     * access type when A/D bits need to be updated.
>> > +                     */
>> > +                    return TRANSLATE_FAIL;
>> > +                }
>> > +
>> >                  /*
>> >                   * - if accessed or dirty bits need updating, and the PTE is
>> >                   *   in RAM, then we do so atomically with a compare and swap.
>> > --
>> > 2.17.1
>> >
>> >

