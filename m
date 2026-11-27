Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4021E606A31C
	for <qemu-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rde5fs67;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JjJzZMdA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWzac-0005cp-1v; Fri, 27 Nov 2026 12:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWzaV-0005YH-RL
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 12:18:20 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWzaT-0004WA-2H
 for qemu-riscv@nongnu.org; Fri, 27 Nov 2026 12:18:19 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARFpBHw706539
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 17:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Mz2Wu/slXIfcMfjsH/GFFfGY/EsAXFB2mT5QloN5eyY=; b=Rde5fs67e87/h1V5
 6AzNbtdYtPFyT4r17OnVtKykJOp+ViJb7xk3dILHNCGH2p3SmKZRbp4p1TcVRa7P
 pxxfdv05TDsMgmT4mDUnikdQiEKpHpUutnuK4rc18qTCuo6D3vHMgmRqNb74wl93
 YNncIuWczuRtS7P4iQMtdxJNLJ1zKxO2YbpEnTysuv+6D39w5rhxJ7bux6pmHvUk
 UDuGcNZIbZGjgsQQZY1EhSpVemfzNQMe81TlKwyX941N4pfgd+Uiu2GfQwKvRf2C
 +hkNkc0ce+jJnldSSGiRvuunArfe+3fxn72T8+/AEIB9MZUUJ2NJKhBUVitR26wE
 ykD8MA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6tddd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 17:18:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-3854627c1c8so10867956eec.1
 for <qemu-riscv@nongnu.org>; Fri, 27 Nov 2026 09:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795799888; x=1796404688; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Mz2Wu/slXIfcMfjsH/GFFfGY/EsAXFB2mT5QloN5eyY=;
 b=JjJzZMdAy1HiXtwIQxi0O5e6kuP3r4v7P+aVE5gWvkexDvbradR5KQKx1d1L7FjA6q
 jS4tUSz3ffdokti1GSpL2MUi1ry5/DRjLEXtYZZQbhkMZLduWj2HBseRLNBWuw8IosoI
 qs88uC/+pH6/MmFz0ngo6ep2buhVFSi3xZN4wYNPdv2qHhfnzYsh173mH2wQkBETxMq7
 uiQ0iFu2eakI/pzm86eBUrwsaryw1NFQKCZUCLM0gHH89h29/MdVGcFctOOlwaeUp5/6
 yb9zZxuTfG7akxpV92KTvgRj6/0uEHQvoXJrh488j43HWJIy66uBiCfvu+/oL35xpy2Z
 qCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795799888; x=1796404688;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Mz2Wu/slXIfcMfjsH/GFFfGY/EsAXFB2mT5QloN5eyY=;
 b=v0Kh1txmu6JGWagjCHGEbqEcLjwz00YJi9tQq3MVe5cSKQKj5ptheNOxcBTBAS4aHo
 zC55jiHBTw5CILbrbd7wna/i8ApyVmT71CCLDHsG6ZMVobjrGcUqqm7Jr/y+sslniaVl
 CpzzY24nvtW9ePa9yHUTD/Kjlzw2CbWsVLgiDyD2npfunnP2gCOY75AliLPteBAHtoxS
 hUWUee7EbmoCKxn09nSOWfTCp6cBZtUhryRPtaoL9Zn38H4CyZIvmZbfflMtMzlGizFg
 awRe4xmAzUwMPukugeBf/DR5CFYYiBRiObAaaNzbxmgf7gYgXNFjFhtQWajD2n0Cebre
 Gy+A==
X-Forwarded-Encrypted: i=1;
 AL+hErGQZmUgSfy6G6eQqZYvgFv40cYKRa9rcH1trrXPvmrvfRZI4aNgM68/hX79RJ3Zi2pGbHkjdD+3NWzR@nongnu.org
X-Gm-Message-State: APuU4Z82dMd4ddReUsFLCB83ZAtIGWyKo/r8hop6IZZkkDbxeSGesENb
 EYmAdzyFy8fDnVyxnQ9K3K14ULg3eYFFFe4Qm4at44K+vL0jr9y8Xs5kASbsSJkzQkzEgNXm9//
 pFiclSZlRRjxXnritlr/5mjAKBd27JY8iDtOaDjDXpsjZrfWtweueCj2wIw==
X-Gm-Gg: AZFdTZexO3I4qw/sTNdIP9uZqSXLR14esC6AB3ze6P50C2BIaBf8/9MLglmXe50raWP
 Vf/tBO1rXfcMWpdDvnfHFDraFjhNaHwdDIeWrEDJJwApFZBQ0htNm/kc1eu+Wcjqo+CEI1gOegq
 TMr0sfqVt8cd+SnOlnpAv1kTrX3PftlHVih3aTVKwJAiewKTd4lUN6/IYVb0LeeRSVelbB5ySlT
 wweApc4DwU2ikvjSqJ/BFWWtv7u8GoDIOUAXV4N244By+R3UGp0PDoYhqMfzX4Dw2zoNsteSklq
 uwW/biHwwvFOCSw2wDwA9cp9JjlVyAMbUmcav1oNBfsSqND60PrJUlf6OZsDzvNXOBqEhqfjaHq
 GX2rxZvqTCOW8wvMLhnfBKMMYo4skadpr+Ly5lG6BGv7NcanLZwDzCO04ToE6HYyhQPqKjbkjn/
 Rr6OwVjkUZuL1sTR212JnCsKRgMdjm9eMMkGMntaCGpCw=
X-Received: by 2002:a05:7301:dd83:b0:386:5adb:ac29 with SMTP id
 5a478bee46e88-3865adbb03fmr20939805eec.7.1795799888260; 
 Fri, 27 Nov 2026 09:18:08 -0800 (PST)
