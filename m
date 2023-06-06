Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8C2C77B73
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 13:19:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Wag-0005X3-N9; Tue, 06 Jun 2023 09:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6Waf-0005Wj-3k
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 09:19:13 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6Wad-0002Jp-5U
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 09:19:12 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5147a478c38so8662631a12.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686057548; x=1688649548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Bw6U5pOKqIIbmyM+DU2+Rfc2Mkz7uG5/8SQaxO2MCQI=;
 b=k4LSUb4zvb+ApBPDZe/RKgK3GdTrR3iTJA+KuhWW1RDzHGd+Ea//KNbXvJJijl/JLn
 SHBjK01doZ5K2qGzft//E03WfJgyTwN74u/tN2ckrxk2uxG0HARkscur2vBDQfkGqSs8
 k+YeTu20hAOu5Fhs8ZyoBOm30xa1VjlTU9BpenLSQag3Gf7Dam2vi4+RXn9nmaiMyLnH
 1tPkSwv/1Gs1MpEdiTYYGNCjziUVSSNKFP7u+pdxSVBrVbLhBmTz1pWUP4aPldcOJAGL
 jMI6BsCS4T/KfMVpsu429nDiJ51NYzBCNwZ8qnknT2pTHhmjnUWVK5vWY5xeu/XM2Fo+
 Z8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686057548; x=1688649548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bw6U5pOKqIIbmyM+DU2+Rfc2Mkz7uG5/8SQaxO2MCQI=;
 b=iX91tAyjpEN+CTeqR4xC2DujbbKXNOeeA4NAblaoDvFxvUg3WULIhv4VEIvSdSK1Mz
 p7NzTzFAOgeZkObIRqREST4cuMvz/50kSr7fsLqlW24wTcVokmODffiFlcODoW09keYs
 AepN4a645V7nVQzOQY+bv5LyPNwPHnwvhXgUXah4Jf95Le3fYdwHTRyIjzufnKaFT5oB
 qWpfH4XpRVLZ7GXqMSYUQqbL/pVHI8gwEkJz53A188BmRIrFuiYNvKdrEB6DTZ1iRoGR
 LMkLGQy3F515Kn7EQT3uLMTwfzq5+lzv3MgckmIZfzdP+U/jm3JZ96d49acyLBT+Tn5M
 A5EA==
X-Gm-Message-State: AC+VfDwRi/03h9psrEpiI3N2sIKr9r1rXUfETewEr0FWH06dAso9om9m
 Ez5jCIYYYIXVAWdg+KRW8kG6Rw==
X-Google-Smtp-Source: ACHHUZ7cED7yuv6x67IHre2aynBSUuhJesDY+vGS8zukMgNK+rWe9At32stGTm5B6vwbuQil0iU7uw==
X-Received: by 2002:a17:907:608e:b0:977:d424:a358 with SMTP id
 ht14-20020a170907608e00b00977d424a358mr2369160ejc.26.1686057548123; 
 Tue, 06 Jun 2023 06:19:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a1709061d0c00b009787209732esm602644ejh.143.2023.06.06.06.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 06:19:07 -0700 (PDT)
Date: Tue, 6 Jun 2023 15:19:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 03/16] target/riscv/cpu.c: restrict 'mvendorid' value
Message-ID: <20230606-aadc97a378f5d52fd233dcaa@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
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

On Tue, May 30, 2023 at 04:46:10PM -0300, Daniel Henrique Barboza wrote:
> We're going to change the handling of mvendorid/marchid/mimpid by the
> KVM driver. Since these are always present in all CPUs let's put the
> same validation for everyone.
> 
> It doesn't make sense to allow 'mvendorid' to be different than it
> is already set in named (vendor) CPUs. Generic (dynamic) CPUs can have
> any 'mvendorid' they want.
> 
> Change 'mvendorid' to be a class property created via
> 'object_class_property_add', instead of using the DEFINE_PROP_UINT32()
> macro. This allow us to define a custom setter for it that will verify,
> for named CPUs, if mvendorid is different than it is already set by the
> CPU. This is the error thrown for the 'veyron-v1' CPU if 'mvendorid' is
> set to an invalid value:
> 
> $ qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mvendorid=2
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mvendorid=2:
>     Unable to change veyron-v1-riscv-cpu mvendorid (0x61f)
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 72f5433776..bcd69bb032 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1723,7 +1723,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
>  static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>  
> -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>      DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
>      DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
>  
> @@ -1810,6 +1809,32 @@ static const struct TCGCPUOps riscv_tcg_ops = {
>  #endif /* !CONFIG_USER_ONLY */
>  };
>  
> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
> +}
> +
> +static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
> +                              void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    uint32_t prev_val = cpu->cfg.mvendorid;
> +    uint32_t value;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val != value) {
> +        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    cpu->cfg.mvendorid = value;
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> @@ -1841,6 +1866,10 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
>      cc->tcg_ops = &riscv_tcg_ops;
>  
> +    object_class_property_add(c, "mvendorid", "uint32", NULL,
> +                              cpu_set_mvendorid,
> +                              NULL, NULL);
> +

Shouldn't we provide a get function as well?

>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>  
> -- 
> 2.40.1
> 
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

