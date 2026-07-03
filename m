Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBC9C43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:32:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfaFb-0005yr-MA; Fri, 03 Jul 2026 05:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfaFZ-0005y6-IK
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 05:31:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfaFX-0000YC-Ty
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 05:31:57 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6635rfUE2994867
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 09:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lcPRx+p7B9S0HwS0wT+o/ZNMrBaWj31lcAHNQw9xOz4=; b=TFXTpa+QuRb21a9d
 bpYyi82tBwOxWuEOz6/rEZDzGZNPBB0VIsSV0QjE7LvBhNvMHFt793TVG2pEFSTG
 /LFOeNXhISjQca5Rhv+FglK0MpBpuiP0i3ErUaC0Z3zVps54XM9CozMRBm2Yxj/I
 kyHg8bSjps4r0ZS60cw3XOPx4U4Lolu174BEDh9CgHORUsXtAIsZX63ol/SMICZ5
 6FCCKNrJpvNwhIu7YgOKnrPrImr3iEKRpTWhxLgxaBbpdcE3jOpFtkFQak/W4Ucp
 n/CwfX/CgpVhX3Fj9vmTUzDvBP1cB99XjgVNRvCe16OtN+5PXULp3xW1tSLRtiFf
 pulWdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1pd3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 09:31:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e538afe65so37583085a.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783071114; x=1783675914; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lcPRx+p7B9S0HwS0wT+o/ZNMrBaWj31lcAHNQw9xOz4=;
 b=gNUbuQHMq2efMYOCz5Q5dnEZLp3PCldFpvWIzdlVHDMRlBM7fv/cF7RXvqIAjIrDnl
 5EoimH3/GgSHRTtMSE83oL7eYyxk7qtnAE8UdSWmb0HMUEbPjldL7SeX0DDsgFwdAi0D
 hMd/JxZYL1t0pXuAN53Aia6IK1l2NjyrUpE21A8g/fHSH+Y1yF9UsnbAx5Cu79KIblf9
 OOuwKEyu18iKTK17Oyfszep+FYJrgaC2KXG3P8GQK41sWJ4MGJWhhiTomvhdhLrmHqB4
 vfeI5WhgaZ6u/zmDukVjGRE8aMjPuEp2SWwtst5LI0afD21WIeZjemKgrT/jd0mWWo7z
 tdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783071114; x=1783675914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lcPRx+p7B9S0HwS0wT+o/ZNMrBaWj31lcAHNQw9xOz4=;
 b=KR/gSWu9GzgR6+ylOgXDYJSBuWFj/cDJ3RHNUAcNnpkl17LfYdWZMWFmVIAwS/BGms
 VxDsFOD6BiyLtmotFRN9gcCBBfLTQwn9EFrNT/U1khmjkHkXAzUxmDdLfCnNcds7GsRM
 DqoOw6u0xkgAHfbXVpj0GH9TY7vRJGNrunvXpPpl83zc6wEXzZ6rfGSBxVNJQrHUaadC
 6aSnC2jIkBdJd0gloUiBWGYIteyukZYATrdZIcRo9WzORW9uL4keNmoMhHfW4Clc1tE5
 Iy2hLmhB/GL8P/OpVicOenzNxneFRwhuuQI1eyoMhqZqMaug5GQeOcvQmzyGYFXLPz4a
 leJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0PvHz3mk6/KBc+Clb+8sqw3N67U0OaUKMMHTIeXTdyW/cwCOF+uo1WOoj/xCHCEJXb4UhTky522DO@nongnu.org
X-Gm-Message-State: AOJu0YxaGxCz+bFzqTbrmPekbg1Hyd3u/icFNufMow9l5cOL6hbZlBuh
 90eiEG8PCXMxH9MiJg6Qagfd5idC6Sb/7K03uffkDb1GYeavAi/3tmQ3K6Rqut9E9l90a8Ix4Ba
 utn1Tq3zjtYk4ICK/sLAQhLth1USzCMjHv/Iu/6YEQT8xNOAoVvWAPobaYw==
X-Gm-Gg: AfdE7cmyuq7qE+NyvJRJNWd+4cemFvuc1lPaZ6NcucLiPFEW1OmMXbgjX83pOM5M5H2
 pfRF7az5G7ZxvDICUuB2ZPO7UynnIjWshBk2NE+CDxRfTy3KYVKAhPv2LpAfNCsc6BuloKHHJTK
 grxta8K3l2stB++HpzzFkULQNdUczQ6kg4Yku/wXfk652OmlfWiqW9vSuYKxc7Y4RMMGHcLJYcD
 bdA7s330OQqzhzG0ZmCNuh90OcRrOpK53m4BQ+QrrwY+N8B5pfWCUoChiimwrxJrdg6Dpqtst3b
 KIVygmGk8MNU8GxFYAt24Uil3uJEPzIc2BFE+EH0gz1MLsueD+/mjZ1Jm6aFv2htTa07myPpZcn
 ixaSyN/v+dGR6Excz3Dp/Hhgag7Au0sVhuvOzmiwZcxBGtIapKc7mFMT1Bo8w8A==
