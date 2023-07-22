Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F22FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 00:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qN0FZ-00062I-QX; Fri, 21 Jul 2023 20:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kaiwenx@rivosinc.com>)
 id 1qN0FX-00061y-TW
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 20:13:32 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kaiwenx@rivosinc.com>)
 id 1qN0FI-0007nW-EU
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 20:13:31 -0400
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-76714caf466so232256985a.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Jul 2023 17:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689984794; x=1690589594; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hjXT1R8oiBgHcpsMWV7f0/G+Lw623RvPbNcbZjo3qzs=;
 b=RL1hnW4qET0+f/c2wcYfYCuZKpyLDzK4lfy7uXSVkYtoH6IWx/nYPs+If5eqrBBfYP
 DiNfTNySXFm7DhbOJ9kMbSEGSK6BkbgXPZuY8NZdnmf1i3gDSVGK8KWuOHdN+acPVkqB
 MQMeNXFVDpd3RdqY3qKQ4o2/v4AOXr8506rMzGpKm/E4m9+vu0hrZjmPmurstOy/w9aS
 SABsLLZUyRjTED57JT5F6TTGwCbkCtCzC5yyxxVH1K+5aexnN3OpLkZfueqqNtcE4oIU
 anu+Up3zZKvzhDhJTqWaWJvKwh0b43AcoQzZfJt8Yi298V8OkMPe+a0LA9qRumcqtkvO
 JWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689984794; x=1690589594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjXT1R8oiBgHcpsMWV7f0/G+Lw623RvPbNcbZjo3qzs=;
 b=ZNr2OhwRFkiijx4BbxpaHVE6iCqzDPBCnk5Ly1J1fymEE8D94fyeZmd1gfQ1a617TA
 0/o17EdsJiR3phN+wOgpfnfJQcnzI9YDcQXRrUultwqlfZFCOSfc4Zj7duok8EuJwtD0
 E8fjhpIBXkgOBmqmabf5dHWtNCa8q6VxBs2V6hrJenCNArdRTOdtfcnmNkOqnEwUODum
 vDC1+Y3cIL9HEKNsYGNwQfZl03hADJ2HdRvR7staR4XF01SecD8FY++BYJzDadcGYDRG
 fanpdchBWMNfs5QHiRrT+HtLqrg3KPtoJE+pgOv9o8/gf6P9UHHGIqKC4nhLh0LRf2cN
 /eow==
X-Gm-Message-State: ABy/qLaldkyy6aUXnXcvjHcNUysD123dE2YeVOZIkrvv96Mb5ROMa9V5
 3Fb9EvQbT3WRA7mGwK6t953UsFY/IIf2JCa8nWgMYQ==
X-Google-Smtp-Source: APBJJlFcaqTAdP1Dgg8L4vD6ZyhQpF3LHRXsa+ODK7JJjwlGLc8guM5XfpoOcEOS7q/sbPk0HVvfoRKUDZlTTfnz5/w=
X-Received: by 2002:a05:620a:f12:b0:765:a23b:cc27 with SMTP id
 v18-20020a05620a0f1200b00765a23bcc27mr1668791qkl.14.1689984794701; Fri, 21
 Jul 2023 17:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689631639.git.kaiwenx@rivosinc.com>
 <d0e7d84180afec116b9fc54ef72fba1d7d8ff345.1689631639.git.kaiwenx@rivosinc.com>
 <07409bc6-dc55-abd6-f527-2797aa251a88@iscas.ac.cn>
In-Reply-To: <07409bc6-dc55-abd6-f527-2797aa251a88@iscas.ac.cn>
From: Kevin Xue <kaiwenx@rivosinc.com>
Date: Fri, 21 Jul 2023 17:13:04 -0700
Message-ID: <CAOkKhRSkhpoW3xhYdnazK4hRa2BZOZMdzxfmtvZeQ_RjxitNnw@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Add cycle & instret privilege mode
 filtering properties
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Atish Kumar Patra <atishp@atishpatra.org>, Kaiwen Xue <kaiwenx@andrew.cmu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=kaiwenx@rivosinc.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jul 18, 2023 at 6:21=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
>
> On 2023/7/19 06:47, Kaiwen Xue wrote:
> > This adds the properties for ISA extension smcntrpmf. Patches
> > implementing it will follow.
> >
> > Signed-off-by: Kaiwen Xue <kaiwenx@andrew.cmu.edu>
> > Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> > ---
> >   target/riscv/cpu.c     | 2 ++
> >   target/riscv/cpu_cfg.h | 1 +
> >   2 files changed, 3 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 9339c0241d..31a1862561 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -132,6 +132,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
> >       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen)=
,
> >       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> >       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
> > +    ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
> >       ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
> >       ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
> >       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> > @@ -1753,6 +1754,7 @@ static Property riscv_cpu_extensions[] =3D {
> >       /* Defaults for standard extensions */
> >       DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> >       DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
> > +    DEFINE_PROP_BOOL("smcntrpmf", RISCVCPU, cfg.ext_smcntrpmf, false),
>
> Normally, property should be exposed to user at last after the function
> is implemented.
>
> Regards,
>
> Weiwei Li

Will do in the next version.

Thanks,
Kevin

>
> >       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >       DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, tr=
ue),
> > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > index 2bd9510ba3..424246cbec 100644
> > --- a/target/riscv/cpu_cfg.h
> > +++ b/target/riscv/cpu_cfg.h
> > @@ -69,6 +69,7 @@ struct RISCVCPUConfig {
> >       bool ext_zihintpause;
> >       bool ext_smstateen;
> >       bool ext_sstc;
> > +    bool ext_smcntrpmf;
> >       bool ext_svadu;
> >       bool ext_svinval;
> >       bool ext_svnapot;
>
>

