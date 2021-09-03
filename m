Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEna-0001l9-Dm
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEnY-0001dJ-F8
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:24:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEnU-0005d0-LM
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:24:24 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso205089wmi.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xhb2pf6dd5jBpxyqJzpe7xZ2wUYNv9WKD5LryijCpLQ=;
 b=Tfvs4zKnJgWMA3WFUZx0NDZkNsbYyPdSxDeNP3eGb5mDuzvuAF81Kkf99YrvwEOvDi
 G8tZ6362/xRb2JFfAXTO9irr67uG4VGJxEU6rOH+ELsFMxKuLRrs570sQVN5s3KoNvz8
 2cRPqzZFNKp74aNav1KejQx6rrLZmQRJjP79crkXxCv4q63h3Sw293wUFlZ7ESe8doT0
 TuuuLSgibINIpvP05bcg48mB7LuHEdlsBuHx9lr/1wUtun6YOPUvYJST8/HZn/rtjZV8
 +TXoCi/mVqReoNbfKQzX60fk+ADusiIMrJSuBMA2Gqv/AzBJKk4bbplNI7P+GNw5ylBG
 8IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xhb2pf6dd5jBpxyqJzpe7xZ2wUYNv9WKD5LryijCpLQ=;
 b=ItRLPohf1LitvQDykEiC6+Q1Y5d7Qlzl6tX+LPIyVBgajg/yM3zOJfSjjgEJV4yb5p
 RPtFUDAPMzRhjnpi9PcwQdGsnOrjA8mcmwopNywEoejoIGv9TIhxKcgSUd2RedF7ZTk6
 FOkkOsvFkKauHt+UROPyulZjxLYhVohy7SuRN0ebq6gL6afpij2KOr9fRax0HF363uSw
 FmvHJ5T+gf3oWUHAvzP3APbaKzKxuATVy+5W6t11ZcsNN2FU2DCQkTgJ4ZX93fnOWNud
 D+hdpqxIfsi1ilqnnXWljoZfACFLPrJF+xY4FWipmd7kASPjahnM6IogvU6qbUiLlWFy
 neZQ==
X-Gm-Message-State: AOAM533h2EPf2uXlcZB7x8pjrEdMVisLwyUhPa0UQ9KOxDLaOvzzanUa
 plfXfVwBrmZ4Z0FsNJWDcqZbww==
X-Google-Smtp-Source: ABdhPJwuurvl+HMpUyFh9QvlwKd6+WQ/MpB4Apfc6ZFNs72bInJdpV51zcUa4xXI7hJSaurmDI3tHw==
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr278636wmb.57.1630697059149; 
 Fri, 03 Sep 2021 12:24:19 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y4sm207769wmi.22.2021.09.03.12.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:24:18 -0700 (PDT)
Subject: Re: [PATCH 22/24] target/xtensa: Restrict cpu_exec_interrupt()
 handler to sysemu
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
 <20210902151715.383678-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36e0fca1-fdc8-7353-759c-fca056e58b29@linaro.org>
Date: Fri, 3 Sep 2021 21:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 19:24:24 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/xtensa/cpu.h        | 4 ++--
>   target/xtensa/cpu.c        | 2 +-
>   target/xtensa/exc_helper.c | 7 ++-----
>   3 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

