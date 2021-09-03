Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEfh-0008UO-1d
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEff-0008PD-6P
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:16:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEfd-0007OX-KA
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:16:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id i6so141570wrv.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D7GK+3sJj88BNk3sugq6u+9Wl9JlKFpYFPE0T1064sQ=;
 b=bl6/Cimfg0g13Ql9djnGtOTacGvGuIK7MPi8gRR21h1fvHOVy4VSsAhDy77qa1KRek
 dVRkJYDIsiE4l1pBV35G5S1Xbm5V/7f5VfpfVgy4SkjY6X1CcC8cXVnpJ4F3BHhze1J9
 uSvaLA5DG2vhZwtiEugnFtqP9W7IpvANZZopocn+/GrtXToUU6+93uLF3KPvVq2CV8wE
 ZzldyEpqdw6YNh1pcmbFS9Rwah3vXrsMB4VGBVQm67DMq9+IvzJYo/YuQHVkwRvlB6IC
 2zqxb2//+cAMlgcsjZdagKplPfqoCIvkjmCNKE1PYeSFAPe5TUaZS/msSwj6BxTysAVa
 qSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D7GK+3sJj88BNk3sugq6u+9Wl9JlKFpYFPE0T1064sQ=;
 b=jUhrJDF62pFQGxo0KbbAfo8Vg8VhyRijE3w+LGeQHpeR1BWzxBBpRlB2UWun0eaERd
 xkM7LEcsUpRQ6zLB48rS7lE4EKLJvdC8olZwhKLkUN+woPo1qzAleZ5Qzz8k/s7AHK5i
 0YV6wJahdXjJYAKesOuz+hiugGI47BNkJzugQILG8h6VHsUoCg5//BIoebooVBePRSEk
 ZY1weTPl5eRltvlzUzSwouwWZLUscIutDs3E+7CGT54UtxHFaASf7c0cDavNe+H/IjGW
 WlXrj81sP/+1YBMW4qsMEJaXV+m3dpiyhf/RsjvrCPUP/a7u/3ENpYu0EelBoYnOU01y
 CSew==
X-Gm-Message-State: AOAM532UxRe9LUh/muhW1eNq2Mm4vKwUSnE/DHqvrMa615uIchZGcFgo
 okaIOYJ4iwPc5NB9w7l4hatLZQ==
X-Google-Smtp-Source: ABdhPJx9w7s3zbufC4iiXDsRVzgI9AR1f3D0gkr3llyec2vSyGKKIFOOa9I2iP/JQ74YpLpIWkVDdw==
X-Received: by 2002:adf:c451:: with SMTP id a17mr627979wrg.254.1630696572373; 
 Fri, 03 Sep 2021 12:16:12 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c15sm207795wmr.8.2021.09.03.12.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:16:12 -0700 (PDT)
Subject: Re: [PATCH 12/24] target/m68k: Restrict cpu_exec_interrupt() handler
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
 <20210902151715.383678-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a34a147-0f15-6dc4-752d-bd7cc7aae5dc@linaro.org>
Date: Fri, 3 Sep 2021 21:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-13-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-List-Received-Date: Fri, 03 Sep 2021 19:16:15 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/m68k/cpu.h       |  2 ++
>   target/m68k/cpu.c       |  2 +-
>   target/m68k/op_helper.c | 16 +++-------------
>   3 files changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

