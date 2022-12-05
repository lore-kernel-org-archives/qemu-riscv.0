Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2CyT-0005vm-SJ
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 10:01:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p2CyA-0005nF-6p; Mon, 05 Dec 2022 10:01:31 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p2Cy6-0004ac-2S; Mon, 05 Dec 2022 10:01:20 -0500
Received: by mail-lj1-x236.google.com with SMTP id a19so13885610ljk.0;
 Mon, 05 Dec 2022 07:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tauYCwld/bWtPoVlVy4j5NMj/bpskth3Pju78gDYpII=;
 b=d5tw/aIOuqBooKni91dDDFBFCFnQkCQOXzruJ2Fvkq8BX2jGgoqC/cHXT20qiqLSgc
 z8Qet3FZZW+he9raVLYyShH3tfwpsQ4GUGxK7nJrXbDwnIdsmopaQPcaJ196efUjz7hP
 VmlZUc3lnH2SbZrDqRslT6XuOvcKOVm3hMrpUglJ8JDp+eOHKurXCzAPhxGSxP/0Jhll
 4dZBaE7GWzqnDSZJAco2dqAr4V5JznD2XBEFb55V0DVRMy6Pw0VTRyDdzM05EdfMSTUO
 LGd6ITKwThUOQkEQgAUyL0Ny2sE8qaQHg8hh+7yQjT2HYvoXwi0YNrB3JR6jAHB96mVk
 FwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tauYCwld/bWtPoVlVy4j5NMj/bpskth3Pju78gDYpII=;
 b=BH1SjJIGAeO98HXxPKvBJafmqf3eftoMxspg2ObDBGVhSCHcub/kf5bRgPjvd+8ekY
 1CnhK6yYd0ouRGn1DlhvyvSdMQuVUWbpvubxxAwI7ux2ISjUXB+zHKvD5YUoT/IqvkzS
 ETitGlnRx7hFK61dXw29I1siM6mufAXsEeB270bYfLcRvBRidfktwY8Nf7U+ghJ+aJC6
 lmpozq2X6UrcwiCyJeeozzKq1Qi7CHzT3Vb1fmjNZ/ohPYDw3vk8oGussw0qP5ncwDmk
 bO+jS5L6942YcBvgfYOV9SNpX/13vzZ/p2TyN9197WpaOihrwR3qnypIapQAVSb3ciiq
 QwJQ==
X-Gm-Message-State: ANoB5pnGMyMMluSOa7BqMOUnTmbrcC1K1joCp5c2IWfeFgLqawbGUFOO
 ELOpSJtBYMVGEoxyxKdbsJ1X7HksqaaHsNrjuO0=
X-Google-Smtp-Source: AA0mqf52oVePZNb3PWNZPwEE+B3QxB0WW4O+o3/NUTaCcont4CiyyfmBj5a/uCLcnXWW3zDU8uP5T4tytJAoAgY0SY0=
X-Received: by 2002:a2e:9cd9:0:b0:279:d326:2e71 with SMTP id
 g25-20020a2e9cd9000000b00279d3262e71mr5937362ljj.317.1670252475884; Mon, 05
 Dec 2022 07:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20221205102509.504520-1-mchitale@ventanamicro.com>
 <20221205102509.504520-3-mchitale@ventanamicro.com>
In-Reply-To: <20221205102509.504520-3-mchitale@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Dec 2022 23:01:04 +0800
Message-ID: <CAEUhbmV54trh5VHV8ywq8KKmAMK8Lq9xY3JdXNKA+UEvpuBP2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: Extend isa_ext_data for single
 letter extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lj1-x236.google.com
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
X-List-Received-Date: Mon, 05 Dec 2022 15:01:38 -0000

On Mon, Dec 5, 2022 at 6:40 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Currently the ISA string for a CPU is generated from two different
> arrays, one for single letter extensions and another for multi letter
> extensions. Add all the single letter extensions to the isa_ext_data
> array and use it for generating the ISA string. Also drop 'P' and 'Q'
> extensions from the list of single letter extensions as those are not
> supported yet.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 41 +++++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

