Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuWMx-000278-7R
	for mharc-qemu-riscv@gnu.org; Wed, 30 Dec 2020 02:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuWMw-00026w-CC; Wed, 30 Dec 2020 02:58:06 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:40218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuWMu-0008SZ-OO; Wed, 30 Dec 2020 02:58:06 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id b64so14270883ybg.7;
 Tue, 29 Dec 2020 23:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qoejv6PnFfPiqXqUqNkC2K/TkRQ90+2toy1pgg7JhlU=;
 b=H9lUsBJ0yLH1Z7J2jeuKTXe8iMmcH/j5sgTaDCD9HbBTqeu9QR6LycS+tDvFKUrz+s
 lCwMO5oITZr3orNbu0mfaZTLkcYwWmcydx0qj0H2GG2Y3lq3S8oafd6vE18maOpA6xEu
 xQVcTTS1itHjigiBwiyBA7CmOAJsw+NdpKmxJMH9vsek/6jsm7KLTNJRLblSXFcEtayA
 2jB8vFWzCA9rTXXSDbQNFg/3G11hauO/j7uixMxy/yC8oFNLn55kFiCfLRlf07c59zEc
 DYfWtZLPfhEOJFN7zvdijyD83DsYM5YLZ9b454WlqvLy7Tm3L83iLvtThdiYu2c6o2J6
 fu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qoejv6PnFfPiqXqUqNkC2K/TkRQ90+2toy1pgg7JhlU=;
 b=k0Qb4/imG9NrdUFgFJjwoBmtV4PjAO/Vi5srxcY2y2yvpFNh8aQJzyKuk6qFT4u48w
 JjH6xM6suq5e7z1OWg0qG2SYRFbIcfamrkrZ1lwcjqGx7gnwS1nLM3ygiywLupsMUrQu
 YECEb/aw3Gs0bfVqrIllW0A94h2ZheO2Bfl4tqHhLgtD0J7QplraP4LZZdl5puppiVse
 nVeCCw13R7KroxnrDm6lqZBRG5K8zT92HrH4haBfzRjC2cZtVk20nGRQe5ckhhx4ot36
 DO0XFAWEv40qq6E4tIDs8gzo38bRYfKOH2IU0QG1QIiXVmg8D0f3/GsOyNMmIyKaiAwW
 O8Ow==
X-Gm-Message-State: AOAM533QBnkJX1fQCjj73S2b+n/cKdjMvendJDeKtslCUAc83kLCv/8h
 DZip49Ze3e4OM2SP7Cdr/oMIX/1saQdh1NUTeE4=
X-Google-Smtp-Source: ABdhPJxoH3jdNegM/8dklh/hMCbu9KpTS7P+RZyRNvSLWtIHZa42/7X9XdFKt+z/n9KoMRATlmxFv+8TvvqW6uNgRaw=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr71014019ybi.517.1609315083101; 
 Tue, 29 Dec 2020 23:58:03 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-DTG1yU-z4SF-+nBeEJUWdx5gctLMSNp8f1+_7FpWG4aA@mail.gmail.com>
 <CAEUhbmV5oMNW3fS7v81vgB-j0NbAnRnMB-ehm5BT8rk4uWGdYg@mail.gmail.com>
 <CAOkUe-BWEVpzwHLPzUMzuUK12RQdUds-tCEWcyhrZeWDh9AaHw@mail.gmail.com>
 <CAEUhbmWcNqNMzipVvYMgVsJH7dTwZv8qMYFdpzvCSNRGVH0NsA@mail.gmail.com>
 <CAOkUe-DyJLEiHK4hmxEtfVwTV_3rb-RXAgRS2Ojtk5krctVBGA@mail.gmail.com>
In-Reply-To: <CAOkUe-DyJLEiHK4hmxEtfVwTV_3rb-RXAgRS2Ojtk5krctVBGA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 30 Dec 2020 15:57:52 +0800
Message-ID: <CAEUhbmVMXNwGGZXVk_vKeXP1=-HZNK4PVNrTPjozd9weMR+RcQ@mail.gmail.com>
Subject: Re: [PATCH] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 30 Dec 2020 07:58:06 -0000

On Wed, Dec 30, 2020 at 3:42 PM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Target description is not currently implemented in RISC-V architecture. Thus GDB won't set it properly when attached. The patch implements the target description response.
>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

Please specify the version in the email title, like v2.

Otherwise,
Reviewed-by: Bin Meng <bin.meng@windriver.com>

Regards,
Bin

