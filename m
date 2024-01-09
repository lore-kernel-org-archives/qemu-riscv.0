Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38511C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 00:27:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMzyB-0001x0-8o; Mon, 08 Jan 2024 19:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzy7-0001o2-6M
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:27:49 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rMzy3-0001wf-Fs
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:27:45 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so25532131fa.3
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 16:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704760061; x=1705364861;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Klq302KFPk+F+pf1O3ZUuHzESws9G8Y8ZPoijNI8HOo=;
 b=MYJS56F9dbIionuCvaqU8Sto9nxSJDvunhvAUFweVzcr5CgTp4nKRihI72esiSem6O
 KvLJc7uOvyCePdckCZ5z07EwIj7XxPcnEJwGG2cyF7WWl/x/D2O/oUneu1I6OCy71hRb
 ydy78F0B1zI6Kx/T9bucx+YYNSDiPLYGPpGA6sPinU3QkZgrEHIooqC0kSMM8LdunsJI
 dDWOzAF4DCpZUcx2vcZxTAD4EEKZTh9cB4oU6WLF5eW+tGowhrYNNrMYo4woo/k7b0Bh
 j1gvnUvK4ykGLOOAkoHF+NQFwa0wERu5joNmpt1ozcHL4/a4ggmasEjoddQ48/X6y+4J
 Qt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704760061; x=1705364861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Klq302KFPk+F+pf1O3ZUuHzESws9G8Y8ZPoijNI8HOo=;
 b=TXgQExrm10o8z9SgIL2hJ/4L/JULk9SXEtQeSLrv2ikeYc1Rz4RKHAvngI8lRicPbR
 A0Hcnr2S0/9wS/vfQd/G+pmoJZ7oTZXOR5kXrdOwWIA0UNlJz+stSVfWX5ugzDmz/ic1
 858UwPebSygDi475fuEBpehm6x67okUBp+kwjDivLs6malHrWV/4apSWD6X7vAsnNDZb
 La6eJTY9ZhGl9ch61Yq4RnQz7tVkD7YfbIaN1WQyIQnAbfE0VQK3ytC1c0lmqhZHC7Wh
 uHx+X95POkbMI7bIcEa1RbVu0NlrATW7itY8pTZ6GxTSs4SaTIerFkL2wpidJ9kutrbz
 oxeg==
X-Gm-Message-State: AOJu0YztiwSjYRzb7z+5nIdCUJFBId56elexl9BUFAkTHEWe0aDN5m0b
 xj5kF/Z8u0tLirlR3wWtFc5rJ/zuJC9pqOtpce/z6If1Ol196A==
X-Google-Smtp-Source: AGHT+IFjS9CXOhj2GprjtEhquepuE5C9A30EJDXoFv/2SKP5Fon+TnzUiTqr+4TLp8PNNoqO9BYiTl81z+LHAwgAyHs=
X-Received: by 2002:a2e:a304:0:b0:2cc:6e47:6215 with SMTP id
 l4-20020a2ea304000000b002cc6e476215mr1694650lje.57.1704760061170; Mon, 08 Jan
 2024 16:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20240105221327.176764-1-atishp@rivosinc.com>
 <20240105221327.176764-3-atishp@rivosinc.com>
 <1a97eda9-480d-49f1-9fe5-a607ba08b818@ventanamicro.com>
In-Reply-To: <1a97eda9-480d-49f1-9fe5-a607ba08b818@ventanamicro.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 8 Jan 2024 16:27:30 -0800
Message-ID: <CAHBxVyEDkQaBJqgBwKzm1YEpQvC1HJ+CioqPyfUDsK=S91YsOg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] target/riscv: Add cycle & instret privilege mode
 filtering properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Kaiwen Xue <kaiwenx@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Weiwei Li <liwei1518@gmail.com>, kaiwenxue1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x22b.google.com
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

On Mon, Jan 8, 2024 at 10:10=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 1/5/24 19:13, Atish Patra wrote:
> > From: Kaiwen Xue <kaiwenx@rivosinc.com>
> >
> > This adds the properties for ISA extension smcntrpmf. Patches
> > implementing it will follow.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> > ---
> >   target/riscv/cpu.c     | 2 ++
> >   target/riscv/cpu_cfg.h | 1 +
> >   2 files changed, 3 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 83c7c0cf07be..ea34ff2ae983 100644
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
>
> Sorry for not noticing this in the previous version. I believe we want th=
e "smcntrpmf"
> entry to be right after "smaia" because the isa_edata_arr[] ordering matt=
ers when
> building the riscv,isa string in riscv_isa_string_ext().
>

Oops. Thanks for catching that. Fixed in v4.

>
> Thanks,
>
> Daniel
>
> > @@ -1296,6 +1297,7 @@ const char *riscv_get_misa_ext_description(uint32=
_t bit)
> >   const RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
> >       /* Defaults for standard extensions */
> >       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> > +    MULTI_EXT_CFG_BOOL("smcntrpmf", ext_smcntrpmf, false),
> >       MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
> >       MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
> >       MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
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

