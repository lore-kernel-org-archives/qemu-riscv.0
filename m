Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F33C61DF7
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 09:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6SrD-0002fx-Bn; Fri, 24 Nov 2023 04:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SrC-0002fe-Bx
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:52:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SrA-00071a-FB
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:52:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4083f613275so12501375e9.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 01:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700819535; x=1701424335; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WvamDTIz7DYe4jPHzcQMSDLWG9ek1N4NHXT7AneX+fQ=;
 b=bnnPQ6gX8oQZHXVd12yQimfwYJ94142tJL1ALunFFm3IcTt3ruGLnw6GD7ZeuVqiAy
 bGNaw4l3pQ5q6sLqrNC9CyZz+4idmWrkKgGgt3Ink2WLjwYwuh6Ms2UMv8Q3Ow0mXTeM
 clEOYSE6ieR9nb/BSzkoHVd25dzwQI7omtFJGKkjFzlgn4VEUBIq06v8BH8SG+VHNHSQ
 owZIi7cpslmpg6Q1QVyFqZ3puECgN1kpAvtuUpy27itCla3JxhwriFLwyAAgioQ+YtUr
 Piv8a1REG/lLinS337vNMYBWKDXBH3NdzZ3btXz/6bpzxzvlzsfwJoPu1WDjnyOPfaGe
 4E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700819535; x=1701424335;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvamDTIz7DYe4jPHzcQMSDLWG9ek1N4NHXT7AneX+fQ=;
 b=HeCAfI3AFEcAOdcKpEVRJ6uJcJEf4BAd4wu9AAV/cWHZM1rO7dRPW9a0jAULEes18i
 ypDf05LGVCmSZ1N1LgheEUddpF42mAKYRSzlSm8FPHY2MRG/e7VoTB1hFbD+mLrVyNgy
 2j+1E0hViEjtM2YyWvGszBm/7T9P3j2WyMVUwU93kRTQDTYWlVX9/B3hMPpcMIFZI5bk
 uUu5S70HfSiLyrkrFSBb0qHNBXKWmkhhv/GidPUvR4l8l+EFDBJL3YSCaFTuI95fo+c1
 0pFt7a6MVdagb4Bor67tmFXoJOF7CLqyZlbUAthatdFotA53VOLPZ+kNFpK0olKY+Aln
 YndQ==
X-Gm-Message-State: AOJu0YxraZDJfTcqTbli7rPnPG2BpIOC5j/vNLRn11iYp8WruXkOSGrx
 B0s4OUNblZChaPfd0IM14pmxMw==
X-Google-Smtp-Source: AGHT+IFqK113t+L5BWM9N6zYx6AKC8HR6mxOIzfyHFnIELmsl9koAs5EcceTdQxrnVkrgWwynhsNJw==
X-Received: by 2002:a5d:4b05:0:b0:332:e09a:644b with SMTP id
 v5-20020a5d4b05000000b00332e09a644bmr1654633wrq.68.1700819534562; 
 Fri, 24 Nov 2023 01:52:14 -0800 (PST)
Received: from localhost (cst-prg-91-180.cust.vodafone.cz. [46.135.91.180])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adfeec4000000b003196b1bb528sm3859456wrp.64.2023.11.24.01.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 01:52:14 -0800 (PST)
Date: Fri, 24 Nov 2023 10:52:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 1/7] target/riscv: implement svade
Message-ID: <20231124-fe321aa443c34bdbfd4af06b@orel>
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
 <20231123191532.1101644-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123191532.1101644-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32f.google.com
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

On Thu, Nov 23, 2023 at 04:15:26PM -0300, Daniel Henrique Barboza wrote:
> 'svade' is a RVA22S64 profile requirement, a profile we're going to add
> shortly. It is a named feature (i.e. not a formal extension, not defined
> in riscv,isa DT at this moment) defined in [1] as:
> 
> "Page-fault exceptions are raised when a page is accessed when A bit is
> clear, or written when D bit is clear.".
> 
> As far as the spec goes, 'svade' is one of the two distinct modes of
> handling PTE_A and PTE_D. The other way, i.e. update PTE_A/PTE_D when
> they're cleared, is defined by the 'svadu' extension. Checking
> cpu_helper.c, get_physical_address(), we can verify that QEMU is
> compliant with that: we will update PTE_A/PTE_D if 'svadu' is enabled,
> or throw a page-fault exception if 'svadu' isn't enabled.
> 
> So, as far as we're concerned, 'svade' translates to 'svadu must be
> disabled'.
> 
> We'll implement it like 'zic64b': an internal flag that profiles can
> enable. The flag will not be exposed to users.
> 
> [1] https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 1 +
>  target/riscv/cpu_cfg.h     | 1 +
>  target/riscv/tcg/tcg-cpu.c | 9 +++++++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3a230608cb..59b131c1fc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1445,6 +1445,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>  };
>  
>  const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
> +    MULTI_EXT_CFG_BOOL("svade", svade, true),
>      MULTI_EXT_CFG_BOOL("zic64b", zic64b, true),
>  
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 90f18eb601..46b06db68b 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -116,6 +116,7 @@ struct RISCVCPUConfig {
>      bool ext_smepmp;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
> +    bool svade;
>      bool zic64b;
>  
>      uint32_t mvendorid;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8fa8d61142..ddf37b25f3 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -188,6 +188,9 @@ static void riscv_cpu_enable_named_feat(RISCVCPU *cpu, uint32_t feat_offset)
>          cpu->cfg.cbop_blocksize = 64;
>          cpu->cfg.cboz_blocksize = 64;
>          break;
> +    case CPU_CFG_OFFSET(svade):
> +        cpu->cfg.ext_svadu = false;
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -383,8 +386,14 @@ static void riscv_cpu_validate_zic64b(RISCVCPU *cpu)
>                        cpu->cfg.cboz_blocksize == 64;
>  }
>  
> +static void riscv_cpu_validate_svade(RISCVCPU *cpu)

Another use of the word "validate" that doesn't seem right to me (and the
use in riscv_cpu_validate_zic64b too). We should probably double check all
our uses of that word in function names. This function, for example,
doesn't check ("validate") anything it just does an assignment ("set"), so
riscv_cpu_set_svade() would seem more appropriate. (And, we don't really
even need the function, IMO).

> +{
> +    cpu->cfg.svade = !cpu->cfg.ext_svadu;
> +}
> +
>  static void riscv_cpu_validate_named_features(RISCVCPU *cpu)
>  {
> +    riscv_cpu_validate_svade(cpu);
>      riscv_cpu_validate_zic64b(cpu);
>  }
>  
> -- 
> 2.41.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

