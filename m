Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6741C3DA79
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 23:15:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPWAP-000625-Fc; Mon, 15 Jan 2024 18:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPWAO-00061o-09
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 18:14:52 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rPWAL-00086Q-3I
 for qemu-riscv@nongnu.org; Mon, 15 Jan 2024 18:14:51 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-595d24ad466so5138621eaf.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jan 2024 15:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705360486; x=1705965286; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YAmOA48vGgStL8wgpG7cO/Bt0Bn9k+1diPCWBfQ4kzE=;
 b=TXgNpyLqmPxBD6Le/2tbJzElWxQLRDLSQgDCmbCVxBftrmjP/yhx8iY+9KvsdImTgy
 ytFXj9HHZ1+4OxAz9yLo0ks4Pyq2xHfQut8Nt5/CbpzdAaSQfnegxYD6tIsbbUhsQM1m
 y/w+hiCL7Aj1GpdwFBvH5ze1xOFtT5cw8mVjOVR7MtfLk1R787fIGsUl5sBhTq0qOX6Q
 zylB6qK7jgW5H7Pqxyv04N8Bgq4lYidq4cE1qfmxRUEdMSbSx08YMUxx6YCrX7yKIGa5
 5/oDQdMMRpjCnS8ygC8zVJKWAjoOLKmgQbGmz3S5pV0+SR2YNdJ54MzWOYuKVakdZzRk
 lQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705360486; x=1705965286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YAmOA48vGgStL8wgpG7cO/Bt0Bn9k+1diPCWBfQ4kzE=;
 b=ETjzvwTdeTCMhze19QAXuFRAVgjgK9qyRHHl7cXoIglKZIqxl0cvIYn0KzHxO7hBfI
 tzTALt1GSNQjKtoBw4dYFBX3rDSls/gAmVb4OISJJyBrV0tW4efCasfidbYdF4I0Qa0s
 tH58CAk9U79Aww0PjqR2bcDlKK0yYshlX+O3VDwSmSLLabMrrRY1s90ahfxFgEBUT59H
 21/djJZORqVZ/0dE3PRtweUQqzupqg3IXNwH1OaxPyMH1RRmkvd1gdgdASzT7omQXlvm
 Gg92GL0iOKfSzfp2SJoXpDK22OyPiAGZUiLcsfe0jQjyjlYy79wC8k+Z5Fgr/iv7p+9V
 45GA==
X-Gm-Message-State: AOJu0YyhVqkN4kf3x0jp4DR3RepAHAD4WXz8gnaOfOqZjIdD4+NzMbKX
 3W52j9GPWtPcrzlJp6Goeht26OAY2j14CA==
X-Google-Smtp-Source: AGHT+IEQ0XytxR2AS1Wnrbl42U7JfPzS/jhiN17Lj/8cIbZvjMEuBi1vJyM9nHrUWne22n6rCum70A==
X-Received: by 2002:a05:6359:728e:b0:173:24:b272 with SMTP id
 uw14-20020a056359728e00b001730024b272mr4083021rwb.23.1705360486383; 
 Mon, 15 Jan 2024 15:14:46 -0800 (PST)
Received: from ?IPV6:2001:8004:2738:1dd9:85fe:4dd3:358e:ec4?
 ([2001:8004:2738:1dd9:85fe:4dd3:358e:ec4])
 by smtp.gmail.com with ESMTPSA id
 sb15-20020a17090b50cf00b0028adcc0f2c4sm10430621pjb.18.2024.01.15.15.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 15:14:46 -0800 (PST)
Message-ID: <86f114b3-10a4-4857-b470-5f61730ed382@linaro.org>
Date: Tue, 16 Jan 2024 10:14:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] target/riscv/cpu.h: use 'vlenb' in
 vext_get_vlmax()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240115222528.257342-1-dbarboza@ventanamicro.com>
 <20240115222528.257342-10-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240115222528.257342-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 1/16/24 09:25, Daniel Henrique Barboza wrote:
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 11df226a00..7304e478c2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -692,7 +692,11 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>   {
>       uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
>       int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
> -    return cpu->cfg.vlen >> (sew + 3 - lmul);
> +    /*
> +     * vlmax = vlen >> (sew + 3 - lmul). With vlenb,
> +     * 3 less shifts: vlenb >> (sew + 3 - 3 - lmul)
> +     */
> +    return cpu->cfg.vlenb >> (sew - lmul);
>   }

I take it back -- this doesn't work without the + 3:

   sew = 0
   lmul = 3

    vlenb >> (0 - 3)
  = vlenb >> -3

Need

   vlen = vlenb << 3
   vlmax = vlen >> (0 + 3 - 3)
         = vlen >> 0
         = vlen


r~



