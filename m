Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUCzC-0000IO-HW
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 15:37:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUCzB-0000Hj-A1
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 15:37:37 -0400
Received: from [2607:f8b0:4864:20::62f] (port=36477
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUCz9-0006tw-Qk
 for qemu-riscv@nongnu.org; Tue, 15 Mar 2022 15:37:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e13so9417plh.3
 for <qemu-riscv@nongnu.org>; Tue, 15 Mar 2022 12:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=I7Aa7EmBlIMzGewMy36GPmr5PcpZyewyBVoDANDUw0A=;
 b=nE62wo8fm4X7RuLGktg9fj6gvd+hyZ8ru/g8p+iJNeaVRC8rK6lO9GOgOcU6lfXKlf
 F4Yo83fdrIn++x4yRlDRS7tdNSmGlKpPtOQV0IdBH9PH1iPPfuoYWMGD+DTpcGsozby6
 Xjxx8KnqhgYcmi/QJdn8DoFvt/ms8PDWd3h8He3XV9a9XdKIo4q3d6tpizBWQszNvyjI
 jwTsTVR1Rb6zlegYe8jBjwrdq6KzzbRwi016JGAlgwQfdN+22dH2FrGiR1nFtK2kUbQH
 uIYyU+wHD3Z7HxTtEvix678GyO4ovDTRxc0NkZfMM7krXL7ng413E8wwdGZc48IDAhGJ
 4X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I7Aa7EmBlIMzGewMy36GPmr5PcpZyewyBVoDANDUw0A=;
 b=0AoY8dbkSw8oN34XitTFa3BXNIKJCRnb8dHC5XHsJrCIOnTQ3AmwgjIqrmVLbb6k6M
 1c7BGGTsavXNFNQAzIzdmZNK5cbUt5vIKcWRbp6lGjbvVxGZI+sxkXPQ0HQsDfnpHXqm
 FzpgDkQUWpyPaJqfQYdJD9VRsB8NUEIf38KdqRBpxaY/sYIN2FrbqQftHYtn2/lcvL/Q
 izEyBo3tm7sjbMF+5Xn3jhOMcDQvbwCqefRMGuQEvftMIvgloOedefcE9PioD7Mixm1a
 AErernhhBkoKGhO7arthEllYMdwG6Ih9Ecjn/mSBGUgT6oDUz6P+7ILjMchF5higxTCt
 prOw==
X-Gm-Message-State: AOAM532WYwNY80frvRDQkGfDZmRPnG1u1ZnksdGR5rd30ZEoXG2hE+4j
 1IGi5F/qJRe+9009qSfENIshMQ==
X-Google-Smtp-Source: ABdhPJy8iv4Si3XPT61Ieuc41AV9Pi3a9qE1OKxTjXdHkPvd1SL8RpHRtlZy8sSS1brTRMRutSJGrw==
X-Received: by 2002:a17:902:7888:b0:148:adf2:9725 with SMTP id
 q8-20020a170902788800b00148adf29725mr29810038pll.136.1647373054393; 
 Tue, 15 Mar 2022 12:37:34 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s141-20020a632c93000000b0038134d09219sm21731pgs.55.2022.03.15.12.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 12:37:33 -0700 (PDT)
Message-ID: <227bbbf2-ab20-14a6-2a3f-7f0e18c32135@linaro.org>
Date: Tue, 15 Mar 2022 12:37:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org
References: <20220315192300.250310-1-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315192300.250310-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Tue, 15 Mar 2022 19:37:37 -0000

On 3/15/22 12:23, Idan Horowitz wrote:
> If the pages which control the translation of the currently executing
> instructions are changed, and then the TLB is flushed using sfence.vma
> we have to exit the current TB early, to ensure we don't execute stale
> instructions.
> 
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   target/riscv/insn_trans/trans_privileged.c.inc | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

