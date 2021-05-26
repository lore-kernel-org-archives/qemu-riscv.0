Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llj2b-0001DO-IH
	for mharc-qemu-riscv@gnu.org; Tue, 25 May 2021 22:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj2W-0001Bg-MI
 for qemu-riscv@nongnu.org; Tue, 25 May 2021 22:12:56 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj2T-0004UH-J1
 for qemu-riscv@nongnu.org; Tue, 25 May 2021 22:12:56 -0400
Received: by mail-pf1-x435.google.com with SMTP id f22so16702352pfn.0
 for <qemu-riscv@nongnu.org>; Tue, 25 May 2021 19:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1ACUOCqdn17RVm5Hag3M2hwHGksegtAeTMD0aHzy6Io=;
 b=qrQXyVyq4QwWLodHiKbngIZmMttCwZNmfiYBNokad7jPpp5yeXzKqM0jzSotuYa7h/
 ELtet1bJq5C/4sUhZM9ppd+/xqW6nm3Xsl6cv4F0h02PUr4I8Ff5AD1fRfvAKM8NJDQG
 RyVLTWIR9iDNtNJ7NKi7RAEjsbhkw1GOSCKInULcU9HTFLe8Nd7MZ2EDtmYSKbJwBE4X
 kEIliKxUWZMuyi4qw7fuys4TzpliKdKC4D0hBuL427RvuVBiylC5Z+zMKA74GlTLEGTW
 4d7jFl/L4OI2EiZqEFVnyJaufrHuCihSzuy7ZbTjgTdzFVH3uTq40Eg99FMtgbKCpjdK
 Fp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ACUOCqdn17RVm5Hag3M2hwHGksegtAeTMD0aHzy6Io=;
 b=ZTHhw2RUGz7S9C6exmc5FaeUrY89Arnw2iecy+sXbY8z01UbP1hRkOuRJ28EYdj8Lu
 H0ygQBIa8d473Y+v8dNpflSo96rdkr2i5gVZvbAwXkRSWYuorgXgSGok7A7IvjLo+/xh
 az/5imZj8G39TuhHSewCHMTPceSuWPnqHo9e2tsT2uQxaUFIoVVh0HmX+4OdB+9Q6xI3
 XIUlNrHV+ROrIEdYLBZ9ScowGlA/XDI+7S6bHooTOodB/tLg1+jvSg2ZuYm4TITMrnV2
 eWI5kd2zZo0T0LRtPT7oZBZhFlnuWOjjjxCJb8944LdxCRumpHf6X0UQCzAExigN5oQJ
 GBlA==
X-Gm-Message-State: AOAM533Ldko6LkXD2y8VVd79dqpPIZEQ/oFV3R5S594/2L9P+7tKUdLO
 1/VcRZnGa6EylLkcs7s0fcgYvQ==
X-Google-Smtp-Source: ABdhPJwpjNPQN/rksGJ+m4RDVaGoTXcKZZG9oQJqWZ0rGLn8UH5T4t7HN7oRGUGruzIpIzMf3cHVyw==
X-Received: by 2002:a05:6a00:1a4f:b029:2e0:754b:88c2 with SMTP id
 h15-20020a056a001a4fb02902e0754b88c2mr33161712pfv.65.1621995172039; 
 Tue, 25 May 2021 19:12:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 13sm14779492pfz.91.2021.05.25.19.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:12:51 -0700 (PDT)
Subject: Re: [PATCH v7 02/23] cpu: Restrict target cpu_do_transaction_failed()
 handlers to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae262a9c-1ffa-b680-4aa6-d7256fa6947a@linaro.org>
Date: Tue, 25 May 2021 19:12:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 26 May 2021 02:12:57 -0000

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> In commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops")
> we restricted the do_transaction_failed() handler to the sysemu part
> of TCGCPUOps, but forgot to restrict the target specific declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/internals.h |  2 ++
>   target/m68k/cpu.h      |  2 ++
>   target/riscv/cpu.h     | 10 +++++-----
>   target/xtensa/cpu.h    |  8 ++++----
>   4 files changed, 13 insertions(+), 9 deletions(-)

What do the extra ifdefs buy us? Surely the fact that the symbol is not present 
in the user-only, and would produce link errors if used, is sufficient?

r~

