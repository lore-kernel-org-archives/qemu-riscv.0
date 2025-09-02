Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDF2CA0FFE
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 13:39:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utREb-0004Co-UF; Tue, 02 Sep 2025 09:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utRDr-0003tq-UJ
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 09:38:58 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utRDj-00007V-7F
 for qemu-riscv@nongnu.org; Tue, 02 Sep 2025 09:38:49 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61ded2712f4so4000584a12.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Sep 2025 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756820323; x=1757425123; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wmLuN/L6a+1f3NMiwbY7vqahMITBbCj9nv51vA3FXlE=;
 b=m8UAPs9hKhDQcyX0UVafI/BQLiH9q8ddqwSnaJ8pJI+cCm8YTQEF7DMkmny5P8c2XX
 fTpyBC0BwHyk5hRpHXypj7+pT1dKBQ22DxhL8TN0S51XbupDdE4FLkks4HClT0wuTbau
 VWykT8JtWFmxwM2trU2gWdzGG8m2fTFW5NfrZRfQlbKSbDRYg5rWgpYbeVf9D0B4FmAs
 f/8e1J5jxeiyHYO8wbL/CVy5bypg6UFxHBLwAJXUsaf5HtKTWJPihHYFzHUU7JhNpdVE
 tbZzVlhGietvCBa4GrNmS+EBsE5Z4MX92aCFZQ+aGK4w9x54DcBHPjlcPa+D8DgBFvcT
 peXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756820323; x=1757425123;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wmLuN/L6a+1f3NMiwbY7vqahMITBbCj9nv51vA3FXlE=;
 b=kce2Wy/gP3oBLmThgz8AUcAodQqdIwOxhG2QZE+TBd5h+pxwS86aTGywfVaogFyrnl
 6G/oeR9Cx6c07yvHtWwxE7lEGqsLKTP9qKbM3Lqwq6ojsruV7tfwzxRcssnjNk9LXRpk
 I70L09efugAHFBLnQHLmeyzt3SdPFfMt4nqrigyEDcXwZP3ZzfvFKP1PPmW+y0lD8stk
 IW3nS85y3BD/ptXiIstrcqN/pyFk/4cmoO50HGmcs3tLG6WFVY0fZQA/ie2OIyoENhGb
 iNm4LcToBit5mjebCRob3QOMTt8vTnPkAYz1ctQLZIarKHmCypNK4KFgPy0OIREbOyx/
 TWRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyYaBVUD/NSq2FR2vGr7efMhJEUrq6cMTW2stUPM6tGrJQUWbLyomzUrr4P7FD9zsgw9yzftnWyZ9e@nongnu.org
X-Gm-Message-State: AOJu0YwJgcNwwjhra34GRXpjUS4cPeG3xskZiCBGylcBkI6AhkUGDP3d
 lDUnGU06PQAhQUL20Qj5v18KkcOKvOvkVSkOh7kFBQ3lK9d0RCsamgLieuGprktfvH8=
X-Gm-Gg: ASbGncuFdhc1U+cescV89lYAzq1dnyYbrECYtKE34NjIe378gG+ui+JWvyEJJnMRwbA
 ZBqp8t281urum8pZViOPCcmDpK935yeFTyIqXsvr18DefRC7cwaVXRPmhZn2H6tGPevGwQxt4OB
 at0OQkdyYDzLPIMH5h36CN1IJAM94aqh8zmi2xlG6+uwT/cLDRMeYi8d52LuqNDQNKZl64X2Mdp
 czlXUV0+H9BZs6ud8ziNhe5xvowfun201ZVaA1GB83i1jQAvoq/i4UvTYysqA+9YdkaEAlUxjwc
 lErOxlVFQ8FKciE8wNKlSINi6Q2rScKZqh5MPCHDB7blW3qrHUOupvcEfcZsU+Y8rwHG+XdVCEp
 84azjgYQLZaT1vJsN8dWLb5l7qXpUI+Ys2V2nLRjo+tfUl8kn6vKlc0Yl/Qz9b5XLLUHTUr8=
X-Google-Smtp-Source: AGHT+IFySwjcqrEbFbl72gAuJPszLA7vj3X0Qv/OAIcOit4yG81vxbDgXgKPrKaGdvAihpRT+uPzKQ==
X-Received: by 2002:a05:6402:504b:b0:61c:5264:902c with SMTP id
 4fb4d7f45d1cf-61d26c53e03mr11015110a12.23.1756820323467; 
 Tue, 02 Sep 2025 06:38:43 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc52a886sm9467717a12.43.2025.09.02.06.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:38:43 -0700 (PDT)
Message-ID: <5d0fe741-9063-441d-8abc-3bb0662c1fbe@linaro.org>
Date: Tue, 2 Sep 2025 15:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] target/riscv: rvv: Add Zvqdotq support
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250901133815.1693077-1-max.chou@sifive.com>
 <20250901133815.1693077-3-max.chou@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250901133815.1693077-3-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 9/1/25 23:38, Max Chou wrote:
> +#define OPMVV_VQDOTQ(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2)          \
> +static void do_##NAME(void *vd, void *vs1, void *vs2, int i)            \
> +{                                                                       \
> +    int idx;                                                            \
> +    T1 r1;                                                              \
> +    T2 r2;                                                              \
> +    TX1 *r1_buf = (TX1 *)vs1 + HD(i);                                   \
> +    TX2 *r2_buf = (TX2 *)vs2 + HD(i);                                   \
> +    TD acc = *((TD *)vd + HD(i));                                       \
> +    int64_t partial_sum = 0;                                            \

I think it's clear partial_sum should be the 32-bit type TD.
Indeed, I'm not sure why you don't just have

	TD acc = ((TD *)vd)[HD(i)];

> +                                                                        \
> +    for (idx = 0; idx < 4; ++idx) {                                     \
> +        r1 = *((T1 *)r1_buf + HS1(idx));                                \
> +        r2 = *((T2 *)r2_buf + HS2(idx));                                \
> +        partial_sum += (r1 * r2);                                       \

	acc += r1 * r2;

> +    }                                                                   \
> +    *((TD *)vd + HD(i)) = (acc + partial_sum) & MAKE_64BIT_MASK(0, 32); \

	((TD *)vd)[HD(i)] = acc;

because that final mask is bogus.


r~

> +}
> +
> +RVVCALL(OPMVV_VQDOTQ, vqdot_vv, QOP_SSS_B, H4, H1, H1)
> +RVVCALL(OPMVV_VQDOTQ, vqdotu_vv, QOP_UUU_B, H4, H1, H1)
> +RVVCALL(OPMVV_VQDOTQ, vqdotsu_vv, QOP_SUS_B, H4, H1, H1)


