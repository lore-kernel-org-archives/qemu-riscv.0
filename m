Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSVkt-0008Je-AF
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 23:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSVks-0008JL-3h
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 23:20:22 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSVkq-0006VE-Ca
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 23:20:21 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 w20-20020a17090a8a1400b00233d7314c1cso4563409pjn.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 20:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ysnWouBQhWdhKYLL3gMgf/szWZYqKA1lLECM5vmPbE0=;
 b=iOLEL4vJvGdgKGZdol30q36V6kWUvXzAUImlNLiS4lco4fzy/704nwqTpVgN+N1P6K
 EYisciam+sb3ZHRL3ORcYoBtc8nvQJdPcdd52TXlR1o5REaPqA1qHiFXCu9m3SHv5xLu
 aJpLo5tztr6cAEKqU+oqMjTXkZeTHwoPCJesIXVRzZ2EH6jc+VMnq3Ew2GrzUz9atyDA
 zNfuv/Axjt9dmocT5D6FA7Ow86XdWn0TTWZc2Ih0NucWcuOaLQyxLzPZJQ1cfsu33X4L
 rFY+S6W1xIwAXHyQsardpiw6iIIQueJdZjpmARgB5rcZOwLXe4hh/CT2SzVfT/vhK/v/
 qvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ysnWouBQhWdhKYLL3gMgf/szWZYqKA1lLECM5vmPbE0=;
 b=uCN44RvnnRnHgjlovgLxrAq2ymC5ggQLwQS8JIh16wKGiBuP6d9iB04vJ1MVVO/0o7
 F5+FyXa1dXjxkOojelR+u5SPZU4Dz5aEwR2z/BJU8MAKvwsIvjD5ZKAdmUWUtsRNBLdo
 8rsubfmm1ae0kPtGDq+8Qv/fo18H/yZOT5vqmwws52VD2QpvGChEOz/dS1rYXG8aghwu
 RqddQfp/punY7Km2WYJNuQdKV4gpuNRRgzttI+VyplBkUZ0UEDYa7RQmGasMiaYLew2O
 +kmrlNXPXZ2bs/Og4F0aJ4W+/nJljqQ0ZNbF28wBzOKzG70bjASvJhsYgHqiuPtKE/pr
 V9qA==
X-Gm-Message-State: AO0yUKW9k1vzTWa/cRTVxGCGbmuZde7m6qIgZojbbBxUq8ATXG837OBY
 AoYqjAMZSttAwjpOn7rE/lLUOA==
X-Google-Smtp-Source: AK7set82KdVF5fSd1wOECpIWOHqvr/yD5ropTQ7GYugtMU40aZRkBmmqm3C5SX1tKgGubplnyDgGbA==
X-Received: by 2002:a17:903:11cf:b0:19a:b32e:cbb with SMTP id
 q15-20020a17090311cf00b0019ab32e0cbbmr5890281plh.11.1676521216495; 
 Wed, 15 Feb 2023 20:20:16 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jj13-20020a170903048d00b0019927ca0f8fsm165308plb.62.2023.02.15.20.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 20:20:15 -0800 (PST)
Message-ID: <f6fc9831-5cb1-1cfd-3133-e79fd5a478b9@linaro.org>
Date: Wed, 15 Feb 2023 18:20:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Deepak Gupta <debug@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-2-debug@rivosinc.com>
 <64a76da4-62d3-61f3-e8a8-347e3aa7eaca@linux.alibaba.com>
 <CAKC1njQEcuEO=TSkK8qzywADYGh6cFLLUKLJ4fTfULHvKPOa=w@mail.gmail.com>
 <21dedcd4-3483-c080-7a00-6bfeacbfb314@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <21dedcd4-3483-c080-7a00-6bfeacbfb314@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-List-Received-Date: Thu, 16 Feb 2023 04:20:22 -0000

On 2/15/23 15:46, LIU Zhiwei wrote:
> We can rearrange the patch set as follows:
> 
> 1. Implement the zimop extension.
> 
> 2. Implement the forward cfi only for system mode.
> 
> 3. Implement the backward cfi only for system mode.
> 
> 4. Carefully make the forward cfi can work on user mode.
> 
> 5. Carefully make the backward cfi work for user mode.
> 
> I don't think we can easily make cfi  work on user mode. So we can also ignore the 4 or 5, 
> or both.

This is a good ordering.  Similar to how we implemented CFI for AArch64.

I strongly suspect that you will need to defer 5 until the Linux uabi is defined.  It will 
require some mmap bit (MAP_* or PROT_*) which libc will use to define shadow stacks for 
new threads.

But having the system support in means that you can work on the corresponding kernel bits.


r~

