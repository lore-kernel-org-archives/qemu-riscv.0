Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ABFC02185
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 15:10:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXiYB-0002DQ-5h; Tue, 14 Jan 2025 10:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXiY9-0002D3-PT
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 10:09:49 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXiY7-0008Px-62
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 10:09:49 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so2156814a12.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 07:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736867385; x=1737472185; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SHQ2CtbQpkZKtZ4iS2qle4y4vOSZaS8O41b23tw/AAI=;
 b=hVyiS3srahDKOZ9ES61wdzagkNsxdnVV5jzvFHu7MFiAQ7zcrDgVhWZXNqbyyN/JU6
 bRjPDY8Mziwd0Y0d9Kk9I2AMxIoiFCz6bBvOEZ9LlmirWHv+ueqXBSNvIGQDC2A71w9d
 GZj3bIbtIMZgXbcb1QhTRCa25uP0g0FCA9hcaLCIqywnO4iM0y7q7vEogaexKKv1PQjV
 fhfJQ7NscfmlAK7bIfXPVKmagJEkhR87kuq2DD2+FtaVkXUZCO9yOsZ8T3T4CUwf5/dh
 /15AP5BkHv2DqmwmujOxq4xB2VPZvGAzWd8QvGt78+tQoCMaKVY3u0IIuuhiwEboVDpt
 8GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736867385; x=1737472185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHQ2CtbQpkZKtZ4iS2qle4y4vOSZaS8O41b23tw/AAI=;
 b=Pn7ua+GXKxXkMzpmk1MjLNmJ4fprbwfH9TZrhu6XmW0BhQs53E/sLH7zdl4rbxUyK7
 pWWkDrxutr0GQd1XrARQfK6ufJ3DV/xZiNFeNBx2qDmURox2ta+ZBBMek9Zq3NIWhU8G
 geRafcbzMoE2EoGNYVDssZP3iAF/m1qjNqgmF/ZatFE+luEZ9leTEjTFyB7ObmcZvW/f
 3KB1DLF8m+pDSOzHYMjCpxfNRkagGhiD8v7UPbaf52JvtsZS8cg9NXGNdGPgh0QXlHqj
 2GLWrh4SumdLyjJekaAt5G28+jwjYijcUEMlzRaRfpnjQPnuqjqBz94JAIkuDC6G1Fjy
 63ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ0tE2blBI8BXCf0P3KMYUhuXORblCdwjhC11HzWtCjLcrxiLeZqlthhTskameQ/sWqZc6Jkh7NSlO@nongnu.org
X-Gm-Message-State: AOJu0YxVGNm8IjLqheqXhc8Tze1CjhUbwWrlNu+atsG2/ZgIsPuuEzDW
 LIihj0hiCxqM13ACRaDGrr6UM01BrmN5AyANPuH+Dhhc3AcKGO7ZV2YqG+j0dRY=
X-Gm-Gg: ASbGncstChDVjKnN+DYUiMfGpBjGp3JpIy93w/dWyGB94ibxl1jSBZ60SHM2UoVVZFa
 muwqKrfO9eX7C3BN713KynFNtXeDSf/7FSMLwY7zgOxw4a5aZ0VaEc6Dhq0QgFft9D9TcPwwYpf
 0VoMqrH2/SllVDiByxGJj0DOxGkNPUuaV064WgXorqe1vLH+idt96SbLgowFRo8lmMJpb+LyL7T
 yHwgxZwpUOr7zpanUKBGoCaHJ1P9zLFM/wrABo/XSLyygSHOu8EdIqZlx0msTz7ydx/CPK/ZTxe
 41oZS7j+BTpsa45abBsFbRbZbLD/9CX1YYh2F2XiwA==
X-Google-Smtp-Source: AGHT+IGCIbNLbOWxpSvIeGmV735hTgeKYtOSB1TEv5wx/EF/zzqc6sbw+8UnshByY3mk7zNX98HPRA==
X-Received: by 2002:a05:6402:50d0:b0:5d0:f6ed:4cd1 with SMTP id
 4fb4d7f45d1cf-5d98a4bd87bmr19455467a12.10.1736867385485; 
 Tue, 14 Jan 2025 07:09:45 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4598sm6156659a12.53.2025.01.14.07.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:09:45 -0800 (PST)
