Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA03D1BDC5
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 16:39:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t806W-0000kV-8P; Mon, 04 Nov 2024 11:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t806P-0000jp-Qz
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 11:38:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t806N-0003C1-9U
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 11:38:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso3525068f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Nov 2024 08:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730738329; x=1731343129; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fXdY23zSMIOxlisonKVew/D+w5UQnBSolsTL3tXLl+o=;
 b=Xw7SgvD6Bj5ovIy51e73/fCB52dYDxUgD6arPn8dMerminCNUx0vfox5syuuar5ROy
 B0SNrnt9/ExgwzVLPDl0GplM+T7tuhjRPBI3DAeI9xjZZe7o7zzLloUTZ0j9aV3WNPaC
 MlVaUsG5zTcssIlacmyXi/pb440U9VhhdVJZhYOQ1D2xnRZnBayG+rd6W31AOloCpONo
 FDT6SrnxHux8hjnWt+xjcjkDX7wv04vLzrsg5zNQ4XNld/qOBrqbGFE/ZBOfFyJesYpg
 xPY6igYZGcUr8p0zpqH8dmZpabQL30T7uHEHbYJ28KhhwvdhmPqYQ5ljOxB63ieUuVj5
 f8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730738329; x=1731343129;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fXdY23zSMIOxlisonKVew/D+w5UQnBSolsTL3tXLl+o=;
 b=SAu9setOvjwE3YYwXFUk20WDV7rQPbG5Hqe9ug+HX9VBgn6/KhUPM/yuzJ69ufdXm9
 X1UD7IBMzZOBF36138g4WY57czjKsqX6/wb2LlkroHzVXHNLK/Vb8xUIjSa8F+QOY5iH
 g3TbnKGVkF/qvHHhFFB0u9QpJZIrbqRi0/Dl/pygzmfUch6hFWL/GiEcLE4YXh6kQJoa
 EShVWEWihVaV8JVOPC87eYn+VJ8JzpgHEp2hDuWoNII+CZDSrzG8LoKQo1u3tRKa+6ts
 93JG7XdPwacOWt+qbNZBbkr6DY8NfygVcbKmC9XVBk7Va2lyKmWbIVMAG7nL6aUfFbI8
 IvSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2SUSF+iwfSt+M9s/Zv3ISXBbI1nCr48k3XfCZp4pvIHY0MzOW11bJnloeeIshRmItu/DCgU3hHEN6@nongnu.org
X-Gm-Message-State: AOJu0YwhkUptuH7EZ9lwZp19hjQ/6yLJ7JH4a2NNP/jLmE5Xbg92c2wk
 LQy/Fg0ULmzECIQrIt1k119ogj3syBFqenKx74YdAz9RGLB1GrUaWKfEXBqILrYKArTdtAC7o1y
 F2DbeikNbX2nfM+3EbUOxty97TZIv1R/i/U6rtw==
X-Google-Smtp-Source: AGHT+IGsR7nnVO5svFFhdHh94HtSd/pkYdD8et1+URk6CDOu917YA6x1iDZVy5BMf96keIQQ1JD2/ZlSoPTrP3NQim4=
X-Received: by 2002:a05:6000:1446:b0:37d:52db:a0a7 with SMTP id
 ffacd0b85a97d-381be7adcf9mr12674763f8f.2.1730738328924; Mon, 04 Nov 2024
 08:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20241104163504.305955-1-thuth@redhat.com>
In-Reply-To: <20241104163504.305955-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 16:38:37 +0000
Message-ID: <CAFEAcA9RjN+bZ4PWMBwrF7GosKpWg=oVyHb7kfK0anW2a4Ww3g@mail.gmail.com>
Subject: Re: [PATCH] hw/char/sifive_uart: Fix broken UART on big endian hosts
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

On Mon, 4 Nov 2024 at 16:35, Thomas Huth <thuth@redhat.com> wrote:
>
> Casting a "uint32_t *" to a "uint8_t *" to get to the lowest 8-bit
> part of the value does not work on big endian hosts. We've got to
> take the proper detour through an 8-bit variable.
>
> Fixes: 53c1557b23 ("hw/char: sifive_uart: Print uart characters async")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/char/sifive_uart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

