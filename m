Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMEik-0006R1-7q
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 15:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEii-0006I9-5C
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:19:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEif-0001P7-JI
 for qemu-riscv@nongnu.org; Fri, 03 Sep 2021 15:19:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m9so157464wrb.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Sep 2021 12:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B2g8xr6ORMvXj7zL/agIvKeijRHqKaWp1feA3q2tJ2Q=;
 b=HTZJSYdCYVcWzWgpyaFzoRVqlWweDFYNI8v7LCQcNqDS1sIkwWVt46k9HdpR3nk4eu
 rppyZnEWib3ZC0lKRXOPUT84wDV28zkhITv/lhlnWQiVfCHU5RkFOK8wZ6WAk3wzdm1A
 0SqF/+JuYO4p49YxOG2YaOJUWiFPMvHCtziFalpeh/5jAjapqXZUwhnAIeWICAAjY/ny
 znSJwKCfOY4inkfaoPxWYg+eezoW1OEcMADSyEuY4T9m8mpLTHJ9+t+sby4eIKiwwHmo
 jlvThXw4jqfGyNOyY39Gtxh5festXfctGOpfiJcbKnQaoVdRonpRgJS+L7fxoS6DuZvs
 nqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B2g8xr6ORMvXj7zL/agIvKeijRHqKaWp1feA3q2tJ2Q=;
 b=mXZUcK1NktbDd9NW5BYRUrtFGK/azbO4elCOMdK6lGVEqJ14EhIP68UESuwxdj9KxU
 /MOffnwMa5Kg19LMxDLyC3rpdXPQpRFHdDVsw+lvjF+N02MnNMkPuRI2a7aNpUQpxTui
 ylOFBgkgEDzjCFkNF1I390sHg3VXxVkWFiOzA4DL+EzQjfgUbhU9arTS9kPSCq8Y9q03
 P2XwZlBxgLjddkvs5u7yAD2UQYDGl/opDaR7GXgEJEg2vuX43EX2atI/WgEzQZY73xiz
 2mAFDzPj4FhNCcCjGQtRcxSpUAGyfzUHXWNizzFv8+/3xZsNSgyBXsFK6UCamr0KsCsH
 8MOA==
X-Gm-Message-State: AOAM531OoiEKtUWnqRCqvsvwzBXB421xdzMrzyEqN3KmdrTsbwGnto2E
 qGd23qZVxvuI707dfPdbbWWE6A==
X-Google-Smtp-Source: ABdhPJwN9dPGN2NgBxf/WtDjfoLoXxP+BDjGEicwTxo0YfqAqkxnp3Gq1RQkyfW1p36ht1QAi2Ah9Q==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr642363wru.80.1630696760130;
 Fri, 03 Sep 2021 12:19:20 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id r25sm122511wra.12.2021.09.03.12.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:19:19 -0700 (PDT)
Subject: Re: [PATCH 17/24] target/ppc: Restrict cpu_exec_interrupt() handler
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
 <20210902151715.383678-18-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42c8e86b-64fd-05d0-cbdd-c47558986b64@linaro.org>
Date: Fri, 3 Sep 2021 21:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-18-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 19:19:24 -0000

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu.h         |  4 ++--
>   target/ppc/cpu_init.c    |  2 +-
>   target/ppc/excp_helper.c | 21 +++------------------
>   3 files changed, 6 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

