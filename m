Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8JB-0001Cu-4B
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8J9-00015X-3D
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:31:55 -0500
Received: from [2a00:1450:4864:20::335] (port=55141
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8J6-0005z8-Eg
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:31:54 -0500
Received: by mail-wm1-x335.google.com with SMTP id i12so3936052wmq.4
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rjVeR35W+LKbCRb8mOxb8zTeQaratxFe3eeW3XBNWQ8=;
 b=NV/bCURbrDqk/Gw8TqPAY4Kk2OjBwC6P4+vmj2kr8dbwKMgGr0c6f4QquRJTjDp/JE
 m2Q9CNmcLq+ApUfW72Uoc+TP65D2/mlYmbqoV3iwapNAegvd33FSxWIb9OZmf/Bk4tj4
 Y+cIXmDHPecAvufM2RqNwCF5yz99ju1p/PO0bVvWE3nUI28ytdu0/IlEcyi/Y+9KeYZZ
 odzk6gnV0IjBIkhO2cNCE2IRgRd/A9ov7QMpyCPsuAfgqde5inzciqNjBd5y224xluuA
 8N02wglE9zzkC8iDrCrksiYHzYmLtrxEx5gY/ZZhDQysYAimsV/JOcpTQ0bghygh6kgJ
 A6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rjVeR35W+LKbCRb8mOxb8zTeQaratxFe3eeW3XBNWQ8=;
 b=SBTuo2FD3w0LX+ScrCZrJRqHL0CG5U1YHKvM7j7oyy3iMZRCcf+ZwBFsKWA/lcjbxN
 4erDmgZX0KAxzy36GJ23JKdBSYeJDYLZ1TEP6+xYuNtCD1KdyRZsM/z3oBZFRgq0L/xY
 6a0MYMzCIbBfD2Gbv+eTr9Rr4C0mHBL0Rl4m+EPDrHJsRa6JRN82cgqWGjCLI+CS+dns
 McV7o/qFSTVuE2kZIx+1CR9eQJjEYgVocZhZ/jjKimteb2HO6ryVt7tVH3BOeub3+Kil
 3kiND6/cy7A1QsjYmkZrNuTEYE2uTwmVD83brbNMBzPRn/mmElTg8hviD/DhQwJr7tE0
 Layg==
X-Gm-Message-State: AOAM533O+pdSZPWgedBtJafCBDYU34rxT+Cuh7ggSS8INmg0PGgohmOj
 duIFJAx6tdXPl2cJHvwxqtWzSA==
X-Google-Smtp-Source: ABdhPJzGeZ+33T4neZHoTYCHoKARAP/kyy/xe1PKMCDtPARUNom1Xu30VwH1/WLHZPoyYyx4Mr6c0w==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr26074928wmj.10.1636630309898; 
 Thu, 11 Nov 2021 03:31:49 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id a4sm2473929wmb.39.2021.11.11.03.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:31:49 -0800 (PST)
Subject: Re: [PATCH v3 12/20] target/riscv: Split out the vill from vtype
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-13-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61e94a5b-91d5-712e-b185-a3f823c5a30b@linaro.org>
Date: Thu, 11 Nov 2021 12:31:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-13-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
X-List-Received-Date: Thu, 11 Nov 2021 11:31:55 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> We need not specially process vtype when XLEN changes.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h           |  1 +
>   target/riscv/cpu_helper.c    |  3 +--
>   target/riscv/csr.c           | 13 ++++++++++++-
>   target/riscv/machine.c       |  1 +
>   target/riscv/vector_helper.c |  3 ++-
>   5 files changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -104,6 +104,7 @@ static const VMStateDescription vmstate_vector = {
>              VMSTATE_UINTTL(env.vl, RISCVCPU),
>              VMSTATE_UINTTL(env.vstart, RISCVCPU),
>              VMSTATE_UINTTL(env.vtype, RISCVCPU),
> +            VMSTATE_BOOL(env.vill, RISCVCPU),
>              VMSTATE_END_OF_LIST()

Need to bump version.


r~

