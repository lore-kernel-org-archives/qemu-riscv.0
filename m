Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDFc8-0007oj-Rw
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 18:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFc6-0007oS-8F
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 18:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDFc5-0001KO-6U
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 18:50:38 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDFc5-0001Fa-1Q
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 18:50:37 -0400
Received: by mail-pj1-x1042.google.com with SMTP id bo3so4813328pjb.5
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x+2ExWCdgPOc2RCTH+KP3i3/Ob6BFksFsrU2ghAskyA=;
 b=qrJP6DsrbpZ6j/kB5IN9lBY+sW1mAFw3GXoansZKeJ0c1yM6eDRqmvqBvLo6r6JyUf
 9u1cf0BODSqX0/X/OJYgsSRUa3Jx68YsvRj9CthwztXL8MrnpwHEVNwyLCRTJ+D6HFU8
 Z/eW2dhRUoT9RiMLsLnhPOmPOAq7B/2rdD9HOglSvwpYxGFHMzyW8TduLJME1rHZp6QB
 B923aEFeFIL99C8m25CdGp2aPYv7ZFBA9wv4lT5dsf88GsRzKvWb4l8YEBUa2TB/nNGt
 phZmXYYr84H4UzKSgNcHRIOiQe6O2YoO6GYMf+wV3WmiVdQJRvg9rD0rE0zaVX6FIOr/
 4XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x+2ExWCdgPOc2RCTH+KP3i3/Ob6BFksFsrU2ghAskyA=;
 b=NRL9RZJ7IuLFwVMcS3ndFejX9kNe3J48ySBXXu0A2/5qlvvn4hTUxNje9OIW+UObts
 9nqodEBIrsewBDytcrxuuh11Am9dzY9Lo61yBKddYOdAqk8G7sSdEEtbQptIDy4u4L2i
 H1ptHu9sfoke9z7+dwQ3qV4OGg2wEru/0dEbf9kUj89q+4npskatAV79sN8vNyzpfMCy
 TyhfCYEhaMcgWmK3xTvo5ALawaXx05P5cWvbjwrMCERY9RBtlxopLSuXxTMHFJgvwG0J
 gKsJQMYjNpRA3fHDxqieFPFp8+etRbcmJM6cJvxBqk1R1bmehD8d1ib2fijM3Ez+Fxef
 guCg==
X-Gm-Message-State: ANhLgQ0vN2MXj0r1CQTPmYmCFccH+bcYlXes2iLg58GpSQESVdvWO9DN
 kowVg3rQSXJhoViOTB17pOr9tpNOAdE=
X-Google-Smtp-Source: ADFU+vuyWkEOWTfjkj6DCsY28Q3IYQO3mDOfnqczUrzy+HHMaZdCCmOi2+zSqAoCMIAEZqyo8AY7jw==
X-Received: by 2002:a17:902:b710:: with SMTP id
 d16mr17813001pls.293.1584226235723; 
 Sat, 14 Mar 2020 15:50:35 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 m18sm58477228pgd.39.2020.03.14.15.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 15:50:35 -0700 (PDT)
Subject: Re: [PATCH v5 41/60] target/riscv: vector floating-point/integer
 type-convert instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-42-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25ceee74-aadc-fd25-2acb-b78b28bbb6fa@linaro.org>
Date: Sat, 14 Mar 2020 15:50:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-42-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Sat, 14 Mar 2020 22:50:39 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 13 ++++++++++
>  target/riscv/insn32.decode              |  4 +++
>  target/riscv/insn_trans/trans_rvv.inc.c |  6 +++++
>  target/riscv/vector_helper.c            | 33 +++++++++++++++++++++++++
>  4 files changed, 56 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


