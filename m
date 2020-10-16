Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTZTT-0006j1-DS
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 19:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZTS-0006gi-0u
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:49:26 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZTQ-0007lv-GA
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:49:25 -0400
Received: by mail-pf1-x442.google.com with SMTP id n14so2379036pff.6
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2020 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ve3PdkzHk4n5IOoMJJoojGyBFL6xlq+mocWgSsAMnlE=;
 b=t1xuSydVaKl9uk78Fp87cEsMP8g2eK7MDl8MDZqA5FI7neOvoRUvmhblYC7NWHuALN
 5j/uW+gg/Cykb9QZwmnw+7UFa7XQ9Q8PECUg23y1p9rmgCbnHal3KSXD3AebIJUUvFTx
 Zsrvy1QD3JkOZZwdLNWZl6kdDJmV24/MU66bSq+drL5vEQRbsbh+QyEAQJ57ra69WUi4
 BpfyzSmHyq4cqbk6jlROpyHuTYs9telzYOtX/1Mh0zl6ErZQrxYSn6rJ1nklOEviaBKi
 dhQBlegcoqrMAQc8OrZR41fVvxwnEUwx3/dqoZn0mK1mNcZUb56Ea7/PxwYOvgw7Rs0w
 L8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ve3PdkzHk4n5IOoMJJoojGyBFL6xlq+mocWgSsAMnlE=;
 b=VB9TQnp3ohFjA1pT9fmrq1srk9yo2hB/6DTX0i6qxRkFwmDh7GxoIhni6sSiiejbDV
 /jYPFrrQ5trj8ZG1ZPEl3epj6PmR49Cu8976XgLA542xRCp8kTZ/iwIlcRNiqi+QgYOG
 nzeDMLLsmxQQPvq0N3QScyEEZQlLgC+Z1jdcI5HXHIWT9MqPRIkTJ5AlUVexYJrF13Zm
 LC3ZmeCt2i/M3m3zdsxZ1I2OYS1hZazeyfQAfqlmjJ+10htytaaSrf7ZHcoxBIwQ/3NL
 l5tA/cOMyNqFdzIcezxOmOIcJhwnFLGHNq97KQKuLcp5rEWWWgMFuZac8WrL2MjaRYWT
 zo8g==
X-Gm-Message-State: AOAM532wdiLDPcgIy6R0OKqrKR2Rt8IxRS8AO47q3rj6BbWU9UnnSyIY
 H8+pTj6HAKR1QnCEPBcgZolbtrI4v2Ay2g==
X-Google-Smtp-Source: ABdhPJw25wbNCvg0FmWP85CAEIInKx+8diFx0XY0rkS47+jtZWmgNhkRBiQM5zl3VTh8eIW66lXkOw==
X-Received: by 2002:a62:37c4:0:b029:155:ebd8:304c with SMTP id
 e187-20020a6237c40000b0290155ebd8304cmr6267384pfa.73.1602892162721; 
 Fri, 16 Oct 2020 16:49:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t12sm3925121pgk.32.2020.10.16.16.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 16:49:22 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] [RISCV_PM] Print new PM CSRs in QEMU logs
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201016221138.10371-1-space.monkey.delivers@gmail.com>
 <20201016221138.10371-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08b76ff3-a2a9-8ed5-a117-4168720a31a9@linaro.org>
Date: Fri, 16 Oct 2020 16:49:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016221138.10371-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
X-List-Received-Date: Fri, 16 Oct 2020 23:49:26 -0000

On 10/16/20 3:11 PM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/cpu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


