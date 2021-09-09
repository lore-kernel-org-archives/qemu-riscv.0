Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOS5w-0003JB-73
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 18:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOS5p-0003Ik-D6
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 18:00:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOS5e-00077y-T2
 for qemu-riscv@nongnu.org; Thu, 09 Sep 2021 18:00:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q26so4598066wrc.7
 for <qemu-riscv@nongnu.org>; Thu, 09 Sep 2021 15:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Cl2yZdNadj4Vqi5aDmByn70CbSXEvo7k1exYJL8Xmo=;
 b=fi3SwCfZ1jU6G5QlMUKAR4c0GgpUrHY8jT4HXqaHBLnziA7m62gZ1b7nj8fVvDJJlk
 kHtdIBFKOnB6czhBoAz16oIKunrr4J8sDy0q0CYM+PfN5Ys1PkHIbIrjQfe7i1QZ8RxJ
 v57mRhFNofkh1XnDvjKtJX6/g3RxP77qw/+P8dk0+1rTN2NyruVO50o9Vmx9XEjUZbhX
 iyhn1SO0Xsss1OgLaNcvWWefGDeVlPXAFsynZ78HKyKv/wRugRz5+LwFjjlbiVfvREfw
 VCqBrEDof9VoZ7eWagqRk7hBi95xNvibI/HvCqIEii4gzUODFtYOJSfYNMtkZippk13B
 GNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Cl2yZdNadj4Vqi5aDmByn70CbSXEvo7k1exYJL8Xmo=;
 b=ffFUx08eevraxQsbxZq4vB8IYZqccMx5m+FjtJzZiFQTZdc6BCG5JGMf/Xs17PaD0/
 R8f3xgv7+ac6LmXyC4ZdUdWfpCeqakgH46JKBZijbu6o2YFrkaUgKbORYuL7qwC0OzVd
 gRswib6VAAjZl2Ue27M/bDV2fYsU+gA61Nkcv9+PBxLYYDiLsYqw0dyfmZ1lqjitz8L2
 eYS8IVMOXUmPZKBQ7Q789611tdvPocQzIpR4EupNCxbKkt2qZ9SazjbjbmdRyHHo/wwN
 VQALclQAwQ1XYYwNtF0Y80jH2dfWi2FAjeDXjTiLAnwwkNBQ70FpaHV7drfXvoKP6USX
 wDRw==
X-Gm-Message-State: AOAM531tcjkDAT48sPX68W45N0pcnTqNR53G1yxKZVsGGJdEOxdEcZLq
 7viWl9EdLHzk4ZEMjXaycluhOQ==
X-Google-Smtp-Source: ABdhPJzRv43nfeCnuFtiUoNOEoKt2Je3df9CDrtIkOtSWPoS/LQv7X9T7F1P9dthcEkkc4liuIAelw==
X-Received: by 2002:adf:82a9:: with SMTP id 38mr6156549wrc.82.1631224806706;
 Thu, 09 Sep 2021 15:00:06 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id k1sm2793157wrz.61.2021.09.09.15.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 15:00:06 -0700 (PDT)
Subject: Re: [PATCH v11 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>
References: <20210909190033.1339448-1-space.monkey.delivers@gmail.com>
 <20210909190033.1339448-6-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4098b753-76fb-2dad-4922-837061184fc1@linaro.org>
Date: Fri, 10 Sep 2021 00:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210909190033.1339448-6-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 09 Sep 2021 22:00:29 -0000

On 9/9/21 9:00 PM, Alexey Baturo wrote:
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       if (a->rl) {
>           tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>       }
> +    gen_pm_adjust_address(ctx, src1, src1);

This will not work anymore, since src1 may not be a temporary.  See the use of temp_new() 
e.g. in gen_load().  We're currently only conditionally allocating a temporary; with this 
extension, we'll always need one.  So it is probably worth cleaning that up at this time.


r~

