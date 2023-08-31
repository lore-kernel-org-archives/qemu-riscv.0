Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1562AC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbiBj-0005ep-P7; Thu, 31 Aug 2023 09:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbiBi-0005W8-2q
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:58:22 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbiBd-0007GI-UF
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:58:21 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5007616b756so1620031e87.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693490292; x=1694095092; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FphzdIhXcWGeug1uWLhZXCjTN7COEKVkyEuBROmgYjs=;
 b=mKHst14FaLp5HdsTyub+OqpicikBQaJUfEnzxFH6OGnFdAmz0sr5PizcTP/wnpB7U5
 CRH8HPnqC2ZBWpkbuyuw/KyOXMnPrdbyqO8ExljwkqOlZMuTsdLvbaMolfPrbjaBJHah
 D38qQvi8ozEHpfr1dfQYVkqi/4Z+z/B5GR0pCm8HsJbCDtXDtnJC/UE6HhjIQd/NAUpR
 +/4J0Wv3yYwKYiGuxxE6KDKIr3cYpckBYoCVtY/z6XRoeNNBJn6Yze2Xf2FcJ43rC42o
 h+rUGNnkBECsiCzVCKhKb3hT72emlXi3adSAZaP4oabBTFdGjBd8r2x3t+dfpklTgYu8
 mfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693490292; x=1694095092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FphzdIhXcWGeug1uWLhZXCjTN7COEKVkyEuBROmgYjs=;
 b=gAJ/RUR86byW4O4tSqbuDIYrdFRBlWbcHVJV5jqFIS35A0XetBR/CRCKZm4zOX1TfF
 0JYWvI22JwuG0R6dQp/bRFDhHp7zatPGgnyE2qM5DaYU0Ftg2Ofv2XLIk4B7OkWpmk0K
 tAR0knmlz7i5Mw7W8Dz55p+O0IoqJugTQGhjcCGDfZ3o4kdnPdjclGbIt2vIFQkmpbFi
 ontxQYhOqEzN624gh//A4GAADbbus4vlyiWpEH+0Tgww5GgD30gUQCIHbHhl+i9ou7nz
 h47DXT4+s8TsZTW5BrmZRdC0MnIR1ogQgxGGof8hK+C+xWY+W8N0wFczJ70bTM4Wey8B
 LvCA==
X-Gm-Message-State: AOJu0Yx5kecooYG21Nt8kVHaYPkY/F8ZHHCQoXyQ3r2RAav5jc6q38G1
 2RxPFVstYrUXmv9hv2zbAnyG2A==
X-Google-Smtp-Source: AGHT+IEIuoHWICu/DvA/gtWCzY7E3QgSvV8ZSM5/qXXifFaHGcL6CgpKBSTcRJbE4N5w++Cy1dnhsA==
X-Received: by 2002:a05:6512:34c1:b0:500:ac0b:8d52 with SMTP id
 w1-20020a05651234c100b00500ac0b8d52mr3581663lfr.7.1693490292505; 
 Thu, 31 Aug 2023 06:58:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 gu18-20020a170906f29200b0098f99048053sm800364ejb.148.2023.08.31.06.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:58:12 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:58:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 19/20] target/riscv/cpu.c: honor user choice in
 cpu_cfg_ext_auto_update()
Message-ID: <20230831-6f6003f2a9624ed0ae68a3b6@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-20-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-20-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x132.google.com
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

On Thu, Aug 24, 2023 at 07:14:39PM -0300, Daniel Henrique Barboza wrote:
> Add a new cpu_cfg_ext_is_user_set() helper to check if an extension was
> set by the user in the command line. Use it inside
> cpu_cfg_ext_auto_update() to verify if the user set a certain extension
> and, if that's the case, do not change its value.
> 
> This will make us honor user choice instead of overwriting the values.
> Users will then be informed whether they're using an incompatible set of
> extensions instead of QEMU setting a magic value that works.
> 
> For example, we'll now error out if the user explictly set 'zce' to true
> and 'zca' to false:
> 
> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,zce=true,zca=false -nographic
> qemu-system-riscv64: Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca extension
> 
> This didn't happen before because we were enabling 'zca' if 'zce' was enabled
> regardless if the user explictly set 'zca' to false.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ae8c35402f..e07b2c73e7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -196,6 +196,12 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>      return PRIV_VERSION_1_10_0;
>  }
>  
> +static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
> +{
> +    return g_hash_table_contains(multi_ext_user_opts,
> +                                 GUINT_TO_POINTER(ext_offset));
> +}
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -207,6 +213,10 @@ static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>          return;
>      }
>  
> +    if (cpu_cfg_ext_is_user_set(ext_offset)) {
> +        return;
> +    }
> +
>      if (value && env->priv_ver != PRIV_VERSION_LATEST) {
>          /* Do not enable it if priv_ver is older than min_version */
>          min_version = cpu_cfg_ext_get_min_version(ext_offset);
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

