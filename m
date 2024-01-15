Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC9BC47258
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 22:34:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVX3-0001P7-Lb; Mon, 15 Jan 2024 17:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVWw-0001Np-9l
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:34:07 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVWu-0007SV-LN
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 17:34:06 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d542701796so47860745ad.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 14:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705358043; x=1705962843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DTkAivCuD0DfeRNB96V/DsWva2aPG7hLD46T4T7sevc=;
 b=hRCEXBruNjlvWJDAJ2X6neMnAd/jBE5dDfmqg2Mwgz40dbEUSBEuYFFVj+OUiQYyv5
 lw7dde8UVD0LeHJx1leb7vwml/mGi6Ti0hrnwihvITblIbWet8DtGwnGRMj9/WjH7OL7
 xnz/4gQIle1AJO7ehcTTnv0LG0TOQmbe3JKxVHFBjEntZUuQiTBhla9RsZdUMDoDVLCt
 cBb/TTpgfA38p+ig8KUawMbjeHaANmjZbSXVLtzEPBLB4jaI2/l5LlTkKyh466Iqe31T
 AZVCeeEOChS+D6tGGhgEUmuBUJrDCIst6yHSjUBb5i5QA5DCMk+I3Vhfr7CRg3msXvfn
 IYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705358043; x=1705962843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DTkAivCuD0DfeRNB96V/DsWva2aPG7hLD46T4T7sevc=;
 b=MKSq5VvZ8TO7rXevTzIHvu0t3Q9l7Wv3LSeXLjXSn4rZHGZJRI/E+k0B958EH5pUZg
 PgiyUZmwaA/BFbVCGQna+IobZaQnuXIJuoKrkyuOoOL4XAeJlV0a0roJgH2+FtrAC6k3
 C7///cSAEsGOeOWmjEzUVfqHu2EeJ+VuCeVEzVzncvuAGfB01YJpfSEBOmj0pfHEpDAO
 U+SVCkGFupJp4Y/CXbaiYwTxiPjiBi3yFVH1+JUw+i24hskikTf69Aq1EwngWiW/UYx8
 Uwstb+7PsNBvFcVyxPuLQuZJofb5T1WXzAuHN5pTvrGZQKIFGSVb9kupzQwFbBtS+xKH
 bcnQ==
X-Gm-Message-State: AOJu0YwcsJn9qlTwHNeOPOegxrhoLf4BfuUrpBtjeoneGLWxPmzSBYVH
 zW73V/BzadIweyy04BNgPKD1DACnEjZvjQ==
X-Google-Smtp-Source: AGHT+IHeOACsTR/DqaSBJ4MSbaAdv2b9ZSQqq1r/OcJx2j3o9XJhChG/imaCsMYQlW3HwxYYG+ncuA==
X-Received: by 2002:a17:903:40d1:b0:1d4:20b8:abf9 with SMTP id
 t17-20020a17090340d100b001d420b8abf9mr3459296pld.54.1705358042073; 
 Mon, 15 Jan 2024 14:34:02 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a170902f1d100b001d54c6f5ac5sm8104235plc.263.2024.01.15.14.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 14:34:01 -0800 (PST)
Message-ID: <895f5218-00b5-48ca-adeb-e3a6efd112a1@linaro.org>
Date: Tue, 16 Jan 2024 09:33:54 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] target/riscv: add 'vlenb' field in cpu->cfg
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-2-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 1/16/24 09:25, Daniel Henrique Barboza wrote:
> Our usage of 'vlenb' is overwhelming superior than the use of 'vlen'.
> We're using 'vlenb' most of the time, having to do 'vlen >> 3' or
> 'vlen / 8' in every instance.
> 
> In hindsight we would be better if the 'vlenb' property  was introduced
> instead of 'vlen'. That's not what happened, and now we can't easily get
> rid of it due to user scripts all around. What we can do, however, is to
> change our internal representation to use 'vlenb'.
> 
> Add a 'vlenb' field in cpu->cfg. It'll be set via the existing 'vlen'
> property, i.e. setting 'vlen' will also set 'vlenb'.
> 
> We'll replace all 'vlen >> 3' code to use 'vlenb' directly. Start with
> the single instance we have in target/riscv/cpu.c.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c     | 4 +++-
>   target/riscv/cpu_cfg.h | 1 +
>   2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

