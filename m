Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F49C28B30
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 13:31:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tt58K-0004SO-Pk; Fri, 14 Mar 2025 09:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1tt58H-0004Qt-4M
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 09:31:26 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1tt58E-00052J-39
 for qemu-riscv@nongnu.org; Fri, 14 Mar 2025 09:31:24 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so3213182a12.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Mar 2025 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741959077; x=1742563877;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7dvQKGuKXLM1+01riVexho59nGYEOYjS7U+HLC0zzo=;
 b=g/wAXLS7dFPwC+J3OS9Ns5GVEs4dhK9C30h6Va+cocgeKIBdioOG1/LqXbJX7dzMQ2
 07LsnP7bVdCy2itTxxdyrEB/SnOIg4TZEqi/2R8DAgNf3toaVaGWOEXW1jhkPA79fNwK
 hlkg679UNFt3PHMNHVWEhLmCuTiCp9bFl8zaqkwVM/KdFP3/EFiQzKoldJ8mi6GQITcF
 lQGlkJShkvTxeibDG1o9Q6CPB91W5+e7V3HX8XkiVa4Lu9V4A5cg6gzs2vl3fa5a32qv
 HpWdVloyFcg4/4l0QQOlFaMEiE2S0ykGkvy6eud1DdTVfJyhWwTnLQuTLuiUUbCVvOQd
 g21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741959077; x=1742563877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7dvQKGuKXLM1+01riVexho59nGYEOYjS7U+HLC0zzo=;
 b=bw1leKoZkMqj533mmPUXAjkFdRh8SBxzrFK41m1WevSHMkUhPNY3b9KhLJaGxhhZMo
 09EP2h2en8/j4aZxqdLHZ0t1nveq5iAbR5U+rOb2PMNCxwqaNN0Wlnd76GPNYb9S7NxG
 06DOq1XpCgB3yTKZE63+i02UcfHhFgr5LA4XtItkTc2wfn/2neQIE0g0SQJos3u8BL5W
 3tbUqQS9c3jRjdO2E+rWnfK/9xF6KFL5xpEViVX9S3iqnuvGr2OKXd5Im4X8mtddMVBG
 YV9+fGj2nLPs2UTJCITUTyMBq7lQsk5O30HRF/urIi7RLFR0LkYO3KgXA4Lf7nPHzZrK
 g2IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu8ZZvjmMLsyMTpTJg+6QJ/6UJ0vcPvoev83zXYCPTwOeLqtIADZCdUM4kdGifUqd8FlLt6ZfNmFlX@nongnu.org
X-Gm-Message-State: AOJu0Yw5Z+VzN4yHEA6NVula08Td+t8emcxy+O4DReuJ6h3hQaGKQVmf
 fB0oBssR6v+toWOwWgom74DvkqIBcdm7yCmOVWM0v2T6m0Zd7e0D1DoBUjBU5rXQi2YEtYyoY1o
 e8KMeB9HMwFYA564CGrSDWY5/UXQ0l3VqeqXY+m9SQFe4AYTd
X-Gm-Gg: ASbGnctpuAVLZzrSOa23GALy8ub9TYldBhVhhG/zaP6l/ZaRcvS0TFMLY6WmWpqVyBP
 0+FxvbzLABDTL5NI7MtaW4YubbtYyIu4oK9iizkN00NHlDyjnFLL5B516NHv+i35HrLxhoc7WDj
 fxa9znEDBCU3EVKsbBfq/G3RhchfBOncS/xtq0eZZdZiNSJrvtjLphlyVWIRk=
X-Google-Smtp-Source: AGHT+IEUSCNPYnV1iivyO5qvJuCKo5ik820TXmoqguPmGjCP+1wOVRPGtDU2GP+qv8y7NqQZ0OiaGg1Ju46cb+CSQGk=
X-Received: by 2002:a05:6402:5186:b0:5e5:b572:a6d7 with SMTP id
 4fb4d7f45d1cf-5e89e6b0648mr3347328a12.6.1741959077396; Fri, 14 Mar 2025
 06:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250314104833.369365-1-alexghiti@rivosinc.com>
 <CAHVXubjJ_oCKqjYBFRjn-BM-cB4JUsFJ-dX3Dqs6j=6vTh+yHA@mail.gmail.com>
 <d6295353-33d8-4816-b815-49958634d263@ventanamicro.com>
