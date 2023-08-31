Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FAEC83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 11:50:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbgC5-00036Y-Oo; Thu, 31 Aug 2023 07:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgC1-00035g-4S
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:50:34 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgBy-0002v4-Jw
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:50:32 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bf1f632b8so84437666b.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693482629; x=1694087429; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R0ZSPT38lcKyBgQxMocHEa9KjAktQ/oRGWcGJedvdUQ=;
 b=c/tF3XqBmLlECJ8+0/n/mQMudnGldpxcBmGi+ese7OSgcjvcrY1uIoNLo+9gEBoDOx
 YXt2Y+ZxOOPCyu2IGXRrvN/AU45/nBGshLXLShotKoIyYhgPPnzc37XdiogvNaMmxwCG
 pov8NuVo7OmbgSuVbvwu+6B0hz9N/4yFhraS1eB+/fbTn601dLVg2EmZXX6juOyMGNs/
 gQ2Msoa7zs+xAuQN2IViZOniNw09QFEAQANp1S8U6waDlT+ZjitmXs6aVNp3v2j1cMWq
 y0HqYCP9uHPFm2NagrxASZ9qBNHvbNRVOZm82eNOLqxkkTkP6PBeb3UHqEBelDB225wn
 ytpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693482629; x=1694087429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0ZSPT38lcKyBgQxMocHEa9KjAktQ/oRGWcGJedvdUQ=;
 b=auZKaH9XMMtu5bNdcWuP71xLy7HQza5N/mNUPIoBWSR6JeTHPxRk25g+Qcalr9M1UF
 rIA1sAvXsXuhZT89SufE7Qzqjd8cQzn9JeHdMO2FvJIHqh1J+hGIIBGCAp6Nr/9Y8G4A
 F2292q3k28hxYQoQHwpkSTxzN8R313zuZilnEhijIq+FZNSloRwWJsE4GVGLG3h77Qdn
 5MrjWCK3rQXUuJP4yq2mOe4Jh8vcLpAb4XaC+xAxRXn7FGEVcjuaRRW7gquCw7N4NebU
 /1MEU2wVNJodzzxYDbvvrHLpHnS1x1DsaLbTrcd2o/SmdCHTNncXkTE50I1tXQsKvCpE
 yWsw==
X-Gm-Message-State: AOJu0YxUl/emBODtyO4cqNNXND0PhrPWnQ13TyYVKIkntIXvzOhxwj4V
 COLKydj3A6dx3Ajc9V4Yx8WwoQ==
X-Google-Smtp-Source: AGHT+IHvOr7MwIik5LGZijJnl6yaGNpxqDfvSn3Apvs8/Mjg3E/7V2kl37qG06a+9AKzepnFUUdKzg==
X-Received: by 2002:a17:907:a07c:b0:9a5:846d:d829 with SMTP id
 ia28-20020a170907a07c00b009a5846dd829mr3931506ejc.18.1693482629003; 
 Thu, 31 Aug 2023 04:50:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 jw26-20020a17090776ba00b00982a92a849asm679359ejc.91.2023.08.31.04.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:50:28 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:50:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 14/20] target/riscv/kvm: do not use
 riscv_cpu_add_misa_properties()
Message-ID: <20230831-f967ffa982698458cdb384f1@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-15-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-15-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Aug 25, 2023 at 10:08:47AM -0300, Daniel Henrique Barboza wrote:
> riscv_cpu_add_misa_properties() is being used to fill the missing KVM
> MISA properties but it is a TCG helper that was adapted to do so. We'll
> move it to tcg-cpu.c in the next patches, meaning that KVM needs to fill
> the remaining MISA properties on its own.
> 
> Do not use riscv_cpu_add_misa_properties(). Let's create a new array
> with all available MISA bits we support that can be read by KVM. Then,
> inside kvm_riscv_add_cpu_user_properties(), we'll create all KVM MISA
> properties as usual and then use this array to add any missing MISA
> properties with the riscv_cpu_add_kvm_unavail_prop() helper.
> 
> Note that we're creating misa_bits[], and not using the existing
> 'riscv_single_letter_exts[]', because the latter is tuned for riscv,isa
> related functions and it doesn't have all MISA bits we support. Commit
> 0e2c377023 ("target/riscv: misa to ISA string conversion fix") has the
> full context.
> 
> While we're at it, move both satp and the multi-letter extension
> properties to kvm_riscv_add_cpu_user_properties() as well.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         |  2 ++
>  target/riscv/cpu.h         |  3 ++-
>  target/riscv/kvm/kvm-cpu.c | 17 +++++++++++------
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index bf6c8519b1..f9aea6a80a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -38,6 +38,8 @@
>  
>  /* RISC-V CPU definitions */
>  static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
> +const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
> +                              RVC, RVS, RVU, RVH, RVJ, RVG};
>  
>  struct isa_ext_data {
>      const char *name;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 950c2301f2..9ec3b98bd2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -43,7 +43,7 @@
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>  
>  /*
> - * Consider updating misa_ext_info_arr[] and misa_ext_cfgs[]
> + * Update misa_bits[], misa_ext_info_arr[] and misa_ext_cfgs[]
>   * when adding new MISA bits here.
>   */
>  #define RVI RV('I')
> @@ -60,6 +60,7 @@
>  #define RVJ RV('J')
>  #define RVG RV('G')
>  
> +extern const uint32_t misa_bits[13];
                                   ^ maintaining this will be a PITA

I suggest misa_bits either have a terminating zero (zero is an invalid bit
number) or that a const nr_misa_bits is also exported from riscv/cpu.c
which be set to ARRAY_SIZE(misa_bits) and would be used for the loop
condition.

>  const char *riscv_get_misa_ext_name(uint32_t bit);
>  const char *riscv_get_misa_ext_description(uint32_t bit);
>  
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 85e8b0a927..501384924b 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -387,6 +387,8 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
>  
> +    riscv_add_satp_mode_properties(cpu_obj);
> +
>      for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
>          KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
>          int bit = misa_cfg->offset;
> @@ -402,6 +404,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>                                          misa_cfg->description);
>      }
>  
> +    for (i = 0; i < ARRAY_SIZE(misa_bits); i++) {
> +        const char *ext_name = riscv_get_misa_ext_name(misa_bits[i]);
> +        riscv_cpu_add_kvm_unavail_prop(cpu_obj, ext_name);
> +    }
> +
>      for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
>          KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
>  
> @@ -418,6 +425,10 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>      object_property_add(cpu_obj, "cboz_blocksize", "uint16",
>                          NULL, kvm_cpu_set_cbomz_blksize,
>                          NULL, &kvm_cboz_blocksize);
> +
> +    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
> +    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
>  }
>  
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> @@ -1301,12 +1312,6 @@ static void kvm_cpu_instance_init(CPUState *cs)
>  
>      if (rcc->user_extension_properties) {
>          kvm_riscv_add_cpu_user_properties(obj);
> -        riscv_add_satp_mode_properties(obj);
> -        riscv_cpu_add_misa_properties(obj);
> -
> -        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> -        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> -        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
>      }
>  
>      for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
> -- 
> 2.41.0
> 
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

