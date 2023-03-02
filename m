Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYM0-00076O-5v
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYLx-000764-UX
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 21:07:30 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pXYLw-0008Uc-5j
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 21:07:29 -0500
Received: by mail-pf1-x436.google.com with SMTP id z11so9201772pfh.4
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 18:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677722846;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=JUoZRZ3TOD43wg/i1PByiAZjncVXxUVdkvwy4/JtuPY=;
 b=hLtcTGfl/UyoFzvdlIwiYjOeFOSaTR2Z4phHjW0ExW1uY88GLDgj1hiuo7+oiymHVL
 2OcIA4Rx3ejdFeqAJK0vMo83I4p0Ep8gLjLxsF1yc17SALGze3wI/j60RfnMzPveQjaC
 aaW8ZGjIxOtBrKTbiTciSyyK8tUFkRLXT+g+wLawCHhFwirpfomFx52USRqi9g2hxiZ1
 9UsRPmgmTtulqiZnGOdohF0fYyypFgll2yh3RKxgOkGcEuGD2HjokmZs7hGvhMqPV0Uu
 5vw2Q1ygpHZ1afQ0PrRiQBVPX6aMVHscdNpRKcPJqA9EGvSCpud+Y+vQG8DUne9AKlNV
 g/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677722846;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUoZRZ3TOD43wg/i1PByiAZjncVXxUVdkvwy4/JtuPY=;
 b=iETxHmx5Zjm4IXUvZyrE6kt/vTHGG4ZKUhWor2w+2B8TGNuRUz2qPpf2ftQ1ftPzd3
 xKaHxHCla2gwrXZ6AEHGLMmqvxm6DFOzF8TM3bNMNbxaXqtLP94USRMsR2J99ffvG0mu
 MfirGh7X6u5ejPImwG6odbGVRhYa2PUBdcMf6tJ9pPulKsJfvjfgaPwdC5y+c2GJ59pD
 f5IAZrdc4nT8qa7sacXO1afTCmsTjjN7mM3hnCmijYwhM36TM4HrHSdXBD9AJoXLWRlX
 f11NiqJC738htMYDXVZtzJMW7j70wzXGX4t5QUtKH0AsM97pV2N2j0zA8wwbNBuSbav1
 Q1VA==
X-Gm-Message-State: AO0yUKX32xjIX+ns9MwDtMRYTbzbDBqE4e0R84nN+A+90iKwnyU0cZ5R
 wdqysDxAL80S4ZRh6V4Qoqkf+A==
X-Google-Smtp-Source: AK7set/0PhhyOQGLTmkF3bYoJZTGvvo3bW5+qt7rD46bBPxm7TpnfUBN3gywluhiDTKRl2+TrrLy6A==
X-Received: by 2002:a62:64ca:0:b0:5a8:b07b:82da with SMTP id
 y193-20020a6264ca000000b005a8b07b82damr599259pfb.4.1677722846354; 
 Wed, 01 Mar 2023 18:07:26 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 r11-20020a62e40b000000b0058d92d6e4ddsm8542502pfh.5.2023.03.01.18.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 18:07:25 -0800 (PST)
Date: Wed, 01 Mar 2023 18:07:25 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:06:30 PST (-0800)
Subject: Re: [PATCH 0/4] RISCVCPUConfig related cleanups
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 dbarboza@ventanamicro.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-c59a4d9c-9a01-44ea-b5a9-b416390b6570@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Thu, 02 Mar 2023 02:07:30 -0000

On Fri, 24 Feb 2023 09:45:16 PST (-0800), dbarboza@ventanamicro.com wrote:
> Hi,
>
> These cleanups were suggested by LIU Zhiwei during the review of the
> RISCV_FEATURE_* cleanups, currently on version 7 [1].
>
> These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
> riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.
>
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06467.html
>
> Daniel Henrique Barboza (4):
>   target/riscv/csr.c: use env_archcpu() in ctr()
>   target/riscv/csr.c: simplify mctr()
>   target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
>   target/riscv/csr.c: avoid env_archcpu() usages when reading
>     RISCVCPUConfig
>
>  target/riscv/csr.c | 90 +++++++++++++---------------------------------
>  1 file changed, 24 insertions(+), 66 deletions(-)

I just based these on that patch, which landed as d4ea711704 
("target/riscv: introduce riscv_cpu_cfg()").  That resulted in a handful 
of merge conflicts, but everything looked pretty mechanical.  So it's 
queued up.

Thanks!

