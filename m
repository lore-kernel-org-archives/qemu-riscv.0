Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9D5C87FDA
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 01:43:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uheo9-0007L0-4m; Thu, 31 Jul 2025 21:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhem1-0004F0-Aw
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:41:29 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhelz-0001RD-IE
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 21:41:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76bd7676e60so313777b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 18:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754012486; x=1754617286; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xVZYVwgSk9RzCvXFw7opvZRkc1d6fUqSbKAWeRUy5c8=;
 b=MqO8TQYOG1nLUPbBshXpviwb40fm4w7jsBT4VEHhuIsb9vbgNFCah1u/7DwWW8NFiu
 9uhoplZMOMHTsTwcfn9rPa7JqY30FbKeJshNQFfUygJNVyHh5D868DSYv9LS5ii8LFk0
 m3Gu4fnXNSkquKotnriUH8iqbYilzDusuP6XwgD0T5c6ENQ/7KzWXTS6H9vrqH3F8lV6
 iekhHjNxawSv6jAVHUcO22TBU5DEMWAPk8lpW8udvHs+jBEI/3o+NK1wvre6L1GOyGVE
 yM3EIOS4Up4FoWdSFKVY6VFojjQMYfwouFXKoGJGpDCvzRLVv6v8/yjq4LZpxNkKTG14
 seWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754012486; x=1754617286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVZYVwgSk9RzCvXFw7opvZRkc1d6fUqSbKAWeRUy5c8=;
 b=epMCy/1e2Otyt9utYmh5l/fHlU8SbNDykQy1NnMQ25qwaB598kL1OgjpBJjmEW8j4X
 OO140Pp7JpPlzbbE840V1LJvi1WpNkNScpivaaVUqdL3MtdntIo+qx8qgexPjzShQ+I9
 5BIswAblMs8AaV17iDBKY+wWdBl78yE0ZG8o28EBAD2M05HMfnVlvLF9+II+vIz4WRAL
 fkKYMWYV8CxhKJP5Ck/Y76YSoc9oPf9YqeRLa7JynWszczPwlxU9vPruJOTf7Okhe/X1
 Wa5iCopTBlwkxWe2gA56u7A5uK4ttgaZrI6t8zImUQNo6hEJ3aTuQKg6cDi10ykRyyFw
 DnIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdLBIcrrJk/TNVMVeTvZFcQVahR9nyakd1EMUSlSkP39oTDN1gDvFjyM1x7Ps1q7FO0wyd5j59WbVf@nongnu.org
X-Gm-Message-State: AOJu0YwGHJJNLjjeJPojwm8PtAz3NyfbOfTtXPhsRGTs5IGKnLOpq4bp
 m+FEM6Jz/sL5lK/hvChI9RTmrg1zV1AvqEvCzrc0LXrSOOxK2eeao6rUi3WqCd9GuJc=
X-Gm-Gg: ASbGncvSicvEyKQzm+8zdkDT5BjZm2vXwFUUHyDqRyIGZpS9xlI/3oDjZj7VvgtoDmp
 hJTam8Cb3yAxrdGawUqUV0D+ve8bGjvjABbJExZqNfcleQPhVX7Org1RjHuJ/cWEz9FiCgMvApO
 1EwgJftwRwK9Z9s74GWiq82kk0oX+BwYqw22nyh8/lE0v/K6Wus9eWaKB/sPNntEyd9h8p0xJqM
 pf1s3n5zZWPrGjbmvzmcHPu9uR5kKG2yxKo+9Ocr1twe66bJpdiKddz225aGr8pFOPNq23ux+I5
 05j/d4b4nfimdA1+emaM6wPreYnM+EfjGDqe8aUkDTJ3fBIK1Nwgr+W8MOfg86fT8B4jr4+DwtE
 BEXsFNqX97qIklN6NIJNYUTkdLTa1/64DyQG3ljasWRfbYA==
X-Google-Smtp-Source: AGHT+IHLo267rMItO8mP8JmmirjpoTmHCLB5e5JnpvAJ0AWs3ECNudY9DF96HmM0RedEchXrbCVqSg==
X-Received: by 2002:aa7:88c9:0:b0:739:50c0:b3fe with SMTP id
 d2e1a72fcca58-76ab14172b3mr16031366b3a.8.1754012486055; 
 Thu, 31 Jul 2025 18:41:26 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce89132sm2703235b3a.29.2025.07.31.18.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 18:41:25 -0700 (PDT)
Message-ID: <bda43361-eae8-4e5b-900e-b233fb4b4868@linaro.org>
Date: Thu, 31 Jul 2025 18:41:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] semihosting/guestfd: compile once for system/user
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-3-pierrick.bouvier@linaro.org>
 <d2084fe2-fec6-4fba-858b-2c5df5c36e39@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <d2084fe2-fec6-4fba-858b-2c5df5c36e39@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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

On 7/31/25 4:15 PM, Richard Henderson wrote:
> On 7/31/25 08:06, Pierrick Bouvier wrote:
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index 40dc778529d..33614108094 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -101,6 +101,13 @@ static int gdb_open_modeflags[12] = {
>>        GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
>>    };
>>    
>> +/*
>> + * For ARM semihosting, we have a separate structure for routing
>> + * data for the console which is outside the guest fd address space.
>> + */
>> +GuestFD console_in_gf;
>> +GuestFD console_out_gf;
> 
> These can now be static.
>

Yes, I forgot to reapply that from my initial series when cleaning it 
up. Thanks.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~


