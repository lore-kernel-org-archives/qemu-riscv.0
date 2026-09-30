Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39436CA5FC5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 14:32:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBvLw-0004rc-Sn; Wed, 30 Sep 2026 10:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBvLu-0004rL-Ep
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 10:32:10 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBvLs-00043H-CF
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 10:32:10 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UDxnw1612273
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 14:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5SBbMTUHA4B/FJsYB+amku+GgmoDooT9QRpYnOZ7u+g=; b=DgDt/PpN908cL2W1
 VrYJH8z1iWQ1hLOfIzUoSVNoKwRVFccGOSM3Led5Z3BPS/EqqZLvH1wHF95w/wPW
 mR1Ue/iitcdrjwcu6vvIolMgL5zV1dXYY529d0HHEvhchxux+Kv+0syOsc9dyp4h
 AmckbNtS6cuQIIG9bnV1pfP2+ymGkC8cStYqmtJHZtxoPLH21gyPUQnTx++kyU/q
 omDitHUi+I5sJrXkMJ1SkIpgoYEUBNwRGmMnpxp0suuU779T+xGUAMUHeGgx4hQ8
 /gD9FlpnjpJpqB3q/xEnKVZhTWde0oeuqQdHqAVw2CJz5TpvW1qQWSA4+mfje2mS
 P2SHig==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh81bux-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 14:32:06 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-8881abf79a4so73963887b3.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790778726; x=1791383526; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5SBbMTUHA4B/FJsYB+amku+GgmoDooT9QRpYnOZ7u+g=;
 b=RFArM6BXs/0BDKhyYGYCaX0ubPVQ0twa0k1uizKTV11lgh5vlXVA0g077CkmYTKUmr
 GXQeL/bq5a8blDt/daidyKEk7+I2jnGJKKpPXshXbG7hFSaWFxcGxoCpI8JJBvWxemaN
 gHTYAAWEIrAbqg2QZWhBA0k5Y8igK547/ph/7alBkjTVDYsCLzGczLV0EypuOFQ0i3CC
 tGTPUJvZ16fGpB89YwFwDBTee0C5CS49c1t4KPkmyPz+chXKdEEGsTqihhk12FNGMA2f
 eY/LJm9LeMjhy3Kc6AvjCoPQZ/YU4KvyrEEcpUUzNTvwClazYPlGQ0jG85dYMd51T0P5
 ifKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790778726; x=1791383526;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5SBbMTUHA4B/FJsYB+amku+GgmoDooT9QRpYnOZ7u+g=;
 b=R10K8KMjikpRT87C40D6krLmmeZC5Bl/d0xe3b7y2dpa75SOAzZ/d9cyL2D3xx0/bv
 9m4awnV+2zPJ5yjkIeGHnYbf0xLMUhtl9ZXTiKtXWQaeSXyFyXvFjlAqsLyb0ppuJgLa
 pNCzk4ykXiI/+W4Y4xiRIwvM0lZFSw/lSu5jqZGm8XM0rPfrf24f9bMZUu3U08BX/7pA
 UdumY1xpt52Y/YwS6ZJH/uDktJ/cdKCirUNT2g9vnow2tT0uS1YW7ggrb0umq4nUkwXw
 kETv1eEf879N9+5oqc9o24Pj5R13OAbV+AVhvWQon5v0HjyAeEQE/28VG/HMTtSjmG5h
 zKMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwIseO+WERrjp+Xj+B5QHnnkKnJI/whZ6/Lr4a0J/dqxiY5x7uUqdmsvT2/rO34RMsstpPScsyelMun@nongnu.org
X-Gm-Message-State: AFq9FYJLm/j4EqArQmEgFkh91jzrnPxyvAG9caJBrQIzcQ/fbRnT+YyZ
 tmQfiXmipcrRmFzgh9b7MSFPl3819pcBJYLmWMM9cAo+TukAPXPcIjFB5vTb81G0/tCWzt11Lgz
 hmeGD6wpeRWC8oL+UCR3ZadGaMBvliXzcUVNachvHR+A+8yHBOlfQXI4Y3g==
