Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhihc-0004oB-Cq
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 22:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhiha-0004nn-MQ; Thu, 21 Apr 2022 22:07:18 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhihZ-0000mH-5p; Thu, 21 Apr 2022 22:07:18 -0400
Received: by mail-yb1-xb31.google.com with SMTP id f38so11972842ybi.3;
 Thu, 21 Apr 2022 19:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csrfyuv8B+sLo0NtBnzWmwaz1IBy+/r3kktNgQP93wA=;
 b=p4HyP6o5umf0pRvtpVvUYkLSJHx+iwZhDwuX/gosszlvErz17nVCYhfHhJ/RKZCfbL
 EqSUwhb5sLJn41uj5LCDOlbpi2CAVyhMsZd8qxD5kfVBQR6ryP3lHAcBatZMDhhaQ60/
 FZ158CL3nI5vHTL39BwmYaLaw7GXg05V1v8LHZQ8/cJ+kJVhjF+FWH8nqoE9L+I7/OVa
 evF0ILQotkC07eAKR7lm/XETJOuee31qbqTDZiZBRv705Lq8ILvBQlYSGs7qEK7Z7eCE
 FFYoKuY6JF8wEQlJUmQuKfNlHQiy+UCK0oOPnluqAuLCITaaULVvXa9T2cGOHlFcjoic
 UBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csrfyuv8B+sLo0NtBnzWmwaz1IBy+/r3kktNgQP93wA=;
 b=RRIgPFu8kLtC2+X0H3OdYvMReHzs0Z/O6lnqBXBG3DRKsXB1MZJNBO3GT2vQCCHTXL
 3R0+mKi6FabQb+nRQKV4CEleNi5+xJOE4nUpgPHkecTCkFkhbexzMC5RRhae8lozwXQ9
 iaNfXdAx8qGITYvVjxedR+6d+dHrRJaj8Cc75kI5EhEBfoTP9UStoQNMKYQ38q43pk/3
 ae2N6GOL2+R8bBoyN5hvEKH5+ibdjOQDJtgjIlNsa92CG9qprvW5pz/urw9L5efbH+wt
 sezbcKT3U4gzcCD25PZcOrcGP5Dc8I0mYHwmRFqG+XG/ChfK7TdBmEOl6Plb2qPN1dQV
 0C9w==
X-Gm-Message-State: AOAM533Kx6ilxpaSrqDX7cidjm08ftgAv/x+dl2bnOD8Ptyos7wACmtE
 hhvTDUOco9XVtbB88u8qdfm5/hvE2GzASpAQiUc=
X-Google-Smtp-Source: ABdhPJyjKA7NDKGLNh3LkGLCUUZulXCqY3E+rOGrtIApJ/JbkmDw8Ua6d6nSoup/cbVHbDMS89RoXGYeg0inax2DTH0=
X-Received: by 2002:a05:6902:532:b0:644:b35d:a27 with SMTP id
 y18-20020a056902053200b00644b35d0a27mr2374066ybs.579.1650593235188; Thu, 21
 Apr 2022 19:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-6-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-6-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 10:07:03 +0800
Message-ID: <CAEUhbmVfvP9F0jxJ5QFqf9npOPZLjgA2p+_cXbJsGcv+VACRBA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] hw/riscv: virt: Add device plug support
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Apr 2022 02:07:18 -0000

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Add support for plugging in devices, this was tested with the TPM
> device.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

