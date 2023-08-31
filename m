Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4070CC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:17:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhLX-0008Bu-Ho; Thu, 31 Aug 2023 09:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhJ2-0003aY-UH
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:01:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbhIz-0007Ay-Qc
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:01:52 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso428270666b.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693486908; x=1694091708; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lH6TnAo/w2WPYjZUcsWekEb1RNbiIJUFMjSMObAamQQ=;
 b=KWMRuLhlCUXxGRGx9/41S1N5rsGzIwzKu1fGPrSIu3/uA4IYuZSXhT45Crc1MPfERg
 +DfxjCA/CvbLeTsE/qQgd/tBwN4BtdumJ1MOFbMANcF8kOQLZxC0L3qqRQJ2U+fqFsOT
 rswSCLHTUo/pKfN/xMmv4Zh1OecHwcZPyKCXo6hUfqaTOWMWvO4e13Ut4Kcm0ZrK/ZaT
 kd8HApeBhqdFwTiUMkoKJgPpVIC0PTEyvTA9Ocih1oHQ8a7lzezjREb649S169M8Nyb3
 Svyxs277gkefQTBWV8+z4m/y7LZGrEuU1p1uFHyA6+DlFIxkzFdhf2aK1F+2RhP5MNWr
 Si8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486908; x=1694091708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lH6TnAo/w2WPYjZUcsWekEb1RNbiIJUFMjSMObAamQQ=;
 b=LqjCna4p/p7HoNwrxtcjOvl6iufl3WrV7iL5eypPLK6T/K5pxlckWzKIM6mXwDvF5U
 YdrkRA1FmNNKOU9o9AmTfguYziCOpCjXf+X3LYvJvlN1dfFGDXq2qTwthxkyEFuPROlY
 jaQ3AAaIpJFoxzJ5MeOqqYf3/udyN4NfCiVPZbDEbc8juUC+P6dTlz7IQ1Sbz4VoMKQv
 iqIrqnofkCzw97F2EaUcnbJhBCPYrKA+r1mX5HLwG2Y+jCLfSo2tFS9mTKvms6bukjvX
 kmfuxkjL1MbRHx/vDR+EDMwaolyuunGGHgY2qmLukTH/109Xj4DiHsOPqzNV85uBTpt9
 RpMw==
X-Gm-Message-State: AOJu0Yz017ebP0CFlXXby09ht6aikF0GYyXSJvyjifKztszzSNcbkyfK
 vNrBtyM1qmBiTzilpUWCYbqaSQ==
X-Google-Smtp-Source: AGHT+IGzSKDoEdWZXZomZFxKuoPqXhgoniJvRRKG4bWMHDxqxmkUFYT/5gaxOIAgLuRQVlaSNBnghg==
X-Received: by 2002:a17:906:3043:b0:9a1:ca55:d0cb with SMTP id
 d3-20020a170906304300b009a1ca55d0cbmr2802076ejd.23.1693486907155; 
 Thu, 31 Aug 2023 06:01:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ja8-20020a170907988800b0099bd6026f45sm726869ejc.198.2023.08.31.06.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:01:46 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:01:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 07/20] target/riscv/cpu.c: add
 riscv_cpu_add_qdev_prop_array()
Message-ID: <20230831-bf8480410d43227a4308903e@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-8-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-8-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x635.google.com
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

On Thu, Aug 24, 2023 at 07:14:27PM -0300, Daniel Henrique Barboza wrote:
> The code inside riscv_cpu_add_user_properties() became quite repetitive
> after recent changes. Add a helper to hide the repetition away.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 668522db01..4608fa2378 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1946,6 +1946,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>  }
>  #endif
>  
> +static void riscv_cpu_add_qdev_prop_array(DeviceState *dev, Property *array)
> +{
> +    for (Property *prop = array; prop && prop->name; prop++) {

Here checking prop first is a good idea, as a caller could pass NULL for
'array'. But, if we don't want callers to ever pass NULL for array, then
dropping the prop check will ensure we get a segfault to spot the bug (or,
a bit cleaner, we could add an explicit assert(array)).

> +        qdev_property_add_static(dev, prop);
> +    }
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
>  {
> @@ -2002,7 +2009,6 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
>   */
>  static void riscv_cpu_add_user_properties(Object *obj)
>  {
> -    Property *prop;
>      DeviceState *dev = DEVICE(obj);
>  
>  #ifndef CONFIG_USER_ONLY
> @@ -2016,21 +2022,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
>  
>      riscv_cpu_add_misa_properties(obj);
>  
> -    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> -    }
> -
> -    for (prop = riscv_cpu_options; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> -    }
> -
> -    for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> -    }
> -
> -    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
> -        qdev_property_add_static(dev, prop);
> -    }
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_extensions);
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_options);
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_vendor_exts);
> +    riscv_cpu_add_qdev_prop_array(dev, riscv_cpu_experimental_exts);
>  }
>  
>  static Property riscv_cpu_properties[] = {
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

