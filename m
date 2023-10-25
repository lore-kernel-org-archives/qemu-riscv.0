Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A28C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:09:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvgRd-0007D7-KB; Wed, 25 Oct 2023 12:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgRb-0007CP-H1
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:09:19 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgRZ-0005aK-TG
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:09:19 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so923627666b.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 09:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698250156; x=1698854956; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JkzyCyjR+k3ifO6fdn3zmtFmH3dodqawzdDuH7wDHiI=;
 b=mAp+SEFDwKqTPjRGGPJzQ4aLfsWOf2SKT+veqSoA4zJT49LgGYupIp/0U2kBPrkWRm
 x1V6bAuko0qUjvJQx3Y01DvAVTSikVk1ahyZ2Ii+ZQRQe4vpHM2xK+ZxOYmvRWI84ByM
 lZP1tG+2FtxC2fmaj1Z/u1Gt1FpVb3po/yGMMbIjkWQzJUxteUtG/MQ81mprKzlx/xDG
 OmHf0ROmHIQE66+H5y3HpdjNiuhTBn7g3YFl9+x7ECXJGrfdRlH+un1pmggrkEZfvfX1
 XEXDS7+TtdZ+SuwO4DWnaTXtjrPUZZhOuHfccXhpG73yTEJ8wXid458n+oCSUUDQD50c
 z/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698250156; x=1698854956;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JkzyCyjR+k3ifO6fdn3zmtFmH3dodqawzdDuH7wDHiI=;
 b=i/NchS72LGZhY47G0m1dbRoaSxcy3APxzbhi9wSm0VbyabT4G7/69w2ImBEJvnyDQH
 DiVqYaaOXou8tH0e21wkbsVQaKVzG56VvKSCaWSV3WMR/eTlZ7eGiugxkytOG0ZmCyt2
 Kr5MMmSnv+dLLKxa9ZU0vgPIYDXxhlZOIXDFFCLc1pws3VmcqlWTCGkgKjeImgw1wBcS
 r61JvEHPXV/NrZTXeSQUpw2BDZGcKJKXgT+R49qlrgP5b8IA/oRhldxfOKRfP4oSz/k2
 5pIyMZC3+28F1KW08HJdEX0gh7t/utwtdmvJYn9F+GYQ4m5O+f5pcq0PuD8QhHoULX/u
 YiHA==
X-Gm-Message-State: AOJu0Yy/qpGGfJhVeX067trFaa0it9uTJjbTY/fa9iV9UVVT1331Uj0O
 HwQObhmVRwVHDFo2QrN90va1gw==
X-Google-Smtp-Source: AGHT+IF2IKE5n0ZBDnVTQ5kLnCaXTKAYsOibuHULi1jmZpOmTVnxqduxb/XsrHYOylx18kQWFT5rWw==
X-Received: by 2002:a17:907:3f09:b0:9ad:c763:bc7a with SMTP id
 hq9-20020a1709073f0900b009adc763bc7amr14708616ejc.23.1698250155707; 
 Wed, 25 Oct 2023 09:09:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906354c00b0098f33157e7dsm10026274eja.82.2023.10.25.09.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 09:09:15 -0700 (PDT)
Date: Wed, 25 Oct 2023 18:09:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v4 2/9] target/riscv/kvm: add 'rva22u64' flag as
 unavailable
Message-ID: <20231025-0ea673952495b43f37709a75@orel>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025135001.531224-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62c.google.com
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

On Wed, Oct 25, 2023 at 10:49:54AM -0300, Daniel Henrique Barboza wrote:
> KVM does not have the means to support enabling the rva22u64 profile.
> The main reasons are:
> 
> - we're missing support for some mandatory rva22u64 extensions in the
>   KVM module;
> 
> - we can't make promises about enabling a profile since it all depends
>   on host support in the end.
> 
> We'll revisit this decision in the future if needed. For now mark the
> 'rva22u64' profile as unavailable when running a KVM CPU:
> 
> $ qemu-system-riscv64 -machine virt,accel=kvm -cpu rv64,rva22u64=true
> qemu-system-riscv64: can't apply global rv64-riscv-cpu.rva22u64=true:
>     'rva22u64' is not available with KVM
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 6d1c0a7915..2243dfde64 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -393,7 +393,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>      }
>  
>      if (value) {
> -        error_setg(errp, "extension %s is not available with KVM",
> +        error_setg(errp, "'%s' is not available with KVM",
>                     propname);
>      }
>  }
> @@ -474,6 +474,11 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts);
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental_exts);
> +
> +   /* We don't have the needed KVM support for profiles */
> +    for (i = 0; riscv_profiles[i] != NULL; i++) {
> +        riscv_cpu_add_kvm_unavail_prop(cpu_obj, riscv_profiles[i]->name);
> +    }
>  }
>  
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

