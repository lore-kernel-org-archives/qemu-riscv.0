Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DEBC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:46:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfbPr-0007Gs-Op; Fri, 03 Jul 2026 06:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbPq-0007GS-1N
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:46:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbPo-0007U3-HU
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:46:37 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6639BpxH3694375
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 10:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MBIAIG4ETM51WJopral/r28AURCJLiayPssGKpcz7Ow=; b=WUk1weVcqAAIcHqd
 zvvnOlZ0EAtUQyCbwgf0fNk8wsH1Ll9VoGrS0diroO0Sw4fZA/YEEktyyjflBj2W
 p6LYe7ECgRoaapLd/TYglFxiBBcwCOMSF7FM5fdRJmLf8Mg3gn9hrydbWnOMsZNH
 bspYqewOq+AT8m6NO/GRuUVDWcneZqWwDjYXvt6PNnLAVBAy8M6xF8htz/j+xdyE
 VNbQUmpVJo6CYgNnZ4yHPHB2urDCDkdKnkKsv4WeBuRe6dJ3hxpHCfU1QfCr9D4M
 51RHy4/HGbxglXwEHIlFoO4QLs520tuiSVQefPwjtN7TBYBfrQyz9xQKYbYQV1UZ
 JODiww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a848ak5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 10:46:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e820609d9so29597485a.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783075594; x=1783680394; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBIAIG4ETM51WJopral/r28AURCJLiayPssGKpcz7Ow=;
 b=JtVSiDNfhcW1gRtSqUsFsDYSQb7aM/i0OWEIVMirYgYvEGlp221j+X3R25zV3hvRje
 Bnep9wp6PcYMXJi9/m3jRfq1qI5i2KEOsi7NlB1eGHUhJUkgvAeXN8qrzeBJyI6lKRQd
 kKqui04IKG83qJeq+Z17CCgm+WklDPiVXLQuAa0wH3PmQLIumdcmiycXHw3FpwahthQi
 +FxgeMe7z/UcrCWI2E/6g2q1/kqC2OgzsZWmChsDZYzId7KMUglTUsbayXFTDs/JUbSb
 uuQqnshHK6uXe3yoJHr2A1IwPPBgp6JJh2SuEoK8ocxPuUq56qn6y8fw51LdUo31zdWa
 vAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783075594; x=1783680394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MBIAIG4ETM51WJopral/r28AURCJLiayPssGKpcz7Ow=;
 b=jlkF4xRqzah4aoKI01LxfnbLvnuc6gBG5imWcTvMwZxO+G/BnncndWMtyGQiR4c8HR
 lh+pzPm2EXdLqOau8r04Ecj0qdtErRD9qoeD5sysy5sJFRh0p15wqYr4bI9Q6ccc9QuU
 270Ng1QPeqyxM9+F0aFuVS2aYtMCZxJILeysxEeFH9yzpCk4Sr1OKcU8+GehJaDees2c
 V9TSpF2s4h+DJ5f6ZCCBGELaRcCqptbEzB6eJJxebKWKl734HPt/6VOCHg6UlWT1AgxD
 aTVfpR4+oOd0KqEB+ZjL75t0eMZeX2OtIye5SoI5sfcwcil0f0nrCN+Q7/y3RJagh4Ae
 FiRg==
X-Gm-Message-State: AOJu0Yxe+IAEHUxAz7OxUkm6MzI94KrVXGpkxTUMTvYvo9xuNHAIB4WU
 Tufg8oaDIco60YtSmWPaUtAPtXwlEZWlp716oHUdCDROP4PkOa4eqkbyVRpv3SWIIOynG2s+Xes
 F1RMUFGp5znUyt73c8irktm/chwCepmkdTOJsQHoDRUhDJYZY5Jd8MCXBMQ==
X-Gm-Gg: AfdE7clLTQYfu2F7QN+JAqA1OGr9nX1t5phWeGvsn8rb3XwblLBw30g96JyqczcPhfJ
 Aig8NxErrMnA4+v2XVhArbl9eO2svSy8gnqKUs6o+uOFiKmcp+wjBmv23oXfgvus321Y0frcLUu
 YCjypyCMTctXP4Y935fzD9dopT22fGCMykySTtuFO0cTbdWra1yE0oUWIB/QeEEDM7WQ9eYyCkX
 3zmscx0BIrwzc2xjoWOJMF9xJaOg34IJIVoW3tC6Zh28g4SSvxb32mRKqeWP7nYzHt88eWRcG/E
 n2+QXo/spGOamM8GN+51/IU43F+AoNthmBt9xdtwTuc6pg4K7SWBqpXZldthphg3SrLrg+/ObWz
 6h7Tf6HNNCEMkT0xpqz+Ftkr/+z8ccibr/cq0LU3XAYRrfO/QIN5gtDMZVvgIlg==
X-Received: by 2002:a05:620a:6013:b0:92b:1233:99e with SMTP id
 af79cd13be357-92e784d1404mr1297588785a.35.1783075593992; 
 Fri, 03 Jul 2026 03:46:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6013:b0:92b:1233:99e with SMTP id
 af79cd13be357-92e784d1404mr1297583285a.35.1783075593325; 
 Fri, 03 Jul 2026 03:46:33 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dd94cb59sm18089477f8f.18.2026.07.03.03.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:46:32 -0700 (PDT)
Message-ID: <f34bb96c-d55e-472c-b939-ed7260dfd9f8@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/24] target/riscv/cpu.c: handle TCG bits of
 riscv_cpu_dump_state
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-16-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-16-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MPA31lHoqkPCrgQioqPTKBu99bPLNmdI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfX6lQH05bC6GU5
 +ilbvaw9zbKgZllcwy8/4Nmu+yNbNRPShFh/6yzTb0/y52CGlF5XWi985EnmN6Jogjed2GoUu84
 u1h5gFmxzbG5ViyBg/6TA0c8v/Yw4Gw=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47930a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=GjH8pot8HpESF7PzaUYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfX3koXpI0bMtd+
 Ry5rOfr7GleAmNJDYFf0C8LnLx/aMem+lJpHJHZf3MPvbWCDjkuU5DOKY3qUL3Z/SWd9QEaStX8
 +QCSbIsFZs5jq2yeNjOeB+3thueuE/IkMsMHYjPsD2Og5yv+wz37/57rKM69+LtY3brGBtp4KdI
 iUos9EVdPpdFrSdK4FnxXe2bri5U7oR5I+N4is1YlVL26uXiIT7ElfbjhEGVnyRXks2FqHEo4k2
 WGhvqvU/VPMIiiRjzGmg24PPRYLkLq2jupkGd+ifystLC0pFZL1YA34I/8MjaRUo7KCImsVFoM1
 hxlPh4GKixeRD/uzLUTJeQCZoQcHn9dw4Ba3RFh8DExCnAbYCB2/N0GimJ3Z3lCrlHcbieRZ095
 fyoiEHxGslqMlyGn0SQkfBg5XEW+PeLQR4ZVXc3xVHHlTT9ZR1p1/0tT5ykXCISP5zvtL4uzRMf
 nH+iB3FJpTGrp7CwBgA==
X-Proofpoint-ORIG-GUID: MPA31lHoqkPCrgQioqPTKBu99bPLNmdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030104
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> riscv_dump_csr() is a TCG only function but we'll have to implement it
> at some capacity for KVM eventually, therefore put it under a CONFIG_TCG
> ifdef while making a note that this function is unimplemented in KVM.
> 
> The csr_ops array is also TCG specific, thus the for loop inside
> dump_state that iterates it is also TCG only business.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

