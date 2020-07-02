Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr2oS-0007z8-0L
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 13:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr2oQ-0007wH-Tk
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:15:50 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr2oO-0002Ry-Gv
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:15:50 -0400
Received: by mail-pf1-x444.google.com with SMTP id t11so7946235pfq.11
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2020 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6vG7jpWndOAy1UZCZIPUDV2h1TOyEUA78r/89wM+Nis=;
 b=Im6DJy+j8H3c5TVp0z/clSnRtH3+0Ihzf/nMLRZ8ZGxMQMfNYJGF4sdlsBVqDXI3e3
 a+1/+nOG5qX+f5re8F2ajCj+oUlseULUxmrE3zleD/l1cLqbirvdKNttK18kPeZI59Tq
 KcVps8cpxMtIcbpGnDKc7tLABydyFgqnUlUAwKVyrErM7teVDdT0prOJBTKAraQtIdt1
 1gFtFQleD3QDY7b/i6+qH0aaZ1KneFkrKkKW4iGK/1wQrN6sRu5e1v4qQcDo2bpS7jEO
 3PqLyZ9T6qa0J8N/0OyBEA/iUzFYdLyvqGVqp9L+ApgB0tfkDgboh0qRc8RGpf5Yls93
 Gf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6vG7jpWndOAy1UZCZIPUDV2h1TOyEUA78r/89wM+Nis=;
 b=m4Ir5acMncj9NUZvhTIn3nXL9jI54zrnYG2q2FRKrEyWObCWGa20AeVjIYCnsCP385
 LlHM2H6K34tYSTQCmfJpYkk8gvqXX8lgUsQftTbeyrbFMUBH3739kX/6/9wMLBGGaf17
 E+dFzBu8S0kEOiKLm6lJSP+tSZkRH2//FtxnLDT2bx4whKHQDeMROgQy2mPY+ULlBW6V
 TTnq226l5zpoh7Sc35oTK4/xiA9w61xE6M5z5eGCLNxpsy5O/MJLgUq2e08qBF1zW45r
 Tpq8xEtuAWOzS6HtZ96QbAN5qDRaUBK8QaCvZpIm6j1ZgoQMWawQb1DUFs3xkyL2Q1p6
 C4Lw==
X-Gm-Message-State: AOAM532NVOUMGbfz9ZeEfxomYczVfF9/uoFT8HJ7jJ2Fga6bfuOmHPF7
 HPp3wZjN5T2R1pMjQgYjmk5YMw==
X-Google-Smtp-Source: ABdhPJxQ2niQ6E4JbnO2vRFZOWUrN2fnibu8Bl4rVUWR4Z2A/3EdjQbHuVeJ7WMuSAyjl3nfZP2fng==
X-Received: by 2002:a63:ce41:: with SMTP id r1mr1712942pgi.203.1593710146855; 
 Thu, 02 Jul 2020 10:15:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 186sm3047176pfe.1.2020.07.02.10.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 10:15:46 -0700 (PDT)
Subject: Re: [PATCH 2/6] target/riscv: NaN-boxing compute, sign-injection and
 convert instructions.
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, ianjiang.ict@gmail.com
References: <20200626205917.4545-1-zhiwei_liu@c-sky.com>
 <20200626205917.4545-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <704bff99-8ece-ae9b-cf28-8fdddf17e0d5@linaro.org>
Date: Thu, 2 Jul 2020 10:15:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626205917.4545-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 02 Jul 2020 17:15:51 -0000

On 6/26/20 1:59 PM, LIU Zhiwei wrote:
> An n-bit foating-point result is written to the n least-significant bits
> of the destination f register, with all 1s written to the uppermost
> FLEN - n bits to yield a legal NaN-boxed value
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/insn_trans/trans_rvd.inc.c |  1 +
>  target/riscv/insn_trans/trans_rvf.inc.c | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


