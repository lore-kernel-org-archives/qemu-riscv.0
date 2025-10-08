Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979FCCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 07:23:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6OVr-0003KI-RG; Wed, 08 Oct 2025 03:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v6OVo-0003J8-Lt
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 03:23:01 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v6OVl-0001EG-9u
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 03:23:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b456d2dc440so1127093766b.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Oct 2025 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1759908176; x=1760512976; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qaa6i5k4E4jxW/Wwh36m97rJej5/fVxaqCUCYObJfSI=;
 b=lh2XA5Hd33q20JkpjyvYFsKw8LCaRX2DZTFclXgLpMxRoP09CBvAasYA3rsnfAgz03
 TTMUl1pBYAjNX8xJisFxjH+ASrMKOqcMWcR2nQZ4xel0GWLIoLuYJLJCZuHsdV++Sfe7
 TcDcwAiIfVzOGHpxGFYFxng6OUq4f/SPZpySWAg8f159Iy/spys2rkwF8Gmcrc3hTh+b
 Z0YKu2/l9UbzvP9UjgogAQtkvTIB4JUGh56IlWQ3h3jo9KBaRzfd4RDaepvODEVBnn+z
 XIBdp0xS3WKDb5e42QdXx29G1fOA8ahpXuL8zZRO91D1tkG3HS3srSeMBuHZVJ2luW92
 yzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908176; x=1760512976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qaa6i5k4E4jxW/Wwh36m97rJej5/fVxaqCUCYObJfSI=;
 b=PjqN8Hr36KHt1toyP8/qVO8zvmGlXPfPEu6ez3YMQkIQHd5E3QblmeBbybzVdzOlQB
 y5lu+7WC3vCkI3I1lMfb3aXddv3QuQ/jIJZsau9O5FFPopHjOK8L9aPJLSLDp3V2X81d
 pUr3C48O5d1PWjyPZhe5+hnps4p3WRvPn39MEli4LqYRXioYDDcGTPxZsfVi7eZ58OQ5
 /KGtf2uEJBsVf4ey5JKqrkVtSnUl2Va580ZLD08p9jkI9w1PnoA66TgeltVGI7f7caFF
 C6vbhaD6UnDw6iioyJ9WTSLKbIUnvRSmu+6+kGvcmhNhQ+oBzXuFtNuDUiu31oPvs8bu
 stEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZBGWhlIbyYnCCiOHebZxNWbnA7mZ5lI9mxHg0GrL99/dR8YGBucpfEa8F5prLVKIiKHm2sFcLNv12@nongnu.org
X-Gm-Message-State: AOJu0YwREYM92JAX7Uc6qSATTP8QXv8DuTme0XvKifS8u8W3c8fU4Yah
 0lKdqKEM2UKSyUMA5LToKQCRqfquSSsHXQnbRDKKINFkuuBqojFbzmle69T8670uezPScD+cGsb
 5mpHCGaqDieJVNaeIS06/hTEXmyBV5IIcr4yjoYuoKKEVgW518a60
X-Gm-Gg: ASbGncthA2zm3uRxuR6zXMrSVsuhkvY1LMM5gWJnWiPRUPnLmeY7+QiMY2IMynMh4ik
 mhX7Jq+gbPWy7W98h8Oew1CguA63yNfkHrLAVhkMhYeqR55GzyZ5mcDT44IHDw2HM9REescnAjG
 y5Dh9MXH1eynE3bR8X6CjqKnxS9RNPfl5DnHN92on4aCygQANwaFSE0L3FIl0yrv7rK46DFS9kL
 aIKm7NeanPBAvI6Ax2/9hgqv7515clSJg==
X-Google-Smtp-Source: AGHT+IH2WUtQOem3n6q5hDDMUzU/Y6QRFggOiI5888IqTL0BXe2Sg1XknNcs6Ub0avFdUNmjvQuFlPzFWcGhiip/VU0=
X-Received: by 2002:a17:907:5c8:b0:b04:1249:2b24 with SMTP id
 a640c23a62f3a-b50abaaf824mr245217266b.37.1759908175547; Wed, 08 Oct 2025
 00:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250417105249.18232-1-jim.shu@sifive.com>
 <20250417105249.18232-7-jim.shu@sifive.com>
 <a28a8a53-013f-4b47-86ac-4053aab1cdde@ventanamicro.com>
