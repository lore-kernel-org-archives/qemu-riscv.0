Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE19C7EE25
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 06:39:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q79JG-0001aA-G8; Thu, 08 Jun 2023 02:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q79JD-0001a1-OR
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 02:39:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q79JB-0007fh-UD
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 02:39:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30b023b0068so187379f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686206384; x=1688798384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=whV1WVemsP3aYRkkQ90j/Ga2v0ggjO/g8T1SiHGkwRk=;
 b=AbRx7GPnaIBmcBFbo7qyw88huHmtwTHFJldzlOvfaum359IKtmq1fiEsOIDB8JDTxO
 QgKsXBpMNxzsFM5HExGcPak2mwpnXweLmkL7jaxR59Tx0yiWcD2UYGk2CVOMtOGBM6M5
 4WhZYn0uF1iwYUWVc34AyhigQF9cntppT58JMCzovenf4jLlLKnL9PASCAISUxO/o16d
 Vnzt6G5QcZZPMtHt4NR7fB5XBI+djP6aDUYdggio7VI1LqP1yteM00hneJgAjfDSFPmT
 yYT/3OmDE8mbivD6u7ZX/B6Eatsl5LKAWVtNvjGhqtpv86GiZBUVsrNz3MWXt4zDc2H8
 FiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686206384; x=1688798384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whV1WVemsP3aYRkkQ90j/Ga2v0ggjO/g8T1SiHGkwRk=;
 b=gghWIBxVcgAz9w0Ei2l+lHtdxMBAsKIfhk4oYuDtFwutFBXnIU/xygpCeBM8yUXdUf
 g8qHeh2y+4iNvTXuVBZdGJp9lJkmx8OMBGWuIxXJko1K8CC5UanR+xcHJzNd3pEB7iGs
 uM7lQ8exEclEmGK7TREcT7o2zo6lRpqR8mRGBvvZGAujCklA50IppsZOeafZilLCReBH
 71Ib6r5qo8VNv+DSOoLXMYiCrZdlQL7DpmH/tk//qcbhPPvdwYuHrW+B/S0auGQL4+Vh
 z0RKyAbq2XbHZt5e+g87+keItCf3VE3mRDM2iQJ1R7ERDWdOpLAPN5dCcM5ljyri50ZR
 oz7w==
X-Gm-Message-State: AC+VfDyZfn8zICIHH75oGUapQq0Z6AkjDZExKkZwLJ92CrrXEAi7GuzB
 DqpgSWmYniN/0nMUZmharbj+Wg==
X-Google-Smtp-Source: ACHHUZ6BJRrSi4RTsayfYtJ90rTbT7O4RoZ9+Ptg1n30veUEXzKdFrMT8BQVyBHLtQMcjUUTi+jV9w==
X-Received: by 2002:a05:6000:108a:b0:30e:56b3:60fe with SMTP id
 y10-20020a056000108a00b0030e56b360femr915717wrw.4.1686206384035; 
 Wed, 07 Jun 2023 23:39:44 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 e40-20020a5d5968000000b002fda1b12a0bsm559216wri.2.2023.06.07.23.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 23:39:43 -0700 (PDT)
Date: Thu, 8 Jun 2023 08:39:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 16/16] target/riscv/kvm.c: read/write
 (cbom|cboz)_blocksize in KVM
Message-ID: <20230608-ee9f070404a1dfcc882f8b15@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-17-dbarboza@ventanamicro.com>
 <20230607-95d85b924e7d8696ba1eac6e@orel>
 <34f72e57-3b3f-7da4-1fc9-8af464ee6c99@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34f72e57-3b3f-7da4-1fc9-8af464ee6c99@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jun 07, 2023 at 05:37:16PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 6/7/23 10:01, Andrew Jones wrote:
> > On Tue, May 30, 2023 at 04:46:23PM -0300, Daniel Henrique Barboza wrote:
> > > If we don't set a proper cbom_blocksize|cboz_blocksize in the FDT the
> > > Linux Kernel will fail to detect the availability of the CBOM/CBOZ
> > > extensions, regardless of the contents of the 'riscv,isa' DT prop.
> > > 
> > > The FDT is being written using the cpu->cfg.cbom|z_blocksize attributes,
> > > so let's use them. We'll also expose them as user flags like it is
> > > already done with TCG.
> > > 
> > > However, in contrast with what happens with TCG, the user is not able to
> > > set any value that is different from the 'host' value. And KVM can be
> > > harsh dealing with it: a ENOTSUPP can be thrown for the mere attempt of
> > > executing kvm_set_one_reg() for these 2 regs.
> > > 
> > > We'll read the 'host' value and use it to set these values, regardless of
> > > user choice. If the user happened to chose a different value, error out.
> > > We'll also error out if we failed to read the block sizes.
> > > 
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/kvm.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
> > >   1 file changed, 92 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> > > index 92b99fe261..7789d835e5 100644
> > > --- a/target/riscv/kvm.c
> > > +++ b/target/riscv/kvm.c
> > > @@ -241,8 +241,16 @@ static void kvm_cpu_cfg_set(RISCVCPU *cpu, RISCVCPUMultiExtConfig *multi_ext,
> > >                               uint32_t val)
> > >   {
> > >       int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
> > > -    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> > > +    uint16_t *blocksize;
> > > +    bool *ext_enabled;
> > > +    if (strstr(multi_ext->name, "blocksize")) {
> > > +        blocksize = (void *)&cpu->cfg + cpu_cfg_offset;
> > > +        *blocksize = val;
> > > +        return;
> > > +    }
> > 
> > We should add 'get' accessors to each property and then always use those
> > accessors to get the values. Trying to share a single accessor across
> > properties, using the names to determine their sizes, is basically trying
> > to reinvent 'get' without the function pointer.
> 
> To be honest we don't need all this machinery for the blocksize attributes.
> We check them only in a few cases and could access them directly via cpu->cfg.
>

OK

A bit off-topic, but thinking about this some more, we're doing block
sizes wrong. We should be using boolean properties for cpu features in
order to simplify qmp_query_cpu_model_expansion(), which we'll want to add
to riscv soon. For CBO block sizes, that means to create multiple possible
block size booleans, e.g. cbom64, cbom128, ..., which are all mutually
exclusive. Using booleans also avoids the need to validate that the block
size a user puts on the command line is a power-of-2, which TCG isn't
currently doing, but should be.

Changing how we input block sizes, with all the deprecation and what not,
would be a separate series though, and I think it can go after this
series, because the block sizes would still ultimately be stored in the
same way, as uint16s, for convenience of use.

Thanks,
drew

