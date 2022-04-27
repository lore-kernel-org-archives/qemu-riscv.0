Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njVtN-0005i1-J1
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 20:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVtI-0005gR-21
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:50:48 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVtE-0007d1-HF
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:50:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so1712342pjb.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 17:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X66kS6V3BQshktmsqxbfss2kwbjLHavXJqTmKKmgIgg=;
 b=ZoaX4cS9sCFBVzmAjRWZYNVcaApUmCHqj4J3+TAklCjpRVThxZ7bchDnD/xiDBZM3e
 9zoz3V75Hj/GS4MdfOo08wwp02kh0hj7it8WgoohSqAJsxX5nj7ODAAjvigwfaxYvpcF
 ATKgAjOV292+2kDyDI7wtUSVygu9ZF6MoBnR7x44N353gWm+Mc+9r3QsjQINlAU1Dr2J
 ci5KGgIKRN6QWSZfq9ytEfHZEYo6as+RCCvPspQOmZdqxv/zD4GakSVEGwJDHYl3fL8e
 cp05/v/ZqbtX5mYe1vn+hsi3SX95wydiOpdw7G1ggxiUaskjJfIku/CoHqvaaYowdaa/
 vZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X66kS6V3BQshktmsqxbfss2kwbjLHavXJqTmKKmgIgg=;
 b=OjttgAFGBKUL96tTivq1EWfMD8VUGAeX7YlXgeuuYVQ1Prqb1AtH1rWGbb0Tb4ZaeW
 LCz4WsuLsFiULbQX52pOCQvnmqC7nr4Gf/h/rQAUBQ+MlPt4w16/f9LV77qelF00zpV6
 EWecSlFqp6YFlI/9/4VOnh+eoryqtRK2ZzHUXh0xEH7HbjkzBzHwU1R1yD3z6lHo9L07
 YqoGcF3rKvnkuzbKjLVcC1JGAwEA8E6rXlY8d/JLpr4Vf3TBEl2M54RuZdmxPEFpdKXE
 GU6sluQnD/aTGKaB/4UTdimpWvzDUfY4TXyqinbFKlWCIiHDCiHbcxtzvwJpuB+SYwAv
 NHiQ==
X-Gm-Message-State: AOAM531VNZC2doqI3GiLH7J7SuY7mqEC5xXxor6LiZcrtEGJW8GzsqyR
 jatvb+M8kRK3TOYnuWkeJpMWmg==
X-Google-Smtp-Source: ABdhPJyFJpkmgEXBLDq8u6wzYeAr2vHNmpCq6D2WElyVUTpXPV/kXaKJYNocLG3ZGnL5wEM1cZ+3hA==
X-Received: by 2002:a17:902:e94f:b0:14f:1636:c8a8 with SMTP id
 b15-20020a170902e94f00b0014f1636c8a8mr26076386pll.130.1651020643378; 
 Tue, 26 Apr 2022 17:50:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a628604000000b0050d2ff56603sm10852430pfd.60.2022.04.26.17.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:50:42 -0700 (PDT)
Message-ID: <00335dce-3ca6-b037-be91-4dc3396d6cd0@linaro.org>
Date: Tue, 26 Apr 2022 17:50:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/5] hw/intc: Move mtimer/mtimecmp to aclint
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-2-atishp@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426230855.336292-2-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Apr 2022 00:50:48 -0000

On 4/26/22 16:08, Atish Patra wrote:
> @@ -334,7 +334,6 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>           VMSTATE_UINT64(env.mfromhost, RISCVCPU),
>           VMSTATE_UINT64(env.mtohost, RISCVCPU),
> -        VMSTATE_UINT64(env.timecmp, RISCVCPU),
>   

Must bump version_id and minimum_version_id.

r~

