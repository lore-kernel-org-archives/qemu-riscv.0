Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E855C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:05:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0uDC-0007fp-Rs; Mon, 31 Aug 2026 01:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uDB-0007fS-PB
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:05:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uDA-0006pA-Ci
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:05:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52Vpn2017570
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MfS1P+WE8/U12F1Bt6NuP3nYbPS3vvvP09EGExDiTj0=; b=BgZDx+RneEbn9R5c
 HOgEIW1djYxb3/q/EGA+gwgVl1Liob6HFVXyo3BbqTDC8lwggJ52ornI8LYZzGZE
 khtwWwTvcOk09l7lT3FZvlmwYT8yU+a5vvES5uwIRupTAZAC2RF9bXrqWTH0YP2q
 Z1cEv/3LNx0ix2kwdO+9ymIZi61hli6k1cfk059A0kVp+sYCAw6b0HTGt+rzsjW5
 RMIdt2Zusnd2AIv93nzoZy1FEPrCqFlWBqDj96NVeGi3Wcy5Q5LIAAOIwiH0rdLj
 +RkQVBE7OhIZFX4ef2XAX7WGeEXUEVE5z5IjeAlvcf0oQttUt2fX7Brk8Tuds5xR
 +JdZPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6mjjb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:05:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so268332585a.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788152735; x=1788757535; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MfS1P+WE8/U12F1Bt6NuP3nYbPS3vvvP09EGExDiTj0=;
 b=WEaAqcAaRy1I+x1aJeyQdqWLUJbz7oDDb/s5CXabmGiVPHBgPGY508xTJ5UGYNQANa
 t9cMO2n/CBQHan/LgCa1VPjy2jd4gwIeDY5yVnigqmeAqS3yM6TB7UMUZORaRS2iaHsS
 3P5pKXwZeIozTJmgQp7iHHkl+yp8DyRBag1uiLylEgIHWNzCJOdkIjyN9YTuzNQ+HBVg
 G9UwNY1rU2v4MdMlsRbObCsnbDibG2vEABNI/czAnM2UceexXAvBmUOaGG+/6nx2vLhO
 lHyy0pXdaXQbiTFpksZtPFKd/EwbYOetVTk5aBj9KWKIcjzeVpHwgtAMeqMgi4ADPVKT
 Od4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788152735; x=1788757535;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MfS1P+WE8/U12F1Bt6NuP3nYbPS3vvvP09EGExDiTj0=;
 b=XYAlC2Sztg2cICYJa+5JLolQIRHQM8f83p6zVuGDjPCTbNONITQVgqjUFn2ycJZPGM
 usIxMSrBT/u3ijkM+HLPOONYSKV1bpip0VXn7GGt/k+xFLxsZ/U1KfJeU59AVnjXIQsS
 Gj9mvsfzVb85AldpjPIMObIl/eRKv1IH7SoNyErem+hI0u7/rdmHJ2/p633kAnBp05KW
 Qhta1pIsdcP+bbkiAJqSp5gu098pVfW6ywr1SZOKzeZ1gSeL+Nhi/tNJfiKhqlZ34WQr
 CgM71R3FljfoIIyINpVTq8Bg/KDBds0Wbb2duxrBlHcl4TPXuRjz0vSokdrfokS7BPbX
 CLJA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqZouc2hoEioqYps8h3cvH6zv1umZXXg20fo7hH3wSnHCFnVIr4OiCAnhr41wrbEWv+GBL+u9J660gx@nongnu.org
X-Gm-Message-State: AFuF++npFLrXzQXOs2RlViCDC3X3oe9cuDHFH7fy4Ff4TGI8gQoSInSX
 1vw9s6tv19mh2PEB6UCqNxYU2KuMa3X0XgRWptn0AVKwrw5isqPz+Qaho3sGhx51GhlN9FnynYu
 CG+bl83ojtp3dhbh+664bgNH+uxNY416jxMBKDBynU1WBC5kgfGuU0GYYdQ==
