Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA140E95A8F
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 00:58:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpebF-0001ZA-5P; Sun, 08 Oct 2023 20:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpeb7-0001Xu-MR; Sun, 08 Oct 2023 20:58:13 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpeb5-0006Xf-9k; Sun, 08 Oct 2023 20:58:12 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-49dd647a477so1489015e0c.3; 
 Sun, 08 Oct 2023 17:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696813089; x=1697417889; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0PZQ0pVnzHHx5o62XthTf32Sh/A6raWK7/bgPjP0Kk=;
 b=lguW9hvwFvJcTuuAeMWIz2yf+G7phmxk/XdIXEzUfbZrM9Ma+VLr4qHvae0kgwuitI
 zaVRfvkLr0KKvllnCcVDIHZ/DjuVToiPUP8adnGe+CQzaBcMBeKZaMID0rXtbMjwlhLQ
 UuB0V6MYU1DFtpBI+Px+Xi0y5gtwo0ZRihR7SdEBI3EvEffNjuAjMkHrKu1QIY0A1i8S
 bELd+ReCLYNkFdplQK44psPNigY7MGGDLuPktG37zyfgQnrGOmw+SMQh0SyaWulyE/3j
 WA2NMBm6jjT0K7APmwRqWq/UxDeIQpSB/45sT+M2GRJBmOKiy/50rPQa3ELy5x6N2fxS
 WyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696813089; x=1697417889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0PZQ0pVnzHHx5o62XthTf32Sh/A6raWK7/bgPjP0Kk=;
 b=cyO/wB57bbSe04NNpzpjioyujXIamj3NNtCEiPmhIMTzoQFv+hD5cFvyZfmR5hWgEr
 Wcd351ajDcMAXDLM7/061BRg2mwx3xYy9AGH8iDda41QeoRY8QBZ38E791AjXuqgqvvW
 FteiH96YeekEL2LNTwb4boAHpyPEaluGRUAve+wCgUcCH92E6HDqf5IaNbZLBc+sllIu
 RLNQ6eWz8oVlVhUV4hAAejeh9+ljcSy1IyFyInpUDA7oSITTl5YDsLfRWOnhwF6QhI06
 ccBpkc2z6ApUASOr8E4I0c4yVJ3OC8Yp5vl/+F0rVcmyCloAh574vO/4YyMeeWZKN2Za
 8N4w==
X-Gm-Message-State: AOJu0YxsL5YIKdorEDJLYXIpragAdbL54ushy73zif9Wq7c21bX4fQOP
 FWtM+tsA2WM0G4qBxMT5NHPyb79tZW+TlTmCZ2s=
X-Google-Smtp-Source: AGHT+IHWTW0H0ZKGJxTNE3sCosLAzolSq/aNueWXd9ukl4fpjqYnl8AXeOJWsdUV4gYcgEXXCVFQP0TglImaOLxz3zE=
X-Received: by 2002:a05:6122:221a:b0:49a:88a9:cac6 with SMTP id
 bb26-20020a056122221a00b0049a88a9cac6mr12653675vkb.11.1696813089686; Sun, 08
 Oct 2023 17:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-3-rbradford@rivosinc.com>
 <CAHBxVyHYJjvADsHPCJeheU4_8s1=DfyeApPyV8QpuPnTm2F=Gw@mail.gmail.com>
 <d2a170aeb3f05614c3801c1819afbbddc3ff4f37.camel@rivosinc.com>
