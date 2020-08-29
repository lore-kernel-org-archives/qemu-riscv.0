Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC5gj-0005zW-DB
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 14:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5gh-0005yX-NW
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:34:51 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5gf-0004hH-67
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:34:51 -0400
Received: by mail-pg1-x535.google.com with SMTP id o13so2063511pgf.0
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 11:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bIK3pDedK2jHWb+EMwthE5gVs/t/Vc27qZvNa0RKVKo=;
 b=xnWJsKM386srnpBoLt1q32CjcIHP0FnqEGcWAbnHvvzCJ6wnXuSik+9juj6FEsGQhP
 dAaREpTEN2+TPf96JsR3h6xcjPNeHjWIRzZGtb8LFQla330wTzSYM9738OAri/mB8Vb4
 MAPDWgdjilzdhSWHFSRYG9RDakmbhwJlfyJTf8nR7Y041nI0k1OD3L6hJeqSYsc1cumL
 P1UeEpgPHGjPgT5Fdx9Xapmrzm7EHFLvXV2EVddPmbTS3XvmuLSyzuFy3nwoldfik9Gk
 LRfLzwXFSGkeuRa3Lk4KXjCEEO01Hik71VGepvdkPZVtPFRhUDeCY/Oo90tnRd4yK2Az
 AWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bIK3pDedK2jHWb+EMwthE5gVs/t/Vc27qZvNa0RKVKo=;
 b=LnvGg2gGXkmUcIMzUk7FwPCgI5hFC5UGT+Y9vIwgt+D2InrYI9f9FHoBlMU/ZrfkuA
 1zwe8qRH5MuWJh8YDEN0MOoC341uoH1O97BozFsCJ3hZEgZ1fpmGjSZj+dOJpkLA4xsp
 BI8Xhvd4Hwh+bbXCPPSzCp/ch50I4BxxY4Zk60QyD9CztW31krg68uxKXcvxsrsd8IZP
 38CAF2AOEZGS+kyDDXb2lMRbxAFLWz3PKyT3NAF4tRSmKce1XZ1ox+5bwW6/5/ja0lfU
 /k2Ex7QsRsqPpMs8cYlQCJvbbJg6AKoW0TzyHRCjgzc8JJMkQ2k3YzZnT4OTOqX9bfpt
 pIPQ==
X-Gm-Message-State: AOAM531VKhIr9lUzAKSstWorY1DLQXdpwEE2geb4hvMPaPWjQDN0/Uy7
 uvDv20XrZIJB1/09e8KeCjMt7A==
X-Google-Smtp-Source: ABdhPJxOr+jtXDX8OJnmfCmhqQATgNLnykjttwcDaVFQzOcthkprfdKhUtULiJDGwhjtrcbyRMtghw==
X-Received: by 2002:a63:50c:: with SMTP id 12mr3212665pgf.173.1598726087844;
 Sat, 29 Aug 2020 11:34:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u8sm2647609pju.5.2020.08.29.11.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 11:34:47 -0700 (PDT)
Subject: Re: [RFC v4 20/70] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-21-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd619649-3a60-5b6a-eebd-aaf54371b0a8@linaro.org>
Date: Sat, 29 Aug 2020 11:34:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-21-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 18:34:51 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Replace ETYPE from signed int to unsigned int to prevent index overflow
> issue, which would lead to wrong index address.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/vector_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

