Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D031CCD1BB
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 12:40:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBY8H-0002m5-RQ; Wed, 22 Oct 2025 08:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vBY8C-0002lQ-EL
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 08:39:58 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vBY89-0000nH-9j
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 08:39:55 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2698d47e776so50520365ad.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761136791; x=1761741591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IhEfUnJbedqXtXc59HXLL8G3nrFMZ+OiEtJN/yYY9LY=;
 b=ks258BY4rjYYBVz2oD9j+VusQlf/cCMMfEiSNnN6r/GruogL0+oeikh9eNrBndDBWl
 eMQBDe1HgKOzXnOqFNBgAfFRlXTdWIp92L8yuMsTakYytfOjYitZgkDFIVU9JFI9shR2
 lmZgWvEh2Eguvb1IMQQ+ze75+kASeS+VR9GVQTttbU83vjyhF3gGOK3gBs+7eB+GD6Wf
 xJJSTzYtNr5l8PwquZEtXtdYzcY7zJP2pqDnvQMQRo4GiQIWBi3uMggi8rUhz2s7GicO
 Ez4D82JBFQfXsY5nOKjR4bDk0Dzmujt8/yaQ4UZsBAimgFO/bE7/hlXfii0A6Af8QHzz
 7PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761136791; x=1761741591;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IhEfUnJbedqXtXc59HXLL8G3nrFMZ+OiEtJN/yYY9LY=;
 b=qtcD5S1H7FrfR/vEOkqHBsn2+/GbdURSkSKcJ+YUes3lMS2G7Yka2dSMAjBMEJN9J/
 T2mgU/U043ACmwc17JgskX0qcV0DEGyYCAvCVhlGZCsWJtjPJJTXCMMiHgrt48qDTlsE
 HtP87A2uT2+WliS2JEuyQYR+wGGcqTPBzl9jola/lULi6aR9H923AAqRoGrQ2fPYOzl+
 zjbMMil2M5fIsrQQeonZC8veTBC4ZOaODGC6mxGMrZscvtp1mXpFT6HN7kXxalff6Ho2
 VwiP8AfkRoUFaPi9rJPTqTtm8GCL+qGPSgWnKiR8+7V5EienHpvAMebq0vzmLNXT1yf4
 y4Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp8EzAmy1DfQM9QKyObBruTuzDTp1ox+GWX0MKPH9Kc4u1FjHHP0R6GPXbodJ/dNk36/5yvnLmJQul@nongnu.org
X-Gm-Message-State: AOJu0Yw0yLl/R0XiJns8oYjgrwjyqroxN6ebotIOnbAoacjzWdbq6HVx
 emaIgQpvdoahMutJ7xyc/d/tDBp0VNU21hkGsH3+OXTmKQEfL5plQlND2KsglECfCx0=
X-Gm-Gg: ASbGncuZuhb22QnCcbvOfR7AOj6A31AXKzpmfKeRmvw7AUr7IYRc9w2UF92HTtYZ3j5
 txe+FjlCNSf4nu/851nGedzweQ/0gwdjq9w0RkFzNfFkVnpxMU3T6o3rwFuJeEge6GiHlTXBhn2
 VG5ab6XYW/HSkn4R0ZkuuS7JxgqKn9U0I35OIeeNm6SI9LVaXQsm9wIyYzLKuV9OwXsFT8+uvCG
 qpc5YTnVi9+B1yn/fBtSNcWxUd6uQHop+5sUU7/5PzoaqiIZtYwSKzc4YM/45HPeVZYyNQnIXLH
 qybFqGTAavrBUBmWcIt30IVCdabY6l0f/s+um+tKW42PU0g5fVnfx6zTgpEhMzuRNmxVDAopVWI
 wrI8OoN0+naXhBRmPvZBTkrcLur+VLR/7O4NNvV+4dN97I6Vh5meHh1pb1H9aUBwWV9BBYg81Qd
 hyWGFW03/C9VnAhO/Y8blHhxk=
