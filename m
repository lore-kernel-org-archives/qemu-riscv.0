Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaLaO-0001yy-2t
	for mharc-qemu-riscv@gnu.org; Wed, 04 Nov 2020 11:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kaLaI-0001y2-W3
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2020 11:24:31 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kaLaH-0008AE-6s
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2020 11:24:30 -0500
Received: by mail-pg1-x541.google.com with SMTP id r10so16990245pgb.10
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2020 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KkJj6LguC9285CDVew+iUQvZXtQK4Pc+c3R9AHxfrmM=;
 b=eXIIzWplnAYInHAZCdOfjmx4R6xCNB6lDpy8BnFa6iL1cofvKed0OqbL5WrdOB+4FL
 4ojKNo86ma8ETCALJ8YGz5VV0Xm5EP8b2WOjspxGNVPI1yizw2M8vgXuhJHzYQJU0XNL
 W8of7Qhh7+GRGGzbdCPRokw32rj2zHyFm3o75vF3HJO4y0K1vNQl6K+rFzvxTvt+t2Rl
 pdust4I7DZItqbfIYjKkMLC//y3I9r4HKRlHhHcvTS/OIAtgZ60rDrgjd9Xcgv1Zc5Eh
 fqBoSfTRIFoP951G5y6IfmALBX9sfU7i4ctCyui7GhnWze+eSl5rQYKI6z9vWNzfYNpY
 Qg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KkJj6LguC9285CDVew+iUQvZXtQK4Pc+c3R9AHxfrmM=;
 b=ExiZSb3H/8qN1CbLsBsolYzUaE1jwRkEajO6MVKd714VDWAf+r1WBaVbl5XdbpgjiL
 etjOcVsCdQUx8ILQV/2mlnPPWyWgzf3BGW74trP4EAmURVyi09P8QXiY0Cp3aESB0bun
 nhDLlm2QVOjFl0NPWK7HeWWclOEj5Sd+fo/fD45bbCPgfC8+zY4VPu0qxyRP+6Mzdbz6
 A5LRd+pddqvVI0We++M9wyW4foacGaF1Q04/iVnWWeGYNEdbQXkOHipHjsqCzcjKYxNN
 VMuS57tyWW1JHKin3rowYgOUqBpg+RUy5h1g6FntPUYpVucTi6dGNjnFByS5ByB7J054
 Qg3Q==
X-Gm-Message-State: AOAM530MW132Heb3S45RRDfPC+0hAQiB5VETU3aw5jyT5+Iggmep5quV
 nJ88ogqOh1+W7hGCEUzM6MLxdQ==
X-Google-Smtp-Source: ABdhPJyjLDRQexVHlYUH22VztEEnwN32e8UsMDMtZngb5wUZq+RcRilMEgxDoAqYRZEFYsAA85F+JA==
X-Received: by 2002:a62:53c5:0:b029:156:223c:e88b with SMTP id
 h188-20020a6253c50000b0290156223ce88bmr30438840pfb.38.1604507066888; 
 Wed, 04 Nov 2020 08:24:26 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id k26sm2977316pfg.8.2020.11.04.08.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 08:24:26 -0800 (PST)
Subject: Re: [PATCH v4 1/5] target/riscv: Add a virtualised MMU Mode
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1604464950.git.alistair.francis@wdc.com>
 <4b301bc0ea36da962fc1605371b65019ac3073df.1604464950.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <021fc366-fcdb-3646-5fc4-0ff5790e6b34@linaro.org>
Date: Wed, 4 Nov 2020 08:24:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4b301bc0ea36da962fc1605371b65019ac3073df.1604464950.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 04 Nov 2020 16:24:33 -0000

On 11/3/20 8:43 PM, Alistair Francis wrote:
> -#define NB_MMU_MODES 4
> +/*
> + * The current MMU Modes are:
> + *  - U mode 0b000
> + *  - S mode 0b001
> + *  - M mode 0b011
> + *  - U mode HLV/HLVX/HSV 0b100
> + *  - S mode HLV/HLVX/HSV 0b101
> + *  - M mode HLV/HLVX/HSV 0b111
> + */
> +#define NB_MMU_MODES 6

6 modes, but you're leaving two holes, so you need 8 here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

