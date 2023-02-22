Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUtPW-0007QY-FK
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUtPS-0007Ps-8X
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:00:06 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUtPQ-00084j-L2
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:00:05 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso9618408pjb.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4spnsT8GCAezU1q61uippCrq9JCLiNkntsXRQ1qJibw=;
 b=rlRm9E7GADNi04OQOAitc8H7uyEoX/Mzofh9H41I1SS1pNRcoCJYXrwZdrdoRMws0T
 YBdAhr+izhqeZqYrT02sVHmRKw92inp/06PL1380R8pebAOG2HUbchCLaVNSSg2FS+Go
 70gI8oDUtJ0R62RAipHYXSMdhIrGHeCCEzPBMDYZ5C/npLaKE5/FsDntzlkfF5r7Zx2n
 CP3fZDqx5wy/OA6o4cdwi3u74TCf0dbGuMxrGSWklKaZsocl72gaAzAdKH/Iev22dDUL
 tsEXPLTqsnIDJDkKwvKYd2dFfRWlDq0M1AwUoLUBx19qCLupU4jgcdueuaYtqt5LINBy
 lBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4spnsT8GCAezU1q61uippCrq9JCLiNkntsXRQ1qJibw=;
 b=kVCm0yK34rgl7NV5LnTys2eNAdmsASPQipKjGd8fN5Sw5nDpHzeMjrzgrOn5qCpTtN
 IrSsnt2aV/HnjEC6v6CbDNf60YkP5bw89l+8k4nW7J2/AyCM2gkZwnPPdEN2yuzeyff2
 worIQIWrTpWFh38Xo/CqaFpQlPsfCbL/hlIyLRt0q8T/9DkTm5eAAqPbEnwH3fZ0lKAT
 +qfFieu0L7RBTUkw+D3kQwcWegmdw1MatAPjVJMiSEDGYzW+7e50WOsiyaTrMTrO7og6
 1/hTfSLh0wi9NNosrdjIwZrefILI6l0/hLTk+5CfBMnCoXpDT2vyYAnPuNtXiLnRQXLm
 oOXA==
X-Gm-Message-State: AO0yUKXIrOflJW4hq0oLGCCoLj5KLaBC5b5EvS/rhYKLZ3jdDDpHeZq2
 eTheH9VEwsbS/BGENxfGU6sTVg==
X-Google-Smtp-Source: AK7set/rZUASEFzypVn3bGzfIum8wKwzBwRvzJp+NUwt7AJTsMCHiDrs1/kBP8p7O2yMboEwmvXE2w==
X-Received: by 2002:a05:6a20:3948:b0:cb:f76c:e144 with SMTP id
 r8-20020a056a20394800b000cbf76ce144mr1156145pzg.12.1677088801943; 
 Wed, 22 Feb 2023 10:00:01 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j15-20020a62e90f000000b0058bc7453285sm5609308pfh.217.2023.02.22.09.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 10:00:01 -0800 (PST)
Message-ID: <9923e8af-e00e-8105-2bd7-2c902770b1c7@linaro.org>
Date: Wed, 22 Feb 2023 07:59:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 2/4] target/riscv: implement Zicboz extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
 <20230217203445.51077-3-dbarboza@ventanamicro.com>
 <20408b85-2ad0-4cbc-4ccd-c512ba15ba06@linaro.org>
 <d468f8c6-f8ec-6d40-44ab-3e76df458680@ventanamicro.com>
 <4e3ac25e-6443-9365-66e4-ebd903aa29b9@linaro.org>
 <4247ca1b-aa4c-9494-e634-c8114758bfcd@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4247ca1b-aa4c-9494-e634-c8114758bfcd@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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
X-List-Received-Date: Wed, 22 Feb 2023 18:00:06 -0000

On 2/21/23 23:37, Daniel Henrique Barboza wrote:
> Do you mean that the doc should tell whether the address to be returned in the store
> access fault should be aligned and whatnot?

Yes.

> By reading target/riscv code it seems that all store acess faults are being fired via
> raise_mmu_exception(), which is only called in riscv_cpu_tlb_fill(), which in turn
> doesn't do any thing special with the address before firing the exception. So I guess
> we can assume that badddr = aligned?

Well that's certainly how the code is written, yes.


r~