In-Reply-To: <d2a170aeb3f05614c3801c1819afbbddc3ff4f37.camel@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 10:57:42 +1000
Message-ID: <CAKmqyKNrmnUTHxx_wYe0V6sL0M10hkwOGYakGw1E6pu17YyMKQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Support discontinuous PMU counters
To: Rob Bradford <rbradford@rivosinc.com>
Cc: Atish Kumar Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Wed, Oct 4, 2023 at 7:36=E2=80=AFPM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> Hi Atish,
>
> On Tue, 2023-10-03 at 13:25 -0700, Atish Kumar Patra wrote:
> > On Tue, Oct 3, 2023 at 5:51=E2=80=AFAM Rob Bradford <rbradford@rivosinc=
.com>
> > wrote:
> > >
> > > There is no requirement that the enabled counters in the platform
> > > are
> > > continuously numbered. Add a "pmu-mask" property that, if
> > > specified, can
> > > be used to specify the enabled PMUs. In order to avoid ambiguity if
> > > "pmu-mask" is specified then "pmu-num" must also match the number
> > > of
> > > bits set in the mask.
> > >
> > > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > > ---
> > >  target/riscv/cpu.c     |  1 +
> > >  target/riscv/cpu_cfg.h |  1 +
> > >  target/riscv/pmu.c     | 15 +++++++++++++--
> > >  3 files changed, 15 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 9d79c20c1a..b89b006a76 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -1817,6 +1817,7 @@ static void
> > > riscv_cpu_add_misa_properties(Object *cpu_obj)
> > >  static Property riscv_cpu_extensions[] =3D {
> > >      /* Defaults for standard extensions */
> > >      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> > > +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, 0),
> > >      DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf,
> > > false),
> > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > > index 0e6a0f245c..40f7d970bc 100644
> > > --- a/target/riscv/cpu_cfg.h
> > > +++ b/target/riscv/cpu_cfg.h
> > > @@ -124,6 +124,7 @@ struct RISCVCPUConfig {
> > >      bool ext_XVentanaCondOps;
> > >
> > >      uint8_t pmu_num;
> > > +    uint32_t pmu_mask;
> > >      char *priv_spec;
> > >      char *user_spec;
> > >      char *bext_spec;
> > > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > > index 13801ccb78..f97e25a1f6 100644
> > > --- a/target/riscv/pmu.c
> > > +++ b/target/riscv/pmu.c
> > > @@ -437,6 +437,13 @@ int riscv_pmu_setup_timer(CPURISCVState *env,
> > > uint64_t value, uint32_t ctr_idx)
> > >  void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
> > >  {
> > >      uint8_t pmu_num =3D cpu->cfg.pmu_num;
> > > +    uint32_t pmu_mask =3D cpu->cfg.pmu_mask;
> > > +
> > > +    if (pmu_mask && ctpop32(pmu_mask) !=3D pmu_num) {
> > > +        error_setg(errp, "Mismatch between number of enabled
> > > counters in "
> > > +                         "\"pmu-mask\" and \"pmu-num\"");
> > > +        return;
> > > +    }
> > >
> >
> > Is that necessary for the default case? I am thinking of marking
> > pmu-num as deprecated and pmu-mask
> > as the preferred way of doing things as it is more flexible. There is
> > no real benefit carrying both.
> > The default pmu-mask value will change in that case.
> > We can just overwrite pmu-num with ctpop32(pmu_mask) if pmu-mask is
> > available. Thoughts ?
> >
>
> I agree it makes sense to me that there is only one way for the user to
> adjust the PMU count. However i'm not sure how we can handle the
> transition if we choose to deprecate "pmu-num".
>
> If we change the default "pmu-mask" to MAKE_32BIT_MASK(3, 16) then that
> value in the config will always be set - you propose that we overwrite
> "pmu-num" with the popcount of that property. But that will break if

Couldn't we deprecate "pmu-num" and then throw an error if both are
set? Then we can migrate away from "pmu-num"

Alistair

> the user has an existing setup that changes the value of "pmu-num"
> (either as a property at runtime or in the CPU init code).
>
> One option would be to not make the mask configurable as property and
> make choosing the layout of the counters something that the specialised
> CPU init can choose to do.
>
> Cheers,
>
> Rob
>
> > >      if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> > >          error_setg(errp, "Number of counters exceeds maximum
> > > available");
> > > @@ -449,6 +456,10 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > > **errp)
> > >          return;
> > >      }
> > >
> > > -    /* Create a bitmask of available programmable counters */
> > > -    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> > > +    /* Create a bitmask of available programmable counters if none
> > > supplied */
> > > +    if (pmu_mask) {
> > > +        cpu->pmu_avail_ctrs =3D pmu_mask;
> > > +    } else {
> > > +        cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> > > +    }
> > >  }
> > > --
> > > 2.41.0
> > >
>
>

