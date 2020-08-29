Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7SK-00062c-Pq
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7SK-00062W-1e
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:28:08 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7SI-0000LA-GP
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:28:07 -0400
Received: by mail-pf1-x432.google.com with SMTP id b124so736008pfg.13
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gaN0h9cn4Hr/qtQs/MhN8dIp6Di8flWzfqAgpeOb3PU=;
 b=y5S8C3oMGdg7t17uTjP+8pMZmwz3nLqMUF/c8jTZEbRQpAVMHgdY9mny35qVli0bym
 bytAQRf4d2fnrK8TWB2h5PrPlf/mXT0scVvEGX4IFC7GVHGtTBg6Zsvi8F7NLd6/euj4
 h6oNFkwXRskEO8k1aZgvzdez8g5NJNNp+opXFkVvKOD+s/flLWT3tQDXniWJOfOx3fod
 kzNRp4dblytpIMsF7EoU/iylf8fEpijepgUX3ukPGAcALLT07hflbV849MfRT8Pox6Wa
 ijzvmAxRxWQSr74x+NAWdFAxyhtzqFIfKLn1Ro4HXkUStkL9U0ARPi8EpPG0uom3GVrm
 Oqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gaN0h9cn4Hr/qtQs/MhN8dIp6Di8flWzfqAgpeOb3PU=;
 b=ALVVEQBnLzc3ZAPl91Y+v0F06jYvL7CQnmZVQO1YPKT1HOd1LSWUtn2qO7HH/jCZzT
 CwdikDFYqye15iBhorL5zgmSTR2sYMqxAve7QtugsDheVItcol9frCOv6HZcZoIMF1+/
 Ucbtm3bfmvpFwduuThXcwzCEBoL5wW+/KuVnFo0PMy/SHquwNDY4ZnfgqCbYMpUsW0Do
 dr7X9K9yjUpdKDaHL/G0WmdmQdVs5cTyQcfkuByrU/2Gp9lWvYAxjAav3eamw+CWG7dz
 DxDBAqoxjwASFJlJ9GpUg2XJ1dQN9akArNGoazepzcUDYbVvPnoFGubl2RiUaUQoxOVD
 PQ3A==
X-Gm-Message-State: AOAM532SLEe2dUW5OJ8Tr01WSvLFlTvev1t465RPDtXVUy3THl5+I19E
 bQyAOAmGmOYPfEStlh219nlYow==
X-Google-Smtp-Source: ABdhPJyrqcYnoVNg0ivWqgBej+gDLjTGYDZHP1OcFrr9D44mX+Ffc4cynFaiVjdfZstzkG+3w3EtZg==
X-Received: by 2002:a63:cb0e:: with SMTP id p14mr3367418pgg.351.1598732885182; 
 Sat, 29 Aug 2020 13:28:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w16sm2975930pjd.50.2020.08.29.13.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:28:04 -0700 (PDT)
Subject: Re: [RFC v4 52/70] target/riscv: rvv-1.0: slide instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-53-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <334b2eb0-8a24-2971-549a-0e298e5f0404@linaro.org>
Date: Sat, 29 Aug 2020 13:28:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-53-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:28:08 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> * Remove clear function from helper functions as the tail elements
>   are unchanged in RVV 1.0.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/vector_helper.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

