Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml86r-0007oh-Bp
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:19:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml86p-0007lC-3Q
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:19:11 -0500
Received: from [2a00:1450:4864:20::32f] (port=37884
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml86n-0003QW-Fa
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:19:10 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso6975867wmc.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BcqqGqjgY8o0Ij5kcwPiiQfeHEMKU/qpJ8OKYCo3ky4=;
 b=XcRpEKvLxGVoVLN10akrx2/0VkI/J+stBumhTWKDk8IMnUlqeFiGWM1my5bIcgGpPE
 h2SrjMhEbkIUaLDm7xG/u+rFNXx38xmsk2U16KYuoW1NVXKryJKgI2/bjiEdY0Snmau8
 OkJT3EFsnX8AjJrie0SbfvbreJ6TYEJxPJU/dOpcPEcFA05YHRheuG0Rfl7GsAHw+m96
 k7xwsS3sdo1y8FTUPNzZzaUmur2jk1ymY/Ftd1TZoWNIyYr3M53kfsNOLJEv9ME/ke9k
 QkQWUtNgid038UEe/zX6IKOaD/d8QLl5IstMXs/pa1woKhk+dmLjnIQZQe5vK/GCCjCv
 k33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BcqqGqjgY8o0Ij5kcwPiiQfeHEMKU/qpJ8OKYCo3ky4=;
 b=UQ/XAzcm3MCfJl9lokLqq5OnKhnBHvBGLW5DZ+6kbJbbp+FPoVzPjCQ8wmmysU+HMQ
 WzAsTEbynfoec7g5RZrC3PGn3mnI68z/ublmARWAHneyYljPsaGTM5+e3iAeuXHNa875
 ovfnP5qfnNUtvRuPnYnB8jY+R8XI8dc1ebTdweZYzwVcBjVinWt6G+WcFOOyHcACK8HA
 USuNS0tHdlrq862FovEgOxON2mHC5H0P3wG1PHVZfYiFWI4q2ahPSdU9NHToeg7zVU5M
 7gGcOvtsLimyL88kO8LQnLbHzBnHNrlEMKYQ84nQkYDSRvUkpaGBGyTPaFNy0ctG1/Wt
 KiNw==
X-Gm-Message-State: AOAM533B+XEk8ieAOROLgDB/4/J3jC2WOCt3Xe2jV+J0LoPGUyywBUDY
 YXsOWt70dC+ZeGFz6k0xO0rglQ==
X-Google-Smtp-Source: ABdhPJwROvMtfzsEXSgNq9dT/RMVlOlNlHRgC4ykm9NI7Blp1x0PB0wgl4S/fDXUeBqYXGgXtHhAhw==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr7097137wmq.123.1636629547308; 
 Thu, 11 Nov 2021 03:19:07 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id c11sm3596164wmq.27.2021.11.11.03.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:19:06 -0800 (PST)
Subject: Re: [PATCH v3 04/20] target/riscv: Extend pc for runtime pc write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38b9d081-b132-940d-78d1-2aa579b55dde@linaro.org>
Date: Thu, 11 Nov 2021 12:19:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Nov 2021 11:19:12 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> In some cases, we must restore the guest PC to the address of the start of
> the TB, such as when the instruction counter hits zero. So extend pc register
> according to current xlen for these cases.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.c        | 22 +++++++++++++++++++---
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu_helper.c |  2 +-
>   3 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

