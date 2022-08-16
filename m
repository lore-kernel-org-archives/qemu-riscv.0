Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNkWs-0006RG-Bg
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 20:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkWr-0006Qc-6Z; Mon, 15 Aug 2022 20:33:57 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkWp-0004AX-RH; Mon, 15 Aug 2022 20:33:56 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso15915099pjq.4; 
 Mon, 15 Aug 2022 17:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=H30dPL6TD/uhifjhrNgF/8ibs95HjsoodU+8JbgeFEA=;
 b=byMsT9Co9+IRt57K97+bK8FIZgNJzFdvfegHNq5Ahwy1mkmXv0uULTFdLquRjCN6M6
 YThTZCgWIxYDNdN19c/Q//oKOz4lutarHwk8aAjMRQIeq1R1taQhgUODPt4aDz7TXwnd
 Gjd+po4ITAQC4tiIdVl2LmTWw1k9f8oOhbiPkxfuT7GBkKTp69PKTPFMn8cSNCboyPzi
 TE0YupLIaN9HFTQGKQUtJdkixB9CRYRlZTd2iWVFRhMoj4IchwECAcvzlxOuUfaN/n7i
 LoUbCY3IhSfjowZHzD7T1qTKgNUQ6nIsU6GKttb1UhVUw9zRqCea4n1Z8cJXKyAH37Uh
 eUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=H30dPL6TD/uhifjhrNgF/8ibs95HjsoodU+8JbgeFEA=;
 b=IWWTG4/dWyCic02+KILJRrs8pl6ZvKqjzA92avGXxQASQDi9c+x93VV6ZtLTf9F/Jf
 IMbFvomeCt5R2IstkNfLoPcEefmjEne4oYS3nViWOlOZf63A6arwmubgVNr1rxMlstQp
 7JU7iDN/m7zFDpqXLj0CYrmKuG9trCauiLQohDKb2FPaeHJ1ompvK7A/KEO0W0kEuq6m
 O+54BGLXmJAG/jXGx40mlgqMKHZ0LOVeA/9btG+a8scxBvjufX1dfYnr2u5P7VbnGgc9
 17QKZuBf20Uy7+Vi3NgyrYr76aU0HmO3rc7d+2l4TDvYLdl908XajvNiUQAgXOf0YzI8
 TMyQ==
X-Gm-Message-State: ACgBeo0SsLEut2xWTsH1vk+EHfDeyVAUSEELzKTKMzu1/rTNENFVzABv
 yNlsY7CFSezux8yCnrXWyPk=
X-Google-Smtp-Source: AA6agR5RWUb3KtwiMWYHs8+DwsZH8rram3dNM1i3cir/t4tXQbSelF3jndQ2YiyhUFpPnVRJcLmf0A==
X-Received: by 2002:a17:90a:c402:b0:1f2:ca71:93a5 with SMTP id
 i2-20020a17090ac40200b001f2ca7193a5mr20895325pjt.34.1660610033812; 
 Mon, 15 Aug 2022 17:33:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h88-20020a17090a29e100b001f303d149casm5028276pjd.50.2022.08.15.17.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:33:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <a773c5d6-1c33-47b8-3ba4-7a989019d05e@amsat.org>
Date: Tue, 16 Aug 2022 02:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 4/7] target/mips: Honour -semihosting-config userspace=on
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220815190303.2061559-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2022 00:33:57 -0000

On 15/8/22 21:03, Peter Maydell wrote:
> Honour the commandline -semihosting-config userspace=on option,
> instead of always permitting userspace semihosting calls in system
> emulation mode, by passing the correct value to the is_userspace
> argument of semihosting_enabled().
> 
> Note that this is a behaviour change: if the user wants to
> do semihosting calls from userspace they must now specifically
> enable them on the command line.
> 
> MIPS semihosting is not implemented for linux-user builds.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/mips/tcg/translate.c               | 9 +++++----
>   target/mips/tcg/micromips_translate.c.inc | 6 +++---
>   target/mips/tcg/mips16e_translate.c.inc   | 2 +-
>   target/mips/tcg/nanomips_translate.c.inc  | 4 ++--
>   4 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

