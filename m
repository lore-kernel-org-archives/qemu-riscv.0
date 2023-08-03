Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A4EC001DF
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 12:06:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRX5a-0003G1-NM; Thu, 03 Aug 2023 08:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qRX5X-0003FQ-R5
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 08:05:57 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qRX5T-0005DV-FS
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 08:05:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-986d8332f50so121342266b.0
 for <qemu-riscv@nongnu.org>; Thu, 03 Aug 2023 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691064349; x=1691669149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YwIlha3HCMy7iomm1OfAZlRHQZbr0jGdo3/nVrhg/qs=;
 b=jwbCkAypA+P1efmNzKFHXft3fA+CIYpDTgmaQS6Xeu0QN/yOZbkofhi8v9NSkX8uCp
 yRJha4rxII9X5QhWnuyIvAZmaRju4xrNoROXD8caEJQVscIefxcIR7kQ5c3p1H16SZEI
 bfaI3hKssepJ838wHQFvPwZPXy+k3P5xCe+IUHrLsVX/YxTu+RHPuKkWJe4WtrtCtuzN
 2OsoBhOE4U2nQ5VaGht5W0g/3RhqT0pgWLR2oedZsSZzfnweMMrA9s9AI2UX/BXQfBhQ
 kM0G67Vik0oRLAZ32GfiiUGZaPvAjERR5te6oBJgoCAkVE1xPhgThaNjYQjFGB6Jytqe
 xS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691064349; x=1691669149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwIlha3HCMy7iomm1OfAZlRHQZbr0jGdo3/nVrhg/qs=;
 b=HXC/9eIkULe4fZlv+faaSpdZKSessZQyXqZUXn9SpvXQ56HMN8eiD5it4OMGNxlIUj
 b/EwrDQlr6oeGu3lDjy99YmugO4omsnyYIpjtqSrBL5o+A1tw/Gb2iLZ71UcKQsDIiJI
 VSwhte4rMrRDe5478HCJi9aZUhbzbXNsKyiE80i5UJNK/Ar4kNDj4QlfQOeBTG/fLw5d
 gxopHul5qY1yjO/GNwlyzS6a4lz/w2HpStHfSvZp2FQJhe4tENSEMB2LTmgUJvBB1hsm
 xqced854J/RsZzRLjV1XvsCh+VAk2NRRQDzU6m2RGbTHFjDe5N2Y+vGBn0uH7BwYmfU8
 C9TQ==
X-Gm-Message-State: ABy/qLa3yi9egGV/vDPaJpLPVqIdWbKuwd08YwM9baWGiHrYA6KC6BMY
 hprTysQovSgaSzWsxS1uTK2aRQ==
X-Google-Smtp-Source: APBJJlHQK79reWSArhmRR/cmJuLzY/ynsrPCMBI/PGqA7KozNzdsX6glNxkfj2N5Vauqe2FPNq0IgA==
X-Received: by 2002:a17:907:7743:b0:99b:65fa:e309 with SMTP id
 kx3-20020a170907774300b0099b65fae309mr6844475ejc.74.1691064348209; 
 Thu, 03 Aug 2023 05:05:48 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a1709065ad400b00988be3c1d87sm10420363ejs.116.2023.08.03.05.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:47 -0700 (PDT)
Date: Thu, 3 Aug 2023 15:05:46 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH] target/riscv/kvm.c: fix mvendorid size in
 vcpu_set_machine_ids()
Message-ID: <20230803-70bedcfb60cb5b2efb87cedc@orel>
References: <20230802180058.281385-1-dbarboza@ventanamicro.com>
 <20230803-3d2b378004c77196efc74f09@orel>
 <d9659727-2ba4-370c-32ac-9f5ade5bea60@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9659727-2ba4-370c-32ac-9f5ade5bea60@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x629.google.com
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

