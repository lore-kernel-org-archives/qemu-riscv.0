Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1G8n-0005p2-T7
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 17:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1G8m-0005nu-E6
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:31:04 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1G8j-0004LY-IN
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:31:03 -0400
Received: by mail-pj1-x1035.google.com with SMTP id e22so5772458pjt.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 14:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=npVek7O1dJZxOapEcvfnyjIKEMfhuh3rK53u6GcV0Ps=;
 b=ojgbCtvY7H7pIZf6blHwcf/aL1ny+eZyxxqmMUaOQon1HQoUeR3l1eQdF5eTDrmLH/
 UF0R6PfViJnLa0YaF4pdKgJT1T/DKPbULV2ElQAy1ROGx4rQ0DvWTGSw2yqDU/VP2pwV
 dt9CqJ7EUZfyaPXdBD0+67KkwcAqN7eLUOzPOfwdch2UlacRT8Ajioy/IfivNbkciVKW
 1v7sQiRhKY+v11TerSLtt9APwTtIJEEKjJkDA988j9ZScfC9R1uJCSUhD3z6VK6kDn+B
 YgpQKwgURFJ88rUPeN/LEzaTkPYDSDqaigBEtHm6erybkdk6Upsx1FeMrjECStMUCHWc
 TBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=npVek7O1dJZxOapEcvfnyjIKEMfhuh3rK53u6GcV0Ps=;
 b=aVveKv0P93F77w/F0heNaYqOQywkl449lNaQzVBhE3nRi8CpCV73eetlOC0t5nLTkw
 s7tjLsMeSR+11sZ448LI4bc89r4tnMQwhmPe3fjy27Ukw9h6DyVn1vTCr++BzrVTnCoV
 PWc7r90odiIoq8CImunMu8nTjkBicwz0ucmcl/Ut9GGjUqnd509GxXql2ULp/HDGeijp
 S55BKeecR1YybHMfZtqIU6KrFtyUDDrUy8ydAX4hpuXKdrClY404u1EwdOoJbuxBzpRh
 r9di+yTSMMloxtX6/8hzZiQdjszYp2/7m7rB1fAS/JMhFbThd4X/nEUvWhyu41MOxgQu
 4kQw==
X-Gm-Message-State: AOAM532JaP1ikUv0DPRF7S45qChJYprG8++gIVFai38/oCHcvjZJXdym
 gxTS0LBnFNYE3mC6YNZi6BkGnw==
X-Google-Smtp-Source: ABdhPJy8pDk4kyrbyX4HX2SHtOdI66gCY7hNXk6ltpkwkKzSjowFKPEhLQdF1kLkg2vKODlMG6k0Fg==
X-Received: by 2002:a17:90b:4a44:: with SMTP id
 lb4mr1004244pjb.160.1596144659890; 
 Thu, 30 Jul 2020 14:30:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x136sm7038047pfc.28.2020.07.30.14.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 14:30:59 -0700 (PDT)
Subject: Re: [RFC v2 51/76] target/riscv: rvv-0.9: integer comparison
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-52-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee0c662c-d627-70c5-187d-1eb08081e700@linaro.org>
Date: Thu, 30 Jul 2020 14:30:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-52-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 30 Jul 2020 21:31:04 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Sign-extend vmselu.vi and vmsgtu.vi immediate values.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c |  4 +-
>  target/riscv/vector_helper.c            | 86 +++++++++++++------------
>  2 files changed, 48 insertions(+), 42 deletions(-)

FWIW, not what spike does, but this time at least the manual *does* say the
immediate is sign-extended.

> +    if (vta == 1) {                                              \
> +        for (; i < vlmax; i++) {                                 \
> +            vext_set_elem_mask(vd, i, 1);                        \
> +        }                                                        \
> +    }                                                            \

This is wrong, but I guess we already talked about vta...


r~

