Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyKD2-00067y-6l
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 15:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyKCz-00066z-UW
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 15:15:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyKCy-0004Gi-2q
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 15:15:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id cv18so3279828pjb.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 12:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eqhuUVI1s7w3MF+FCKmU/idPUjAhMzCrUsSRtkzXNKI=;
 b=B1w6crUDbw/OVsoSpHejxkks6Y0jWvMvLQUW2q/0U0aUXnqlEfqrctmBapq8syZcjf
 UaRSYqmOOR2Dy1JeB2HKTSz8hCux9uPtpkXDP3yYdtpaVV+COUYk/oILOy7jqx3W7rIP
 ZWQUr1Px7HnSx6hwbQ5++Wb8zYwyKSo6H9iJtAnhrLT4wkcTCbngFNiK25Ja62v1kw75
 pPZEihFJwh1RKn58oJhokGP0ysZGyM6ae1sLgA4+JAkLtVOxk2MmD088lCUwHLlf+Tbu
 DoxtpVDotoFMhBD7poxqm45TdMfciyzgK/X9Mr6D7TyD1NiwRmLcR5l/f6uNUFnhCYU9
 8Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eqhuUVI1s7w3MF+FCKmU/idPUjAhMzCrUsSRtkzXNKI=;
 b=Q6jLQHOh7EUTS2ipTd864/nIdeVCOsvMNSh1o06IP+Hqa8u+QX92RyfjCZ7GWpYfv5
 iBOivEib1f2GDMfNK3D5c2IoxTpAUzx98/pdlt/BuBDwVZY4Tx1iKvQy8+cAzviMP3VN
 QXUR9IL09FkAcXlEkwo0oY7SDOTu6h4w12QfJ40ZXb+a9n8RFBqg7vz0mVYaHg4IyI7a
 LT1RHop+a7TmsFJGj75SiR1uQ+Gt6AQfV2PIm88Dl7xeVJFGKAglCIhmFJOC+sRZyjCD
 niwgLyYyJLLg7YOEooyT0+dc9kGvcxUB4kumm+vTJ4sL49p7hA1PZJhM/EBaZnXOiEw7
 I0Dw==
X-Gm-Message-State: AOAM531c/GNJuVo/U1lLCH1ecz1CJAiPWDJb8278cAmdnwS+zqP2fec5
 Bp4gRTPE6nXyAxjkY2vPvZvyhw==
X-Google-Smtp-Source: ABdhPJycIUPU5EF7YLgPyfMhgycoTyN3dwt6EJvPG7gYlb3cYDnnRo962EIQWdWrWUUZnBL+lcCQsg==
X-Received: by 2002:a17:90a:de8d:: with SMTP id
 n13mr754269pjv.95.1595445314386; 
 Wed, 22 Jul 2020 12:15:14 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 u66sm343370pfb.191.2020.07.22.12.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 12:15:13 -0700 (PDT)
Subject: Re: [RFC v2 19/76] target/riscv: rvv-0.9: add narrower_nanbox_fpr
 helper
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-20-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87cba14d-0ff5-97b8-b1ed-34872906495a@linaro.org>
Date: Wed, 22 Jul 2020 12:15:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-20-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 22 Jul 2020 19:15:18 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> For floating-point operations, the scalar can be taken from a scalar
> f register. If FLEN > SEW, the value in the f registers is checked for
> a valid NaN-boxed value, in which case the least-significant SEW bits
> of the f register are used, else the canonical NaN value is used.
> 
> Add helper to generate the correspond NaN-boxed value or the SEW-bit
> canonical NaN for floating-point operations.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h        |  2 ++
>  target/riscv/vector_helper.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)

The helper can be done inline in two tcg ops.

Though, really, we need to coordinate with Liu Zhiwei's other patch set that
also deals with nan-boxing.


r~