On Thu, Aug 03, 2023 at 08:36:57AM -0300, Daniel Henrique Barboza wrote:
> 
> 
> On 8/3/23 06:29, Andrew Jones wrote:
> > On Wed, Aug 02, 2023 at 03:00:58PM -0300, Daniel Henrique Barboza wrote:
> > > cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always write
> > > a target_ulong val, i.e. a 64 bit field in a 64 bit host.
> > > 
> > > Given that we're passing a pointer to the mvendorid field, the reg is
> > > reading 64 bits starting from mvendorid and going 32 bits in the next
> > > field, marchid. Here's an example:
> > > 
> > > $ ./qemu-system-riscv64 -machine virt,accel=kvm -m 2G -smp 1 \
> > >     -cpu rv64,marchid=0xab,mvendorid=0xcd,mimpid=0xef(...)
> > > 
> > > (inside the guest)
> > >   # cat /proc/cpuinfo
> > > processor	: 0
> > > hart		: 0
> > > isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> > > mmu		: sv57
> > > mvendorid	: 0xab000000cd
> > > marchid		: 0xab
> > > mimpid		: 0xef
> > > 
> > > 'mvendorid' was written as a combination of 0xab (the value from the
> > > adjacent field, marchid) and its intended value 0xcd.
> > > 
> > > Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' and
> > > use it as input for kvm_set_one_reg(). Here's the result with this patch
> > > applied and using the same QEMU command line:
> > > 
> > >   # cat /proc/cpuinfo
> > > processor	: 0
> > > hart		: 0
> > > isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> > > mmu		: sv57
> > > mvendorid	: 0xcd
> > > marchid		: 0xab
> > > mimpid		: 0xef
> > > 
> > > This bug affects only the generic (rv64) CPUs when running with KVM in a
> > > 64 bit env since the 'host' CPU does not allow the machine IDs to be
> > > changed via command line.
> > > 
> > > Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs")
> > > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > ---
> > >   target/riscv/kvm.c | 9 ++++++++-
> > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> > > index 9d8a8982f9..b1fd2233c0 100644
> > > --- a/target/riscv/kvm.c
> > > +++ b/target/riscv/kvm.c
> > > @@ -852,12 +852,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
> > >   static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
> > >   {
> > >       CPURISCVState *env = &cpu->env;
> > > +    target_ulong reg;
> > 
> > We can use the type of cfg since KVM just gets an address and uses the
> > KVM register type to determine the size. So here,
> > 
> >   uint32_t reg = cpu->cfg.mvendorid;
> > 
> > and then...
> > 
> > >       uint64_t id;
> > >       int ret;
> > >       id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> > >                             KVM_REG_RISCV_CONFIG_REG(mvendorid));
> > > -    ret = kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
> > > +    /*
> > > +     * cfg.mvendorid is an uint32 but a target_ulong will
> > > +     * be written. Assign it to a target_ulong var to avoid
> > > +     * writing pieces of other cpu->cfg fields in the reg.
> > > +     */
> > 
> > ...we don't need this comment since we're not doing anything special.
> 
> I tried it out and it doesn't seem to work. Here's the result:
> 
> / # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> mmu		: sv57
> mvendorid	: 0xaaaaaa000000cd
> marchid		: 0xab
> mimpid		: 0xef
> 
> 
> The issue here is that the kernel considers 'mvendorid' as an unsigned long (or
> what QEMU calls target_ulong). kvm_set_one_reg() will write an unsigned long
> regardless of the uint32_t typing of 'reg', meaning that it'll end up writing
> 32 bits of uninitialized stuff from the stack.

Indeed, I managed to reverse the problem in my head. We need to to worry
about KVM's notion of the type, not QEMU's. I feel like we still need some
sort of helper, but one that takes the type of the KVM register into
account. KVM_REG_RISCV_CONFIG registers are KVM ulongs, which may be
different than QEMU's ulongs, if we ever supported 32-bit userspace on
64-bit kernels. Also, not all KVM register types are ulong, some are
explicitly u32s and others u64s. I see kvm_riscv_reg_id() is used to try
and get the right KVM reg size set, but it's broken for RISCV_FP_F_REG(),
since those are all u32s, even when KVM has 64-bit ulong (I guess nobody
is testing get/set-one-reg with F registers using that helper, otherwise
we'd be getting EINVAL from KVM). And KVM_REG_RISCV_FP_D_REG(fcsr) is also
broken and RISCV_TIMER_REG() looks broken with 32-bit KVM, since it should
always be u64. I guess all that stuff needs an audit.

So, I think we need a helper that has a switch on the KVM register type
and provides the right sized buffer for each case.

Thanks,
drew


> 
> target_ulong seems that the right choice here. We could perhaps work with
> uint64_t (other parts of the code does that) but target_ulong is nicer with
> 32-bit setups.
> 
> 
> Thanks,
> 
> Daniel
> 
> > 
> > > +    reg = cpu->cfg.mvendorid;
> > > +    ret = kvm_set_one_reg(cs, id, &reg);
> > >       if (ret != 0) {
> > >           return ret;
> > >       }
> > > -- 
> > > 2.41.0
> > > 
> > 
> > We should audit and fix all uses of &cpu->cfg.* with KVM ioctls. We can
> > also consider introducing wrappers like
> > 
> > #define kvm_set_one_reg_safe(cs, id, addr)	\
> > ({						\
> > 	typeof(*(addr)) _addr = *(addr);	\
> > 	kvm_set_one_reg(cs, id, &_addr)		\
> > })
> > 
> > Thanks,
> > drew

