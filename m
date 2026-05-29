Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C20CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:37:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT25B-0006Qx-8k; Fri, 29 May 2026 14:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT258-0006K5-00
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:37:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT253-0001LU-Q3
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:37:16 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Nw3518485
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ds4eePQRVhbBzJnjqMZDIhEp7q7wwgndXkltHS6Z0s8=; b=VeTcmVZhllLsTVKU
 uotJlmRp3X8481EDz6xOHaLzEEG3uPidbPLCrj1G4XyNBAkyUTIAyoMpCMBZfNKW
 8+tGSDTIXGqicDnuQgLYyKDLPBva0w19+1ZLZrqac2CAa33yM186sIyXbKgaTfbL
 vAz1FEoVqt8bv95DQYCSrv6ILpDWXVm5G+/RfzhUVXkpzgL+0vETiEvuiFd0CaVP
 crKVAvJ3UKZTmhHxNmzkSf/UIOdkzdbARGhY8MdFjGKD0RXkSu/j7cCbsQ4DE9t8
 nBtwDX4GBAfzn7MQ0IyCu6HcDH+VfuqGbdZCUI9uhDaZtIg+pO49bBiIAMwlPuUC
 eMwSrQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgusv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:37:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304d8e9563eso511953eec.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079831; x=1780684631; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ds4eePQRVhbBzJnjqMZDIhEp7q7wwgndXkltHS6Z0s8=;
 b=hO7tHorNoA0a3sVnbJ60LpVCsSbVde3IBUNcVdtMC9ed4tkTsd6jE0FdujK7+2TxoO
 eHYMze5sfl7QN3tRc6lsW1ltX9ETQUwwEtlbtu/upGQONdpaShjdppVErBuCl+5+nblj
 36tXsubkVcIFIM4N3zL5JEze3+FEXWpoZIFXhih+JYsQL6cv/tr5hGDQEzg5C3BT7Igl
 EDgvmVtlnXQFQG4C6t2P0GsuAE8p7OvT2KNH9zpnqzSeFVm3hLWAHrydpay3/5DUuhSA
 557vziNhl5PNr8D2+0vLv0rYy0zfQfhWDdgsMsN+Dqx9AjwCIjbamlRdnbxRZTQurU6h
 eLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079831; x=1780684631;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ds4eePQRVhbBzJnjqMZDIhEp7q7wwgndXkltHS6Z0s8=;
 b=KYohyC1M+gPWLz8LJ/b2EJxrw63XFxGVr78xLMNVd3h/hBl6sEFxJNmwqaj2tQxG3u
 BZnXEqNMT4rFSDDZhyrBH4k3LGTvA+OzVkh1vKvNxejBVe2Np/AjYnAmNEJJZazYE8zv
 tMjTp6+vW7ieccUjCWsvuHm5imdliXyCRtXvmYorci3jZKUydYW/6cYcIbhlMUA37VPi
 7JCcR+v1aYpim9oUlCtF8gQLjOmZ74vtYyU6QmaPmBBPBKsw7ZSPJc2I6np0TYynTGoq
 t1M7ZrDRAiXtqmVX55zS8nV9WZ2jDa1+7GKCc3AuSbs3Y0nEYyNv6GaqjGw7/3Udx3YJ
 8dzg==
X-Forwarded-Encrypted: i=1;
 AFNElJ83WErREQDm3vB/QYwfYvcuzs48D6Y89SQ5xLwxy0VdTjk85lXmqEDCvrVUodpSUEUoy1p8zcYR7Frm@nongnu.org
X-Gm-Message-State: AOJu0Yx/jmiM79+a0epbuSaQZAO4PzVO+o66pMq41rfIM6US9rTeXaqi
 mrXr4oSVaVwxAeSzpX4e8CQ0Mc12dvUVJRsX2ogO+1yF0yTSyoTTN0n9J6AHS3zisfkeZ6Ye+Rl
 kgDsQK4Z6/GyQAU96cWckrWlCx+rcGhX0ldqxiJitBOlELU5vbZG8bm9bDQ==
