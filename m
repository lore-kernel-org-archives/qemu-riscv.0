Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml8KN-0004Qy-JU
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 06:33:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8KL-0004O9-3v
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:33:09 -0500
Received: from [2a00:1450:4864:20::336] (port=33282
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8KJ-00066r-OB
 for qemu-riscv@nongnu.org; Thu, 11 Nov 2021 06:33:08 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso5345970wmh.0
 for <qemu-riscv@nongnu.org>; Thu, 11 Nov 2021 03:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gEKYqTcqQQuAwDikU3JMJYzr+kHIK0yPEx/1fKUDrjc=;
 b=Oh6EsrTEmcbATspSpBa+2rA6ms9G+BohiJ1+6rlvTHdS93HKftVovY3uPJQb3VmFLQ
 e4OUg+ohh5vCsOitGyeY14O3kEVTxrQHXHr3CZYLamCJtBrQUCmMqLDWmFrxfx63vn0R
 7dNlO6IJ3WQb1qqlyGZCzZLJ82SBUSnlez798Mnw+83JUy2XkJOmgaerdgKiClmanQUx
 GMJonu7/viDuXRoRzQ9MF4KSRhKhZ9m0iiNDqAhyU9flMPjl5Jhamn1vbeUPqZou/24q
 KdbSR/+5iyNZW26X3wsPrwdQ5IfkJPSBmC0P4PHdpG70jN+GVJKS0Q8xyGUQlg9+BOHo
 kapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gEKYqTcqQQuAwDikU3JMJYzr+kHIK0yPEx/1fKUDrjc=;
 b=JgzMmHwtmIuYq//GpXAZtsb11ZWCRc4KDvcSAe3rLvyvqtTM1YII5zZUAhhlRIp3Wm
 8Gtyt1N9JUgETr3o9kUqIveraMQGp2v8I0YrZ/1PuK3CqcwBVOB0qAKk4BhmH43CV9Mc
 r/l54juROpRCz4CZojxo6iwQgE4rwUwFJYS7uJ93CUghiq/FxptaoF0M8yAsA/3sVNTr
 KTJoyZEpS1GzLwhJ+ChtfRUhK0xCIsgb8rYwpJCdUHhuUbmE9Zhx6tDr8SbBzSqVoTNO
 WP+6s3o3QC6GKnZJ5Z8m/eEkrVuYrga8WsamSXAShGQ4dKpWSS9mgGcs2gs6qaE8x4ad
 A/CQ==
X-Gm-Message-State: AOAM533kHr4ioMUP6UiohYu7Ntt+8TcDxLagx9RJ6g+b4AHRYhrZGNvK
 hUZK4AgdHPmZ/jbDnViqjPU/fgLHTH/OPzwN2Ic=
X-Google-Smtp-Source: ABdhPJzisNhvZoMX0btXjkX49WNe7d632++pK2mEtNKzR/cegVZVZAp/pjEy7tbUTT5rf185KR9Ibw==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr23767173wmk.172.1636630386266; 
 Thu, 11 Nov 2021 03:33:06 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id g5sm4165736wri.45.2021.11.11.03.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:33:05 -0800 (PST)
Subject: Re: [PATCH v3 13/20] target/riscv: Fix RESERVED field length in VTYPE
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-14-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f43db00-bd51-cadc-4c57-0db699a96aa0@linaro.org>
Date: Thu, 11 Nov 2021 12:33:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-14-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 11 Nov 2021 11:33:09 -0000

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 52ce670cbe..b48c7c346c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -105,7 +105,7 @@ typedef struct CPURISCVState CPURISCVState;
>   FIELD(VTYPE, VLMUL, 0, 2)
>   FIELD(VTYPE, VSEW, 2, 3)
>   FIELD(VTYPE, VEDIV, 5, 2)
> -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
> +FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)

Or better, remove it in the next patch.


r~


