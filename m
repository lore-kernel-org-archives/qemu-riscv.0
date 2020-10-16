Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTZbI-0002HX-BM
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 19:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZbF-0002Gw-Hw
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:57:30 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZb7-0000Q1-S5
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:57:29 -0400
Received: by mail-pf1-x444.google.com with SMTP id n14so2386965pff.6
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2020 16:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3jS1icMq1WQjVt63k3IvyMO58GpNJrY8z8sbN6bBpNE=;
 b=v7fhr1vq2nDX764uBEVxTbVR69q7I0kuN8kcr7BESTMdF/+AFobAcynY9MMmI7haqk
 Sza3v8eC0L674MrjViAUu+p++EW2swAkuxYX+6OqASspUWaCp4BvDEkxOxbPVoF5oQWm
 XuBmjzDK6fs6DBVmCrhaMJkL5TZkd/hR4omDvytvhu1zPPyw+9rjT/sK9LdG2G3voX5e
 9Tx0clML8HwfNScPwmpVeeR2wHxl+2WfBByP4M154AyUIKMq9YcZVoM1GQssdVehg9F0
 BMH9TgXyeu8iCTxmVIuHsqqTO5MJ+IH9DPpEzgDbIELI/8oeMXeVg2jCFECZp3b1p7WJ
 9lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3jS1icMq1WQjVt63k3IvyMO58GpNJrY8z8sbN6bBpNE=;
 b=M3eXEIxkvE1WJ/TZn7TchGr/m6rclml4rWwyv7mCZQJdyQa0vq7SzIIsli6VLYyp6z
 OYL1EUjxde/7VvZ0GOeASVS1WAp3O1MV8CHvCjKE2FsF7q6P7Vge6IxNCvhqnswJSZTY
 VoP0thwt/3OXaKasz+U9FUmRaMmpQCZb7kztjb+d4hYxnnX6epdbdHQYmN8c11h5AvR5
 IkVs3r82xvlqGvRcTVCqgN1vXYj2VRvY8ka7j09UfG3y8Cc76ZlBegEI1LsVzXZw28XI
 ZX1NXncPb9uU9H16tLtoILy4Vd+DPJ8Niem6wSMVMsqFfWP+fvC2IXgr7zWRBVgw83Iv
 xJvw==
X-Gm-Message-State: AOAM532pqvE0gCJUh/5z4uo0+UPrWmg8Isw0uNg/1v5yqkf+WYje/BAt
 +/k6B/Gd0vcMK/d2bynrJbTwxGRYxdh6eg==
X-Google-Smtp-Source: ABdhPJzC+ryOEah9uZcOLfUCMOmRxDaKWeYyRCcjhQenJBPOyua4QdNcocXRxkJEUd8uM2OfClZxUg==
X-Received: by 2002:a63:e544:: with SMTP id z4mr5319937pgj.235.1602892640147; 
 Fri, 16 Oct 2020 16:57:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d9sm3908280pjx.47.2020.10.16.16.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 16:57:19 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for ones in hypervisor mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201016221138.10371-1-space.monkey.delivers@gmail.com>
 <20201016221138.10371-3-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b37fb65f-d389-9e2d-2b37-778441f03642@linaro.org>
Date: Fri, 16 Oct 2020 16:57:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016221138.10371-3-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
X-List-Received-Date: Fri, 16 Oct 2020 23:57:30 -0000

On 10/16/20 3:11 PM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/cpu.c      |   1 +
>  target/riscv/cpu.h      |  11 ++
>  target/riscv/cpu_bits.h |  66 ++++++++++
>  target/riscv/csr.c      | 264 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 342 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

I'd be delighted to see the J working group address the security concerns.  And
to address the fact that existing hardware will *not* read 0 for the *MTE CSRs,
so it's silly to insist on that retroactively.  Code should be explicitly
checking for J in MISA.


r~


