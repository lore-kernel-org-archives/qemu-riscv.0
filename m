Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrOyg-0002y4-ON
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 14:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrOyf-0002xs-1M
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 14:00:25 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrOyd-0001FD-8M
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 14:00:24 -0400
Received: by mail-pf1-x42c.google.com with SMTP id h12so2275060pfe.2
 for <qemu-riscv@nongnu.org>; Thu, 10 Jun 2021 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5RH9vdKFNFu7YPjTmEk2mHnjMgzfjMPrL+cEFwR/2uQ=;
 b=vgG7evhQW4cRB26cIA68fG2Cdmwh94qK/dEokXmqZgFdPXmY3yABXSdgDTp56D366C
 ft4n5RcymLBOQ5FZHCjsp/lNDYNmyx8GRzuR5hsBJaQZGwiixko/Skab5TKXORzJjMAN
 oPBgcGx27g7B2ltWaPGXuHfx4lw8h1grQ5NADENSquDnN+ax8zSngShcjTSJV1AAj8CV
 IEy3Q64h2O2EAMSBhXGTM7NXiwXO+sKR7ubMPG0y3ASx5blKSM453FDWtX93BOKEjDN5
 /1b2NDm8dFL2vjDeHQvGv8iwWEbzaBKqIjav6Npn9MlVyLxKUKyunkX2QfuQ5Oko4eIF
 y5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5RH9vdKFNFu7YPjTmEk2mHnjMgzfjMPrL+cEFwR/2uQ=;
 b=AiY/1ayETUGEP36+NLd/99Y0QM816CvxhHlKyyGJSmBQjXDqOHx71gPvWosyrE8/rU
 M91RCiA1TTaRUHNVPX9wcT+7ijXd5QiZV9OWyKsAk/BmbWPzdsJbeYFk16ESwWp3FRt8
 S+sy8o2M/QoYMX0+H/wsIXakoT19Q1MwJUM+aA99FDnTKWrPfJV0+reVK4N7XXh7Wqfj
 pJrv/OI7Pc4JK21q9VGErW2EJbPktWp0hF0jwHUPYYzPpzF5VEWle+NrFJHnpetHNfDO
 xm4ve8GirzaGFBwuR1FrgmdzUPWwwgBM7fBcuI+p80XBXObKGczE6Wo6Gw9V5Mq+/dE5
 Urpg==
X-Gm-Message-State: AOAM531qO3kwtFCIu2WWfsoou71s0016siWKRBGakjTWC4wsrcbiK7R1
 3rkGAvTpJjlSku8pOBW3g04A5g==
X-Google-Smtp-Source: ABdhPJyCnh6fuJ3j5ev8WOPOJ8KUT1pE9Y7se6j3if5x9/46T79XbXIcEp9Jx7s7yCT73XhXxzomSA==
X-Received: by 2002:a63:4e41:: with SMTP id o1mr5966754pgl.313.1623348021260; 
 Thu, 10 Jun 2021 11:00:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m1sm2759046pfc.63.2021.06.10.11.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 11:00:20 -0700 (PDT)
Subject: Re: [PATCH v2 03/37] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
 <20210610075908.3305506-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <954a39cb-31e6-1714-a09b-74d00b7e76d0@linaro.org>
Date: Thu, 10 Jun 2021 11:00:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610075908.3305506-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 18:00:25 -0000

On 6/10/21 12:58 AM, LIU Zhiwei wrote:
> Include 5 groups: Wrap-around (dropping overflow), Signed Halving,
> Unsigned Halving, Signed Saturation, and Unsigned Saturation.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   include/tcg/tcg-op-gvec.h               |  10 +
>   target/riscv/helper.h                   |  30 ++
>   target/riscv/insn32.decode              |  32 +++
>   target/riscv/insn_trans/trans_rvp.c.inc | 117 ++++++++
>   target/riscv/meson.build                |   1 +
>   target/riscv/packed_helper.c            | 354 ++++++++++++++++++++++++
>   target/riscv/translate.c                |   1 +
>   tcg/tcg-op-gvec.c                       |  28 ++

The tcg part needs to be split out, and I'm happy to give a

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

on that.


r~

