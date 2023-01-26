Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKtcG-0003fM-M5
	for mharc-qemu-riscv@gnu.org; Wed, 25 Jan 2023 23:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKtc9-0003dh-9Z
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 23:11:53 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKtc7-00013R-Kw
 for qemu-riscv@nongnu.org; Wed, 25 Jan 2023 23:11:53 -0500
Received: by mail-pf1-x42d.google.com with SMTP id n2so410382pfo.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Jan 2023 20:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FLEBIE/+V25SWwFPA8O3frxf4+wUmuN3EsyPZs82ZZY=;
 b=ksUrTphAwKvz89gu/OONeu26n7Jyd+SBIr5YkpBDK4teyEx2o/ef1QnFK/6cgHzIZY
 6gvrpfZ/uHNFGRi7gI3KR/fh00ZqLvRyEAcV8kRZfLMgbXBQowuwmwI7shhY3dqBfI1X
 xT6rhPLJ/pFTZlF0qqiCDFSiJzX9Xp1G3nyo1lyYk5l4H6bs74q0Z2aL8OjyGz6xdY0S
 L4vVPFmTbozHKfMh0hiWA+jx5eTH8AHFO2M6nij/z0sr6mrSfD4+QxWR2g71J2ubsIYf
 4/lVlUzBDVCMPguuSeCJmgiJ3+Wc0OHZCmp87pISur0qkJk5oD0SIlgLVrpslWiLuFFA
 QpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FLEBIE/+V25SWwFPA8O3frxf4+wUmuN3EsyPZs82ZZY=;
 b=K3zKQoqhCBbHT7SyTihV9kciAMjQJ7IWZ05Fgy/M5VnrPhiSYZODxZxyXoMfGSxG1j
 JiO1rUf+DkOJExYV/I/saO5mq5125vb5OnOy3hOZkI/Iyju3bCaSwVkdRY9OLh+qDC//
 ijSbUI8mnlBO6jfSNAJHtzSCnPXtg1T0N+o/IUK/SXZB1GsQOoPWo0MWQWcdOFLvtt7D
 rJ9y6akdLrBoSI/blnsM1BRjmg2OcY57U/rFLQzCAhEtR+cNms7Emy078i3Q+p8IIPGL
 vN8AvJGgrEMhHSeFjq3Ux6RfowXCzI7Cp3M47DdV5jTsh1m4CsWDc0Swp2ZGvGxy3xt4
 t99A==
X-Gm-Message-State: AO0yUKV6NTWEfz0cze+zjtcm4FZ+fIEWkhIfKoqHDwMACnYR66kX/GXz
 BQbyy5U6V+bP8HS8bB0zxmyC/w==
X-Google-Smtp-Source: AK7set8lvhQNTfjr9YPs4UWna+Y7gduxPLxAmBiYx+btnNAfc59ioUkXqsLfujtvsuJ1pvZF2zl31g==
X-Received: by 2002:aa7:93c6:0:b0:592:4502:fb0 with SMTP id
 y6-20020aa793c6000000b0059245020fb0mr104461pff.0.1674706310097; 
 Wed, 25 Jan 2023 20:11:50 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 15-20020a62190f000000b0058dc1d54db1sm4378899pfz.206.2023.01.25.20.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 20:11:49 -0800 (PST)
Message-ID: <74fe37d9-331c-7e00-e642-365f1a04ff80@linaro.org>
Date: Wed, 25 Jan 2023 18:11:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 06/36] tcg: Introduce tcg_target_call_oarg_reg
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-7-richard.henderson@linaro.org>
 <877cxaqpxi.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <877cxaqpxi.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Thu, 26 Jan 2023 04:11:54 -0000

On 1/25/23 11:09, Alex Bennée wrote:
>> -static const int tcg_target_call_oarg_regs[2] = {
>> -    TCG_REG_R0, TCG_REG_R1
>> -};
>> +
>> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>> +{
>> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
>> +    tcg_debug_assert(slot >= 0 && slot <= 3);
>> +    return TCG_REG_R0 + slot;
>> +}
> 
> So this is now returning allocations of TCG_REG_R0 to TCG_REG_R3?

Yes, should have mentioned in the patch description.  Done.


> Do we
> have to take care to get things right if slot is ever bigger w.r.t.
> tcg_target_reg_alloc_order?

No, reg_alloc_order is optimization for call-saved vs call-clobbered vs call arguments. 
It should not affect correctness at all.  Nor will it ever affect call return -- those 
registers die immediately before the call, and become live with these values immediately 
after the call.


r~

