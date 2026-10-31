Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9D606A31A
	for <qemu-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 01:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=knvkgoU3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ByFFXB0p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMyGs-0002tN-MW; Fri, 30 Oct 2026 21:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMyGA-0002pA-N0
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 21:51:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xMyG7-0004kD-PY
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 21:51:53 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69V1CA07749127
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 01:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9EYJOM0H9dJD2hgklOIl9JoR5CMKcX6ZZzpTCEQjgyk=; b=knvkgoU36fxNqvHI
 APfyHeBmKE5zbj3iokodOvop9u//Te8eAgfU8vhwHL2qknoF/LTG+CChpV6kXyys
 W9mgKu52yLpwRiwBgawRXdyksPhxbRrcGSPSS3XsT5j19GWxPiRvDFE4yawnjbKe
 3+cE9yJl6FPhtLhZHqbJ9AEPF0oh+XcfEz21v0QLcRsQag56kThffwM7nO4FF/XS
 4OCAM9pYQfzRbAGHY8AVkD6tNXQZQwtKTWOrDX8fXIE8YYw3t50cv7WFMYo/nwJU
 fjTt/c5fwPZHe1xRhJ41JhfUWHwtBDx/G1uV5pc/qZsoox7uMxXTl3evB7hK7w0H
 SsRVDg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x00p27-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 01:51:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-36a3451ea93so2067593eec.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Oct 2026 18:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793411508; x=1794016308; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9EYJOM0H9dJD2hgklOIl9JoR5CMKcX6ZZzpTCEQjgyk=;
 b=ByFFXB0pIXiKfGY0WdZ0dzNCZDx3CEokFCoCfELPeVlCxHfBh/TgHo7FfmerG+iK8b
 MhXoQK6F4ndgAVseYSQha8jHVleh65cd9td3koBrGdElYZzRwMbonzEj1fmy6DHkoTTJ
 wUI+Nx7TIas9UJAR6oNciGkJAC83K47fuTXS+qv2pogfniPg6uiCufRWzuOIs/8EOL4L
 4rGUm+90eG7oW3POM/zhFRhe8NlhfDLPPlkbewrkwriyRl+QEi4VE4TXlzpkfb812bMy
 GkTq3YTlbtcGKCOZyNJzdXfAu01EBL0pD63daJGYojVrbV5QZwYFXCShE9sqUU/AWIYJ
 s4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793411508; x=1794016308;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9EYJOM0H9dJD2hgklOIl9JoR5CMKcX6ZZzpTCEQjgyk=;
 b=0WZ1cHAr5HLGjs+Yup0rxC+hKQ7A4Zp66BRko9y5pp/r3E6N/x50xfWIdZrHq6vfk0
 fGp9IWsDRkCWtPTk7n9MPZ0AvPWvYmY+WVxXiJffeZ4BQZMtL3Ui+JLZ+OzYTBCIOoM2
 5L2Vbd2899kSs8wLthAlN2WN214VAHQgtTbYG6oUgQ2Nz5pbAzsT8AzN8d2Y3Qvd5XL1
 Qy3FfGBR625LbwWrQ52ChAkDf5HC9cD7+IY+fP4EEashsrLDxnWkt06BCoPvJo9RQ+xv
 +iZm6upmbrpy3T8apMpLycln6UCHKeSYK2rQACW3DyJ1cnP209CcMp6D6+wBTRzH5Qep
 ANfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1qghgPDhFLDWBtu1SULIhgQbsch6lTp0bC/YmtnM3kip4Z+bSvft+OLS82IoClxQ/ACT0pUE2hPW8@nongnu.org
X-Gm-Message-State: AFq9FYKg4EsRN/9mvXV4339WH4VoO0maVN18ZWWpYfQeZvTp5wzumu1f
 RV/Ns1qgfqPhTWZA+WFk30ZMRisFLOPAXQGvoGD7xit496E1OmjVHbwE7gkkGBs2mjPU64vdh1W
 7beicuNQGDE/6MnGA0somLKfdg1dQmhZVgCyM8Bs1hNrXT0ycW2jAkwpkZQ==
