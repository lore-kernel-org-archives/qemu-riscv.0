Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKtRg-0005Ne-NT
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 22:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKtRf-0005MJ-D1
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 22:24:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKtRa-0006cr-Jm
 for qemu-riscv@nongnu.org; Mon, 30 Aug 2021 22:24:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id c6so529130pjv.1
 for <qemu-riscv@nongnu.org>; Mon, 30 Aug 2021 19:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GRfOSvP+VMTbrmpir74Tsl5Y7UDu6m/hzPzcsp3WTKE=;
 b=eqEeE2D44ezUK6hu2NIHZ/nN36NqLBDZUezz2Ug8ugVJNmqF7Mrt2Q7/Iu8MdSvoFJ
 rp/QVYS4cbDpkeFAQRJBPDbPuVInhqoBO13r6hh+Jn723Zfi0Q8jSFewQjQ8MrTKhH07
 U1ykgTHNK58X+WkAS0AsqX3Ux9HE5mLUL/b0HJdkk5WySKrP46hgN7IuKqZiHHPTAaN5
 HdBPdk55Zvmfg8sItPoFcheaAxSwHHlqY8DJoOEidgBmEGsEqImiOJ2kb/EJ9Nlq1nlx
 hVP6HMr8wJVv+4l2Zou78f9rx1/B3gZzOUuENTQR9tgs5HAaC1D9baMfN3Ub60poNnZ0
 g4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GRfOSvP+VMTbrmpir74Tsl5Y7UDu6m/hzPzcsp3WTKE=;
 b=FNpTAJjHOMXlqchLhRZcxf3Hvyt7wrPZRTmf0Y+i8iR+xlGrM/r32OkIWrOn6pOU52
 EXrVeXVhsFZZ3MmT2D63L4f/4RuRXwCfS8KegjW427rzDOyPxEqxbSDXElA8kqOfBqDA
 xU/xHNJlH85TVeJgB5GGYcBm36M7cN2LYiYpyVzakqZL9FgYC5+EToY45RnOW4GCVSoA
 JJ18lNRd6YK6nz67KC5FVgLPoCaTEzE8aQ2eKFq/dM+FNmQHIb7DIfNIHX+SI47lCG6p
 BsgO6ILEyx9WmgbN6xwTvLBI16BX5QRVHeqoZbme0p9r9KqJNWwMNbrnRZ+Ms7Zt8vp7
 6O0Q==
X-Gm-Message-State: AOAM531LULHe7QnLvkDDBv4GmDh8zg4w5GE1h+7Yo8ONjnEbIGr1ZtvF
 cQmrZtbsdroTY/+TZB84LlV5kQ==
X-Google-Smtp-Source: ABdhPJxMDesKv1E6Men8+tMNQGKeeM1iUkZMVGlCvJjskf3RkEkcrgof7/QQcIPVbmhyUykttiBlXQ==
X-Received: by 2002:a17:902:c406:b0:138:c28f:a779 with SMTP id
 k6-20020a170902c40600b00138c28fa779mr2430383plk.1.1630376648804; 
 Mon, 30 Aug 2021 19:24:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id t10sm732733pji.30.2021.08.30.19.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 19:24:08 -0700 (PDT)
Subject: Re: [PATCH 3/8] target/riscv: Addition of 128-bit ldu, lq and sq
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d494ea6e-4eed-7d74-b9f7-130201a8294f@linaro.org>
Date: Mon, 30 Aug 2021 19:24:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
X-List-Received-Date: Tue, 31 Aug 2021 02:24:15 -0000

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
> +#if defined(TARGET_RISCV128)
> +/*
> + * Accessing signed 64-bit or 128-bit values should be part of MemOp in
> + * include/exec/memop.h
> + * Unfortunately, this requires to change the defines there, as MO_SIGN is 4,
> + * and values 0 to 3 are usual types sizes.
> + * Note that an assert is triggered when MemOp is MO_SIGN|MO_TEQ, this value
> + * being some kind of sentinel.

https://lore.kernel.org/qemu-devel/20210818191920.390759-24-richard.henderson@linaro.org/


r~

