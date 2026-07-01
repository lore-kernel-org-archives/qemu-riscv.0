Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6C1C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 06:35:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weoWa-00041S-LU; Wed, 01 Jul 2026 02:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWU-0003zP-Jn
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:34:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWR-0002FV-8Y
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:34:13 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lYlY059325
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 06:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d0pnVWhEsVq7YT/Qga9RXWsjPnzzjQIBkMTUUnigOOw=; b=Vp7ebSsisCuihsCT
 F97oMhSplnxQndpDjUg5kbyCbCWDDsaAKLG5lY4OoWw+DQ0xFcGpB4FgAdShA/I1
 IfeMjYoF2cEcOuEaCvnvCvL9tTRMrf6XKvEfDd7exzQbaC+BAtwzuL8fPPb8ZEKl
 Paljf9B1YS5AkvrsS95AG4W5Lz7oYrGqfSou4sxBND0VNFShm3aIQ8TKQOA20FOX
 yJQUGd6BJ1g2JMdWads6oVPoSRijVKxjjALF/o9+Cbtbl4vEWqnqGGKRt8caScLF
 TQPYvg9Vwc22wvoxdiRydg4W0yRO5IRV7/gn7o7uKorMv/m5xg8PrXiHgjUhAHKT
 bLBxRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjgw4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 06:34:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e632390d2so65423785a.3
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782887649; x=1783492449; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=d0pnVWhEsVq7YT/Qga9RXWsjPnzzjQIBkMTUUnigOOw=;
 b=HhmZRD8Y/+0M6CZvldoRSwytPFbfmsjCH+BLZNAFpjsgoPpPwTx9YiWp9IqPC5G9KJ
 0A9QaUWPxAgBfo9m8DPb10mvxZUGW5iYKpYphC8g0m7WQnnAvB++U9yve3f6XCfE27Nl
 zVkmSppHIrHBU6ejwtfKDbipaxecTSvR9leD3sUowaZ3wZkmTKxZjBvAo0nBDBxBFLYN
 vEpgDIghPuMTaxroKRJE+D8fMMNoQc7t80Hj2bl174aF39VpQq58nRsenHH867i20gkW
 kbyMHVKJraFc7zVgNCif1h3By7OX1NycsfbNItjn1Ij2fsOpjm01so98XkjUuwn0bCgb
 vPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782887649; x=1783492449;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d0pnVWhEsVq7YT/Qga9RXWsjPnzzjQIBkMTUUnigOOw=;
 b=iGI1BmP3xJcJxjPaqNFwjEd7ENQ1Jcskpe24eAuG0ROLnGBExar7XfJLhdibtGQxif
 anPa41XhiKevrrAUdsXrG4yF90je8OIOSgfZESpBoIHCXvxNzC9GITd/vdsg4vNrm1QY
 Y+jFMTtRmB9ELn96lkYOsmMIgwXSl6FuskbBWDaOzM0um4nYK2qXqDFu6W6DIHYYxE7B
 buf4dQg8EvCiXiJh3mWFRNat3oMEKA3jmtNaJQzbzblbx3o3T/maxy29Bqz5VlxETVu6
 yxBsOgmadxMbYTO6Thh8s8gFVYfyRlFDXjxdTmMJe7NUDweCcUq8CIe/mHVa/fsZvkRK
 aIhA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7DBP5EyjIJhiFi7yNzk+xzm3pL0cjSrJ8bYnJwPcedqFH6HIg4ykanJdHQ6RsIgHu+c45j+XhnZ1l@nongnu.org
X-Gm-Message-State: AOJu0YzjuZn7YASWi6g4x/R4jTI6sTQi0d9CU59gMRINNyGS1HZKNZa+
 ogUVdqkcFkCJN6qJGQJ0IQzDuYLwbZ6a7UTOXKWRH56Bn9mhjyx5owRP5QTHpmFCs7Z5kl82OAB
 DYe5Abx1U2EejYMVKAmxGBnrYUjhzmd6A6Gah7tAW577ZwBPAWdl/AnjzYw==
