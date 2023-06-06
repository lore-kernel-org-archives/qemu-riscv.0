Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96808C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6YeP-0005kw-OC; Tue, 06 Jun 2023 11:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6YeN-0005jY-NJ
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:31:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6YeK-0005AW-Kr
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:31:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6e1394060so54426255e9.3
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 08:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686065465; x=1688657465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lI/8FzBzG5TB9Mthq+97tw3KeX/44z64v8kJ3ADrO8Q=;
 b=bBJ9H3uxOjDq0I/MK0DZ4JfK8Tu2e7k//CFvRDokEm2dwsPxBAMOi6Zl0v2/3h8zc0
 AUqJR4/KlE2rg8uCYDUVtZm2Fo5C1Nlur+4ZwmBTFuEpW1YrbQUkhFE/gzxsvoVlfvJV
 Jfw/gWOtdjQe5gXKL9vpmoRUa6+phEjzdv3EAF1TE3oO3cQHgtsTl81Nqdwx81Yd39b2
 MaNFEaMBKnKLKIxLjdjOj44K+fnItAddJpdywNVLhEjNc0T3OYUzMNDzeq9GMVw6N72E
 oF6RXeRiH6C4NHJfEuUOeJAOzweiSJVBf/O211fTRQt8DaJaE0ztO21OpgRrXibPlZll
 8PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686065465; x=1688657465;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lI/8FzBzG5TB9Mthq+97tw3KeX/44z64v8kJ3ADrO8Q=;
 b=jJqsa3pOixcJy/1mbxpe7AyYUgvYVc0wF+ZAFerj5Ko323lK3D6CMGnmXHaw5/nOH3
 C/I93u+2Vl0nGAxRLPRXkurRQt429+7em9jMFhZ9HK0cDQP+58hYVqhDOv6xsAp25qp5
 ntnVbycbOkpTyPevY7uNpLNFwRgfEBXQMzNNvzrb4YM1oX0NxyAtvS7xVo1ukh9pWI6h
 GwQyLTHT5GZL1/DDO2a7tK/MPD8cL6Mq1cgqaa184o6fF2eYmeDTKJmxy5BrKStAhT/S
 GyrG6zZsLN3MhNpztk+Anxcgs+MBoBJ0NDf0JJ0/18eV8hb8QXYBYxPgsZFJXpHHD2iX
 cHhA==
X-Gm-Message-State: AC+VfDyZo3sUXapeOoUVG6o3bycnruialIHyJ/W8ga7ziSkYzZFROPww
 w39utcab28t1okRVUbjf4yenmg==
X-Google-Smtp-Source: ACHHUZ4hrC6uyu/gYnAgZjA90x0KKVVT94L/Z6GianRn9AKIzAY9EX9THPEmQxEOwoo/NtnDwxnYow==
X-Received: by 2002:a7b:cb49:0:b0:3f7:3a16:a1b3 with SMTP id
 v9-20020a7bcb49000000b003f73a16a1b3mr2420600wmj.36.1686065465266; 
 Tue, 06 Jun 2023 08:31:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0acb00b003f72d7dc66esm11172076wmr.13.2023.06.06.08.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 08:31:04 -0700 (PDT)
Date: Tue, 6 Jun 2023 17:31:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 04/16] target/riscv/cpu.c: restrict 'mimpid' value
Message-ID: <20230606-7ca051baf0700d03167f109e@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-5-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-5-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
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

On Tue, May 30, 2023 at 04:46:11PM -0300, Daniel Henrique Barboza wrote:
> Following the same logic used with 'mvendorid' let's also restrict
> 'mimpid' for named CPUs. Generic CPUs keep setting the value freely.
> 
> Note that we're getting rid of the default RISCV_CPU_MARCHID value. The
> reason is that this is not a good default since it's dynamic, changing
> with with every QEMU version, regardless of whether the actual
> implementation of the CPU changed from one QEMU version to the other.
> Named CPU should set it to a meaningful value instead and generic CPUs
> can set whatever they want.
> 
> This is the error thrown for an invalid 'mimpid' value for the veyron-v1
> CPU:
> 
> $ ./qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mimpid=2
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mimpid=2:
>     Unable to change veyron-v1-riscv-cpu mimpid (0x111)
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index bcd69bb032..ed3b33343c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -42,7 +42,6 @@
>  #define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
>                               (QEMU_VERSION_MINOR << 8)  | \
>                               (QEMU_VERSION_MICRO))
> -#define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
>  
>  static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>  
> @@ -1724,7 +1723,6 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>  
>      DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> -    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
>  
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
> @@ -1835,6 +1833,27 @@ static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
>      cpu->cfg.mvendorid = value;
>  }
>  
> +static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    uint64_t prev_val = cpu->cfg.mimpid;
> +    uint64_t value;
> +
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val != value) {
> +        error_setg(errp, "Unable to change %s mimpid (0x%lx)",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    cpu->cfg.mimpid = value;
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> @@ -1870,6 +1889,10 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>                                cpu_set_mvendorid,
>                                NULL, NULL);
>  
> +    object_class_property_add(c, "mimpid", "uint64", NULL,
> +                              cpu_set_mimpid,
> +                              NULL, NULL);
> +

Same, shouldn't we also define 'get' comment as the last patch.

>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>  
> -- 
> 2.40.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

