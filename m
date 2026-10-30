Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE03606A31D
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hOaeq5yt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBayfcLN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMqjP-0001iF-7a; Fri, 30 Oct 2026 13:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMqj9-0001f8-0E
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 13:49:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMqj6-0007PZ-AW
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 13:49:18 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69UERKuT2495308
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 17:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6UX8J6tayYdcMuVbYI0MgDwbUxidzIgfE/ULZAD4kYA=; b=hOaeq5yt3cEVyZFR
 0tcQK3F875a+bmOxQFt3NzEAIrxoXbA6yPh5NhgW4MAf9cAj0/4TZ4yrn4KP1kcD
 Kp9GGGOq7DiRWMlvGrdeNt7vTD2zwg+2ndYttukoJgHotjFNQ5DTwFgFPFfGcxrQ
 S84ZD1SE/RRcXjnwA/ZNC3H2KbAaplCR2GEzUffSZmN4TcKb3jpsUkqQO3khlwkA
 BwLuhVO07EJk7pqktnw+tpYOXlTyFSkZnednle311tiKR9MXSfi7Kixi0d5uxm+Y
 uZOYYiE9IWpSMHVtN5WwCvRISpf0uYqtn/fWrJANW8KPSQZLDmBLOxLlmjpfLxtJ
 rydZKQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p4b6j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 17:49:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3698bd5392cso851860eec.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793382554; x=1793987354; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6UX8J6tayYdcMuVbYI0MgDwbUxidzIgfE/ULZAD4kYA=;
 b=RBayfcLN8KwwVuWpvliAainNPyJk/ui99a9+0d/1GKCVW9/nIZvBA1P/j4Y8SvT2Yt
 OG2kQCrV17tgu4c8KjJ0YvNdxyxbKCVU5Rowrqnrnqn3y+I1c0syP59SGsGlICsFej6y
 Nze5Rqkr9njL/eiCxwiVxRKNTc45oB4qiMu6OafJz50jzyIx7IkZxRG5cyCxui3UIPXv
 Tdh2/4pia1FFMkcjVQ0WHSmcA72ZGnVTexdcn9lc+PhYosmVuYCaG9k2/9qToQCPC+KM
 ob1KAdmLYb4ma2ODZy10gsQYsVnvciJY9NzkvTBcyB8es/09Mc4hbaS3Wo7Y/wrJ6TPi
 38Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793382554; x=1793987354;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6UX8J6tayYdcMuVbYI0MgDwbUxidzIgfE/ULZAD4kYA=;
 b=S7MU5YzAC3/H5K7FGkOl3zeyQU6zC2bAVkcpZ90KkJre1qbIUqsHZxRx1AAwFCYv8+
 5eUx/oiifO2gx2V8bBy7/eJtPvk3dzGvMbRdaT5fx5AZPRQY1Ja1VT9eSZpmG7VFN0sK
 HagZxBwV898zhfP29YYEmb4tMJrGAKQmKzf1x6nrtCxMlAXC+jASlnAWB6JJeH1ZUOO7
 7lrv5TIvEEZrqcKMm+lYZ+hi/Ntka1/h0EkSQfzAUdvONaQOtYddMUghDOoSxcK/k000
 NHU+lqv/3QQF0EZ5yu+Owax6w96yPWyvT2n91B3fhMhLn2NpYiV3TVRgXJjAZqNGHu81
 4iwQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvOSX1P3jzDZGC3HzJA9C5EV9Vi2f6NOPhx+QwjVQt2C0+9bcVNqHTekw0CE/rdTLptNUEsRIl5qIP@nongnu.org
X-Gm-Message-State: AFq9FYJ20Y2Zg3I0+h8gPNbcvKNPQsqgDcuG1XcKjqbi5pxKkfeN68X0
 CmSIrV9X/6XkCUxAqt3AiZlXtd1laLRISIwAcb93cBXQJXOrBSpWUFjMyDEQXjEIaGXWQEM0brZ
 4OFogR0uQlpghj7b33s9XGuviRIVBuzewhc379DvwiUn5J/BmwfrDF23E8A==
