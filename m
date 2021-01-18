Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1Y6x-0000ny-KD
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jan 2021 12:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Y6l-0000jL-L6
 for qemu-riscv@nongnu.org; Mon, 18 Jan 2021 12:14:29 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Y6h-0001dX-Du
 for qemu-riscv@nongnu.org; Mon, 18 Jan 2021 12:14:27 -0500
Received: by mail-pl1-x634.google.com with SMTP id b8so8959045plh.12
 for <qemu-riscv@nongnu.org>; Mon, 18 Jan 2021 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6blGcADcdqoO0kIlUgSrPRrlihSpDq3y8mB/cDgPBE=;
 b=x13djRWSXiDRbT7hYBPS2rFxqjAHddLpgzu2caeIL1voIi4mt3J23tta5QWikkyNie
 bYcWZuBB0FhjwSNI+r82CyZVnTDsFgFp2xAS8ad8OEk7Xg764OJ5u75aWS61PiF/XeNl
 gZAZIjRdDzxvlMvWBOe4zgfQ+sygGbaZdO3FGlhNPjV+qw38aGvNaa5oP+P7rVyR7iDU
 PL2mgBmC6pHx9UDCaeVrI0y9DAT+TcfFe1VcyNHq1H95go55bRc8OfpVPq5rrQ2k6s+J
 g6N0iA0t1pEzbwVNj6pfIy6X2SgFO2RoZlv792lo1i0GJbVhKGTfSogxmqJd10bQwKVR
 5/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6blGcADcdqoO0kIlUgSrPRrlihSpDq3y8mB/cDgPBE=;
 b=CP8PfVlF98KASbzFjaIu9eQKM91LXRK+JecErAROSlfq5h3lGVjkvTymnf7EqNIAPq
 lIqKyLG64B+xsXVUUGVNl25Gim5XPjE9zn1fqVAXF7C+uyxDzVisG1jzgQ4RtdjLdvc/
 pVPs0sXBktx5lr7PLjRoxAqSWqhTdOYRcjW+0mxUyvZuad04OK+AcuQpebSbU9WjAlUC
 E6sZdYpREsnCE9tSCfPPdvbZKWis7WrrpWiG2pAZB3Ql9niNkkMuAcvAo8ChZPsHSDkM
 +CLg1aqGJ/OuNqJIET6mD8xZjeYyRBS0WNz9epV+RkrLPuy4yxyF8OGaiieauOQxvZJ9
 o1IA==
X-Gm-Message-State: AOAM532wPb0jzNZV8vsgztx/ng6luQMBieDdMqqPMSRI77ZoRIPGDUlW
 q2iQlLGPM5/6mGY84UArYQXy4g==
X-Google-Smtp-Source: ABdhPJzVdN4XOjCcO35HJYH2QDmSBkOM+N4fLKbQ6skVxDQ+f1iU3Okrtwq+kgjVU6z5itTpfRjdhg==
X-Received: by 2002:a17:90a:de03:: with SMTP id m3mr336122pjv.20.1610990057372; 
 Mon, 18 Jan 2021 09:14:17 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id y12sm7511117pfp.166.2021.01.18.09.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 09:14:16 -0800 (PST)
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b0a5958-6bc7-1c66-5b0a-8183f854404d@linaro.org>
Date: Mon, 18 Jan 2021 07:14:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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
X-List-Received-Date: Mon, 18 Jan 2021 17:14:29 -0000

On 1/15/21 1:00 PM, Alistair Francis wrote:
> +bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    RISCVCPU hart = harts.harts[0];
> +    RISCVCPU hart = harts->harts[0];

This is a large structure copy as well.


>      return riscv_cpu_is_32bit(&hart.env);
>  }

Better as

  &harts->harts[0].env

surely.


r~

