Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXWOp-0002FL-Dr
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 17:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXWOl-0002E0-Um
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2020 17:20:56 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXWOi-0003wy-SK
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2020 17:20:55 -0400
Received: by mail-ed1-x544.google.com with SMTP id a6so2965034edx.6
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2020 14:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d0UbQvo8Vb3wDc/aJyL7VyV7Y6DvIzJ3l15+MRR+t/M=;
 b=ru1c9M3EPVQKRU7OXH0NpPO9pQ7KwB+L4L/EQSJA3KWr8bk55h7RZD92/QoRflod6q
 gLLU00LoyqQIP9A4dRp3Zbg/Jnp5XLqRzkdP8jm/5UOAUWadPM1h8m0d35uQBs9twpnD
 MJcf1kI2ZVb4U6gx4jhvcHKMEevJm65bIpQBz99JYY+VwNW/SUnZLURbf9gbmotoMXLn
 DM3s9dy4F8O9RtSZpMJHJRNbdnCNAKOEDVQlxJl560Dp7QQTVW1w1XrelLgF+NZgp3+s
 LqbdMzsIkk43DwEWEGXqjF/1LaNhT6Rmz6Qh/olIUP/8DRxTFM77w3MAl0o8/I5+P8Ik
 vAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0UbQvo8Vb3wDc/aJyL7VyV7Y6DvIzJ3l15+MRR+t/M=;
 b=qLDkegLHHBbWfTlluCsk28FdhjZ5G9uTQSB+jJk5rcG53zClHkEqRy6Zc7LaGvj2qN
 fqKMcXZIOB+BOkku75uZyYTAzjtpP/LpzaIA5x1PbwCqLQkAnaItjRfnKFIxxUNSgYb+
 6HGnt8BZUrBFakN5AK0pCnnaKIwuQZxeRuyJTSeIaoJshzzyuTGKDkKcAv5/6NWnrRlD
 oEkO6EEXMzAmvIEKgK46DjuKx5ww9AiMzixuS5QXnkMlPd21fKfB8QCHZLSJxyhD9Bkx
 ffC1+O9r5nKX7GqESZpZa/74srYOW3Cnyn+K4Nr5bSPQkvTcuyV4b4NG5VjxunbOICCU
 wPbQ==
X-Gm-Message-State: AOAM530zW4jbu4Y6LNVgCF1PcJsA7XRyTKR3QJubeiqI/V1tnFzrIkoz
 EEhvVCQzPjAq+dOHAS20eQ2xREFcTsROAHrmv7MLag==
X-Google-Smtp-Source: ABdhPJxhKBsnrlh4qEzVXJOYba0Kccwr+goxR7w8UfSVC7voQImgwhCSMfw3fM3ek3Te8BbZ9eI+0eZquslGeeVBQEc=
X-Received: by 2002:a50:f41a:: with SMTP id r26mr4258583edm.251.1603833651094; 
 Tue, 27 Oct 2020 14:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
In-Reply-To: <20201026212853.92880-2-keithp@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 21:20:39 +0000
Message-ID: <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
To: Keith Packard <keithp@keithp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 27 Oct 2020 21:20:56 -0000

On Mon, 26 Oct 2020 at 21:29, Keith Packard <keithp@keithp.com> wrote:
>
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
>
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
>
> The build system was modified to reflect this change, but the contents
> of the two files are unchanged.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>
> ---
> diff --git a/target/arm/arm-semi.c b/hw/semihosting/common-semi.c
> similarity index 100%
> rename from target/arm/arm-semi.c
> rename to hw/semihosting/common-semi.c
> diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
> index f40ac574c4..fbd2841e59 100644
> --- a/hw/semihosting/meson.build
> +++ b/hw/semihosting/meson.build
> @@ -2,3 +2,5 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
>    'config.c',
>    'console.c',
>  ))
> +
> +specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))

I think this adds this file to the compilation for all TCG targets;
you only want it for targets which have Arm-semihosting-ABI compatible
semihosting. (Various other targets either don't have semihosting
or have their own ABI.)

thanks
-- PMM