Date: Tue, 14 Jan 2025 16:09:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 4/4] target/riscv: add RVA23S64 profile
Message-ID: <20250114-96a4217891128dc91926b19c@orel>
References: <20250114132012.1224941-1-dbarboza@ventanamicro.com>
 <20250114132012.1224941-5-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114132012.1224941-5-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jan 14, 2025 at 10:20:12AM -0300, Daniel Henrique Barboza wrote:
> Add RVA23S64 as described in [1]. This profile inherits all mandatory
> extensions of RVA23U64, making it a child of the U64 profile.
> 
> A new "rva23s64" profile CPU is also added. This is the generated
> riscv,isa for it (taken via -M dumpdtb):
> 
> rv64imafdcbvh_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_
> ziccrse_zicond_zicntr_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_
> za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_

yeah, zba/zbb/zbs are still here as expected. So patch 2's bios table
change was likely just the 'b', which we see at the start.

> zvbb_zve32f_zve32x_zve64f_zve64d_zve64x_zvfhmin_zvkb_zvkt_shcounterenw_
> sha_shgatpa_shtvala_shvsatpa_shvstvala_shvstvecd_smnpm_smstateen_ssccptr_
> sscofpmf_sscounterenw_ssnpm_ssstateen_sstc_sstvala_sstvecd_ssu64xl_
> supm_svade_svinval_svnapot_svpbmt
> 
> [1] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 43 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 53ead481a9..4cfdb74891 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -41,6 +41,7 @@
>  #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
>  #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>  #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
> +#define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e10ecc4ece..14af141349 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2419,10 +2419,45 @@ static RISCVCPUProfile RVA23U64 = {
>      }
>  };
>  
> +/*
> + * As with RVA23U64, RVA23S64 also defines 'named features'.
> + *
> + * Cache related features that we consider enabled since we don't
> + * implement cache: Ssccptr
> + *
> + * Other named features that we already implement: Sstvecd, Sstvala,
> + * Sscounterenw, Ssu64xl
> + *
> + * The remaining features/extensions comes from RVA23U64.
> + */
> +static RISCVCPUProfile RVA23S64 = {
> +    .parent = &RVA23U64,
> +    .name = "rva23s64",
> +    .misa_ext = RVS,
> +    .priv_spec = PRIV_VERSION_1_13_0,
> +    .satp_mode = VM_1_10_SV39,
> +    .ext_offsets = {
> +        /* These were present in RVA22S64 */
> +        CPU_CFG_OFFSET(ext_svade), CPU_CFG_OFFSET(ext_svpbmt),
> +        CPU_CFG_OFFSET(ext_svinval),

I guess we can't inherit from both rva23u64 and rva22s64, which is what
we'd like to do.

What about zifencei?

> +
> +        /* New in RVA23S64 */
> +        CPU_CFG_OFFSET(ext_svnapot), CPU_CFG_OFFSET(ext_sstc),
> +        CPU_CFG_OFFSET(ext_sscofpmf),
> +
> +        /* Named features: Sha, ssu64xl, ssnpm */
> +        CPU_CFG_OFFSET(ext_sha),
> +        CPU_CFG_OFFSET(ext_ssnpm),
> +
> +        RISCV_PROFILE_EXT_LIST_END
> +    }
> +};
> +
>  RISCVCPUProfile *riscv_profiles[] = {
>      &RVA22U64,
>      &RVA22S64,
>      &RVA23U64,
> +    &RVA23S64,
>      NULL,
>  };
>  
> @@ -2916,6 +2951,13 @@ static void rva23u64_profile_cpu_init(Object *obj)
>  
>      RVA23U64.enabled = true;
>  }
> +
> +static void rva23s64_profile_cpu_init(Object *obj)
> +{
> +    rv64i_bare_cpu_init(obj);
> +
> +    RVA23S64.enabled = true;
> +}
>  #endif
>  
>  static const gchar *riscv_gdb_arch_name(CPUState *cs)
> @@ -3196,6 +3238,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64,  MXL_RV64,  rva22u64_profile_cpu_init),
>      DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64,  MXL_RV64,  rva22s64_profile_cpu_init),
>      DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA23U64,  MXL_RV64,  rva23u64_profile_cpu_init),
> +    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA23S64,  MXL_RV64,  rva23s64_profile_cpu_init),
>  #endif /* TARGET_RISCV64 */
>  };
>  
> -- 
> 2.47.1
> 
>

Thanks,
drew

