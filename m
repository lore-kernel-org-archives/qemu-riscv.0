Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90A3C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 23:27:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLAdg-0004zN-2P; Wed, 03 Jan 2024 18:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLAde-0004yq-D8
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 18:27:06 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLAdc-000791-7H
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 18:27:06 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cd20d9d483so2159311fa.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 15:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704324422; x=1704929222;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oX+Ot/NWA8X93J/IMQOe1aMpkSFiyDZq3hoDSwe4gcE=;
 b=ab9cEVpV+HxJZ7+PBuiki3x8EWAbY9YIqr8I/c2PfaVtuEaZoJr5uRbCqv7Tj85owr
 1TnEO9D3RAkLSJIp2T0LQi9Sfwv8/GIy2ZZG6VHPhtEcLW8hnWjQFwa+DZNhTDvjpdJK
 UvInrgPWkQ5BlhqFbyxcS+7x+gWX3+iwWQoOT0oEGfYPvqATGWm10yhJLv3zrBFBZaFq
 QhAdI4Fa9nqGmhDdUskQaHHjCjgwLWg98VnABp9OD+uzHV0S+3OAT/SW8o+XuUQvHvid
 yZvTQ7a1FCdI3HbpOPI044hpP2EEBzdz2EtCl8PZpSK7pq+Cgi+LhQYNQ2VpzNI8BCZQ
 O0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704324422; x=1704929222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oX+Ot/NWA8X93J/IMQOe1aMpkSFiyDZq3hoDSwe4gcE=;
 b=Y6fZyknwIWefkzvLMjDZvavmPz0YcOz/G/6Jh9t5TgKB8/zwmNT6XxXZaAYFyYPNID
 drctNdCzd77KSTdzcJiyskR+kByj6X53xgJg4r5FeHuyOy1LdWX2Si8KtAukTxjU7H6H
 KlwRmjz4WtJ0AUQTh1pf2Vuqs/neNsTM/LBAyCR9CN5uy8segw2a0uLfmczJyoY24G/R
 gUa4Yy7t5vFGSHUkcnZXoXfPD5igkrsVg9WkpMgsPJzkTE52LQFeb+vJ25bRPAhyYPR8
 ijN7GTXfYtzxd8M7M20/qSCwaxlIzOIn4lITyIV1wDp7jW1HEMGPFbcNAMVTAfZl2Me8
 neXg==
X-Gm-Message-State: AOJu0YwTkEt0PzSsHF7PoFJIgKFUbl740obXDcumOpl8qUkAa0C6FNGs
 +XpiJbyjY0cDLgemMtZts8OXlz131kSEtgIjbkNEMMlkupuPsw==
X-Google-Smtp-Source: AGHT+IHQaNdfzIPsduidcWjhYBkdNEYQnH3nn6xqhJD+4oNT0gSFieKWcpBeGndLvQtM5F9bRuPyHvph6+ULRONdnjE=
X-Received: by 2002:a05:651c:2119:b0:2cd:449:149 with SMTP id
 a25-20020a05651c211900b002cd04490149mr2638597ljq.80.1704324421707; Wed, 03
 Jan 2024 15:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20231229004929.3842055-1-atishp@rivosinc.com>
 <20231229004929.3842055-3-atishp@rivosinc.com>
 <ff37b49d-e152-472e-8c24-4adbb8cdcb46@ventanamicro.com>
In-Reply-To: <ff37b49d-e152-472e-8c24-4adbb8cdcb46@ventanamicro.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 3 Jan 2024 15:26:50 -0800
Message-ID: <CAHBxVyEqiutsbsADKpOOJ_oT5Y-W8MWUWQgQY7ihAriL4et3+Q@mail.gmail.com>
Subject: Re: [v2 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jan 3, 2024 at 12:11=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 12/28/23 21:49, Atish Patra wrote:
> > From: Kaiwen Xue <kaiwenx@rivosinc.com>
> >
> > This adds the properties for ISA extension smcntrpmf. Patches
> > implementing it will follow.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> > ---
> >   target/riscv/cpu.c     | 3 ++-
> >   target/riscv/cpu_cfg.h | 1 +
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 83c7c0cf07be..da3f05cd5373 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -148,6 +148,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen)=
,
> >       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> >       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> > +    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
> >       ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
> >       ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
> >       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> > @@ -1296,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32=
_t bit)
> >   const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
> >       /* Defaults for standard extensions */
> >       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> > +    DEFINE_PROP_BOOL("smcntrpmf", RISCVCPU, cfg.ext_smcntrpmf, false),
>
> This will end up breaking the build since this macro is adding a Property=
 object
> inside a RISCVCPUMultiExtConfig array. Patch 3 is then fixing it by remov=
ing this
> line, so in the end the build works fine. But having a patch that doesn't=
 build
> can make future bisects unpleasant.
>

This was a rebase error. I will fix it in the next version.

> I don't see a problem adding right now the actual flag:
>
> +    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
>
> The flag will do nothing, sure, but the commit msg already mentions "Patc=
hes
> implementing it will follow", so it's fine to me.
>
>
>
> Thanks,
>
> Daniel
>
>
> >       MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
> >       MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
> >       MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> > @@ -1308,7 +1310,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions=
[] =3D {
> >       MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
> >       MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
> >       MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
> > -
> >       MULTI_EXT_CFG_BOOL("smepmp", ext_smepmp, false),
> >       MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
> >       MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
> > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > index f4605fb190b9..00c34fdd3209 100644
> > --- a/target/riscv/cpu_cfg.h
> > +++ b/target/riscv/cpu_cfg.h
> > @@ -72,6 +72,7 @@ struct RISCVCPUConfig {
> >       bool ext_zihpm;
> >       bool ext_smstateen;
> >       bool ext_sstc;
> > +    bool ext_smcntrpmf;
> >       bool ext_svadu;
> >       bool ext_svinval;
> >       bool ext_svnapot;

