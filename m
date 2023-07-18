Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5893AEB64DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 09:49:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLhKL-0006IF-V6; Tue, 18 Jul 2023 05:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLhKJ-0006HP-Bw
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 05:49:03 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLhKH-0001b3-CM
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 05:49:03 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1baa6fc33f1so803362fac.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689673740; x=1692265740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8bRnx/XRl9oou79Zg/GQAvp3CJy/KTYoJ5xkhD64rc=;
 b=PljMP3EGktNJXypVE/fKL1BUzWHIHxOoSAWuZM3XoReE28N5vZOrPm4Ir/TxvXjIgG
 5jMphd8p+lofMEtCi/PxFWsD+h6DZggiHY15brzqhkMz07/DFya2b8Qgs4Ukr0TXdAsH
 gmAYlkRCdQK+sS2BadwBD8JVToxzlRgao2uGf1Y3Grc6+C8mYGknkhvZgTwuQ/UWOugR
 rUVkiOIHJkmR4RXGHfSXikUYcFuBfaApItHl6uRkVhVDPCaMUO4tiv6dlz0zmoKgzsdY
 CaPKzPPUEt52lU0htcPo9rPlx+H4rjRt5gWzk4Yzfj61y5ifBw5eEkqD/mdhZHn/Rvpd
 KbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689673740; x=1692265740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8bRnx/XRl9oou79Zg/GQAvp3CJy/KTYoJ5xkhD64rc=;
 b=PeoJ1svqrd5+5Qv7eNp11ZhAyjtc9ePouRKD+Yd8Y0KOoDsVHtbPNO7gKkl3+FU3nr
 Mc2A9Operz+MhpNrjmvPgLDwSBpOxNMOIq7FA62l1jnm1BsTYoZrfjl2SSU02MLrRYN/
 uS05RGh7Zlyv60Dz7TCu/CnErsWBDfQtqFCoOwnRAzBXpZs+nLkyTTjhOvT84VMk2Y3D
 2EzQSc5cI15kFfyHPPqcoLiiTo1D4/16AzvfpDty6eRMeIWXKQS/52lS860Svk4sGDP4
 qeslwL5sfQdkMl+BdAEiLtnTmQV3pkHfeQUX2cn0bZXUNw5WIbUvA52Swfr5wHfCMlpx
 pdIg==
X-Gm-Message-State: ABy/qLa740HNrmDVd+l3b5FX1FpfJPrVa00qQwu3vUM3NYbJpA8ZUjC5
 UJy4ILhqx9fCu5/iNduyOnTn0A==
X-Google-Smtp-Source: APBJJlGkSxXBk0aMOiP68ZvS0wTKtzUP2ZvyRWv7pbWr+/1uwL6S2AMgTQ2J3BUA7aLEcVGRHnrsXg==
X-Received: by 2002:a05:6871:a9:b0:1b7:1904:1ad9 with SMTP id
 u41-20020a05687100a900b001b719041ad9mr17243986oaa.53.1689673739733; 
 Tue, 18 Jul 2023 02:48:59 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 s7-20020a4a5107000000b0055516447257sm654968ooa.29.2023.07.18.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 02:48:59 -0700 (PDT)
Message-ID: <67f0569b-ffe4-5e4c-78eb-73a25aa414fb@ventanamicro.com>
Date: Tue, 18 Jul 2023 06:48:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/riscv/cpu.c: check priv_ver before auto-enable
 zca/zcd/zcf
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, Conor Dooley <conor@kernel.org>
References: <20230717154141.60898-1-dbarboza@ventanamicro.com>
 <f0f0b1fb-327b-abb8-0262-027c75c76520@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <f0f0b1fb-327b-abb8-0262-027c75c76520@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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



On 7/17/23 22:36, LIU Zhiwei wrote:
> 
> On 2023/7/17 23:41, Daniel Henrique Barboza wrote:
>> Commit bd30559568 made changes in how we're checking and disabling
>> extensions based on env->priv_ver. One of the changes was to move the
>> extension disablement code to the end of realize(), being able to
>> disable extensions after we've auto-enabled some of them.
>>
>> An unfortunate side effect of this change started to happen with CPUs
>> that has an older priv version, like sifive-u54. Starting on commit
>> 2288a5ce43e5 we're auto-enabling zca, zcd and zcf if RVC is enabled,
>> but these extensions are priv version 1.12.0. When running a cpu that
>> has an older priv ver (like sifive-u54) the user is spammed with
>> warnings like these:
>>
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000000 because privilege spec version does not match
>>
>> The warnings are part of the code that disables the extension, but in this
>> case we're throwing user warnings for stuff that we enabled on our own,
>> without user intervention. Users are left wondering what they did wrong.
>>
>> A quick 8.1 fix for this nuisance is to check the CPU priv spec before
>> auto-enabling zca/zcd/zcf. A more appropriate fix will include a more
>> robust framework that will account for both priv_ver and user choice
>> when auto-enabling/disabling extensions, but for 8.1 we'll make it do
>> with this simple check.
>>
>> It's also worth noticing that this is the only case where we're
>> auto-enabling extensions based on a criteria (in this case RVC) that
>> doesn't match the priv spec of the extensions we're enabling. There's no
>> need for more 8.1 band-aids.
>>
>> Cc: Conor Dooley <conor@kernel.org>
>> Fixes: 2288a5ce43e5 ("target/riscv: add cfg properties for Zc* extension")
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 9339c0241d..6b93b04453 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1225,7 +1225,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           }
>>       }
>> -    if (riscv_has_ext(env, RVC)) {
>> +    /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
> 
> I think the Zca/zcd/zcf doesn't have much relationship with the privilege specification. The privilege specification doesn't define any
> CSR or rules that Zca/zcd/zcf depend on. Maybe I missed something.  Does anyone  know why we should check PRIV_VERSION_1_12_0 for zca/zcf/zcd?

I always thought about this priv spec filter as a way to determine the time
window that the extension was ratified/defined. In this example it's been used
to filter out zca/zcd/zcf from the sifive-u54 chip because this chip is older
than those extensions, so it doesn't make sense to enable them.

> 
> I think we should remove the check for priv_ver for many user mode extensions. We should set the checking privilege specification version for these extensions to PRIV_VERSION_1_10_0.

I think it's hard to pick and choose which extensions will have a priv version check
or not. If we're bothered with the priv spec check per se then we should remove it
entirely. Here's my plan to do it:

- remove cfg.priv_ver. This is a very old attribute that allow users to set the priv_ver
for generic CPUs like rv64. I'm doing changes in the user options for TCG flags and the
very existence of this option forces me to make priv checks for all extensions we're
auto-enabling during realize() (because I can't be sure whether the user changed the
priv_ver of rv64 to something older);

- split the realize() functions between generic and vendor CPUs again. It was merged together
earlier this year (I did it) because, back then, we were doing too much stuff during
realize() that was needed for named CPUs, but the side effect is what we're seeing now:
the common code is enabling unwanted extensions for vendor CPUs. The code is very different
now, and I believe that we can at least skip validate_set_extensions() for vendor CPUs;

- at this point, vendor CPUs aren't auto-enabling any features and generic CPUs are always
set to PRIV_VER_LATEST. This means that we can remove all code related to disable extensions
via priv spec, and then all artifacts related to priv spec.


However, even if we're all onboard with removing it, this is still 8.2 work. For 8.1 I believe
this patch is a good fix to relief users from these warnings.


Thanks,

Daniel



> 
> Zhiwei
> 
>> +    if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
>>           cpu->cfg.ext_zca = true;
>>           if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
>>               cpu->cfg.ext_zcf = true;

