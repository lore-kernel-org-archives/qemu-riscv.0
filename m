Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224DCEB64DC
	for <qemu-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 12:21:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFZbP-0001e3-Cn; Sat, 01 Jul 2023 08:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFZbN-0001cN-3X
 for qemu-riscv@nongnu.org; Sat, 01 Jul 2023 08:21:22 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFZbL-0000Ux-CW
 for qemu-riscv@nongnu.org; Sat, 01 Jul 2023 08:21:20 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-560b56b638eso1821829eaf.0
 for <qemu-riscv@nongnu.org>; Sat, 01 Jul 2023 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688214078; x=1690806078;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltR6+btn7qx3Uz8ohgVMmphmZWsSINbZLSIpu3GrlVc=;
 b=QKtIujCZYmi2UWcXOUykOT9zudoXzwAXxiTNzdQzAcstV+GATdu1zF2eiVsQkTiuQB
 xl6vVVKEoBB4up9kUnm+K6lm1Hdua3wB+DhomxGvRQQbs1/3EoHR6Jf+jcFlQfRbpcW2
 AhEmlGN4RxKqaHMxxexaTopEuQTcmIaP0PDIhnLffPL5BQl158o5LvjXNqytpR3J3Ju+
 OkzgwiuIIaU/lh1cp47AbWqeEAHlZvOLZ8YvfkNPvoQHwcj0hAggIX9HxYvGaiXvrnVp
 Tc0x2strjZ4y5D2JuxO9IJO/msmizR6J+Q5567kNP6fqX3tR5ofgaPE5EU1ZQ4SrrgYa
 cQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688214078; x=1690806078;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ltR6+btn7qx3Uz8ohgVMmphmZWsSINbZLSIpu3GrlVc=;
 b=W9j5NQGSM1hxbiCMctw6tjz+qzhLSFekEZyndyYkCfLCv/DkSOHq2pEgYiHg9dla+K
 n3bTbLltGYLi+HNpvgCrYRNaW29HcanzqGha6T3PC7rjvVTYqS3oTsl3z08TXA29ax0J
 1PHP7IlmAOErpEsx++VDvWVK0ijaH+IHACoTsp23yFhQ2rBcoKa3H+ELYcjKPICYtzm+
 01Smq6dmjcuHgTDbSUVj2KttDzxIgzfkFWJ4hzK+wp94CXL2OsNaoaUH09IbMIzMv41s
 Ty1PI7000nADYNIgbTOJtyZgtqN8k/L5VNS/ogMX3ReKsWErOPuBQmr7MlkI+f/C4fzM
 Bybg==
X-Gm-Message-State: AC+VfDwNkfAuVGQcL5oKC7HsF3y+w8K8dbt6KXm/aL682x0+NlsUxQi5
 CIGyXZV4SS5kLyEIjUiZrIFJIg==
X-Google-Smtp-Source: ACHHUZ7MXqbQRymr5DpGuBv90qduhgdCoWPqbCfvIS6sGI0gR5pMQrlGaJHzNyVg0C+KVY7kXNGOew==
X-Received: by 2002:a4a:52cc:0:b0:563:350a:e099 with SMTP id
 d195-20020a4a52cc000000b00563350ae099mr3277585oob.1.1688214077870; 
 Sat, 01 Jul 2023 05:21:17 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 c7-20020a4ad8c7000000b00562f3936c01sm3450951oov.45.2023.07.01.05.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 05:21:17 -0700 (PDT)
Message-ID: <92f481fa-fbe7-ac66-6a4c-89abc0457792@ventanamicro.com>
Date: Sat, 1 Jul 2023 09:21:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH] target/riscv: Add Zihintntl extension ISA string to
 DTS
Content-Language: en-US
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230627092631.22286-1-jason.chien@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230627092631.22286-1-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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



On 6/27/23 06:26, Jason Chien wrote:
> RVA23 Profiles states:
> The RVA23 profiles are intended to be used for 64-bit application
> processors that will run rich OS stacks from standard binary OS
> distributions and with a substantial number of third-party binary user
> applications that will be supported over a considerable length of time
> in the field.
> 
> The chapter 4 of the unprivileged spec introduces the Zihintntl extension
> and Zihintntl is a mandatory extension presented in RVA23 Profiles, whose
> targeting software stacks includes Linux. Thus the DTS should contain
> the Zihintntl ISA string in order to pass to Linux.
> 
> The unprivileged spec states:
> Like any HINTs, these instructions may be freely ignored. Hence, although
> they are described in terms of cache-based memory hierarchies, they do not
> mandate the provision of caches.
> 
> These instructions are encoded with used opcode, which QEMU already
> supports, and QEMU does not emulate cache, therefore we just need to add
> a new property for the extension.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>   target/riscv/cpu.c     | 2 ++
>   target/riscv/cpu_cfg.h | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..aa99781f17 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -81,6 +81,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>       ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>       ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> +    ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>       ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
>       ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>       ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
> @@ -1598,6 +1599,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zihintntl", RISCVCPU, cfg.ext_zihintntl, false),

IIUC we want to add the possibility of enabling zihintntl (and add it to riscv,isa
DT) because it's mandatory for RVA23. And zihintntl can be considered a no-op (i.e.
can be enabled at will) because (1) we don't emulate cache and (2) applications

If that's the case, I'd say to make it default to 'true' then. It would be one less
extension to worry about to enable the RVA23 profile in QEMU. Thanks,


Daniel


>       DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
>       DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
>       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..c7da2facef 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -66,6 +66,7 @@ struct RISCVCPUConfig {
>       bool ext_icbom;
>       bool ext_icboz;
>       bool ext_zicond;
> +    bool ext_zihintntl;
>       bool ext_zihintpause;
>       bool ext_smstateen;
>       bool ext_sstc;

