Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDC8C3DA63
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 18:23:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sWgdP-0004H4-GA; Wed, 24 Jul 2024 14:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWgdK-0004Ft-Sz
 for qemu-riscv@nongnu.org; Wed, 24 Jul 2024 14:22:39 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWgdJ-0005ix-DX
 for qemu-riscv@nongnu.org; Wed, 24 Jul 2024 14:22:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5a1fcb611baso157938a12.1
 for <qemu-riscv@nongnu.org>; Wed, 24 Jul 2024 11:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721845355; x=1722450155; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ri1NeKHc3gnHRiGYRMIlqRBDF/XXK7ZLi/6gMp+tvBs=;
 b=THDoHkHD2q/OeoPqbqw64yeVUzAdxOflq2bxHG8AyWcuRNzR7VddL8I4YD9fL0MqBa
 IC4Y+4cYz7ty39B1dd8VvLLMQIZ/8pxXBR05c0Lm6CK7/xpve45m6itI1BQGfcYqAX4H
 1pdyeG5D9Z3DD/5kWXNsy/nIpK4ujmphnolxsYajOXgR99D5tnphBORqLhKeGA6KTLeZ
 kBYFOjF1s4Nmoc/DrsxbZNBiYmLvwzhjD24n9lFdWfJWBwYzAtJmiroy3IK6LhzFrgMo
 axcPW+G+3H12n5HKWombIUAUC8+EhQF/YqRW4gPC7OV1IWDUE2H1cGym2e5jHZnt9cNV
 f1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721845355; x=1722450155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ri1NeKHc3gnHRiGYRMIlqRBDF/XXK7ZLi/6gMp+tvBs=;
 b=K02pITVyAHj+qXMCx9mRqfVyZOOqyA5/Qkelrq5B85L+rzFdQx+30blHTvQ+efLSxB
 OMrr3Va2CIdqfNy6anrH6nCAg+j+M/axV9P0Re4GjZRdDmXbVedKRxBO10kLmoqJJCgu
 TNo6xoO6BiuWWUgmlNxQYz7J2CdY1NJouEpz1UidvnJj3SPEhtxT0NdINCKWLl1xeiKd
 4bykvSeuSev8lsU0vjU9Vx7F7JWh2bQXu93ho8+MxFXgrf0HE+Cb3Y/5z8Pb/DzXN+W5
 EqR43DeCAtWHNV7hfDne4j83Q2TNaI4+l0b9qaOAaRkMQWFTYZQLjK5Hq7mT8FsWHDVt
 Q4Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5CgPxXQZg6fHNRgZBLKlTNIcy0ZXxjLIu+ja6sx3cw6ygGvIC4tOy0Wsy7sf3cbK1rRDSQIMZWWj7OPKyhLjJqEROUTg=
X-Gm-Message-State: AOJu0Ywun7zW8yBZ2Rrbgx4pyChS2ObP116rsVhgIG9XzBJC/ZAm4StL
 qaVU1Y8esJt1TK7lFzUKOdWHbTQoGdxgfs3Hmf0Jb9PXrxn69SYHMtsqJgG7PBVgetGIAoVfdMr
 FG58EAG1tcRz/jx4NlNF07ghEiOTVkgS2fK1ebQ==
X-Google-Smtp-Source: AGHT+IHTHhzZAKfH7hgPApaXnojvF7GbCkocb11op7fAD2RMnhX31MbmDVXBm1UkP+f/h7OUIvJCqgu65DQJxB5n2Kg=
X-Received: by 2002:a50:d61a:0:b0:5a0:f0c4:aa7b with SMTP id
 4fb4d7f45d1cf-5ac2c1c79abmr120633a12.27.1721845355383; Wed, 24 Jul 2024
 11:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240719231149.1364-1-zhiwei_liu@linux.alibaba.com>
 <20240719231149.1364-8-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20240719231149.1364-8-zhiwei_liu@linux.alibaba.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Jul 2024 19:22:24 +0100
Message-ID: <CAFEAcA8pdw1zUxMXD1g08TedNo7MizUXOSJF6eciuCU=c2zx7Q@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] target/riscv: Add any32 and max32 CPU for RV64 QEMU
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, dbarboza@ventanamicro.com, liwei1518@gmail.com, 
 bmeng.cn@gmail.com, philmd@linaro.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, 20 Jul 2024 at 00:18, LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> We may need 32-bit max or 32-bit any CPU for RV64 QEMU. Thus we add
> these two CPUs for RV64 QEMU.
>
> The reason we don't expose them to RV32 QEMU is that we already have
> max or any cpu with the same configuration. Another reason is that
> we want to follow the RISC-V custom where addw instruction doesn't
> exist in RV32 CPU.

You might want to consider whether you'd rather have this be
"-cpu max,64=off" (replace "64" with whatever feature name the
architecture uses for 64-bit support). That's the way I would plan
to handle it for Arm (with "-cpu max,aarch64=off"; that works for
KVM right now and if we ever wanted to handle it for TCG would be how
I'd want the command line syntax to go).

-- PMM

