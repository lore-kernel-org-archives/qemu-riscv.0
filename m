Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDBAC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 14:35:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxTMM-0007Mf-7T; Mon, 30 Oct 2023 10:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxTMK-0007Lj-EW
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 10:35:16 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxTMJ-0000eb-1f
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 10:35:16 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5af6c445e9eso35154147b3.0
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698676513; x=1699281313; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9zls2XYg34++odTDgW88xdHfCtE7XCdbuUvZmXzrGWE=;
 b=IOkXNkMwX4pYIYQcmpQgn0T12lObYatxOBUE5K6PkJJdd8o5ohqAhD//L46IDRscxa
 bXzNsncWMZ+/57ikhtYPNgImCg0iGTx/Msg0CuCzIq+nVwyFCQlvvnkPgX2aE7M2ivk8
 JV2olYzf1KeRPzh5KKqWRLIKahu8Czqas0LomknQql3I+52cjV3XieSCpfwUhHOx2VvE
 1tr5xWz7EdFSkG+YUQxdTLxMg44B9Vd08Df+wpv+y8sPV/KOik2SDzbPoxyzAs9MDM73
 XYPdMPcqMm5UdzNJyPIQWrlrR2GtI80kxEu/A5ysituR7i0UBtFJTTyVbGDvYi/Br3Sq
 9Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698676513; x=1699281313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9zls2XYg34++odTDgW88xdHfCtE7XCdbuUvZmXzrGWE=;
 b=OT5t4hPQQJuzSWqyAp5jZixsjjzpPT85BE8DWIjOxZhtPmkv+MyLopIR5on7AC1G4d
 Hw5TTFCzm/yh/hsxpG4YGkacpl3ln6LnyAEBs36fF1WqDhzy8jzCtBSyKDd39ezRbFuM
 U1gr7ehjYM/+i9oqD+NHgld/HT4BYfhTtEi32HLqwfbEQm8bdiQuVKUV/8H+podSPB03
 D729RyEmruf609nJfsoR0ppOkkikQtYCbH+bjnN/+ByKuaqbkMebIjcaD6+uuUXOWRfL
 1Ayd/mItONw2DLxO0ACJCzWdAHTqX/EzKfmLpm2PgUZtFLVoJhcRq8r9Bmzcyig79TjG
 fKwQ==
X-Gm-Message-State: AOJu0YyTII4iTjZeBcYFavDrK8joJhnXCD4UUFKx3PX30Vo+ryMltHm2
 XN8aL6HWtjckLpX3Qc7y9584pg==
X-Google-Smtp-Source: AGHT+IFJDSK21wNwRcrGNq6pNZzmLz5ZVKRq2N6n4sM3BmNvCpJJ36tP8layvxYCwBdeKwfNqUB3Ng==
X-Received: by 2002:a25:9cc8:0:b0:da0:c7f9:9fb6 with SMTP id
 z8-20020a259cc8000000b00da0c7f99fb6mr8476790ybo.62.1698676513630; 
 Mon, 30 Oct 2023 07:35:13 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 j205-20020a2523d6000000b00da05d771097sm3922150ybj.22.2023.10.30.07.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 07:35:13 -0700 (PDT)
Message-ID: <39610bea-064d-44bc-b85c-f4dd1580bb10@ventanamicro.com>
Date: Mon, 30 Oct 2023 11:35:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] target/riscv: Expose Zvkt extension property
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-3-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231026151828.754279-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1134.google.com
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



On 10/26/23 12:18, Max Chou wrote:
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a2881bfa383..5099c786415 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -131,6 +131,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
>       ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
>       ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
> +    ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> @@ -1375,6 +1376,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
>       MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
>       MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
> +    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
>   
>       DEFINE_PROP_END_OF_LIST(),
>   };

