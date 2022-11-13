Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouKiI-0003Fw-10
	for mharc-qemu-riscv@gnu.org; Sun, 13 Nov 2022 16:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouKiG-0003FN-Lz
 for qemu-riscv@nongnu.org; Sun, 13 Nov 2022 16:40:24 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouKiF-0002j1-6m
 for qemu-riscv@nongnu.org; Sun, 13 Nov 2022 16:40:24 -0500
Received: by mail-pl1-x633.google.com with SMTP id 4so8505001pli.0
 for <qemu-riscv@nongnu.org>; Sun, 13 Nov 2022 13:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p7rHYzGzpjl6aIG4jMRa3R2I2CqnQPCIiqf99H58yUA=;
 b=ZE0IekjL+SsROFzcez8ArYlDVhDNffFKXhQ72hijt8GzpeswzcbsIuIxPpnKF81xCh
 9XzjfUtKFgBejL81asBUB8F2ZMQZB6MtUVYF8T5FpAbgcF6JxsWxTPYIr4adpxcS46UZ
 S8z8tZvVG4RngLntmOQuGx4sb2jzsqHP76uh74WMdyXKgZpQ/uQ5Y6PVqofyncbmg8Oc
 kW1I0KgTtOj9X1qBKLs8Kk07Up05e7LcRpKC9mxonjPqT2dk9LtRJ8jmoCnU5oyrKbo8
 xv/kXF4s0pijYjVP1sYORNtGhVUIvmWm/BOfSxwY8nXNWj6pwbA3akb/nBS3MUwd6l7S
 V3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7rHYzGzpjl6aIG4jMRa3R2I2CqnQPCIiqf99H58yUA=;
 b=sWf3WmG2zlzrz/CehTY3p5ZQ3wojq/bqdQlcIHhrh4uG9oDrD0wBFqjYYlqejDyjhN
 +6LK2QubttDz37U21waw4Bf0su9RxhYvCnTE2PC5OG7oImNpb4rI8lHaEYWDMisFSpg7
 03xqdiHEOvCsIZr9P8fXC1MsELHP+ByP3g45POMtpGPjTg5ZJRTCCM9nKU9JTcahAjsY
 AUl0FROiDhvDEVgDvYHgQu1QznTon7wAEJVBK+TqaNC1UF7ZMfwHQ6oyF0Q6vZTvmU8j
 fyiUW2vru6wfv0tBxORqr8wG4PLhuJ83Uh5KTt54qlokrt0hzRU2nb4tnFzavJ12HGxt
 YZpQ==
X-Gm-Message-State: ANoB5pkW3rHgL0WN/SEYkVgWU/iay619J6GSVlXfbaAOHodjbD0m/NsV
 cmgtSsK4LLUvvAonrJZFDlH47g==
X-Google-Smtp-Source: AA0mqf6uo96SWGYuJFdGRu2lcrzG1xDEgeBm+rGeWjOjwvOH/Se4KgSYOs388LSq5Nde+2/Mai+lyA==
X-Received: by 2002:a17:90b:48c8:b0:212:e8da:fc3f with SMTP id
 li8-20020a17090b48c800b00212e8dafc3fmr10749330pjb.189.1668375621069; 
 Sun, 13 Nov 2022 13:40:21 -0800 (PST)
Received: from [10.0.0.228] (119-18-35-77.771223.bne.static.aussiebb.net.
 [119.18.35.77]) by smtp.gmail.com with ESMTPSA id
 u18-20020a170903125200b001869efb722csm5659487plh.215.2022.11.13.13.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 13:40:20 -0800 (PST)
Message-ID: <f41a1fe4-a564-5ca6-b52c-c3c4256ad241@linaro.org>
Date: Mon, 14 Nov 2022 07:40:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/8] target/riscv: add support for Zca and Zcf
 extensions
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
 <20221113023251.11047-3-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221113023251.11047-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Nov 2022 21:40:24 -0000

On 11/13/22 12:32, Weiwei Li wrote:
> +        } else if ((get_xl_max(ctx) == MXL_RV32) &&
> +            !ctx->cfg_ptr->ext_zcf &&
> +            (((opcode & 0xe003) == 0x6000) ||
> +             ((opcode & 0xe003) == 0x6002) ||
> +             ((opcode & 0xe003) == 0xe000) ||
> +             ((opcode & 0xe003) == 0xe002))) {
>               gen_exception_illegal(ctx);

Why aren't you using the same c_flw solution that you do for Zcd?


r~

