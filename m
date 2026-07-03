Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA47C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 03:05:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfUD5-0005jz-0O; Thu, 02 Jul 2026 23:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfUD2-0005ji-Kn
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 23:04:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfUD1-0004Wm-4V
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 23:04:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6632rZNM2633491
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 03:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v1lhVfM/300NTlXe/6sdbliDaxbAiPLGf0cogvRfTec=; b=TsHCIvirlNK33Bm0
 lQ3e5A653xYvLltTUn3ucpoyLN7+Knbt8vG7T6Jo+pK85E+RIk/o2uzlIqzXpBof
 GgLaOXdlI02GIq8krhZzsMZOj9I24gv5GMff6HKA0wR29gsyFXxDaIeoV4z43UPe
 mLgcfeOKo+paOhXLxhbomG7yn/MgLvgapi2qWyWsvSiM2bVW3ZMBOAPYV0CntwjR
 GNbRsTTobxzmeP5oCURbZSU1U/OfzQisw8A+C5x1B2baKZVfG0L9WuBIiLCd3CX0
 UctEQiV59+lTfjzcc2Tc//FDHrzjZ9TipiVzMhS8SIA2TLv+Ka4X+2hqtEyVnpGn
 nvddCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnj714-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:04:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e82060977so11840185a.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 20:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783047892; x=1783652692; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v1lhVfM/300NTlXe/6sdbliDaxbAiPLGf0cogvRfTec=;
 b=PVSdVjy6n5Jx4U+yMSZ56l7IKTwBDLsGinLCSIe742ev5Ge7mJ7SUhimHbEg3eXnLw
 71tPsnV7v94Z990eQCmIbCmP5ZvXuDJFXSmBXjLmgrjg3QWNZS2Hd1UJsFRSFGNSYg+J
 iwbDgqnu9MbuqoX+eG+fEG5o32CxYv90MKpsysa0jSN4PVlGbRNuwYvJI/DVn/daWjWz
 B9gN4uPqh7SfaMx7k+Nu4yVjoCMNjcJ5NBwKkaUnAQ6I0CbNNUkCzEp7LTRuHrHv8I40
 S738xL1TLf0VcXWcvvLvexgPdDHtKOvtHCkhwDizI9AoB/Jt8hS7gRG3HxU9t5xrBi+i
 K/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783047892; x=1783652692;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v1lhVfM/300NTlXe/6sdbliDaxbAiPLGf0cogvRfTec=;
 b=VICAkTnHOf3UJbK043NwtuEm8qC7zmgRYwL66PH4n+r5Asdp8/swhIr3QS8ItPUH6N
 yaV6LWUrlyEPd6OE2vJC/kJAu/a6/yuW6zfX69Ug6ZH7LAi/YkaV9tti/dLKw/w5mZvr
 BVd+2Uhl0A6dHzwE7CktMyKixRqWsKWGiyxRSlrWvdQhdoM3qazwvjDvdcHaugsRTxrN
 M0ottAtUlP5pS7CRcoTwa3xtBBwGmUMicR/g2nGjaFNlB3OM27OrmceTtPLiuO9isEVn
 ARRM4VFb+ToWbx1xNg5Lfi6dcy4sDYuq7OB3JmRX7WYfPC1B6tcZrQMc1u6uJkalpu9s
 zmWg==
X-Gm-Message-State: AOJu0YwzUgAPOhqBmt1F1/vIu95Dd7SINCLVbNJR+dV06KPshpscUJzi
 EZfYUEzwjMv58pFcLtIk286uvpliNnkmFAS+1gl0WMQ4ZsMRVKt1xfU4QMSStGp0uTGU0VwD2iL
 AudSJaWlJ9pWbhcmK2nyxJqwa+Cwb2I0gWGEC3ST5SO6q8iy6AONeVPOc9Q==
X-Gm-Gg: AfdE7cm62StUtF6gfdTCmnBrTUeF+wc5b5Cl5tEU52cWevNXQbk7GBBLkkeRIpQWPuj
 RZP1oYMTx7XA6eMmpTU1zGbsDNOta3st7bJu2YOHxg1eO/+L0i+MnU8UxRLNkbQhu34L/TOGM89
 pGWd4zvzbmzWZqzySFCstFaLyC3zQH/xmsF6roC2KQnxDboBzRNP6v2+94yqulgayDYfzdYkFrP
 +tW/PGbQavoit/MA+oIRHpLqmwPVEfdlvpY8nRLePigrRZ9z2aKOIHbTewvqEyDOZUwpeTCoVE3
 IkyjN+ymOCl844n9cB7GhV9rR86TjEN/oQeLUqmCry+bM0lRXBsBK3ENZjE78+AjUtQb5M9mz4H
 AoRs7TIXB0r87o5m0Xo1y/0x81R8mc4vDWPbW+pBWpogYWJwCGovT4/T4S6ifpw==
