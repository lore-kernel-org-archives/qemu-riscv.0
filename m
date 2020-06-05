Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhGTr-0005QJ-CH
	for mharc-qemu-riscv@gnu.org; Fri, 05 Jun 2020 13:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGTq-0005Q0-3W
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:50:10 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGTp-0006Tw-87
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:50:09 -0400
Received: by mail-pf1-x442.google.com with SMTP id z64so5323169pfb.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2020 10:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zuM3Ss61uV7K9Slj9YXzJ50CwuFDaA4NA1rXaFp4tWA=;
 b=PZVipeApRDnZjANzqPgvyrvd94KlmYlLJJYP1v8mICk6XwbJEEcrks2B1+l2UYKjMW
 odSYrSJcex8v9Hw2xXbQBQOExo6EtAg4pqm1FGUuwJTdCTN0Dm41DVXv6/qyWS9wnUTj
 juxN7+16rZOsrGOfjjNmUGSQ2QIvgtOY6mRT/N96niXKxS0KY7WPxaexIICyBoUq32Bp
 pPebbogORckfqqgeTjf+fXk1J6VpwYROijRh5v9L91tJ32vWR0NOVcrZOzsq15y6D8v+
 ggohIrvr6XZdGe2f98qT6ZrdwiqrrGqITBpC8hD8hydAaFgx36PQKMfdULbGAS9KJGTd
 gh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zuM3Ss61uV7K9Slj9YXzJ50CwuFDaA4NA1rXaFp4tWA=;
 b=cyvglou8Gwz0KqE1RNjpKYCRvUxVBWVOtev548vb7aZzsbb2XJ2ckPZ3VmSnvbLCvC
 G9u0HdsZ5bMxU1BxAK5BsRhRx8NiGtj6qI0aFXZnGOZ/rru66I+2BW2KACBCZpaTMnfp
 glQPW73IZTyMxvYCT0tiRjAMM9XTejF4EKb909DB2B+nzHSTH24F81eNxVr2Rj28LQUV
 O6WrjJLil3L2nH1MDQmkUT8BLJiqUr1QF1oYwYXQmFizjYAzAwirkZ4tWDlOmZMkz887
 3+SsyPyA8SHSbRe8H9cfhUDWuhVSr8z04WQZ1amWdZtyqBhwZcpQHB5gZ/pLGUWmTwW4
 RZzw==
X-Gm-Message-State: AOAM532pp1f7vSTRTkCXX6256i1wVbDGghAtJU7HT2WRh0ZOm1yMnJwm
 szahKVg+2jUbPfgnIOfCuu3THg==
X-Google-Smtp-Source: ABdhPJzxnvV8wm/kwBf8GnHqdmH27lIDLge48DOT92yCDhlrBJZCNNh87knWk1h+BgbWwoSUiOcteQ==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr10384854pgq.272.1591379407696; 
 Fri, 05 Jun 2020 10:50:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z24sm228815pfk.29.2020.06.05.10.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 10:50:06 -0700 (PDT)
Subject: Re: [PATCH v2 01/17] target/riscv: Set access as data_load when
 validating stage-2 PTEs
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: anup.pate@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1591319882.git.alistair@alistair23.me>
 <5556f87b6d71a61f5e9113873d91132e08ac6b2f.1591319882.git.alistair@alistair23.me>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3289584f-74a4-b9fe-0c24-dc711711a5a7@linaro.org>
Date: Fri, 5 Jun 2020 10:49:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5556f87b6d71a61f5e9113873d91132e08ac6b2f.1591319882.git.alistair@alistair23.me>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 05 Jun 2020 17:50:10 -0000

On 6/4/20 6:20 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

