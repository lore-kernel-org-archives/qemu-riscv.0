Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pB1Sj-0001Bz-Qu
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 17:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pB1Sh-0001BO-Rv; Thu, 29 Dec 2022 17:33:19 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pB1Sf-0001h7-KW; Thu, 29 Dec 2022 17:33:19 -0500
Received: by mail-vs1-xe32.google.com with SMTP id h27so6065229vsq.3;
 Thu, 29 Dec 2022 14:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u/Hj8yLAE6eL6Ywx6KMsE9l8eI5QjS6kzFJSYql0Wp0=;
 b=EcguO+EJ0K06nY8/itmYt4MwUYeL/9UWaxtJUfBwD+14OotXSebwli6WCgIdTLV4BK
 BjVs75Gt3ec/83FV7iSL/ahXevyU0KUsX2OgEqPi5rOGjVtS5tlrsLFjv5FGl+7NorI6
 UHQmPNQzW8XcPp9NjjE55LzJBy2N/07RdZZ2oq0QSenrRAiK2rK8hp1i7pro4s3/6RUY
 RD1FmnHQCWL5xhrvdSWVXmrH9YwlbbF1MIQvD+iwaGY8uKlee6cWRpcLc/H2ny8R3tFY
 q1ePpTem5uipjIZo+1gd7/R0V+D2IIVjxL2XWQf3UZufwAJ+csVXncONFNr1zlc8F17O
 wjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/Hj8yLAE6eL6Ywx6KMsE9l8eI5QjS6kzFJSYql0Wp0=;
 b=j2Ls9ET4CShjBzQrqccJ/ix/bEgMI0/q7rIp+fILAOpD/VKHDGky0qXyS1GhtP2gpM
 TMDVRAQutF8x+MrIQ3SBuZsBKU0keR3qaed6Mlo7MHF1UKkllob27v9DXJWgAZEnq6fH
 pBHhbhhTg6Gazfk3svgLxXvhFIu7IJHuwz8iQfZ4USJSyf1LyWVrRh/4k08tp5R8lKdu
 4XjWuxixLRnvqI0RiOx9q41NG9gZLwThKqPQDaHNfHK4gzE3dyLE3OGhqtbq6r5XOs+9
 wYgzecmPTazPr7jwEzeMtTg7sEa9Gj3ss+EDirL2Lvond0c7QYE9nyIQFajarWymVL5p
 knOw==
X-Gm-Message-State: AFqh2kobcZTYX6uRVtSbFSy3pM2LnVLA0wtibGdT+QWS6EdcaOx+OETM
 u4AjfGJcpnVsHpllJ8wJc+G6S4sytOzvvSx8ya0=
X-Google-Smtp-Source: AMrXdXvlk0gxyLc0iSOpLoLxjbqAiOvWwoAjNDtd2DPpjV7+1R0qA7HOVGD8xIkTz3zq0c2DvhzU8qH3T3fTEenhhw0=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr1457890vsv.73.1672353187803; Thu, 29
 Dec 2022 14:33:07 -0800 (PST)
MIME-Version: 1.0
References: <167221089290.19963.15278757025657303819-0@git.sr.ht>
In-Reply-To: <167221089290.19963.15278757025657303819-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 30 Dec 2022 08:32:41 +1000
Message-ID: <CAKmqyKPALG0ojtAMzR1-fvNCBMzz_UFtJDRyk20=giw5Ca=yVg@mail.gmail.com>
Subject: Re: [PATCH qemu] target/riscv/cpu.c: Fix elen check
To: "~elta" <503386372@qq.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Thu, 29 Dec 2022 22:33:20 -0000

On Thu, Dec 29, 2022 at 12:34 AM ~elta <elta@git.sr.ht> wrote:
>
> From: Dongxue Zhang <elta.era@gmail.com>
>
> Should be cpu->cfg.elen in range [8, 64].
>
> Signed-off-by: Dongxue Zhang <elta.era@gmail.com>

When sending a new version can you please add any previous reviewed tags.

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6fe176e483..5dc51f7912 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -872,7 +872,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>                          "Vector extension ELEN must be power of 2");
>                  return;
>              }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
>                  error_setg(errp,
>                          "Vector extension implementation only supports ELEN "
>                          "in the range [8, 64]");
> --
> 2.34.5
>