X-Received: by 2002:a05:620a:271a:b0:91e:712d:f79d with SMTP id
 af79cd13be357-92e8b5b2815mr274386485a.40.1783047892071; 
 Thu, 02 Jul 2026 20:04:52 -0700 (PDT)
X-Received: by 2002:a05:620a:271a:b0:91e:712d:f79d with SMTP id
 af79cd13be357-92e8b5b2815mr274382285a.40.1783047891522; 
 Thu, 02 Jul 2026 20:04:51 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477d766e0b4sm13444082f8f.0.2026.07.02.20.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 20:04:50 -0700 (PDT)
Message-ID: <a558d31d-84ba-484c-80d5-c4a9e295ff5c@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 05:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/24] target/riscv: move some irq helpers to cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-14-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-14-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nrEn4Q9do5yZXRPl5O6Wgy5pLAx6ejxu
X-Proofpoint-ORIG-GUID: nrEn4Q9do5yZXRPl5O6Wgy5pLAx6ejxu
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4726d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=_IOKp0FnopO0b47MFCYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDAyNiBTYWx0ZWRfXxl41d064gzLo
 wYroxfOPsIZYS0nzJgo81O/5eM9NowjualfuYD2KWyocBT7KWTbYO6pSVKV6BSvCcT2tTX7F7Q0
 XXbBK/JkXuZdGv6Alx6c7Jw0eBSRjyg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDAyNiBTYWx0ZWRfXz55zj9flKxGO
 uXtGM8zi1jov1Uwik4FqlEoGbYpPFDZqAdk3fBe63FDhA/NumdXnTAx07y0VhRqzzNSaQ5QdUke
 mdaagczcIoClHApdnCZ3A0iF3LQgN4BDCruU5ANbw+0rIh2oAo4D6lHJDCNxRxrQ6cJisIeOMwJ
 dBBCK/rXTZuNldVeRcieMr7J61fVV6zqOWuImvV9f4YrXRvCpF/FWK3XTRuQIRLhjcLGyU4Vwpg
 oHf/9PlGG3u7x1544h7ZGeyRjQkjLaENYrO3QmtvVYfdkwESxH+Dkcs9FFuh8GLzxVS+imb4g0n
 UDk+VLOoGN0u4odEShrenr6m6b4kuQeSc3/nV4kWCKlWYv0PB9HmPrEN7+LyK9NzPJe8S/JKNYQ
 NTf0BAy2EBhi5VWvdIbzhYis1lwXNY0O1Bg9P1EZTpWvYo7DA1K0CCfxU9HGqTsZQ3hvdoE/ADy
 5vyIYlEoaVIqNI3YQVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030026
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

+Peter, Paolo, Richard

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> riscv_cpu_has_work() uses a handful of irq pending functions from
> cpu_helper.c.  There is a very high possibility that KVM doesn't need
> the current implermentation of has_work(), but the common accel code
> needs an implementation of this callback (see cpu_exec_class_post_init)
> otherwise the KVM driver won't initialize.

See commits 408b2b3d9df ("accel/tcg: Make TCGCPUOps::cpu_exec_halt
return bool for whether to halt") and  0487c631801 ("accel/tcg: Make
TCGCPUOps::cpu_exec_halt mandatory").

Looking at cpu_thread_is_idle(), TCG could register its 
AccelOpsClass::cpu_thread_is_idle handler as !cpu_exec_halt, allowing
to restrict cpu_has_work() to TCG?

> Move the relevant irq helpers to cpu.c to allow KVM to keep using the
> current has_work implementation, allowing --disable-tcg to work.  We'll
> circle it back to evaluate a proper KVM implementation for it in a later
> date.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c            | 187 ++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h            |   5 +
>   target/riscv/tcg/cpu_helper.c | 187 ----------------------------------
>   3 files changed, 192 insertions(+), 187 deletions(-)


