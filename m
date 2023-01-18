Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHwHX-0003F8-Lh
	for mharc-qemu-riscv@gnu.org; Tue, 17 Jan 2023 19:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHwHW-0003Dc-6R; Tue, 17 Jan 2023 19:26:22 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHwHU-0003qy-MC; Tue, 17 Jan 2023 19:26:21 -0500
Received: by mail-ua1-x92f.google.com with SMTP id a40so1390837uad.12;
 Tue, 17 Jan 2023 16:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ih+qXvpihGv5o/l73QPSID1JFXp98GoVw4YXzfPvfdc=;
 b=T6XeB/fSOFZ6el8qbPzRkEwRWotmDIneIlX7X59uCG98hSw4fk2oJkfzLD6vvnIW1G
 iacRUAjtQilrifAHtW/W2S/Rz/ruBUa1wetcSzt3UrhXH5+SVAbls76n7dQwUtGVAp2B
 ywsyHTdLbfZYco4dSX9vqbeV/pjFIJb+ZLvJmXtB20aMPgJ2m0DOihSf32HOp1KMB8ON
 OHgFYy7AbdvIiZSbfgE/GZobNtOzbre9sNMyS2w2vxCp9L0E/kNsPWFYU5012G4Im+qp
 R3/tZOOH7SUHWU2BVE9gtXv+yHnNa7WOMp8iJb4i1UCJ6Q57FHVZ+Vy3EFdsa7Gj1eQr
 hXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ih+qXvpihGv5o/l73QPSID1JFXp98GoVw4YXzfPvfdc=;
 b=ZIEx4MjXkiPF3omgCVZ5kzTlyOfWskR2CRbbgDspwRcWzSSUSTr4q6XIqCvGFuQCE6
 0egkmmpK93pMYCOxsTUSQu3w0oOQ8S1+JAAEMKVNo8jlfikWaYoaHgoCVvcrVdFcxHE5
 89PDCP4KK06Pmrzb05km+1LQTtgFEqa1o/hQaA1QgKQ5pnHqbqLm1jVjRDQfCdBKVR+G
 TIrrhvM9V8cTJT089Sw8a86oxDGnYUNoZs+1vlydxU+i4PfdSVdMDPAtqOIs+2MEmnKP
 /iMHdlnwbMtqVM5YbcuODyljcKJqKERk/HXbpgJ2LhLWu0VHJnQv7FXAbUfdN75GcW8k
 toBA==
X-Gm-Message-State: AFqh2krVRt/lVgRLRz66ZKil31WTJeU+HFdZmtVODNtAjuCXNyoRPnmH
 bTt5ooStayQ8AUMFj3z0yZjkSZ9aBkcIOKAIuJw=
X-Google-Smtp-Source: AMrXdXuUzP5q33B3g8gkBUpxSu8hRJUWqvJ+uXKrfL9zFEADEybEDevUdOyX+fo9iyvmWllfHXcsMcpeAD7KXhuyaeY=
X-Received: by 2002:ab0:d89:0:b0:5fe:e440:bec4 with SMTP id
 i9-20020ab00d89000000b005fee440bec4mr546932uak.96.1674001577627; Tue, 17 Jan
 2023 16:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20230117230415.354239-1-richard.henderson@linaro.org>
In-Reply-To: <20230117230415.354239-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Jan 2023 10:25:51 +1000
Message-ID: <CAKmqyKMCRZiqYX9EzOkb90s=03NsBLXDyg-6Pu+sNiSyQ+PDSg@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Use tcg_pcrel_diff in tcg_out_ldst
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 18 Jan 2023 00:26:22 -0000

On Wed, Jan 18, 2023 at 9:05 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We failed to update this with the w^x split, so misses the fact
> that true pc-relative offsets are usually small.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index fc0edd811f..01cb67ef7b 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -599,7 +599,7 @@ static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
>      intptr_t imm12 = sextreg(offset, 0, 12);
>
>      if (offset != imm12) {
> -        intptr_t diff = offset - (uintptr_t)s->code_ptr;
> +        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);
>
>          if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
>              imm12 = sextreg(diff, 0, 12);
> --
> 2.34.1
>
>

