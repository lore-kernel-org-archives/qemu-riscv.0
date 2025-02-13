Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D69BC0219D
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 13:26:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiZEB-0003p8-AO; Thu, 13 Feb 2025 08:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tiZE6-0003oK-Hs
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 08:25:58 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1tiZE4-0004v4-63
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 08:25:58 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-219f8263ae0so13401025ad.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 05:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739453154; x=1740057954;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=92+fMihkVNU+rAfybVrbalcRvoxZQIMON7tupnfHlLo=;
 b=0ISSb4cIroUeyDZ65wA9xGrZtcJsq8V1yo8PTHgSFLS4zicW6u81dGiuBM0bz2MJvo
 uPWW00Gm5BYT2kx9fNO/Ble0rpOcREIwBoMRWaAd6TZ3ihTXUkbcNs+Bqs+qaCBPYysU
 2UHqBm84rdwvhGX1nW0mulcPHxufUl8Ca6qftZtYMHyT/ZpDfnvMLQdI/J29Ar3kKXmI
 KtgG6g7H5g+IoyXNqzGCdoBBJLqD2fjGzcHvaIF+T2HTtvEO9I1z4yQQMqB5n0h3tTIC
 +Kgt6A+W0xustjNY1hpChTKocCZmgyYrrBfyDw/C+lj2mLAxBlraHNltd4NlB8BywA80
 fCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739453154; x=1740057954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=92+fMihkVNU+rAfybVrbalcRvoxZQIMON7tupnfHlLo=;
 b=K9ZBctvJNx5y4K9Ox5vugxXahZAfBXBUvVy+BBQ9p3N1ELg/yReNVlnmtpOoRcCigX
 R6DY0CKZhmlnP+6/vmFwnHgpPFJdbO2dh9+AgIi5uBQZ3Hyu/E2dMJXHM7WFfvo7rh0i
 zh95RVQXAXOlnisYKgHKgHPpVJYr3aV2CtAUXq+ukCqomZkeM/H+jMY1hekobT6MrDdm
 qeoeJrHtmmzoYW4yOYAEUelL5rlnJKFp2e71gbW3Soia5Nlkim1co/i5YXnSeADl87uy
 R+OjBBI9zlXuhQad/WYpV+68Iti79Bi7/n7+1VpnJE43hbhioh73iOPw4utfTB2JutGe
 F+lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2YfaQ4s8lTcnMwQVYBLdMi7Grybqrm8SxA5oZh8CloQcbxcP/hJEveP/WOV6EdG642byC0cJRWi3v@nongnu.org
X-Gm-Message-State: AOJu0Yy1T/0UPaWoWGO42k/9/Mb6cUaHCVqaUBajHQe82XXujMRZCeyZ
 3GuEdxJJap5kIek1U5j0jn0lh+Vpik3oBnVLAcsk4AW4X2DTcpQ8mPIsVhhgOY8=
X-Gm-Gg: ASbGncsJEo8BMqFYf66xz4R9V3OD0Vy6uOKA6Jq3q+Q3hr4XHsCLMp425w6pnmG+0mM
 jr5SdjYLu/V7pHOESfavru+n4RwRngxMgjZakLrgkn9z4yvWTDHCChom/DfXmSx+waAq0L+X9xH
 3XYw1c1ZUGN1cGsaAbkkGVhyNWQsBUE/WalryyU607xhWvqqNs7wcwz7lhTJWzaoaEv51GQz02n
 Zu5quX0GauD5CK+xR3gC4cKMzjlzla3mYYhA0f1bo6kLQ/fvGUgtRjwgaDmZI7zPcaJm8HZ+Epz
 4nNH5VsCbwDd7HI4ddw9cyljxpWgrZGzorHM/lSOO7zGk/HqdW7qkZFydktf
X-Google-Smtp-Source: AGHT+IHEyefnUD3nasYUaM7Zxb7Ib0q116jrRxIk86p4ABc6DrePIt0lPeFb7mMwdAUjuI7fsmD8bg==
X-Received: by 2002:a05:6a20:1591:b0:1e0:d9a0:4ff7 with SMTP id
 adf61e73a8af0-1ee5c7db2camr17182415637.32.1739453153928; 
 Thu, 13 Feb 2025 05:25:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626?
 ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb58618700sm1173324a12.36.2025.02.13.05.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 05:25:53 -0800 (PST)
Message-ID: <ccb9c666-4a87-45a4-ab85-dd200667f785@rivosinc.com>
Date: Thu, 13 Feb 2025 14:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: silent warnings about Smdbltrp/Smrnmi being
 disabled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Tommy Wu <tommy.wu@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20250213075221.622676-1-cleger@rivosinc.com>
 <6ac67c25-9ad7-42f6-b246-24053ce37ddc@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <6ac67c25-9ad7-42f6-b246-24053ce37ddc@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=cleger@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 13/02/2025 12:32, Daniel Henrique Barboza wrote:
> 
> 
> On 2/13/25 4:52 AM, Clément Léger wrote:
>> As raised by Richard Henderson, these warnings are displayed in user
>> only as well. Disable them for CONFIG_USER_ONLY.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
> 
> I'm second guessing having these warnings at all.
> 
> Sure they serve as a warning for us, developers, that something needs to
> be revisited (e.g. after an OpenSBI update). However it will degrade user
> experience with warnings related to something out of the user control.
> 
> Instead of adding CONFIG_USER_ONLY gates for these warnings I believe we're
> better of removing them. We can add TODO/FIXME tags in the code if there's
> something that we need to revisit at a later time.

Hi Daniel,

Agreed, I'll add some TODO comment and remove these warnings then.

Thanks,

Clément

> 
> 
> Thanks,
> 
> Daniel
> 
> 
>>   target/riscv/tcg/tcg-cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 0a137281de..4d0d16576d 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -1437,7 +1437,9 @@ static void riscv_init_max_cpu_extensions(Object
>> *obj)
>>        */
>>       if (cpu->cfg.ext_smrnmi) {
>>           isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smrnmi), false);
>> +#ifndef CONFIG_USER_ONLY
>>           qemu_log("Smrnmi is disabled in the 'max' type CPU\n");
>> +#endif
>>       }
>>         /*
>> @@ -1447,7 +1449,9 @@ static void riscv_init_max_cpu_extensions(Object
>> *obj)
>>        */
>>       if (cpu->cfg.ext_smdbltrp) {
>>           isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smdbltrp),
>> false);
>> +#ifndef CONFIG_USER_ONLY
>>           qemu_log("Smdbltrp is disabled in the 'max' type CPU\n");
>> +#endif
>>       }
>>   }
>>   
> 


