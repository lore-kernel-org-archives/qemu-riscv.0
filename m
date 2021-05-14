Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhT07-0005Nn-6M
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 04:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhT05-0005IM-1u; Fri, 14 May 2021 04:16:49 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhT02-0003Fl-Bw; Fri, 14 May 2021 04:16:48 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u21so43465056ejo.13;
 Fri, 14 May 2021 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bwrvfRk/Susrc/A+1jfhRSrzjKU3WBNGeb4ya2ubwO0=;
 b=kUDvvLsGsIkAnKhgXaaa9qkCtWCkdDvnMy7XqI7G6NLdqmw6iUBo36qXpd8frbdDQM
 ufwUTRrGYflb0qMq0C42DrQDv903gMJiZ9RmkwhyKss2Wy9sa3fJS5HT4blfDVSxDOHE
 cZ3Txy2N1xgi7qfd5XgxM5K4dnJk8wUMvZ1eaY6jDl9Lu1l35AEnVFUY3weSmnjvOO/F
 HOre/rPcJVS0GrCf+akxTC1Gjf22oAH+mBuUWokGiHjtt/zbuSBJGSbfYzMXExriDZB4
 fj9bu5niVrvClejhKe3lnXC8mrN6yutKx6XCElb5YJoEwVLT0oPrU4y5F1nZ6ImgCmTd
 +weA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bwrvfRk/Susrc/A+1jfhRSrzjKU3WBNGeb4ya2ubwO0=;
 b=LMyG68Tqm3pt7w5D3ghp0nZpSimZSM34FmthVNs91/STTuOfOcXwha3GhTtelK7A8H
 CtfF+6JE3Iez8Kv3vo0XKDAVwfJehqOjOBrRW/9WHcJWZL5AL71NegIbZaLJg2oVxsm1
 DhTEQa6yiIuNvdo2Fq0MoKljpbuNAMer5yTX7bkW08CxrNVyXlaI8Ws6JNcMxq+BkP1e
 Q2JXyg9LSJ8w9UoZvpzZkdbmD6n/zXoLKghfK71/7LCvjngpuVtDbMk2MMUQd0FW3Cj4
 qgp8YMF8ubkjojL4CFO6VYmKDxj9p5lg5l6y28S/lUiQfH+nVEn0kjiSOXZjWrONv2jT
 95Pg==
X-Gm-Message-State: AOAM531W8sVE0v8q5YQkYnI3mJ7YsWdrKdxQtfTM5OFWEfESVW1izgrF
 XPpsCOtRfQl3r+OZLnhyDtTJ9T5gVHiiqA==
X-Google-Smtp-Source: ABdhPJwx7p3zm347TsshdYaOAMOGCjWL6O1jyarf2vQqjtfb+Ifqb8xo7ZbdNiWy901YIQe2c0bpAQ==
X-Received: by 2002:a17:906:14c1:: with SMTP id
 y1mr48919949ejc.481.1620980204158; 
 Fri, 14 May 2021 01:16:44 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id ho32sm3166455ejc.82.2021.05.14.01.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:16:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] target/riscv: Remove unnecessary riscv_*_names[]
 declaration
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210514052435.2203156-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <74b2a19b-f82d-e5eb-2bdc-277d1558485d@amsat.org>
Date: Fri, 14 May 2021 10:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514052435.2203156-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 14 May 2021 08:16:49 -0000

On 5/14/21 7:24 AM, Bin Meng wrote:
> riscv_excp_names[] and riscv_intr_names[] are only referenced by
> target/riscv/cpu.c locally.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  target/riscv/cpu.h | 2 --
>  target/riscv/cpu.c | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

