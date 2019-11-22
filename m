Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iYHcF-00010C-Bo
	for mharc-qemu-riscv@gnu.org; Fri, 22 Nov 2019 17:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iYHcC-0000zr-Ks
 for qemu-riscv@nongnu.org; Fri, 22 Nov 2019 17:41:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iYHcB-0000zc-J4
 for qemu-riscv@nongnu.org; Fri, 22 Nov 2019 17:41:24 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:46520)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iYHcB-0000yZ-B2
 for qemu-riscv@nongnu.org; Fri, 22 Nov 2019 17:41:23 -0500
Received: by mail-pj1-x1043.google.com with SMTP id a16so3644669pjs.13
 for <qemu-riscv@nongnu.org>; Fri, 22 Nov 2019 14:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KlErY0hNW4227X/7K3YZfer053bUFpvJk9lWakDSPhs=;
 b=sjI5g7MRBVeX8zsDOp0ahBkJ5VOT0XjCKaruB0PcvbeOSD5PP4dgQGCyQzaeLP36l1
 +9iHA8WU+cJpSOX2j97lxpnLPy/OQQ/lVwBIRqFJcIgNURVFC5nyv0qLq5Gs8MMgh9sC
 Q80jCTuQGynsssFYAGwGNlOfj+AHs1O3+Mapv0F+WKuhqNu4j8Uz6cOM/b3FoOeNFUF4
 HUeBCWAK3wHbzrgsfGgjzC1gqMEfUL1iN52urZm41OvPGtNG7u1CSK93L75T2z0I0QPa
 wIvVMkKv7VqlXbXa/iNMKVhDfowDQBGdZ01AdGCuP9tFB7p+RUjvSIpBGYVNrQjrOdJ8
 syWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KlErY0hNW4227X/7K3YZfer053bUFpvJk9lWakDSPhs=;
 b=OiWWvkShgdgqC1Q4ENNbPefxsKyHJHxyth7k+345bsSnZfrmxmoBcsn78Cigy75G22
 VUHLilK/O7lxZ/1sCekqToyc7EK2FYgeQrq8hycL3zbPkjnT7gc4MHDZ5A5Ui02koqd8
 eHYCh7Vf+//foKR14bPV+cjrI8XfG2K1iL9ajSbRxyWaBZPvYUg10n8jzdAEWsJy23x+
 mgSX8NDGY5qvkkAz8CZ9E5sekYH6LVs8j3F/CzJGPHSn3HJy9TjDntAfIHCRZAcDi5D2
 mpaDxsER8K7BVRZYTUiE2bnh50tuv2SpBEfAUJwFg/dIi45NoYywVHpb1xSbtLK00BHm
 XQ3A==
X-Gm-Message-State: APjAAAWRIg/OiOJYcYOE8B72kdahwxd4csS5kNAvvLzC+Gtmi/ZWw8ZE
 IAxCAHNNV8kwUfspGNBtgX1F5A==
X-Google-Smtp-Source: APXvYqzafzdfmOf7eQOHus/oblgfFOgOk1gNtcyRJ/aCX7KY6++pciodoe6krxij0JSlzyzpkBoGCQ==
X-Received: by 2002:a17:90a:1742:: with SMTP id
 2mr21867558pjm.93.1574462481086; 
 Fri, 22 Nov 2019 14:41:21 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id j5sm8148917pfe.100.2019.11.22.14.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 14:41:20 -0800 (PST)
Date: Fri, 22 Nov 2019 14:41:20 -0800 (PST)
X-Google-Original-Date: Fri, 22 Nov 2019 14:40:46 PST (-0800)
Subject: Re: [PATCH] riscv: virt: Allow PCI address 0
In-Reply-To: <1574436472-6017-1-git-send-email-bmeng.cn@gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-9c6e7c80-7375-4bba-8ba5-7b9a6eb141d7@palmerdabbelt.mtv.corp.google.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Fri, 22 Nov 2019 22:41:25 -0000

On Fri, 22 Nov 2019 07:27:52 PST (-0800), bmeng.cn@gmail.com wrote:
> When testing e1000 with the virt machine, e1000's I/O space cannot
> be accessed. Debugging shows that the I/O BAR (BAR1) is correctly
> written with address 0 plus I/O enable bit, but QEMU's "info pci"
> shows that:
>
>   Bus  0, device   1, function 0:
>     Ethernet controller: PCI device 8086:100e
>   ...
>       BAR1: I/O at 0xffffffffffffffff [0x003e].
>   ...
>
> It turns out we should set pci_allow_0_address to true to allow 0
> PCI address, otherwise pci_bar_address() treats such address as
> PCI_BAR_UNMAPPED.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/riscv/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 23f340d..411bef5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -603,6 +603,7 @@ static void riscv_virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = riscv_virt_board_init;
>      mc->max_cpus = 8;
>      mc->default_cpu_type = VIRT_CPU;
> +    mc->pci_allow_0_address = true;
>  }
>
>  static const TypeInfo riscv_virt_machine_typeinfo = {

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

I've put this on for-next, as I don't think this is 4.2 material.

Thanks!

