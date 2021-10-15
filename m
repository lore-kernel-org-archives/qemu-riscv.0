Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbTxt-0001c8-HR
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 16:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTxs-0001Xw-5u
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 16:38:04 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTxp-0005Ge-8H
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 16:38:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so10169682pjb.2
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 13:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zWbKDnG3OuWdfxg14jGVAaQZVHbQJ65XkHq+72/38X4=;
 b=yZkQYHaD638JrYk9XKMqAe+cwwK00Venlm22KMa9ZMPOY2EMInwSyv9nTo7gBLTKNQ
 P0a7jKKdAa0gMh7QK3Cume6AzDUB5YWMG6uevr9Qvnscq7lM+YKtr2OXSKG9dsHM9Dh1
 dkNyAXzQbBottMC9H+xvTsPxdlnheQVQTXEeGkyHOW2ij3VCulUIeHALS/WoRDltEFp4
 JnVYKZtWtCNpMpYoTykhbeHkBXfPXaS1YuUFH1pFg3jbYsc+Z+IN9svQ1yhxNJ4VVAAI
 e8O0eq9OKchyBlNX9lG4laskT+he0huOogepepIxNZJ7+aW0qs/uKtw+0dRsm5u1Fx8i
 rZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zWbKDnG3OuWdfxg14jGVAaQZVHbQJ65XkHq+72/38X4=;
 b=WYcL2n8wCG/ehrgFRb7u6emReniTBP7yu7m+pal9OpQtoo8EG88c5eJDFmnAuF06H0
 MEUAY47lFc0rwYyf8oTBUTUVQKHm5qpeTMMds8/EW1XwlWdaR1plZb0e6y/04aOGvOWX
 q6DrbgUcgD38GQgShfy3FMJuncxZOQnwcyu0xlX8BFtnm2aUdDeqBLvEvTZeXnGLX6uX
 9kspvimcUAuZOCf9zX1Nx0sA+FqZx0bc58e1onB/hq6Hw+niDfOb1GAx5CfxdD0D64o5
 aFnXgCovIIVGKgf9+JzDJCv3dA8REubiuXiy7aeQz+OOUp2k5kGyJu9UJfC9DpkVcxEx
 0KMg==
X-Gm-Message-State: AOAM531uLTVEyKGYfIgwCnY5SkI/z9+1fpoSWk34k1/zBMr/7An7UrvB
 QElOjBBVPzZAwMNUWn0cr/lIzQ==
X-Google-Smtp-Source: ABdhPJxG+6nN24ODFJC1x4fsmrShgEg0uDIn6JZGN+TNjXb9jeEzAVCg6dE0hMi2aUWMHBtMtOH4eQ==
X-Received: by 2002:a17:902:7e4b:b0:13d:c03f:5946 with SMTP id
 a11-20020a1709027e4b00b0013dc03f5946mr12804501pln.4.1634330277926; 
 Fri, 15 Oct 2021 13:37:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a20sm5446886pfn.136.2021.10.15.13.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:37:57 -0700 (PDT)
Subject: Re: [PATCH v2 1/6] target/riscv: zfh: half-precision load and store
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Chih-Min Chao
 <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1afd1b54-6580-19b0-96c5-2179b793993c@linaro.org>
Date: Fri, 15 Oct 2021 13:37:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 20:38:04 -0000

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> +#define REQUIRE_ZFH(ctx) do { \
> +    if (!ctx->ext_zfh)        \
> +        return false;         \
> +} while (0)

Missing braces for if.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

