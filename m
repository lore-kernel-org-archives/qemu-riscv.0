Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02D3C624DE
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 16:12:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2WWD-0001fO-Mb; Fri, 04 Sep 2026 12:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2WW5-0001dC-RA
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 12:11:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2WW1-0007tu-Ic
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 12:11:48 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684EiS7t195842
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 16:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 319RC2bK5JelNNshAyAdW1rnMQ1Dm5h0J3wBGe6Q/n8=; b=KyMa+m/FQpPXp1Hq
 fMQLyvVyyiWbhBz9cOOfUp7J/w76vQaOjJFT0S6gYIq8hSQX5hsuYnqZmIbyrafg
 XsSnpMDtmeHVnNHAxkxaoNB6T20UEkooCLs/H98VAPLPT+oTam+mZ3OwZfoG3vUw
 HHzNDPAutA1nA3MSt7QUk8z8rT6OnaHXMNkPxAEM8RtIvCEvPkYiiDFOSdHPeJuX
 E4xm/pthrS8FR3TeKmXBbyQ/ski/WRS3FLW4Hp53IAcQvQUs0d0uid2yTktfCG1Z
 21oxr8DkZgKAJvbFWHabvJcHn+sYSoRSZgitXR6cwCm9nzra9A68GkcOsq1NHksf
 y3lGhQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0120qp6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 16:11:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78a59f5ed87so90958137.3
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788538301; x=1789143101; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=319RC2bK5JelNNshAyAdW1rnMQ1Dm5h0J3wBGe6Q/n8=;
 b=YqyhtHztr45NKJyFtDM9tS/nNd0l8d82cWFCJCTIn+OW4dIXsowqQlRucp7Cv6LX5H
 VDdP84ffWZQ/14rKcdSNuBkKxggHFrDtqe0NEyS4ls+lJoyetLVRZQjg7LF3aPpdnU5f
 57mGgywi959yXYEUWfcGDckWiV1Zoms6VB5DID2Hi7091JQoGOaZnV7gU13OvBZxbU3N
 IRIriiyds7VO8CDcfW9j4+sg7cIBa3IZu7XHA1BSEvQhCDCMYvQ8a3nOlfqJcjTpf3n8
 nzBqskPB0KRsVy4KGI+ySb8PAIjkCuVo/RI6UDOQ3KaZsVqDJ55XuMluMIchLrtH/PqD
 4UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788538301; x=1789143101;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=319RC2bK5JelNNshAyAdW1rnMQ1Dm5h0J3wBGe6Q/n8=;
 b=GjGYHORe4sjADoychLSmbh4TShLeYoXOTs0TG33uG3vHaSPjoLxsJH/0FvCfHl/cfQ
 WSpRIFBsUhQv4jzUiIy0MGrhmhm2mFR01PROvy61y/3Gib9MVLYr/LWYioyxgUQGAj5T
 ZabMoUGCBENbL9P2lfzVsTA40Sipdf+LZ+BuXl95OsypnssNIcFHwKI+ThU8V5ljX5fM
 QKS7Tti/9IubnWaXwNpLsGYEXMSMBrl5QUDmVfFJH+Yh9ge4VTfOoNn0+JPQj0G1wp6i
 6qTmtYlawsaFGax2XsfLPDAqOc96uD2kXnuQisasbi2xHEXsnVYpMdcuJmV/DZWkDzNb
 qfAA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKLrLCFW458bvoKUbxrjwufJPBWTG0EFZ+/lILWrrqNlD/0siTEfvBcX1WmDvZNfI2yXc7ogQViy1F@nongnu.org
X-Gm-Message-State: AFuF++nZ6ibzj52IaXfNeOTEBtIB1XWLTzbD3Z/lm51XOzyhbk2tm98r
 tBpMNmkEZwvdtzpShrnZBT/dRXxk2iRPUBP119lxIx3bLySNY+SbN8jk9BKn7VHP+hYyHy8rC5q
 RYzu+xkXB04GWsabqUeX2z24/MfRtP4ninDUGLhZqNY4uxI/KvY/V97eSEQ==
X-Gm-Gg: AYBFou1gmW8D4K8syPyy2opkVaRh0rzp7GGGqMcTVnSYn0UaQOU3tmfjBhdZNis9UU/
 j1uxFDuiQDvMDoAxo7M+QgOigjsgSuX3FiHfuw3HlGHzmuZAMsKGTdfJ8a26e/wQWwLpjIjZ2wy
 4JSZB/HEQSQIyxPyNK9D4kUFxXlv9ukQiaFGziTutaPzDSpZx1o6Y8e7rskJYhLq2hr5LG/7iqe
 5tvUXFISN6bJbIFa6/CGwUnpbOiO/q23MCbXru/b38dPJGqZKFfLJ2t3IaUHi01kazMkt/qG5ss
 NsDy5LHKPNM2D4iWsZNKZwOddfOTTush8J5tqjgxjlsYATvsvJyuU7WUqVDSbuMDWD2QVI2fQig
 /pFAJ1iRGL609rD79WZtH47b35JSZwAo7Uw==
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id
 ada2fe7eead31-78a4a68089bmr2218816137.1.1788538301570; 
 Fri, 04 Sep 2026 09:11:41 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id
 ada2fe7eead31-78a4a68089bmr2218793137.1.1788538301030; 
 Fri, 04 Sep 2026 09:11:41 -0700 (PDT)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858ac2b4cdsm5738768f8f.16.2026.09.04.09.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 09:11:40 -0700 (PDT)
