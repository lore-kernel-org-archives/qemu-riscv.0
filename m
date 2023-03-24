Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfkox-0001bv-HS
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 13:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkou-0001bN-KB
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:03:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkos-00080F-Hh
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:03:15 -0400
Received: by mail-pj1-x1029.google.com with SMTP id d13so2040734pjh.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hJcpc4LqyzbKYBUF2Bmv43JqvjePOwUDPY91lLBsr4c=;
 b=cAiXKAiAJd1P6thbcUWdHTAeoNTJL3BwE0SOH/g1TJd1jU0PZN1oKn8vDljPwkiS2T
 MB9ZIIr5PE8uefnq9hk5PlB87rKGHwwoVEHyoN6848Rnt+aK/QqHBLe3g+Gwne8azef8
 LRwptVwEzoaG+x7vlUshL7jlyDj1+cmUKciU70ejcBU9banPzxyxGkLdh8LRhswXO3sd
 ZcLE7HR3bG++7HvvO2pEoXsc0Nfa4/I42OmVHnq3FdRQNUkXwIXyEHH7x2A7EO5lcpZJ
 7ButHBpPJnVdtbeQaDEClwCEc6ZsQ6IUYl2FfqvYnbK5iYBkWlljDHLozh5U1nICobl3
 6Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677393;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hJcpc4LqyzbKYBUF2Bmv43JqvjePOwUDPY91lLBsr4c=;
 b=A8gsp7r0gKNj2Nu863LUEv3uTDhyRqq5rXpqwcZ4rnhnSAdr4AQ9aF49KiqhdOvfxH
 VjtbTxjFryFs9/mNCUITpLjutkFD5ggXXSOObl5lwJ5XYzQZFm61HmB5NjnHL7EQ5maL
 tdAMyE1nypY8+MeHWtbCsysjha04Hhu2Sd/m9Tb759qbOv5oQ9kRjCYZ2w9oUKGeP5Xd
 19yj5dHawzdKgz4PpJjcPQy5n0VJ2zcONkkGKTTBqVOdXBFgHyL+QHA5A63qWOuO2FQF
 KxvmILySDLP1Ww25IAjGMcrWeiOr+7+WALFBRHynO9SmN1S+dB4+AGuhFziBTYbh/2zs
 wwjQ==
X-Gm-Message-State: AO0yUKUA2rRiMsiSsDSpiv0PGOLfwqbh90rqWC//SWtgzFrqpuhTfCqw
 6koVEMq6Cg5Xgayxe4wEOc6MiQ==
X-Google-Smtp-Source: AKy350a3++0sFlv20vAY7HnF56tGy03VDPyf7nHv2byTXZP2ltUgdZ2PqRLWdxPYTIQnMA91A+/LSw==
X-Received: by 2002:a17:90a:53:b0:237:d2d8:3264 with SMTP id
 19-20020a17090a005300b00237d2d83264mr3540447pjb.40.1679677393082; 
 Fri, 24 Mar 2023 10:03:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a6b4f00b0023acdac248dsm3217494pjl.15.2023.03.24.10.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:03:12 -0700 (PDT)
Message-ID: <bbba44c7-d527-8b9b-9dbf-c62172b27a24@linaro.org>
Date: Fri, 24 Mar 2023 10:03:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] target/riscv: Encode the FS and VS on a normal way
 for tb flags
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-4-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324055954.908-4-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 17:03:18 -0000

On 3/23/23 22:59, LIU Zhiwei wrote:
> Reuse the MSTATUS_FS and MSTATUS_VS for the tb flags positions is not a normal
> way.
> 
> It will make us change the tb flags layout difficult. And even worse, if we
> want to keep tb flags for a same extension togather without a hole.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +    flags =  FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
> +    flags =  FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
...
> +        flags =  FIELD_DP32(flags, TB_FLAGS, FS,
...
> +        flags =  FIELD_DP32(flags, TB_FLAGS, VS,

Extra space after =.


r~


