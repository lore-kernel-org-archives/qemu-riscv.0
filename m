Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7Cm-00024t-Dl
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7Ck-00024k-1T
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:12:02 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7Ci-0006q3-6n
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:12:01 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d22so2420675pfn.5
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aMR9+Ug4MmUYHlwmy8IgjDYQBVduO+UIUYA30MHKoqQ=;
 b=HcRIO1/Nk5Dag6u82Fb4ZMbk2qjPSV0L6OHx39bwYPJjycOcMUcG8mIyPITSxp9VrG
 mKRoBtbQDIS7iNB6fyZvXucoLIJ4n+ctYPYlumLqOIKKVRd5/njfWOswebQJ+Ypi7DQc
 vqM759UBgv3Yps8/npfBgqXLrGxdbXkGi806KC1/Kkejdzmb+WLxcENXwn+gYhoGszsc
 e8va/VYglgVpd/4468fUVhoFNXJSzJS3nFLIMFf66mue1YAhgWkrVGHs2zsLXLOOlLm1
 FnBGL5NWx/mTvNbrjmyAmHeUdkqD+Mu9wTuk+Gljq5mEPgldyR5SXmuNIwQRPN19vY9z
 RtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aMR9+Ug4MmUYHlwmy8IgjDYQBVduO+UIUYA30MHKoqQ=;
 b=QXYpuR7ubNsetGY6ARPRk1Mr6nINb0I/OFcnkOEXN2hQCEjtrmGfVfuBCoHQGfKXKV
 PaL6XoC2hn1ULCUzTBf2ileUo8IlKicFwU67ReXSk3T/fL7AOxB5+drBITX/76UHTlkI
 yZmMgA4az6HVlWlVIS8Se5rTOBXUDIuU1iAD5HcT8e15mTemTTT8KfV+Ccaa8lZK305O
 S3gBflSrfoKywf0bmIbluyu8KKGoF/wQi9U/XuEQvi50+4RHXjR5RstzhkTSx0yJsd9O
 A/BQEW0cVnybfbuKkOaMj6ikMIs5gg0shiQ5ZPct9CVGFN4wlKSbFaYX7qPCkHToQ4z5
 dFKw==
X-Gm-Message-State: AOAM530x1fTPSCM+eWIQa0Q41dlz57fdi7hEITRHNFmnnzgaVPg1/aAy
 e4kRYtgRrbiBnibkf9L0sGEoYw==
X-Google-Smtp-Source: ABdhPJzV33SGAvd0Jb1oev8+ZxlkJOLEVgfLdNMNX4dst6BxAFB9xJdw5HB7bqXks4TpV4XIZ7HWbg==
X-Received: by 2002:aa7:8ec4:: with SMTP id b4mr4014973pfr.227.1598731918848; 
 Sat, 29 Aug 2020 13:11:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o66sm3242040pgo.25.2020.08.29.13.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:11:58 -0700 (PDT)
Subject: Re: [RFC v4 40/70] target/riscv: rvv-1.0: single-width averaging add
 and subtract instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-41-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <46a22b9d-b27e-f1c3-1d33-89b0d6024e5f@linaro.org>
Date: Sat, 29 Aug 2020 13:11:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-41-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Aug 2020 20:12:02 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the following instructions:
> 
> * vaaddu.vv
> * vaaddu.vx
> * vasubu.vv
> * vasubu.vx
> 
> Remove the following instructions:
> 
> * vadd.vi
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 16 ++++++
>  target/riscv/insn32.decode              | 13 +++--
>  target/riscv/insn_trans/trans_rvv.inc.c |  5 +-
>  target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
>  4 files changed, 102 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


