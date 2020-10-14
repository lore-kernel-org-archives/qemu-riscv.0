Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSmOR-0003B1-0B
	for mharc-qemu-riscv@gnu.org; Wed, 14 Oct 2020 15:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSmON-000397-Sr
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 15:24:55 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSmOL-0002Ax-VF
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2020 15:24:55 -0400
Received: by mail-pj1-x1041.google.com with SMTP id j8so317960pjy.5
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2020 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lJ3MUk4XiwUmGOaJ2/MMkFRS69j7zY8jRy6+QfRAbdE=;
 b=Xv0KusxJnk1Neg4RWEKzTlPxb3OsAVhoiqmqyiAg1niKzD0oA/d4JeqPvHx9Gvn6oe
 OaXA/d5H50Ib9gyzbb3pj+Djikg1Y8NmcODREz106buvLXkuwh15rD2LKcVNbtEViRyj
 FOvo6jlr+VUuSrKdh4PnTjoo39Env2kAtl+D6timo7dWnITDs88OGDU65f+VYSP/cXXH
 Sw2/va4J8YlUxn/QP8no4mqR4T5tNB/DT8OEIqv6GQgGzWbkZm64+D6QufNlQkvIz42l
 FJGYlruxc67azlkY0/5nI+a83lCWWTBZy2QK3HKClbliSU3yUYawjQ45DbJtOI8Kj2b9
 cgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lJ3MUk4XiwUmGOaJ2/MMkFRS69j7zY8jRy6+QfRAbdE=;
 b=Q99pNs7O3XAmIqKf3gLEowq9wYQCayDWA2sHtS7cdHEYwOdjqRCVg3Kj/zmp8ZvpYf
 TQSpuYs46V96ePkLL3hxerHcbrmAviGtKMA5irFFDdO3KgFeZlzr2/nqSCoQQ8e0mm9N
 AZtKuBfECdPr6zOYF9yeSbAgmtSuQICf5MN1dXaiRvEJN4KUDebiDPRCYHHLV2HpvYRt
 uco/SovPieJVRQbn5bMnDrFYSHRrEhwxD74ERXFcfuchy3PUyN7/XRsHEuH4qjDX6+gn
 wlXfCzt1RhrrEAhv0HuRQRdZmZxOeob4Tt04ttUx8GfLaNbxZFTJdckIzv57ojpnONwM
 yOZA==
X-Gm-Message-State: AOAM5336RiV8RArRbxLYTDpx8htdzeifgbS3GoAs+ZdnMsG1s1I5xP7V
 6Vt7jmJr5+tuHNNNC0BKKyb4kw==
X-Google-Smtp-Source: ABdhPJzRbP6L7ntePK7YIMpa+MqL5LyVfND6AUlp4jB/0Lxd/tj2XpTSZH01bzKhLgS8fZoGwqnU/Q==
X-Received: by 2002:a17:90b:ecb:: with SMTP id
 gz11mr701602pjb.25.1602703492345; 
 Wed, 14 Oct 2020 12:24:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k3sm375606pff.71.2020.10.14.12.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 12:24:51 -0700 (PDT)
Subject: Re: [PATCH 5/5] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20201014170159.26932-1-space.monkey.delivers@gmail.com>
 <20201014170159.26932-6-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4c7ff19-0b5b-263b-51da-80b5caea8f27@linaro.org>
Date: Wed, 14 Oct 2020 12:24:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014170159.26932-6-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 14 Oct 2020 19:24:56 -0000

On 10/14/20 10:01 AM, Alexey Baturo wrote:
> +    if (has_ext(ctx, RVJ)) {
> +        src1 = apply_pointer_masking(ctx, src1);
> +    }

The if is redundant, since that will have been done in cpu_get_tb_cpu_state
while assigning pm_enabled.

The test for pm_enabled is in gen_pm_adjust_address.

The final thing is that the API for apply_pointer_masking is misleading.  Here,
it appears as if you are allocating a new temporary and assigning it to src1.
Which is not the case.

I suggest you drop apply_pointer_masking and just use gen_pm_adjust_address.


r~

