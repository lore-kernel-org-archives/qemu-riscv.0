Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmWwI-0001x2-7D
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 03:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmWwH-0001vT-Dd
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 03:02:05 -0500
Received: from [2a00:1450:4864:20::42a] (port=33530
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmWwD-0007U3-TZ
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 03:02:05 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d24so28899981wra.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Nov 2021 00:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GbpP/8KAioO/YRtL4rx7xGjmagDxShnhsARaSYnQBmA=;
 b=EjWHLAPUYpTI39hZCwI/0jzic4v890SQb9c40U0ss3urDTnIEM1J5/NOUAueyPHAZZ
 jZyMDAS97O3nDnlFlXk26wt9qYbEzwrF6K98/ZADv7a0/oGiwo9q7d8Q6VsUwWXW66p7
 D+OEIOyRaNdxOHJX+re9iMTSWrOke14UbhgxNUgENwVIs98sr9GAcXOua8S5wnKuO2Z9
 8uZzCP/GGc9b9pRzV63g/wSYuULFZEW0M1lZuaYuLoUyn87IaHHBDb9dTbbJKj2zIHVz
 /058FXBRK61Z7PZV2SXNwYhJQS2rra9ssqOHueyTZaKc2bOPCGWhLxgkvpZ386T0XpcJ
 xk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GbpP/8KAioO/YRtL4rx7xGjmagDxShnhsARaSYnQBmA=;
 b=Ly/VoONYjhr5FhxUYm5SzmV9V9UhMTQKbhH1c4hsL+/p0N0pEwbkPzZsXe4boi5VAT
 YzpSKzvzT7IHFvPAQtlnO0w7mg+4lwVwItZVffSWpTdufB5ox3bPC7ot5d3/6rYxrdtg
 sSkCh376Mbr7aXwIwFYjdi1N3eKVyg284oVI07XP/yrOcIFr59VmQJJ8++vjGptSqP23
 jRE1/qp5RUzUJQs9JlKtc8JQo0EZ7gLEO+FKLlFMpGuc/JDQXYM4ejR7FUJMcersw6Nb
 xuAFkKT4yCQyzgZI/ZznbGln0aZYcrWjeuRHCiNwxiMOQwFfcL7P4v9gIoA2Vwj6sTht
 AJrA==
X-Gm-Message-State: AOAM530dXavA/1AJb7/XbFas1JypR7AibcN+0whlWArrVuMz6QfZOvFn
 MZ6tqwP5ypaUbPwHkhR/MA8pCw==
X-Google-Smtp-Source: ABdhPJxGP1sBWgz1fUXwlGhKFIGGRR0BSwOavlVjs4ws9Biskq2Wl3nNXK3zN9c6fcDzMESuNj4npg==
X-Received: by 2002:adf:d852:: with SMTP id k18mr42029970wrl.391.1636963319292; 
 Mon, 15 Nov 2021 00:01:59 -0800 (PST)
Received: from [192.168.8.105] (137.red-176-80-46.dynamicip.rima-tde.net.
 [176.80.46.137])
 by smtp.gmail.com with ESMTPSA id n32sm22316799wms.1.2021.11.15.00.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 00:01:58 -0800 (PST)
Subject: Re: [PATCH v5 02/18] exec/memop: Adding signed quad and octo defines
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <334343ea-77e6-431b-4dfc-433fd1986ede@linaro.org>
Date: Mon, 15 Nov 2021 09:01:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112145902.205131-3-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 08:02:05 -0000

On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
> Adding defines to handle signed 64-bit and unsigned 128-bit quantities in
> memory accesses.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   include/exec/memop.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

