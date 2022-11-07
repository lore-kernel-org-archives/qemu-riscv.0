Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os1q5-000058-1U
	for mharc-qemu-riscv@gnu.org; Mon, 07 Nov 2022 08:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1os1q2-0008Ur-HP
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 08:06:54 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1os1pz-00047z-TA
 for qemu-riscv@nongnu.org; Mon, 07 Nov 2022 08:06:54 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g24so11014101plq.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Nov 2022 05:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CokQCthltXArHgeXeP+mG0lge6iFcoJC2pAhsLLTxeA=;
 b=mVtZPraq26J/agFjfITLb8VIqzreaup6RzDLpoWd0VGr0/mh35ZNPG3ARxIitnwu4V
 XrtBxeQ1Mvin9Bo+Fz1KLjEmg+wJE6Oq93wcK9E7mbEVhaz9/8sdqnu8KV4hVxwfePGY
 8pfd4IG4SKQdcnRn2Vcj/fUqWNQc2AlZ/usLwnwuzqHPsc9fkH21v9sBYBQkhHDk1RqH
 D9RWfRXT+dujNRRMi7v0iGvdWPhUAXxJLrG5HFhtyTCNwk8kP4880dsG4pqkMw3ghGDl
 iwCqdwxmkSkdHZplXUDL0LJq/t+hB42uY8shC1EZPMHmFd8i0hYPKticbo49rx/Uy8pF
 nsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CokQCthltXArHgeXeP+mG0lge6iFcoJC2pAhsLLTxeA=;
 b=Dlrpo9gWLiVTCMlzvhBG0U1dHD1E7296Jz1C73iF+YnsNRRyyUHs+bCaTdX7rwu8/6
 lwj0MGBAQrGyncK7XFmdMo8PVFMUrfxyrV1nO3PZlAe7Trav61kfIC0/pJDoD6E5kdpS
 tLifVMiQZqL/uwanMNzalXcQX8K14iErhMsu9by8am6JLvXr6acRd+gzoWLzVy6wZPs2
 vP4b8PIo8ZGOAy6EzCCTupEnj6LyGJt3Xm2i2E6iG+KFQwR7VvJtxlQM1ZHK6wHMyW6I
 wXKxcsaKehcSFzUB4pThR9nbfd7CYJ/U+HE8wbS/PVyN4vB+q1uyK9YKb6erYYNlfZ8M
 larw==
X-Gm-Message-State: ACrzQf1Qb/1HHdG+MZLluNT6EIF3UQHeF8KtfCqom/ltqFBB+2r8BH4P
 2ATYIGF5z4Cmrb9Z0tpREcYFcZTwRmGcY0P0AEaC7g==
X-Google-Smtp-Source: AMsMyM6aKbmjq9PeiipeRGlVf9xgWWW7n1WdC7LnK9ySZnYBIPzEw3Kr9K8OI+uYTpPoUqj5DHNsTP7LQykiuWUcA+A=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr50482166plb.60.1667826410317; Mon, 07
 Nov 2022 05:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
In-Reply-To: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Nov 2022 13:06:38 +0000
Message-ID: <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Mon, 07 Nov 2022 13:06:55 -0000

On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> The pflash implementation currently assumes fixed size of the
> backend storage. Due to this, the backend storage file needs to be
> exactly of size 32M. Otherwise, there will be an error like below.
>
> "device requires 33554432 bytes, block backend provides 4194304 bytes"
>
> Fix this issue by using the actual size of the backing store.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Do you really want the flash device size presented to the guest
to be variable depending on what the user passed as a block backend?
I don't think this is how we handle flash devices on other boards...

thanks
-- PMM

