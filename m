Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7I1-0005ID-Nd
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7I0-0005H8-Kn
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:17:28 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7Hz-0007NU-4H
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:17:28 -0400
Received: by mail-pl1-x632.google.com with SMTP id v16so1230338plo.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CRzWdAJqDpQKgmls6/eR43oF+CHqieoC7zSB41V7DAg=;
 b=Awoio+picoIJZtP3l9suZJKIDLh2a/Xeo1mDo/OYZzjjf2VQgYtwWs4rNTdHtunA5E
 qHi4nNASC+0KMBpntyaNtRHzdOWorSspajmPvDNDlU5Tm85E0AZhOQgm0kkiIsIrUqvK
 a3hWYxLFNpfLFmL/+ILA9X54OZ6LGuhZHFtoC1pYshCx2re997xlUb7A6RcBF3ylTpXy
 b/NWWgEBCzrNBh82Suvtljpk/TGqOZYWsQCgMJM7yVX6kAiLY0OqS6vLUh9PM9Vve6Rh
 fRhpFgWLXSXfnP/QzyQKUbUDUmvySAulJr4eXW1ZEfFyPvdZgRVMOyJDj+mqjfwOhr96
 DlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRzWdAJqDpQKgmls6/eR43oF+CHqieoC7zSB41V7DAg=;
 b=H9VI1pw061HmoZVxalyg10gD9aQLDXUco+dF/dYIhyzgwVRnTjFCVny56Wy06c55Zi
 lcuJwg0a/p4A5N9Ymd1hbuG0CpMrwFXzcYRUl1Y8woRibFWxVZQGP847D5bUMoGGxTEw
 DiHJfLPh6go2KrAuk0QMXZcJVHK2bQRDlc5pieNYNYkhO1c9YPkGuRDlvoQcTbP7xqND
 Sbl8GSG7X6VQtX/mZxCLR8FpNAnhceOTlsm63a8o4+3b5mcbyKa5Xi/bSsLWYZK5XJ7W
 DRKgBvz8yYiLp42a801Bg02ZGx0QAIz/speOsB80Fco7OJ9TDy7suyqx+OBGfzr8VkC6
 Dwcw==
X-Gm-Message-State: AOAM532KyHMATAHK6UrQHkwhTCZ8jRYAMk7622Uag7sqc+2I7VI8LSiY
 j0LT/+0bjd2oZTA/pQa82QecLw==
X-Google-Smtp-Source: ABdhPJy9Dy3UM/GtPLzhbzipVFhI123TuwhHAevI4tmSfp7u/mf7KHYNOF0A4qFNnJVhDE45hqo+8Q==
X-Received: by 2002:a17:90a:b108:: with SMTP id
 z8mr3983747pjq.39.1598732244965; 
 Sat, 29 Aug 2020 13:17:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t10sm3118470pgp.15.2020.08.29.13.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:17:24 -0700 (PDT)
Subject: Re: [RFC v4 45/70] target/riscv: rvv-1.0: add Zvqmac extension
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-46-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39cd6665-b74e-c61d-97ba-1ef1d41487f8@linaro.org>
Date: Sat, 29 Aug 2020 13:17:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-46-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:17:28 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.c       | 1 +
>  target/riscv/cpu.h       | 1 +
>  target/riscv/translate.c | 2 ++
>  3 files changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


