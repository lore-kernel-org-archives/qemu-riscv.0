Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV4vH-0005kK-Rf
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 01:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pV4vB-0005jR-0u
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 01:17:37 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pV4v8-00015X-0o
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 01:17:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c12so9766680wrw.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 22:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjF/kJNnJ49q3LOGdfsbF1MHAMDW+WZ1zoYMshTAD2Y=;
 b=a6K1PDfvfBoPMNQG4EZKsSnObnLDDGF/W+k7xWbC2BaYNk/WtVV4lsLfF7Wa9LuJZj
 9maWuclbM3SPVEAt6eIR4N0x0vkQbvf8t1jgcKUJPDaVLPaA/OIOOm9dbfPt2D7VgaMc
 IMIE+Lg0Xn6kqL32fY4a7i0e2jFIrVsq8awHcVWvVbW0thimEXsbIg381fqY3hUx9v4W
 s6erGSwHRbiVBF+Wmx64wN1E5ISF/nzRp0fgDXnrxykFLOLFO2b6T632bur48aTQH7cK
 BxGXbJ/wFQsYD5pbiemUZRr0arvE/IkmwaGC8hqD3iqPJC0tW4kWSnnz0vJIpzNdb49F
 72LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjF/kJNnJ49q3LOGdfsbF1MHAMDW+WZ1zoYMshTAD2Y=;
 b=DFLptlZTBCZNrL3WWLiC0IAcBSwN1p+iiFEpjRN1cCblem5l1hLnvXlCu9ysL+2KR3
 ttkAwzSYoMCkrGpwFYM/yscH/AB5HlYFh1/ZigrNrEsxN0vQ1XTqRxDeKRu3mOv9Bnj7
 kT1e4MZ0Zj+hgMkIxc+pTQ2PCU9A1p3pxmsfwoYqWIFxs/6lhtMFLJfn/kjYOiuOgzGI
 ZFlqsGv4kAJAzh+IdcR02uftm2DsdB+uRTUnpuGMuQ9isUxJI5VGgDhgwDA6xDeHOGSC
 O8uSJ0rlPDOEd/RMMYQCEx+KbBd69QVkqsQfQZEkZySbjqbegNOwoEGS+FK79+NmveF2
 7l5g==
X-Gm-Message-State: AO0yUKWv0pThZYH7U3j8bt2ntm7UmtFPk3upVyWWS5wIEy9eDdYV+L1C
 Q5TXnwWLTUag9f6ahDutMc+Tow==
X-Google-Smtp-Source: AK7set9JFigw46P8ckZ8Z7cW4hf6fZT2HkM3E0GfGP/uPFsxy2Us1/Wl/jKZufUWPAfZ3Gl/rQTKug==
X-Received: by 2002:a05:6000:1007:b0:2c3:da8a:192 with SMTP id
 a7-20020a056000100700b002c3da8a0192mr8726616wrx.15.1677133050222; 
 Wed, 22 Feb 2023 22:17:30 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003daf7721bb3sm10009152wmj.12.2023.02.22.22.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 22:17:29 -0800 (PST)
Date: Thu, 23 Feb 2023 07:17:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v7 03/10] target/riscv: allow MISA writes as experimental
Message-ID: <20230223061728.j6uunjkdaqdvage4@orel>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
 <20230222185205.355361-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222185205.355361-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Thu, 23 Feb 2023 06:17:37 -0000

On Wed, Feb 22, 2023 at 03:51:58PM -0300, Daniel Henrique Barboza wrote:
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to properly write this CSR, has
> always been a no-op as well because write_misa() will always exit
> earlier.
> 
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
> 
> After discussions in the mailing list, most notably in [1], we reached
> the consensus that this code is not suited to be exposed to users
> because it's not well tested, but at the same time removing it is a bit
> extreme because we would like to fix it, and it's easier to do so with
> the code available to use instead of fetching it from git log.
> 
> The approach taken here is to get rid of RISCV_FEATURE_MISA altogether
> and use a new experimental flag called x-misa-w. The default value is
> false, meaning that we're keeping the existing behavior of doing nothing
> if a write_misa() is attempted. As with any existing experimental flag,
> x-misa-w is also a temporary flag that we need to remove once we fix
> write_misa().
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg05092.html
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 6 ++++++
>  target/riscv/cpu.h | 2 +-
>  target/riscv/csr.c | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 93b52b826c..1d637b1acd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1210,6 +1210,12 @@ static Property riscv_cpu_properties[] = {
>  
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>      DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +
> +    /*
> +     * write_misa() is marked as experimental for now so mark
> +     * it with -x and default to 'false'.
> +     */
> +    DEFINE_PROP_BOOL("x-misa-w", RISCVCPU, cfg.misa_w, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 215423499e..9d3304bcda 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,7 +89,6 @@ enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
>      RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_MISA,
>      RISCV_FEATURE_DEBUG
>  };
>  
> @@ -498,6 +497,7 @@ struct RISCVCPUConfig {
>      bool pmp;
>      bool epmp;
>      bool debug;
> +    bool misa_w;
>  
>      bool short_isa_string;
>  };
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e149b453da..3cb8d2ffad 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1329,7 +1329,7 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>  static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
> +    if (!riscv_cpu_cfg(env)->misa_w) {
>          /* drop write to misa */
>          return RISCV_EXCP_NONE;
>      }
> -- 
> 2.39.2
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

