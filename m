Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWaS7-0000wj-Q1
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 04:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRx-0000pX-AG; Wed, 14 Apr 2021 04:00:45 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRf-00020d-LO; Wed, 14 Apr 2021 04:00:34 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id v3so18810614ybi.1;
 Wed, 14 Apr 2021 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hih6hHsLrY3TECzK1SH0TkMNVT8gKwtJ6Rkj/ZTbQlE=;
 b=byMLL/FkDJr7mW1rV0g9b3onwX0wmTiNQf5Co2+KK8X4apHBcG+ARguRUqGN6axxI0
 0uT1SxVrI/0D7YE9GCHRIrwUmSAezqlk8xBJePlEHzwb11wpYMn6fAGBFFCHTopegMUQ
 xXm9QGucJoOhJxbP54hiSPRV/H1Nyn6SQdCLSKBtHbgoe7CQXpu8PP5Ic1HQ+CuFOIaP
 NOCljvNQD/ADMx4h1n34iwaD0ysgfGCUYSMpiTY2K65be25JOXRFuPeQSbzHL7TGoaQG
 nE4GMibrZSrGo9cnJWGqlp+Lz0Q/T5MfbTTT8N05jOC/InU6OagSQJ79Y38Ur5rquUUt
 ZRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hih6hHsLrY3TECzK1SH0TkMNVT8gKwtJ6Rkj/ZTbQlE=;
 b=dPnj44PjCYiVRcxfK9kjmCXGMf6emNJHOw3Be0vaVHin40lsGoWNi41uBKc1Lzl/jY
 n46UktBtotLVAs+AzWDwbMP6SgR/9i4+BmtjR3PY5iFAxpP7wKAcENcB9p47dQep+9RW
 mMJAN27LdNXqoPUKc7lFw8OAuCeT0VbvFk49VJ+3EAkvOTkqVxda49BfJzt+qezp0Xk7
 qulAC6dP1/Nz9NNUYp25Dien6ZfgXM1VQ1tDq4EhCW0UWD9vDuN5Evrgw0oBJ9rj9eBB
 TqWZJBVj12NqFPPgDr5h4sZ1z+KPoX8c8qWfj0jtPLfTGrr0VZIrQchHMwDuHaKWtPJn
 U1qw==
X-Gm-Message-State: AOAM533pgpCjC3nEap2xKgQcj2YrsRPMl3hL5N626n33qlL6A8RSaeB0
 djLXh4evLPBxFLgT9Sp8IqHDPPuGsnzRWIT/sn0=
X-Google-Smtp-Source: ABdhPJzs0VPqY4iPBenHUtF/eBq0S06DPrDxhbB1PQNsOklhHvFTaTkMCMwuJNC5Ziq09h31Bgvsq4CEfTJi7ysWXEQ=
X-Received: by 2002:a25:d181:: with SMTP id
 i123mr28143396ybg.387.1618387218442; 
 Wed, 14 Apr 2021 01:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <89944e8caeecd85d7136ea53e7b2bbe8aab18222.1618356725.git.alistair.francis@wdc.com>
In-Reply-To: <89944e8caeecd85d7136ea53e7b2bbe8aab18222.1618356725.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 16:00:07 +0800
Message-ID: <CAEUhbmWQ2akeK6f=s8GqvxWbHugAVeHDhD5g+N-76YM7nJqkmw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] target/riscv: Remove an unused CASE_OP_32_64 macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 14 Apr 2021 08:00:46 -0000

On Wed, Apr 14, 2021 at 7:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 6 ------
>  1 file changed, 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