X-Received: by 2002:a05:620a:4512:b0:915:efa6:d717 with SMTP id
 af79cd13be357-92e784cf227mr1365135185a.36.1783071113713; 
 Fri, 03 Jul 2026 02:31:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:915:efa6:d717 with SMTP id
 af79cd13be357-92e784cf227mr1365132085a.36.1783071113122; 
 Fri, 03 Jul 2026 02:31:53 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c636ec8asm100338975e9.1.2026.07.03.02.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 02:31:52 -0700 (PDT)
Message-ID: <24329582-f5cf-41de-aabe-c2c3d54f03ea@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv/virt: Add optional UART1
Content-Language: en-US
To: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 palmer@dabbelt.com, sunilvl@ventanamicro.com,
 pierrick.bouvier@oss.qualcomm.com
References: <tencent_06551FAEA44CD75E915AE611FCA0C99CDD09@qq.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <tencent_06551FAEA44CD75E915AE611FCA0C99CDD09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX3BsLzhqXY7es
 3uPOkBTmKl5VFEmWS5xDO6eyhkkAyXjKOOkdNyy4bdE3YZaiFYvH+MSE88B6KtaEVzVDpOB6u0V
 aOyZJ4gb2spKiYwaaI3pxYhJFX+LZU4=
X-Proofpoint-ORIG-GUID: hrfJijSmQqWZOZCmCcrDBKHtoF3C_Y66
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47818a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=dZbOZ2KzAAAA:8 a=Z4mA_aLNfOJQCjkR5ZMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hrfJijSmQqWZOZCmCcrDBKHtoF3C_Y66
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX9WtGKd4BZ6x4
 ymX1Up24rAiuCyaDYzXLn3ZGiwASky+mPU+OKjwuPeni15szv9p8ZchM/qghYId+U7deO3cCWpA
 AJO1V9LUjGCe6kwgyF4fIXNJGt2pfG1rC2TkjWqBhM4YmffXFt+K/ZG/2O0oxApmquQW3AyDfm+
 M5/ojI8191+N2F2reqKB4kH7NiU1Cwb1Jlzqi2Gq03EEsxmCqD92xpsoie+cJdklQidWsLaK9Mi
 9RpXtqqYJHnByY7gALiEG5prqsfeZwrnPGnRL063sbLez9NQOog9lhnnQEuNQJYyAo/jxireLJU
 QXNQ7RZuAxlFkZdsLBK+vVPSBMRT/GlYK+XCl3rlMNmU669zV5UeodEv0txDqq0/jeHuiHIhVgJ
 6W12tRuA33A/cgjHh7uzucjokdQiPWkxZqjCcLElzAgSE3ov2qzo2dbjot7QHl26bncfc5aVaqm
 1HXE2NquDb6ntV09DHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030090
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

On 3/7/26 06:24, Yanfeng Liu wrote:
> This adds optional UART1 to RiscV virt board if required at
> runtime to simplify multicore development.
> 
> Note that UART0 remains default serial_hd(0) and it is:
> 
> - the lowest address UART
> - first serial in DTB
> - behind /aliases/serial0 in DTB
> - the /chosen/stdout-path in DTB
> 
> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
> ---
>   docs/system/riscv/virt.rst |  5 ++++-
>   hw/riscv/virt-acpi-build.c | 12 ++++++++----
>   hw/riscv/virt.c            | 39 ++++++++++++++++++++++++++++----------
>   include/hw/riscv/virt.h    |  3 +++
>   4 files changed, 44 insertions(+), 15 deletions(-)


> @@ -1567,6 +1579,13 @@ static void virt_machine_init(MachineState *machine)
>           0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
>           serial_hd(0), DEVICE_LITTLE_ENDIAN);
>   
> +    if (serial_hd(1)) {

Checking for chardev backend connected to map a peripheral block
is an anti-pattern; the block exists on HW regardless.

> +        serial_mm_init(system_memory, s->memmap[VIRT_UART1].base,
> +            0, qdev_get_gpio_in(mmio_irqchip, UART1_IRQ), 399193,
> +            serial_hd(1), DEVICE_LITTLE_ENDIAN);
> +        s->uart1_present = true;

Thus we want to always instantiate all UART peripherals.

If you drop the uart1_present field then the patch LGTM.

> +    }
> +
>       sysbus_create_simple("goldfish_rtc", s->memmap[VIRT_RTC].base,
>           qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
>   
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 18a2a323a3..7d57c8292e 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -59,6 +59,7 @@ struct RISCVVirtState {
>       int aia_guests;
>       char *oem_id;
>       char *oem_table_id;
> +    bool uart1_present;
>       OnOffAuto acpi;
>       const MemMapEntry *memmap;
>       struct GPEXHost *gpex_host;

