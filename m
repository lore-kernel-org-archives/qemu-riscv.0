Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D7C25B46
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:00:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quyHk-0008EF-9c; Mon, 23 Oct 2023 13:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1quyHh-0008Cq-6J
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 13:00:09 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1quyHe-0002Xo-OQ
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 13:00:08 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6b201a93c9cso2649626b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698080404; x=1698685204; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tVV5n5FHB1W7modGzywv9Begg+ZwO7nKGsbDd1c0Y6U=;
 b=AMTzJiHHw+acizhBimiYlDa+HyxdLA1To5hqa9+sRhLMB7oKF0nh+pPybXue2hgK3L
 XHScTH+Zp2+pu6rljKy9hI5UEriITcXMJzCa3lgeu3DvEYqrMZVPYlUcA9MkT1eRHNiB
 LqUBUSfjxp82xNxbHi2XWh9X4bP4d+C9sV5ihbsYl7o12Lb3ribo/rbuvR4cVb7wQY9G
 kVdc+7SI72b7x2+6hh/O8j5C/BVYk+T1LExV2ons5E9Fj+1BDme2faSR0BcxCVgquX++
 ga+NHhWxi6QiulUD2Wxnf9jUHlGOMU0pbyvw24lsj7X62HRy4S/1XDpn9YNBVLAnlDjt
 fxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698080404; x=1698685204;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tVV5n5FHB1W7modGzywv9Begg+ZwO7nKGsbDd1c0Y6U=;
 b=nNR3yF7JVJztUZqOktdvLrqIV6zNM6ie+Fd5UBlv1hGRl3Hi81fph8oVPGBTATBrmB
 Tf06ymejDlRJNAgpW743JHYwbkSHwfwSCPpbZZoo5iCDUuLN0X14bU7NB3BLNNpGESKm
 ayASk2tj2UkpX741m7Zm6qBLfhNEOQxzKrBzexc10dXnh4Xp/++oDYPl/586mZvXIW0f
 TxiMRjN0ImqljXS0d9lpwufGx6YSJmNQ4kw+18HmXFh1LL3SwWNZAe8rxlm7HWt/wobX
 BiWbr6/WAkPi4jy00E+PeBMi6o04I3MTwO/i9FnOOd7525GDeSBHsdvPFXu9YpCGNXTE
 VPmQ==
X-Gm-Message-State: AOJu0YxRy2PXIlnJ3ljh/1mpRNVLlAsh3JLs1R6asOHM46Ta2FUFJGuq
 xN9yWKCc+AfQRa3NZmMYm2o/qA==
X-Google-Smtp-Source: AGHT+IEv7R8nJ4WTedZcimiuGi840TrSdeIoTirJ799eQHFWJTgLnMiFjrN6D9hSX5H8MB2xV9L08g==
X-Received: by 2002:aa7:991e:0:b0:6b8:2ef3:331d with SMTP id
 z30-20020aa7991e000000b006b82ef3331dmr6654445pff.10.1698080404272; 
 Mon, 23 Oct 2023 10:00:04 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
 by smtp.gmail.com with ESMTPSA id
 y9-20020aa78f29000000b006879493aca0sm6383662pfr.26.2023.10.23.10.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 10:00:03 -0700 (PDT)
Message-ID: <0e66af36-bd36-4b42-b901-ed726af207b7@ventanamicro.com>
Date: Mon, 23 Oct 2023 14:00:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
 <20231023-2018025adea3ffaebbbefe23@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231023-2018025adea3ffaebbbefe23@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42e.google.com
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



