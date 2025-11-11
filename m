Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD6CCFA18
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 23:05:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIxQY-00061I-Rz; Tue, 11 Nov 2025 18:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1vIxQV-00060U-Va
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 18:05:28 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1vIxQT-0001TT-E2
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 18:05:27 -0500
Received: by mail-il1-x141.google.com with SMTP id
 e9e14a558f8ab-4331d3eea61so1834655ab.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 15:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762902323; x=1763507123; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xu2zjvNPwfXJElMnr2ftCDAL/r+SerTzkT7dPyfJeuA=;
 b=l9uVwTPZ6bpuhpfcSv2GTcsWev5YmTfh5xPN7lTDO3GuRanUr8ilIExIeBLiUviB+s
 ImEz6VxzLkBpPw3D79fgKtzcXC9X83qgBJ1UM7xrkUbab9jxPs424WtZwb7mrRehwgxS
 gKjHc05tAwtw7I++d52DvKHtFf+8nJ9RqI9VjvfHgK3kfLGZnBF8BCv4MmikElCT8qKd
 I6fC5BNnOi3gSx41QdN0dYDip1QQVmHerQG6j/IDPOnoOc82csf7CzHv7KztBM8moVkF
 SCl3C8QKtkTshgjtIBvPcTlaiHE0aZpt7xMvFIUGU+KXo4vB55D3AQ2AYzCxeyCToVpc
 0G0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762902323; x=1763507123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xu2zjvNPwfXJElMnr2ftCDAL/r+SerTzkT7dPyfJeuA=;
 b=cnGKvHuUJT79m8anFoNVl0BP7rgBciWfG0T4mhF+27gKyYqq+EUI95nYNPlYnE77jX
 JJ8ZZLpTxttKZHC4KLr6Rt/AgINkC8wEfndr0xdzKWOXZXAJN97YDorWr5Qy0OeREFUd
 OytYNMYJsNYMR+zss4zeEN3wSTzKF7ymMr0yZs5y4uV0o02WMT+j1+iQ40lngbVoVAZU
 YVWcmkvcvbWaXYafumkNEPMOJmbGVhvJtUi9Qa+2BWKvVUub1J0mqVgAoSFUM+rFoEht
 zNFXhY9gm+EDBk/FwedaltOFnKWtirc0xilZIzstwV9p8q3q5m+UY62N1oiz0YbBUZJ8
 JumQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrefuja18lKmk8T/cm8e6ukU267noVUrku1YBrW67/zjCPBRV8GTHblpQO0kz1lQoLO4yTbYkWe7Cm@nongnu.org
X-Gm-Message-State: AOJu0YwsNAkWuA8q31L8hSFTvLTwGPwkSyFZjIxmEno1zF2i35nZJ4if
 zUXo5zhGAgh/2yur5ImImc2aAzws5fSy9GTMVhkGC6k4my+oaek8f1m9eIi+XIEgIrQ=
X-Gm-Gg: ASbGnct1mAbgKAdiM41VrDw93uMsoxTZXu8F4Kz8b4z5XqJcjy/RwP0kygMRuHVlfln
 TQYTmrHIK+w85x6xjvu2RFUfelRMK/7LBlkgT7dZkcQrzZQ+weM/6+e10GZ9K7i5f65UOOPJAh2
 bIsT3gQZObg65lYH5z/j/RbE2f48lWgtjOY+HJWhGMIgke8b0kpxM1cLgCcIr34pF8DxsKIYnTQ
 JQkcfru4mFoJLNS0+qmgqUtkbsQPuTnr0IkJ3rP1M2YPF28CyK7TXCm/ks9dJ9UGwqFh3lzk21Q
 X2GyElsMAs7abfDIu3d5NGa9UuIg0J72f4+F7hdM25GeZIw96u3Qwo6d6icSHY8M9IFejZ7bYlA
 lbDlBjnObJ18V5Yi9NCSzy8rUFxxryEaFSp+UH7LRyPtHUlw03AuPd39N8kYltS1H+PM17dM8zO
 9z3o2BFtjNx79S
X-Google-Smtp-Source: AGHT+IFytowOARwSQiwTd9ecD8L4diQzeVskDBDMuoT0MUfBuUufpMqoY5tp1PkiNJtXrtDDZcYJng==
X-Received: by 2002:a05:6e02:2187:b0:433:3564:66a5 with SMTP id
 e9e14a558f8ab-43473d1b7d9mr13695415ab.14.1762902322735; 
 Tue, 11 Nov 2025 15:05:22 -0800 (PST)
Received: from localhost ([140.82.166.162]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-434733a3854sm3902925ab.34.2025.11.11.15.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 15:05:21 -0800 (PST)
Date: Tue, 11 Nov 2025 17:05:20 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 Fei Wu <wu.fei9@sanechips.com.cn>
Subject: Re: [PATCH v4 2/5] target/riscv: Add server platform reference cpu
Message-ID: <20251111-e4f4062f326aef78ef820d00@orel>
References: <20251111182944.2895892-1-dbarboza@ventanamicro.com>
 <20251111182944.2895892-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111182944.2895892-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=ajones@ventanamicro.com; helo=mail-il1-x141.google.com
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

On Tue, Nov 11, 2025 at 03:29:41PM -0300, Daniel Henrique Barboza wrote:
> From: Fei Wu <wu.fei9@sanechips.com.cn>
> 
> The harts requirements of RISC-V server platform [1] require RVA23 ISA
> profile support, plus Sv48, Svadu, H, Sscofmpf etc.
> 
> This patch provides a CPU type (rvsp-ref) to go along with the rvsp-ref
> board.
> 
> [1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
> 
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 75f4e43408..07e96a14ba 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -42,6 +42,7 @@
>  #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>  #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
>  #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
> +#define TYPE_RISCV_CPU_RVSP_REF         RISCV_CPU_TYPE_NAME("rvsp-ref")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 975f7953e1..3ddb249970 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3305,6 +3305,20 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>          .cfg.max_satp_mode = VM_1_10_SV48,
>      ),
>  
> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSP_REF, TYPE_RISCV_BARE_CPU,
> +        .misa_mxl_max = MXL_RV64,
> +        .profile = &RVA23S64,
> +
> +        /*
> +         * ISA extensions
> +         * NOTE: we're missing 'sdext'.
> +         */
> +        .cfg.ext_zkr = true,
> +        .cfg.ext_svadu = true,

Svadu is no longer required.

> +
> +        .cfg.max_satp_mode = VM_1_10_SV57,

Shouldn't this be SV48 and then allow instantiations to use
rvsp-ref,sv57=on.

We also need Ssccfg and Sdtrig.

> +    ),
> +
>  #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
>          .cfg.max_satp_mode = VM_1_10_SV57,
> -- 
> 2.51.1
> 
>

Thanks,
drew

