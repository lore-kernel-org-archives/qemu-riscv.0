Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20822C5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:40:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtFwG-0007Nt-Ud; Sun, 09 Aug 2026 22:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFwF-0007N5-OT
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:40:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFwE-000338-8G
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:40:31 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L6qum4105885
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S/7EMSo7txd59ZvhkFF92SQMOYs6Y+TmZP9d86rs+cI=; b=Lbhyq2lCIa3pza0z
 LuiKkcD/RBIMi3XIJ2l8AiC+k7HBb9Gqo8bJDVTTGxCkpjr7R8li5qI8iTYplnL3
 xPvigThSulMhrXDYtPLn8q3IggcxMMTMiBKlMzvNmUSYDdqsD3UG9C352VHjG5p8
 ITJ4JZNrJIEsTlRH97xkLxLCIs+C909ispB3HtqtkGjnTj3PjvsFc4csK95gXmTB
 DWYFeIf2Vl21qoM1kSSjeT0ibwXG3Ahc0NopUcp4Go9HGeFZyNU7M44A8kDi5gD4
 8VKAlAqkA1GfehJvtbCJ6+CIXKUIZVoITyCOCnB2ZoNVgnDywS0/F7SahtS1oiNp
 VQZw+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7c5n2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:40:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bf321d786so17793881cf.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786329628; x=1786934428; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S/7EMSo7txd59ZvhkFF92SQMOYs6Y+TmZP9d86rs+cI=;
 b=eis/6xcAmilzNJosTh7uVaU9MM0IIkXquAF5tE1+6q2K9xeNqKDTCYi/vy7j9KVfju
 NIzYgsJQIIa92d4KLCbYzGFGApcfspZhA1nOJTjRbQt84z3xNZBeO4r5oPsA8ibMpxb/
 v4uAWPScAs6CJEp47b45W0LDLHi+YbYrBsFOevH6mg1o3oZ70/yWrH9w1Wzu0NKwbHI5
 xKkP496Tj1eZYPEFWXZg4EoTXzBt1cQIO6SxWldtRJLF1Vt1lwdFxwI8ss0w0GkKgrIk
 u1Tw366Gi0OJCEI2D7AqRMcc8rX4Kf9JVKNSj9sqQUooyImRxWtwovRBGOIltTsgI+Mq
 Farg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786329628; x=1786934428;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S/7EMSo7txd59ZvhkFF92SQMOYs6Y+TmZP9d86rs+cI=;
 b=BGXXgyrc+0lAFUYB5q7LpF6mRO1QQLpp6rCSLdRX6eYV/xi2B8ByXeLU8T3ySA9zwH
 KXLWYYkyMDQAv9FKWFYfQe8iue03/+R1wH8YxGul/gI6i5mHotO3xQiiHNZlrnBZlTK8
 nvVc+zahpg56Z9AInEmsb1dJt7voMHE5MsJYZIxNIkAyhVtGqMGYH6zQ72P2hEbc393E
 smkrNV7Wm2QRIHe8Ywh02TqVMTMyk688pE8wdmGEHSHsDHH6+tD7yY37j1QRrVkqofMj
 XnAXR9W2yt/PwIqt0+SYZrjpjE8tZefxeTmEScOxqkCa1aHEOS150J6Fy653/EQjOEqn
 Spcw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpZEFZGn5Toy5TTznX4tduWgLMEHWdfAV7kzUw1sK8empNL4MeZ9uqqXn7xynvEqpqvYERO+A1jqHsX@nongnu.org
X-Gm-Message-State: AOJu0YyBUHf5VtwbIJIDKnxvNEDiJhIKg1DZSfxo1HLwLhFk/9MnZEQi
 ZJM4rgUGHqvu7vBCUGhWxef9wMCmgEBqLwDVh6fFUqacfixTsJbD1c3XrD0GzxTM1cp06gbaBnG
 ZDJQYp4l5V09bW5UNkGeqTT6vb9HULSY3InQJrmOpmyQiDuE2jwv6VcOFaA==
X-Gm-Gg: AR+sD11ljBD8lmc9n8QJuJKvO2qhEs7SD+CoRHkyfLIi+IL1b9U5/LLLWIEwRaosbCg
 bACzQNcX0RF1Ag+Pz4y2YouuAGR9wdy16qiO0rZWqNi/OaYcPGfAMb/64gBdZcEdzHuaHBPJO7g
 wj+NooB58FAPIFFlMtWf3b9xxcfLpXCzzbYJM7jYCoUVd9mC2ol4bwh7Nu32gOeLa/Tdo0qhDNX
 J12UYRdo225JFPzjWqSkhlv881gqC80mXmS3ATUjE/ZBZBa+wrZEHX5ZPOECdYKq882Kx21ZgjU
 zxI+jmZOswOo0AO5pC+TNVRpV5KisdT1HtJ549oHSPU/FDnN/RIQkRttho5eJPs7ffmBy/IeZub
 Q9CHy/AyfwtjzCCNMNZbHWUcpG02s+jAHMEA=
X-Received: by 2002:a05:622a:1c13:b0:51e:4f6a:b9b8 with SMTP id
 d75a77b69052e-52d18e1b36dmr210406961cf.1.1786329628482; 
 Sun, 09 Aug 2026 19:40:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1c13:b0:51e:4f6a:b9b8 with SMTP id
 d75a77b69052e-52d18e1b36dmr210406771cf.1.1786329628061; 
 Sun, 09 Aug 2026 19:40:28 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480020be8f3sm27527008f8f.0.2026.08.09.19.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:40:26 -0700 (PDT)
Message-ID: <0dc1f28c-1a70-4f57-8ce6-f25444f88916@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] target/m68k: Enable disassembly via capstone
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809013343.664966-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfX835oVDP6zdRU
 vzvuvwXVyX5MvS5yS9oUaKJAQISRSHda+yVtf9fMtsWDmGytpugaldRMmPzTwEbm5h6KJLGcA+D
 mvaapYRid0yOXmsvHZ4tv4a98Q7ASJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfX4B/S2VA5Fhst
 5NcBCuNkzy1UQnZ9P5O1WNynbuI3Lv0i/C8D73513RI5AZfcdX1kPBDhpk6//7cpG2dG7IDcnt2
 Q8n7w566Fhtiy+LMao8VkdQFX+lIjVGUb2kDlx+bepRIlaT5bTfok1LVmWWQSA3ushGcz5QGy7I
 cs4xMhvcqu8xrg7CCYN1rCLh0Xeg3QiKzommwTBnrphUCyzS51bb+fB3fyRSqR9MltmzEf3T38T
 /GPgaDjrfKidHXr83VWi31bX+t/xVTVKaZV77Fyh0xFoTLFmndX/LlpdHZosFQkxzHZF5oK+bjR
 icmrmv+sO7U7CI2jtquXZq11NHa1m2+kioDvAlJYW4/HHTApRGGoQRur+eEwg6OshHiBOdFTy2t
 Lz1JYj7tEpRqjfEmG8+F1/HBzMKnunYM6t2Sbg3yeVdtWdO3B3BPl+siGeZqSvjlEBuV8/bSUG1
 suIH6rWnDyauG+jW1ig==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a793a1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xp0zGyzJg5dp4M7r70CBX366XF-V8jAd
X-Proofpoint-GUID: xp0zGyzJg5dp4M7r70CBX366XF-V8jAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100021
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 9/8/26 03:33, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/capstone.h | 20 +++++++++++++
>   target/m68k/cpu.c        | 65 +++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 84 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

