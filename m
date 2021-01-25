Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4Bgd-0002Qf-OT
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4Bgb-0002PS-Sv; Mon, 25 Jan 2021 18:54:21 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:38047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BgZ-0003m0-Fz; Mon, 25 Jan 2021 18:54:21 -0500
Received: by mail-io1-xd2d.google.com with SMTP id e22so30267932iom.5;
 Mon, 25 Jan 2021 15:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=puB/xlPKDy2xxo8KuHU7/paIIYS2rKgPopeyNnrl7KE=;
 b=nhoIj3IhDsHpnIAcI+2jAPzInt7URsK8fsnoNMoMHCyTZtfzpL3K7X1TGjYjLhPOdG
 8b6yZY75rX97j4V9iviTw4Cz+HaUfBOuaJJDB58uXAJ9XV4vF0KCCyGOu3+L2H/T2ie0
 vafWxQmmlYYdXLekrIG2IBZ1kSHbFRWObTVxvDVz/tG5eEFJMYPUjy+44dukWA+b2s6B
 VFFrdtRb4a/PFJls3OQr5NW3hdPjBgGpRv/feAL7Ht22Y2+gym4xeDYgZJeA4kzw7wT8
 07clXVXL/ljMyzY5ykdAMd6qIWmzZVD2dJBAAVs9dLdu4rZ28mqD5o1AxwIs/ZD1yiU1
 5CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=puB/xlPKDy2xxo8KuHU7/paIIYS2rKgPopeyNnrl7KE=;
 b=pYGs0t5hudSbWID8PtQrMVFbhQgnUdyESPoSvRR9Tsmetz8XRMPQs2qL+L4bhk/2PF
 cGFsj+PeWLlNzfzE+LPeareg+mZhr5vlBVmYi82MQSSuOhJXzewpDCAl8OW6T1U4HO4V
 8rryBgf98Hc9sH7TXLRG5mo5vQbWq4epYRtKZcFWLTmBBrQV325a1qEXbjQ9GgIA4CtE
 0E5Z0Co92rhOifABdMiwXB8WHXwjDY4zk7Mt3JeuRkwg7g6XFTYRPUoEkj4Fb/VmAXLH
 l9AQVwmFj1POghDjB/2K5sN6TycPiF8sIOBsmd0DXKTDn6LMOcM3f6fs8aLWmEdGf3L2
 w/QA==
X-Gm-Message-State: AOAM532jqo23Nxnw+crT5mNPcrMyo1jUvvRtJVgvU9PNi6zpQkQYFKHr
 ZqxIPQDibRBfe9aEZKb/5cTwR+ahHZiFc5jGUNU=
X-Google-Smtp-Source: ABdhPJz3v2hfWQ9O/gzeyeS5X0MNGVWHTdtVSWLJLTxpzdRExvXaUd0t4rloZqcIKsuYU9/I+xyJMKUhDPQrRbd3BJ8=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr2406260ild.267.1611618857622; 
 Mon, 25 Jan 2021 15:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-69-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-69-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:53:51 -0800
Message-ID: <CAKmqyKM-XPcGMo0Z0549ojPSKqCbW3bq4+77JnzV5WQGS2Q3Fg@mail.gmail.com>
Subject: Re: [PATCH v6 68/72] target/riscv: gdb: modify gdb csr xml file to
 align with csr register map
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hsiangkai Wang <kai.wang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 23:54:22 -0000

On Tue, Jan 12, 2021 at 2:50 AM <frank.chang@sifive.com> wrote:
>
> From: Hsiangkai Wang <kai.wang@sifive.com>
>
> Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

This patch won't apply any more, we have removed the hardcoded GDB
register list.

Alistair

