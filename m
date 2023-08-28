Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBE1C83F11
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 12:32:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qabPE-00065m-NQ; Mon, 28 Aug 2023 08:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qabPC-00060k-Mx
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:31:42 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qabPA-000097-74
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 08:31:42 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1c26bb27feeso2300866fac.0
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693225898; x=1693830698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bS7H72q5zUrhly2d620vAkrGEXpK89glSgM/1sUcyGo=;
 b=b53pVctcSuAHfx/+mg5luZP2tY2a7DRYYoja6Ro7WGXCn2JjBnsWZslBkWz/hOB1lU
 nzwYuXv5JmhjadzK6aCrvtFGmQbH+g2QK1gCZBN9QcL41vsNNtYSX3SlNeMrT0F/wDta
 FHoYTstc2m+vDptArGbGmCrtijGKbvFrPxJwRXgtJ0/Ze7Ce0h6KLYeWXVcmwjs9jSq2
 Jt+whTUO0BHGULQf381lUcLBv63MxVzhQhiIYPGFO2xXWaZDD7EtN1eM4Y2kRTyYTHoW
 R0RCedry3XTG4ubgWLIgFKT0Usx0hYLxuNS/NWYT9kX5BEKpwoO7Uq5b7CMyy5Z2HD/C
 9R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693225898; x=1693830698;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bS7H72q5zUrhly2d620vAkrGEXpK89glSgM/1sUcyGo=;
 b=Wl3bmgTjYgaoxuWb1ctrV4IMC8zIzr4+t2aG7vVYhn+GN1gXjboCWhHPMt3eH8/CkI
 Nz4LF3AtgZpPwE4rqGWasIzJbH8hhWBub30VTK7K9d/Efcgn9MG+TWqWdlwOh+AgRDtR
 oWjegagze9KbcXRmHIGeFxM9KQAg4L0fBTn8lssRzo0dT1VGHu8OlIAVoLYfV2vdZG5t
 fbVbVH0v3sGoAgZ2a9IbNxeeCOgMcpL4pGj/1Gf7r+4V5IMrJUwoGdX+ubI3HNTIh4SJ
 6WdhniWO768jWAJSVBajU7d6Ks6xvZK+FSUkvpSjKSBc9er6M5LH8+CGI0CXRxMwGEeL
 h9SQ==
X-Gm-Message-State: AOJu0Yx6WOKNr7B9quLnH47WC/o44oYqrhSWYWdye6C1axyPDL/fh5l/
 LAZ/jvaOMhJZn2hJd+H0m7b4tg==
X-Google-Smtp-Source: AGHT+IH9LcAUo+yD+8CJoieVn6B1daDwKRKSTIZKenun0mIxwiRrdkY0bPXRRJBFcZX5QjC1hmVb8A==
X-Received: by 2002:a05:6870:d18a:b0:1c8:bf19:e1df with SMTP id
 a10-20020a056870d18a00b001c8bf19e1dfmr13346723oac.13.1693225898587; 
 Mon, 28 Aug 2023 05:31:38 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a056870e14500b001a68feb9440sm4212453oaa.9.2023.08.28.05.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 05:31:38 -0700 (PDT)
Message-ID: <542b5589-025c-07ab-fb67-25dc904f44e0@ventanamicro.com>
Date: Mon, 28 Aug 2023 09:31:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 5/6] target/riscv: Add defalut value for string
 property
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 qemu-riscv@nongnu.org
References: <20230828084536.231-1-zhiwei_liu@linux.alibaba.com>
 <20230828084536.231-6-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230828084536.231-6-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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



On 8/28/23 05:45, LIU Zhiwei wrote:
> Before this patch,
> """
> qemu-system-riscv64 -device rv64-riscv-cpu,v=true,help
> 
> ...
> vext_spec=<str>
> ...
> 
> """
> 
> After this patch,
> """
> vext_spec=<str>        -  (default: "v1.0")
> """
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Code LGTM.

Assuming that we'll need a new API to set default strings in hw/core/qdev-properties.c
(seems likely but we'll need more opinions on that) we'll need to split this patch in
two:

- one patch to add the new qdev_propinfo_set_default_value_string() into
hw/core/qdev-properties.c

- one to change target/riscv to use the newly created API


Thanks,


Daniel



>   hw/core/qdev-prop-internal.h | 2 ++
>   hw/core/qdev-properties.c    | 7 +++++++
>   include/hw/qdev-properties.h | 8 ++++++++
>   target/riscv/cpu.c           | 2 +-
>   4 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
> index d7b77844fe..f0613b9757 100644
> --- a/hw/core/qdev-prop-internal.h
> +++ b/hw/core/qdev-prop-internal.h
> @@ -13,6 +13,8 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
>   void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
>                               void *opaque, Error **errp);
>   
> +void qdev_propinfo_set_default_value_string(ObjectProperty *op,
> +                                            const Property *prop);
>   void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
>                                             const Property *prop);
>   void qdev_propinfo_set_default_value_int(ObjectProperty *op,
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 357b8761b5..64f70a7292 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -96,6 +96,12 @@ static ObjectPropertyAccessor *field_prop_setter(const PropertyInfo *info)
>       return info->set ? field_prop_set : NULL;
>   }
>   
> +void qdev_propinfo_set_default_value_string(ObjectProperty *op,
> +                                            const Property *prop)
> +{
> +    object_property_set_default_str(op, prop->defval.p);
> +}
> +
>   void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
>                               void *opaque, Error **errp)
>   {
> @@ -488,6 +494,7 @@ const PropertyInfo qdev_prop_string = {
>       .release = release_string,
>       .get   = get_string,
>       .set   = set_string,
> +    .set_default_value = qdev_propinfo_set_default_value_string,
>   };
>   
>   /* --- on/off/auto --- */
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index e1df08876c..8e5651724a 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -22,6 +22,7 @@ struct Property {
>       union {
>           int64_t i;
>           uint64_t u;
> +        void *p;
>       } defval;
>       int          arrayoffset;
>       const PropertyInfo *arrayinfo;
> @@ -91,6 +92,11 @@ extern const PropertyInfo qdev_prop_link;
>                   .set_default = true,                                       \
>                   .defval.u  = (_type)_defval)
>   
> +#define DEFINE_PROP_STR(_name, _state, _field, _defval, _prop, _type)      \
> +    DEFINE_PROP(_name, _state, _field, _prop, _type,                       \
> +                .set_default = true,                                       \
> +                .defval.p  = (_type)_defval)
> +
>   #define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
>       DEFINE_PROP(_name, _state, _field, _prop, _type)
>   
> @@ -171,6 +177,8 @@ extern const PropertyInfo qdev_prop_link;
>       DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size, uint64_t)
>   #define DEFINE_PROP_STRING(_n, _s, _f)             \
>       DEFINE_PROP(_n, _s, _f, qdev_prop_string, char*)
> +#define DEFINE_PROP_STRING_DEF(_n, _s, _f, _d)             \
> +    DEFINE_PROP_STR(_n, _s, _f, _d, qdev_prop_string, char*)
>   #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
>   #define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 38838cd2c0..edcd34e62b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1769,7 +1769,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
>   
>       DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> -    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> +    DEFINE_PROP_STRING_DEF("vext_spec", RISCVCPU, cfg.vext_spec, "v1.0"),
>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>   

