Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C38C61DF4
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 09:57:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6SwO-0004jq-Bc; Fri, 24 Nov 2023 04:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SwN-0004jS-C0
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:57:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SwK-0007pk-R5
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:57:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32fdc5be26dso985874f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 01:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700819855; x=1701424655; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3osIzJZSBpKy3lBnfxYgQqr1ZNv+lN8JcR/JxMjXmA8=;
 b=TeM3jDO1p74fQxBbNmqB0iX3jBW1fcw4TZgdQgMoqTmeBR8mXARFTgIXr6EuiY/BJY
 ThQog+oC1rENhc13NowYAWc7vOkEkElEa/eCIh/VyQKzzIWux73ZmjrRni2MwLPpL+Wq
 VJQvMHNwSKIqFxu+l1LCTNSrl+n22QoX7MtbEO3i6Qv3o5Y7MgqGn398rJmG4IBjYgUu
 8ZTSCq8O3IjEr6/SxU7KVtiOJnEJpbl8/RXomPKMnpPbuI3dIeSiqhvJK43K6xirx36V
 eDSrviuOazaKwLSlqWR57pDUJKKfZ8wlGGSZ7NZ8Lx70WR45TwoHTb3R+MrF47ukDK7n
 vzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700819855; x=1701424655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3osIzJZSBpKy3lBnfxYgQqr1ZNv+lN8JcR/JxMjXmA8=;
 b=vnDZ0hV1lbUJ6I19w8WFDFKbpICIg744BgGAEaV9KNS1vLl5GlTe4Y+l2MzaDLr1Dn
 dGK71wvcTDx0oAca+Tflnv216X5ODFCvnhFZATUWz6kS7//KQ5ixFErvlwRcI2pgTAnp
 OaXU2FVp5kiBvSWjSEhsnvKOyX+bv/CnYncOiyPJ+uWsegvYzVjMDbEax7lRHdDd4KcY
 mBKAcNAUtewo9ouA4BqyPjMoZjpsz4XGoB+IlbYldrnBl6puNcMISknF9094dGZMQLWc
 us7YXRsq/+j9jyem0rE8Jcf7381uc9zSQU36JzTaEmlo6e84zw+E7CGizKq4AFSfUqqh
 ZRZw==
X-Gm-Message-State: AOJu0YwupLXYk94CuMk1BfFuNi1RKjw84mccQDBdiMHX3x+PtHjgESQL
 USFE8lllq44nOojoBCK5GN4Iug==
X-Google-Smtp-Source: AGHT+IEPU/F3nlN1phdEAyvlj+5jFhqdF4JUFeMRppfOxgY/02zKt4Icd6PcBVarYkXqVgNYxquCeg==
X-Received: by 2002:adf:eec6:0:b0:332:cc85:70ce with SMTP id
 a6-20020adfeec6000000b00332cc8570cemr1650151wrp.33.1700819854955; 
 Fri, 24 Nov 2023 01:57:34 -0800 (PST)
Received: from localhost (cst-prg-91-180.cust.vodafone.cz. [46.135.91.180])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfa4c4000000b0032d8eecf901sm3922481wrb.3.2023.11.24.01.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 01:57:34 -0800 (PST)
Date: Fri, 24 Nov 2023 10:57:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 2/7] target/riscv: add priv ver restriction to
 profiles
Message-ID: <20231124-9f593580898dcebbdb590bff@orel>
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
 <20231123191532.1101644-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123191532.1101644-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x434.google.com
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

On Thu, Nov 23, 2023 at 04:15:27PM -0300, Daniel Henrique Barboza wrote:
> Some profiles, like RVA22S64, has a priv_spec requirement.
> 
> Make this requirement explicit for all profiles. We'll validate this
> requirement finalize() time and, in case the user chooses an
> incompatible priv_spec while activating a profile, a warning will be
> shown.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         |  1 +
>  target/riscv/cpu.h         |  2 ++
>  target/riscv/tcg/tcg-cpu.c | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 59b131c1fc..29a9f77702 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1537,6 +1537,7 @@ Property riscv_cpu_options[] = {
>  static RISCVCPUProfile RVA22U64 = {
>      .name = "rva22u64",
>      .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
> +    .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
>      .ext_offsets = {
>          CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
>          CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5ff629650d..1f34eda1e4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -81,10 +81,12 @@ typedef struct riscv_cpu_profile {
>      uint32_t misa_ext;
>      bool enabled;
>      bool user_set;
> +    int priv_spec;
>      const int32_t ext_offsets[];
>  } RISCVCPUProfile;
>  
>  #define RISCV_PROFILE_EXT_LIST_END -1
> +#define RISCV_PROFILE_ATTR_UNUSED -1
>  
>  extern RISCVCPUProfile *riscv_profiles[];
>  
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index ddf37b25f3..a26cc6f093 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -74,6 +74,20 @@ static void riscv_cpu_write_misa_bit(RISCVCPU *cpu, uint32_t bit,
>      }
>  }
>  
> +static const char *cpu_priv_ver_to_str(int priv_ver)
> +{
> +    switch (priv_ver) {
> +    case PRIV_VERSION_1_10_0:
> +        return "v1.10.0";
> +    case PRIV_VERSION_1_11_0:
> +        return "v1.11.0";
> +    case PRIV_VERSION_1_12_0:
> +        return "v1.12.0";
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
>  static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>                                            const TranslationBlock *tb)
>  {
> @@ -764,11 +778,23 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>  static void riscv_cpu_validate_profile(RISCVCPU *cpu,
>                                         RISCVCPUProfile *profile)
>  {
> +    CPURISCVState *env = &cpu->env;
>      const char *warn_msg = "Profile %s mandates disabled extension %s";
>      bool send_warn = profile->user_set && profile->enabled;
>      bool profile_impl = true;
>      int i;
>  
> +    if (profile->priv_spec != env->priv_ver) {

Shouldn't this be something like

 if (profile->priv_spec != RISCV_PROFILE_ATTR_UNUSED &&
     profile->priv_spec != env->priv_ver)

> +        profile_impl = false;
> +
> +        if (send_warn) {
> +            warn_report("Profile %s requires priv spec %s, "
> +                        "but priv ver %s was set", profile->name,
> +                        cpu_priv_ver_to_str(profile->priv_spec),
> +                        cpu_priv_ver_to_str(env->priv_ver));
> +        }
> +    }
> +
>      for (i = 0; misa_bits[i] != 0; i++) {
>          uint32_t bit = misa_bits[i];
>  
> @@ -1057,6 +1083,10 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
>      profile->user_set = true;
>      profile->enabled = value;
>  
> +    if (profile->enabled) {
> +        cpu->env.priv_ver = profile->priv_spec;
> +    }
> +
>      for (i = 0; misa_bits[i] != 0; i++) {
>          uint32_t bit = misa_bits[i];
>  
> -- 
> 2.41.0
>

Thanks,
drew

