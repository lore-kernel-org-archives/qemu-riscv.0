Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p1xQl-0002bl-Bn
	for mharc-qemu-riscv@gnu.org; Sun, 04 Dec 2022 17:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xQd-0002Yl-2e; Sun, 04 Dec 2022 17:25:44 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xQb-0005M4-8D; Sun, 04 Dec 2022 17:25:42 -0500
Received: by mail-ua1-x92c.google.com with SMTP id q6so3347355uao.9;
 Sun, 04 Dec 2022 14:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w4ucDnQHPCYkQuCa6pqFOfZvoEbW7H1N4VMPSNiNopQ=;
 b=R26EGkGkA9jSRRR+fKmWmfk8SVGvM7tqVLhYPV5/ze42AxL4Zkriy9ESvjvgRIFoM5
 /VpaZguZHhuvT1mRslDB+kJscWxDm3ziBigCW3fz3NiqwH5wWvanI8edo2zM+SMQkMJu
 qVY2t8XLcfvhSIGZ3qEgdzLOO2oOmLGzeuB7q6xsP/e1zKswq+cVpwxsjWTTHz3Go1SD
 cYS7dcypiwT8wfLRHqbSMBx3WYZ5GAg7kdJTDeEs9l+0I+yBF2kswdkMpkqPFuckSkvO
 5ZC9ekfzZDrddtNxRw6+SOxiSPchS/SdaYa+G0Tmrla3D2sLJH/UvGDhdKG+FOQmvA+7
 0syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w4ucDnQHPCYkQuCa6pqFOfZvoEbW7H1N4VMPSNiNopQ=;
 b=PEklxhvYNu/pBrJhKxZIAHMF4tDScCbiRmSlZshTZxaNUbcY8lIPZCKOr641RodcKC
 plrAgwqfWMF/Eq6xGttmxx/Gqe0Z8IFq48R0MFjnOEVBUsDnVxQk5EAw0l048aEyjAkB
 ySXEHKTmFDBuYMtHqjv2SDvohG815N+8Ww+ySIIYxt7wD+KF9OIN1KhPFK1tefqKFlvO
 SEB7nvtQ8DP+ll37b22o6vpgEcjxQMH85TPhv0r6VKiLGavN6/WZTXWmZOxDYxxVVUrU
 v3uXOoSTBZZv87SM6DzN291jItereWQOlGl00wZzJolg1LVc83ArzejTqNbnkkpLFIer
 HR5w==
X-Gm-Message-State: ANoB5ply7IUEY0J/UmFqGVyGo2KU/ul+ZxjfRCD6T9hVsDNoUbIdCRry
 SKaISly4keV/6cr1DHZdoY4dVujXbhFEOv+Dvr0=
X-Google-Smtp-Source: AA0mqf5ie1mvcva6VNIhGzEg5T+KoDayDBr0k/bhAXVnpJ2HNJrX74ISakG9EaGc8EmWpTPXWenu7DyHstEZBh4jOlM=
X-Received: by 2002:ab0:21ca:0:b0:419:8314:8a79 with SMTP id
 u10-20020ab021ca000000b0041983148a79mr8319078uan.23.1670192738873; Sun, 04
 Dec 2022 14:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-5-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-5-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Dec 2022 08:25:12 +1000
Message-ID: <CAKmqyKNx6wVU-akr-OdRZs3P4Sc-RCDd_HNwOUpLKAgp5OQ=dQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] hw/riscv: spike: Remove misleading comments
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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
X-List-Received-Date: Sun, 04 Dec 2022 22:25:48 -0000

On Fri, Dec 2, 2022 at 12:14 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> PLIC is not included in the 'spike' machine.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/spike.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 1e1d752c00..13946acf0d 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -8,7 +8,6 @@
>   *
>   * 0) HTIF Console and Poweroff
>   * 1) CLINT (Timer and IPI)
> - * 2) PLIC (Platform Level Interrupt Controller)
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> --
> 2.34.1
>
>

