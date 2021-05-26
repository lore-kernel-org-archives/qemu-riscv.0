Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1llj8c-0007C8-H7
	for mharc-qemu-riscv@gnu.org; Tue, 25 May 2021 22:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj8a-00077r-3C
 for qemu-riscv@nongnu.org; Tue, 25 May 2021 22:19:12 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj8Y-0007oO-0R
 for qemu-riscv@nongnu.org; Tue, 25 May 2021 22:19:11 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e22so8560015pgv.10
 for <qemu-riscv@nongnu.org>; Tue, 25 May 2021 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DPlXrCfHp8pQDQO1jfJmnZott4CioEXbswAa/pX0+o4=;
 b=d5Hr+p16DLEZy2sCrRQrzziwvZuCy3MBa+x2J6r8syyKWddyWVZs6rQB10zHapow5D
 MkqAMh3j8VGGOf+N/G/1OMp9ruGhmCYduomwjPcBGqGvJuUtn88yyntkKSbXG/U3nFke
 m9T4WoK0xIfSrcQrjhQUQcvgt1xnvI5TBgUa+/G2sFixkruIXMOVbbbLCJkr7DQEgMLx
 nSJp9bedkrrqMcBr+sd05mgANOzhsUOB4ikdNa5wL7iGIA67N4u9Qczc0365Yv2mN1hs
 szsqTOfxFkhfYIoDYVsn2Ne+e7MjLw0jTWsoIksNfzdp/+N6DwWllXXURAnqQkACQM5l
 P18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DPlXrCfHp8pQDQO1jfJmnZott4CioEXbswAa/pX0+o4=;
 b=bacgZ6u1ovnD4qC7DKtjX1z4pVTNhD2k+wK9m/MvQti9/F/Pp7/yah+CzTnodIwFi4
 zTFwGOf9sOm+G4THsaBJj0qbpUnxXS0VuDPs8xDqfcFoxZdG/zfVMFliteG8Z0lEernr
 Yam7sduLUTvIX1PloYYGA8n32gbn+UdQM5C0Iv3pCg6Zvf66e/cU1NPBlobSO4269AOZ
 6iijZKDLHcJnfHKk8GtU8tkeTY4W4UiaPpAuHhfbW066D2ij4y/oHrRcUwLZ1e+QPZD8
 ziuj1IUH8CTuqoBNH5hTcP/q/50TPOuH+w6A/qh9iQgaL03Cn39fdvUQHz60CyjBmoZQ
 EN5w==
X-Gm-Message-State: AOAM533kyQvGWiEBAT2MczCcRI7RcChEfrY3NIvjFj6rKvXsrsIEtMit
 /zvFOWlUds3uXJyDRs8NGsl7GQ==
X-Google-Smtp-Source: ABdhPJz0jNf+4EIMC+VtTHanEqDjWzELBBdXI4oYx5POg5w4No/gYbJkESnfg7HSdO1mlcS4wM3/Zg==
X-Received: by 2002:a63:f245:: with SMTP id d5mr22014163pgk.416.1621995548404; 
 Tue, 25 May 2021 19:19:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t1sm15296771pgl.40.2021.05.25.19.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:19:08 -0700 (PDT)
Subject: Re: [PATCH v7 13/23] cpu: Move AVR target vmsd field from CPUClass to
 DeviceClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c96e1c3-85d8-6d1b-8f9f-0b6a1bc5486c@linaro.org>
Date: Tue, 25 May 2021 19:19:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Wed, 26 May 2021 02:19:12 -0000

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> See rationale in previous commit. Targets should use the vmsd field
> of DeviceClass, not CPUClass. As migration is not important on the
> AVR target, break the migration compatibility and set the DeviceClass
> vmsd field. To feel safer, increment the vmstate version.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v7: Increment vmstate version (Richard)
> ---
>   target/avr/cpu.c     | 2 +-
>   target/avr/machine.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

