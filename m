Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTQWS-00052A-Sb
	for mharc-qemu-riscv@gnu.org; Mon, 05 Apr 2021 10:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQWR-0004yW-75
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 10:48:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQWO-0001hV-JX
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 10:48:10 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso5972737pjh.2
 for <qemu-riscv@nongnu.org>; Mon, 05 Apr 2021 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rfn51idzLeRAFF0CwK4jKPnPia4ImnoFgs2RGvcvCSI=;
 b=IFXMst9cX4f77n9+i0eean0PJ1nJ7O/Xfe2TBLOpDx6nasCxaARJ3ffKeVzbXB6jJ7
 TYKk6yRl/fKMQ0k/0MIsK7URFh5qhSmSpey+Eg/Af08CDbWpTGj/FdW2t9PnjqkZH39O
 VnYyAo3vduA/4xD7eYOWM4EfGQkh4rc7eltubP1yEdP9oW23Zr4/T36ufJfdI/KrsEuD
 OuFRxDuyA1731gcd7vR1AKoqqB6a1990CeJGVIh+137nOihM/Zg0JwogoyOJ3N/1IFm+
 WkjYaZMJRuT/fZa3QjShOYf8M/xDSRTlVljhwPOk7ipmwYGIA69TJ3PQl45xKXJs5wAY
 WivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rfn51idzLeRAFF0CwK4jKPnPia4ImnoFgs2RGvcvCSI=;
 b=OMQgQcrdoeNi9XPwQ1AY1uPOiIi/eZf5BWfJldwKhwCs9p0I0Auy4D9zgr2/F8BSQD
 eL0xu0CJBOmfEFoLapVAvsHMXGfQX5U7OkSWxoP8cwgR02g0JmrTpP0mQnUjaMBGfqLs
 kqPSrGCYDJMAtwTb5StTmAPEEHNlSqoeSc69y7flifkiFXra0+BipqalAuO75Oz8jBjt
 6BaAJcfSScn6UMkzDSFz0pgU/Nvxa7DXm0BdU/ftqr9W8ukeeo1mZ8KaULIlWvyvyDMj
 7jM2aMGCo8PnawsvFQoKpOHSm3wPcRvd/Tb/T+c7imHVqaPqQwV0ffU7TDVvAjex5DBB
 EbpA==
X-Gm-Message-State: AOAM531LqyIDAgZ3qqqQdP6A0zkkUDHuKUe6lAbmU7lowvOUaS3ur2NS
 eQGvXfobFpCV2pFvKYDGuYO1h3wLUK0naQ==
X-Google-Smtp-Source: ABdhPJyhOHWsp676GLIoeyR5izWzkgsWJFcKZjd6ey8swKM6bx546x2pW6IzDTp8uXuX6YuzQSGlyg==
X-Received: by 2002:a17:903:2281:b029:e9:f78:751c with SMTP id
 b1-20020a1709032281b02900e90f78751cmr4980779plh.19.1617634087250; 
 Mon, 05 Apr 2021 07:48:07 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id m9sm15879309pgt.65.2021.04.05.07.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 07:48:06 -0700 (PDT)
Subject: Re: [PATCH v1 1/8] target/riscv: Remove the hardcoded RVXLEN macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <8c175fde1809d8ca97409eb86cd3e92216e115d6.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08a5589b-6af1-4397-f327-ebb62e910f58@linaro.org>
Date: Mon, 5 Apr 2021 07:48:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8c175fde1809d8ca97409eb86cd3e92216e115d6.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Mon, 05 Apr 2021 14:48:11 -0000

On 4/2/21 1:02 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h | 6 ------
>   target/riscv/cpu.c | 6 +++++-
>   2 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