X-Gm-Gg: Acq92OFGh9mgsw6q+13a7WcssrR1NPmcDR22CLPVlHhG5gNPFdWdjqIms50nGhhJXp8
 aIpKIf4jLs/iAwrEESK65w3KfBR6JjRXHoB1g/aWmPRSC2uKDpR6m+un/JFITWoxdueV27G/4ZT
 6IJ6/ABbF6FGMuKLBvC+yrXMO1TWNEnjtVpCknHM+RbZlDvVyTQqhKPY68AqumQENcSeBOhu2I+
 uIDCbDXMgEDj2CZAoiSCz0r7rx651MG5f/qdwevNmxiFW+77rAjxdpzOEhOqOa5/7ksF26ct/Yl
 SaBDCEjhtzPWXCTnAJyS+W7dtxlh2OF87AAaP8pX34LMjXB9/uk+SKAQgO7o+1p+HLbABBlavJQ
 0ktS4a78h/tMY6uUvVbViUvym+cSPovhPGyofwQIG/ZluJjTSulM9GNdY+si0yKGmyiGnfBo9D/
 VzEz4JILlNgxO5AGDpDlK6OQMJ
X-Received: by 2002:a05:7300:570c:b0:304:4f23:4592 with SMTP id
 5a478bee46e88-304fa65a9bamr502914eec.25.1780079831240; 
 Fri, 29 May 2026 11:37:11 -0700 (PDT)
X-Received: by 2002:a05:7300:570c:b0:304:4f23:4592 with SMTP id
 5a478bee46e88-304fa65a9bamr502864eec.25.1780079830697; 
 Fri, 29 May 2026 11:37:10 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed53f316sm2011607eec.19.2026.05.29.11.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:37:10 -0700 (PDT)
Message-ID: <cc80a7f1-1d48-4165-9cc0-f24cb4ede599@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:37:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] accel/hvf: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-10-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z1NNQt7VYeLbYXLkZln8ZVrQJ8dk_LFJ
X-Proofpoint-GUID: Z1NNQt7VYeLbYXLkZln8ZVrQJ8dk_LFJ
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19dcd8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6jQ7O0SlXpQS7W1eCiIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX4MojIBkiDmv3
 zDUd3da/Yu5lb4UdyqPPOgs2LDhqQdWKPL+TisXTA0BfaU1kc8V0A4O7U2AuSCBgBoU0xOzfMcA
 lAHZAAKzNutWpFPNT2OEDL0unAZJ5vSLCUWjInII0a72F6nhvJd5e51HM7xZMeCVY07O8jYj0iV
 4qFSnqFIVvNzQ38Y7vmAa2M8ohseF0c87Vt8kUGshElLg/9OivFBR27GVupvkX7fcuPEhHzgZ8y
 E/Zyr1h3qW+ri/XQIaZpMN1l/xmoKDWxbjyYotKY2634Oas3BdOtUXzKqPfks8r/M/84wy+328S
 YwU2aijIbqp45dHa/wt9tbGjezMGfeep4aSRTpvYhxE0jmKq/2vYhpXRCnC+EZK99EgH0w/sQBg
 wzpvEYI1ueOI27qJFnNrtHUEB6jECADvJOyk/XWZsCWa8RgAlRqklGjcwiFfVUSZsC3Jam7OM/S
 UR/wpVRks7AzljyQHCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> HVF cpu_instance_init() was only implemented for X86.
> Add a stub for ARM, allowing to register as generic
> AccelOpsClass::cpu_instance_init hook.
> 
> X86's ACCEL_CPU_NAME("hvf") TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/hvf_int.h  |  1 +
>  accel/hvf/hvf-accel-ops.c |  1 +
>  target/arm/hvf/hvf.c      |  4 ++++
>  target/i386/hvf/hvf-cpu.c | 25 +------------------------
>  4 files changed, 7 insertions(+), 24 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