X-Gm-Gg: AR+sD118ijtl8OC/aae6zFWf/N6VSpH1GrEw9sC542IScWYOx4+WBVnquxxubhOFav+
 v4xv2Y/MmPdjUGsQcAjDUDdlBsH/ag39r5qwjE0qzvkqTMNQmNJtKW3pit2zUrHqNG54RuRObPj
 6s1LJYwsllUhH1JPl68VNJEvqPu7P8x9lbpsvQBb4SH6RKfsI89RoH8KThfRwOi5SIIFQ+bSnDT
 9SqYwrtRgEP25rPBiUwIX9QKGXD7ED/j6rzuxrJm7fzrJ1IwvGoEC5zjCUBGJomN3dWuSARzvoY
 QW6ffoIlerEzcKi0ZNhJ55qh7mjrohdMmqEY86QcBbMyHtbkimSJjlRWkJFlmayZeBu2ucPeQrq
 MKkUEqEAKBASgRBrS/ebi056ymkOoycrInw==
X-Received: by 2002:a05:620a:7102:b0:938:fd60:4f0 with SMTP id
 af79cd13be357-939137aaa15mr2053188185a.10.1788152734595; 
 Sun, 30 Aug 2026 22:05:34 -0700 (PDT)
X-Received: by 2002:a05:620a:7102:b0:938:fd60:4f0 with SMTP id
 af79cd13be357-939137aaa15mr2053184285a.10.1788152734129; 
 Sun, 30 Aug 2026 22:05:34 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4843ce8b015sm2961618f8f.13.2026.08.30.22.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:05:33 -0700 (PDT)
Message-ID: <b6dde536-bc21-48b3-91c1-03bf900b1e5d@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] hw/riscv/cps: Map interrupt controllers in SoC
 container
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-7-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831021500.82565-7-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ut838YH9T-S8CPW0sERSTvF-Ym-KVAKR
X-Proofpoint-GUID: ut838YH9T-S8CPW0sERSTvF-Ym-KVAKR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX39CnfAECx+Br
 F/H4LGAh7psjohIl3luS5Hmog7duIKOXbSdpUbOXWjIa5QbdKkHN2pQZOXySU3UxABjONy47/kI
 Z5QWJBLCqE/bnTv2Ec21My/JiE8864KuRjBE6tZGZ1I2Ww2+XRtkrQMFAwiEoC6hPhOzpJEX491
 ScmS85gYkVGVxqt5DoZzFvp5xp+Nc2ATJhTvPlUkES3J0VKtI7QczIWrIQXH3XE6dz9fHltolJJ
 wapULlzwRXPdzUpVU8b7JpT/dv27w6P9NVDda5dB4ZveLZL11+oX9n+kdUCA3nEyJQ+S1kttaZL
 UUzxr15nDDFjUZZHMMqqeE9GJx7G9dTW9p8iALM1Y97oCrcsmWS/cenoIglQ19Df1eyeCg9vsZ6
 qzwkfhw7efyqhebl+5Yknm5pkX0asvz+207tGya28X27LkL3HHwpr/VoFYixRkrhn0gKw7VbckM
 +qmfz+P9o8MU6sNW/Hg==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a950b9f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oHh0x6WUhX_KBqNeoKEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX40K5AUUjFdZo
 LYsYoHQFeI/PhC9eoWu8SgaAusxLnksexzPE0cryAlBP5cdQkxw00hZHWCGxOO4CiUrA7Su61ej
 ff0QXnxJm7iJQs8ok/oOMWee4qs/Mk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310041
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

On 31/8/26 04:14, Joel Stanley wrote:
> The CPS device maps some devices into a container region, but the
> ACLINT and APLIC were mapped directly to system_memory.
> 
> Pass the container memory region to the interrupt controller helpers so
> all CPS devices live in the container. The location of devices in memory
> for the boston-aia machine is unchanged.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/riscv/cps.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

(I'd have expected this as 1st patch in this series)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

