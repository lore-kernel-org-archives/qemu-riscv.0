Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C23C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 22:48:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdFL6-0000pk-6j; Fri, 26 Jun 2026 18:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wdFL4-0000pP-Md
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 18:47:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wdFL3-0005dV-44
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 18:47:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2c7ee3952ebso17209185ad.0
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 15:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782514075; x=1783118875; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dNoPrVlXgnvQFCCzTx9Vr2JquZWaWIwWXQPiTp4QFMs=;
 b=t+Bwq6FspOGbvVLHyyv/033QzVqYQqoirhg7enz6d3S8iMhIrBgSFCxvCc67LJsxJD
 1rf1CWvVHi7b86FMqV521doBTkCFnNxr+fV+olK/weMaIr7JMYeXPMWo//DcM4Uknn4z
 +ok3B6H6O0+3FtX3QNAFfFlOks6iU3u0/zk1YJ9nTECGy6dxK0w2eaGCnPaJU6isob1D
 UAEWPDn0Rcy59w+2zTOvOGTy87oDvg9eo8CejoUzMYlEkR9sVeZ4xsu5ag+gRaKflU6H
 Z+zWgQ5ORcn26aQYyjcPa1/agFS1WZlkk/M1+K4bKqFnzXJst1EI98nKQuBLDwgM9+lI
 TozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782514075; x=1783118875;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dNoPrVlXgnvQFCCzTx9Vr2JquZWaWIwWXQPiTp4QFMs=;
 b=aVp1KNPYkIE+lUO6leHZIS2XdrtpMlqCS4EHpzwAHPf7omUut3t6Th5lSvq1ns6qhJ
 jnlnT+lf3ovi+EHJqy6tzF12ztc2yfGIbkfiyUv7viMUFSWgoS1/wx0nyKys+rVXUelk
 1A1Ym2dsSe8tkqUybejE5xpONuUXjVXrVX5duuyI/MrUlpTnCQg7wHhmiDyi64EzOCs/
 Z1bdhW++FUo5/7oZHs7HsbgFL7ZIdYQ69OrsRyUen89BHlA5v6bpQaZ5XkrWuRjLU9zf
 RuNT5XWY5YbZ/h71C2EOMDtIH+pKy+F8yjHHJAhIm1q89ZFJrhVXZtzl5O5ALZAWjQyH
 bh4g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqVFgg+N8eVStw6whx0b4Nscr8YWaFMWwnacs39ZPBr+n6MOVZqNe2AP7bT7V1Bq5luKJ7RSHUgODjO@nongnu.org
X-Gm-Message-State: AOJu0YxYZe358366xX5SCzkchn+43mAnlznylI3NcIhymL09Wy1EqpQO
 1M0GbBjKg9LUMH7QHRnYLASvLaZ4FmAtoug1OtSS2nHjiwhJA4dQOJZhfTXAMyipxEg=
X-Gm-Gg: AfdE7cmGMCyz2TYZ7f1tSA566R+LSjLAdpAyRIgSc7a4qlD4ulDpqhfc+MsG/+gucFe
 jFP6yKHgxrum+1U+TNTD64WQqu0k3unap/hE+6bQjRIjnevSf3VEV3sEZXvC7uU26EgUHoapne0
 kL9tXbzuh+fq8hNyprA9e5PhoYmBwnUU5a6FXG8Jsk+MCtdcFSBjXmO2rIIwllu1n7u6QlwC2nx
 1SKxFcltwA6L3DW1nK/OkYq3n7SZm047I8yQWbKU16wI2iavgjmMZkvsi1kygtatQJqOogFhAWD
 SI7sjYVoOpPLQB9zrBG0bmhQ/OcenzEEBtizIv8SEZIFwNTOsxmS2K1dac2xv7aMd8SdzVhnVdJ
 aV/KI1jNKLw7twvFdwEeYkLl/V1D2FQZE/3Mx4CPeCbvNseGRKc37iyZqa6By6BKWu/Vb8G4SX0
 iMUwM8RnDl/UCZLXUk2EUF1AusYN0LaLiDvBB93MnzuKaa01jyaris7pPELg==
X-Received: by 2002:a17:902:e890:b0:2c1:77cd:fb0b with SMTP id
 d9443c01a7336-2c7fc9ced36mr92404975ad.37.1782514074929; 
 Fri, 26 Jun 2026 15:47:54 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f6518bb1sm46555355ad.84.2026.06.26.15.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 15:47:54 -0700 (PDT)
Message-ID: <c25526b6-885f-4c13-b4e2-ef423d2feffe@linaro.org>
Date: Fri, 26 Jun 2026 15:47:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] disas/riscv: Fix 6-bit immediate extraction
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
References: <20260626-b4-disas-xthead-fix-riscv-next-v1-0-74228a3c1b21@linux.alibaba.com>
 <20260626-b4-disas-xthead-fix-riscv-next-v1-2-74228a3c1b21@linux.alibaba.com>
 <1d9f53ca-4dbc-4d64-9811-17bf0328cb3a@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <1d9f53ca-4dbc-4d64-9811-17bf0328cb3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 6/26/26 13:04, Daniel Henrique Barboza wrote:
> 
> 
> On 6/26/2026 12:13 AM, TANG Tiancheng wrote:
>> rv_codec_r2_imm6 is used for XThead instructions whose 6-bit
>> immediate field is encoded in bits 25:20. The old expression
>> left-shifted by 38 and then right-shifted by 60, so it kept only
>> bits 25:22.
>>
>> Shift right by 58 instead, keeping the existing extraction style while
>> retaining the full bits 25:20 field. This fixes the immediate printed
>> for th.srri and th.tst.
>>
>> Fixes: 318df7238b9f ("disas/riscv: Add support for XThead* instructions")
>> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
> 
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> 
>>   disas/riscv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/disas/riscv.c b/disas/riscv.c
>> index 7f1b26277378c225c963d8f435cc7a2fc6e4a0b8..400a57083f90be18ccd12415797bce0df974784b 
>> 100644
>> --- a/disas/riscv.c
>> +++ b/disas/riscv.c
>> @@ -4546,7 +4546,7 @@ static uint32_t operand_zcmp_rlist(rv_inst inst)
>>   static uint32_t operand_imm6(rv_inst inst)
>>   {
>> -    return (inst << 38) >> 60;
>> +    return (inst << 38) >> 58;
>>   }
>>   static uint32_t operand_imm2(rv_inst inst)
>>
> 
> 

Really, all of these should be using (s)extract32.


r~

