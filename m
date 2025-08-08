Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F04C87FCB
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 16:29:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukPyA-0005rh-8S; Fri, 08 Aug 2025 12:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPy5-0005m7-D6
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:29:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukPy3-0003fZ-S1
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:29:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bece40fcso13147055e9.3
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754670558; x=1755275358; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XhVLTNJcWQ9Xfp0MistoB4xDcUzTDPT9DI8lMRvFw5w=;
 b=c54mAZPS5KihdgI3iAaME3w2UteHstDBb1DwDmag0qk2x4KNL5zEkwVDrgB6YnYLq3
 G8+QkTRqJg0pX7G6iiG840Xk0Ax97TgKGKRXF72usE65rjvH25P4gs+blSNO8xj7Tg4B
 dtyDHi8nelIsMOY/3MrA7JYllB5O9rR3/AV0HO8QV8OydjPFaKYiFuS0mm1KPpdpGedJ
 RpkzPQdXqfWaRV1fS/2Qr3HFOCJY4Atg10C6tcOzQy2AoxWlv/IqH1o2R3LMW/OQIwoS
 YtbRp217zFmJgNaDbQ7dU6mnm3WCiRW8JubS1a+W1H0lF8iUp42Zkrqn4GNVaFxqxOUW
 PJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754670558; x=1755275358;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XhVLTNJcWQ9Xfp0MistoB4xDcUzTDPT9DI8lMRvFw5w=;
 b=AkbgXpI4/YNKkUeRvn030Smq/3ZGCkwsJVuPZTPHiGX6rbdTqiSlWvbiz0XitusLW5
 qdNX7doE+fjDupVrH0YwCn1Ab4NdWnv8sN+ZsEP6rdXeKW7VE7jZJs8rcxaACc4EBeBo
 rr2A/CIH837ct11Z8sLoSQPpHlYiUJrcczddSgS8a3QvfwDCKVPXtx/njHyX+IOy4tYo
 6JijABLeyoe0wtCDoTxL5RWiP2ydg/5XhLU9jUiIBC0QMwVf6mwpA12L7v5nbYeMhJRk
 USpoPniiydGzjPbt76bVoTwCXNynBPneWJM7nd9W1s+z8Ab3Q3Zm91czbZ6C4EOXZtNt
 yptw==
X-Gm-Message-State: AOJu0Yx/bqXbCr+ms3xDn5mhwbe5cC0fBcM0rCNffCPvVKWHVQg3ltBS
 L8EZdyyBQe+icMh5mJOgVY9zA/UHuzQzdJCTOJLAlnatlGOJbnWAtuG13r3ebk1OHiU=
X-Gm-Gg: ASbGncv0eQp/jOmzzo9WzVjdZke5Wd63Gqnb+Z1PUsb3Ll6T0uVhFr7An0odIoWkFIN
 Y5IPvIKNnZ8w4GV4d22N5KfryvjyevRZXBR9SC4c4yaAHlRmAkQAEHDft2uKGvkZmNZgoob21gY
 WxZrVchY26gr4dwA+xSP4wMllfA4gR2sX9EVMT+t9rdnX3TTPDGLGiUMiJVT2nDvmV/pCm+iM1V
 D/K87utYgYF3QQjFp112SJBsObjvpvzrr6oqi6p9NUER7ZF7Lo9GY6zqLErkUwDChz7Jy7AqDpv
 HghtVaOCAkt73ieHwLdYn46uYXzWXcqcpuMBcKjKbJEgiRF7XAbusZIC5Nvl/6ZQ75SF7jyo2p+
 vncKUXbzeknaMwVOZocoXuRcczTDQnWBLFEp2lSFl+OvKOcbf44RDpF6RypdCKFgnoQ==
X-Google-Smtp-Source: AGHT+IE0UqaZGAfmznke7q+KKEA244bejtNySxO+hYNRTewcAVQtUZSySopHpDtyTFdATUbSCzomzg==
X-Received: by 2002:a05:600c:3589:b0:456:24aa:958e with SMTP id
 5b1f17b1804b1-459f4e9e4c9mr35163675e9.0.1754670558081; 
 Fri, 08 Aug 2025 09:29:18 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf0csm30203019f8f.14.2025.08.08.09.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:29:17 -0700 (PDT)
Message-ID: <89d0c3e5-9a86-4230-936b-9d3b3d53ffdc@linaro.org>
Date: Fri, 8 Aug 2025 18:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] hw/pci: Allow explicit function numbers in pci
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
 <20250717093833.402237-13-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250717093833.402237-13-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 17/7/25 11:38, Djordje Todorovic wrote:
> Since there is no pch_gbe emulation, we could be using func other
> than 0 when adding new devices to specific boards.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   hw/pci/pci.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index f5ab510697..23f7f02837 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -974,14 +974,15 @@ static int pci_parse_devaddr(const char *addr, int *domp, int *busp,
>   
>       slot = val;
>   
> -    if (funcp != NULL) {
> -        if (*e != '.')
> +    if (funcp != NULL && *e != 0) {
> +        if (*e != '.') {
>               return -1;
> -
> +        }
>           p = e + 1;
>           val = strtoul(p, &e, 16);
> -        if (e == p)
> +        if (e == p) {
>               return -1;
> +        }
>   
>           func = val;
>       }
> @@ -2045,13 +2046,15 @@ bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
>       int dom, busnr, devfn;
>       PCIDevice *pci_dev;
>       unsigned slot;
> +

[*]

>       PCIBus *bus;
>   
>       if (!nd) {
>           return false;
>       }
>   
> -    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
> +    unsigned func;

Declare 'func' earlier in [*], otherwise LGTM.

> +    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, &func) < 0) {
>           error_report("Invalid PCI device address %s for device %s",
>                        devaddr, model);
>           exit(1);
> @@ -2062,7 +2065,7 @@ bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
>           exit(1);
>       }
>   
> -    devfn = PCI_DEVFN(slot, 0);
> +    devfn = PCI_DEVFN(slot, func);
>   
>       bus = pci_find_bus_nr(rootbus, busnr);
>       if (!bus) {


