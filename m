Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF99C00528
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 09:30:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRUeN-0005XC-OO; Thu, 03 Aug 2023 05:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qRUeM-0005Wm-4n
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 05:29:42 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qRUeK-0005FP-Du
 for qemu-riscv@nongnu.org; Thu, 03 Aug 2023 05:29:41 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52229f084beso905491a12.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Aug 2023 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691054978; x=1691659778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rlrE5XJ09/9REigZYxsyn6zKBhJpaEz0mtorTQki3T0=;
 b=lV9N+gPdPUUhV3xLFoY+haHJSKqCDbLhTLMI9BFgN1+uDR8ySZ8zG0niLKqjcqsLM5
 mnHwVm7+aSUJYIOnKTNEIaKXcUxrzLoK2DK9Ht/anVAFzbdnmDbwNs6p8qpg4mS0J4gu
 m06f7prUv6MNFh4hLMTScilX2ZtVjWIhbxd2jI/5tFhy322SV+MIdNb/Vn8awB3p4jSS
 9sduhcOqYPIXBPao+dFKilGX0zJseP+5PVWwODuW0YPZ2LoRufqhROrVZNmrE09jECHu
 KHQR+C5CSh0lKe9c5yDzizwBAX/zcmNtbF9Lj+Q/ZlR4OSWJdficev9x6yKgJAUriv3B
 vdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691054978; x=1691659778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rlrE5XJ09/9REigZYxsyn6zKBhJpaEz0mtorTQki3T0=;
 b=Ss7L6t1+7/Q1usrn91nha3Ltu9NznC/g/ngctHiBhfc8fsvZTrovnG8rXO2UG5PK01
 5gN6HPPxLJ0PqOCxgYrsdWlMiuDrd+tSGntNwg57T87BebbMsf6YN7XLV31/6PCvyX27
 BBQtMBfd1F1RobEOD1GHHeNLPinOzl8JV5JLjufcJVlwKLBhnJ8rmljfgEkUD25YXmQz
 dPTQN2nB1m1d57QX4bKLEL4tVusLGbLqxnFi6lTWppYbo9/x3qI80YIBdaecUOerRukz
 bJrZpo+BcOfYMLmSrHJ+mvA9cn+CyiHd9CrhjKQDPhZJzsRMYj51KaahjwEirrCB+Gii
 Myhw==
X-Gm-Message-State: ABy/qLa8j0wtSK565VFTCsosnm5tINLLttWb0mXNrtpQ0+7JKZs2Oe6c
 n7KcUt3eftrpdBJpSqcVYZbw7A==
X-Google-Smtp-Source: APBJJlEDJE2zyoxWF7faMxf2DP8aTobs0O0bRZdmJE3qAkYiEAds2ny5iLYkvkd9GJvMsuOXLXP3dw==
X-Received: by 2002:a17:906:9bdb:b0:982:79fa:4532 with SMTP id
 de27-20020a1709069bdb00b0098279fa4532mr7432730ejc.53.1691054978408; 
 Thu, 03 Aug 2023 02:29:38 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a170906085900b00991d54db2acsm10212251ejd.44.2023.08.03.02.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 02:29:38 -0700 (PDT)
Date: Thu, 3 Aug 2023 12:29:34 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH] target/riscv/kvm.c: fix mvendorid size in
 vcpu_set_machine_ids()
Message-ID: <20230803-3d2b378004c77196efc74f09@orel>
References: <20230802180058.281385-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802180058.281385-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x534.google.com
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

On Wed, Aug 02, 2023 at 03:00:58PM -0300, Daniel Henrique Barboza wrote:
> cpu->cfg.mvendorid is a 32 bit field and kvm_set_one_reg() always write
> a target_ulong val, i.e. a 64 bit field in a 64 bit host.
> 
> Given that we're passing a pointer to the mvendorid field, the reg is
> reading 64 bits starting from mvendorid and going 32 bits in the next
> field, marchid. Here's an example:
> 
> $ ./qemu-system-riscv64 -machine virt,accel=kvm -m 2G -smp 1 \
>    -cpu rv64,marchid=0xab,mvendorid=0xcd,mimpid=0xef(...)
> 
> (inside the guest)
>  # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> mmu		: sv57
> mvendorid	: 0xab000000cd
> marchid		: 0xab
> mimpid		: 0xef
> 
> 'mvendorid' was written as a combination of 0xab (the value from the
> adjacent field, marchid) and its intended value 0xcd.
> 
> Fix it by assigning cpu->cfg.mvendorid to a target_ulong var 'reg' and
> use it as input for kvm_set_one_reg(). Here's the result with this patch
> applied and using the same QEMU command line:
> 
>  # cat /proc/cpuinfo
> processor	: 0
> hart		: 0
> isa		: rv64imafdc_zicbom_zicboz_zihintpause_zbb_sstc
> mmu		: sv57
> mvendorid	: 0xcd
> marchid		: 0xab
> mimpid		: 0xef
> 
> This bug affects only the generic (rv64) CPUs when running with KVM in a
> 64 bit env since the 'host' CPU does not allow the machine IDs to be
> changed via command line.
> 
> Fixes: 1fb5a622f7 ("target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 9d8a8982f9..b1fd2233c0 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -852,12 +852,19 @@ void kvm_arch_init_irq_routing(KVMState *s)
>  static int kvm_vcpu_set_machine_ids(RISCVCPU *cpu, CPUState *cs)
>  {
>      CPURISCVState *env = &cpu->env;
> +    target_ulong reg;

We can use the type of cfg since KVM just gets an address and uses the
KVM register type to determine the size. So here,

 uint32_t reg = cpu->cfg.mvendorid;

and then...

>      uint64_t id;
>      int ret;
>  
>      id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
>                            KVM_REG_RISCV_CONFIG_REG(mvendorid));
> -    ret = kvm_set_one_reg(cs, id, &cpu->cfg.mvendorid);
> +    /*
> +     * cfg.mvendorid is an uint32 but a target_ulong will
> +     * be written. Assign it to a target_ulong var to avoid
> +     * writing pieces of other cpu->cfg fields in the reg.
> +     */

...we don't need this comment since we're not doing anything special.

> +    reg = cpu->cfg.mvendorid;
> +    ret = kvm_set_one_reg(cs, id, &reg);
>      if (ret != 0) {
>          return ret;
>      }
> -- 
> 2.41.0
>

We should audit and fix all uses of &cpu->cfg.* with KVM ioctls. We can
also consider introducing wrappers like

#define kvm_set_one_reg_safe(cs, id, addr)	\
({						\
	typeof(*(addr)) _addr = *(addr);	\
	kvm_set_one_reg(cs, id, &_addr)		\
})

Thanks,
drew

