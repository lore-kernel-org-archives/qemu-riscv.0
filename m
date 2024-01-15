Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320A8C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 23:02:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPVye-0004Hk-Aj; Mon, 15 Jan 2024 18:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVyc-0004HV-P4
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 18:02:42 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPVyb-0005YD-9R
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 18:02:42 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6dddb927d02so4566508a34.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 15:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705359758; x=1705964558; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JUtltLrW84pIFq/cyF5AWghdOVowQoE2rwrRHc45v6A=;
 b=tCE0ZNy0yM2uk1YjmvyQgw+ik64xE+lO6HAfvJmNP0T+PfqifZU8xojRozGr813k6n
 Kzi2ENWH+ymTuIMvtzZwP8TAJ0Mz5EMz2sFDkRL6jJnjJUO5p6sA5Q619fgD76Va/GEO
 NylBVy7CHJaWMdgLohR9Nz+sHIVdPVQnT3ldivsGGm3XVlbJr1Kt2rFSTPLrXdQaLNXu
 5bZA84taNEoKEDO11dPwP8X/sQNfkpa+vy5nFT4QxY6qhHh7RWE4FNnAUwzo0tr18G+8
 RbP3AA31uTl7nzlFLxKjJO6NDu8J9aeLa8PzQnhIoo4v/dq4aLskzxNWsvBvLFjpgmhS
 g5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705359758; x=1705964558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JUtltLrW84pIFq/cyF5AWghdOVowQoE2rwrRHc45v6A=;
 b=aNoiR8Iqst52ytQNEtXzjBOlSSq/rdWL0OYSahOpuWRjPHPxyjC0viG9wJucSX+M6r
 S/+7iFL64KBtVkyBpz5Z/7SFkKdgigrWCtvIxBj9hFc3ghA6PVNplyMeCCLciMb59Vkn
 ql9GlVm0tmLHSsFggAzAaxvPQHorqbE9YwHvzvkFSsWvQTA0GOoCf1mWqfipo0/UIg7P
 40Rv+N1X0vWOFB+E5VW8sXrSt510rxmqMTYtXnUJueb2ZJsE6GSD4o7y/vIcMvguos4B
 RqeCBfa7YJ0QZzF3txLD8F+POkSZSqyZoGoJE/A5I4r3ItR36tRWY4PfiOltzrZ6YixI
 PFVQ==
X-Gm-Message-State: AOJu0Ywbq1s6A04D4EQZdXThZdhOTk96V3KmOUOThLLdOQzC2lVB6WA3
 gzWiI15gmxzzUkg+6gAUAz9SpBJ4OFgieg==
X-Google-Smtp-Source: AGHT+IH1HWqoF91ZI6zwLDixn15uqoLrkwb6VN4noHgd7YZj3C/sr/iIOF8MJ/ynklWtpa+oh6+hlg==
X-Received: by 2002:a05:6359:a02:b0:170:17eb:9c45 with SMTP id
 el2-20020a0563590a0200b0017017eb9c45mr5336952rwb.38.1705359758407; 
 Mon, 15 Jan 2024 15:02:38 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 sg2-20020a17090b520200b0028e3dcfaa04sm4184604pjb.35.2024.01.15.15.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 15:02:37 -0800 (PST)
Message-ID: <4c9210bd-51ae-42b4-80d6-fd11c1e684c9@linaro.org>
Date: Tue, 16 Jan 2024 10:02:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] target/riscv/insn_trans/trans_rvv.c.inc: use
 'vlenb' in MAXSZ()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-11-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-11-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Calculate the maximum vector size possible, 'max_sz', which is the size
> in bytes 'vlenb' multiplied by the max value of LMUL (LMUL = 8, when
> s->lmul = 3).
> 
> 'max_sz' is then shifted right by 'scale', expressed as '3 - s->lmul',
> which is clearer than doing 'scale = lmul - 3' and then using '-scale'
> in the shift right.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