X-Google-Smtp-Source: AGHT+IFsF+4slgHzT8HLO/0Q5Nu4gywgmp1Sk0enKQujao8NE4xkfQBM0JO0ByDDwlzM1KnfU45/pA==
X-Received: by 2002:a17:903:11ce:b0:269:9adf:839 with SMTP id
 d9443c01a7336-290c9ca7e27mr271296505ad.19.1761136791362; 
 Wed, 22 Oct 2025 05:39:51 -0700 (PDT)
Received: from [192.168.68.110] ([189.38.141.22])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29247219457sm137503265ad.113.2025.10.22.05.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 05:39:50 -0700 (PDT)
Message-ID: <06684337-601b-47d3-925f-b5a693aef244@ventanamicro.com>
Date: Wed, 22 Oct 2025 09:39:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/riscv-qmp-cmds.c: coverity-related fixes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com,
 qemu-stable@nongnu.org
References: <20251022110524.483588-1-dbarboza@ventanamicro.com>
 <CAFEAcA-gF4himAj7k03cES2-USbE-xs7f5LZEPQaCqHhDieiEA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA-gF4himAj7k03cES2-USbE-xs7f5LZEPQaCqHhDieiEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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



On 10/22/25 8:59 AM, Peter Maydell wrote:
> On Wed, 22 Oct 2025 at 12:05, Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Coverity CID 1641401 reports that, in reg_is_ulong_integer(), we're
>> dereferencing a NULL pointer in "reg1" when using it in strcasecmp()
>> call. A similar case is reported with CID 1641393.
>>
>> In theory that will never happen - it's guaranteed that both "reg1" and
>> "reg2" is non-NULL because we're retrieving them in compile-time from
>> static arrays. Coverity doesn't know that though.
>>
>> To make Coverity happier and add a bit more clarity in the code,
>> g_assert() each token to make it clear that those 2 values aren't
>> supposed to be NULL ever. Do that in both reg_is_ulong_integer() and
>> reg_is_u64_fpu().
>>
>> We're also taking the opportunity to implement suggestions made by Peter
>> in [1] in both functions:
>>
>> - use g_strsplit() instead of strtok();
>> - use g_ascii_strcasecmp() instead of strcasecmp().
>>
>> [1] https://lore.kernel.org/qemu-devel/CAFEAcA_y4bwd9GANbXnpTy2mv80Vg_jp+A-VkQS5V6f0+BFRAA@mail.gmail.com/
>>
>> Coverity: CID 1641393, 1641401
>> Fixes: e06d209aa6 ("target/riscv: implement MonitorDef HMP API")
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/riscv-qmp-cmds.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
>> index c499f9b9a7..7bde7090ab 100644
>> --- a/target/riscv/riscv-qmp-cmds.c
>> +++ b/target/riscv/riscv-qmp-cmds.c
>> @@ -273,12 +273,13 @@ static bool reg_is_ulong_integer(CPURISCVState *env, const char *name,
>>       }
>>
>>       for (int i = 0; i < 32; i++) {
>> -        g_autofree char *reg_name = g_strdup(reg_names[i]);
>> -        char *reg1 = strtok(reg_name, "/");
>> -        char *reg2 = strtok(NULL, "/");
>> +        g_autofree char **reg_name = g_strsplit(reg_names[i], "/", 2);
> 
> g_autofree frees with g_free(), which isn't the right thing for
> freeing an array of pointers. To do autofree here we need
> 
>   g_auto(GStrv) reg_name = g_strsplit(...);
> 
> (GStrv is the glib type for gchar**; the headers give it an
> auto-free mechanism that calls g_strfreev().)

I saw some instances of "g_autofree char **" and figured that it was ok to use
g_autofree in this case too (just git grepping, didn't dive deeper to figure
out context and so on).

I'll send a v2 with g_auto(GSrv). Thanks,


Daniel




  

> 
> thanks
> -- PMM


