Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93707C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 07:41:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r1M88-00060B-Md; Fri, 10 Nov 2023 02:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1M83-0005xA-Gq
 for qemu-riscv@nongnu.org; Fri, 10 Nov 2023 02:40:36 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1M7z-0000Va-PK
 for qemu-riscv@nongnu.org; Fri, 10 Nov 2023 02:40:35 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so2802055a12.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Nov 2023 23:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699602030; x=1700206830; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w1cQVy8Tdk0u30Y5Hhr0erXikh+ihShfX7wQfHbqGoc=;
 b=EVZQ5KJTan5SjybH/nswY3T9SefEDfekfkrBj9a/ZkNCjb+SrjDy6/lyTp8mwAZhD/
 87swST3f5VAQLd6Mi1tvifFJ0XsDMb8bdY+aJ22cp0b0MVwuTr0n/58I4OF3yA587A6w
 /Eyx7qlG6sYjAnwQY7mJ9f+f3TPiAEljNt1wjH1pgHvFUQYlbNn8EaJ7YnPrICx/ysjc
 GZYHOTAfA4HwdTcqVHdx/cygNVEk/9JsetmFfo3MZl+5wDz4iUJ7O3vA0L4IxXJE6SFH
 UYPWprBkjqQ+aLvnaVzNXcS8uzoRG7U+cdNg0BMbUxAEdXgn39s1eTUDDXKf9z2ZWXAi
 LNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699602030; x=1700206830;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w1cQVy8Tdk0u30Y5Hhr0erXikh+ihShfX7wQfHbqGoc=;
 b=u6hy/Zqo5rcmZkORq1kKREY9EBNbyKp0FqcKgMICg0e9alMbcg8dba6crtNoPpI6rQ
 aHHEPaSfZORI+GtVKdTTrlQgMKIWy4tzDfB4NZ/fFSYM73uuQYFUxQwtjM6oMvtbVdTw
 UdK9S5IMuQy2zSkeXmg1OVeCpYEqQYRAhweBwUXxhrMBhR5N8f/4QscnFExhklKzeOxb
 OlMHpLqvfYveDo65iE9rfHBCpondtUl50qACg0UJg+Yd3Rvq67GQPGMXI91uzO9BusAv
 7NKG2AuiSPnfdnwZ7nbhqu8Ui4U8h2PIQPgxPNd/cWCc3mgpajUk1z3LWoR1KIhakNOl
 hcww==
X-Gm-Message-State: AOJu0YzrFKIg6MrPRm1aFhBIK8sdTCdt9uZ0fDJku7PMDe2nKuJ7uQkw
 EV94BCAH/lDJ6UOGCWA6/LY9jg==
X-Google-Smtp-Source: AGHT+IFiynhjKq3A77rBORXMoLsYOtp3N+GMcbcfs+ylkUNpnOvZIjAqXdE960vvYQGNOoGt3u62WQ==
X-Received: by 2002:a17:907:9287:b0:9c7:5a01:ffec with SMTP id
 bw7-20020a170907928700b009c75a01ffecmr6368674ejc.0.1699602029914; 
 Thu, 09 Nov 2023 23:40:29 -0800 (PST)
Received: from [192.168.69.115] ([176.187.194.109])
 by smtp.gmail.com with ESMTPSA id
 qt19-20020a170906ecf300b009a1be9c29d7sm3567178ejb.179.2023.11.09.23.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 23:40:29 -0800 (PST)
Message-ID: <34e2c0c6-4e04-486a-8e1f-4afdc461a5d4@linaro.org>
Date: Fri, 10 Nov 2023 08:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.3 v2 05/46] hw/i386/pc: use qemu_get_nic_info() and
 pci_init_nic_devices()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20231106195352.301038-1-dwmw2@infradead.org>
 <20231106195352.301038-6-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106195352.301038-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi David,

+Markus/Bernhard

On 6/11/23 20:49, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Eliminate direct access to nd_table[] and nb_nics by processing the the
> Xen and ISA NICs first and then calling pci_init_nic_devices() for the
> rest.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/pc.c                | 26 ++++++++++++++++----------
>   include/hw/net/ne2000-isa.h |  2 --
>   2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2bc3fa52d..4078d2d231 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -652,8 +652,11 @@ static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
>   {
>       static int nb_ne2k = 0;
>   
> -    if (nb_ne2k == NE2000_NB_MAX)
> +    if (nb_ne2k == NE2000_NB_MAX) {
> +        error_setg(&error_fatal,

In the context of dynamically created machines I'd rather have
this function,

> +                   "maximum number of ISA NE2000 devices exceeded");
>           return;
> +    }
>       isa_ne2000_init(bus, ne2000_io[nb_ne2k],
>                       ne2000_irq[nb_ne2k], nd);
>       nb_ne2k++;
> @@ -1291,23 +1294,26 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus,
>                    BusState *xen_bus)
>   {
>       MachineClass *mc = MACHINE_CLASS(pcmc);
> -    int i;
> +    bool default_is_ne2k = g_str_equal(mc->default_nic, TYPE_ISA_NE2000);
> +    NICInfo *nd;
>   
>       rom_set_order_override(FW_CFG_ORDER_OVERRIDE_NIC);
> -    for (i = 0; i < nb_nics; i++) {
> -        NICInfo *nd = &nd_table[i];
> -        const char *model = nd->model ? nd->model : mc->default_nic;
>   
> -        if (xen_bus && (!nd->model || g_str_equal(model, "xen-net-device"))) {
> +    if (xen_bus) {
> +        while (nc = qemu_find_nic_info("xen-net-device", true, NULL)) {
>               DeviceState *dev = qdev_new("xen-net-device");
>               qdev_set_nic_properties(dev, nd);
>               qdev_realize_and_unref(dev, xen_bus, &error_fatal);

and this one non-fatal (primarily for API example). But this is pending
on a discussion on another thread, see:
https://lore.kernel.org/qemu-devel/c1322f3b-2ae2-4ca7-9a76-a2a434dc8315@linaro.org/
so no changed requested so far.

> -        } else if (g_str_equal(model, "ne2k_isa")) {
> -            pc_init_ne2k_isa(isa_bus, nd);
> -        } else {
> -            pci_nic_init_nofail(nd, pci_bus, model, NULL);
>           }
>       }

Regards,

Phil.

