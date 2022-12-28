Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAPGy-0004Tu-Ns
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 00:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAPGq-0004T1-Es; Wed, 28 Dec 2022 00:46:33 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAPGo-0002Zd-Dw; Wed, 28 Dec 2022 00:46:31 -0500
Received: by mail-vs1-xe35.google.com with SMTP id a66so14642721vsa.6;
 Tue, 27 Dec 2022 21:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pfY6x0eckhnmkEYpbGAOTahWWnAvo1WRZbPUi5siheE=;
 b=heWkDEUflSK9pLqlFKF2OTf6nKoN4wg5YOfcIq65R0zJZIpok9m618BP82bGmnadMu
 sXSUPTnGPuS793pGzpFzvXoE+T2D9le5mttR5y+pr4MJPMxSVRHLyLFuCyU9Fv/hR0fo
 jukK+R3l4JJn48cbgTI74jmO2QXpxWwwZpGDQUTPn1o2U+MVodQwISsoj9EbSj+CW/aa
 EkuyaE0fkF6wWPQJnh4WhGmb8wy0csP5E3iufxjAAB/oHgYtLzvgWfMAmrRAacJPBvUT
 p2CXwqHEJ+OvLp80/JlWZLCRgmazurz19SpoudWUhv8rzgM/LdcfqG6hDseNpzSiRg7n
 TDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pfY6x0eckhnmkEYpbGAOTahWWnAvo1WRZbPUi5siheE=;
 b=fGQ6uUI4XCcvPjzaRWXF2nyks8hsl+pxdCBlKja05IMgW8xOEM9FghOOxFPxJjENIT
 F1z7aTzrSMnyevMUjtlMYd2TjwIbMmoj6jHzbdvDRrrs5nECyn0oLDM9VL01QMcGNx58
 P5xvngpTI2J/YKY2z896aX4n74UBrrijfy9WwUwVqqot+4jlaf2EJ6L1QCon0Z4BO+s7
 z5y/NSEVJdriCDYWa11/iBr7PATsTtrJXNApEHsl2URnb0mmntM+lPYPILP6rOKQyvrM
 8jAzgjI1FXKDfoayjq26frlhCP1DFg7WQ3zVEZtIcYYIhFetDf4JqiayhL+B9UTq+Ia4
 aQuQ==
X-Gm-Message-State: AFqh2koWHBafvyUXLLVMGUahxoomkBxUCaPDJxnI+J5lasyTQFDunmZM
 II1xQwL+USlMYng7EQOIEv8SwpDuVPKdae5sTqg=
X-Google-Smtp-Source: AMrXdXuJGyo3LDebmQg+s5DaTUk2QX+GZN0DAIlEDFOWgJ8sMN1vUOHpB2Y6YfR6JrsjqUUighX3d+w9y0naVMiHC4Y=
X-Received: by 2002:a67:dc10:0:b0:3b3:7675:d423 with SMTP id
 x16-20020a67dc10000000b003b37675d423mr2702123vsj.72.1672206389059; Tue, 27
 Dec 2022 21:46:29 -0800 (PST)
MIME-Version: 1.0
References: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
In-Reply-To: <tencent_60E46E9E0EA5052F26E07A56520177BE0008@qq.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 15:46:02 +1000
Message-ID: <CAKmqyKPhK9DpeSN0K45TBTs8T9Wo7ECSr3Bp1n=Mb-w0rm5dbA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: Fix elen check
To: Elta <503386372@qq.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, palmer <palmer@dabbelt.com>, 
 "alistair.francis" <alistair.francis@wdc.com>,
 "bin.meng" <bin.meng@windriver.com>, qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 05:46:35 -0000

On Fri, Dec 16, 2022 at 1:10 AM Elta <503386372@qq.com> wrote:
>
> Should be cpu->cfg.elen in range [8, 64].
>
> Signed-off-by: Dongxue Zhang <elta.era@gmail.com>

Thanks for the patch!

I'm seeing weird formatting issues though, it looks like the encoding
is incorrect.

Did you use `git send-email` to send the patch? If not can you try
sending it again following the instructions here
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d14e95c9dc..1e8032c969 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -870,7 +870,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>                          "Vector extension ELEN must be power of 2");
>                  return;
>              }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
>                  error_setg(errp,
>                          "Vector extension implementation only supports ELEN "
>                          "in the range [8, 64]");
> --
> 2.17.1
>

