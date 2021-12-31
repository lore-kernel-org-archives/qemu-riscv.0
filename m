Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3O0t-0005hs-FE
	for mharc-qemu-riscv@gnu.org; Fri, 31 Dec 2021 14:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3O0q-0005hX-Es
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 14:56:28 -0500
Received: from [2607:f8b0:4864:20::102d] (port=36490
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3O0o-0006RV-V1
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 14:56:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so10018223pjd.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Dec 2021 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Hu5sPv8A8l2igdkc8ULtmQYc0Ed0J68BztDlsfNVug=;
 b=lYaSFmLe40qbi/zSuYQLItHUz+BlyfcEo6OWyqKzsuPIo5cqPE0RmAC3f8K4XEWk5/
 UTlLRo6ZCRR1yNngEyktffozoRvE2kByTUhWIws4JYTOTy5JbQt797MXq/IlMc8Qe36z
 /bkdNrFq8pIsKW8ZbPh+DWrKihbP93LkIpBMZzQTA9UJJ9/Z16uA6OZRMWcES9AO8dtB
 dl/XxUufp+WSC6CJC3Whv7mtix0LMbntq0unT3IOpH4LwX1M1uH+/2PNXHl5+HsQzy36
 pNQavlHTF7i2gVWAY9aJvYkCPZMxpQ7L4+zHF9NtGU6LT+tqhemHLqhfMFD990/frkp1
 04ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Hu5sPv8A8l2igdkc8ULtmQYc0Ed0J68BztDlsfNVug=;
 b=Zm4VSKrPWnph7G0NO+q5FkVNq/TO6dylqKm/FqsuhFh6rss0JkE1wd/HZpUpD+4B+P
 XC8V7x3fsTxPzdHNuaT86x5JmT//6tlKY1fHg0mdaFUvDQCZjWlZX3UrLziIPlzsTqKK
 8LmFWPsRbgxb6A8Mm4WRXGX0KqaC35f86qbS26hJZuB+5rzf3kab3tpd/1nsYOjqMB0T
 y8WZBj2oa5wEPDT1WJ1ogJTg/ZxM9W7qNjqusj589c9Rm3YSKHXhtxKJhIzyCrZV+Mv0
 rMBiTk80YPQF9ooDvSfesTnrKVj1rvMetmzKHhQi/tBSewwoJ8RJtkEyCl0Bbv7v01wQ
 9AjQ==
X-Gm-Message-State: AOAM530KpvoCTgTAlySBZBfulordRmWWzprA1veFOC/fmXWdVeuzHrNi
 R/rTnqwmfwKfTcDmlYiJmeMBIw==
X-Google-Smtp-Source: ABdhPJwfqgv5JYFV0I9qLS6VPClfQI/oEP4Yy/CgNaF2ewkm0win4nD+Ay5jQ/GZv4PDDi16BxdtQw==
X-Received: by 2002:a17:90b:3607:: with SMTP id
 ml7mr44396532pjb.56.1640980585254; 
 Fri, 31 Dec 2021 11:56:25 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id z19sm23054652pfe.94.2021.12.31.11.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 11:56:24 -0800 (PST)
Subject: Re: [PATCH v2 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09ecdc1d-2f51-d5bf-1ecd-9ab6c132fd2e@linaro.org>
Date: Fri, 31 Dec 2021 11:56:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 31 Dec 2021 19:56:29 -0000

On 12/30/21 7:23 PM, Weiwei Li wrote:
> @@ -363,6 +363,10 @@ static void riscv_cpu_reset(DeviceState *dev)
>       env->misa_mxl = env->misa_mxl_max;
>       env->priv = PRV_M;
>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> +    /* hardwire mstatus.FS to zero when enable zfinx */
> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +        env->mstatus &= ~MSTATUS_FS;
> +    }

This shouldn't be necessary because it should never have been set.

> -    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
> +    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM|
>                               MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
>                               MSTATUS64_UXL | MSTATUS_VS;
> +    /* hardwire mstatus.FS to zero when enable zfinx */
> +    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +        mstatus_mask |= MSTATUS_FS;
> +    }

I would think it would be more correct to have a positive test for RVF, rather than a 
negative test for ZFINX?


r~