In-Reply-To: <a28a8a53-013f-4b47-86ac-4053aab1cdde@ventanamicro.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 8 Oct 2025 15:22:43 +0800
X-Gm-Features: AS18NWDm08PiktLFPteB32RibijesDpGh4rLMxAPjTjA0T5r22KeLnQqxJjndKc
Message-ID: <CALw707qo8pjoVBaBYEQe7rfyGOh_mL7gdO+8228DMAuAKv=s7A@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] target/riscv: Add CPU options of WorldGuard CPU
 extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, 
 Helge Deller <deller@gmx.de>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

I will send a v3 patch to fix it, thanks!

- Jim

On Sat, Aug 9, 2025 at 8:48=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 4/17/25 7:52 AM, Jim Shu wrote:
> > We define CPU options for WG CSR support in RISC-V CPUs which
> > can be set by machine/device emulation. The RISC-V CSR emulation
> > will also check this feature for emulating WG CSRs.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >   target/riscv/cpu.c         |  3 +++
> >   target/riscv/cpu_cfg.h     |  3 +++
> >   target/riscv/tcg/tcg-cpu.c | 11 +++++++++++
> >   3 files changed, 17 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 09ded6829a..a182e8c61f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -236,6 +236,9 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >       ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xthead=
mempair),
> >       ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsyn=
c),
> >       ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVen=
tanaCondOps),
> > +    ISA_EXT_DATA_ENTRY(smwg, PRIV_VERSION_1_12_0, ext_smwg),
> > +    ISA_EXT_DATA_ENTRY(smwgd, PRIV_VERSION_1_12_0, ext_smwgd),
> > +    ISA_EXT_DATA_ENTRY(sswg, PRIV_VERSION_1_12_0, ext_sswg),
>
> We need to keep isa_edata_arr in order because we use it to create the ri=
scv,isa DT:
>
>
> $ git diff
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf462..714fff9c33 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -207,6 +207,8 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>       ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_13_0, ext_smmpm),
>       ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_13_0, ext_smnpm),
>       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
> +    ISA_EXT_DATA_ENTRY(smwg, PRIV_VERSION_1_12_0, ext_smwg),
> +    ISA_EXT_DATA_ENTRY(smwgd, PRIV_VERSION_1_12_0, ext_smwgd),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(ssccfg, PRIV_VERSION_1_13_0, ext_ssccfg),
>       ISA_EXT_DATA_ENTRY(ssccptr, PRIV_VERSION_1_11_0, has_priv_1_11),
> @@ -222,6 +224,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>       ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
>       ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
>       ISA_EXT_DATA_ENTRY(ssu64xl, PRIV_VERSION_1_12_0, has_priv_1_12),
> +    ISA_EXT_DATA_ENTRY(sswg, PRIV_VERSION_1_12_0, ext_sswg),
>       ISA_EXT_DATA_ENTRY(supm, PRIV_VERSION_1_13_0, ext_supm),
>       ISA_EXT_DATA_ENTRY(svade, PRIV_VERSION_1_11_0, ext_svade),
>
>
>
> Thanks,
>
> Daniel
>
> >
> >       { },
> >   };
> > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > index 8a843482cc..a5b045aa2f 100644
> > --- a/target/riscv/cpu_cfg.h
> > +++ b/target/riscv/cpu_cfg.h
> > @@ -143,6 +143,9 @@ struct RISCVCPUConfig {
> >       bool ext_smmpm;
> >       bool ext_sspm;
> >       bool ext_supm;
> > +    bool ext_smwg;
> > +    bool ext_smwgd;
> > +    bool ext_sswg;
> >       bool rvv_ta_all_1s;
> >       bool rvv_ma_all_1s;
> >       bool rvv_vl_half_avl;
> > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> > index 5aef9eef36..343e46e698 100644
> > --- a/target/riscv/tcg/tcg-cpu.c
> > +++ b/target/riscv/tcg/tcg-cpu.c
> > @@ -694,6 +694,17 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
> >           cpu->cfg.ext_ssctr =3D false;
> >       }
> >
> > +    /* RISC-V WorldGuard */
> > +    if (cpu->cfg.ext_sswg && !cpu->cfg.ext_smwg) {
> > +        error_setg(errp, "Sswg extension requires Smwg extension");
> > +        return;
> > +    }
> > +
> > +    if (cpu->cfg.ext_smwgd !=3D cpu->cfg.ext_sswg) {
> > +        error_setg(errp, "Smwgd/Sswg extensions should be enabled toge=
ther");
> > +        return;
> > +    }
> > +
> >       /*
> >        * Disable isa extensions based on priv spec after we
> >        * validated and set everything we need.
>

