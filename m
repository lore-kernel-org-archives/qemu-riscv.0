Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEaH-0004tp-2b
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEa5-0004oK-GQ
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:10:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEa3-0002cU-Vx
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:10:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id b10so161219wru.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yJj673R8tVHoOI5p8OctJYJelo1hNmbZ1xfmdBnvOJU=;
 b=KCPm0seWx6K7WoXkOpsJ5tjyzRl6x1fq2HUx1ABY3+PjICIHrnN0u47UrFLv4h4Str
 PCfkvNTrQsE8t2zFlKFbFvNUj/0t93WG8Vla0VK6cWU0/AgQ/ix4Im4yPd3/EigmDR+9
 KidPkrZi+bvGMRRQw6iQ9DX7haaLsILz+lR3Ubw/CtO1gi8xbLEMkeazHGoOK/ik1LKt
 4u43f7JU9vYP2mHE+2gMi7adotB5SVVovb0L9p9PEW+bbJbq6nwPrYdkRuJkyDBQ5ulB
 gXF7mfRpqM4bS5uVNYnh9mPEbVO0G2woVljx9oob/POFRywzHFk4yPNS7/gIRkBQZa/A
 6fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yJj673R8tVHoOI5p8OctJYJelo1hNmbZ1xfmdBnvOJU=;
 b=LpEu0oYA0ruXZnqUBihY8bsLewW3n/mnUEVkVGfJBZzAQl8TAaO5iyFAyaqBnreXfX
 HhcxqDuH0bJYlm9CvNwpX3ny5mgy5orUQH+1XjKP9u6tPC955Fi/rooktK9k0O89lBwI
 iG+wQKssMgnN/tH0yR/FxNAyrhUpXYeSoMxntY66Bo/RkgPwNgR0QY5pDpdFiHr9X7Mv
 gncc2aFyBUWFpPfa5A963/en7rVgIwLzRLj8N3I2gfjQGBpZx2AFk3tvqnrYY+X20gf+
 8lgd1JkjwvLBfuABoKdXFTHU5rDcENN3gVGD8WDpZYic7wWz1Miepo8/yNJK5u7FDD6c
 po2A==
X-Gm-Message-State: AOAM531Q0J1I38YvTw6iDGHuO9l721w/K33dHLvY5bXMuRaLHdKCBOFn
 hwDJu+xlcK7800SJqU6lQO+5KA==
X-Google-Smtp-Source: ABdhPJw+U8wTg5aA4aCgDex5vN8K8KRWRKMbfgS4tKEzwLJ04A3W9RKqiWCDZcipao6j+GtabWYqKQ==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr613137wra.258.1630696226689;
 Fri, 03 Sep 2021 12:10:26 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id u27sm115064wru.2.2021.09.03.12.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:10:26 -0700 (PDT)
Subject: Re: [PATCH 07/24] target/arm: Restrict cpu_exec_interrupt() handler
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
 <20210902151715.383678-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d004f466-df7a-e32b-d999-0501989aeef8@linaro.org>
Date: Fri, 3 Sep 2021 21:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-8-f4bug@amsat.org>
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
X-List-Received-Date: Fri, 03 Sep 2021 19:10:37 -0000

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu.h     | 3 +--
>   target/arm/cpu.c     | 7 +++++--
>   target/arm/cpu_tcg.c | 6 +++---
>   3 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

