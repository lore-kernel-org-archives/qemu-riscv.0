Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hih3S-0004kS-Oq
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 11:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38473)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hih3N-0004iM-Sq
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 11:20:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hih3I-0004ib-G0
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 11:20:10 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38362)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hih37-0004Xe-4C
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 11:19:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id s15so2844716wmj.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5+tYeKH61CC+8q23OH16Fn4Bg+yjGZyh+46gD2kLkzY=;
 b=CnHEiK2jEnV5gAWNFgYCFslgUoMj1uQ8lFv9AQzIRVneWmm3SvyjndGA9e/lkNQYLL
 mmtxKnWNvsGpJ0W2zVYNl28psqmMO8p4v7mJGKrHjr8B888QR3H2pFpVObcNWb9O4pDD
 UlaIO/fA3U0Fj46DQvgoFJHFwq77xoX6pTXpN+ojSWFWS/JvVptIqcCs9FFY2q12YUxe
 nnBWa6YOxNvMl/Ghq0+bJliIYhLv2DsEYYMMvIPZNJ0x5LN2/q45+4oPWJ6o2ceidzrW
 ABoxB1Nq7FjsB7mqmlkMDVVvUTcQ+FdrSh5HdfO7896j0NEKnN9UQG1u8X04fVbq39YU
 yrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5+tYeKH61CC+8q23OH16Fn4Bg+yjGZyh+46gD2kLkzY=;
 b=S2/UETyd2Ev5hbEMeymqGkn0nAWxdg96up9023kFlECuxeYiDXiLQ38SJ3w87gFMW5
 jSWa5VxkvLerZo1MJjL+uIrooZUpPGYtXDEH2pIbtiIkfAD+VfMB1VU5iUh3ISj/Ykmx
 6pG6uuJTy1J/eso0XW7iAtJrfD0l3TBSvtOqZWAfAoPE2qJc3AHTzhNqrfI977rsAyU0
 OMGxBthjDSWU7rfi0MWsEvHZnOi8EsHWmPfcpZLym5M4569xXA7r5yIjQYbt8NUSg4gk
 GYAKYpMj0lq56N8ovPota2+IIFQPWjXQQn+kWD+BLFLgZx60p5k56rBCNQM21CvHWv7u
 wK+Q==
X-Gm-Message-State: APjAAAVQ82jZm5ruzhVPqT9geGBAYn54my4DwnhY6xAj38GPULHdtVNO
 Bn2T9nnriJ+KrP/iGBECtJWD+/ocvqsl9Q==
X-Google-Smtp-Source: APXvYqx3xfl9tAv9gKQDG5ywStgZVcJnAwME0Xq7PpsQ7n6tec8/BwF5pHUyko2Y7oc+cFU3bLmyog==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr8368712wmb.152.1562167189584; 
 Wed, 03 Jul 2019 08:19:49 -0700 (PDT)
Received: from [192.168.3.43] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id h19sm6758009wrb.81.2019.07.03.08.19.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 08:19:49 -0700 (PDT)
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
References: <20190703142617.21073-1-georg.kotheimer@kernkonzept.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <345cc679-deac-ce52-664b-0ac5883671ca@linaro.org>
Date: Wed, 3 Jul 2019 17:19:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703142617.21073-1-georg.kotheimer@kernkonzept.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: Select FPU gdb xml
 file based on the supported extensions
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
X-List-Received-Date: Wed, 03 Jul 2019 15:20:17 -0000

On 7/3/19 4:26 PM, Georg Kotheimer wrote:
> The size of the FPU registers depends solely on the floating point
> extensions supported by the target architecture.
> However, in the previous implementation the floating point register
> size was derived from whether the target architecture is 32-bit or
> 64-bit.
> 
...
> -#if defined(TARGET_RISCV32)
> -    if (env->misa & RVF) {
> +
> +    if (env->misa & RVD) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> -                                 36, "riscv-32bit-fpu.xml", 0);
> +                                 36, "riscv-fpu-d.xml", 0);
> +    } else if (env->misa & RVF) {
> +        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> +                                 36, "riscv-fpu-f.xml", 0);
>      }

While this appears reasonable, I wonder if RVF w/o RVD actually works?

Examining the two get/set functions, they always transfer 64 bits for the fpu
registers.

In addition, there's a suspicious use of sizeof(target_ulong) when transferring
the fpu related csr registers, which definitely shouldn't work with the shared
files above.  If the xml file is correct, this should always be uint32_t.


r~

