Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOkZh-00028g-IH
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 13:16:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkZg-00023Z-3k
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 13:16:44 -0500
Received: from [2607:f8b0:4864:20::430] (port=38909
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkZe-0007Ny-J0
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 13:16:43 -0500
Received: by mail-pf1-x430.google.com with SMTP id x18so11730692pfh.5
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 10:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lHb8c6LRbXXl25tHeKYdiH5QYvEN0XowB0OR5dnP3eQ=;
 b=YGMK3lvDQYwbASKX7k7PK2/Han+H5JaaJWb+td+mIOhlfeiLcUj/vbIf1O6qbjJiQo
 SU0MiPLOqBatfoBoLm6em5+zToF3uIdFKm+MRDWiNFMqI/MC7pWlixGscRWyEYADnv2L
 IUzZdfT3xuqx+vFcEMM9Gxoa1X2ZMeIQdruSIZG1m7IOa92YWxDGS5MV/scuRRKSFHos
 0XxNsSO+jt873uozZFHLIltFiLE3sNNWcVQ3eKepZShkGpM7ok+WQeQ4TI1K6icYfPji
 2gkNBINY7gImn5rDyO9YzFl9zlg8wE7IUsREBFjsuAFtKjxvY+ZCxkAepYu1SjP6zxil
 vR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lHb8c6LRbXXl25tHeKYdiH5QYvEN0XowB0OR5dnP3eQ=;
 b=ZQucFBB1J+0neKYZlVhpFcNYArsQlccYzKopNQk2cgy8wR4Sw6a9bj+r+AXfIDIvHB
 6ZZEa7dpYt3TbCSROEoMkoNm73U6awEjFGKWQK6G7WWShfsauPZQRZYVo/57hA7rTvR3
 yZ54+OafN7SNq9BqPTmVoddmjqqrI1MZUqgvyZyu7myrblWtgrLCPbiBCiMNmS2m0FCn
 4nLQSUeOZJWfUqEQzAdOQDCGnfb7miqDOj1wNW4+cEjP+ZC3u5sFQX/BulWYuQ4lYOJi
 899xJJPLy2UDfni3wcQmlS0FwOPmEetQmToAHGR3WLKfmR1Cz4ZaM8BcS+a7CbfXWNeh
 +NgQ==
X-Gm-Message-State: AOAM5330PCPNWAgAWGNHDPEshMvVGg8pmWNmIWQSCywnUqqQKvpyfgVt
 IxOocjgwRaoMieLR51FxKDEG4Q==
X-Google-Smtp-Source: ABdhPJzF5eBgAUaYT2s9lu7b8ZbXL0sL6ES5zRIDNNZxAkgzV9ci/Rxi86mZyBna8uhZHkZIJKLMAA==
X-Received: by 2002:a63:4425:0:b0:378:8512:559 with SMTP id
 r37-20020a634425000000b0037885120559mr7326113pga.464.1646072201211; 
 Mon, 28 Feb 2022 10:16:41 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a634441000000b00372cb183243sm10983999pgk.1.2022.02.28.10.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:16:40 -0800 (PST)
Message-ID: <3fa7cc33-995b-a6cc-0e95-ad70c2f9ec4e@linaro.org>
Date: Mon, 28 Feb 2022 08:16:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 02/14] target/riscv: rvk: add support for zbkb extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-3-liweiwei@iscas.ac.cn>
 <e6a2401d-5ce2-c2cb-7ee2-fefe99818533@linaro.org>
 <68883535-a085-169a-044f-04349ad4cc9f@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <68883535-a085-169a-044f-04349ad4cc9f@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 18:16:44 -0000

On 2/27/22 17:02, Weiwei Li wrote:
> Thanks for your comments.
> 
> 在 2022/2/28 上午2:47, Richard Henderson 写道:
>> On 2/27/22 04:25, Weiwei Li wrote:
>>> +static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
>>> +{
>>> +    TCGv t = tcg_temp_new();
>>> +
>>> +    tcg_gen_ext8u_tl(t, src2);
>>> +    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
>>> +    tcg_temp_free(t);
>>> +}
>>> +
>>> +static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
>>> +{
>>> +    TCGv t = tcg_temp_new();
>>> +
>>> +    tcg_gen_ext16s_tl(t, src2);
>>> +    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
>>> +    tcg_temp_free(t);
>>> +}
>>
>> Missing TARGET_LONG_BITS here; would break on RV32.
> packw is RV64-only instruction. Is it necessary to use TARGET_LONG_BITS here?

Ah, I see.  So it's not buggy, as-is, but it certainly looks odd next to the previous, and 
it wouldn't be buggy to use TARGET_LONG_BITS either.

This points out that it would be a good idea to keep these generator functions next to the 
trans function that uses them, for context.


r~

