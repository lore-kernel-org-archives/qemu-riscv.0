Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nQ9GE-00060q-1p
	for mharc-qemu-riscv@gnu.org; Fri, 04 Mar 2022 09:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GC-0005to-6l; Fri, 04 Mar 2022 09:50:24 -0500
Received: from [2a00:1450:4864:20::329] (port=55850
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9G9-00037J-1d; Fri, 04 Mar 2022 09:50:23 -0500
Received: by mail-wm1-x329.google.com with SMTP id i66so5146288wma.5;
 Fri, 04 Mar 2022 06:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TVXD4dj9GpshhDxg4kkvPv9EmNEBNrYlzIRgUSLQXPo=;
 b=UpweMWdq1NPaEB/0/nhZJva7aoFXk1mRcOmRUGzv6+8kjfYDNb/aY+cSFBtlJqLCB+
 7Cc8tU1ffxAxaErQK1yUTojsueJOsdvttQ+n0naG84fbZ1I6CUJkd8hZUoQOJ0HV+A8u
 AtvAGKQV0Pfpdq7yI0oCyHCBA6Ih/fy0Wd9hynTSOrZ8DxSWJgr9ozBfORj0s2iYO/Hf
 1GMV6qPdcmchmtfCPMcZ0aaUG4YY/KMTWOVeY2J4RX0J9/fXOSzS6PTSrlxmL5HTDnXp
 zXqc7m1n6PGGBHlJJY1CE90BsF4R77xPCtk/ES8S+pXh0Sdi6JCHi7islMV5cmu+IRPM
 i6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TVXD4dj9GpshhDxg4kkvPv9EmNEBNrYlzIRgUSLQXPo=;
 b=mQcxOZugaXgnCXNDUIvYWbWL+tNvee0VfWfbLkMgilsFNO3raj96ZhBGQSK9A0y9Ud
 N+96+su+/VicYil+9OrmDe5gDKbd4EaTvO9MSgiuKFXTkiZlfB9xzf85U/9MZb88hnBB
 2a5f21i+ljRVx2y7bPPnbT+2Y9E37evUA/d1ueXFZ+9P1/ukOdhr3O3DxYDJWdRm8XIf
 LWeefrppB22PL0i7UclDH/apS7s/sR8YQBqiun4iOVZPFpJze/f3dWbXjEuBriyzuzP2
 6AdULN8pkXnOg+2SwjDBuOIgeAGZq44+MsqI2vbWV4dGO++w3ZkUVC4N6Bu3FWY+A80+
 XlGQ==
X-Gm-Message-State: AOAM532WoANFwruk7Yc6xPfE16qp71QE4v540WMHl4JS3kyP7r+gKMoo
 xEg1DNL3Zu3pPK/XjOYJiCg=
X-Google-Smtp-Source: ABdhPJxrtmgr6cjH+H4S0gSf6RMS8sz9uT1qDTLctB21i4LtAKuGe5IaX3QTUuGCCWlaoc905zdHNA==
X-Received: by 2002:a05:600c:3d99:b0:381:546c:8195 with SMTP id
 bi25-20020a05600c3d9900b00381546c8195mr8056940wmb.112.1646405419188; 
 Fri, 04 Mar 2022 06:50:19 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b0038181486018sm6040353wmq.40.2022.03.04.06.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:18 -0800 (PST)
Message-ID: <5eadd17a-9fb4-4a0a-2608-c2ca08b18645@gmail.com>
Date: Fri, 4 Mar 2022 13:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 14/14] hw: set user_creatable on opentitan/sifive_e
 devices
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "open list:OpenTitan" <qemu-riscv@nongnu.org>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-15-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-15-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 04 Mar 2022 14:50:24 -0000

On 23/2/22 10:07, Damien Hedde wrote:
> The devices are:
> + ibex-timer
> + ibex-uart
> + riscv.aclint.swi
> + riscv.aclint.mtimer
> + riscv.hart_array
> + riscv.sifive.e.prci
> + riscv.sifive.plic
> + riscv.sifive.uart
> + sifive_soc.gpio
> + unimplemented-device
> 
> These devices are clean regarding error handling in realize.
> 
> They are all sysbus devices, so setting user-creatable will only
> enable cold-plugging them on machine having explicitely allowed them
> (only _none_ machine does that).
> 
> Note that this commit include the ricv_array which embeds cpus. There

Typo "includes" I guess.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> are some deep internal constraints about them: you cannot create more
> cpus than the machine's maxcpus. TCG accelerator's code will for example
> assert if a user try to create too many cpus.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> I can also split this patch if you think it's better.
> But it is mostly a one-line fix per file.
> 
> This patch requires first some cleanups in order to fix error errors
> and some more memory leaks that could happend in legit user-related
> life cycles: a miss-configuration should not be a fatal error anymore.
> https://lore.kernel.org/qemu-devel/20220218164646.132112-1-damien.hedde@greensocs.com
> ---
>   hw/char/ibex_uart.c     | 1 +
>   hw/char/sifive_uart.c   | 1 +
>   hw/gpio/sifive_gpio.c   | 1 +
>   hw/intc/riscv_aclint.c  | 2 ++
>   hw/intc/sifive_plic.c   | 1 +
>   hw/misc/sifive_e_prci.c | 8 ++++++++
>   hw/misc/unimp.c         | 1 +
>   hw/riscv/riscv_hart.c   | 1 +
>   hw/timer/ibex_timer.c   | 1 +
>   9 files changed, 17 insertions(+)

