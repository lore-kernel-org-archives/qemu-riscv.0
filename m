Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C099DC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 09:56:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1seAjO-0000O6-2p; Wed, 14 Aug 2024 05:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1seAjM-0000J5-6z
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2024 05:55:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1seAjK-0008Tv-0g
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2024 05:55:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ff4fa918afso37725595ad.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Aug 2024 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723629344; x=1724234144; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iHg4T+pbxh5EjB2vtOo2uWBFIU5uizPJDJw17upuzhk=;
 b=pXkIbk7aOJFFtnERmFBZhIM1SDSsyCQxxJS5HPJ5g/TtB/4JrZJYs2EjJ5lWVA2lQK
 yMgDPBbeOs/sM7DT6j23q4+ROxTWMvZbRt+OA2MpSdlqQJCNNTxBIqja6WMQ7zMgBoX5
 PVArvZAXV9UOfdV/wS4fnhwuDBGUrrM7xOALp2Jenp0crwT68SC+3GNDSCU1N6616n75
 bfAc6RjvY/UkQInS1c2PQjtxYwMyVeqibk4itdwMcX/jHCgsGSlAkcHZgq9lrhoOrdhy
 1Mtc+pmqOU6vMi6SfQksDho7+wox3KRDStqQl4gEX5DG/OCP6myOmiCldbHhfecrBy/j
 53TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723629344; x=1724234144;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHg4T+pbxh5EjB2vtOo2uWBFIU5uizPJDJw17upuzhk=;
 b=ED7+YTc2eiLX33jNbCT2YuSkVS1FNmP3baL5LIhz1M/yZcEoB/h7HLa66NDs9ttetD
 LXUNgFmcempwebZtHyoNpyk1OmKsCWip8n0yfWPd9wxhPplw7pXpXZwo3Ghiofy8h74L
 tWFFNBWDu+6btZZZQh/4KNAnil38OlAGWd9rPEWf3BdJuw0b2lMXbHxSNV1fyeRRcy5h
 nAgytjY5nw1EIAsg4iv+M7ANrI1Ez3ZZMWVFXXqUzJRre+vWC0yDj3/f/6TDnX3GuNcK
 Q9DeH0wT5otG4wzrMnX5wYEe4KIkY+OrnZG11ccLoS/PbHCTrMt5qz6g0icauX2tN9k3
 9dsg==
X-Gm-Message-State: AOJu0YwE6P9ArL2KsIE9FGhTDWmIDQ9sSgETj5a7C0TcJ3uLSUXA4Hnb
 6lclf++nNc6m0RvdemAJWqCG5ZPt792N/w4ZrVho/xNvoVWg+1o1FKC2BI84LHc=
X-Google-Smtp-Source: AGHT+IE3bE5lUoTUHE98v6sqXHZQbFCbnk6exN9O6IBDDcegx0wY4LLnnKd4CHTIp+Ur0o1A2RHmTg==
X-Received: by 2002:a17:902:f542:b0:1fc:5eac:9873 with SMTP id
 d9443c01a7336-201d63dc1bemr27860605ad.30.1723629343919; 
 Wed, 14 Aug 2024 02:55:43 -0700 (PDT)
Received: from [192.168.1.113] ([203.30.4.111])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1b4497sm26280605ad.191.2024.08.14.02.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 02:55:43 -0700 (PDT)
Message-ID: <d9a6dcfc-7ab0-4be7-b22d-21bb54710004@linaro.org>
Date: Wed, 14 Aug 2024 19:55:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/15] tcg/riscv: Implement vector roti/v/x shi ops
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240813113436.831-1-zhiwei_liu@linux.alibaba.com>
 <20240813113436.831-15-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240813113436.831-15-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/13/24 21:34, LIU Zhiwei wrote:
> +    case INDEX_op_shli_vec:
> +        if (a2 > 31) {
> +            t2 = tcg_temp_new_i32();
> +            tcg_gen_movi_i32(t2, (int32_t)a2);
> +            tcg_gen_shls_vec(vece, v0, v1, t2);

Drop the movi, just pass tcg_constant_i32(a2) as the second source.

> +    case INDEX_op_rotls_vec:
> +        t1 = tcg_temp_new_vec(type);
> +        t2 = tcg_temp_new_i32();
> +        tcg_gen_sub_i32(t2, tcg_constant_i32(8 << vece),
> +                        temp_tcgv_i32(arg_temp(a2)));
> +        tcg_gen_shrs_vec(vece, v0, v1, t2);

Only the low lg2(SEW) bits are used; you can just tcg_gen_neg_i32.

> +    case INDEX_op_rotlv_vec:
> +        v2 = temp_tcgv_vec(arg_temp(a2));
> +        t1 = tcg_temp_new_vec(type);
> +        c1 = tcg_constant_vec(type, vece, 8 << vece);
> +        tcg_gen_sub_vec(vece, t1, c1, v2);

Likewise tcg_gen_neg_vec.

> +    case INDEX_op_rotrv_vec:
> +        v2 = temp_tcgv_vec(arg_temp(a2));
> +        t1 = tcg_temp_new_vec(type);
> +        c1 = tcg_constant_vec(type, vece, 8 << vece);
> +        tcg_gen_sub_vec(vece, t1, c1, v2);

Likewise.


r~