Message-ID: <7a6ef890-a630-46b3-aedf-a687fec487cc@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 18:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/24] hw/riscv: Restore Microchip PolarFire SoC Icicle
 Kit firmware boot
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bmeng.cn@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Conor Dooley <conor@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org
References: <20260904155758.3833179-1-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260904155758.3833179-1-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NyBTYWx0ZWRfX3oix39XNfq/l
 zC/TtIkZEYg0yVJHIR/iiUZNL4k3/OAfbABvuAL+bsgJx5SIWZJIOSFbopAUfhFKmZzU/EIIU1i
 idW+RR+u8IbW1MiKWOsb9FHRTEAcXoE=
X-Proofpoint-GUID: qix-b6svE9AJe709bVrk3UY1R5dHwndc
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9aedbe cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=fSYeKqFsUNyXvTew9nkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: qix-b6svE9AJe709bVrk3UY1R5dHwndc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NyBTYWx0ZWRfX+M1HlQeXL/Uh
 ptzkSUb+iHHw6/bTJt5aDv+4lwz4UjgjYS6mLx+gJcPXAH44/pbEdCiWFxd54h3nsS82nQXUdKZ
 IJ3unCXG3ROuIa3+MWYCp2uqzYJwhKdQ9whTS3Fz4hJyVNRoq9Yt73K1laQTPtkVTjoUoYPWeLp
 Pbiht6rFmG6Sksl1PvG3RbNGOsARTz/O99M0fxdDHO+Y7O04rhN0J0MU6U4mljFyNw3tiLs4z4S
 wLZ5lJkDzaV0G/6/AtVFCc/z141kUUIxMbc91E7q0/Rl4Ao9RrBjmtyPMuCSgmMQw1ng35uA3eR
 6hNplySoWUnrwmJ0oF1muOaW/wQDzk/DiokUfnd03lEwxzRwB81f7Cdxzatuhl0zJlDunCQyAVo
 ZjK7C6T5mWS4NNXOnRGyd1Ox9B14rR51nB92lbK1W4+AyGZnrm2w2ce7y4AlgVEdlcnmlExCZ0K
 FitUmPERXgdKlNA+d8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040147
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

On 4/9/26 17:57, Bin Meng wrote:

> Bin Meng (23):
>    hw/riscv: pfsoc: Correct the L2LIM maximum mapped size
>    hw/riscv: pfsoc: Map the L2 zero device window
>    hw/misc: pfsoc: Support DDR training with newer HSS
>    hw/misc: pfsoc: Model L2 cache controller registers
>    hw/riscv: pfsoc: Couple L2CC to L2-LIM
>    tests/qtest: Add PolarFire SoC L2CC coverage
>    hw/sd: sdhci: Run ADMA independently of MMIO
>    hw/sd: sd: Keep high-capacity memory blocks at 512 bytes
>    hw/sd: cadence: Add 64-bit system bus property

FYI I tagged this series (in particular the SD/HCI patches)
to review but won't be able to until Sept 21. Not a blocker
although if Alistair think the series is ready.

>    hw/riscv: pfsoc: Enable 64-bit SDHCI system bus support
>    hw/misc: pfsoc: Model PolarFire SoC serial number service
>    hw/rtc: Add PolarFire SoC RTC model
>    hw/riscv: pfsoc: Add PolarFire SoC RTC to Icicle Kit
>    tests/qtest: Add PolarFire SoC RTC coverage
>    hw/misc: pfsoc: Honor PolarFire service notification requests
>    hw/riscv: pfsoc: Correct PolarFire SoC DDR aliases
>    hw/riscv: pfsoc: Fix Icicle Kit RAM size at 2 GiB
>    hw/riscv: pfsoc: Fix Icicle Kit hart count at five
>    docs/system/riscv: Document Icicle Kit HSS boot
>    docs/system/riscv: pfsoc: Document CLINT topology for direct Linux
>      boot
>    tests/functional/riscv64: Add Icicle Kit firmware boot test
>    MAINTAINERS: Add PolarFire SoC Icicle Kit maintainer
>    MAINTAINERS: Move Conor Dooley to PolarFire SoC reviewer