X-Gm-Gg: AYBFou3AlbJI+dxmlYl7zrRmPrNv6RTQ4UPCWBKG9ofkqjHJq/P96P5EyOG9bHr5NNR
 vhjWgOaDiLtERloYpbgrgLBMj4tVq9vSfATBYNFabqkU6CgtPF4AN2QNQAh8N/2+KOErvN8/jc+
 GPccXAF4E2ZJpyEfK0zcbhHiWFzvRO7YfzB3jrZtTqK6z1S2r7tYWXXF1c+ifSxsPSlF4Q0pegq
 kDS5ziFhXp6xD/SVSw0RqbXcl532YFjcZbOGuUxAW+36FjYHrIa9gMKapLRJrlTeqS4rxda9loz
 NKhC2fm3AtTDKyeNAiWEryp4FQF2g2ZKgJxwT0YxTL0FN5D3SkJ//ui0xn0IW3MpK6/53ZQz+0n
 ZtHqrI5Qw/2BI4eXw10Yh53S9+LbDeao2h4MamqRy2BCcols0iOn0k7Lw69jBxAEonxp5OLKkQt
 m6K2PaBYml/CCkIpAVUIbcmpuNHKe1oHOtQ08eEA/pHdU=
X-Received: by 2002:a05:7300:3d0a:b0:35e:2c6:d462 with SMTP id
 5a478bee46e88-36a2fc203c3mr7976398eec.0.1793382553965; 
 Fri, 30 Oct 2026 10:49:13 -0700 (PDT)
X-Received: by 2002:a05:7300:3d0a:b0:35e:2c6:d462 with SMTP id
 5a478bee46e88-36a2fc203c3mr7976358eec.0.1793382553364; 
 Fri, 30 Oct 2026 10:49:13 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a429467cdsm8795841eec.19.2026.10.30.10.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 10:49:12 -0700 (PDT)
Message-ID: <9c2a2e48-e15f-43ee-9eef-0ebb607ccafc@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:49:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Chao Liu <chao.liu@processmission.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
References: <20261030151539.1872-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030151539.1872-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX3Q39ZxG1piZC
 Yu24K2ezl8ojG/qRdht3auotaUCDzqVWDckikw4NMdN5dQLxS/2yojBqqTmy5RQEZB+ZSQYGEGA
 ZP3T7lcMwWe4xnsFBDV/FLoR3/GUqK2CtcxaispZn8Cxorxpu09t4Y1/aDfB5Rwy8QkdyGRa31K
 rVhs8I58u0WCIrPWkZzHZIsOPQDWrOK+h4ZHK2nM1DfKwJTtymQxvhBE1X9LCXgYoWoL/KSCVAE
 fw09n4TtpQLNnFEz7ZJAFKQU9iuB8KtvIVT4X+6gEJXlmCvhHkW/vE9eF3PfduBMtuxXKFUTVFj
 xjtIhXaXoZMxbCH5LNvsl6lIdiWY6XGotWZ47sA6HIt3DVlpfvjk1+qnwJJMLhQMLO+C3lOzyRr
 H20aIQ9XYUe/CmSuuorvyXeGFgk9iHGGG+B6WeXZdLmh3Wm32bjYERZNEmvas5OTN3/dCTWMuxI
 8MFXqPubCE11Ivg/NDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX8y1o+Z/cNB/Q
 4Qn9tg1LlSLOOBR+kS1Nn8Zedkn45FRBWsmw2YjYj781J0YbNFqBPkCGIHGJ+TxCOkb44KcWdYC
 7fDS7TorDpxk5OguvE6+VNLpt3qqpwU=
