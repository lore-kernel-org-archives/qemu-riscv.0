Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEbn-0000PU-6d
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEbm-0000L2-5J
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:12:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEbj-0003z5-JR
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:12:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t15so108473wrg.7
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NPiRm6rllmea4selmN12leDe5rPLarTMpyZQiMtTcXY=;
 b=O0oiDP9XLH6m1jJ60jORhbqAzHtiDwgjHsPexg4wVg9DYzfoyZZTY0isnh8vLQTt5S
 K4bvkkM0pubDeXZBOhP6zJDaK7eDtCay0xDiylkxYhzJd7LWuefSMT5wYPsxIsHJoNoq
 ihI7dlqqxI6yrRcBzr9H1FCSap0x/MZ4/VEIQzraE+QksXeiLXYix3SlKFFGF3NbQnKw
 EAIgCtUAZ0u6ct38Nk3XU2S5d3KPSY9odwRAAgFkj6aXU6MsBATsZp6B1SkeHSueN58y
 zwt5MIEzLE+gUqGoYeoMQnYco7qLkGrSFu4EgtSQzkXRPihZXSHClPlbOFYK3wkYB6ih
 pDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NPiRm6rllmea4selmN12leDe5rPLarTMpyZQiMtTcXY=;
 b=SUpI0C9QqVOm5C10GRiqhZqfdxmjlQDkm6SubqU7s6nsdEcsR4Zhi6lS2SiQdV35Cw
 TuzEDnKw9qSu5niUci2tJ21WETLE5eMXChs2zcurfkdP/c6Sz0neiLfVHSKEGyBZ6CrL
 N8zl4vgMeoZZOELnBEGezEB4orm5IVl043woXJ8WugmmcfyvGooGcSMH/ftY4NhOsRX+
 5KKqHqKnXmpqWufBU6PMIViHj0oJoROevC+WshvO0tF56cdkEhKO76OFVwMDNvfmY1/4
 nF3pxK/O/a+Fl+yk0Nr9O2AH2j/15k97fvfab5Qg1MYXEd+hfhOK6ciCwAgrB8zhHYXh
 uf3Q==
X-Gm-Message-State: AOAM533+e1UQkCqgOM2nHR0MSEMnE5ucgiBuULvpD/liLkveSZCTwIfx
 Z/NawhFC9cytUMnKT0ruKmpNMg==
X-Google-Smtp-Source: ABdhPJzF9eZyLUtSXGjIgjuJzFNCUawRZBblPGO+R8D9LWWc9I1I5FfyOtGTXon5Os3j0ypvy2Jtmw==
X-Received: by 2002:a5d:4844:: with SMTP id n4mr563573wrs.191.1630696330232;
 Fri, 03 Sep 2021 12:12:10 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c9sm89871wrf.77.2021.09.03.12.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:12:09 -0700 (PDT)
Subject: Re: [PATCH 08/24] target/avr: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6ccbd42-8286-6a27-7bd9-e0b1ff3e96d9@linaro.org>
Date: Fri, 3 Sep 2021 21:12:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 19:12:14 -0000

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/avr/cpu.h    | 2 ++
>   target/avr/cpu.c    | 2 +-
>   target/avr/helper.c | 2 ++
>   3 files changed, 5 insertions(+), 1 deletion(-)

Well, avr doesn't support user-only. So... probably any instance of CONFIG_USER_ONLY is 
already a mistake.


r~