X-Gm-Gg: AYBFou2tRUg9G5/jeK/xAYpif19ntcgT7BZTsqFuz9TwCw2qRxOaJS7hiesEK828e5m
 D8FDmZylKMqlMVAlVVZ5zzXOZhTb3aAl4awGbCFwaUyxPcF2Rfq+T3lAelfc3hOuM5JZM6Q9kjP
 fzWfoJ7KdLWaHJ+KjqNLH0SB8+zKw3Jf21I/3i470y61hJBqT3PBVXR/sbnn487IRrAfGyD2s1G
 +b6zgMthikVkpQM4/lkWLpwX5pfKKfBj3oU1Z+y/CBDUEvk68xu3AH1K7Z3wi7Ba4uj8U0QpREB
 7hlZSBUYBxvQq5yY81E31UV4It/B7CCQgfit/aP96f5kLQGarTlcBeR9b4hqf51TeGTmG8U/eF8
 SlY/pmbHXebgyAYZVXpRA1fb73VgW3P0Irg==
X-Received: by 2002:a53:ea8e:0:b0:674:e0d2:7e12 with SMTP id
 956f58d0204a3-67683578e97mr633128d50.109.1790778725204; 
 Wed, 30 Sep 2026 07:32:05 -0700 (PDT)
X-Received: by 2002:a53:ea8e:0:b0:674:e0d2:7e12 with SMTP id
 956f58d0204a3-67683578e97mr632972d50.109.1790778723168; 
 Wed, 30 Sep 2026 07:32:03 -0700 (PDT)
