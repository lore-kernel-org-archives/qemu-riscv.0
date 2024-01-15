Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC997C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 17:57:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPRD6-0000WR-Qt; Mon, 15 Jan 2024 12:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPRD0-0000VF-JT
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 12:57:14 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPRCy-0002dl-Uc
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 12:57:14 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-28e0786edb3so2586193a91.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 09:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705341431; x=1705946231; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5RtbApft0G58bwA2B/6afNlY+oUzJ/R3LCmDvugQO5c=;
 b=Mqoup4bbF/hXjJWA9I5rHTwba/5plz9+EmaA8lDLk5Me7PjimpLq25Km65AuUGDtfv
 rlPGOmzxex55eqPKSPX8vfQk2rzmiEE1qTDXUxsJ8rvn9UWU48c3EoiyPHMyEroRB4Tx
 HkH8x3ZS1XUDjC0f3a8pY/lcGBkCgGR8I9NqLYXSijQsHQEGJHhXtQwwrRpiV2sj5t+N
 PRNBcsaH1lVeQwS9t+gXiT+p2sANRJWcxNRdHyNCHZqI1jfRWYraqCpuVQnTFL7CHWkL
 h74oDtGt+DlIpsjZRj4SkCw4k+0311U+r1A0lOI9LBkITjz4UiK7TusvtHvKKdxQtzbk
 KMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705341431; x=1705946231;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5RtbApft0G58bwA2B/6afNlY+oUzJ/R3LCmDvugQO5c=;
 b=XkvlH+muhP25GZ6e7pUNTuFit7JFxemiG8bDKcJ3BIq7MFD4dcutvyPS4Tp2a+M1l7
 nBsnpEAViArJx2gtOE2W25Ji5qa19pNwGcKTQChPKybXV77bMzGmAXxrJGeng1PamURW
 8l6r8JBeAApcvDaz8GDvrYHWmSe+kSBNQUKGc9z4yioxWxCklw6i1u8y3uQrnpFZ7Rcr
 v3rSSMiB7AhlAEc2LqUse7379bhWfMSksamIJog5zeoLzZ/xzp39XCawBbZeh7QhU16Z
 hcVEUSXKvP7u3PkMi/S4G/cuBmdv2NS7D6tyGSx5rrq1VyRGrULiHA/xf/sN4pGL6GAT
 LFLQ==
X-Gm-Message-State: AOJu0YxoOzRvcu7qNnZ56D4u6Bd5Kemg486c5WJy/4ETpQzy9oidf54M
 saJPiXNqb+ehqMazM8S9tkQH9b9WoSqomw==
X-Google-Smtp-Source: AGHT+IE38+tgCd4s66dsdqh21v95XWionNpNurdUKj2eVVtZSuz4LhK0EwlJ3ySE6C9EnZym2IJnVw==
X-Received: by 2002:a17:90a:9c07:b0:28b:f1b3:4426 with SMTP id
 h7-20020a17090a9c0700b0028bf1b34426mr4161874pjp.51.1705341431262; 
 Mon, 15 Jan 2024 09:57:11 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sy8-20020a17090b2d0800b0028dd42b115bsm10102728pjb.5.2024.01.15.09.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 09:57:10 -0800 (PST)
Message-ID: <dbe10a18-163e-4457-92de-68e2f100217b@ventanamicro.com>
Date: Mon, 15 Jan 2024 14:57:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] trans_rvv.c.inc: remove vlmax arg from
 vec_element_loadx()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
 <20240112213812.173521-12-dbarboza@ventanamicro.com>
 <32238550-8008-4771-9a1d-755be8c19384@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <32238550-8008-4771-9a1d-755be8c19384@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1031.google.com
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



On 1/12/24 19:51, Richard Henderson wrote:
> On 1/13/24 08:38, Daniel Henrique Barboza wrote:
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++++++--------
>>   1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
>> index 804cfd6c7f..3782d0fa2f 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -3265,21 +3265,28 @@ static void endian_adjust(TCGv_i32 ofs, int sew)
>>   #endif
>>   }
>> -/* Load idx >= VLMAX ? 0 : vreg[idx] */
>> +/*
>> + * Load idx >= VLMAX ? 0 : vreg[idx]
>> + *
>> + * This function assumes ctx->vl_eq_vlmax = true.
>> + */
>>   static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
>> -                              int vreg, TCGv idx, int vlmax)
>> +                              int vreg, TCGv idx)
> 
> I think removing the cpu configuration constant is a mistake.
> Compile-time constants are always better than computation...

Apparently my commit msg is AWOL ...

The 'vlmax' used in vec_element_loadx() is being calculated here, in trans_vrgather_vx():

-        int scale = s->lmul - (s->sew + 3);
-        int vlmax = s->cfg_ptr->vlen >> -scale;

My idea was to eliminate the use of 'vlen' since, in this block, 'vl_eq_vlmax'
is true and we have 'vl' in the TCG global 'cpu_vl'.

I didn't find a way of reading 'cpu_vl' into an int variable and passing it as
'vlmax' to vec_element_loadx(), but inside vec_element_loadx() we can operate
'cpu_vl' normally since we're using TCG ops there. This is the reasoning behind
this change.

I am now wondering if this is worth the trouble, and we should instead do:

+    int vlmax = cpu->cfg.vlenb >> (s->sew - s->lmul);

Like we're already doing in patch 9. Patch 12 would be a similar case.



Thanks,

Daniel



> 
>> +#ifdef TARGET_RISCV64
>> +    tcg_gen_mov_i64(t_vlmax, cpu_vl);
>> +#else
>> +    tcg_gen_extu_tl_i64(t_vlmax, cpu_vl);
>> +#endif
> 
> That said, no ifdef required -- the second statement should always work.
> 
> 
> 
> r~