X-Gm-Gg: AYBFou0zk5enSoPgUivWkdAHA4xXEBX40q/vxSB6Dt/sihILgm6Fhe+Cgjh64y8CWkE
 iMTLz5dFPoIBcj4FV2ymGdAW4XU5BOA5mytVJAWFHOokCC4LIe4BUKLsre5Ph4rlgGCQlYAGhBg
 vW9h4WrZ3D0nMmoiI2zPBiVqhjn+5S+80r+lmDU7m4B2py/5Q+6cvTpUiAcGDXl5Td2+BrO0HaA
 xjS6heI0cLdyKkIwaUYGCRx9vjaSMMdbiXxH9OSgoySdkgmYfD6GeHo15Jtwyfn1FQjz6YRAqVf
 F5fvY0Oxikh92MniS+Q7PvaU+P7zQFUJZapp1I1J+oFeSza4kh7QTo0PKSkUUusbgAMoeHRthxr
 UOLoDkqBfL69q1NVAyL/WZU80vPPL74i4HXm8BhfBQc1pCXBq/ESw3ujGQv282kAenl4z31/BHL
 8N1YDyL81cCCObWL7U5QaUw/MbsyR/mlvjaWHBbC9BHdI=
X-Received: by 2002:a05:693c:880c:10b0:35c:cd26:3066 with SMTP id
 5a478bee46e88-36a424655bcmr5937791eec.41.1793411507410; 
 Fri, 30 Oct 2026 18:51:47 -0700 (PDT)
X-Received: by 2002:a05:693c:880c:10b0:35c:cd26:3066 with SMTP id
 5a478bee46e88-36a424655bcmr5937730eec.41.1793411506763; 
 Fri, 30 Oct 2026 18:51:46 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a42a98f65sm10975065eec.28.2026.10.30.18.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 18:51:46 -0700 (PDT)
Message-ID: <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 17:51:44 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: BALATON Zoltan <balaton@eik.bme.hu>, Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>,
 Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
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
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwNyBTYWx0ZWRfXxOOF1w7QVrAs
 xP+Zf5b70UEi0knqLuvmVR2JebDWIsL3Tn2G0kgILI3kpsbock2oGqq1n3Ib/15FQ05UW0AF1r/
 /lJ0zRqKaBhVWQ62AUdK9/m53ylpD3OLcXqZACwwVUPbj7FnFCv0gGWrGi0yr78xo4wRhx4Jghd
 6cg2U4AsvLSA5xzq7aDcodHFoXJEJS8rxZ+BB01grc5HLoHwR9qUFr3E4Bz6K8WxzCV6Di07IMY
 HdRnE9f+KqVjBnvkTXg14KnlxG41Nkgk7OLDhbZgVbIKOv58q9GVAb26lfb4NIE+O5hebsHwoTc
 cZMr5eJdi5/izLlBCpYPSubQftC2416meHs/mQwp/0WgeK+SFWxo4JVSjuvsr/njv/kJ2Y3kdXi
 OYi594OTw/KjogeDKq9fI2IvUncbqpmqX5iQSD6M4BDd5StQ1QBfJJCbpxl2r0Kz3X0CUL6Rwda
 sscrBfth3hw9TvSvAng==
X-Proofpoint-GUID: 4fhF6pUpcFSjINaEwgv23O1wsc-K01jC
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae549b4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=3o5FCx-jELZdd1X3BU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 4fhF6pUpcFSjINaEwgv23O1wsc-K01jC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAwNyBTYWx0ZWRfX238vh5bxzrvL
 5EPa08Te2zWsBP3fNFPs+dHXbpaWAtf2QpD1FZ4YafkMclXAqWdc8zSpGjSq2C+UFV9s+eRtXRn
 7+Drclx8XRGaeDaKn9BUfPbCDiH+qqY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310007
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

On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
> On Fri, 30 Oct 2026, Yonggang Luo wrote:
>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
>> type_init
>> function that calls type_register_static(). A later change needs to
>> pass a
> 
> That's the point of the macro to hide the boiler plate code.
> 
>> target mask into that registration, and the macros have no parameter
>> for it.
> 
> Couldn't you just change the macros to take that parameter instead of
> expanding it everywhere?
>

