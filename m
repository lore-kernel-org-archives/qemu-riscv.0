Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A5DC5DF87
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:29:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMUg-0006FQ-70; Fri, 21 Aug 2026 06:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMUe-0006EW-El
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:29:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMUb-0005iJ-0l
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:29:00 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9M3f9789985
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xWCeMIeLWcjhSJ+VNhO8kr4XOU2m5CV/bJ4/7dCo2lA=; b=lCzTVCpPuFbkqmUs
 /xBBXnZQgQPEgjGI6bXkKnZOB6GHKFDTdbfL6hsmyAdjJLkbhp/h4ceXafen6qx9
 hDU7o8jwMgoMmNMhiz1dUoT2W1MHBcoQqeha0+WdUiM4ku/hnZ2EnoNrfnSMStTb
 2j9Q6oAsL7ooFK3rOzxn1fLu2MXDv13hve23PFQqTgwqsG+qOAFrXYi4gydf7SmJ
 IfHvjy1qME39vNxPTdtiFe8ha4mh0mq7rHtrsF7Z11qdRl746B0vvBzF4/lVW7QT
 QZdlLIouQJEtnNK6ldSGZWMYGjhJNdxVMbZ7pEehcy6jXTLK1h74oRtj+JFafJhG
 hch+NQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebusg5k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:28:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1d137a68so15567061cf.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787308133; x=1787912933; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xWCeMIeLWcjhSJ+VNhO8kr4XOU2m5CV/bJ4/7dCo2lA=;
 b=KTuu9Z0pjMF/HbHUJ7bLUizfdgfnphSjF2kQIW7ukwbn2L2So7YenogqWsPqIr2DXL
 ZTMOpzQe/wPc+GPnGAzpHsS0ojIzSSBLb9v8G9f3seHpQsQZsH/2WENHTJutYDtUA4dH
 IzzjROzM3QUt+0GvGsOxb/SFg2ik+lQQKVVecACzaNdwABCA0+FePf2F8Y+fjgt6Feyx
 3DAHlPNVVTHXkypanrcJK22KL+X8WKHphPzqO6sv4ztQoi9C+qtILNTgv3iZ8KSj1gxy
 axtSzGejAjtVtpkLVqwRgObGmg4h92OmfBtfjExV5OkqXahI9E3eXC60qSGxJYNsbkKb
 z9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787308133; x=1787912933;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xWCeMIeLWcjhSJ+VNhO8kr4XOU2m5CV/bJ4/7dCo2lA=;
 b=Ls/+MVKXcCtfYaZffeWY2ZmYMBL3d9QM8n4mOeBpzGmqcj4cDQ6aV8GFP3LMpKOPMg
 0hwWDPMv7U1GAIfkyFich+8FLwXOboa9SX7WILWInt0YRNeNIGXiHXMD0vVSmA/JW6Fc
 vtP+YLxATperNxLLuIeju9W6HVqby7byegdwWSqmZbkXbhpejzuGDeZ1yVJgKrMJCIXb
 32Ua9iBY5W0jZ67RhW5LbJyzyEDmSEFLypA65I/Y/eavvgR9udBtVcKCZYUFiZKEP9Nt
 bC6hqFEPJHEAh+6QQugITO9F9WGyoFYxpGMxyRwhVcExIcaiI4yrRQm2rOgd+7HcoRhV
 dSHQ==
X-Gm-Message-State: AOJu0YxeEhK4hKK2ZM7Wn2zNdvpa/dULNUnPo5b5E4QZFTnbUOUg9pWM
 hZzxNhEgRH4y1ou4qy38AglZQXCWh4TJJSp105RJNmxgTW/ILI5CJckqoYjAexam57ysJN/Bqsf
 Bk3V+necqktB+ttu/b4qMpvBG61C1FZ8S4ovCWrScxJ7bwlI1/QRyjd9JNQ==
X-Gm-Gg: AR+sD13j/1nSpCpOyLX88vLCAT3zDXK+AlXzVi4QJCeLTLpHmVW+ktFV/i9X6xBWoG3
 EznQpalQBLXcRcHXdZHnj7sDbrW6KOPv7ZM39/6uYZXwHxgW11YA2s9PLvhQnQOIPnjTFet35zY
 hBkU53qOE4p+LAKBw5exRqHRkQiUCEA3PBrHNeznhbg9k7W45ZPU4mZqUiGw36TVFT7Ao1isBYj
 l+iaJcJ01Ty15jJoq19FRhJdZo7QbwaK0OAmWnecd5JATPujqgwq50op+WypLJl0ZRQc/93AcAt
 p8rU6JFGDVlRCzhoB+Rsso+j+AJI8GAwsJXv6Ihe90L6bRJQ3q+dPH6wHM9+R/fQ4eVcMLbfk17
 1FXf/UAkJ/KzOsXszN5imBAompTKnx9Wcx18=
