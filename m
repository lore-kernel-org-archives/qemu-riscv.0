Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMXMe-0002ce-6l
	for mharc-qemu-riscv@gnu.org; Sat, 04 Sep 2021 11:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMXMc-0002Zp-Nh; Sat, 04 Sep 2021 11:13:50 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMXMb-0005ij-Ar; Sat, 04 Sep 2021 11:13:50 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id k65so4190940yba.13;
 Sat, 04 Sep 2021 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tg5/amu71ioelX9eLFcpt2RQhQIssdkskdrltilk56g=;
 b=e30TKGURiyl6N76x+ZcEr0XANtvxvJwTC7SjvnwX6ODkKuYDO2aOgqGzfPvaoVldIZ
 LbhctlvE1n9nn6shvd15RZs4BZkW+r2kxe+54VGl0n6eJnLdsJHYVUukYpYV6xzI9tiF
 MbentrcMZAEfMWSuIkblggs23BkhUEqd3vXPDw+nQCYAIDWGOVnitKyVQAkQnP+SMZw6
 XwkGK4YBcH5Wd8Mp9rT/uDyDrNXtWHH2ccHueXEq9hxhg3ein0ysOaNHKbRCJxpDugS+
 vDHM+pRFgEF4tLiPDH3zMkNdy9cq1u3tJCxZBBTU1uCUk1dNx0WFO2KynNq4zVdV86Xc
 tNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tg5/amu71ioelX9eLFcpt2RQhQIssdkskdrltilk56g=;
 b=mYSEi8BKaHMttepaxUFGbwpOme5La2xQ/+ro7AJKFqBshu0ws7JixBFqV8brrJkc9+
 CyMrRapSEptvAe0Ue+T8iD10lxy7eXtC7eH82VgDgF0v1wA6WKVMoGV6m8ZbW6sFoE1/
 LFRyjjl93xIwbkBCY4mWQT85jKD5UeWeYzR7fh2crKbaju9QxDmZNyeCoR03wKNVeKTq
 I1mEcV5swRxN0cgXzNcd2N0+2UOcajs65b3B5B6oX1hhIdoFEixtfmjeYBHYE5bEFcI3
 w/ifsFM2OfjerFJIletnUtfepfyQGE2UCbf0iip8BvHHuhBct8I4PP6eYI3/y0p7QKOg
 EjyA==
X-Gm-Message-State: AOAM532Bpy+zw5GXv1vs7vdoGPjLM2Xa6BpBkVYQIuqEzEdzI+lwCop0
 VzF8poHjYtEYeg51hbyD3Qf2KfUEyH07NKkhtxg=
X-Google-Smtp-Source: ABdhPJzdPgIJRWPhOxt5Qm/Bb9LtPu22ShQ2xbCJ+ni3aPq/DsthZ3Nhx/JERbLz70XEFu7Z8QswwrgaL+BS3xUX6c8=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr5430482ybm.345.1630768428032; 
 Sat, 04 Sep 2021 08:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-7-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-7-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 4 Sep 2021 23:13:37 +0800
Message-ID: <CAEUhbmXL3BgWGTz0V0YunO3JYiNEztcv=QKTzz3sxdcUe=wqeQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/22] target/riscv: Add AIA cpu feature
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 04 Sep 2021 15:13:50 -0000

On Thu, Sep 2, 2021 at 7:51 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We define a CPU feature for AIA CSR support in RISC-V CPUs which
> can be set by machine/device emulation. The RISC-V CSR emulation
> will also check this feature for emulating AIA CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/cpu.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

