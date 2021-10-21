Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdSaQ-0002uE-KN
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 03:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSaL-0002rt-I6; Thu, 21 Oct 2021 03:33:57 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSaK-0003Q2-5K; Thu, 21 Oct 2021 03:33:57 -0400
Received: by mail-qk1-x735.google.com with SMTP id x123so6307568qke.7;
 Thu, 21 Oct 2021 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y3C63pHISOqd/oJurThrVK9ofOtOPHn01WRd7tblJxY=;
 b=lhDRa0DxPLUj/s7Pfcvhk69cKHOmnApfu6S0FYhREukmnJe4jQ0j/LZ30l1h2KjuEq
 SJuZ/q1pJbC1kSnozUGwE1bgk8X0AZDg+P6Js3XN7YgR/hXSoAlfrluNoQMysvQs7g4y
 0l/A4aWB+6vFLFLDrKQPVsHTh/L9S7ZNZB7cpnGc2kuf727JjxIXdXinPApiPNJQ+czf
 XQROrgU1+e/IopCj2DDcjv0iKq0NzYMADRt9Pnwq1Dx8DyTOVjSLNJ0ZRY8M9JQqWv4J
 BoP5gK29a5TByfoung/qDptP4geTqmy936svzT3svcHJNOfESu3JCKGvuC3sjVAmMTUy
 46zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y3C63pHISOqd/oJurThrVK9ofOtOPHn01WRd7tblJxY=;
 b=8EeFpkX2SB9wZHi86b6aXoRnZDMbz28ueUif+pvdgsBCIs/XKTjMLRwQJwiWweqfDp
 Vj0rGBEkBYItI61A3dA28b7AHCyToFEHdoR1lenqraZDUFgET7ocb5N/NDqV1aw+Apwg
 kNMvJswQXc1PFQ47TnxmAYoQFwrA9IvKyYSv7lOhxNohQw43vi8hppg4BlWJnaDEgN9O
 44VHRE6ZE0tk2wH1X8UnLxXwnzu9GaXC9DtQsEoyBcF6SSSIpTpR332IqXlbtmQQAiYJ
 tSLj6dsihAoVanb91HcIsBTw5xDQOOeiN+Y2qrpJXYF3TPNZ02QLxLQooUfDPIb68oTU
 64bA==
X-Gm-Message-State: AOAM531RwUNBrHfRuKwv2r9nFtxZw8t5dSQH67nYsGwdvq3O3cdZHeR0
 zEDDyVYRTgqGHVtLS/+YJBhkY+An8eNXcwHWdA8=
X-Google-Smtp-Source: ABdhPJwclbwF8xvCVIJSW3ExJYReQo1JZcQWJZdbC1dycltghRLgyA6IWZ5RfQBvmh+/hrSMMKkRpiGiPhQ5MtfPNHU=
X-Received: by 2002:a25:c0d2:: with SMTP id c201mr4470201ybf.467.1634801634848; 
 Thu, 21 Oct 2021 00:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <4200da222a65c89ed1ba35f754dcca7fdd9f08d6.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <4200da222a65c89ed1ba35f754dcca7fdd9f08d6.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 15:33:43 +0800
Message-ID: <CAEUhbmUuTNYFDy=84xxQbtp7hy=TwGmLXK6YATa076tGW7Ddug@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] hw/intc: sifive_plic: Cleanup the irq_request
 function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x735.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 07:33:59 -0000

On Mon, Oct 18, 2021 at 10:39 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

