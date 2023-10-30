Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B280DC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 17:31:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxW6R-0002IL-6l; Mon, 30 Oct 2023 13:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW6O-0002HJ-I3
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:31:00 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxW6M-0006vw-MQ
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 13:31:00 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-59e88a28b98so41841367b3.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Oct 2023 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698687057; x=1699291857; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=735amcmvWg1r7ncUHPHGkBpcoxzth24AzgGChd2tVKg=;
 b=J5b8zl1QOW6Wt5qmL88svBaB0gsBqmNjGYiBDuO5btwoLC7AcfYM0SJRSgMhQSdWL3
 BZHDEirzEo0Wq9y/Y2CfwhJATjxWiN3G1eQaR63ZPLc26JAyNskb6QWVhNREUDnmQvnF
 xsYEU+VqrimOjgaK9/azC2pVu7NwbD7L1d7MX+SCEUFqbiaBgmVg26Mu4E4WlSlzbFyI
 QLfapKkGx37yFB2w4lCPRnJjuveYOcPgqMrazBHLc3ONP6N5GRpNZdfTnCmI4LtsU3Si
 iOH8a3REXSMUqfsQIyY2nZg6/tSyKVkT6Oj+EqZJLjgDSzMGnCfYYzXIS5wvgfsPZAMs
 ueIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698687057; x=1699291857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=735amcmvWg1r7ncUHPHGkBpcoxzth24AzgGChd2tVKg=;
 b=m6+O1GpfowUIsaIN8pI2Fp2xcMwFu5H9Fa9/qr5Ype7k18Z6HymL/SAowoBZCl576K
 Ub3ieiRb9RCuNE83mhV21tAdGU0IL4MKcSrhldKXAUhPlUrOeQnyp9WzP2CxN6jZ56Fp
 fN8az/5UnVwGZWOoroKCo2wfvnKhDd47YQ4mwGn/AK+4fLlNUQmSLZFBqB0kMj6/zK2m
 MP6TjynIddUNd8PBNVj6d/XHkeNGfufGcLE6V4d2WYqcqPXM5YSdgh5BF4IuVPeI3IRd
 QDX4sLh9AuxWMDDzBX2078VCGIAxROTe7yAQ5U98bXtoh+yA7Ti55ieMlN2Nsq+iny/e
 URAw==
X-Gm-Message-State: AOJu0Yw2ty3FAJ0/cewIAwlUmK18dyuyiwIKXrJsl+gnJ2MTQKCeyZ8n
 OpgQV+AJ+Z/x2u+qZdz3HrRuMA==
X-Google-Smtp-Source: AGHT+IHn+Gw0+wh5LgUq8NxAVPPdHOEc48GeyQg6sLJ5xNrZOP3xXUJkgfKIfMTB/Im263qxxLc69Q==
X-Received: by 2002:a81:4cd8:0:b0:5a7:c00b:dc70 with SMTP id
 z207-20020a814cd8000000b005a7c00bdc70mr302615ywa.1.1698687057372; 
 Mon, 30 Oct 2023 10:30:57 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a81be17000000b005b03d703564sm3915791ywn.137.2023.10.30.10.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 10:30:57 -0700 (PDT)
Message-ID: <61c23779-4586-4fff-aff3-f533d9e3d096@ventanamicro.com>
Date: Mon, 30 Oct 2023 14:30:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] target/riscv: Expose Zvks[c|g] extnesion
 properties
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-10-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231026151828.754279-10-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112b.google.com
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



On 10/26/23 12:18, Max Chou wrote:
> Expose the properties of ShangMi Algorithm Suite related extensions
> (Zvks, Zvksc, Zvksg).
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8eae8d3e59c..1709df76a9b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -133,7 +133,10 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvkng, PRIV_VERSION_1_12_0, ext_zvkng),
>       ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
>       ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
> +    ISA_EXT_DATA_ENTRY(zvks, PRIV_VERSION_1_12_0, ext_zvks),
> +    ISA_EXT_DATA_ENTRY(zvksc, PRIV_VERSION_1_12_0, ext_zvksc),
>       ISA_EXT_DATA_ENTRY(zvksed, PRIV_VERSION_1_12_0, ext_zvksed),
> +    ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
>       ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
>       ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
> @@ -1385,6 +1388,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
>       MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
>       MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
> +    MULTI_EXT_CFG_BOOL("x-zvks", ext_zvks, false),
> +    MULTI_EXT_CFG_BOOL("x-zvksc", ext_zvksc, false),
> +    MULTI_EXT_CFG_BOOL("x-zvksg", ext_zvksg, false),
>   
>       DEFINE_PROP_END_OF_LIST(),
>   };

