Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEgz-0002JP-Fw
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEgq-0002FJ-TK
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:17:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEgl-0008Fs-CM
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:17:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so216490wmn.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MXxKo2UCC7ElJgov5HnxrIOOIv2JepBr3hCE3i9yQm0=;
 b=ekz8NBKCkNG5colzCqoVrdGik2xvl5PiPiUF/tiLlRM193rIeI7eFXLiBPOlv5Vp59
 Nu9a59QNxzDPXKZr+qm6fSL5vRx1H2fdPcUAQ1ZqqWAGlRZFKDl606azUJbWIMp3eb/2
 Vz9742NtKM7V6lD/ao+4RB5HmjtwLa7rYpiyhv65odSrkp4qpth6l9JxTyOuejmcIrt+
 yrz43wSPFIb6UUm9jgNwkzkXFhpiU/RyH+YZwLuw3OpNO+IvcUYqk1E+VUmrSLiIAa6x
 6f4R5FsFNhuV66ltXk3E8CseDyLIcEteqQ6yWLT6L/5LIrFtcnOhO5WApOOI5CFD7vUl
 lC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MXxKo2UCC7ElJgov5HnxrIOOIv2JepBr3hCE3i9yQm0=;
 b=j0D+0U5PGRSDs0F+9bT93yR0A23xTAUgCallHDNJu79KnOvevSABF0LFanFHNOXG/F
 zXZTS7g1XmFiPAX3ylUL2MUOmnu6JUbmJJEA/cKH5VWz8Dzr+4KUtauIZzLy+1c8petR
 EGOQ6Fq1Wt4kGCo2ubscR6W8IRdZitjFVVY5X+7mMFxR+BzoK+HbpIeEQpfqtCoUmASC
 /iLWFa4kmHjvyICxG0EeQPebtr3z7/q2Pnf4F5qZc/2Hta2nyK0UfnP4gqcZqZRToeN2
 v6OTPoVXO6vsj8Iku1QKoeuA303XqhyNxRVpOMKoPo1oap9ZdOGij182H+I+nMLiGjgf
 FvHA==
X-Gm-Message-State: AOAM530INJhyrb13aS9JvU+XQZbGbCbDf63xfuXAbUKG4Wn7Y4CT/Qax
 UzkcRy913pOW+pKvqGkdjl16DI6+HzPcpVaVrL4=
X-Google-Smtp-Source: ABdhPJzqcHET28930i2ttB4E/qwHeLjMD4UIc67Kma+wbPRKU3Bb4NDzUIAWiK4iL7hQzoHNts6zyg==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr301738wma.87.1630696642107;
 Fri, 03 Sep 2021 12:17:22 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y24sm294760wma.9.2021.09.03.12.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:17:21 -0700 (PDT)
Subject: Re: [PATCH 14/24] target/mips: Restrict cpu_exec_interrupt() handler
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
 <20210902151715.383678-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64429f05-fe84-89c3-0c97-1f5564218372@linaro.org>
Date: Fri, 3 Sep 2021 21:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:17:32 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/tcg-internal.h      |  5 +++--
>   target/mips/cpu.c                   |  2 +-
>   target/mips/tcg/exception.c         | 18 ------------------
>   target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++
>   target/mips/tcg/user/tlb_helper.c   |  5 -----
>   5 files changed, 22 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

