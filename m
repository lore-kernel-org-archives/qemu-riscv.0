Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p82Zo-0000Fa-Er
	for mharc-qemu-riscv@gnu.org; Wed, 21 Dec 2022 12:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82Zm-0000CH-IF
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 12:08:18 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p82Zj-0001Gz-Ns
 for qemu-riscv@nongnu.org; Wed, 21 Dec 2022 12:08:18 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d7so16115256pll.9
 for <qemu-riscv@nongnu.org>; Wed, 21 Dec 2022 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=32CKJsIEQfVT1E0fb7Rf3n09fZB0OXpfQTfmhkWjd7I=;
 b=LDvGWkd4VxEujKsERr2VJU+5Kpu5Xk1Y85EXa4jM6v+HGJfeKKA+eMi8dKQM6iNR9W
 b0Sb2qlE1rscmVfdAKJF3a/2Yu6HO0kV6midL4niRofJN7LwKB1WiCIzXvtTJSjoqSYM
 E1BhTYms/JJ59L7Q/QREHFd7vtE4g1Y5A0/0BCZLY8F3Cgp0pIW8WsPX3vafLqBoDirJ
 +758U7BAgGCXOtabsFU7yAgsWOiaoPtx2zYrE2XkztFNuJugpWdUXdY7xK/mWaKQM+SO
 LeLG0QDGzsKKBrqSKhTzgD4b5X3vizkRIZA07uKrhJ17DTNXn7FrZCYIxbmhF5bzpwNn
 vQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=32CKJsIEQfVT1E0fb7Rf3n09fZB0OXpfQTfmhkWjd7I=;
 b=l8WLL+Mf63crGKsqp6fCKQFubDCjpVI668vJ1BFm5Yl0+IXqlexH8Fak0JIB5TOFS4
 O/DZ7XDb2d3MbmmjMIMVohAadPv7LjQM79y/mkvEsOcXythoy9Tf6b9LD+tJMPsmpUcV
 o8cA+4io1nxoSPIMcADI0D0BIZcily2ft8AoVoOViCbrkyphYK3bRnidmKgn/DL8buAq
 VdIPmybmtZydD+gMNLkpJr5lmwE5V97bKpN7Z/fA0FFtkN2pLAFiajswkLcYyj+qC6we
 zs5hnpD4m3ihOtEbvMf9Efw1jWBZAiUZeJBJHyHdOAdNnfIe+EN96Jc9rOEsvuLI+B7M
 jRuw==
X-Gm-Message-State: AFqh2koLBUOXa3SgUIU/nXRo7qV5IINeUxw6VFeNlC02UeBxi0IzDE6W
 IQPaSESl/JLakJO075DCa+60VA==
X-Google-Smtp-Source: AMrXdXuZGKGZJ0mcs/b9A3x8fjeTvkd5dq55Hp/7adGuZCAtkF2Q8TGfQhw0P6rT/AucpkJi40xsyw==
X-Received: by 2002:a17:902:e944:b0:189:d8fb:1523 with SMTP id
 b4-20020a170902e94400b00189d8fb1523mr3027348pll.36.1671642493991; 
 Wed, 21 Dec 2022 09:08:13 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:e04c:516d:5698:abe8?
 ([2602:47:d48c:8101:e04c:516d:5698:abe8])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902714a00b00176e6f553efsm11666984plm.84.2022.12.21.09.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:08:13 -0800 (PST)
Message-ID: <7d41b1a5-bfb1-e9b8-a920-7a07da91d32c@linaro.org>
Date: Wed, 21 Dec 2022 09:08:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/riscv: Set pc_succ_insn for !rvc illegal insn
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-stable@nongnu.org
References: <20221203175744.151365-1-richard.henderson@linaro.org>
 <CAKmqyKOY-RfSOeuuQazaZ6UvGRfOhrT7-Lk_FCDfpyybN9GZAA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKmqyKOY-RfSOeuuQazaZ6UvGRfOhrT7-Lk_FCDfpyybN9GZAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 21 Dec 2022 17:08:18 -0000

On 12/20/22 22:20, Alistair Francis wrote:
>> +# Disable compressed instructions for test-noc
>> +TESTS += test-noc
>> +test-noc: LDFLAGS = -nostdlib -static
>> +run-test-noc: QEMU_OPTS += -cpu rv64,c=false
> 
> This fails the `make check-tcg` for Linux user mode when testing plugins.
> 
> This diff is required to get it working. I have applied the change myself
> 
> diff --git a/tests/tcg/riscv64/Makefile.target
> b/tests/tcg/riscv64/Makefile.target
> index 9973ba3b5f..cc3ed65ffd 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -9,3 +9,4 @@ TESTS += noexec
> TESTS += test-noc
> test-noc: LDFLAGS = -nostdlib -static
> run-test-noc: QEMU_OPTS += -cpu rv64,c=false
> +run-plugin-test-noc-%: QEMU_OPTS += -cpu rv64,c=false

Oops, thanks.


r~

