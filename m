Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgrDF-0008Kh-EM
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 14:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrDC-0008Gb-3P
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:04:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgrD8-00062Y-U5
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:04:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso8580594pjz.5
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679940289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DogCOJnc75WN/a/bLCyMEkOBJKwKB3Bk9qFPriLokwI=;
 b=PDXtAX8JTwW3xySTtCbid6DqpnVzH+PQwZ+2H3ibRUL8Okffykt2UPmOUfBSW9AkRN
 KRWAOdbcOcDcLySmwyI54mINT9WjDAigD8l1jvRhx9OorDqxA75zBx4GGCehOzJ5aiZ5
 GquM5BhGW0Yb+n7f4gHuCLzNBIaU+4UwEpeweO6FutDpzxij+99Mjxmsj6FgO6leHbnT
 QUI5vj0ibrK1syEJvAOSm3zJkUUh+in3vbntl9GxJKnu2d6Gx8yJyiitwEF4DpklHuky
 f9qzMMIe5daSMS5vtopwb60JOv6/WIbUE3+nTcn+MDnqOjK0IISHtPurJk451lHR/2fC
 WtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679940289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DogCOJnc75WN/a/bLCyMEkOBJKwKB3Bk9qFPriLokwI=;
 b=3/ktvBn4YoGSthBCDXOLQdhzsoDPWpWKBIi0mqecIAGy82PMlfyVXJLiTqH0qDNheD
 ZqHaGT45PfhB6k/gof8GDvq4P+xl8VWMLvqMiAoLzxrK1rTZ08gxL3q/OfeR6+eTEAnE
 A943bDSM3FYHSlGaatuWGmCc95AJjb8ch1dNvH3glufEpFIWBrmZBK5LG3RvUZNbHcLh
 xWGqMt8LeO7/tR8MyjVCUKSpIN7MlnYHXOjGJXQIiSKAEA09SYUC5V1/NPwhDAy0a28p
 YqjDcrVH5GmfUEgCPEMUAot34Xn0lOJryOvONeqwMZWK9/KJOJUdUzdZUHbDaYrW/Lm0
 9QVQ==
X-Gm-Message-State: AAQBX9cEFD5UNpuOPak1eCP9iS1z4aipnfcM/1AbcWRUYMijAnbjfW7w
 0C3JTYZ7TL6hEHCeqz/C6B+zCg==
X-Google-Smtp-Source: AKy350amYlvYvzxSJNrpaD/5TzG+kGfU76l7kUgJooE+j0czMg4aiODHjD7IVAovFziRRq/u6iZHFA==
X-Received: by 2002:a17:90b:3eca:b0:237:5a3c:e86c with SMTP id
 rm10-20020a17090b3eca00b002375a3ce86cmr13925990pjb.24.1679940289218; 
 Mon, 27 Mar 2023 11:04:49 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a17090a8b0100b002348d711ebbsm7809217pjn.16.2023.03.27.11.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 11:04:48 -0700 (PDT)
Message-ID: <8fed2551-a67d-cd53-f5a1-f089f980aa08@linaro.org>
Date: Mon, 27 Mar 2023 11:04:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327100027.61160-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 18:04:55 -0000

On 3/27/23 03:00, Weiwei Li wrote:
> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                     __func__, address, access_type, mmu_idx);
>   
> +    if (access_type == MMU_INST_FETCH) {
> +        address = adjust_pc_address(env, address);
> +    }

Why do you want to do this so late, as opposed to earlier in cpu_get_tb_cpu_state?


r~