Received: from [192.168.15.22] ([177.188.45.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-917a89f6881sm691246d6.24.2026.09.30.07.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:32:02 -0700 (PDT)
Message-ID: <d1cfc592-ed86-441f-a9bc-6a9cf4cdd8b7@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:31:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/riscv/atlantis: Add all UARTs for Atlantis SoC
To: portias@oss.tenstorrent.com, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
 <20260929031644.1016354-4-portias@oss.tenstorrent.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260929031644.1016354-4-portias@oss.tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX+VklPtITEG6/
 zSLryLWwEdDdegHRBLh4cj2KlQpg23xwQK/UO17zh8DfqnPJw5jQsYrLDxolQAgNYIUMfFv9qD8
 8y9GXrjncqE8/UhLkeZTcvWrTBF7QTWDCmgzK9VnlGC7Z/NpNex9P++mM+OZfpjothTFQfeSQGS
 2EV9L74oiOLXozgR7nTkuF6BvBCAK9+AI59cSg4+AP+rVKAgS6GrGn3+s5mby831r+9bDd7f2bh
 SagnEVlnfsQAI7z9qXMaPx6pVAKMcXgulayCHKmepVF4i3gVEM/GBfGMvb+WVuxka4bvUekgBsb
 7rZCW/3n6ERMZLWEXzeDUzzo70ZbWDtOClAqI8BC4O2xlaBMrmBlxnH5WgH5uOWQRjiHGaVdr4R
 2lWvH2iP9nFOKfgsAtf2XaZOqc8vBrl/XCQtsDdZgjUvpeG4USJJ7hkHbTIbEK1ElmaFtIvgdye
 o0oETi8HQGg67ZhdRXg==
X-Proofpoint-ORIG-GUID: tCqjIzRTgj2QPLkediF1-2mP88Pxn8aV
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abd1d66 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=6l5rUruYTVaW9RSjPQzg2g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=2dLLzmznCxpIj2XichoA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-GUID: tCqjIzRTgj2QPLkediF1-2mP88Pxn8aV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX2JfEW31i+IUi
 ELuv0tvQS2QlIPvv4aYLOaKJ6QNvQzYKf+17P+MW28FXUPsqG+FzRkS5R139uBrqXina58956yG
 h5+0Mn3a9nIp/xra1wiQSdUHXG8YAnI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300057
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



On 9/29/2026 12:16 AM, portias@oss.tenstorrent.com wrote:
> From: Portia Stephens <portias@oss.tenstorrent.com>
> 
> Previously only the Ascalon console UART was enabled, this enables all 5
> UARTs on the SoC. Only UART1 is added to the serial interface for now.
> The next change will handle adding the rest of the UARTs.
> 
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/tt_atlantis.c         | 54 +++++++++++++++++++++++++---------
>   include/hw/riscv/tt_atlantis.h | 11 ++++++-
>   2 files changed, 50 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index e889951677..d567ec1155 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -63,7 +63,11 @@ static const MemMapEntry tt_atlantis_memmap[] = {
>       [TT_ATL_I2C2] =             { 0xd4060000,       0x10000 },
>       [TT_ATL_I2C3] =             { 0xd4070000,       0x10000 },
>       [TT_ATL_I2C4] =             { 0xd4080000,       0x10000 },
> +    [TT_ATL_UART0] =            { 0xd4100000,       0x10000 },
>       [TT_ATL_UART1] =            { 0xd4110000,       0x10000 },
> +    [TT_ATL_UART2] =            { 0xd4120000,       0x10000 },
> +    [TT_ATL_UART3] =            { 0xd4130000,       0x10000 },
> +    [TT_ATL_UART4] =            { 0xd4140000,       0x10000 },
>       [TT_ATL_SAPLIC] =           { 0xe8000000,     0x4000000 },
>       [TT_ATL_DDR_HI] =          { 0x100000000,  0x1000000000 },
>   };
> @@ -260,11 +264,12 @@ static void create_fdt_cpu(void *fdt, TTAtlantisSoCState *s,
>   }
>   
>   static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
> -                            int irqchip_phandle)
> +                            int irqchip_phandle, int index)
>   {
>       static const char compat[] = "snps,dw-apb-uart\0ns16550a";
>       g_autofree char *name = g_strdup_printf("/soc/serial@%"HWADDR_PRIX,
>                                               mem->base);
> +    g_autofree char *alias = g_strdup_printf("serial%d", index);
>   
>       qemu_fdt_add_subnode(fdt, name);
>       qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
> @@ -275,8 +280,10 @@ static void create_fdt_uart(void *fdt, const MemMapEntry *mem, int irq,
>       qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irqchip_phandle);
>       qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x4);
>   
> -    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
> -    qemu_fdt_setprop_string(fdt, "/aliases", "serial0", name);
> +    if (index == 0) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
> +    }
> +    qemu_fdt_setprop_string(fdt, "/aliases", alias, name);
>   }
>   
>   static void create_fdt_rng(void *fdt)
> @@ -345,8 +352,11 @@ static void finalize_fdt(void *fdt, TTAtlantisSoCState *s)
>        *                       aplic_s_phandle);
>        */
>   
> -    create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1], TT_ATL_UART1_IRQ,
> -                    aplic_s_phandle);
> +    /* Skip UART0 since it is the RCPU console, UART1 is the Ascalon console */
> +    for (int i = 0; i < TT_ATL_NUM_UARTS - 1; i++) {
> +        create_fdt_uart(fdt, &s->memmap[TT_ATL_UART1 + i], TT_ATL_UART1_IRQ + i,
> +                        aplic_s_phandle, i);
> +    }
>   
>       create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
>   
> @@ -472,13 +482,21 @@ static void tt_atlantis_machine_done(Notifier *n, void *data)
>                                 fdt_load_addr);
>   }
>   
> +static inline int tt_atlantis_uart_index(int uart_dev)
> +{
> +    return uart_dev - TT_ATL_UART0;
> +}
> +
>   static void tt_atlantis_soc_init(Object *obj)
>   {
>       TTAtlantisSoCState *s = TT_ATLANTIS_SOC(obj);
>   
>       object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
>   
> -    object_initialize_child(obj, "uart1", &s->uart1, TYPE_DW8250);
> +    for (int i = 0; i < TT_ATL_NUM_UARTS; i++) {
> +        object_initialize_child(OBJECT(s), "uart[*]", &s->uart[i],
> +                                TYPE_DW8250);
> +    }
>   
>       for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
>           object_initialize_child(obj, "i2c[*]", &s->i2c[i],
> @@ -572,14 +590,22 @@ static void tt_atlantis_soc_realize(DeviceState *dev, Error **errp)
>       memory_region_add_subregion(s->memory, s->memmap[TT_ATL_BOOTROM].base,
>                                   &s->bootrom);
>   
> -    /* UART1, the soc console (UART0 is for the boot microcontroller) */
> -    qdev_prop_set_chr(DEVICE(&s->uart1), "chardev", serial_hd(0));
> -    sysbus_realize(SYS_BUS_DEVICE(&s->uart1), &error_fatal);
> -    memory_region_add_subregion(s->memory,
> -                                s->memmap[TT_ATL_UART1].base,
> -                                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart1), 0));
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart1), 0,
> -                       qdev_get_gpio_in(s->irqchip, TT_ATL_UART1_IRQ));
> +    /* UART1, the soc console (UART0 is for the boot microcontroller */
> +    qdev_prop_set_chr(DEVICE(&s->uart[tt_atlantis_uart_index(TT_ATL_UART1)]),
> +                      "chardev", serial_hd(0));
> +
> +    for (int i = 0; i < TT_ATL_NUM_UARTS; i++) {
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->uart[i]);
> +        if (!sysbus_realize(sbd, errp)) {
> +            return;
> +        }
> +
> +        memory_region_add_subregion(s->memory,
> +                                    s->memmap[TT_ATL_UART0 + i].base,
> +                                    sysbus_mmio_get_region(sbd, 0));
> +        sysbus_connect_irq(sbd, 0,
> +                           qdev_get_gpio_in(s->irqchip, TT_ATL_UART0_IRQ + i));
> +    }
>   
>       /* I2C */
>       for (int i = 0; i < TT_ATL_NUM_I2C; i++) {
> diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
> index 000988c037..b81b7c8abd 100644
> --- a/include/hw/riscv/tt_atlantis.h
> +++ b/include/hw/riscv/tt_atlantis.h
> @@ -23,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisState, TT_ATLANTIS_MACHINE)
>   OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisSoCState, TT_ATLANTIS_SOC)
>   
>   #define TT_ATL_NUM_I2C 5
> +#define TT_ATL_NUM_UARTS 5
>   
>   struct TTAtlantisSoCState {
>       /*< private >*/
> @@ -39,7 +40,7 @@ struct TTAtlantisSoCState {
>       RISCVHartArrayState cpus;
>       DeviceState *irqchip;
>       DesignWareI2CState i2c[TT_ATL_NUM_I2C];
> -    DW8250State uart1;
> +    DW8250State uart[TT_ATL_NUM_UARTS];
>       MemoryRegion bootrom;
>   
>       uint32_t num_harts;
> @@ -63,7 +64,11 @@ enum {
>       TT_ATL_I2C2_IRQ = 35,
>       TT_ATL_I2C3_IRQ = 36,
>       TT_ATL_I2C4_IRQ = 37,
> +    TT_ATL_UART0_IRQ = 38,
>       TT_ATL_UART1_IRQ = 39,
> +    TT_ATL_UART2_IRQ = 40,
> +    TT_ATL_UART3_IRQ = 41,
> +    TT_ATL_UART4_IRQ = 42,
>   };
>   
>   enum {
> @@ -80,7 +85,11 @@ enum {
>       TT_ATL_MIMSIC,
>       TT_ATL_SAPLIC,
>       TT_ATL_SIMSIC,
> +    TT_ATL_UART0,
>       TT_ATL_UART1,
> +    TT_ATL_UART2,
> +    TT_ATL_UART3,
> +    TT_ATL_UART4,
>   };
>   
>   #endif