X-Gm-Gg: AfdE7cm6riWt45T6tpCUUaNDP6TollnCMsxhdixGTITx4Yj4uSD4eH4s0CoEkzwgj2z
 hRe8KPrMT+GJ0Qom76iXnXct1CBykQLNo+BXoflOzdYWMJjVdb8BX5rVFVS+3s5qcHT5q7eb0hq
 jkO3eca0Y6yIAocAt4rooyWrbE4cUHKnmlVS96LqAVTes6mnYxFoHXF6a5I4WozaGLz+nnmKv7z
 jCfQ0i4tv90eVr3OHWWMr9kGdIbcTExupplSvUHhjURKsuR01zeAtigXctFFvtwqiTC/yudKgvg
 XwiqzrQ1hk4XQqpAganZ2hnopk7d2CMWSPuZP0gsq/IrbqJ5i1yS8Km4A/JlPlLVc+perQLZqFq
 QJk93krmg5Zl+P2q34GkW4k+DTGkWCRv79nJ0mjFFidYHXTb685viyP7VOQhXDw==
X-Received: by 2002:a05:620a:410c:b0:92b:6805:917f with SMTP id
 af79cd13be357-92e785438d6mr48673485a.71.1782887648843; 
 Tue, 30 Jun 2026 23:34:08 -0700 (PDT)
X-Received: by 2002:a05:620a:410c:b0:92b:6805:917f with SMTP id
 af79cd13be357-92e785438d6mr48671985a.71.1782887648408; 
 Tue, 30 Jun 2026 23:34:08 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bfc32992sm39108355e9.11.2026.06.30.23.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:34:07 -0700 (PDT)
Message-ID: <16e61e6c-79d7-4764-b418-2a0f1bd482ce@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] accel/tcg: Constify CPUWatchpoint for
 debug_check_watchpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jh9TEdo_vZlYf5t-C6Uy8z-6WxmpWdRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfX0Sqo8QT9HrOS
 iu0NIekJiipLumcZYLfPm7q/lxaBs1rSYnmZI5XLjLMYQLH9nCkXl9PR2Af70KIU7v3OuLg87Bw
 fd1R2IlH5g+Yqaa1fMwg4H9HCpWWWlkUIxtv9lemmvMQtnqjmPlg9AqCa49Waeod4gMxBqGGfcu
 ScmODDa/ig0/irbefC70LomkxsKDeNTHljQ5y6+yQsW/WDBlkVsblQ4Jb5Jflrnc2b5lliSuZKs
 sui+1cu5dnY9hUHuqnUM0TrVZVhYc9sIqvM63WC6k9urFN7m9v/YgLV4HVyRaZkBcAwabUP6/3S
 W9GZcSJ7hyLI9i/pqxu0lxpMMkcpXfV+4Fwl3uURNhfXIx/bNsiQnX7RkNgsf4Tc7KKvLSQOD2T
 fB7kPdc+IOZGEPEpk+bLifiv4WvruqFVBh+Eo6xiBYXth9SFmH5X0IfCg/zZaqKxeNUtPqjhaIH
 QY4ZMSxz9P04A/UcGnw==
X-Proofpoint-ORIG-GUID: Jh9TEdo_vZlYf5t-C6Uy8z-6WxmpWdRZ
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44b4e1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfX8w9pmckG5pTs
 Ap7FndY7Mn91aWZP0wSzGbX+nHADfviWVa3yTGKXbCjB9LVmrw/o508JE5omc/EU12o6RT5uzTS
 A3QGKHFSKXWPb8g5CGiedJKu8okJWuY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010066
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

On 1/7/26 05:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/cpu-ops.h  | 2 +-
>   target/arm/internals.h       | 2 +-
>   target/ppc/internal.h        | 2 +-
>   target/riscv/debug.h         | 2 +-
>   target/arm/tcg/debug.c       | 2 +-
>   target/ppc/tcg-excp_helper.c | 2 +-
>   target/riscv/debug.c         | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