X-Proofpoint-ORIG-GUID: iOuOHO6XZNfK34q2Gt1arK-WqTecWfSa
X-Proofpoint-GUID: iOuOHO6XZNfK34q2Gt1arK-WqTecWfSa
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4d89b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6Hdeo9sKUei7lKwjsM4A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300070
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/2026 7:15 AM, Yonggang Luo wrote:
> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the type_init
> function that calls type_register_static(). A later change needs to pass a
> target mask into that registration, and the macros have no parameter for it.
> This series expands every caller first, with no behavior change, so the
> follow-up only replaces the type_register_static() call.
> 
> Each machine file gains a class_init function, a TypeInfo, and a type_init
> function that calls type_register_static(). The last patch removes
> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.
> 
> Yonggang Luo (15):
>   hw/alpha: expand DEFINE_MACHINE in dp264.c
>   hw/m68k: expand DEFINE_MACHINE for M68K machines
>   hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
>   hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
>   hw/arm: expand DEFINE_MACHINE for ARM machines
>   hw/riscv: expand DEFINE_MACHINE for RISC-V machines
>   hw/core/null-machine: expand DEFINE_MACHINE
>   hw/mips: expand DEFINE_MACHINE for MIPS machines
>   hw/ppc: expand DEFINE_MACHINE for PowerPC machines
>   hw/sh4: expand DEFINE_MACHINE in r2d.c
>   hw/sparc: expand DEFINE_MACHINE in leon3.c
>   hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
>   hw/xtensa: expand DEFINE_MACHINE in sim.c
>   hw/xtensa: expand DEFINE_MACHINE in virt.c
>   hw/core/boards: remove unused DEFINE_MACHINE* macros
> 
>  hw/alpha/dp264.c                    | 18 +++++++++--
>  hw/arm/bananapi_m2u.c               | 18 +++++++++--
>  hw/arm/cubieboard.c                 | 19 +++++++++---
>  hw/arm/digic_boards.c               | 18 +++++++++--
>  hw/arm/imx25_pdk.c                  | 18 +++++++++--
>  hw/arm/imx8mm-evk.c                 | 20 +++++++++---
>  hw/arm/integratorcp.c               | 14 ++++++---
>  hw/arm/kzm.c                        | 18 +++++++++--
>  hw/arm/max78000fthr.c               | 17 ++++++++--
>  hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
>  hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
>  hw/arm/msf2-som.c                   | 17 ++++++++--
>  hw/arm/netduino2.c                  | 17 ++++++++--
>  hw/arm/netduinoplus2.c              | 17 ++++++++--
>  hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
>  hw/arm/orangepi.c                   | 19 +++++++++---
>  hw/arm/stm32vldiscovery.c           | 18 +++++++++--
>  hw/core/null-machine.c              | 18 +++++++++--
>  hw/m68k/an5206.c                    | 18 +++++++++--
>  hw/m68k/mcf5208.c                   | 18 +++++++++--
>  hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
>  hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
>  hw/mips/boston.c                    | 18 +++++++++--
>  hw/mips/fuloong2e.c                 | 18 +++++++++--
>  hw/mips/malta.c                     | 12 ++++++--
>  hw/ppc/amigaone.c                   | 18 +++++++++--
>  hw/ppc/pegasos.c                    | 21 ++++++++-----
>  hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
>  hw/ppc/prep.c                       | 18 +++++++++--
>  hw/ppc/sam460ex.c                   | 18 +++++++++--
>  hw/ppc/virtex_ml507.c               | 18 +++++++++--
>  hw/riscv/boston-aia.c               | 18 +++++++++--
>  hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
>  hw/sh4/r2d.c                        | 18 +++++++++--
>  hw/sparc/leon3.c                    | 18 +++++++++--
>  hw/tricore/tricore_testboard.c      | 18 +++++++++--
>  hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
>  hw/xtensa/sim.c                     | 18 +++++++++--
>  hw/xtensa/virt.c                    | 18 +++++++++--
>  include/hw/core/boards.h            | 48 -----------------------------
>  40 files changed, 605 insertions(+), 142 deletions(-)
> 

So far, this expansion has been done only on machines that required to
modify TypeInfo: mostly virt types, which are ambiguous between targets
and require to introduce is_available.

Maybe this can be delayed for when such machines require it also.

Regards,
Pierrick

