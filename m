Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOU1W-0008DE-3R
	for mharc-qemu-riscv@gnu.org; Mon, 22 Mar 2021 19:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1lOSCp-0003mf-Ph; Mon, 22 Mar 2021 17:35:23 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:55609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>)
 id 1lOSCm-0005XD-NC; Mon, 22 Mar 2021 17:35:23 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5wTt-1lI8fw48jr-007VoN; Mon, 22 Mar 2021 22:35:16 +0100
Received: by mail-ot1-f42.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso17448899ott.13; 
 Mon, 22 Mar 2021 14:35:15 -0700 (PDT)
X-Gm-Message-State: AOAM530xUWsceAcbnHYVFIQNEm/Rkpz//bpbdSvNe/tEPtOZGaZD3wwH
 8UR2Fdox77SNt8JpYcftygO6/cuHiwBE7CJAeh0=
X-Google-Smtp-Source: ABdhPJwYNpTv72zbnyElPWebbi4aZy8PUJ0JloNnvLjbDOI2WlpWRhZHTJoxRyg9l/j/IR+uYlDbunGcvlydZGaXXR8=
X-Received: by 2002:a9d:316:: with SMTP id 22mr1549535otv.210.1616448914233;
 Mon, 22 Mar 2021 14:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210322201336.9539-1-peter.maydell@linaro.org>
In-Reply-To: <20210322201336.9539-1-peter.maydell@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 22 Mar 2021 22:34:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0WJ0x3dvEg2MjNRpFXzWw=gR5wz5-7UfpTqeggxa+n7g@mail.gmail.com>
Message-ID: <CAK8P3a0WJ0x3dvEg2MjNRpFXzWw=gR5wz5-7UfpTqeggxa+n7g@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO
 and PIO windows
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:pNTT/xVPe4C4/n+IgCVjxrMKLsAGq9mT0k9bvqQEu+NrL924wHr
 YzzDPsnj6M4JRZfFGgp1Vekr4h1mI+tnv6Kv4WvZY42WEwSev8nzdArLv8hv/g1Vkfy2C7S
 5BUzwaeOg/MCdIby+S/fKrdY7n4dkXrnayQsI51kKT2rwGouKaONGSgAcgutZQCGL4ohDrb
 bbThqkHkYfSqK2KEld1YQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mlZuUCdVKK0=:dDrV90+ognQAgviNnOHEeC
 USPcXEQSiipY9AQU0R4eSvi5ksGO8rQVgHYAQ2cvqTHQzEStMyZbixwupMtasKYNsB6l6QybC
 +lz8k5pEkYnRyqTZ8l28s/ZoKN+KYzK+4myJUNvOo/2DwuUXj+4wIUh/Vdg8Hmc1iKU6Dr6BH
 I+29VlU1H5r2idhnjEXYORYU5peNvswY7sVpXJJ36NaSKpoWtMbD3fuXBVgBohUtt7bOWOjl8
 iUncfGBiasamRPAOhOLuAbx8hXuAKvDZ2A2k3T4b+kIkOqNE0+7cyqXB/uH/fCMkSiK5PWwaI
 1aXoGRmgKDAmiyWGByuHn6rXRL9AYb87ZTE6w8jJqb/ICxQ3FuW6cHoGjqfyHAKjtjwwQP3wS
 lqxNeDVp3VMN5hsLjlCkNoLoNxq0rlCogo20XLD3C/MxQD6SJhD09FVnq+Wa5
Received-SPF: none client-ip=217.72.192.73; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Mar 2021 19:31:46 -0400
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
X-List-Received-Date: Mon, 22 Mar 2021 21:35:30 -0000

6On Mon, Mar 22, 2021 at 9:13 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently the gpex PCI controller implements no special behaviour for
> guest accesses to areas of the PIO and MMIO where it has not mapped
> any PCI devices, which means that for Arm you end up with a CPU
> exception due to a data abort.
>
> Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> like this return -1 for reads and ignore writes.  In the interests of
> not being surprising, make host CPU accesses to these windows behave
> as -1/discard where there's no mapped PCI device.
>
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not convinced that this is 6.0 material, because IMHO the
> kernel shouldn't be doing this in the first place.
> Do we need to have the property machinery so that old
> virt-5.2 etc retain the previous behaviour ?

I think it would be sufficient to do this for the ioport window,
which is what old-style ISA drivers access. I am not aware
of any driver accessing hardcoded addresses in the mmio
window, at least not without probing io ports first (the VGA
text console would use both).

I checked which SoCs the kernel supports that do require a special
hook to avoid an abort and found these:

arch/arm/mach-bcm/bcm_5301x.c:  hook_fault_code(16 + 6,
bcm5301x_abort_handler, SIGBUS, BUS_OBJERR,
arch/arm/mach-cns3xxx/pcie.c:   hook_fault_code(16 + 6,
cns3xxx_pcie_abort_handler, SIGBUS, 0,
arch/arm/mach-iop32x/pci.c:     hook_fault_code(16+6,
iop3xx_pci_abort, SIGBUS, 0, "imprecise external abort");
arch/arm/mach-ixp4xx/common-pci.c:      hook_fault_code(16+6,
abort_handler, SIGBUS, 0,
drivers/pci/controller/dwc/pci-imx6.c:  hook_fault_code(8,
imx6q_pcie_abort_handler, SIGBUS, 0,
drivers/pci/controller/dwc/pci-keystone.c:      hook_fault_code(17,
ks_pcie_fault, SIGBUS, 0,

The first four (bcm5301x, cns3xxx, iop32x and ixp4xx) generate an
'imprecise external abort' (16+6), imx6q has a "precise external abort on
non-linefetch" (8), and keystone in LPAE mode has an "asynchronous external
abort". The only SoC among those that is emulated by qemu to my knowledge
is the i.MX6q in the 'sabrelite' machine.

It's possible that some of these are not caused by a PCI master abort
but some other error condition on the PCI host though. I think most other
PCI implementations either ignore the error or generate an I/O interrupt.

        Arnd

