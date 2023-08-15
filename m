Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68662C001E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:44:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW0tw-0004mw-PR; Tue, 15 Aug 2023 16:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qW0tr-0004mQ-7Z
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:44:24 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qW0tm-0002js-Kj
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 16:44:21 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-26b44247123so2249819a91.2
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 13:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692132257; x=1692737057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GLNKHWLL+cK6cxqTiAkkS23VjKuvUUnHa+prI3StVQQ=;
 b=kOhch6PcX5NpXGF44AUsjBGrf09iZ7d6WwFdfEbcClHnsiwBn6OYVrlNZ8079dECAX
 x88q/b+cHLR+D1hxCvkWcyh1xvFMVdJbn3Np5RQyBTWH+LyohHecc9f8+R/h95lLXcOJ
 UgeVv+k4r7YVYGfuBydDTrwaheAKs+3nWbXzZWS2VWVWvZS8Sky1mZQO2/GDb698NUwL
 cdUMcoyKhiFdsK5pI9pkYPvdyUCBQHAT0uACJzjTagq5fRfZJOpr8r8mDqItZhK5FLGE
 EGnnah2UDF4QAGsdFm95K0dBmiYD32eg2IFRzt7OzS2g/rGzPjugu+FYcDgKYunKskou
 WJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692132257; x=1692737057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GLNKHWLL+cK6cxqTiAkkS23VjKuvUUnHa+prI3StVQQ=;
 b=B2du4FAwHEqED54Ofq34NKcmxRbGgnVg5GnfcRF2NBKDJVfPf+sXca85e1pYnSj9MD
 k4SAqc0PLKTXYDpMQ2EW8pH5HZuWWf54utDlUI1bbqYlwsOlEM9TKfMsJHch7DuiFlcc
 8dilFSZgsnduQBkCfWKK9aGd8BPZev40GEh3QMZcOihzt/3tHRK6BPZnRRjikUihAHHf
 nEV3DLdM3CClVh9apUy6ZzLUChdpBDUpY9GJxF/b7DYHipT0TzNk38XVosdwek85Z5WP
 2/bTptDUm8Pps2uAIX8LiRcKTilvMPStCKZ2ioRkr8nx7ZlPWmur0kmOpvx/LTFbaFSm
 4CrA==
X-Gm-Message-State: AOJu0YybkUwbsGdQRDRdJLhXgbUCA6ylfE7qZHbjrspMspNXzE7Ow+2W
 TctV6oV7FCD5uC/6ZeBxuzdpog==
X-Google-Smtp-Source: AGHT+IEktaLQJoWK/hH1JfzoVpanzSV8hKJztF7GsxR25+t7qKa/irschiw171NMMHwJxA4AjlYwfw==
X-Received: by 2002:a17:90b:3105:b0:268:e31b:decd with SMTP id
 gc5-20020a17090b310500b00268e31bdecdmr11398736pjb.11.1692132256776; 
 Tue, 15 Aug 2023 13:44:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:8d06:f27b:d26c:91c1?
 ([2602:47:d483:7301:8d06:f27b:d26c:91c1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a1a4600b0026943a8468dsm588423pjl.18.2023.08.15.13.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 13:44:16 -0700 (PDT)
Message-ID: <40ec95c2-7775-4a40-f73a-8f92d3cfb00c@linaro.org>
Date: Tue, 15 Aug 2023 13:44:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 07/12] target/riscv/cpu.c: add
 ADD_CPU_QDEV_PROPERTIES_ARRAY() macro
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230815201559.398643-1-dbarboza@ventanamicro.com>
 <20230815201559.398643-8-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230815201559.398643-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.045,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/15/23 13:15, Daniel Henrique Barboza wrote:
> @@ -1883,6 +1883,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>   }
>   #endif
>   
> +#define ADD_CPU_QDEV_PROPERTIES_ARRAY(_dev, _array) \
> +    do { \
> +        for (Property *prop = _array; prop && prop->name; prop++) { \
> +            qdev_property_add_static(_dev, prop); \
> +        } \
> +    } while (0)

Any reason not to make this a proper function?


r~