X-Received: by 2002:a05:7301:dd83:b0:386:5adb:ac29 with SMTP id
 5a478bee46e88-3865adbb03fmr20939787eec.7.1795799887701; 
 Fri, 27 Nov 2026 09:18:07 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38567cafec4sm84052591eec.26.2026.11.27.09.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2026 09:18:07 -0800 (PST)
Message-ID: <76a04680-141a-43f0-884b-0ea3fff0379f@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:18:06 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] accel/tcg: Do not write qemu_icount from seqlock
 readers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 TANG Tiancheng <lyndra@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20261126222530.62175-1-philmd@oss.qualcomm.com>
 <20261126222530.62175-4-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261126222530.62175-4-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9fYc7lQc-LTpU0YBOaMAOmaOqrYpFVZ8
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09bb51 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=atsRmJsrh7j39t9r5rQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2OCBTYWx0ZWRfXxGldQ+WfQ+kR
 gVV7mdQZWxdYakU1wJ8myGWmvFWXRo2aqGWrS0ksADrv6XcHYrwIrd7AetudjvZcKrCjNvlL1oa
 5bAJsUjzGDXspAI2qjgar/Y1G2rdJ+g=
X-Proofpoint-GUID: 9fYc7lQc-LTpU0YBOaMAOmaOqrYpFVZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2OCBTYWx0ZWRfX/3s8xPflTIky
 1HmlGoabfbnyLSeG57OfbkdDvP55KhQFRe4tXS5r86B0KPRL0eq7gVzRlLxAFtXiPTTiwTy5hSa
 cFy3xTUdz+8WtaWfEwuY50xufqciw7mC7nEhZ3hESv51G5xjXP3KrzCAlHE2yJNtT1a4mymKcBT
 zHFhhqfug/i28g+60ei6MpZ1NNKuslQDxXJC3gzswvXefHS8Xjd1Y2J5jspfAxqJj3NXLv4Aj+y
 Nh0vWpcuEoCwolv8DRv6yWyeqeFh4De3Fw0Eu/aJHbku7Nbw0ntx8p8T1cb8wewF3MswokbuqpK
 zYkWHb2nYw11/pkqmDG140/IBKpgRVm47Gmocigez+50LxRtMhDkkRCjNj7HU+f4kmwXPMlVIfm
 8+8EwoDwm6qldM8pS2PqTYQQsREtkOF9LDku1dn1VjbuJ+Y9zxKImz5Zax0mCwSGVXY/uIvd/Ht
 ogFJmgTIQ7CpX9aAcfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270068
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/2026 2:25 PM, Philippe Mathieu-Daudé wrote:
> icount_get() and icount_get_raw() updated qemu_icount inside
> the seqlock read section, without vm_clock_lock.
> 
> This fixes a narrow time-skew race in adaptive icount:
> icount_adjust() reads qemu_icount twice under the write lock,
> and a vCPU update in between is lost from QEMU_CLOCK_VIRTUAL
> (up to 0xffff instructions). Reproduced on riscv64 'virt',
> whose cycle/instret CSRs read the clock without the BQL, by
> widening the window with an injected delay.
> 
> Update under the write lock before reading.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  accel/tcg/icount-common.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
> index b52d22f3a1cf..ababf7745b27 100644
> --- a/accel/tcg/icount-common.c
> +++ b/accel/tcg/icount-common.c
> @@ -125,6 +125,7 @@ static int64_t icount_to_virtual_ns(int64_t icount)
>      return qatomic_read(&timers_state.qemu_icount_bias) + icount_to_ns(icount);
>  }
>  
> +/* Callers hold vm_clock_lock (used by REPLAY_CLOCK_LOCKED) */
>  static int64_t icount_get_raw_locked(void)
>  {
>      CPUState *cpu = icount_running_cpu();
> @@ -137,19 +138,28 @@ static int64_t icount_get_raw_locked(void)
>      return qatomic_read(&timers_state.qemu_icount);
>  }
>  
> +/* Callers hold vm_clock_lock */
>  static int64_t icount_get_locked(void)
>  {
>      return icount_to_virtual_ns(icount_get_raw_locked());
>  }
>  
> +/*
> + * Readers never write qemu_icount inside the seqlock read section:
> + * the running vCPU folds in what it has executed under the write lock.
> + */
>  int64_t icount_get_raw(void)
>  {
> +    CPUState *cpu = icount_running_cpu();
>      int64_t icount;
>      unsigned start;
>  
> +    if (cpu) {
> +        icount_update(cpu);
> +    }
>      do {
>          start = seqlock_read_begin(&timers_state.vm_clock_seqlock);
> -        icount = icount_get_raw_locked();
> +        icount = qatomic_read(&timers_state.qemu_icount);
>      } while (seqlock_read_retry(&timers_state.vm_clock_seqlock, start));
>  
>      return icount;
> @@ -158,12 +168,16 @@ int64_t icount_get_raw(void)
>  /* Return the virtual CPU time, based on the instruction counter.  */
>  int64_t icount_get(void)
>  {
> +    CPUState *cpu = icount_running_cpu();
>      int64_t icount;
>      unsigned start;
>  
> +    if (cpu) {
> +        icount_update(cpu);
> +    }
>      do {
>          start = seqlock_read_begin(&timers_state.vm_clock_seqlock);
> -        icount = icount_get_locked();
> +        icount = icount_to_virtual_ns(qatomic_read(&timers_state.qemu_icount));
>      } while (seqlock_read_retry(&timers_state.vm_clock_seqlock, start));
>  
>      return icount;

The patch seems to fix two things at the same time:
- ensure that current icount is read with vm_clock_lock held, that's fine.
- add a new call to icount_update.

Can you please explain why this new call fix things?

Regards,
Pierrick

