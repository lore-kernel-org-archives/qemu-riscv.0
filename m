Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqHgJ-0007rW-DG
	for mharc-qemu-riscv@gnu.org; Tue, 30 Jun 2020 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqHgH-0007nW-GY
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2020 10:56:17 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqHgF-00037Q-Kd
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2020 10:56:17 -0400
Received: by mail-pf1-x442.google.com with SMTP id b16so9508657pfi.13
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2020 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ySo3IrSh2zZoDnqprPzVne9wIGX1iErVR4kH5ApU/H0=;
 b=hjw7SSXFPElCFqgqu2T2PdzyPXB8GDiCkSDgvXt3UTS3cN/m/GDDtPWdrkuvucsg4z
 2xlqAB/3+K8FG0PBJCzVDFKSAGnNcHY0xNffXbbekxars7MYSSSEjCrVD37dOsttQ+P0
 e7uITi66ZcBPyk160ae7HtFGp5H7BboWk9bnAuniDFpOtJTB7t5MnKsS1rn9ZivZxTTW
 Y0KjbpcMHz1E0pW3ooYRpE/I/HttUzrizmgsz38GHMRXxoBpSRuy9B30bHJ0Y5o0eanD
 K57cFKWnxJm+G7S3ChHgGElYpX4VseAJh5huwm0ouKRrHvln2WTytYRm1cqtSwAj8es+
 jPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ySo3IrSh2zZoDnqprPzVne9wIGX1iErVR4kH5ApU/H0=;
 b=YC92YVXYsnIgbTymkZ1UAsifMKYGiLcjOoy73TPaWX8kvZreryVV6uySxI7kvvHoPJ
 1hosrmqj5s5jWDOcVNFzpWNm6DNo1K0+pO6l5vokiKllF2qzTUtiOXCDuxUBlkXkyyfS
 pOpFzNz6UWvklC7d6wn0mMrKfhwf3lcW4uv+PYMroh0R8Y1F7OQCsERnVig6qSOtiw1l
 NcRRGK0dpycevib6ca+4wVzYERSBiKDir3YJiEJZNNLV6FYLgrpKJRvbCXz1SiWjTqvG
 oCkXDGIx8hEuQ9Gv9jf3SxE+ebZuPVHs517ASwiYs2ngYFDS70eruZipjk96DxcPLeoh
 6QyQ==
X-Gm-Message-State: AOAM533kiDrfGmwJC0sq1soBupBMRFYZxQ/uiH4UbnGFuPHjmgcUKJYY
 +KRfM0GmUoUGHSSlgCwwZDlbfg==
X-Google-Smtp-Source: ABdhPJystL4w8DiZ8k+WJzM2zVVsTEGus27mUfQ3fODLg8E25R7NZGAhuVFnkmwRtqwuSzdNcE6Yyw==
X-Received: by 2002:aa7:9630:: with SMTP id r16mr14000848pfg.144.1593528973633; 
 Tue, 30 Jun 2020 07:56:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id cl17sm2584730pjb.50.2020.06.30.07.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 07:56:12 -0700 (PDT)
Subject: Re: [PATCH 1/2] tcg/tcg-op: Fix nonatomic_op load with MO_SIGN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200629130731.1080-1-zhiwei_liu@c-sky.com>
 <20200629130731.1080-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db9e632e-4fcc-2374-590f-4ea35d1adda6@linaro.org>
Date: Tue, 30 Jun 2020 07:56:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200629130731.1080-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 14:56:17 -0000

On 6/29/20 6:07 AM, LIU Zhiwei wrote:
> @@ -3189,7 +3189,7 @@ static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
>  
>      memop = tcg_canonicalize_memop(memop, 0, 0);
>  
> -    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
> +    tcg_gen_qemu_ld_i32(t1, addr, idx, memop);
>      gen(t2, t1, val);
>      tcg_gen_qemu_st_i32(t2, addr, idx, memop);
>  
> @@ -3232,7 +3232,7 @@ static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
>  
>      memop = tcg_canonicalize_memop(memop, 1, 0);
>  
> -    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
> +    tcg_gen_qemu_ld_i64(t1, addr, idx, memop);
>      gen(t2, t1, val);
>      tcg_gen_qemu_st_i64(t2, addr, idx, memop);

This is insufficient for smin/smax -- we also need to extend the "val" input.


r~

