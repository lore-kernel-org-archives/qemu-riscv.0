Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mqZRh-0006rd-MR
	for mharc-qemu-riscv@gnu.org; Fri, 26 Nov 2021 06:31:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZRf-0006qI-QM
 for qemu-riscv@nongnu.org; Fri, 26 Nov 2021 06:31:11 -0500
Received: from [2a00:1450:4864:20::332] (port=45682
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqZRd-000449-F0
 for qemu-riscv@nongnu.org; Fri, 26 Nov 2021 06:31:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so6567313wme.4
 for <qemu-riscv@nongnu.org>; Fri, 26 Nov 2021 03:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9g6vC5Dke5AVe2GXZhMGWpnmT7U9Adgn/vesA08vVOk=;
 b=J92OKBWA0NpmDGS/IJU0vcLNgrJphimLU/Si7hhyF19bwxbzaYJdvA7coinFvpD7Dk
 FHhzAClLNqrCabIvwW5JbfdGSEI0UHwNKfSmz7Y5E1SHWjk0vRf2ow/wz5WDmirmPvf+
 RuOIeKYhDl4MEf1595dc4NbNrW0rZ6mmKTugHIotGPYZTyhYfX55HA41AtWrPAuWYBXM
 3WRO8cGii/sAaxJ4rTsngjOK+6d1i79ERj26cu66GDxFTMuzW9skDHgZ6lfEL3yICheF
 JYjSvGL838/DvQKRkQJb9xJqFF2AgH3V0th595JX8PIE2kI++W3aIHni0ev0Hv4oQAE3
 XBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9g6vC5Dke5AVe2GXZhMGWpnmT7U9Adgn/vesA08vVOk=;
 b=Jlf+M7oPfqa3nd7F6O7ZAzZa1ZgX58vsKU3FQNJQ8+qf9SwugWSGkTkljYMP9LO4YL
 t8EXMACG/mLyfugmJBioZWv66YJSpaWOc3V4r5K2C9hDwosJCqvlZ8a//AY1m3//K/FG
 5tDHtVTkQecLu2PSd6QRV7dAdUw0hz14BY6t7EBxG7c75vln11VunrCdLVxfc6WQnVH5
 NdhpKj0bWp9REwZpMSWTMd8hUAdM4jEuqWaFpUPBsRb3B6aE4t+nRQQgmKSAT/qeRH3b
 hBNVUzO8PFPKbtDd2AuNc4f31l28GAh4PliMWakfB78NyF8Vqfzn/qMdjFhWONwjos43
 VZ2Q==
X-Gm-Message-State: AOAM5301Wwn56hvaUAtqahkDXFwQeRQN2kKHyjRUhxipXccPEZ8oL7WA
 ofgAk6qU0iyA13DyxOOqHEk60Q==
X-Google-Smtp-Source: ABdhPJxJqZ+aYuQmztVT9XoJPaQvwKETu5v6AUFPayxquKv201A+jEXqnkLrhivdgYU+068C+XlLFQ==
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr15246556wmx.54.1637926267884; 
 Fri, 26 Nov 2021 03:31:07 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id r15sm10458130wmh.13.2021.11.26.03.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 03:31:07 -0800 (PST)
Subject: Re: [PATCH v5 10/22] target/riscv: Create current pm fields in env
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
 <20211125073951.57678-11-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32c4e078-bb8c-07fe-d69e-cdbd725d4726@linaro.org>
Date: Fri, 26 Nov 2021 12:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211125073951.57678-11-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 26 Nov 2021 11:31:12 -0000

On 11/25/21 8:39 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> Reviewed-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c        |  1 +
>   target/riscv/cpu.h        |  4 ++++
>   target/riscv/cpu_helper.c | 43 +++++++++++++++++++++++++++++++++++++++
>   target/riscv/csr.c        | 19 +++++++++++++++++
>   target/riscv/machine.c    | 10 +++++++++
>   5 files changed, 77 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

