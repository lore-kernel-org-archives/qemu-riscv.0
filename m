Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYkB-0000jH-Qx
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYk9-0000if-Rl
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 21:32:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYk5-00048P-S7
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 21:32:29 -0500
Received: by mail-pl1-x635.google.com with SMTP id u5so12705164plq.7
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 18:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677724342;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=VvBeEuJiBzpec98IW6FzfORo+NUzGPoTnGPVZ1D/SBU=;
 b=Q8Z3zvRnSaXiffCTbdrYH1gNgSJZKqGp01JBQosSBLJCI99Y00vs1JaAoXiqKtBAtK
 La7/ZmQazb3j3Pm5RlzqUwqgJnYBMcDmMR6T9vnVW4lu7wJRsru8LgYDDPc8iuRldhkP
 yyCgtzvQR5S2B2fzt3s84d6o9rSnMa3hRVf19vccvQZJQRmWcqlxoX1t+PFsaar0f0ex
 CVcxE4NbrhnEfJ/ZJFuVdWS4x9Lxlexl/GAy8NS+cgTE3GjvgjkAuTuLQPP7iJKQ7SbC
 3hKElavu5Z0wlV1rxmuJBc5Ns1OppWF/Hza5OXPYq7d/zA6NvYfN2Gqq+ExhbGQD+JEl
 KSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677724342;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvBeEuJiBzpec98IW6FzfORo+NUzGPoTnGPVZ1D/SBU=;
 b=wT7ZbRSJPEC5N9ZvltA+Cq2Ezbx1hBiGOMy/ihXs6BFFbVSvEtFMJYIgFvR9NhhGcY
 8ZZSSFEQhMwQGhDDf5uAdvdmpCLCziPahEFwttKZmoHq9LM+PlSYsP5bjLfQ26dn74ql
 c1oNVSBKWqH2fn5Ns9bWrQvEgBvGH8x0uTL/BWqsYdpugUDa0wBqm5KHmCEoNQqkj+96
 hwLA9tiQ80+SCJ6Sq4CoRhXRHrmyRsotaAW+15Uz1ZcnTE32AFZ+2Zc3MZdnvPdZCth9
 XEDFrEwI3goGzSK8gQd6+l8UWA1GAUbfjHg3p7+SE12S0knWkHJ1H176YNU2M7x0BF7J
 C4iQ==
X-Gm-Message-State: AO0yUKWYK2c5Rx6xJFw4t2kLMjIInWR0LAO5UFI+5tZRx0dZu6vX6Jnu
 gd+G4/9fsormxMrOOnP7qXi0Ww==
X-Google-Smtp-Source: AK7set/L6LFYY+e36VB8MLXKtwlzAb+a161izb03EBkjFbY/qmzqCU4SflwayvbDsp4i59zMNzuHlQ==
X-Received: by 2002:a17:902:720b:b0:19e:2495:20e0 with SMTP id
 ba11-20020a170902720b00b0019e249520e0mr551789plb.21.1677724341763; 
 Wed, 01 Mar 2023 18:32:21 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170902900b00b0019a9637b2d3sm9071903plp.279.2023.03.01.18.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 18:32:20 -0800 (PST)
Date: Wed, 01 Mar 2023 18:32:20 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:15:39 PST (-0800)
Subject: Re: [PATCH 0/2] target/riscv: some vector_helper.c cleanups
In-Reply-To: <20230226170514.588071-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-6a39a5ff-a51e-433f-9f4e-8ee606510d18@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Mar 2023 02:32:30 -0000

On Sun, 26 Feb 2023 09:05:12 PST (-0800), dbarboza@ventanamicro.com wrote:
> Based-on: 20230222185205.355361-2-dbarboza@ventanamicro.com
> ("[PATCH v7 01/10] target/riscv: introduce riscv_cpu_cfg()")
>
> Hi,
>
> This is a re-send of patch 1, which is already reviewed, with a
> follow-up that uses riscv_cpu_cfg() in the remaining of the file. This
> was suggested by Weiwei Li in the "[PATCH 0/4] RISCVCPUConfig related
> cleanups" review. Patch 1 makes the work of patch 2 easier since it
> eliminated some uses of env_archcpu() we want to avoid.
>
> Both patches depends on patch "[PATCH v7 01/10] target/riscv: introduce
> riscv_cpu_cfg()" that can be found here:
>
> https://patchew.org/QEMU/20230222185205.355361-1-dbarboza@ventanamicro.com/20230222185205.355361-2-dbarboza@ventanamicro.com/
>
>
> Daniel Henrique Barboza (2):
>   target/riscv/vector_helper.c: create vext_set_tail_elems_1s()
>   target/riscv/vector_helper.c: avoid env_archcpu() when reading
>     RISCVCPUConfig
>
>  target/riscv/vector_helper.c | 104 +++++++++++++----------------------
>  1 file changed, 39 insertions(+), 65 deletions(-)

Thanks, these are queued up.  If we're already broken on 
non-power-of-two then that ROUND_UP() suggestion might be worth looking 
at, as I doubt we'd want to support them even if the ISA allows for it.

