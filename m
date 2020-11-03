Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ka2nF-0001NA-DB
	for mharc-qemu-riscv@gnu.org; Tue, 03 Nov 2020 15:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2nC-0001M4-RC
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 15:20:36 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka2nA-0004xQ-Hd
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2020 15:20:34 -0500
Received: by mail-pf1-x444.google.com with SMTP id e7so15243566pfn.12
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2020 12:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ke3lctFHdN1c5swx2n6i37eMkPk0/YRz6LTlj2i+b78=;
 b=Kdr6jbnCHh5K6ip4ntUwUQ7yEzjp1sY8qKwqyr+1OGoBXQedqoDaIKoTk0CXMyKtDb
 pW26pnjPruv3YmgTaeWjLDVzlNijmtI5VzoOpXaqgDHA/6G4eWcgxarsb18s1KEl7ANL
 xr4kr7tWM2TgSctdVGlI47VBRK8OPdrnjTB19k9oCV+sEVz2WFKN33E7QpTlsU+MFpmQ
 OjdJf9o5Dr+8nVwB/paKbNYffgn+8bkBc1hl0YORnvzbRyAnXoiBqrg4L4I3muRvBf60
 SaMmpFOYMQ7RL8IC+FwgMEy+aLVM16/qafBXGVXh2wPlrjZAd/LfVF8qcgToPDWU3/oA
 Kfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ke3lctFHdN1c5swx2n6i37eMkPk0/YRz6LTlj2i+b78=;
 b=qiYospT1/UDPl4dF6K6HWX3lzuMi4bJYbpAyP++lFjcP0nsd4ScaDTYo2vTJGVgCDy
 /JOjeOPGgjniEEMhWF4o868R6FH94GfFN7GtpkxH8nz6M4aOH5uA2eD2uluO4P5x1JZw
 3C0lngopRH9Evc6wriQmda4dB2jm6UBXXRLavdWZyXgWGMnS54MJLDkKFFTV0ijC4CL8
 8/WvXEg2/y3EXCbLm3MCnUZD+mLS1tduLwPUJuQRhux4/jv7laumnbHKRLEC+g8zsO2N
 s5Mxame+6ovmYJhn004vmTChv2IobyrvcMPsD6dVEAQsE8OEEkqymvgYvLd0HTLb2BUN
 dAQg==
X-Gm-Message-State: AOAM530V3yvaDq3AJhURwjvpiISndf5FSQzWBLN85I9h0tGPBozRHKSH
 qXU1zOPlKrxMoz4KDiYYsLItWw==
X-Google-Smtp-Source: ABdhPJzI1JjEn95qgLD15C+eOrLEPMVWjuiZRom7/vRABcCNJQNua7tsx7TbRm+58C3r15QOPuxGFg==
X-Received: by 2002:a63:5154:: with SMTP id r20mr18862228pgl.340.1604434830117; 
 Tue, 03 Nov 2020 12:20:30 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id h184sm17735745pfe.161.2020.11.03.12.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 12:20:29 -0800 (PST)
Subject: Re: [PATCH v3 2/7] target/riscv: Add a virtualised MMU Mode
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1604432950.git.alistair.francis@wdc.com>
 <5f25069661040bb96f945358bd7fa047f5b462ce.1604432950.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29320e1d-6abf-a6bb-fc6e-43a3b17fca36@linaro.org>
Date: Tue, 3 Nov 2020 12:20:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f25069661040bb96f945358bd7fa047f5b462ce.1604432950.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 20:20:36 -0000

On 11/3/20 11:50 AM, Alistair Francis wrote:
> @@ -30,6 +30,10 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #ifdef CONFIG_USER_ONLY
>      return 0;
>  #else
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return env->priv | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +    }

Still setting this bit here, incorrectly.


r~

