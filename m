Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6DiF-0001WK-KN
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 08:19:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6DiB-0001VY-0t
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:19:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6Di9-0003JD-3j
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:19:19 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6Di8-0003Hf-ML
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:19:17 -0400
Received: by mail-pf1-x443.google.com with SMTP id c207so4565545pfc.7
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=on4nk2i6ftw8VFqVq8LC2lhwfsYYAuH7BbGsodRL5CA=;
	b=RddgIlE7erC+CwYqlOPKsN35+V+cd2pED4XOgGaCCWZY6ygsO+GBSzQv/NgBzP+uD5
	krXvJvb+fpK8gHwWZn5jcvUuPMCkqjOfdftd2aYmCJvEYz6VM28LbfX3a9B2gA0TCPOj
	kCcrYqW6nEq9fiJEUMC/BaW9JbV7LmomEy7/5apqzSgKtv8Br3UddV2jSYl3lGMDzXES
	67xJuBbmJGjlEUHGZ4IClC6VpzRq+OJuxiIuWHwzgPfhT7uDQweNyahsnrynKrSaSX2X
	0t+ze82RAWQnOybhTseE8g4PpkigcrqxybvVJSLvUts44Y51vyD5/V7xKpK+niT8KclM
	wCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=on4nk2i6ftw8VFqVq8LC2lhwfsYYAuH7BbGsodRL5CA=;
	b=K3Whmr6SqfZ+nhduAqCRhpTqCziTbMq22BmwwdVe1ub91QjoaaUyQHjdQaLhtoeaqP
	ObZwAK8JkbOLx1qEYqky7QuZgUonJfcn+iLvwmD9cpZplKs7l8E0pKWwIPRJGXTYJySA
	lEywl1c53TK9o5lEMYpYsGI4KE/K0q1E6OjA8R3nRcjhRonIKK3Rg0mjSUPRs4i2yGrO
	efETJcBupX1gwbSveadHQntp8HfuF0y0Vdm6qxXpSShhuMoM7KOqwxLXDQ91Z+J3l9+K
	Rr5ijXfvKLskG7Vmf1KqgHOST81G598E+zQdN5CAERHbjO8aT0FDUBVZz3ZEH2Ez461I
	U1ig==
X-Gm-Message-State: APjAAAVOQCkW5g5mSQfAaE2QIA3ZtgPGToB3JCnZrCD8wB2KMcCmUOP+
	JDae+FVMwJQ7Gj/z7y81Q/H/Og==
X-Google-Smtp-Source: APXvYqyNBIim9J5siY+FTp/d1n/ofFySOxF1iTpktl/OwRE7iwgqyzh9EmtTN2C3tJ8qV+AIVOK5cA==
X-Received: by 2002:a17:902:2aa6:: with SMTP id
	j35mr2138379plb.56.1552997955079; 
	Tue, 19 Mar 2019 05:19:15 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	r24sm4060312pfn.19.2019.03.19.05.19.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:19:13 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:19:13 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Mar 2019 05:11:01 PDT (-0700)
In-Reply-To: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	lukas.auer@aisec.fraunhofer.de, 
	Alistair Francis <Alistair.Francis@wdc.com>, mjc@sifive.com,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	sagark@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@sifive.com>
To: lukas.auer@aisec.fraunhofer.de
Message-ID: <mhng-b12b115d-057e-4fe4-a5df-9387d86c2e02@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [PATCH] hw/riscv/virt: re-add machine-specific
 compatible string to /soc/ node
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 12:19:19 -0000

On Sun, 10 Feb 2019 12:17:26 PST (-0800), lukas.auer@aisec.fraunhofer.de wrote:
> Re-add the previous compatible string "riscv-virtio-soc" to the soc
> device tree node to allow U-Boot and Linux to bind machine-specific
> drivers to it. The current compatible string "simple-bus" is retained.
>
> This is required by U-Boot to bind devices early, as part of the
> pre-relocation driver model.
>
> Fixes: 53f54508dae6("hw/riscv/virtio: Set the soc device tree node as a
> simple-bus")
> Signed-off-by: Lukas Auer <lukas.auer@aisec.fraunhofer.de>

I still had this at the top of my patch queue, but from looking at the thread 
it appears the resolution here is to drop this in favor of generic support.  
LMK if I missed something.

> ---
>
>  hw/riscv/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3e8b19c668..c53bb905ff 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -157,6 +157,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      char *nodename;
>      uint32_t plic_phandle, phandle = 1;
>      int i;
> +    const char soc_compat[] = "riscv-virtio-soc\0simple-bus";
>
>      fdt = s->fdt = create_device_tree(&s->fdt_size);
>      if (!fdt) {
> @@ -171,7 +172,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/soc");
>      qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> -    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
> +    qemu_fdt_setprop(fdt, "/soc", "compatible", soc_compat, sizeof(soc_compat));
>      qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);