On 10/23/23 05:16, Andrew Jones wrote:
> On Fri, Oct 20, 2023 at 07:39:48PM -0300, Daniel Henrique Barboza wrote:
>> The TCG emulation implements all the extensions described in the
>> RVA22U64 profile, both mandatory and optional. The mandatory extensions
>> will be enabled via the profile flag. We'll leave the optional
>> extensions to be enabled by hand.
>>
>> Given that this is the first profile we're implementing in TCG we'll
>> need some ground work first:
>>
>> - all profiles declared in riscv_profiles[] will be exposed to users.
>> TCG is the main accelerator we're considering when adding profile
>> support in QEMU, so for now it's safe to assume that all profiles in
>> riscv_profiles[] will be relevant to TCG;
>>
>> - we'll not support user profile settings for vendor CPUs. The flags
>> will still be exposed but users won't be able to change them. The idea
>> is that vendor CPUs in the future can enable profiles internally in
>> their cpu_init() functions, showing to the external world that the CPU
>> supports a certain profile. But users won't be able to enable/disable
>> it;
>>
>> - Setting a profile to 'true' means 'enable all mandatory extensions of
>> this profile, setting it to 'false' means disabling all its mandatory
>> extensions. Disabling a profile is discouraged for regular use and will
>> issue an user warning. User choices for individual extensions will take
>> precedence, i.e. enabling a profile will not enable extensions that the
>> user set to 'false', and vice-versa. This will make us independent of
>> left-to-right ordering in the QEMU command line, i.e. the following QEMU
>> command lines:
>>
>> -cpu rv64,zicbom=false,rva22u64=true,Zifencei=false
>> -cpu rv64,zicbom=false,Zifencei=false,rva22u64=true
>> -cpu rv64,rva22u64=true,zicbom=false,Zifencei=false
>>
>> They mean the same thing: "enable all mandatory extensions of the
>> rva22u64 profile while keeping zicbom and Zifencei disabled".
> 
> Hmm, I'm not sure I agree with special-casing profiles like this. I think
> the left-to-right processing should be consistent for all. I'm also not
> sure we should always warn when disabling a profile. For example, if a
> user does
> 
>   -cpu rv64,rva22u64=true,rva22u64=false
> 
> then they'll get a warning, even though all they're doing is restoring the
> cpu model. While that looks like an odd thing to do, a script may be
> adding the rva22u64=true and the rva22u64=false is the user input which
> undoes what the script did.

QEMU options do not work with a "the user enabled then disabled the same option,
thus it'll count as nothing happened" logic. The last instance of the option will
overwrite all previous instances. In the example you mentioned above the user would
disable all mandatory extensions of rva22u64 in the CPU, doesn't matter if the
same profile was enabled beforehand.

Sure, the can put code in place to make this happen, but then this would make
profiles act different than regular extensions. "-cpu rv64,zicbom=true -cpu rv64,zicbom=false"
will disable zicbom, it will not preserve the original 'zicbom' rv64 default. If
we're going to keep left-to-right ordering consistent, this behavior should also
be consistent as well.


As for warnings, I agree that we'll throw warnings even when nothing of notice happened.
For example:

-cpu rv64,rva22u64=false -cpu rv64,rva22u64=true

This will throw a warning even though the user ended up enabling the extension
in the end.


We can fix it by postponing warnings to realize().


> 
> As far as warnings go, it'd be nice to warn when mandatory profile
> extensions are disabled from an enabled profile. Doing that might be
> useful for debug, but users which do it without being aware they're
> "breaking" the profile may learn from that warning. Note, the warning
> should only come when the profile is actually enabled and when the
> extension would actually be disabled, i.e.
> 
>   -cpu rv64,rva22u64=true,c=off
> 
> should warn
> 
>   -cpu rv64,c=off,rva22u64=true
> 
> should not warn (rva22u64 overrides c=off since it's to the right)
> 
>   -cpu rv64,rva22u64=true,rva22u64=false,c=off
> 
> should not warn (rva22u64 is not enabled)

Ack for all the above.

> 
> And,
> 
>   -cpu rv64,rva22u64=true,rva24u64=false
> 
> should warn for each extension which is mandatory in both profiles.

The way I'm imagining this happening is to cycle through all profiles during realize(),
see which ones are enabled, and then warn if the user disabled their mandatory
extensions. In this example we would warn for all rva22 mandatory extensions
that were disabled because we disabled rva24, but we won't emit any warnings for
rva24 mandatory extensions given that the profile is marked as disabled.



Thanks,

Daniel


> 
> Thanks,
> drew

