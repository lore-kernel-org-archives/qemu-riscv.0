Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMLoR-0006JI-Tc
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 23:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMLoP-0006It-1g; Sun, 29 Jan 2023 23:30:34 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pMLoN-0003ln-MK; Sun, 29 Jan 2023 23:30:32 -0500
Received: by mail-ed1-x534.google.com with SMTP id f7so2510105edw.5;
 Sun, 29 Jan 2023 20:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sKM975hR4vvxtURam1VMgGqxqPbVKVk/vNjQBoFK/6o=;
 b=RdG3h4wsVDxV6ID03MlNm0U7bcqRDE6tOznxpXrrzui32sN9Upg6pzzgPZZXPGrDu4
 3zvzcSmnfF0O3UMAiK084POQeNENg0BcPCtigz/63WclB5rskinej6zidrD3tDr3qjqy
 MxGbTpeDWkICZ9j47N51p5itcopANs80WtNfOitfY21oCZnSuW/t6MrKy0g8s14akuoe
 XsdI767hqTiwqlQsDJvHyjcrLzXU+YkcCcDfHPdWyFg2hfvP7BL7mtPlgoTC/XPmBKxT
 ySMbOJvYWF1ZNcBPM+WbS7pTvOkkLSQyGLXqfRuiWhNW+JoSR1wUeJfv6fBU7k0I5ZwL
 rqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKM975hR4vvxtURam1VMgGqxqPbVKVk/vNjQBoFK/6o=;
 b=6w5RcI9BARxhjr4yPEDH/+d8+mBvp2dnRRaxnT6ke7YBz7tuCH7c4w+R5lG1VbCAtP
 1uQy5aYJSeMBUmbH/FO62NxWg2YmamUjysgcCfawU+v2uAJYqIm32+jMWbdWe5l8dUW+
 uTW41DEUahrsjwNQhbUMd1u4bsPUgyhsUQx0aBR1iHEdy0u52ss49WPj3pW0B3bdjYwZ
 FGpNdGn4zB5l6jwtAuE4UTdTS5dem3dj0mdgv/X+ugvVDUcW0SJ09lXI7swPHtbKpLF2
 TdIcy8Koci368tXeuc3Ykxhk+qaEmDsV7VD/C7CuNEi5LE6Rf1TsjSwyp5D3RxbJe2Bv
 X8iQ==
X-Gm-Message-State: AO0yUKVQodz7wmI0PF601ZLa+1Bzel3/8e3xHI3UoyeOm2Oc597Pn4ra
 pn3AWeNqq2XCUxyRlW42XiFdgigyTQkLAhz+1RU=
X-Google-Smtp-Source: AK7set+KSc1qeu6BPxfc7nMAQrOCM5RsuQACW+XHc8fF+2S9fh3u5n7hK9E/83V9MToi0q8VqCSwiiIwWf0zn9mo90Q=
X-Received: by 2002:a05:6402:f24:b0:4a2:28f6:984b with SMTP id
 i36-20020a0564020f2400b004a228f6984bmr1675841eda.29.1675053029719; Sun, 29
 Jan 2023 20:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
 <20230125162010.1615787-6-alexghiti@rivosinc.com>
In-Reply-To: <20230125162010.1615787-6-alexghiti@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 30 Jan 2023 12:30:18 +0800
Message-ID: <CAEUhbmU06kV90VUigQGuhnO7QEm5y8i+ZeWkQHzV2MzTLyTTWA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] riscv: Correctly set the device-tree entry
 'mmu-type'
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Mon, 30 Jan 2023 04:30:34 -0000

On Thu, Jan 26, 2023 at 12:25 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> The 'mmu-type' should reflect what the hardware is capable of so use the
> new satp_mode field in RISCVCPUConfig to do that.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

