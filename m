Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMElA-0002GR-GE
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEl8-0002Bq-OF
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:21:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEl4-0003WO-04
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:21:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id m2so18666wmm.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AirxF/1Ojk+fCoEuiSeMsmyf2tj8ao6FGm012i2T/0Q=;
 b=sevlGC1pCzeVwMoRjtXYJjjBTZwq9vjZq8qqnZ1nplVnGezS1tbdVI2jnKKQWTEM+r
 /FU4J/voy5kXRqAwJylyvasNc1tGY/TV+wYyftUnylcMKzVlr7f2qrwViOoo0LFNIvOR
 zWNz0r3vFv44KPQ5aZq3kDOOWfoSjueMC/2BOjhaM0Q+HooLC3d6vhdxP/FxQhJEvdGB
 OrKUA1idX8HAF5mPpG6ftrB2zOccxyIrf+WAfyfBAfFkp+Gi3FuurnZGY2crEvjKA2wN
 waKk9yDvdGJT8gGdC+Pb/aoJnlljY0eTpsjmApYQtdhPT0BghKXJ0/mMZP88xeGqT8gu
 JULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AirxF/1Ojk+fCoEuiSeMsmyf2tj8ao6FGm012i2T/0Q=;
 b=RIC2ySYG5WS8coO3xZPVyTOGLmTHJssTMM2PL8AO8cV8/301unq74B60xc8SIp8TqP
 T6xBDQsxfe9o55zZXH2W/VvzTI2h5ImJNyL3FmSWSI4kVDb+m88e22RYaU/4pBS6GEus
 MXpj7U1o/R0FOqru1e0EbFc5sEkF9BMZOQttBXECXooN0vJ6ZQyebhCj1i9ITqMP0i/B
 Vo2FUHiZNaj305ECdUl1Y8Q5VZxaIc98nWtS25wbPXv5BiktTWNs1AQL7qnKaGRDXgXX
 DAbRV6EpFyDEUnxOuCfKEaLRyMwZ38QHA6HuTm5RjEcwwVSYUWDRBY0UA42SRAP7ebp+
 nlmQ==
X-Gm-Message-State: AOAM532BedjkRAaADAS7SFwr2BKCDuggIJijNSHMCu6ASll1TtNpTH+x
 S/NjLeIzWuO0gZItFfPODLoD9A==
X-Google-Smtp-Source: ABdhPJzGP6E19Nk7gG6KMaCFLZ0/LN1kYzjR2OQ2T0qYlPfhh6isj079SDNSbQUnUhu+VET7Pcee3w==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr273025wmk.5.1630696908564;
 Fri, 03 Sep 2021 12:21:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y23sm240964wmq.30.2021.09.03.12.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:21:48 -0700 (PDT)
Subject: Re: [PATCH 18/24] target/riscv: Restrict cpu_exec_interrupt() handler
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
 <20210902151715.383678-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0eebabe-3e90-0429-1db5-525c02ffa95e@linaro.org>
Date: Fri, 3 Sep 2021 21:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 19:21:55 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/riscv/cpu.h        | 2 +-
>   target/riscv/cpu.c        | 2 +-
>   target/riscv/cpu_helper.c | 5 -----
>   3 files changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

