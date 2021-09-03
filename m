Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEqQ-0005rl-Gk
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEqO-0005ju-FH
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:27:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEqM-00083i-2G
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:27:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so251721wmq.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AvOkOfxkdjDhX5Hr5pmdj5uo1fcSJm4IVvX1hwx97Ao=;
 b=bg+OFO0jqAgHpuoaC0WJbFBZIOk5qGYibVH29fChJgML2kxJWhKF5Jxc7LLSTQPRTg
 26syI9O8VN3Fm59ICWq35/9jBjTtYzjL6cI62D3J0UREhARdJdIFlLS+P2CxzspRuf1h
 JLUrMaFBOh5TAsSu3T8T/zJZ070GAAQ0N6l+g4N681MpHCf+7Ci5Zyn7sENEEF9FCoCY
 biL7rLxIoYJJkISAQ7Fj0YlWWWULMzJMQ0HmocJN1ywsf771paJ6Pgk8nJyRea2+3LTl
 woAih8woFSfHcKgqmE+pI2wqoGmbWaASbrGCZS16i8YkXZR+AMxemau4GbNlT53rJ1AF
 hAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AvOkOfxkdjDhX5Hr5pmdj5uo1fcSJm4IVvX1hwx97Ao=;
 b=H+w9n7g7G9c81cKYqBS9Qo9ynE44GPYqHirkP8XA6BWmyDQ0v5KYE+50MibgVA4jUX
 L2Zvd6GuoPg7qa/+DDICuOI+ocdy68rcCsJeJb36ej1YrpvUAuIMNyQgBdr757gXvHNj
 pX3/1bgdXTGUaq0NyTwQUJxlSWSJmjDmFCkXdK0u+rP5Tak49q8+Vz4YqZSby24V0ACB
 kX7WsxIEeXGiKZhqLYBIzLfj0llUb5uY62dgPyue2vL4+mjtI0pRQxOnU7s6R6JWltXw
 L4VofzClt6prWwRfrjIGM2NEcKih612CVVso5qK6ug75zn/9Pw24OaDdVBjXl7MPUqS1
 vTCA==
X-Gm-Message-State: AOAM532vTDC8JaWtwq2DZ4k7K/D/GNONCikpL9Qdkkn917MTeMXon+kj
 p8OyHb4EBybhu/ef5dOlmlcgzw==
X-Google-Smtp-Source: ABdhPJwDvInXskp2g95n6Qou57qQhZ4Z+Ha1JnhpK+wRIDNvLNkuA6PQ31KSuCxfJ2bn/4YnN2TTIA==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr333732wmc.23.1630697236443; 
 Fri, 03 Sep 2021 12:27:16 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s13sm248122wmc.47.2021.09.03.12.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:27:16 -0700 (PDT)
Subject: Re: [PATCH 24/24] user: Remove cpu_get_pic_interrupt() stubs
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
 <20210902151715.383678-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc9cedf2-cc77-bb8a-3097-0c16b6912042@linaro.org>
Date: Fri, 3 Sep 2021 21:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:27:20 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> cpu_get_pic_interrupt() is now unreachable from user-mode,
> delete the unnecessary stubs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.h | 2 +-
>   bsd-user/main.c   | 7 -------
>   linux-user/main.c | 7 -------
>   3 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

