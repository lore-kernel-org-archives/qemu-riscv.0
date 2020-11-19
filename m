Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfpv5-00051M-Md
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 14:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpv4-000504-GP
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:48:38 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpv1-0007vB-LO
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:48:38 -0500
Received: by mail-pg1-x529.google.com with SMTP id q34so5158837pgb.11
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ozcEOC1vYyR+6p6ytPPVJ515i3v1poVJa1Vs5noNEv8=;
 b=uZoi2vUGTd+PWsRfjCcVQ5M3lEtiCmvEf0m3IlKs94mROXYOi3/eOjaemoY8FLae4Y
 eEHgwFjrYWn6HQ6twJX+PYnwNzT7QdeUIXmqpZaQc4qSTBybJ/HvG3llfck2JMgNZS4n
 gNdXWDWMoSIRyF/F/9T5XssTZOIduuxqsE6gDVR2dj0iX1vxYvtVaSDgfrtT9SUhMvY+
 lVnjy2hrdCXjUsvvquQk9kUEM+GqRle4C85esryn6NVdXZG1z+SyHK7zwey8aKMNMlVC
 rjhdL6T36IH+q6scvaWrIf+KYGBTQg8aQiXAlJZPIkHmVz1F5XNwGp282zvNp/qUPOtC
 vnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozcEOC1vYyR+6p6ytPPVJ515i3v1poVJa1Vs5noNEv8=;
 b=rz9AymI/YMJ7U9imEk80HBCpcD02U2+OtmisD4CgQW1c8IvdwDxZ5kuE+yGL9YOKsE
 902jUg89NbBrtIonx1EaXvq1iR0WxL3GKi7ove4mRNp2/pLUr38XUyX2K6/KNyTPUb0E
 UAFs/W23ARMPXUTLwQAzIa/NNypRvkwum+zjRXmSM0yWytd9qeh9iK8GfjjL0eaTL/eB
 H0hRcW00OeNEl1sHwvnbRN3YNbjYVY9fTRW62UTOtKCqhY7fZtuIC0CWQc6UngeMSEzl
 vY8+0Xc74kP/skgECjSJ7y0CXLURKv4snxqomPQTjnybf89w6XYjGP3zzOMryby9Wi6q
 eX6Q==
X-Gm-Message-State: AOAM5300FTtTaWO1n4kmJwDU77tFLDNS+yONPQN9ycHHtLJGke2GJDiP
 jak48xgZzeCpPox88E4i5Y/GXA==
X-Google-Smtp-Source: ABdhPJwS0rNYwDP5R4IBfQS+q0od9Aco7ZIM2JQQ7pKKdmEUlhue9AlxoYVtabWkht62lkyNGFHR3w==
X-Received: by 2002:a63:e25:: with SMTP id d37mr14011915pgl.191.1605815313082; 
 Thu, 19 Nov 2020 11:48:33 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g15sm623365pfk.184.2020.11.19.11.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:48:32 -0800 (PST)
Subject: Re: [RFC 07/15] target/riscv: rvb: sign-extend instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61fa0e22-33d3-00ed-fdfe-9bf4f4e0bde0@linaro.org>
Date: Thu, 19 Nov 2020 11:48:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 19:48:38 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

