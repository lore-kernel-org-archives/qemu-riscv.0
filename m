Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC79q-0000wR-1l
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC79o-0000um-J6
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:09:00 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC79l-0006QP-QV
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:09:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id d19so2119211pgl.10
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tg0E6f9OQNvh/BnXlBfIae17jTkbuulpyDuGvV5AUYg=;
 b=kTZi9l69Xwe+fYpHhfOpuWJXph+Plg8H5v5VdMAhTkQ/BPQXDUKvh4kukLwaUAiKJo
 xy9vjjU4e583LPbc3gHEsZEHU35qHYVbnmJxqdFh4gH5y1csd5CXRlJuoyny8njhjHXX
 ZnXwDDDKTwPcp8afjzvthVVau6pC5kSkG43+cAQMQqKASoHstALvsHHnCkuE0W5tUR5X
 xakU+l1zIkURvpu7BpmG8JbVXCR7EoFhEt2kbw9t7/f90rE+rohnVa2dfm7Rk+eDrrJN
 mM3slQYETLNx7cCGMACDJUzkQxk4WLqBNjXnthFitBikMM9q2tJC6GBrdWDbSGPlYEKe
 iJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tg0E6f9OQNvh/BnXlBfIae17jTkbuulpyDuGvV5AUYg=;
 b=jCc4WNdbHv9YcY+nI95e01et9G8ae03NgaeNNaN4IVZTv6lrYet+qUVU1dsspLD9co
 SW9QfazO2f1WMx68PhC9pgC2kf5BPPqwFjzJ1JOkn6hJOv98GF6VOwrlqQAx1oy16N/x
 Cu6oe0x9bbaX7ew+Dbmb7NEpZR40JOB2+GsUPlzexydTu/d7tFdPcyMaW4zmA2uVIwd7
 pizqFcpQIWMAIzzF9kDhCnk7uMLDMQA09puNCWk4Fph/t4wh8O4B/dED2CXQHUwcrusA
 RurgqoqVF5PiiQfjpi4GXn6FlCSKxqMLI8TUUytjmR60SqCH2uHM5a9iUsTGhbDX6tOH
 GQcQ==
X-Gm-Message-State: AOAM533QRKptfsbxdtm1F3B8fq1glRhwgGLHjJAM8wAKZh/i3+lsBKIX
 UcUZRaMGUTn+3xAH/W921ktr7Q==
X-Google-Smtp-Source: ABdhPJy1Sr1sBlNe/izVfDzWt66cjqzb2JnABNEjUzs5JkDj/ML2+kpB70rfv41s0eHwcCR5iTvh+A==
X-Received: by 2002:a62:4dc4:: with SMTP id a187mr3897386pfb.265.1598731734403; 
 Sat, 29 Aug 2020 13:08:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v18sm3308820pfu.15.2020.08.29.13.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:08:53 -0700 (PDT)
Subject: Re: [RFC v4 38/70] target/riscv: rvv-1.0: whole register move
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-39-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d568af82-6856-2875-bdea-589e000548f5@linaro.org>
Date: Sat, 29 Aug 2020 13:08:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-39-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 29 Aug 2020 20:09:00 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the following instructions:
> 
> * vmv1r.v
> * vmv2r.v
> * vmv4r.v
> * vmv8r.v
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvv.inc.c | 25 +++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


