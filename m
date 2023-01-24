Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPnu-0005Wq-9T
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPns-0005Vs-V3
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:22:00 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKPnr-00065z-83
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:22:00 -0500
Received: by mail-pg1-x52a.google.com with SMTP id e10so12053398pgc.9
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R47D02kk2u0RONXG5ssJGk0Q8tFn4GgB13wTpJ1cq5U=;
 b=pGWD4ZroX882+6RYqyXrIVvJstROkMVXkhXBnZVVW/NpyYjC6zO9O+0VawtDcJ/rnw
 RUzPAMV6/2EE/MK5q4nBaIE+CP64K1WN5GiVzzk8OaBcc5qDGltUe2veF9uQ6bZICemD
 NWG+U+xjsIM3i/67tjbcRT5v+nx8mH/oKbdv7V62fsVH9It5+0ExTmhMo+ut1VBFwVtO
 QNGpPjp8xqRPm+y0BSGUzZTplgthtRuAI3HvEY5wfeME9VkjMOfoCGX1PdjfYoU3GqTr
 APIT8/Z7uoEWGXffDJuTHcfAMWYw99PKcqmrujVIrqdmbQAUGc/aQck+1gvHQ2/ddamK
 Rl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R47D02kk2u0RONXG5ssJGk0Q8tFn4GgB13wTpJ1cq5U=;
 b=VviAq9aIWScz/wHj4kKreoaPSl0j/FVRYK0WwlFB9gX52DYq8FmI+/ToC8h4zs6JQU
 rhwoTBDCB+4EMcjWmvGzAAAxy7v44kr1ih5Oii8U3Pb9wlkYa8W6XNo2PMllTo6QGfly
 AgPlWcZBBkph2yUhSvdizSBuaNaAambSG5s3RtqBFTYE4mZxZ4cBl+Hew/hz9yVfccWz
 oMRhRk80HVQMkjMgnHVUH0++8xJAIaUPrIH5LtF6Pevk0WHWVJvlIobFckctlmLJrTy4
 LQdLMOxJLORK3NRjg7sKQcKeFH17tsHFYS7SN6swjLJIkJ/byEjZU0/3ubGdPGNYvPmi
 7QhA==
X-Gm-Message-State: AFqh2kp0cn92hVyn4W4sgdzB6m7gNu+mTnO3Y58tgxPULIyDdgAy+DXk
 JIWKjOOs3BcDvEpMpCKp2KDULw==
X-Google-Smtp-Source: AMrXdXs+QZU9rFS85FqU5cAQM+bSJUTO9xOn0T0wgdxO4YAxJ4ZTW+DJsTCoRbYfTsFKO2SE9Cv34A==
X-Received: by 2002:a62:1556:0:b0:58b:c9db:c015 with SMTP id
 83-20020a621556000000b0058bc9dbc015mr31756425pfv.30.1674591717569; 
 Tue, 24 Jan 2023 12:21:57 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u2-20020a056a00158200b0058ba2ebee1bsm2000457pfk.213.2023.01.24.12.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 12:21:56 -0800 (PST)
Message-ID: <8a81e02c-5bb7-a82b-be16-e93362169a44@linaro.org>
Date: Tue, 24 Jan 2023 10:21:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/14] RISC-V: Adding XTheadSync ISA extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-3-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124195945.181842-3-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 20:22:01 -0000

On 1/24/23 09:59, Christoph Muellner wrote:
> +static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *a)
> +{
> +    (void) a;
> +    REQUIRE_XTHEADSYNC(ctx);
> +
> +#ifndef CONFIG_USER_ONLY
> +    REQUIRE_PRIV_MS(ctx);
> +    decode_save_opc(ctx);
> +    gen_helper_tlb_flush_all(cpu_env);

Why are you using decode_save_opc() when helper_tlb_flush_all() cannot raise an exception?


r~

