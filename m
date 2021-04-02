Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSNNP-0001YS-C6
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 13:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNNO-0001XK-AY
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:14:30 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNNL-0003Zk-VJ
 for qemu-riscv@nongnu.org; Fri, 02 Apr 2021 13:14:30 -0400
Received: by mail-pf1-x432.google.com with SMTP id l123so2454310pfl.8
 for <qemu-riscv@nongnu.org>; Fri, 02 Apr 2021 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+BRZFVWbLfuzk9ULq1EDFqemn5viKeHr/qW6c11zA6M=;
 b=gTkqQT6fYfS7uUdyeZnIXUVX7lH2B/MZNLA+V/9CqtIo9lp6VX2knNW5DZA6a1Jj+w
 P+zYdSkBNEEnWrFtwh52umKixm+5JdpxvmFepSUl5p8NBJ+9tJvKyBg8brLHfnKXE12B
 EWw+yJ28HsfPvOAGMtfprCAqO9NFprXofWgDSYkRfCVRqnO4gObX/1PJVs+3MQwnZmAi
 W2BnXa0e/DjtLdO8/lJPrDW04Sa8b0XdqFuC5VaEQsGuuaHHRwAP7w3XVjTUd10iPwOw
 +Y12JaoIhgf7Yq0eJpX9upAkxwbj1SBs0WL+ZS5+ukpY/tahpbgH1EsR+rBpQfORFiJU
 uxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+BRZFVWbLfuzk9ULq1EDFqemn5viKeHr/qW6c11zA6M=;
 b=FexQQF96gxebqMHyKx1MdSNd8dj3pZSLzPkQxZdRztZKcwF9vb36fq8CuodjcxN05I
 nng4xaz4uShi8L70uwSz5sIlhDSRYP2j8UTG79PiIdAW9I86+FumJnwhMV3F9Z1LH+1q
 5Ez9sgVXyLLnbM8pg/u4AW7bSnrziQv53O0zT2HA1oJn5WkkinslsYsFrp3iKwbps2Wx
 mTXfGuR2fpZLZBp0e72hJ4DHg+CVGlM9gghfcn2/OdGt4uvQLn43td+ysc67OjIRayrz
 xjlxmxVKQAPD4R8o/+hQdmYuu6MvFs+50AtZ/VLPwWStx7mRQKr2PQK/EpgbicBluPWI
 4w+g==
X-Gm-Message-State: AOAM532ImIXPsDx9SSWGtbjER2BFkmKFp7gIiiJUhcAxfOWBugLZsBqC
 3EZRgrYKSy9jeNDQ13XVjFYccw==
X-Google-Smtp-Source: ABdhPJwk5eLpO+NGjrJXYo2xhFbQgZgzNiwW27u7/aYJsvNGbC5iYtiRgWDKbor5f5gxh9kiVWE56w==
X-Received: by 2002:a63:eb53:: with SMTP id b19mr12576051pgk.383.1617383666748; 
 Fri, 02 Apr 2021 10:14:26 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id x7sm8767460pfp.23.2021.04.02.10.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:14:26 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] target/riscv: Fix 32-bit HS mode access permissions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05fb06ef-6a2e-e2a5-1972-52970b03ee76@linaro.org>
Date: Fri, 2 Apr 2021 10:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Fri, 02 Apr 2021 17:14:30 -0000

On 4/1/21 8:17 AM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/csr.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

