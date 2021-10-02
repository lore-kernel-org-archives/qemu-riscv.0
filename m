Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mWfyp-0006zz-Sn
	for mharc-qemu-riscv@gnu.org; Sat, 02 Oct 2021 10:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfyo-0006v5-I0; Sat, 02 Oct 2021 10:27:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:47048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfym-0003nD-V0; Sat, 02 Oct 2021 10:27:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k7so20272959wrd.13;
 Sat, 02 Oct 2021 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9FDaGmf5lwOd3PkppCYDsEj008+JpgZhehcnbsK5y0=;
 b=nDHtbm8qO+mXZ10RxATwP5WLWeCYvWZgpe5kLMVU4uPBk6BtBVt042ZFVm4S8LiI6p
 BuVx9YLLWiMAOywYCysCcy1n5QdchmpAW0JZgB/8cqeu+VcjPCghpL46P7hobSZZuBuW
 HEnN7oMTMR0kuCKRzAZw3iJ1avn+C1Z+JjaQemtpmIwKI9h5Em9SOceqK/SSTiwHNILW
 6udOkltGgfU3CZn6KqmMW5oo1Quz02zo3XApQAYkOT7D+Shwb+919L7cBRyHtIhRI/dI
 3cxDJVVHCUl9BC1CW+fZtQZyDgQdvzZUqCXUpeSznkw//QyDK64K8jP0WGIp4bBmqlDT
 unjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T9FDaGmf5lwOd3PkppCYDsEj008+JpgZhehcnbsK5y0=;
 b=mlfVOKpr21j3Jjex5Kiq1x6YxAy5rdFzQ8cX86mbku2WOiZnioZMl5cwCfAUETo6Ty
 ZIA6kaj01INPrQZvsyMY0lY7Mb1yMZueBjGXVLtzynbPyk0dCGMlf+zkL3CKRGyfOaRb
 RcTBIm5UCbs1L6t6wlqJs4CSlD+NtYZEO0V7HWNky29M1Zk9EEQeE0Tpg/Y0vLPOyRGf
 2oYqPGOeGjnvj+ITYs+7g7zJ5awta9n/LX/2GS+oZDg/IsABdJyT4q73g1sgf2ZehFX4
 GU9FVbgLWCJHblcBUUQfwpjx1LLZq2Fr7enGQNPg7pf59pvhDxTb+EgQ7NdrvJOwr5HC
 X49Q==
X-Gm-Message-State: AOAM533fiAf+uKPN0pAi36sG8jPxPuprdKudz6I+o6qnTp5e4vjtUTbG
 elfIP/36pzXLJ1QYFcj/+C4=
X-Google-Smtp-Source: ABdhPJzpL3jphxqW4chuDpqetDtzMgVsa8zcPd0fuyqOahokSfz9lEAMD+an5RIWhFdEoB1bUEO8Rg==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr3760994wrt.8.1633184827176;
 Sat, 02 Oct 2021 07:27:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x10sm7448648wmk.42.2021.10.02.07.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:27:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <ce93c813-523b-1d69-b1ba-7177c3fc7b09@amsat.org>
Date: Sat, 2 Oct 2021 16:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 35/41] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
X-List-Received-Date: Sat, 02 Oct 2021 14:27:11 -0000

On 10/1/21 19:11, Richard Henderson wrote:
> The fallback code in raise_sigsegv is sufficient for riscv.
> Remove the code from cpu_loop that raised SIGSEGV.
> 
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/riscv/cpu_loop.c |  7 -------
>  target/riscv/cpu.c          |  2 +-
>  target/riscv/cpu_helper.c   | 21 +--------------------
>  3 files changed, 2 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

