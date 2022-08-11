Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMHa4-0003Tf-6c
	for mharc-qemu-riscv@gnu.org; Thu, 11 Aug 2022 19:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHa3-0003Sr-E3; Thu, 11 Aug 2022 19:27:11 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHa1-0003so-Ih; Thu, 11 Aug 2022 19:27:11 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p125so14202612pfp.2;
 Thu, 11 Aug 2022 16:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=wl5O6G8Coix+sxhKHNL/49dcc1W7GTDXTIpT/MUakaE=;
 b=AV3UNhR+ACjfZlERU43i8BX6E53WWMzEHEJ+VpkoazrzIbVhxiAR2pE39ngEt+NC6v
 0QQeI4mgh5GAd41BVDAF6CYKvkXaMzjVLgGbvaaKfN4djiO/ifpvbEIhqiQ3Lld8Hdqh
 rL2MU4U0TTc1y3IkAnVE97fTUncTRG+UiQzq37mqZACBBTUgNaBEjFr5pXb1cL2t0W/X
 GQaODATvIDvZMCSD1YEVz6TAZdZX3O75r5SpWKgaUs+gCFkmLqWSHg0IzivXd2+zu4Tn
 n6VfgjTCIUsxErsVDjgPYq9Vd62x3SpVOlq21Vwjfi3qsUrd/M6/MH5iEkxnkKoWKzip
 mGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=wl5O6G8Coix+sxhKHNL/49dcc1W7GTDXTIpT/MUakaE=;
 b=wc++t85XDNdsyiHY9hWOJH9me5WWKLwEwlZBZFsUYGJwzrND7APxz/GXd4YGi8kamk
 756OiIdXyh1yI6NV+/gg08X7I2KGVtrHgibSxlCkkB58mdEFZmDURcmI4n3Q2EdNF6I5
 XfdPl0/vOHXxXeJMJtB9CGdREvwcnJOWa0kChvSO6JBJGgbNnyUcfWNRQMGcaaupwAUM
 34If3iFgD6jU9HLONVxCjIQktEx+sJ6+OpLZe0d9XXP4/gF489BBE4VKd7Tgf8Oqm9xc
 ZY+Q5oG1BsyB1bWXNl5eHSEfoyyLgQ+InkdIDrnF8so7Zoeow6B0Ey6n58ULc9o0zYGm
 Dv5Q==
X-Gm-Message-State: ACgBeo0gKYVPSoFVFrPrgzrKsh96Fbk3XyD6Mq7PVNAv3Xi7+NOHQ0Qp
 btpEoaiYwIQ1dAVTClRTIrI=
X-Google-Smtp-Source: AA6agR4evVDzKMML8QMa1oa5gGMfwxael7v+8hK9U/BxlTJQM7QyKRL8umH2IN7PO2hdz4UwK9HkLw==
X-Received: by 2002:a05:6a00:8cb:b0:52c:6962:2782 with SMTP id
 s11-20020a056a0008cb00b0052c69622782mr1364435pfu.81.1660260427206; 
 Thu, 11 Aug 2022 16:27:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cp6-20020a170902e78600b001690d398401sm226324plb.88.2022.08.11.16.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:27:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <d7eb0da2-f0a0-997a-0ab0-6ba344dfedfb@amsat.org>
Date: Fri, 12 Aug 2022 01:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
Content-Language: en-US
To: Furquan Shaikh <furquan@rivosinc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 11 Aug 2022 23:27:11 -0000

On 11/8/22 22:41, Furquan Shaikh wrote:
> Unlike ARM, RISC-V does not define a separate breakpoint type for
> semihosting. Instead, it is entirely ABI. Thus, we need an option
> to allow users to configure what the ebreak behavior should be for
> different privilege levels - M, S, U, VS, VU. As per the RISC-V
> privilege specification[1], ebreak traps into the execution
> environment. However, RISC-V debug specification[2] provides
> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> be configured to trap into debug mode instead. This change adds
> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> should treat ebreak as semihosting traps or trap according to the
> privilege specification.
> 
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
> 
> Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
> ---
>   target/riscv/cpu.c        |  8 ++++++++
>   target/riscv/cpu.h        |  7 +++++++
>   target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
>   3 files changed, 40 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

