Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhUyx-0008OV-VP
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 06:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUyx-0008M7-2M
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:56:03 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUyu-0007mU-HD
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 06:56:02 -0400
Received: by mail-qk1-x730.google.com with SMTP id bl12so1790119qkb.13
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yh3NyBdqmGOhzN4dgR/QSEJ7wdjsGz78tYYbTHWwKO8=;
 b=pOcYMzbzNHFAC1smawj62yHkMrDbCux5qm2fHOFffWGuHnrv1SyhhGrxNxCTM7ESw8
 wJcXf8lOEtTHyYBdRrpyqkdE+GSg9lDMoEPl7jZOqm8oxEffKjtJcWqNgQMkPeytYKQO
 hf/XdNm0ruxHI93lk7icvf2NvvFZybe0Itw+UeRNBLOD0HF1WP0biMqsA9SWE1bGlXlU
 UbCn+OPUsXFxfwag6UhPSWK0iUhGAA4HBfgBPT66Ic+//jPXGmlDfMq+5KPPBHeYAfQa
 /vH22SPmenEkqE8G4UO5+mnJDQikLWlb+hXn9nkp8p9cDnbSEQ4O02eXz+GPsmC/QceI
 WWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yh3NyBdqmGOhzN4dgR/QSEJ7wdjsGz78tYYbTHWwKO8=;
 b=vSEhhEBDiDXFptMeAHYgDXeiiYTgdqtgIPHnhLj1zKEZ3ikjjUUJ3IzYV7kv2mJe+d
 He8aFXEy0UWrPf/ZrsrohaKPoKHCSKnL0MUPmPUI17xaMnlSero1mibyqg1tOG5oxL2a
 MXpIT2UCyGdozUPoxejzFRHCgXP1OHPZHQx+MThF1w5dM3bab0hd6QzcuABi/pzYa3Ok
 M/asFZhPIY/9skHHZWm87Gg+fM8MZu2YYF8idk0A7JuZTz6fvZ4+6Xcp+prZbtISG1e9
 zVIVhira71eygqgcqC2A802JuN3lUon7KuhQzd86G+OchG1DytObezbW4eWEa0quC5LO
 Sy/A==
X-Gm-Message-State: AOAM5337GRSaJqIkhr2AfHwwpnM/EUVSZrmtj2vLVyetYSonEGbCvtn1
 aOSAfqlUFIrb7ROy0gm7iTUECxRIlWRekg==
X-Google-Smtp-Source: ABdhPJzZthEbBEp3E82yoW6zXLHKGtvmv9F0yUrhMMe+C4XuI2AIOLhSS3mpTTA9J1CzeqYmJZzfjg==
X-Received: by 2002:a05:620a:2442:: with SMTP id
 h2mr22999140qkn.298.1635764159653; 
 Mon, 01 Nov 2021 03:55:59 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id o8sm8163109qtk.77.2021.11.01.03.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:55:59 -0700 (PDT)
Subject: Re: [PATCH 07/13] target/riscv: Ajdust vector atomic check with ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-8-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a0138ad-a759-9efb-1504-a4df8d831ad9@linaro.org>
Date: Mon, 1 Nov 2021 06:55:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-8-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
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
X-List-Received-Date: Mon, 01 Nov 2021 10:56:03 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> -            ((1 << s->sew) <= sizeof(target_ulong)) &&
> +            ((1 << s->sew) <= (get_olen(s) / 8)) &&

XLEN not OLEN.

But this will also clash with rv128, since we still won't have 128-bit atomics.  So I 
think you need to be more reserved in this change:

     /* TODO: RV128 could allow 128-bit atomics */
     (get_xl(s) == MXL_RV32 ? 4 : 8)


r~