In-Reply-To: <d6295353-33d8-4816-b815-49958634d263@ventanamicro.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 14 Mar 2025 14:31:06 +0100
X-Gm-Features: AQ5f1Jr3SKKEMtY76TLoi5BU3xbsFQ0I0RTivgcGqdqUs_aYmwumvu-Ztp7_h_I
Message-ID: <CAHVXubh8bE6OGX3M6Gm7GiMXyuQf1GPK2nf50cnJXPwBH0Rc_g@mail.gmail.com>
Subject: Re: [PATCH RFC] target: riscv: Add Svrsw60b59b extension support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alexghiti@rivosinc.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Mar 14, 2025 at 1:38=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 3/14/25 9:11 AM, Alexandre Ghiti wrote:
> > On Fri, Mar 14, 2025 at 11:48=E2=80=AFAM Alexandre Ghiti <alexghiti@riv=
osinc.com> wrote:
> >>
> >> The Svrsw60b59b extension allows to free the PTE reserved bits 60 and =
59
> >> for software to use.
> >
> > I missed that the extension had been renamed to Svrsw60*t*59b, I'll
> > fix that in v2 later after I collect some feedback.
>
> Just to be clear: the extension is going to be named Svrsw60t59b, not
> "Svrsw60*t*59b". Correct?

Yes, I added the '*' to emphasize the subtle change :)

>
>
> Aside from that code LGTM. Thanks,

Thanks!

Alex

>
> Daniel
>
>
> >
> > Thanks,
> >
> > Alex
> >
> >>
> >> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> >> ---
> >>
> >> I tested it by always setting the bits 60 and 59 in Linux which booted
> >> fine.
> >>
> >>   target/riscv/cpu.c        | 2 ++
> >>   target/riscv/cpu_bits.h   | 3 ++-
> >>   target/riscv/cpu_cfg.h    | 1 +
> >>   target/riscv/cpu_helper.c | 3 ++-
> >>   4 files changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 3d4bd157d2..ee89cdef46 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -219,6 +219,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >>       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> >>       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> >>       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> >> +    ISA_EXT_DATA_ENTRY(svrsw60b59b, PRIV_VERSION_1_13_0, ext_svrsw60b=
59b),
> >>       ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
> >>       ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
> >>       ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
> >> @@ -1644,6 +1645,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extension=
s[] =3D {
> >>       MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
> >>       MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
> >>       MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
> >> +    MULTI_EXT_CFG_BOOL("svrsw60b59b", ext_svrsw60b59b, false),
> >>       MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
> >>
> >>       MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
> >> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >> index f97c48a394..71f9e603c5 100644
> >> --- a/target/riscv/cpu_bits.h
> >> +++ b/target/riscv/cpu_bits.h
> >> @@ -663,7 +663,8 @@ typedef enum {
> >>   #define PTE_SOFT            0x300 /* Reserved for Software */
> >>   #define PTE_PBMT            0x6000000000000000ULL /* Page-based memo=
ry types */
> >>   #define PTE_N               0x8000000000000000ULL /* NAPOT translati=
on */
> >> -#define PTE_RESERVED        0x1FC0000000000000ULL /* Reserved bits */
> >> +#define PTE_RESERVED(svrsw60b59b)              \
> >> +               (svrsw60b59b ? 0x07C0000000000000ULL : 0x1FC0000000000=
000ULL) /* Reserved bits */
> >>   #define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bit=
s */
> >>
> >>   /* Page table PPN shift amount */
> >> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> >> index b410b1e603..f6e4b0068a 100644
> >> --- a/target/riscv/cpu_cfg.h
> >> +++ b/target/riscv/cpu_cfg.h
> >> @@ -89,6 +89,7 @@ struct RISCVCPUConfig {
> >>       bool ext_svinval;
> >>       bool ext_svnapot;
> >>       bool ext_svpbmt;
> >> +    bool ext_svrsw60b59b;
> >>       bool ext_svvptc;
> >>       bool ext_svukte;
> >>       bool ext_zdinx;
> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> index e1dfc4ecbf..6546cea403 100644
> >> --- a/target/riscv/cpu_helper.c
> >> +++ b/target/riscv/cpu_helper.c
> >> @@ -1156,6 +1156,7 @@ static int get_physical_address(CPURISCVState *e=
nv, hwaddr *physical,
> >>       bool svade =3D riscv_cpu_cfg(env)->ext_svade;
> >>       bool svadu =3D riscv_cpu_cfg(env)->ext_svadu;
> >>       bool adue =3D svadu ? env->menvcfg & MENVCFG_ADUE : !svade;
> >> +    bool svrsw60b59b =3D riscv_cpu_cfg(env)->ext_svrsw60b59b;
> >>
> >>       if (first_stage && two_stage && env->virt_enabled) {
> >>           pbmte =3D pbmte && (env->henvcfg & HENVCFG_PBMTE);
> >> @@ -1225,7 +1226,7 @@ restart:
> >>           if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
> >>               ppn =3D pte >> PTE_PPN_SHIFT;
> >>           } else {
> >> -            if (pte & PTE_RESERVED) {
> >> +            if (pte & PTE_RESERVED(svrsw60b59b)) {
> >>                   return TRANSLATE_FAIL;
> >>               }
> >>
> >> --
> >> 2.39.2
> >>
>

