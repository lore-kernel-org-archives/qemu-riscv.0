Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8eEu-0001YN-3n
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 04:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8eE5-0001DZ-7C; Fri, 23 Dec 2022 04:20:43 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8eE3-0001aB-Al; Fri, 23 Dec 2022 04:20:24 -0500
Received: by mail-lj1-x230.google.com with SMTP id n1so4424615ljg.3;
 Fri, 23 Dec 2022 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=osMWHsQy8Cbf+ViBHyE844TULSz0XbioZUK09qiE4qU=;
 b=IS+fSx5X3mKBvyukl0AhP2ZyWNIedBysYlgClvgxY9j9MAlINkY64rUo9zOyMPA/wu
 fB6/Zg+S0SYkTG5RqnXdWz2Lj9RhE84l3lH50yC/eTTRCWbqBY8a5R5g6thI1x/jjaYb
 JSNDl6t1dIVN0gwn0S69n+nq1L2vnN1v/ewlJv7bGDFea64ESBjC4sWgE7VmDeg7fTDZ
 Xe7yQqVqAnbkoQIOAXhU11Uq7a6UVHGpON5FP5ZQg/bADf9XfIj7Vy0gaNTORzd1k/Ih
 03kmybMnHOBUElzXecNc3eXMEyHfHAp3wTW9YqRxId1Ft250Rf0ApQd9p/7Z8uKc9DyG
 ci+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=osMWHsQy8Cbf+ViBHyE844TULSz0XbioZUK09qiE4qU=;
 b=j8eh+q3mOEXcwM5m4T+kbjcDCiDzBdzZ+si7btfo/GvI7pzn0L8+NoVTUgkjdHA35r
 qITksXS7fMFxp6x1YJbeGjpJ/U5QQebQ7lRPWMAvoJFdFseofU5F82WwPuDwDqkD/g8d
 grgqUodmjldY9bO0PB2DFo2lGkOUKCIYdUEBQ5MO7IA6ejGf5F0gPTl49Cn6zBbUSuti
 0XiEZoLmB7Zy0oxQnWOj2R3QAPt4+P3Q8HrQGEg9jNfGFzkLwcqMvv07lve8WGT4bRv4
 e1hMfifdnN7rHGXhyV8BcwxzYeffYJTdM3QqGjD+qmGp3LRBioP/wrX4h5tV+fx0DzFZ
 XLWA==
X-Gm-Message-State: AFqh2kpJGmw156NkpsMXxDFodwANlEkMZ8LDv1U8SdkD8gFeYTJ++6OQ
 nKwBq/XL7CtoNzpG0AMP2TGzPPhbk61xqGHIOtA=
X-Google-Smtp-Source: AMrXdXuy+lCd9ogchB1wYkkcPRT0mHzUZNVD8plL2woOVpnLwiJpeQ5e1AW0RqOnNWNMJk/FphlKk9hHkuklQ/wguJU=
X-Received: by 2002:a2e:95cb:0:b0:27a:3eff:2e61 with SMTP id
 y11-20020a2e95cb000000b0027a3eff2e61mr779916ljh.402.1671787219461; Fri, 23
 Dec 2022 01:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-6-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-6-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 17:20:07 +0800
Message-ID: <CAEUhbmXy6a-E3yot_-YnzTChL_5pmS74Xnsij+Xc=C6L7BMgHw@mail.gmail.com>
Subject: Re: [PATCH 05/15] hw/riscv/boot.c: introduce
 riscv_default_firmware_name()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 23 Dec 2022 09:21:13 -0000

On Thu, Dec 22, 2022 at 2:28 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Some boards are duplicating the 'riscv_find_and_load_firmware' call
> because the 32 and 64 bits images have different names. Create
> a function to handle this detail instead of hardcoding it in the boards.
>
> Ideally we would bake this logic inside riscv_find_and_load_firmware(),
> or even create a riscv_load_default_firmware(), but at this moment we
> cannot infer whether the machine is running 32 or 64 bits without
> accessing RISCVHartArrayState, which in turn can't be accessed via the
> common code from boot.c. In the end we would exchange 'firmware_name'
> for a flag with riscv_is_32bit(), which isn't much better than what we
> already have today.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c         |  9 +++++++++
>  hw/riscv/sifive_u.c     | 11 ++++-------
>  hw/riscv/spike.c        | 14 +++++---------
>  hw/riscv/virt.c         | 10 +++-------
>  include/hw/riscv/boot.h |  1 +
>  5 files changed, 22 insertions(+), 23 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

