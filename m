Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghdaQ-0006K5-5h
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jan 2019 11:53:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ghdaN-0006IW-Fo
	for qemu-riscv@nongnu.org; Thu, 10 Jan 2019 11:53:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ghdaM-0008ST-7R
	for qemu-riscv@nongnu.org; Thu, 10 Jan 2019 11:53:39 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1ghdaL-0008FF-Ov
	for qemu-riscv@nongnu.org; Thu, 10 Jan 2019 11:53:38 -0500
Received: by mail-pl1-x644.google.com with SMTP id 101so5428912pld.6
	for <qemu-riscv@nongnu.org>; Thu, 10 Jan 2019 08:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=lAGupiPkaMwdm8gLXMZgAZSUfqvsk1zCxuccM3Dnw7o=;
	b=D6XwDuLB9ClvjzthK1cdpQq+pS7MzdVqi9BP9Z8hCZAm6vYr7XDM0DqPmDOYUXjn6h
	KyHhqF0WV4OkkgJRuJ+Z16zQ2E/POcXJCcWOucubuYyiCrk7vd94UVXYdr0BluH4MtY5
	4WcGnTLdWuorfa5LgIDDApUrIVF0M9aWl6IeQblcitodiHebXd91F2ldwtTlz7p2vzb0
	F1iB0xoPAepVfUd/0MzR+vMk+tsZi4NJsmkaXZOG8CMVj5BE4/QhVNXRYIu1CbR+u5ta
	Qmq+9P/w0Fu8vRz8Dt0uHUIldiKhmMPWAYd3NvRTDJ8usrTuB2tKLy0J6TWCvupEtn/1
	pXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=lAGupiPkaMwdm8gLXMZgAZSUfqvsk1zCxuccM3Dnw7o=;
	b=iT1ibYBy/Vv+ub7hmk0KA/vI4dgbnyrl6b57FBsbYuvnMFEd78Nu8y8OwIVhHoO77a
	RCJKubzKK1URVsSxhJE4jxlQJj1CbpX4cU/vHCjofHj/H/IgXEUyTKAUOhUNed/RAOHa
	CCbE5KAzF97Gz1AP2RC0Hi4QsjkurFKM73L3NYV4qNCYGmoVidTQY4un78tyo/cX67DX
	2zvI7hGOIzCSJn2Dutk6uh+XK5x6xcfqcM7JFrhA2gBTZXtTAZuQVWU84DCsU74YCJXT
	oZJeakG8mUJuET79y3YY0uBNuIvTym5z2nhyFjetg2xUAc3RaZtOssBaD+oe8cW1rPsd
	dSnw==
X-Gm-Message-State: AJcUukd+Pt08lNvjf5BwLS+ZwtvZZcjX14qzTNREeM+4YnfTdFEbkkm5
	0GOSmsg00sBi9m/tjRkiz77f7w==
X-Google-Smtp-Source: ALg8bN751vQYFfrk//JTncldJDH1X/M4FTSHEzoWFsQ30OQHMiwN0KgxD20F3amsxPjnZG2QlWg85Q==
X-Received: by 2002:a17:902:27a8:: with SMTP id
	d37mr11210519plb.182.1547139210988; 
	Thu, 10 Jan 2019 08:53:30 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	n73sm122080911pfj.148.2019.01.10.08.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 08:53:30 -0800 (PST)
Date: Thu, 10 Jan 2019 08:53:30 -0800 (PST)
X-Google-Original-Date: Thu, 10 Jan 2019 08:53:16 PST (-0800)
In-Reply-To: <c162ffeb1bb1cbcdeb47ea62a829294168a0ebdf.1547078463.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
	Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-cf28bdac-e5b7-46a3-b53d-b01a329f9100@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] default-configs:
 Enable USB support for RISC-V machines
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
X-List-Received-Date: Thu, 10 Jan 2019 16:53:40 -0000

On Wed, 09 Jan 2019 16:01:34 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  default-configs/riscv32-softmmu.mak | 1 +
>  default-configs/riscv64-softmmu.mak | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> index dbc9398284..c9c5971409 100644
> --- a/default-configs/riscv32-softmmu.mak
> +++ b/default-configs/riscv32-softmmu.mak
> @@ -1,6 +1,7 @@
>  # Default configuration for riscv-softmmu
>  
>  include pci.mak
> +include usb.mak
>  
>  CONFIG_SERIAL=y
>  CONFIG_VIRTIO_MMIO=y
> diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> index dbc9398284..c9c5971409 100644
> --- a/default-configs/riscv64-softmmu.mak
> +++ b/default-configs/riscv64-softmmu.mak
> @@ -1,6 +1,7 @@
>  # Default configuration for riscv-softmmu
>  
>  include pci.mak
> +include usb.mak
>  
>  CONFIG_SERIAL=y
>  CONFIG_VIRTIO_MMIO=y
> -- 
> 2.19.1

Does this work for you?  I tried it out but my kernel hangs in early boot if I 
enable the generic PCI controller.  This is my WIP kernel so the problem is 
probably on my end.

I'm trying to boot with

    -device usb-ehci
    -drive id=my_usb_disk,file=usbdisk.img,if=none,format=raw
    -device usb-storage,drive=my_usb_dis

