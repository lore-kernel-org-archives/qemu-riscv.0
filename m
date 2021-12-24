Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0sIR-0002jo-OX
	for mharc-qemu-riscv@gnu.org; Fri, 24 Dec 2021 16:40:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0sIM-0002jS-GN
 for qemu-riscv@nongnu.org; Fri, 24 Dec 2021 16:40:10 -0500
Received: from [2607:f8b0:4864:20::52a] (port=37748
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0sIL-0003jj-07
 for qemu-riscv@nongnu.org; Fri, 24 Dec 2021 16:40:10 -0500
Received: by mail-pg1-x52a.google.com with SMTP id a23so8482781pgm.4
 for <qemu-riscv@nongnu.org>; Fri, 24 Dec 2021 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZznejU394oWD0Pzi7sfSds+mjvZI5oc3gwA73KQwbO8=;
 b=QX0hgta8dzplUNtH49wygRkCGWk1/5zxh4sQ04tQc2VoGsSwPkSvMWyK4C1IxBcLH0
 BA7Czl8P0GJFPgxnSSO2PdApt27FeOtzQ0TTbLeoIhuyWJ9/1LuLrSiSppQFWER5Lu6J
 r7eLPOPmEjHtwWM8StBiyfDn35hDtWTO1j8o3IoSVPut0dYkb3WbzJSDs5o8KMwMZe2Q
 xOE6/ej3b7n+KvLyYYmtBkQTzJegduybxIyOTniano1hE/d52kKkFgG4FeEZ0QTerlFA
 TQwNCPFGOnORiyXuMk8FgzjKt9OIgyzJsGC76sT1GbVbif/0GS1YqzIi7gUXk+rrvmsN
 0inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZznejU394oWD0Pzi7sfSds+mjvZI5oc3gwA73KQwbO8=;
 b=4/eTrhTkqTbxfsr8BINb7qClwoCW7nu7HAHgEwzSp1JOanQhThsJEhllWbi/3EY2w0
 rW+f+/wRi4vIRtojaxvIh3OrwM1iN++5bxP4HGMyySlIa4kMM98zWr8QDgkGXzRxx9Ou
 nvWDyTTjoy/5lWXpRj7fO4JAtlLwsvgL+R2xkSiIGqj5g0wvI0wZIcerBiEzcd73zWC7
 im71wnG91sutq++WYtpHNTtAOtG2IJKpW8S+s/2ufzeYyV7ftzwnn9G2fIOvKKfqYih+
 K0T0t0MVo6H7307xTIa38HG2N+lO5esglBd0CQfjcxPzX7AcS+RCSQOqPyiOttfD2h0U
 a95g==
X-Gm-Message-State: AOAM532txJpKluMkQkxAvWx5FMigGuo0vepF4WvRIrEm/v5jPLs+I4q4
 /3+jnxEzSiLchPBM9kmBRhMTSA==
X-Google-Smtp-Source: ABdhPJxrGT2LWjvEj1rkFXBBBJskZPqlvrrEsMZ9p8ILBO3un/TaU08xOVjwyiaKg7jj1MiMXu+NKg==
X-Received: by 2002:a63:3307:: with SMTP id z7mr7424119pgz.498.1640382007288; 
 Fri, 24 Dec 2021 13:40:07 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id c19sm12490579pjv.39.2021.12.24.13.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 13:40:06 -0800 (PST)
Subject: Re: [PATCH 1/6] target/riscv: add cfg properties for zfinx, zdinx and
 zhinx{min}
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-2-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7c1d52b-931c-8e75-7076-2af32b346aa2@linaro.org>
Date: Fri, 24 Dec 2021 13:40:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224034915.17204-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Dec 2021 21:40:10 -0000

On 12/23/21 7:49 PM, liweiwei wrote:
> Co-authored-by: ardxwe<ardxwe@gmail.com>
> Signed-off-by: liweiwei<liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang<wangjunqiang@iscas.ac.cn>
> ---
>   roms/SLOF                |  2 +-
>   target/riscv/cpu.c       | 12 ++++++++++++
>   target/riscv/cpu.h       |  4 ++++
>   target/riscv/translate.c |  8 ++++++++
>   4 files changed, 25 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

