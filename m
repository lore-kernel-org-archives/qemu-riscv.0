Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCAc9-0004Kk-UK
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 19:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAc7-0004Ja-FW
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:50:28 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCAc5-0003gs-Bc
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 19:50:27 -0400
Received: by mail-pg1-x52e.google.com with SMTP id p37so2282041pgl.3
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 16:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QOfMSXyS3q8pxkOv4O778P/4TaggW6qIpuGKPww5NUA=;
 b=C1pwgv+y+JZKeOiJoHO3FOJ2MRSkvmmpPs2f03Kuy6ZN9y8N35db+qQaX6Wo0yW2YM
 lnbZ1sKw2byXgs6U3hWV+YZRMizbexuis+8vahYt1qCSBRrlFSkRGdSrOC5hoidkCKbF
 LGBU8uhLgpc50IyTGehc2zj6trh2GHszzVdmMu7bfXPxt7Fod64mPn9BMAd5uCKc20LH
 burrhF6+Dac5oI3DKBgyEzaUxBnUzXM8XPL+7gMjIrTJJUU17lCoh5KuEk3/MwlLPsla
 IKzLumc0Te6A9MLhFZLbeHA2VmecBloOLTR4sw4AqAPZO0RhWspxukzb6fad/pfcZ6MR
 inpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QOfMSXyS3q8pxkOv4O778P/4TaggW6qIpuGKPww5NUA=;
 b=KhHTT9/jnOcF3mJIDIS0zn2JPYTPuAyXhmoxA3pn25gOu4atJmMMdEwoNyDiiX4W1+
 ZFHilBjgkRn9IRT2Gh1WDjqVO2sqYbPQJK3JeYPFRsa6/6w0Vhg+Nt9V+hyAI4OP0HyS
 BjvcmgiGjoyoubTxyZwF0Ce3+y/xN524Q2ODRWIFaGAIxCH5KOEGzbyBgR4QCgyDWf7/
 N3E/3C8gaVmMmR4UGBOjQ4oavvuiIslNGhsWUFghjL2rQGYmhk2+ssJD499jtlLnLH/k
 Js9PmQ8hkhw3ASXLGt+LDEAOo2irHjnE5rJ0uuQMFfJ6ch/u+1UbscINR2pvFCVzFW1N
 nzaA==
X-Gm-Message-State: AOAM532XCwuUGs/KeUhovYVlUCjQRcSgHWRSBaC+4H705iKxwtnYRXqW
 Y4IqWiV7F+znFzv6uUYz4z/MHg==
X-Google-Smtp-Source: ABdhPJzmJBvVyDZZF9GUJUunJHeL5Dq1WgWcahRmDM0tT4HX3o490g3WuDrS3S/B5O3TbMRcZugYlg==
X-Received: by 2002:a65:6286:: with SMTP id f6mr3863358pgv.0.1598745023915;
 Sat, 29 Aug 2020 16:50:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d23sm3007445pjz.44.2020.08.29.16.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 16:50:23 -0700 (PDT)
Subject: Re: [RFC v4 56/70] target/riscv: rvv-1.0: widening floating-point
 reduction instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-57-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98e9f405-8648-7e65-3703-32616fdbd609@linaro.org>
Date: Sat, 29 Aug 2020 16:50:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-57-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 23:50:28 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

