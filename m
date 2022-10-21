Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olnzg-0007L6-Rt
	for mharc-qemu-riscv@gnu.org; Fri, 21 Oct 2022 05:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnyL-0006kn-1D
 for qemu-riscv@nongnu.org; Fri, 21 Oct 2022 05:05:56 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olnyG-0007AI-Kx
 for qemu-riscv@nongnu.org; Fri, 21 Oct 2022 05:05:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1586709wmb.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Oct 2022 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X2dtBxxRHBB7DauWuQoMygKfYOJfO1vsAHNlY5BLQ9w=;
 b=d351lmrYxep+j+mK8HQuRCuO03UZouD4g0LQ1AjWQ2gSttzjza07PxmIhHCj+UV9Tb
 ahveu+lnmsJDa6SJ+oaEY3eOuBO2gJp2XqbC4MoSeVetCK1a/eZ3vIyEkDqOtmeRQrJa
 T8KQc1LjoaONi2xoOOaBiudkX5ArCYVelTS06CTSvSUQaLt4iamPyj6t93qr2TBeRbNe
 9GbKNeZ0rKPhoDh7jvEb2tEOLyDmHgyru9B9wZ9QRURlTemcxqf6nUcINl9vJPDCSBcI
 R36h5zyJQkLTZzYrI7DCBpoaxyk9dTjkNF82bGRK9ryAjO7YfF/9cdbx+hD0ucyEi2D5
 FV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2dtBxxRHBB7DauWuQoMygKfYOJfO1vsAHNlY5BLQ9w=;
 b=wkZYL1WPY2TLgK6VeF1+bsNqOIViSwMuOLNNyyaA8q+eC6ur2z/qZfewrm/vGKd3D7
 NA/j6bBtXvhlYQ8xtjqH/KwXLBuuIW7L7m+jTShPwyYWa4izYNsU7b47yv1KOdy9XMUV
 pBh7+A8lhm/Q8sHu98nlY0Wl/NC6CIi1QZbdor1XrUE4hk5YaDmg0VBjKFkH6OXZuViW
 PFu8vBEaBzKx72v7Igbe3tkkxGrvJ+nPUAt9FFCWbIFBXpSho266x+cNwwCma8Qz8KCI
 M6VootdOOcU+acuyJnZZJ82jahHHJUeH25wsec7Ki/qBmGMVDR1bQGe2AnE3Y+RnnndX
 VcrQ==
X-Gm-Message-State: ACrzQf3GFdP2Q2Age0JVX8RGUV3BkPSubmDXQeOCjedEE4CWbLxNr8SL
 Ak1GBvbTFpDckYQoKKh6zqnVOw==
X-Google-Smtp-Source: AMsMyM6a6wPDooiWEoeZcyTnt3TfobZUSU8PE8jv1LAr1rC9g+tX04KbKaeAt3nNooWGyy1cau0Dqw==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1e3 with SMTP id
 h17-20020a05600c351100b003b4bb85f1e3mr33722635wmq.0.1666343137846; 
 Fri, 21 Oct 2022 02:05:37 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adfe985000000b002322bff5b3bsm22287680wrm.54.2022.10.21.02.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:05:37 -0700 (PDT)
Message-ID: <d47ca14f-1dd8-8dff-bdce-6e8223f0b2e5@linaro.org>
Date: Fri, 21 Oct 2022 11:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 5/6] hw/mips: use qemu_fdt_setprop_strings()
Content-Language: en-US
To: Ben Dooks <qemu@ben.fluff.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 qemu-riscv@nongnu.org
References: <20221021055808.342055-1-qemu@ben.fluff.org>
 <20221021055808.342055-6-qemu@ben.fluff.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021055808.342055-6-qemu@ben.fluff.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 21 Oct 2022 09:06:05 -0000

On 21/10/22 07:58, Ben Dooks wrote:
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/mips/boston.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