> ---
>  gdb-xml/riscv-32bit-csr.xml | 11 ++++++-----
>  gdb-xml/riscv-64bit-csr.xml | 11 ++++++-----
>  target/riscv/gdbstub.c      |  4 ++--
>  3 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
> index da1bf19e2f4..3d2031da7dc 100644
> --- a/gdb-xml/riscv-32bit-csr.xml
> +++ b/gdb-xml/riscv-32bit-csr.xml
> @@ -110,6 +110,8 @@
>    <reg name="mcause" bitsize="32"/>
>    <reg name="mtval" bitsize="32"/>
>    <reg name="mip" bitsize="32"/>
> +  <reg name="mtinst" bitsize="32"/>
> +  <reg name="mtval2" bitsize="32"/>
>    <reg name="pmpcfg0" bitsize="32"/>
>    <reg name="pmpcfg1" bitsize="32"/>
>    <reg name="pmpcfg2" bitsize="32"/>
> @@ -232,12 +234,11 @@
>    <reg name="hedeleg" bitsize="32"/>
>    <reg name="hideleg" bitsize="32"/>
>    <reg name="hie" bitsize="32"/>
> -  <reg name="htvec" bitsize="32"/>
> -  <reg name="hscratch" bitsize="32"/>
> -  <reg name="hepc" bitsize="32"/>
> -  <reg name="hcause" bitsize="32"/>
> -  <reg name="hbadaddr" bitsize="32"/>
> +  <reg name="hcounteren" bitsize="32"/>
> +  <reg name="htval" bitsize="32"/>
>    <reg name="hip" bitsize="32"/>
> +  <reg name="htinst" bitsize="32"/>
> +  <reg name="hgatp" bitsize="32"/>
>    <reg name="mbase" bitsize="32"/>
>    <reg name="mbound" bitsize="32"/>
>    <reg name="mibase" bitsize="32"/>
> diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
> index 6aa4bed9f50..90394562930 100644
> --- a/gdb-xml/riscv-64bit-csr.xml
> +++ b/gdb-xml/riscv-64bit-csr.xml
> @@ -110,6 +110,8 @@
>    <reg name="mcause" bitsize="64"/>
>    <reg name="mtval" bitsize="64"/>
>    <reg name="mip" bitsize="64"/>
> +  <reg name="mtinst" bitsize="64"/>
> +  <reg name="mtval2" bitsize="64"/>
>    <reg name="pmpcfg0" bitsize="64"/>
>    <reg name="pmpcfg1" bitsize="64"/>
>    <reg name="pmpcfg2" bitsize="64"/>
> @@ -232,12 +234,11 @@
>    <reg name="hedeleg" bitsize="64"/>
>    <reg name="hideleg" bitsize="64"/>
>    <reg name="hie" bitsize="64"/>
> -  <reg name="htvec" bitsize="64"/>
> -  <reg name="hscratch" bitsize="64"/>
> -  <reg name="hepc" bitsize="64"/>
> -  <reg name="hcause" bitsize="64"/>
> -  <reg name="hbadaddr" bitsize="64"/>
> +  <reg name="hcounteren" bitsize="64"/>
> +  <reg name="htval" bitsize="64"/>
>    <reg name="hip" bitsize="64"/>
> +  <reg name="htinst" bitsize="64"/>
> +  <reg name="hgatp" bitsize="64"/>
>    <reg name="mbase" bitsize="64"/>
>    <reg name="mbound" bitsize="64"/>
>    <reg name="mibase" bitsize="64"/>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index eba12a86f2e..f7c5212e274 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -418,13 +418,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>      }
>  #if defined(TARGET_RISCV32)
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> -                             240, "riscv-32bit-csr.xml", 0);
> +                             241, "riscv-32bit-csr.xml", 0);
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
>                               1, "riscv-32bit-virtual.xml", 0);
>  #elif defined(TARGET_RISCV64)
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> -                             240, "riscv-64bit-csr.xml", 0);
> +                             241, "riscv-64bit-csr.xml", 0);
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
>                               1, "riscv-64bit-virtual.xml", 0);
> --
> 2.17.1
>
>

