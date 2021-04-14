Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWWfC-0002I1-8C
	for mharc-qemu-riscv@gnu.org; Tue, 13 Apr 2021 23:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWWf9-0002HO-U7
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 23:57:59 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWWf8-000717-Bk
 for qemu-riscv@nongnu.org; Tue, 13 Apr 2021 23:57:59 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m11so12847315pfc.11
 for <qemu-riscv@nongnu.org>; Tue, 13 Apr 2021 20:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ugiE2Nh67QOiXWh1pCCFebSOuTzES9n+8WoJMh8COk=;
 b=gHTHl24tYnaCciCNUc2fqHG3hhL00vlF7+29gnquRA+GSJXxxGNEvcb140p3yRxaWy
 ypcXPRNsMrdO321bggWmIihJpQ7wOXa1HiUnhJB/rEUvGD2r6iBTmE62Avo/skl5BLPi
 M0MFPCwqQBsRdYuV4AcLIulXURBJzpEuF03j5dKASXxjeVV92Y7E/gvsuaQleEiyxVLx
 GT/4qbkQno4lMYZyR0/0w8OfGUzoatkr0dgKJDsmuZSg+GvO6jDVR9POJOZDhhxJ2BJS
 qFEZitf09AL8G5ddIJ4GyZ71YP3tsC2TjQO/BvoeSjOzhtdQ8u5fni/TdkiOMMSgHxVX
 GVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ugiE2Nh67QOiXWh1pCCFebSOuTzES9n+8WoJMh8COk=;
 b=cuLyWNboBWKcJhBshZh9resOBtdWZATYYB4p3R7Ra1uSpgg3dv7D+iMWML+39LHdrx
 1oN7qMJwk63ll/JWQSnHbGKY4VyVR+OlCWxbvrTMS+iu249DiUfCrjEWBn9d1ucxRw1W
 52mw3N0aSfPju06x+dh/5HaYex6XOFsAEsbx8lUsbdyVVnbB3a74HtXWf9rLI9upym1o
 zqwivjSEG+iisXBdlT0KDVcaBRTpFSIDRRdA3EnBYfsrbtAuC/TQkp4RUoB5btAw6bZ9
 vntpewU+uRdUK86/XZ28eA+FmsSPGXjqpplTddXnK7mmbUIUI7e+HZ+juyspRHvDtX0A
 28kg==
X-Gm-Message-State: AOAM530sHuGeoOGC8kDzv0+YB2CKdl7zxUqDgAO2VrLhZitqeV6ENG+B
 dYqdib3lCm84ke3eKmYNZRvNDw==
X-Google-Smtp-Source: ABdhPJzY+PDWR7oGe1YXHrsYOXxDdeI8Y0N6Uysv+XmGBzQWLvskndtrXC0/IJAeH5B0LC6rb5Rg5Q==
X-Received: by 2002:a65:4cc5:: with SMTP id n5mr35027864pgt.80.1618372676655; 
 Tue, 13 Apr 2021 20:57:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id l22sm1160520pjc.13.2021.04.13.20.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 20:57:56 -0700 (PDT)
Subject: Re: [PATCH v2 9/9] target/riscv: Consolidate RV32/64 16-bit
 instructions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <c2672cba3d0cdb9f803b28ce684fe2a41bb05aeb.1618356725.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8193dd2d-c039-8669-b639-60247b51ca19@linaro.org>
Date: Tue, 13 Apr 2021 20:57:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c2672cba3d0cdb9f803b28ce684fe2a41bb05aeb.1618356725.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 14 Apr 2021 03:58:00 -0000

On 4/13/21 4:34 PM, Alistair Francis wrote:
> This patch removes the insn16-32.decode and insn16-64.decode decode
> files and consolidates the instructions into the general RISC-V
> insn16.decode decode tree.
> 
> This means that all of the instructions are avaliable in both the 32-bit
> and 64-bit builds. This also means that we run a check to ensure we are
> running a 64-bit softmmu before we execute the 64-bit only instructions.
> This allows us to include the 32-bit instructions in the 64-bit build,
> while also ensuring that 32-bit only software can not execute the
> instructions.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

