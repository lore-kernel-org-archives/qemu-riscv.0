Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B167C48285
	for <qemu-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 05:08:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rV2pO-0002ej-RY; Wed, 31 Jan 2024 00:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rV2pF-0002c9-Cm
 for qemu-riscv@nongnu.org; Wed, 31 Jan 2024 00:07:53 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rV2pA-00063t-PV
 for qemu-riscv@nongnu.org; Wed, 31 Jan 2024 00:07:53 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-59a27fbe832so1347365eaf.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jan 2024 21:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706677667; x=1707282467; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MG5Ys6VqdBDLg4Cr1tHR48qVp8In8DNSM58ZrBjpRlQ=;
 b=nVUypv/hzwX1Xyt4LYRzpmoUEQieCytl+rVxjha4NnyEDU2v46SZ0ShHmIqPRJbm+8
 9m1T/IDmMfN+hfIenMRG76boGq7YlZfHeswwBcIc7CPkAT4fKraaTsBxgJ+AF+oMplId
 RWXHhOllkvKSP1SPqCMs7YRCv6z7I1c4KD8jOp6/kwHYSpXI7G/79AU1UH/OKU0Kx1Jx
 ZJmKe7Iw16+3mt7Z7u8QSVpUXWb/+O3rs1VhOr4TgwrhIKP8GXaKNEgZwszQmvrmoTjN
 ACks2mZ4ZDtp9+3fLawK3iZF4/06bTN9pz9vOdNFXKIYFh318cqzDg1CGdrpAqZqKiFm
 95EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706677667; x=1707282467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MG5Ys6VqdBDLg4Cr1tHR48qVp8In8DNSM58ZrBjpRlQ=;
 b=sDvPrDgrz8+0UQelN7SulIlHa4CfHAt7bI3Obo//FgkKGXkmFZ3MH+2OaPgHajDvVX
 JM4m5Kro8e+pZHpB9relrvuZ60YEXBiRJX1wyeqA3gVq8emXYrbPWpC2F7CUaTFMV5J8
 c6/0ZkXeHR18rSw0M0KC0k4N6nbP7HyqvKPB87R2+LmXlRln+gkjYzZnOR4ssiVQiWaa
 t/Wbs54z6aPpWe5m2tbr0WuRreapjhuZk9uxD457Lwad+/cMrrWOZ/1nVd2wksOR7ZyV
 tdZwkWrT0nv+1KjF+6oISjbLFVTqeMnAy/42LiDQgyRQDwDG+4GxPjg8aBtqNShFdk/l
 ho9w==
X-Gm-Message-State: AOJu0YzDwMaSbyGJ7o1baN2UXy0PTTdXl+Jane0KHJhh5O5lmhLMp5Cm
 0OPGbHyJ13odHbDtp18WI0t67+oWA8+vXSkHnn3XaffGYB7JByohTYgwZOgHClU=
X-Google-Smtp-Source: AGHT+IFMGPzto/z8JNwjuJUxkHiuI/E2JCahnY4H/xQqayUbvJNUdLGxP0fU68AE7UHmvpcDjZE8nw==
X-Received: by 2002:a05:6358:7f14:b0:178:a3ea:bc9 with SMTP id
 p20-20020a0563587f1400b00178a3ea0bc9mr357087rwn.12.1706677667367; 
 Tue, 30 Jan 2024 21:07:47 -0800 (PST)
Received: from [192.168.0.100] ([103.210.27.218])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a63cf13000000b0058ee60f8e4dsm9327821pgg.34.2024.01.30.21.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 21:07:46 -0800 (PST)
Message-ID: <4345f1e4-6588-4f17-975d-b9349b07421c@linaro.org>
Date: Wed, 31 Jan 2024 15:07:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: Support xtheadmaee for thead-c906
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 christoph.muellner@vrull.eu, bjorn@kernel.org
References: <20240130111159.532-1-zhiwei_liu@linux.alibaba.com>
 <20240130111159.532-3-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240130111159.532-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 1/30/24 21:11, LIU Zhiwei wrote:
> +riscv_csr_operations th_csr_ops[CSR_TABLE_SIZE] = {
> +#if !defined(CONFIG_USER_ONLY)
> +    [CSR_TH_MXSTATUS]     = { "th_mxstatus", th_maee_check, read_th_mxstatus,
> +                                                            write_th_mxstatus},
> +#endif /* !CONFIG_USER_ONLY */
> +};

This is clearly the wrong data structure for a single entry in the array.


r~