X-Received: by 2002:ac8:5941:0:b0:516:e10f:7140 with SMTP id
 d75a77b69052e-52df5a28a86mr43943281cf.35.1787308133490; 
 Fri, 21 Aug 2026 03:28:53 -0700 (PDT)
X-Received: by 2002:ac8:5941:0:b0:516:e10f:7140 with SMTP id
 d75a77b69052e-52df5a28a86mr43942781cf.35.1787308132850; 
 Fri, 21 Aug 2026 03:28:52 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e3855sm23501275e9.6.2026.08.21.03.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 03:28:51 -0700 (PDT)
Message-ID: <9aabdd1c-4673-4609-aaa2-f27e04d4d0ad@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uhVkbCn9Y3u7-YLExQF70xgu6vE9GMZa
X-Proofpoint-ORIG-GUID: uhVkbCn9Y3u7-YLExQF70xgu6vE9GMZa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX7JFMz1K6LQXS
 zZYeUVGuO2gzNbfvGtVzGr5+Q7HC4ThSxOSix/zwUqlLJOqku201/2oo0SG4wzKL8w0gzIcAKVA
 mO4mYBBNLJxZGCUga9Ax3XNVDiQMCYw=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a882866 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ivBIR6OCMuaYdoXQm0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX1BrhZ4vK7hEb
 JDatEaNaOLFg9le1y0qC2O36ue+PnZ+TnKr0ptMvPxClJ0ALLI9qY0FQ1I08q8IF6O+vzFEaxt5
 5jShHZepxn78ejfpfvfNmwL4ldhqhn1b2kDCI75SzmnqZmKFM3XMq4YCpDE0mDAgSJ0sr5MBeyf
 0t3jO91ZBx8/klXSuSAb3DGjcQH9Pnof/TZA/eZgMgXo4VuFhsuNxj+Tki46EUvRbCjpHqTWdqE
 zv84c+V1oqaLvwe9Bbfx9p/a8HsZ9rR0T/Xjt7/GvE5sFfG4oigUsVXHjHdJxZuAzcAFWlJOp72
 xdA246/RQu5eyjK0/imBRTk+Ebd6n55o5nd9b1yyR8Vt8YC7RIiPL4lBvVdkSNxkXcJDPPxyFZt
 CU0fM8IavRVGSqW3Yrxrk+4Wk8doUfGK7N99AGv5WlwLHkq3IXIoS6sM/O4Yvx0B4J5hOjUKufN
 ZQd3lCK5YCGezhtbo+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 20/8/26 22:13, Philippe Mathieu-DaudÃ© wrote:
> Missing review: 2,12,14,15
> 
> Since v1:
>    - use _Generic (rth)
>    - no more RFC
> 
> - Patches 2-11 trivially add const qualifier for various
>    cpu_is/has() getters
> - Patch 12-14 add const-qualified variants of cpu_env(),
>    env_cpu(), and env_archcpu() using _Generic() macros;
>    consolidate the redundant env_cpu_const() alias and update
>    linux-user to use the generic accessor

After reworking _Generic from v1, this patchset ordering is not
bisectable anymore. Patches 12-14 must come first.

> - Patch 15 finally convert the SysemuCPUOps::has_work
>    hook and all target implementations.
> 
> No functional change; purely const-correctness improvment
> to enforce has_work() callees don't mutate CPUState.


> Philippe Mathieu-Daudé (15):
>    target/tricore: Document architectural interrupts as not implemented
>    system/cpus: Constify various CPUState arguments
>    target/avr: Constify CPUAVRState for some cpu_*() getters
>    target/hexagon: Constify CPUHexagonState in
>      hexagon_thread_is_enabled()
>    target/i386: Constify CPU*State for cpu_*_interrupt() getters
>    target/loongarch: Constify CPULoongArchState for various cpu_*()
>      getters
>    target/mips: Constify CPUMIPSState for various cpu_*() getters
>    target/s390x: Constify S390CPU for cpu_has_*() getters
>    target/riscv: Constify @iprio argument in riscv_cpu_pending_to_irq()
>    target/riscv: Constify CPURISCVState for various cpu_*() getters
>    target/sparc: Constify CPUSPARCState for various cpu_*() getters
>    linux-user: Uncast void pointer argument as Object in
>      target_cpu_free()
>    cpus: Add const-qualified CPU environment accessors
>    linux-user: Replace env_cpu_const() by generic env_cpu() equivalent
>    cpus: Constify @cpu in SysemuCPUOps::has_work() handler

