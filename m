Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgy9H-0003b4-VB
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 19:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy9G-0003aB-Cx
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 19:52:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy9A-00005G-9z
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 19:52:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t7so13591018pgl.9
 for <qemu-riscv@nongnu.org>; Sat, 30 Oct 2021 16:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cBC5GoQn3P5Wx3veuCHVEu/e9s89NBXm/P/UmefY2Co=;
 b=ROAqsaa8VoAb39f3ETeOtwfh+3fPEA009k4gxUXlQUS/y38OL32qYzwm8G5XvEWjmb
 kp4CZrAKUOaQl8e9kJC6Fgq3xP7XjAaV2c1QnsrTcQqA/Wfeoir8bgHL6abq9PEbE8r2
 T/NGw/JT1HCJObg0gvQWoqZsnAYzkKcQjB3bXQ30GJNn7NBM/upWiN5MbgDRUeQjN188
 p+wJA3xNe9TnakTYCLkQP8TAYSrSeV81vuHbqny8YYw9Vauu0OmipMiitQFnuxvzeLt4
 2WiMInRVpZo3Gs9ZYwnLS/tnwbXsH23z4yuCJMw7qgEQGZrQWiPg08NiUPsYide09QiP
 GaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cBC5GoQn3P5Wx3veuCHVEu/e9s89NBXm/P/UmefY2Co=;
 b=A44F8GBoi+K1hWRnYwSEV1MScZBevV2RjRT/xR15kJltno53xMEAwLDviataRZLgMc
 fbNqH5NXnVWENPZATze0dAHOQFx/TGNegKOSQ3Fqq5Ika6EcMYZjNkwy5lZn3Y99LZwd
 5vDCKzAdDMVtDGePMaBUQIWUuJ4WcMa1zGvyOL+boc/S163PkaEa7gGrwbj0/90jw6nS
 lWH72esc6uDV0+zE3tQrWqx2wy9Fxg1Ir2huuZWTHkltKj+2+3H7z8ljthN363FI0y05
 w2kAIwAppwf2Wh+qu79P86PprJyqQzTR6O656U/uw4dfWyYfJaEOJiSCTmBc8ieRhMQ4
 040w==
X-Gm-Message-State: AOAM530Bhda7/Wr5I6wCksFCZsgt8jNJr0LGEp7tyrL9DQP423HrCByS
 KWoCajWEh/upQhsh/0JTDTkmAw==
X-Google-Smtp-Source: ABdhPJxtKunlsAeeKI/wpAJ51H5Loel0oWNmj25FSKx1mCke4/hLTGqv1wAzQiCsqfAv40wZgCYKVA==
X-Received: by 2002:a63:618d:: with SMTP id v135mr15002596pgb.79.1635637942826; 
 Sat, 30 Oct 2021 16:52:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nn2sm14823342pjb.34.2021.10.30.16.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:52:22 -0700 (PDT)
Subject: Re: [PATCH v4 06/17] target/riscv: setup everything so that
 riscv128-softmmu compiles
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-7-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4490be43-a321-0ca8-9718-445f42deeef5@linaro.org>
Date: Sat, 30 Oct 2021 16:52:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-7-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 30 Oct 2021 23:52:30 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> This patch is kind of a mess because several files have to be slightly
> modified to allow for a new target. In the current status, we have done
> our best to have RV64 and RV128 under the same RV64 umbrella, but there
> is still work to do to have a single executable for both.
> 
> Once this patch applied, adding risc128-sofmmu to --target-list produces
> a (no so useful yet) executable.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   configs/devices/riscv128-softmmu/default.mak | 17 +++++++++++++++
>   configs/targets/riscv128-softmmu.mak         |  5 +++++
>   include/disas/dis-asm.h                      |  1 +
>   include/hw/riscv/sifive_cpu.h                |  3 +++
>   target/riscv/cpu-param.h                     |  5 +++++
>   target/riscv/cpu.h                           |  3 +++
>   disas/riscv.c                                |  5 +++++
>   target/riscv/cpu.c                           | 22 ++++++++++++++++++--
>   target/riscv/gdbstub.c                       |  8 +++++++
>   target/riscv/insn_trans/trans_rvd.c.inc      | 12 +++++------
>   target/riscv/insn_trans/trans_rvf.c.inc      |  6 +++---
>   target/riscv/Kconfig                         |  3 +++
>   12 files changed, 79 insertions(+), 11 deletions(-)
>   create mode 100644 configs/devices/riscv128-softmmu/default.mak
>   create mode 100644 configs/targets/riscv128-softmmu.mak

Can we start with adding -cpu rv128 to the existing riscv64-softmmu executable, before we 
go so far as to add yet another executable?


r~

