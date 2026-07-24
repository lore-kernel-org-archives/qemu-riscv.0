Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E51AC531F9
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 06:46:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wn9fR-00035h-Rt; Fri, 24 Jul 2026 02:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wn9fB-00034m-MF
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2026 02:45:43 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wn9f9-0005Fa-FE
 for qemu-riscv@nongnu.org; Fri, 24 Jul 2026 02:45:40 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66O4lUth1510144
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2026 06:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZYiRoENtHDmhA59nWTSdMz0yUv0EPN2TefBu2Y5tbKI=; b=fvP7j8L/o7M/O+QY
 +ImCTBWLJc5TPfqMO6RAhn0tcYQWClE3MrYtoAyq2hzUu8RW276MpMcaF+ES9hLB
 zVzM35T9rYRFtyPP+VZvh2GqEe5wxdPhr9XOe3eRuJo4uiRNCnLQzL82F3NVK5Xp
 YOU3NVT1XjmxzTJPOwShqJymkZn2TZx05Vpvyldu14L4oZeTHH12+iTOz6dHW2X0
 0EnbJ4tbV80a3tIhJ1Axez04Qfwy/E92m9d/mrQBgL0KieS0UTxSnpHsPJyZvQCb
 HhzacnRf4fQsiq4DD7JoMcKTy/rNn+qj6uPr6Bh9JPqlO8cqUpFlOQTiTEqn8cUI
 tBzqEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrscbk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 24 Jul 2026 06:45:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso1538611cf.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 23:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784875536; x=1785480336; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZYiRoENtHDmhA59nWTSdMz0yUv0EPN2TefBu2Y5tbKI=;
 b=Y9+XWMFRjjjjl4wNx96u8VD0LbiX+uzbWiBdW7UfVf8mIov2JhgNsodU12Yau4I5wN
 I4A/rziPCQZ2HE0/jhG2XgEkaOq9T1kb1pyB3MT4duHd16Z0Z9P5BO/q8P1MAgAqRtT0
 1khk52/qcpzke5i42uwfwAbkYsBwZD46cjJ0aeLi5EKSWL1G+UkbZW8VWYN7zu/RF0Jd
 WCgL4wOAf4feyzHrYRC5LuA7WitqTHAOFM7QUP/qNwLarm0W2QQFYUQtjFOZdt6UW4vj
 kjlu+7hk0SsftXl86vVnOrbJJuaCbd00FoKxypGzazWskq1jYeLde5/NOBns2yFCChea
 gIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784875536; x=1785480336;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZYiRoENtHDmhA59nWTSdMz0yUv0EPN2TefBu2Y5tbKI=;
 b=fLDXoN9O0VVuPm1FZ21q7SXXQYv5qibXFbkLShvgpeGXVuakInwBwgKqhJA5EvAER/
 3AslLRHYNRWvbOzYpyRWT3JeoEJQR/JhEbeHZH90c8uyas0RSKnKy9/mH+TkygK9qwZW
 2g2zt33lKgD9iJZ2TZ0t4OfOp01/dlBepaE4X/oJ4VqxmjzxcvFwwF9zONAkKdbd7ph6
 Pm/O71TcqpLY4Qi+scahLaQuIrlQY1v/MQRoVGPy3BVeXS0lgz9EU8FDAc5xII2hTD6V
 3SrB1/No8fnvQ3QYkgWJw2OKNT8xyai0mJ1YOK7Nhc08t42U3db65J1ssln0N+PSb9Ra
 0vvQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVE64evSQX8lGlUmmTPEqN2h8edkoqgJin+Tu88lb6L5EO41FjCxHzp0q0z0dGuBhKlgVCCR56mOLX@nongnu.org
X-Gm-Message-State: AOJu0YwMFPj2mE0+/WVnpPqaHYMyw1j4Ji23BMfVV3taRYAGaF1tbWu5
 OSW+NBL81NQ/KEYJ1svXlPrvhF1+M+t2WqCHVsoDrbNmwYTta4xyydd7LAbFrMkPcp2ngzUzDus
 +Mdvcse6VgFYvUfIY2jyIfqzqd3nQAMGUMX1mrFT1Bu9SViYAwYCYOIJboA==
