Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F1D3ABEB
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 18:34:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tAZEn-0006hE-1p; Mon, 11 Nov 2024 13:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tAZEk-0006WO-W7
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2024 13:34:07 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tAZEe-00081Y-E4
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2024 13:34:02 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7242f559a9fso1941096b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Nov 2024 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731350038; x=1731954838; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ps+aUhNHNtcwV3mHatejeZgAw1aj439mI5fZQMw/vq4=;
 b=M6Zv0vAlWh+kMS2dF71N9XMutPXrJv475GbWiDcg94L3mafYuM37QINeKGBBn5Fzsr
 lzl5p+WtrpUIKVVDFGSpzm5TPG1JWncyNe2zXq6cvtDCc9DUwCAjo2tw4sTNkgTToM7T
 NKYXtZ/1wS5TTtGoEUBXh6Ce9CijEXKYUQ3PxnWTTCXYY/IobCrbKQDWlVHRiCDPVe71
 hlaOAksLbjN2o39fQ75cui4y1tlmhLZeXO/V41YjIrWhw9iLyJCWFqJBoF++albNpOfX
 OewoAXWZ6fPkvE5emGtpba+jVjIBGqKH7ULGMFcWD6ra8NcKruTwCWHSaSnK1GgMQEBD
 BgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731350038; x=1731954838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ps+aUhNHNtcwV3mHatejeZgAw1aj439mI5fZQMw/vq4=;
 b=vB38aeVNEB1l/LWd7F71X5T55xUaStGqCTxTp6UmgPLv1FIFlOPOJwQYvgIvC8lURA
 Z8P/TaWG4e0AN0Fw2o7bfQl6ZIzrdtXre27Ni5tLRmTwmb1LUnZtCyF7FjtbIVHnFbwS
 uT/SysGWP9zGv6+/LNjspy2b36NB/rQ23PLbiZnpNsvp/lwyphsZ/LM17I7G0oYRwKNG
 b7zNZhjh8aTHqZXuJJkHIxYTbCrl8rrILsysxyIQvMvu6yJJZnEaiCd9fOuul4nNhyQA
 +5AZB+lu0pbbCzWJIjAvTt4bt0+h0EPJnrshmsm9XqyTsozj7rnEyWphxdnXjIrILcmO
 wMSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhv9CtLYtRpYHAJHNn+SLu53JQ4DLiAL9B8uNRDni6qke1LlDb3LwfjmHpJ9gs4Q6KH6h/3I/zNfv8@nongnu.org
X-Gm-Message-State: AOJu0YyMfbgtB/P5OSv8lFVw3RCJSOfDmB0q1AiBvWJCWNPB93IpM6ob
 BRMINuFCCZchNc5VvrcR8n6XAfUrvP+t3jtgmx+cJBO9BFg6ugusVJkZ2LspCo0=
X-Google-Smtp-Source: AGHT+IESv4nR+U9fWiaYiZ6Tv83b2RhRO0wRJGYkeqvfxb5X10sqreKedvDRddqtNe+Wro3apX0i/A==
X-Received: by 2002:a05:6a00:80c:b0:71e:68ae:aaed with SMTP id
 d2e1a72fcca58-7241325f63fmr17337342b3a.1.1731350038594; 
 Mon, 11 Nov 2024 10:33:58 -0800 (PST)
Received: from [192.168.68.110] ([189.79.22.174])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724079aa862sm9420218b3a.115.2024.11.11.10.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 10:33:58 -0800 (PST)
Message-ID: <39b5cf42-4b35-4c69-825c-e813c55577f3@ventanamicro.com>
Date: Mon, 11 Nov 2024 15:33:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] target/riscv: Expose svukte ISA extension
To: "Fea.Wang" <fea.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Frank Chang <frank.chang@sifive.com>, Jim Shu <jim.shu@sifive.com>
References: <20241108085239.2927152-1-fea.wang@sifive.com>
 <20241108085239.2927152-6-fea.wang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241108085239.2927152-6-fea.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
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



On 11/8/24 5:52 AM, Fea.Wang wrote:
> Add "svukte" in the ISA string when svukte extension is enabled.
> 
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>   target/riscv/cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f219f0c3b5..69187c9aa1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -200,6 +200,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
>       ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
> +    ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),

We need to stick with the riscv,isa order, i.e. svukte must go before
svvptc:


>       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
>       ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),



Thanks,

Daniel


>       ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>       ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
>       ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> @@ -1595,6 +1596,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>   
>   /* These are experimental so mark with 'x-' */
>   const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
> +    MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

