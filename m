Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8Ml-0000dk-Kb
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Mk-0000a4-Ar
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:35:38 -0500
Received: from [2a00:1450:4864:20::332] (port=45961
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Mi-0006U6-Kt
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:35:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4174763wme.4
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q+MtQXymmZbAY/5ahgaxn1vg1r5PptrxLdE4O6Ql7G8=;
 b=oUoqt69uQ3y1VfyfeYtPg+TW6OhBveelOzLrhY2P/Kj8z0fX730fvgnd04p4z36dc3
 gWrVMVKzGx4UHrBPYWC+DpTTGQlUA5uYhywJYGBkDw2TiwMVEfhkvnoYX+PYBrxRPWiL
 FbW+BeTAGXjx0JgUBuL4VogZ5Lvl+vfARuvuvI1/nBBZaeanlyCcsOf7IZOOltPCMjMx
 eFIM2jjN3GaulyM/lCouBSSXNpgTnkuIAhNR3hpa/2rw2ea29rqXuqRWuA7/+aIMxaKw
 Sr6SgOyReQgFPBhUQm0Y7Q1RMPDluMIZeDeKezfsNjA3LLWU4mw0yU7xfLd6dnGkElHV
 mjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q+MtQXymmZbAY/5ahgaxn1vg1r5PptrxLdE4O6Ql7G8=;
 b=fCIquiCPyaVdHR14Po3jFKtspPIWVnCblQAd6M2tUVG8w82XgAj0hTbVhgmWeF1BEu
 C6mmEkoKLKK+ny49S4ajosL7CO5hadiaYy+DoYWg+S4eJT7HhD7ARn5gqND5pWM7fBK3
 T/a7Rj+L1ur8B+eCWiFAKIAuv7QKOu8yVc0bfiImREFp2lLnV7aNHjmrdayUEUMJQUIe
 WjSjIlrBU7tBtL7HkY2XmG+w2dnHMqAB07RQ3+3kvOuUiACnwHwzKG5G9qZPW3P654Fq
 0UIIKE1QyoEoptIG557cTZFZ7H/cX5mt94iFTxFplqTVvMuI1T4v1oV1Es5hIGUufQki
 XVVw==
X-Gm-Message-State: AOAM532WGa2k+z+ZOhAoJ0Bg6qNZgpXHtmKRTkOq7b+UhU0atM5xpsnF
 Bk50dEcpvsddlRJHaBlPW9d2mA==
X-Google-Smtp-Source: ABdhPJxZLOHIspXqhYGvSkVIsrPnjvX/BlMsqCqrNxtCusYp1hNn7k1OZgOWfTvv7mJd/Saqv07IYA==
X-Received: by 2002:a05:600c:1f0c:: with SMTP id
 bd12mr4534015wmb.56.1636630535339; 
 Thu, 11 Nov 2021 03:35:35 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id h18sm3010101wre.46.2021.11.11.03.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:35:34 -0800 (PST)
Subject: Re: [PATCH v3 14/20] target/riscv: Adjust vsetvl according to XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-15-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b9116393-7bd0-077a-f731-b5997ebc2eee@linaro.org>
Date: Thu, 11 Nov 2021 12:35:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-15-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
X-List-Received-Date: Thu, 11 Nov 2021 11:35:38 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> -DEF_HELPER_3(vsetvl, tl, env, tl, tl)
> +DEF_HELPER_4(vsetvl, tl, env, tl, tl, tl)

Might as well make the argument i32, or don't pass it at all and use cpu_get_xl().

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