X-Gm-Gg: AR+sD12OPn+ZuRW8N1AmMVYXKfpMGpRgpx/+SLC5FHTWTZKzXENR4kYiXoT2xZWkNAY
 4tqaMps6YabVCZlfUz1v90xnsiCEZvTlHh/hipIax4DbUEq2kLh52mE7r/jpIaGg99LSuxT9my+
 /cNLSs3DouljavqELa6qoHPzDQlZcpWSSbtx1QXLA+FreEVBTD47BApb5CriCYdhe8hUj7ffYxF
 kpyj8Siy0vAEAS3jpzKctl9MdsWygHvbu+EZ+W1I9nCxbf7qtT8kQ/NkNV+D254V9gIMzPkLIdu
 GitKMSNWBfCg/GV3YsPcZTXEe76n9uZgk+2CpiXAutW3LjEs+vkCvU31srNGXuOaRt9QyEIpqUf
 ASMVt9gwAf/4gPdXKWA6iYcqAwQM=
X-Received: by 2002:ac8:5dc8:0:b0:51c:fc4:a144 with SMTP id
 d75a77b69052e-5283ddfc1b2mr59535601cf.4.1784875536382; 
 Thu, 23 Jul 2026 23:45:36 -0700 (PDT)
X-Received: by 2002:ac8:5dc8:0:b0:51c:fc4:a144 with SMTP id
 d75a77b69052e-5283ddfc1b2mr59535381cf.4.1784875535761; 
 Thu, 23 Jul 2026 23:45:35 -0700 (PDT)
Received: from [192.168.1.138] ([176.176.154.185])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c531afsm21564811f8f.24.2026.07.23.23.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 23:45:35 -0700 (PDT)
Message-ID: <8030c6a1-c389-46e3-b81e-f61cd95f1fe8@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Fix memory leak in
 riscv_trigger_unrealize()
Content-Language: en-US
To: Zeng Chi <zeng_chi911@163.com>, alistair.francis@wdc.com,
 chao.liu@processmission.com, daniel.barboza@oss.qualcomm.com,
 liwei1518@gmail.com, palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, zengchi@kylinos.cn
References: <9882f9e7-5c05-4a76-95f0-eb8ae8366f62@oss.qualcomm.com>
 <20260724063927.3360599-1-zeng_chi911@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260724063927.3360599-1-zeng_chi911@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA1OSBTYWx0ZWRfX1A2jhzdVmhJk
 7InQh5hHcmbJBpvw6rrmHTMgQdu7wWTpn88bNTxgEDI0UxXaYPwWFfoi9aainSlFH+xX2oOie0B
 ZZO2My2hmUovqwV8OTTafxtNeZpA3EE=
X-Proofpoint-ORIG-GUID: oqvOOUdJyV55HlpX8poX3FKRS6QerhjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA1OSBTYWx0ZWRfX6H2pBmR+vbTV
 njm1Ph5UQ2fhO83EBR9Sh9aF2UftPLgaOO7btC7Ud54OLQbzcjCE2yun9LmwtWPXoz80NNVrDl4
 DkCdgCWbABuSP/aI1O8IxYbY3LuxPiYStHMEOpZPef6jNC6OAWHOLt6LtobWzbry1Z3eOu8//LK
 CuTq+/Ox6sVMNpgEX9QKrp/FTFL33ZbzQyKxS6Df/uZ2zDA1vUXFKuCLOx00nmdN3rMVha5EXD8
 GHdlVJDOgTkSGIpmewyVUuDPhWPL76KNOJWWSzt63IZaUUCFGmOcntTYhpjUywqtPNheRXBEqF6
 pujCPjkpdLnDx12thThMGuxhpzlp0TIolazmz/k5PA0j6lwBJaERsU4Fof89YkfCPr6CvpxJgOv
 J2rR5dWMlo/rEXuTagwQ7oVKaVGOtP+7mjcI/U6GPyCqJkcYH5ZVKSFFCn/l0MBJ7yO5SVKl7eg
 Q7wFG2wdqYtoEr2V+og==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a630a11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uVRRv9AK2fddTnT+2a2/4A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: oqvOOUdJyV55HlpX8poX3FKRS6QerhjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240059
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

On 24/7/26 08:39, Zeng Chi wrote:
> From: Zeng Chi <zengchi@kylinos.cn>
> 
> In riscv_trigger_unrealize(), the per-trigger QEMUTimer objects are
> created in riscv_trigger_realize() using timer_new_ns().  However,
> unrealize only calls timer_del() to cancel them, but never frees the
> timer objects themselves. This results in a memory leak every time a
> CPU instance is unrealized (e.g., during hot-unplug or machine teardown).
> 
> Fix it by replacing timer_del() with timer_free(), which internally
> cancels the timer and frees its memory.  The separate timer_del() call
> is no longer needed.
> 
> Fixes: 820552a92e32 ("target/riscv: dynamic alloc of debug trigger arrays")
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>   target/riscv/tcg/debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com> 
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

