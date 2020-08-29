Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC36z-0002OA-3h
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 11:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC36v-0002Nh-TV
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 11:49:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC36t-00010S-Nu
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 11:49:45 -0400
Received: by mail-pf1-x435.google.com with SMTP id k15so2190169pfc.12
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Aadjgswy8Xi829IBXImVRmJTQUamQv5BeSPiLCgcTg0=;
 b=gsgJIRZehH2RNWJiCFA+Z+yxKgvIeTgUnYSCBKnvZhT9A4rySh1HjsP1At9Gw8XCAy
 AShQb1DpLmnsc4KVoaizt5lGdr8lZSGWFhFsw5nX0T0hIg8RsgAgg6r4TGyQzTSrGf6K
 d2tX+aiUSn+bQ3rXMfVjeCx+rn98TAtP+Fe8TuX02qRRLwKxW0VViTwX5PTVTFLjkGIg
 RtnJhYEa8vth9Pgugu5o2ouDhPpsKtQfltPdFcS0kqLyrESw+H18adHmY9XM88EO9tw6
 TWm2Dv5rUqzcAwBkKKg7M/XzbaVEx4oswgqfoiNqAIqQKOQoNLLrd8SgjhUzG58C5dvP
 dUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aadjgswy8Xi829IBXImVRmJTQUamQv5BeSPiLCgcTg0=;
 b=EMH2ys0f0pLOqQ1StAfjBXJZof9C7dwKJuOuJyPGs06ga1zT2j3Az4ds/s/YBPi9Hl
 Pw4PFCeZIRwRtAtVFWi8YdZazmwBjuyWCD0rMrxi0go4J5vTMo9b3xoIQxzjm0L2/dOH
 HUuIgARAoDOao71i2X3GEimUi6/vgjcPY8qvfcMyErxaG+gPNxnQZlmF4K1uYwY8mY6X
 czlZEAefDAbMx0RQo/GbOLsRe3e2jJgCUc6OZp7pBKVQ5aWSin+xlGn+cvgNzlVXzmaM
 IzWSyleCaMQxW2+lDd4FfjlRYUegrKEzPhSKh+J6igxy9ILOgAH2AEjtwPNinXewUp9a
 HAww==
X-Gm-Message-State: AOAM533U/Hv/cWsEBAAYKKKnpM4OMnqpID8B5CpbYp/BhnFnyEBp8zzA
 LoZZQxhkpuPn3eDu7b/RN6KAmg==
X-Google-Smtp-Source: ABdhPJzr5vrX9Af7iVe+bp7W9o/3nPZJUGahB05Ju2AGAmaqufsG1CzLiJ+7AbXTgI1W72hJk5Dm5A==
X-Received: by 2002:a62:1684:: with SMTP id 126mr3301939pfw.37.1598716181091; 
 Sat, 29 Aug 2020 08:49:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i7sm2784821pgh.58.2020.08.29.08.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 08:49:40 -0700 (PDT)
Subject: Re: [RFC v4 07/70] target/riscv: rvv-1.0: remove rvv related codes
 from fcsr registers
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cebc4878-b213-d212-28b1-5c6f78e5541a@linaro.org>
Date: Sat, 29 Aug 2020 08:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Sat, 29 Aug 2020 15:49:46 -0000

On 8/17/20 1:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> * Remove VXRM and VXSAT fields from FCSR register as they are only
>   presented in VCSR register.
> * Remove RVV loose check in fs() predicate function.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 13 -------------
>  1 file changed, 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


