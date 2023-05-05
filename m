Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puueq-00033a-Og
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuep-00032v-Cz
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:35:31 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuem-00050U-RU
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:35:31 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so3084528a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290126; x=1685882126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=282qbiXnnduELh7hkBMA30hUmbArrUsj8vwL5LNJ9X4=;
 b=Xfg7o4TS9VJwM5dEFINYVTvNyXTT27KhVLJncaVpsZDNOgR3nde3puo0Tra40CjCQJ
 Ps7UWu3efmuehxBHpJeYlfDL6zHWPnzKd90svHg+dQBnnT4GoCCjCWjb2eOgwmSPhuBH
 tMAHRDASEHLXVVi/qfbRkYF9NXP9o8jgEKcyfXw0PSdbeHz1P8+HbPKQ8qknl0IO5+IK
 yoRp5pgGJtNgmNwGQDPeXhiKm+cymPrPo0GwP/UAdhmF96eamsh1HsF73LDi36By6E/p
 MmGD+jF3dCiQ34G1zJsgdXYEoDuDxHXyQiDiJ/ZJ68RMuJrlY/Dv6obM16KzDePE3tRu
 4wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290126; x=1685882126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=282qbiXnnduELh7hkBMA30hUmbArrUsj8vwL5LNJ9X4=;
 b=QAm6ZR90jnAl7I+YvGXcLK31R49BMlsgCo3iI027Wb73S/uQtMH+nS3+Aj9W1FPTxE
 aJJd6ROItV3gSunX0Bk7KUA3QX4en4OslJ1FbXYWQ0CkGVxiNTwrz6T0U5bzvBpSc85w
 w5J2XlET+jWjwzMIjyI02f8Fo5cp8goAl19hrdP81tw0Efw4g+O7FPEem7/i76W+icLJ
 oPMpfv3jRadMJy3nkoVx0rHpL20tUx+VsOeibxgFhOB+MdFSiTMrWyJuiKJKtJHF4EjA
 rZKjLFV5XL4N+qICt1G0Fob7Ih3HWdCgE1HaOD12Li6wdV/3x8ZTXHDFqOMz2okD/qNJ
 rl9Q==
X-Gm-Message-State: AC+VfDxDa7KjQl3CW+wU4X/2Zu/GW+XWqAV/h0CdsObr+1eu4+jfZqA6
 JKzXZ4q7ss5K5hcnlBmeEmz9ROy2Ey0PGHx2d+G1WA==
X-Google-Smtp-Source: ACHHUZ7S9kVr54gxDqt7ETcqjilJWw7yas4eTD1ngvkQW77UVuCoe3s28q4xC1BoFMNV+MJSqrCzv4On6ZBMvy89/Ik=
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr1429278edc.29.1683290126188; Fri, 05
 May 2023 05:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-38-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:35:15 +0100
Message-ID: <CAFEAcA_K7Nqp-4ovoAtySMY7x4f9LpBMgv6HQtaMvBs4Fz9x5Q@mail.gmail.com>
Subject: Re: [PATCH v4 37/57] tcg/loongarch64: Support softmmu unaligned
 accesses
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 05 May 2023 12:35:31 -0000

On Wed, 3 May 2023 at 08:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Test the final byte of an unaligned access.
> Use BSTRINS.D to clear the range of bits, rather than AND.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(at least, it's the same general shape as other architectures;
I have no loongarch-specific knowledge)

thanks
-- PMM

