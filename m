Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pogYM-0008R9-K0
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogYF-0008Pk-PG
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:19:00 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogY0-0005NY-IA
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 04:18:59 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54f6a796bd0so332801917b3.12
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 01:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681805923; x=1684397923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQy922CFoQ2WCO5fbnhnFTYLRkzcnGkYrwYRZZCh+AQ=;
 b=PbqFxjjyiS2qvT2ds6oCxuLs0Oz5RVGln6zKIgofZPaFWVlEB+c0y7ph07iJEh98+a
 mb2tP2ZUPO1TIrQ8nKB4ZU3reDOfCI0ThYnvJrbFNP5U4ktxrCTF9FYRQWZIGzkwOjBX
 FM3PKWJAnPHRj2W2XVf87rTEu9hGce4MbFJBbDKADsiRDy7zaWcYv3BgHBevN39KSroa
 OBb25Sa3hFekGfhaLmvewruAkzSxWTB7F3VYUjYDDVt6nfJLolZY6mP/M2HZSC/YmmT5
 GobJElastYnLiCFANaNLz2c7RLtc5xqbhcficlMV2cM2tlFO+2RCfzP0/a+0ZurNTf3l
 b65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681805923; x=1684397923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQy922CFoQ2WCO5fbnhnFTYLRkzcnGkYrwYRZZCh+AQ=;
 b=k+pZ7+NXtClh/SpVPTbMxZULiMi1LLTk0arbIZhLTZaukkBi5lQeip7UrpUMbJT5OZ
 K7HZRGbZMkMoxGgU7wM8E8HJ5xQx4jNl1KWysl98n7+iOHbKHdgQ8MPqyDJ3clLRIgqL
 tk88lzLCJzOqEkaxgVJCXEbQ4Y14uUuxwsopNCsLi+OrBFfBHjxAsbTfZv0sSHUN8Eqb
 3kWaQAQ1lSNLwTfJdn1cwOHOhqOmaNXE0ZMBw4uwL3rqaypXEF7HzIOX0taWobWaHCxo
 6RhPezvEYjkjgmruJz6wOSqmXNVsSV5adORTd/Fy/a/BPAZ7CWGvmuwizpuUVXePyMFV
 BWLw==
X-Gm-Message-State: AAQBX9ddDoSrYJ+OtrcRITTU2/OKhaUAcSBskEaI+EIXyKZl1ewRuB+P
 SINSKgv3v5orQgL5sicuiVruJw==
X-Google-Smtp-Source: AKy350Y1LcPjcj+nW4iqZoKroo/cpx4ZtzHlztsEmkuSvwTwtkZeS692/L8v1SAJn+jTPTWjvCP3cw==
X-Received: by 2002:a0d:e686:0:b0:54f:179:cef2 with SMTP id
 p128-20020a0de686000000b0054f0179cef2mr18222812ywe.19.1681805922678; 
 Tue, 18 Apr 2023 01:18:42 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05690c031400b0054c0118bdb1sm3627446ywb.60.2023.04.18.01.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:18:42 -0700 (PDT)
Message-ID: <bd4ab670-290b-c6e0-daf4-0e5761168ce4@linaro.org>
Date: Tue, 18 Apr 2023 10:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 05/17] target/riscv: Refactor translation of
 vector-widening instruction
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-6-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-6-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 08:19:00 -0000

On 4/17/23 15:58, Lawrence Hunter wrote:
> From: Dickon Hood<dickon.hood@codethink.co.uk>
> 
> Zvbb (implemented in later commit) has a widening instruction, which
> requires an extra check on the enabled extensions.  Refactor
> GEN_OPIVX_WIDEN_TRANS() to take a check function to avoid reimplementing
> it.
> 
> Signed-off-by: Dickon Hood<dickon.hood@codethink.co.uk>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 52 +++++++++++--------------
>   1 file changed, 23 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

