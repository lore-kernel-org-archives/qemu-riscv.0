Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5E8CAC599
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 11:47:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uyqcq-0004uz-K7; Wed, 17 Sep 2025 07:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyqXw-0007kJ-T5
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 07:42:02 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyqXo-0000f3-IK
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 07:41:57 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-71d60150590so40751217b3.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Sep 2025 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758109311; x=1758714111; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x47I4/cgEWbO39z5R47gOt18AsZbWJU19CPhN/G1x5I=;
 b=h9PZOpJoym52thmW4EktJea+L3Y6WT9Hd9CP+Bhw10Wh6wR92bjlCosJBTGvMhJi9W
 AoXGlDSqjc6D/W9EWPocJfHlVcyQamyPy6tpQvMeZSYT+v+DYrXAn8Ownz7+NggbyBQZ
 j3nsN+9ucB8uK8i03zjChNIiJc3e9NCcf2yYfnOQPPyxyfQESsVXTFOf13Sa2qUAQ5Wb
 dkrWfb04MJvNUpU5W9WwLJ0iO1Nbl2NCdwqUcChNiG936c48gyli524s34G0IYVX87wt
 QWxA6QyWlUhgR/OKNykGJZsAfu6Zy1/tRmVCpR9esHSVwwz4qUCeTWPTQJCYpZ1lXn9h
 44hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758109311; x=1758714111;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x47I4/cgEWbO39z5R47gOt18AsZbWJU19CPhN/G1x5I=;
 b=o2iiWRsNv1OVe5pgU5NuUpCH/tOUszgY0sZvo9MYLSPuvK9Nlx4QWCXeZlt7Nz78le
 S5NQCzf5d6h08uy37IUSceak3q4inq1cjoo7Fm6ZAj+VBUAuT9tQMs8ww5OWEUEvvPQ/
 I9cp5VEtLTVJcH2vc4AssZcEMBSry7+xxmjghMv82F+Cb8i1OUFe/rr/jGHnh7M6WZDJ
 GZPb6cAnEflfxdJq15S5AYById67s4FR+6alJ81O7Su4xkEFM3U8QQErGRQh2qj/mNi4
 lP0Ks9AzAWAPN3ctwHHtT06n4+MrM6ofPu5FhewEpR6PuHy01QpfQn1qySJpS4ZJbsfB
 uKYw==
X-Gm-Message-State: AOJu0YxCA+w52RKOi/fVJTI99E557XzQeZBb4D7xp6jZ1QXVXcqFR7vz
 WeCuDZScX5r9eh2b0UuSRMHLAwm9N0g/f/F0KGnVruo3ZUfuzq64GAvVyE+XuhYIdbY=
X-Gm-Gg: ASbGnctEa7bEalpRvSyCc39EVAfgx4fnFworpyyVi4JpYBfSuc6p8cxq3qGc1ahs4PS
 IIHGtOFLj+1UrBRB0owBRL+dWZfkDvDBauO7R2WAPtTvC8Rf4DlB+LWA8JkUQB31WnZQSiRhASZ
 eO6vI/EAwzTovpVgpuaBQ2SqrdrrBAjt0910A5BN+YcbffNxghzjfuchBphYQ2j6Kx47h8e5Rnt
 Yuyh1WlPYcf/OALc75ejRzXPo2rpQIlBDeAez4N8yoNMwtboAV9l1GjKdQRrFG05+LkigJVNDXp
 PWnNJNBWArvPwNFCBrSOI4pfsIPGcZV1xYlO8RoaQUZNy8RkWjUtqDCSrVPW8N7MMHHi8tYwzGi
 vPyzSG7bcLgqG9yH8X1WnEoLKXrz2FKWQtHU4ewqtFivthoNIdud8/ZmVOqnWbLaMj7nXDKNRdq
 1P
X-Google-Smtp-Source: AGHT+IEAfGiJF/lHTGxMYp+1G4eOYxdLdSPpGPCI3j7dktsOmm2k37kgvP+7kIg9wGEmi6secq5EGA==
X-Received: by 2002:a05:690c:380e:b0:723:bf47:96f8 with SMTP id
 00721157ae682-73892a555bfmr14712207b3.53.1758109311143; 
 Wed, 17 Sep 2025 04:41:51 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:ba1a:8719:7c4c:526a:fdea?
 ([2804:7f0:bcc0:ba1a:8719:7c4c:526a:fdea])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f796974f9sm46518067b3.53.2025.09.17.04.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 04:41:50 -0700 (PDT)
Message-ID: <c8c84363-2430-4e07-9bb0-b5e7ea2c51cf@ventanamicro.com>
Date: Wed, 17 Sep 2025 08:41:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] target/riscv: Enable SMMPT extension
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, Huang Tao <eric.huang@linux.alibaba.com>,
 TANG Tiancheng <lyndra@linux.alibaba.com>
References: <20250909132533.32205-1-zhiwei_liu@linux.alibaba.com>
 <20250909132533.32205-6-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250909132533.32205-6-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112f.google.com
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



On 9/9/25 10:25 AM, LIU Zhiwei wrote:
> Co-authored-by: Huang Tao <eric.huang@linux.alibaba.com>
> Co-authored-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf462..eea0942cf5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -204,7 +204,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(smdbltrp, PRIV_VERSION_1_13_0, ext_smdbltrp),
>       ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>       ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
> +    ISA_EXT_DATA_ENTRY(smsdid, PRIV_VERSION_1_13_0, ext_smsdid),
>       ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_13_0, ext_smmpm),
> +    ISA_EXT_DATA_ENTRY(smmpt, PRIV_VERSION_1_13_0, ext_smmpt),

smmpt should be before smsdid. The ordering of Z extensions has that weird priority
ordering, but S extensions should be ordered alphabetically.

Yes, there are some extensions that are already out of order (smmpm, smnpm ...). We'll
have to patch them back to order in a separated patch, but for now let's not add to the
problem hehe


Thanks,

Daniel

>       ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_13_0, ext_smnpm),
>       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
> @@ -1279,6 +1281,8 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("smmpm", ext_smmpm, false),
>       MULTI_EXT_CFG_BOOL("smnpm", ext_smnpm, false),
>       MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
> +    MULTI_EXT_CFG_BOOL("smsdid", ext_smsdid, false),
> +    MULTI_EXT_CFG_BOOL("smmpt", ext_smmpt, false),
>       MULTI_EXT_CFG_BOOL("ssaia", ext_ssaia, false),
>       MULTI_EXT_CFG_BOOL("ssdbltrp", ext_ssdbltrp, false),
>       MULTI_EXT_CFG_BOOL("svade", ext_svade, false),


