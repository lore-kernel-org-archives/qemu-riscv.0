Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF629C25B6B
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 12:22:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvzMf-0000yU-M8; Thu, 26 Oct 2023 08:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvzMe-0000y0-Ra
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:21:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvzMc-0001GV-PI
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 08:21:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso4821415e9.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 05:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698322884; x=1698927684; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nt9cRa6mZEBdxPhPeS9tae888mmzHth63BpxLdJFus8=;
 b=WrYqFJous+xRziwSGR8xSJZFIcnMQikCtLjAdAFoxAZ1+01RFBNgCnnIrFDrpomY0A
 6jMFTNxtSIiuw9+WvhWB/ibVt7vFnhx+iGcCFNnmlJd5zLsdByCS+2VpbCFThCDtRcEs
 JYVacfc634OSsGfbic760u+VICaWo8iANR8cTcj5HCM1D5ACeJV2PMSNWAbM64uq2qWg
 55dd3GsYsvPI/Z3bpj0spYft5G2UjPhHtZYUE28D0CwOmAchguQzfu5m4bnH+l4o2j7o
 c7UIMVG+qh015YAZ7yzbac7MB1lWFeddtB2BEFvhdUec/lPklxAymHwij7QliCrdT3ZJ
 3NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698322884; x=1698927684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nt9cRa6mZEBdxPhPeS9tae888mmzHth63BpxLdJFus8=;
 b=D+E5Vixiy6bPn2ko92vY71MefhEH2JETMbJ/bCBTxwSt0xiQUXQveFjwaZpQht980k
 e1z9qbs7o8W5IVQkh6c64uQtz1gcxdGb1rQObHx8uUPJLkuZDINZB0MBXxPQajtWz4uP
 DMvnAxXCOXlS82u9OdZdXNENtmP4fszVV9vp1QauILqGIr439bFOkQ8ji4OeGFJlTlJT
 uWAwIdIDZI+h0Ry49gtRBwBk/QiIq2dH/BK9cm7NmN18dDoD6ncfAIMQjJgGCwlTTa9d
 cftIiJl0rObkLVHtm890B6POD7LgmjlRdo0gpvb2S7dm1NxXT+x1bITzpRXED1CJ4JK7
 zMKA==
X-Gm-Message-State: AOJu0YyH2WHpFeTAYQPb66kaGbEEOq547kmKzvzCuk7L9gJwfoX0VZTT
 B52CGxalFj7LkdXDRwI1Qts4Sg==
X-Google-Smtp-Source: AGHT+IFPc+2TUEPvV5nGEHS9b19MdfxG9PQCdK+M74e3dQnFbyJE1K8T30csjM2rugO/l7Z0iL7Log==
X-Received: by 2002:a05:600c:1caa:b0:401:b425:2414 with SMTP id
 k42-20020a05600c1caa00b00401b4252414mr2830785wms.18.1698322883741; 
 Thu, 26 Oct 2023 05:21:23 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b0040531f5c51asm2485757wms.5.2023.10.26.05.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 05:21:23 -0700 (PDT)
Date: Thu, 26 Oct 2023 14:21:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v5 02/10] target/riscv: add rva22u64 profile definition
Message-ID: <20231026-33d4ebbffd9420cab631f71b@orel>
References: <20231025234459.581697-1-dbarboza@ventanamicro.com>
 <20231025234459.581697-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025234459.581697-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32d.google.com
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

On Wed, Oct 25, 2023 at 08:44:51PM -0300, Daniel Henrique Barboza wrote:
> The rva22U64 profile, described in:
> 
> https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#rva22-profiles
> 
> Contains a set of CPU extensions aimed for 64-bit userspace
> applications. Enabling this set to be enabled via a single user flag
> makes it convenient to enable a predictable set of features for the CPU,
> giving users more predicability when running/testing their workloads.
> 
> QEMU implements all possible extensions of this profile. The exception
> is Zicbop (Cache-Block Prefetch Operations) that is not available since
> QEMU RISC-V does not implement a cache model.

I think we should add zicbop now. Its instructions won't cause illegal
instruction traps according to commit 59cb29d6a514 ("target/riscv: add
Zicbop cbo.prefetch{i, r, m} placeholder") and the instructions are
just hints anyway, so there's no need for QEMU to implement anything.
So, let's add the CPU property and its corresponding blocksize property,
and when zicbop is enabled add it to the ISA string and when its blocksize
isn't 64 bytes, disable zic64b.

> For this same reason all
> the so called 'synthetic extensions' described in the profile that are
> cache related are ignored (Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa,
> Zicclsm).

I won't ack/nack the exclusion of these, since I don't know enough about
what they mean nor how TCG is or is not able to comply with what they
mean. So I'll take your word for it that, at most, we'd need to add them
to an ISA string to fully "support" them. OIOW, the current profile's only
"fault" regarding these "extensions" is it isn't describing them in some
way and fixing that wouldn't require any changes beyond extending the ISA
string.

> 
> An abstraction called RISCVCPUProfile is created to store the profile.
> 'ext_offsets' contains mandatory extensions that QEMU supports. Same
> thing with the 'misa_ext' mask. Optional extensions must be enabled
> manually in the command line if desired.
> 
> The design here is to use the common target/riscv/cpu.c file to store
> the profile declaration and export it to the accelerator files. Each
> accelerator is then responsible to expose it (or not) to users and how
> to enable the extensions.
> 
> Next patches will implement the profile for TCG and KVM.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 31 +++++++++++++++++++++++++++++++
>  target/riscv/cpu.h | 12 ++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5095f093ba..d6ba0dff34 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1437,6 +1437,37 @@ Property riscv_cpu_options[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +/*
> + * RVA22U64 defines some  'named features' or 'synthetic extensions'
                           ^ extra space

> + * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
> + * and Zicclsm. We do not implement caching in QEMU so we'll consider
> + * all these named features as always enabled.
> + *
> + * There's no riscv,isa update for them (and for zic64b) at this

(nor for zic64b, despite it having a cfg offset)

> + * moment.
> + */
> +static RISCVCPUProfile RVA22U64 = {
> +    .name = "rva22u64",
> +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC,
> +    .ext_offsets = {
> +        CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> +        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
> +        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
> +        CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
> +        CPU_CFG_OFFSET(ext_zicboz),
> +
> +        /* mandatory named features for this profile */
> +        CPU_CFG_OFFSET(zic64b),
> +
> +        RISCV_PROFILE_EXT_LIST_END
> +    }
> +};
> +
> +RISCVCPUProfile *riscv_profiles[] = {
> +    &RVA22U64, NULL,

I'd put the NULL on its own line, otherwise when we add the next profile
we'll need to modify the rva22u64 line too.

> +};
> +
>  static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>  
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ee9abe61d6..d3d82c5a7a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -68,6 +68,18 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
>  
>  #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>  
> +typedef struct riscv_cpu_profile {
> +    const char *name;
> +    uint32_t misa_ext;
> +    bool enabled;
> +    bool user_set;
> +    const int32_t ext_offsets[];
> +} RISCVCPUProfile;
> +
> +#define RISCV_PROFILE_EXT_LIST_END -1
> +
> +extern RISCVCPUProfile *riscv_profiles[];
> +
>  /* Privileged specification version */
>  enum {
>      PRIV_VERSION_1_10_0 = 0,
> -- 
> 2.41.0
>

Other than the nits and my wishy-washy-ness on the synthetic extensions,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

