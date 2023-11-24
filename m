Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E8AC61DF4
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 11:56:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6Umx-0003oI-6h; Fri, 24 Nov 2023 06:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6Umv-0003o2-SR
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 06:56:01 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6Umu-0005jd-5N
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 06:56:01 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6c3363a2b93so1751781b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700826957; x=1701431757; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wHHRnZQkK/pfYBlgcsnzP38AQN0uUgECVZo91CMOTsM=;
 b=pP4EoBbHAo2qMG+2xDkSN1zPn84DAFSNo371upqDEKUGEVS32CYNZFllUSpLmXGEed
 MUpVMelMBrHcWE+gVuhRUvQlYby8SP8dd/Nz/Du/JDEoAYy7oE4bbGpf0dPL9pNIYHvN
 vy5X/feb4+1fHGGKZivp4vKk7ifSb+fnOx2ZRGzict3C/KKk85Z1EfGUlLiRHRzGjZrE
 OxjcNIXFz5Ji81wzYSCq666HP5e0df1UjKj+L6sZXU2BTievLN6bSMo9QyCnlzLSaA+0
 1r2ZtoEKrNmYI41FyJjgybpY/X9B/Kc42IpFcIsbjmBxv6ENk4daznhybbVbMamU378S
 HI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700826957; x=1701431757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wHHRnZQkK/pfYBlgcsnzP38AQN0uUgECVZo91CMOTsM=;
 b=WLArLtSHBUSOEm50cirw1gqb5eKcyrEZGNCFg1oUfPBPsSijgrAEdJRPn2M4GDV2CV
 fhfWaUhA9EcTw7qLhDKiRuDu38fQtXtscbr6MBEG4Y2iIWFLzE19xbz/Y5TgKYUP7mMk
 bBLJe2MNaRK3tpYXLpJD6VmnZIv0QkAaLSdqxS6ETqa8p9jDOHul68aoFxCI68vK7Ito
 ZYg6BSg0+X9SigM32D/Y+9yAS6YQNXMqMjvRgJ4L3h9QJaXvTENz9Y7cMc3DEpSn5Iys
 6/Hqk5uZPJ+L8tHVyAppSqlqvZTvQ2dxhv7VrCSeICxCitE2tlv4f5Ng4EVAUuxNIcma
 GkLQ==
X-Gm-Message-State: AOJu0YyStH2ji2EH8XWyaZ4Qsd55QS9UuFQQB4FjTk8A7TnChTJsWCGF
 ddtEA8/TPxiDhuiPcDu7B685nw==
X-Google-Smtp-Source: AGHT+IGgGPM26LZ6YZsF27lh9UdKgc2xTkpKZYn1Fhr/IAHxFC/A2Gz1IeDb9ngrtcs85fUcpgJr4A==
X-Received: by 2002:a05:6a20:8f1a:b0:18b:8452:b6db with SMTP id
 b26-20020a056a208f1a00b0018b8452b6dbmr3508637pzk.12.1700826957507; 
 Fri, 24 Nov 2023 03:55:57 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a17090ad48b00b00262eb0d141esm2832044pju.28.2023.11.24.03.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:55:57 -0800 (PST)
Message-ID: <6a902ab3-a95f-47a9-a3d4-251c0c116fd2@ventanamicro.com>
Date: Fri, 24 Nov 2023 08:55:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 v11 03/18] target/riscv/tcg: update priv_ver on
 user_set extensions
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
 <20231123185122.1100436-4-dbarboza@ventanamicro.com>
 <20231124-92b499e54aa4a447386fac16@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231124-92b499e54aa4a447386fac16@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42b.google.com
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



On 11/24/23 06:23, Andrew Jones wrote:
> On Thu, Nov 23, 2023 at 03:51:07PM -0300, Daniel Henrique Barboza wrote:
>> We'll add a new bare CPU type that won't have any default priv_ver. This
>> means that the CPU will default to priv_ver = 0, i.e. 1.10.0.
>>
>> At the same we'll allow these CPUs to enable extensions at will, but
>> then, if the extension has a priv_ver newer than 1.10, we'll end up
>> disabling it. Users will then need to manually set priv_ver to something
>> other than 1.10 to enable the extensions they want, which is not ideal.
>>
>> Change the setter() of extensions to allow user enabled extensions to
>> bump the priv_ver of the CPU. This will make it convenient for users to
>> enable extensions for CPUs that doesn't set a default priv_ver.
>>
>> This change does not affect any existing CPU: vendor CPUs does not allow
>> extensions to be enabled, and generic CPUs are already set to priv_ver
>> LATEST.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 7670120673..d279314624 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -114,6 +114,26 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>>       g_assert_not_reached();
>>   }
>>   
>> +static void cpu_validate_multi_ext_priv_ver(CPURISCVState *env,
>> +                                            uint32_t ext_offset)
> 
> We should probably name this cpu_bump_multi_ext_priv_ver(). "validate"
> implies we're checking something and either returning an error when it's
> not what we expect or asserting on unexpected input. We do neither here,
> we just bump priv_ver, when necessary.

Having a look at all the instances we have of 'validate', including the rva22s64 series,
I believe we can make the following name changes:

riscv_cpu_validate_named_features() -> riscv_cpu_update_named_features()
riscv_cpu_validate_svade() -> riscv_cpu_update_svade()
riscv_cpu_validate_zic64b() -> riscv_cpu_update_zic64b()

As you said a couple of times in recente reviews, 'validate' doesn't make much sense
since we're not checking values and erroring out/send warnings about it. I suggest
'update' instead of 'set' because we're updating the value of these flags based on
the resulting configuration during finalize(), instead of setting them to a certain
'value' param.


Thanks,

Daniel


> 
> Thanks,
> drew

