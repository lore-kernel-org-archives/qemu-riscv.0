Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EAFC48BF6
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 22:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rhH2U-0006L1-1T; Mon, 04 Mar 2024 17:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhH2R-0006Kg-FC
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 17:44:03 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhH2P-0000NE-M1
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 17:44:03 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e5c0be115aso2184421b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 14:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709592239; x=1710197039; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d0iV+xolL2unPr+R8/9jnjhqKyzRsT+GapGS1uJLWbc=;
 b=fSHTQ1vscyloR2dVOhYSTSdNgwCMsM0z+CVxj0vn+A6JyA1yXWN/g3KFFbjO/SE07o
 kjwzgf0zV29Q/R0S/SGXXJR6IwfzDSGFXXXxyI2pTGBwTbtjpYPcg8mgZ8XJKzwhiV9m
 uLrIvu6xzx/aZ0/zhlQ2OMsHr/O1HjcMLy/nSTxxS4scmP+rFIKCQ3db5N8i0LrQ8cw/
 5ow5G1pqM1EXCmCSiunoCObUdkW++PEqL4YoNpzlK7FJ7Xu58krqxtm+qncAuQeDjchj
 bDmBElERaDVOXyEgECs5aLSMTXuuy1BvhtO5fscm1+J5gVpvyw5VZjkWa7NrfYF6lYeR
 CwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709592239; x=1710197039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0iV+xolL2unPr+R8/9jnjhqKyzRsT+GapGS1uJLWbc=;
 b=LIWShafDQqYvefbIrPusEblkAvH1SiATTx4DhioApr4IP8mp9V2tlY16wd8xMgrG7D
 4K5po73+Da67eOcyxaDRPR+YUBJpJTqqgEel9GvzXk/4wbrqyeZppQU3KLPTA1Qy1UvH
 V+C6uVif29wp7hGm1/VGA8eO31IQPxZtgqZ6kNn0le1Gbvj8BWwI4yzW1w1DnrrJ6Csp
 32dQhLDMblns2NsMOqtU4axgPVVX7wrC5g6Zal8Ui0JJHo3fCWB56MSHaPM43n541E3s
 by5POpW928Ej+nG/wfgTl9Yf9p/DQFzaP7+B2E0lBcd1US1TzYPeLb+H4r0xxIUXRgTO
 AAyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm8l7ITUf1fGEzSJBzLEkrSkBB33qTFYo125f76XtgY9J8stpLBMyoeYusFmxykQFBdacfZdUkbVqEiU+J7qzXhNeZIa4=
X-Gm-Message-State: AOJu0Yzt6rBxal374ifCcrXeuAkW8LBQTafwoVr9JBbzBleT5Yx0i2iN
 uEeylAqp1N0zjV4xjeHrVnha3wWHBDGPL9/i5AIX0apdF0NH927UL+YCdCFnRuY=
X-Google-Smtp-Source: AGHT+IGGe0hJTwRYP6bgggnBkRPF0mXdkW/U8wh8C0BlDdsSGOdc1EffvD2C/KXDqgmKOZXw4AOhTg==
X-Received: by 2002:aa7:8896:0:b0:6e4:fc2b:5f69 with SMTP id
 z22-20020aa78896000000b006e4fc2b5f69mr12641065pfe.4.1709592238755; 
 Mon, 04 Mar 2024 14:43:58 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 d23-20020aa78697000000b006e484e13454sm7736475pfo.32.2024.03.04.14.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 14:43:58 -0800 (PST)
Message-ID: <5005bee5-34d3-47d6-8420-51559beb0222@linaro.org>
Date: Mon, 4 Mar 2024 12:43:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] disas: introduce no_raw_bytes
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>
References: <20240304191337.3101411-1-alex.bennee@linaro.org>
 <20240304191337.3101411-2-alex.bennee@linaro.org>
 <379f2c3f-9449-47b0-977f-bf07a5b6f88a@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <379f2c3f-9449-47b0-977f-bf07a5b6f88a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 3/4/24 09:26, Helge Deller wrote:
> On 3/4/24 20:13, Alex Bennée wrote:
>> For plugins we don't expect the raw bytes in the disassembly. We
>> already deal with this by hand crafting our capstone call but for
>> other diassemblers we need a flag.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   include/disas/dis-asm.h | 7 +++++++
>>   disas/disas.c           | 1 +
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
>> index 2324f6b1a46..5c32e7a310c 100644
>> --- a/include/disas/dis-asm.h
>> +++ b/include/disas/dis-asm.h
>> @@ -396,6 +396,13 @@ typedef struct disassemble_info {
>>     /* Command line options specific to the target disassembler.  */
>>     char * disassembler_options;
>>
>> +  /*
>> +   * When true instruct the disassembler to not preface opcodes with
>> +   * raw bytes. This is mainly for the benefit of the plugin
>> +   * interface.
>> +   */
>> +  bool no_raw_bytes;
> 
> Patch in general and idea is OK, but I don't like
> the "no_raw_bytes" naming very much.
> In patch #2 you use "if (!info->no_raw_bytes) {.."
> which is double-negation.
> 
> "hide_raw_bytes" is better but still double negation.
> 
> Maybe something like "show_opcodes" which defaults to "false"
> when used with plugins is better?

Agreed.


r~

