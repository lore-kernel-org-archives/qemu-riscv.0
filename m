Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8MZP-0001PN-Kh
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 09:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MZJ-0001Jh-Mw
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:29:10 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MZI-0006iH-7D
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:29:09 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y8so1789162wrl.13
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SO2XheO8YJfqLCfc91OBL3JWp1dxvx2bT04GTmFnMaE=;
 b=u+oPZ4dQShNmu5dmBhnTmP9KUOX5K5IERidPYjOHcy2bL6jP/wrZpHYa+62c8xcsIg
 4JkvFcFWJ95uFsLerxwqrdm6uxnBqbexNhuxO8S8WT5TKyp+gzsMPNj8sAbZh/rZ0Trn
 8g8hcfPs+PuFxu0Ozn1UFt9TOnBHksXfydHG2wESUjKoCrNDNqM0fT4nOEbXjREtRXBB
 gf7DSUMkWwf3FOe1jssY1O6+Uwfrxnc0/R5xWNd3HI+XC1BnrNHb+KBRCPDsPxKHGAUP
 dVmTN+9KLWuqtHwXD5CTkbvQq5poCiMPRq4Pjkqo9xn2/5M5gRj4GrbNzd5mhEWuAg4R
 UZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SO2XheO8YJfqLCfc91OBL3JWp1dxvx2bT04GTmFnMaE=;
 b=Za12oEAGvTZDH+VJA5qm0gdQGskN+ENlrwStpO4G5azEFQ1QqkhTqfORzzZTtcrAdn
 DLoJnio++yxFl6eaL6fORXkhvDKeW7nxDjU7PY6bBEAdQhHnL1SKxrjbQy1Bdr12fMj6
 OLrDOYX6peqc4RzKRGfCC0xaOhLnTU6QHI6qm8F6qPZaQueMfFbOHOHvUxi52owFznP4
 nwcEj13QlWS1L+3bykjmoM3N2iH//cUtrYNb6H/6b5apN5vd23XYk7Uow4ScLyxQ92nL
 mi02Bt+c+UMWPWsMiyjkUjq3clAT0G4xs3ieEtK67QHLhaLJZkGirpzFHTXDscy7vtGe
 DpmA==
X-Gm-Message-State: AFqh2kqcZBc8DjNqT7EZHjpCz/ZdWhZOd6qM1iIZjQEjSgrqPxiepn7e
 FTWaFrs7cNI4trujjj5tstNb/Q==
X-Google-Smtp-Source: AMrXdXtIIt3QKwzOOSvNhm9872Fj45paxh4dIUtN+VNZtvsm4TFW7DOxzrUJO7E7k9YUCvAApE/jXA==
X-Received: by 2002:adf:aa89:0:b0:248:2d6e:aa3c with SMTP id
 h9-20020adfaa89000000b002482d6eaa3cmr4290687wrc.58.1671719344865; 
 Thu, 22 Dec 2022 06:29:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b00241e4bff85asm654689wrq.100.2022.12.22.06.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:29:04 -0800 (PST)
Message-ID: <7eb28821-eb6b-a7a5-b29c-bdc081d89b28@linaro.org>
Date: Thu, 22 Dec 2022 15:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 12/15] hw/riscv/boot.c: make riscv_load_initrd() static
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-13-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221182300.307900-13-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Dec 2022 14:29:10 -0000

On 21/12/22 19:22, Daniel Henrique Barboza wrote:
> The only remaining caller is riscv_load_kernel() which belongs to the
> same file.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c         | 76 ++++++++++++++++++++---------------------
>   include/hw/riscv/boot.h |  1 -
>   2 files changed, 38 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


