Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2578BC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 06:03:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q78jh-0003Oz-CP; Thu, 08 Jun 2023 02:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q78jS-0003NP-TV
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 02:02:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q78jR-0001uB-4e
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 02:02:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f7fcdc7f7fso191165e9.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 23:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686204166; x=1688796166;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DAunNoGN/E1C+FW1ht0zgjXYFEivPbwMTD6bGLRmpC8=;
 b=blJSU0FgLZwObgwV4HTl0d9EniDwvXyfmbWSg0hgH6yIyK/wZ49UUxe7mkLcyxTlfa
 4ZnAopB3DM0wIl3UvT9b14j5lINjcAmmGDSTbFM1PqCpiRz5ik5pgwz07lZ+htFJ33Ex
 lbOotSVKsu8E5HjeEQN50qtUZhIFFRr7oxWKVPbHG4sr5ABfoR7PGxDKBIaVruxbLtCz
 pZaFqJbfxfqAwCJyFaQn9g5jos6MMtLtaEhsdyQjyD+BwRSlVhad6SQeC6VWRN/qhpdf
 VAqP6j8xDWyK+nfD3VY3lHMFqjLYvFuWCzcLnuKx5OJ9c3OZnig3zhjxfvOqCiapb2iA
 HskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686204166; x=1688796166;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAunNoGN/E1C+FW1ht0zgjXYFEivPbwMTD6bGLRmpC8=;
 b=Xb6DYYU+l+eaI0oJYckUqAA2DHSQAC85HRpD6lD0OY55pazxRd1ILrQZ0nMHp8CfF9
 I980GRq77mlgo5pvEAnKchfp5l1+9Y4OKu7MFm/WHvNj2Qu+b4CnZwQEWqYwM0c34hy0
 OoGZSvYuORHjNa1/vDHiSTwZrOwN2mSNtkazAB4XJVBw1Evi/GeppfRf4PrW4OnOOHXh
 OQ5zZ3HcKUX9JXmuQr9Wc01vbm+5RmQV4NahvIZZ/hBKTL2zI+lEeT6ZU2RH5G7L7jgD
 wnGR/GsYwCCeVaqkcXQi8bP7i/a10AbryE1DHq586cr2GCNbBZxQGw4GDJ2G+/+D7tvP
 0psw==
X-Gm-Message-State: AC+VfDx7DAJi6+Uh/cO2R65eNm4zOGRyLieqKq/btSfEu7Dn2lSkxnzd
 BJVDlvCrhR2cQIzS8IhKrhSACQ==
X-Google-Smtp-Source: ACHHUZ72LfEe7QYnRbhBg0TMl3zYtm9v4PiHiT+FCGP1VPZQVlVa1w7vL7oRaqd53wkLRu+V6XIYFw==
X-Received: by 2002:a7b:ca58:0:b0:3f7:e660:cdc5 with SMTP id
 m24-20020a7bca58000000b003f7e660cdc5mr367281wml.9.1686204166326; 
 Wed, 07 Jun 2023 23:02:46 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b003f7f475c3c7sm830898wmi.8.2023.06.07.23.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 23:02:45 -0700 (PDT)
Date: Thu, 8 Jun 2023 08:02:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 13/16] target/riscv/kvm.c: add multi-letter extension KVM
 properties
Message-ID: <20230608-8a2abef07a078c1eae49cfcd@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-14-dbarboza@ventanamicro.com>
 <20230607-9a499522ac7de9ebcf0c8699@orel>
 <fb74c3a0-9762-92c2-4a1c-9544af822c5a@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb74c3a0-9762-92c2-4a1c-9544af822c5a@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jun 07, 2023 at 04:59:02PM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 6/7/23 08:48, Andrew Jones wrote:
> > On Tue, May 30, 2023 at 04:46:20PM -0300, Daniel Henrique Barboza wrote:
> > > Let's add KVM user properties for the multi-letter extensions that KVM
> > > currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
> > > svinval and svpbmt.
> > > 
> > > As with the recently added MISA properties we're also going to add a
> > > 'user_set' flag in each of them. The flag will be set only if the user
> > > chose an option that's different from the host and will require extra
> > > handling from the KVM driver.
> > > 
> > > However, multi-letter CPUs have more cases to cover than MISA
> > > extensions, so we're adding an extra 'supported' flag as well. This flag
> > > will reflect if a given extension is supported by KVM, i.e. KVM knows
> > > how to handle it. This is determined during KVM extension discovery in
> > > kvm_riscv_init_multiext_cfg(), where we test for EINVAL errors. Any
> > > other error different from EINVAL will cause an abort.
> > 
> > I wish that was ENOENT, but I suppose that ship sailed.
> > 
> > > 
> > > The 'supported' flag will then be used later on to give an exception for
> > > users that are disabling multi-letter extensions that are unknown to
> > > KVM.
> > > 
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/kvm.c | 136 +++++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 136 insertions(+)
> > > 
> > > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> > > index bb1dafe263..b4193a10d8 100644
> > > --- a/target/riscv/kvm.c
> > > +++ b/target/riscv/kvm.c
> > > @@ -202,6 +202,99 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
> > >       }
> > >   }
> > > +typedef struct RISCVCPUMultiExtConfig {
> > > +    const char *name;
> > 
> > No description? I'd prefer we use the same cfg struct for single-letter
> > and multi-letter extensions. We can use a union to overlap cpu_cfg_offset
> > and misa_bit.
> 
> multi-letter extensions don't have a 'description' field in TCG. Nothing
> prevents us from adding for KVM though.

KVM can wait for descriptions until after adding them to TCG, and then,
hopefully, figuring out how to share them with KVM.

Thanks,
drew

