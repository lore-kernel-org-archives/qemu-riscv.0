Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCrUm-0006k3-KW
	for mharc-qemu-riscv@gnu.org; Mon, 31 Aug 2020 17:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCrUk-0006f8-QH
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2020 17:37:42 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCrUh-0003h8-S2
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2020 17:37:42 -0400
Received: by mail-pg1-x544.google.com with SMTP id i10so1458570pgk.1
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2020 14:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aF1TYW9+DmXTOxP0rCa7SthEkQoCWC6+zXjV5LlvHMQ=;
 b=x9nepgtxkHBfFxTs3l5K+WI7B4/dG6sa5gTKjEPEGKA1i5vT6JzRQJaSdCrvAj2qcj
 l4AgJLy+SFSEe6+fHkBRVCvjtfGQ74mPaSBEjO6Ch6+EmgbmHf6htxPuY2j6nJalxYn5
 HTw1NQ6UG+mo4m0s7Z3oUNl6YTjT2/nS3VdjRu1iYp0Aiqmq6J+YstIkF0HbaZTkoIst
 WJiO3EuBHTYr4TFqufi+VQ1i6tKkPobaZKkzV+v+JsjyoV45ByZGhAKD8j0kOrW+rHZN
 TJz99ZJ9Bb/z1O8MMzb+2SrIRiUduIdIQIvB1EcEhMN0vEFe0ZLFyxYMi+GjW10eBvjV
 4F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aF1TYW9+DmXTOxP0rCa7SthEkQoCWC6+zXjV5LlvHMQ=;
 b=Px4zXKKFX4h+DXPFrr6Uh4+vPm3mFlVuO8ct4KPc6mYUs/+Pe94h2t9ZbWKVhobi4h
 0eZXdOloWe7UXgnzXGqQ4oGE8lWduQqpaWlXfr1qqPdSwtHfQ7Kjh03952PlJ14lNsXF
 aN/xszGK5OY+Si8lbBM315kMgqp7ReLKRH2Jo2PRBXL4WoGIInoAGBH31UZQb+3p1/A7
 IVud04rpuMWR1LdPmPTRHBzmvefayNHOSh5pRrJPZIUfRUNsdjXuT1M3abj9BYLopal2
 cwv667Suyy1F7o6Drp0S0PWrHzsYsJCtqyKeH6/z0bWrI/mkIDK3mMC6ROJPKJlNoNYW
 ZuKw==
X-Gm-Message-State: AOAM532105D5+4yxV5sfLy3x2oxA58HRAtM70awawZ7FZKIqHdvAQhZs
 vjlWE6DG87NjR/2TRS+i2A1/bA==
X-Google-Smtp-Source: ABdhPJzY9pX9FAI2tHfXc+NCEv0qzRv6gNhJkv6mav6Bw3GJSowl8ysxOYGftSt9JXFwE7ENfBsMbg==
X-Received: by 2002:aa7:9556:: with SMTP id w22mr2885120pfq.245.1598909858396; 
 Mon, 31 Aug 2020 14:37:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id c1sm7936988pfi.136.2020.08.31.14.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 14:37:37 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] target: Push BQL on ->do_interrupt down into
 per-arch implementation
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, pbonzini@redhat.com,
 Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 peter.puhov@linaro.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-5-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <047fe2b3-c51b-1840-8b93-f747684abea0@linaro.org>
Date: Mon, 31 Aug 2020 14:37:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-5-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 31 Aug 2020 21:37:43 -0000

On 8/19/20 11:28 AM, Robert Foley wrote:
> avr is another exception.  avr, arm and cris all had a similar
> case where their *_cpu_exec_interrupt was calling to
> the CPUClass ->do_interrupt.  This causes an issue when we push
> the lock down since ->do_interrupt will try to acquire the BQL, but
> the calling context already has it.

Alpha is in this lest as well, correct?

> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 4c6753df34..be29bdd530 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -276,7 +276,7 @@ struct AlphaCPU {
>  extern const VMStateDescription vmstate_alpha_cpu;
>  #endif
>  
> -void alpha_cpu_do_interrupt_locked(CPUState *cpu);
> +void alpha_cpu_do_interrupt(CPUState *cpu);
>  bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
>  hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index ff9a2a7765..e497dd269e 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -295,7 +295,7 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
>  }
>  #endif /* USER_ONLY */
>  
> -void alpha_cpu_do_interrupt_locked(CPUState *cs)
> +static void alpha_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      AlphaCPU *cpu = ALPHA_CPU(cs);
>      CPUAlphaState *env = &cpu->env;
> @@ -407,6 +407,13 @@ void alpha_cpu_do_interrupt_locked(CPUState *cs)
>  #endif /* !USER_ONLY */
>  }
>  
> +void alpha_cpu_do_interrupt(CPUState *cs)
> +{
> +    qemu_mutex_lock_iothread();
> +    alpha_cpu_do_interrupt_locked(cs);
> +    qemu_mutex_unlock_iothread();
> +}
> +
>  bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      AlphaCPU *cpu = ALPHA_CPU(cs);

This rename should have been done in patch 1, as with all others.
Moreover, this leaves a bug in alpha_cpu_exec_interrupt in that it should be
calling alpha_cpu_do_interrupt_locked.

That seems to be the only instance of this mistake.


r~

