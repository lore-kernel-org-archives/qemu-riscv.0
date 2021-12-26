Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n1KWL-0000B1-3t
	for mharc-qemu-riscv@gnu.org; Sat, 25 Dec 2021 22:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1KWJ-0000Ak-LM
 for qemu-riscv@nongnu.org; Sat, 25 Dec 2021 22:48:27 -0500
Received: from [2607:f8b0:4864:20::52a] (port=45023
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1KWI-0007AW-5u
 for qemu-riscv@nongnu.org; Sat, 25 Dec 2021 22:48:27 -0500
Received: by mail-pg1-x52a.google.com with SMTP id m15so10681058pgu.11
 for <qemu-riscv@nongnu.org>; Sat, 25 Dec 2021 19:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5p1+El9ll2VSOgukMIqNAiiwkILUJLg8fOI9DP13lyA=;
 b=D56zIQ7JuOpjH0/egShB3kGELn7UyewI2qWTAg8PhTeAJRF0mS0+4jOaXA1AAl0jvp
 NH/r6Z10Nmw5rViISRC7oDkttK7uSY5XZFmgRyWkJa3IEOLj+Te7qm+w2CNTaz7QRTtj
 7AiOR+LtWcqWqQosh2Jy+4wq9Co1OW9jIwBYeOVtiwjXUeB3WXprsseruDHph73RzXMH
 5PtGUmVcwUbmJC4NQHLbIszXdqv/WfSyzdcMgIViHPcmhWFfWKjjc2lw205bSH8KKSwm
 0+zpWj9V/zaF7HL2a+nuWlAZYRMUPEouiz9hjSFix1P2IZ+C6SA2L4JSeyBDpZE3/rSD
 Zsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5p1+El9ll2VSOgukMIqNAiiwkILUJLg8fOI9DP13lyA=;
 b=en3DdiykWWp4sxNUQsumwcK/OpAZllfqoJmasw1Jsx7kdbutDC7KAzjPqASfZExoLY
 Vsoht2w5Ku/PKl10BUGoCsNTqut4hyyYQpCNCMCusd6FO3X7fKooic0PPGCnuTw8zVmw
 zULBX0K3GR5rOAJCtg7GSbqXCY2BKupLUwapOsOHTFotogAyJi6jbytuu5TbkeSVeJVb
 rL/dsnNRLONbeD20Cc5PP2RvQoALWmqkExY1EHkV96nfoM4/4dT1eJAx9nO5WdfPooJy
 NCGEuYb3QUtVHyrmPPJ5oFCkxaZ/EQ0L57oMFDq61q+/F07SKfcYkeg3a4LZ/aWLvvGB
 u40g==
X-Gm-Message-State: AOAM530QbhGyJqym6P+XQF0M21eSPI/afoWHwSex4sC86fs1ZN4hQqBH
 NAezlaaO05ibOHOD9yX5aWUq2g==
X-Google-Smtp-Source: ABdhPJwCM+93JcG52+gJGzpEFnMras4EoYcE1IJ/IEyahY6vke0glnRZgmVFzq98I9uE90CFhYMNew==
X-Received: by 2002:a63:606:: with SMTP id 6mr11167481pgg.359.1640490504633;
 Sat, 25 Dec 2021 19:48:24 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s30sm6111461pfw.195.2021.12.25.19.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 19:48:24 -0800 (PST)
Subject: Re: [PATCH 2/6] target/riscv: add support for unique fpr read/write
 with support for zfinx
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-3-liweiwei@iscas.ac.cn>
 <ec5adcb4-3090-50e2-4981-38149e120249@linaro.org>
 <2acd9ead-d9e8-46be-b306-2aa26ced06b5@iscas.ac.cn>
 <be0bf212-5200-2f25-8b9e-5f7fe2941ccd@linaro.org>
 <9ea3554f-367a-bd4e-fc4f-a98367b96260@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f56629e-890d-5b42-b4b6-e3b7592e1e96@linaro.org>
Date: Sat, 25 Dec 2021 19:48:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9ea3554f-367a-bd4e-fc4f-a98367b96260@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.196,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 26 Dec 2021 03:48:27 -0000

On 12/25/21 5:42 PM, liweiwei wrote:
> Sorry. In the old spec(version 0.41), nanboxing is not totally disabled, but "NaN-boxing 
> is limited to |XLEN| bits, not |FLEN| bits". Taking misa.mxl into acount, if misa.mxl is 
> RV32, and maximum is RV64, this should be sign-extended. Is there any other new update for 
> nanboxing  to the spec?

Yes, in 1.0.0-rc, it's all gone.


r~

