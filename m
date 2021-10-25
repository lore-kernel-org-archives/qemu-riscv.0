Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf5MP-0003Rd-IQ
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5MK-0003QF-Hh
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 15:10:12 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5MI-0008Vu-Mq
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 15:10:12 -0400
Received: by mail-pl1-x62b.google.com with SMTP id r5so4017613pls.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hVanuikBIg7iyJOS0bHt7RhnYa/QqZ8SXAaMv28MRCc=;
 b=I5YeXiU+E8K4hSFqUrjuT3DlfFvbelVcqh9PwQz4z/Jra09M5jLZ1cqfVeGGxChfvO
 +8RDlP1PuMf5yp9v668yCt+YC6nA2Req9Vjdm71UMOQFfEBaAAgvThvtf9/LSCp3I293
 cNNKpqBRZNFMl1I8VqqIoXn12eRoa4gIrSWcQSE6+OpjBZiXb/zhc3NTnqUF3AjjXyxQ
 gEPZI/VuQVeWOmYjZiAA3I9nx1SNhS8flyyGW8fa9ZjGU7joORocQkjNwCPi39GGZn9z
 jxNhPKMmcaPLz6yo3K4mTKvDWhkpaXMlpOA74J6VkBtW6hmRr46JTO7OjD4i9zCi7A8Z
 PFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hVanuikBIg7iyJOS0bHt7RhnYa/QqZ8SXAaMv28MRCc=;
 b=K7okwyV//qjK9zCxMxQjqiAtkGbqeKAvby3vmAfgsYr3lBj3qua/Dq3h8U1f11MRu2
 LVHa/6aYNY9lFw377pGE8h9sBObQyCzZ//mjy3p/jXI5EIyyVc1ziqsLUFpewc1o72AP
 ykN+u2yMXBmh8SbaYTo8/7VYlg7VloxLRXQzwLk4atEkaezXbULcI22eVUyF1AvCSDjR
 OC+11OsCZBzBRtFPnyzZYFylgsF0rKY2NAnxcp0F4uc59lsugbweKjY4DqTnb+2QKO/h
 lFB3D1El+eW6AdKevGp/rxzVZc1u/mr/TrRpHn7pk29Qa3rAOWlLMZ1zr5aE646p0znC
 PaEw==
X-Gm-Message-State: AOAM532RkFw3BEDPENHg0PhGG91KzKgDnu6TQe0jtJQCTgnQffhOvb5t
 ZTtSzM0nnSJEGZrqOfE3uUgxTg==
X-Google-Smtp-Source: ABdhPJzmmm0LVJc1Us3arsoLIJg85QV6Q0QPG1TuAt6WrJdewJ4WNLfrZHZa36dzpbpLRqFjq0piGw==
X-Received: by 2002:a17:902:ed86:b0:140:2896:3fc7 with SMTP id
 e6-20020a170902ed8600b0014028963fc7mr17660065plj.37.1635189009192; 
 Mon, 25 Oct 2021 12:10:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m22sm19302177pfo.71.2021.10.25.12.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:10:08 -0700 (PDT)
Subject: Re: [PATCH v4 05/17] target/riscv: array for the 64 upper bits of
 128-bit registers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-6-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18de8766-9193-12a9-fda3-6b8b7a59bc56@linaro.org>
Date: Mon, 25 Oct 2021 12:10:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-6-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 19:10:12 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> The upper 64-bit of the 128-bit registers have now a place inside
> the cpu state structure, and are created as globals for future use.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu.h       |  2 ++
>   target/riscv/cpu.c       |  9 +++++++++
>   target/riscv/machine.c   | 20 ++++++++++++++++++++
>   target/riscv/translate.c |  5 ++++-
>   4 files changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