Problem of macros is that they don't have default parameters, so you
need variants for everything:

DEFINE_MACHINE
DEFINE_MACHINE_EXTENDED
DEFINE_MACHINE_WITH_INTERFACES
DEFINE_MACHINE_WITH_INTERFACE_ARRAY
and now would need a new variant, with variant for other existing ones.

In the end, it's just simpler to remove this and add the boilerplate.
It's written once and never modified, so using a macro just save typing
those lines once.

> Regards,
> BALATON Zoltan
> 
>> This series expands every caller first, with no behavior change, so the
>> follow-up only replaces the type_register_static() call.
>>
>> Each machine file gains a class_init function, a TypeInfo, and a
>> type_init
>> function that calls type_register_static(). The last patch removes
>> DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.
>>
>> Yonggang Luo (15):
>>  hw/alpha: expand DEFINE_MACHINE in dp264.c
>>  hw/m68k: expand DEFINE_MACHINE for M68K machines
>>  hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
>>  hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
>>  hw/arm: expand DEFINE_MACHINE for ARM machines
>>  hw/riscv: expand DEFINE_MACHINE for RISC-V machines
>>  hw/core/null-machine: expand DEFINE_MACHINE
>>  hw/mips: expand DEFINE_MACHINE for MIPS machines
>>  hw/ppc: expand DEFINE_MACHINE for PowerPC machines
>>  hw/sh4: expand DEFINE_MACHINE in r2d.c
>>  hw/sparc: expand DEFINE_MACHINE in leon3.c
>>  hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
>>  hw/xtensa: expand DEFINE_MACHINE in sim.c
>>  hw/xtensa: expand DEFINE_MACHINE in virt.c
>>  hw/core/boards: remove unused DEFINE_MACHINE* macros
>>
>> hw/alpha/dp264.c                    | 18 +++++++++--
>> hw/arm/bananapi_m2u.c               | 18 +++++++++--
>> hw/arm/cubieboard.c                 | 19 +++++++++---
>> hw/arm/digic_boards.c               | 18 +++++++++--
>> hw/arm/imx25_pdk.c                  | 18 +++++++++--
>> hw/arm/imx8mm-evk.c                 | 20 +++++++++---
>> hw/arm/integratorcp.c               | 14 ++++++---
>> hw/arm/kzm.c                        | 18 +++++++++--
>> hw/arm/max78000fthr.c               | 17 ++++++++--
>> hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
>> hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
>> hw/arm/msf2-som.c                   | 17 ++++++++--
>> hw/arm/netduino2.c                  | 17 ++++++++--
>> hw/arm/netduinoplus2.c              | 17 ++++++++--
>> hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
>> hw/arm/orangepi.c                   | 19 +++++++++---
>> hw/arm/stm32vldiscovery.c           | 18 +++++++++--
>> hw/core/null-machine.c              | 18 +++++++++--
>> hw/m68k/an5206.c                    | 18 +++++++++--
>> hw/m68k/mcf5208.c                   | 18 +++++++++--
>> hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
>> hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
>> hw/mips/boston.c                    | 18 +++++++++--
>> hw/mips/fuloong2e.c                 | 18 +++++++++--
>> hw/mips/malta.c                     | 12 ++++++--
>> hw/ppc/amigaone.c                   | 18 +++++++++--
>> hw/ppc/pegasos.c                    | 21 ++++++++-----
>> hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
>> hw/ppc/prep.c                       | 18 +++++++++--
>> hw/ppc/sam460ex.c                   | 18 +++++++++--
>> hw/ppc/virtex_ml507.c               | 18 +++++++++--
>> hw/riscv/boston-aia.c               | 18 +++++++++--
>> hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
>> hw/sh4/r2d.c                        | 18 +++++++++--
>> hw/sparc/leon3.c                    | 18 +++++++++--
>> hw/tricore/tricore_testboard.c      | 18 +++++++++--
>> hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
>> hw/xtensa/sim.c                     | 18 +++++++++--
>> hw/xtensa/virt.c                    | 18 +++++++++--
>> include/hw/core/boards.h            | 48 -----------------------------
>> 40 files changed, 605 insertions(+), 142 deletions(-)
>>
>>


