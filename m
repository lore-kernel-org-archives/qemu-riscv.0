Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62614CC6B38
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 11:23:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHg1u-0000Qd-4S; Fri, 16 Oct 2026 07:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xHg1s-0000QJ-8B
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 07:23:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xHg1q-0001xw-Bh
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2026 07:23:16 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69GAASXo2496951
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 11:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VNKsOl8pp1JpbZ9NCvNb/rRD4IhUJ/WIPAqWKwqHBHc=; b=fO6soc8FRCdk44jI
 an0X57LfdIzoZqjSgVBYrT6SEmG8mYkQini2HmfqZ5tWc6axLzklsE1xVpZ7ZOZJ
 ueMdqMq7HLJBd5GzZbYjjgEUG4VI8+jTt/a/t1/590uamxpem42PODojnaLtda21
 8tvHtSNDsALPs9mnQbu+PQHBt2Yg7Aq9I8r9mdE3kehs3gbY8CtatyLfwy71jBjt
 iKrY+++umj/hcgLD1F462ehJjRjlf5Yv1sK0TmPpQpCneq8EHpSg/iRqRfDWF7Dw
 eojLbDsxKb9LnwEEb34robrjOUKXO6BydR0m3asRqSa/TX6FSPAvFK74d7hFJtRB
 jXeZ7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa3ft9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 11:23:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-535131e4c25so127984281cf.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2026 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792149791; x=1792754591; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VNKsOl8pp1JpbZ9NCvNb/rRD4IhUJ/WIPAqWKwqHBHc=;
 b=PEah807OoNhbplPhC2bf7B6tCHKVgwKjVjNxG3OOfuUgt2iMVxtcIokgHqDYkvWeVI
 /3A17EvqmyP5auZ6Z0IOyRmyhMxxR3flzELtQKt4KOnmg/VapWoFj3dLbqyT8sgNYASO
 SXB0rAGmZVC+N0xIITyA3dCvG5sHDRFgiuucK+U8OgK+71N3oPf+APiC0yEvNOFHPer7
 +RK1+ipoICPBp76mU4vBdG7081SH4/N/qwUloDfYQ0DL2hM99XHvg7ob1aqu5UOi/yoE
 8wjBE+XnrBA/McP9knsgH+ci98LjMMBpM+ii5JPjT1suFl+Y8QDcJsNUQ0KZporBXkHx
 SBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792149791; x=1792754591;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VNKsOl8pp1JpbZ9NCvNb/rRD4IhUJ/WIPAqWKwqHBHc=;
 b=MafDGeubV8ttB41lwaXETusXNsAWpXxVNoJrmoVwqih+457sToWWoazojbD9Y8yQRQ
 QueBd+TZMepKq5Urda71vFoiGRkZmYA/V3VExhZma0+7uvdMNXgSU8MNQW06JNZ0vlh8
 6B83LvctbTDpRsm1arTlz919Hcpy/JYrLWHAqC1hLq0XLOT0noftoPIRw+DmnlpzJn82
 rbcaysdRRnJhPBmAaBhBfiL6U0BJ2TTHvZzc/Udumu+4hyXRvEKq88M5TBt5QG3f3Jfn
 iM+xfs0XjCP3t6jAwPvj1DmrQnFx7Z3oWArDvHJqaV6KqMAAhvPHuSr2LticW5pfJd2l
 gi6Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1Kx7qtwGS7bRrFEKSzPNqu/1ILoU4m+8kxPd+26kgFzLe56c0tAGgSQCJ8c3SNkwiivjfH+A8JvZx@nongnu.org
X-Gm-Message-State: AFq9FYL9W3WDiTtDSGS8YEChU9ME7c800hsrBH1oGpqgxswJsWIMi3uy
 wKOcb3vu7SLnqEu/IaaOuBrmOH4GxfAMj+4gg045TMNnUVxgXm4WL4bKX6Rp2uiBdK4izSK7Pkn
 t9AwjFWhX3Ce74T07xvN0gZWGyHsLeLk7Do4c9+28i099iilRDRlhsTeIQw==
X-Gm-Gg: AYBFou3FWIqGWPCi3Cctzell+y/Ue9QWsMfGIS1y7pva9FfYi72RahkRyhFZmNzGWrq
 FfAw8tvcSl1B1OTmANT9Gpz0SKL2CqJ5CpqWXM4ZYaRKw9VO5QrpytEmHiz/k9TzRBYv/8RpYDX
 2YsGAH3uTfdAKDKv5Nv4ZQsdyh4cjAcmH7V8b8hNWwS+gn1A8PPoxTqdSjqHltpTYRMVZkEVXxc
 qTmd7TcCR/4Bh3SIAQEYpluvxxUPINSSaUAVH15hSJefJ75mQY+F8dj3Ec6DoroXsrKEXhtLZHz
 CI3nv09tmQ7gBmNr9Kqk7gu8uV63/y8QNijpj7bp6///enQ2yckQgIiTULYEqGgT+syvdMkJNpH
 eBPls/wwj5cuygrZzEzd5/CjQ2XMr8eAEe8Oc
X-Received: by 2002:a05:622a:647:b0:535:a5fb:6448 with SMTP id
 d75a77b69052e-535a5fb6a27mr376905311cf.66.1792149791305; 
 Fri, 16 Oct 2026 04:23:11 -0700 (PDT)
X-Received: by 2002:a05:622a:647:b0:535:a5fb:6448 with SMTP id
 d75a77b69052e-535a5fb6a27mr376904931cf.66.1792149790851; 
 Fri, 16 Oct 2026 04:23:10 -0700 (PDT)
Received: from [192.168.68.53] ([187.106.240.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5362a8e5831sm20203011cf.10.2026.10.16.04.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 04:23:09 -0700 (PDT)
Message-ID: <763f740c-559c-4f99-a237-daf1e88d4e07@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:23:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] machine: Support extra board CPUs outside -smp
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Portia Stephens <portias@oss.tenstorrent.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Michael Ellerman <mpe@kernel.org>
References: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
 <20261015031804.2406055-8-portias@oss.tenstorrent.com>
 <b87a7231-ca35-4c1d-bc05-ffeee15eebf0@oss.qualcomm.com>
 <atH7u-UCZ3dbA-ui@redhat.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atH7u-UCZ3dbA-ui@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfXwnqvfjvbNZPh
 V94F1xzOIk+t0BYOiNIMhC5EWEmI97cLvsI2iboFislsqQv7A6iGBOuejfcW7A5XGqjKU66ZCAt
 xFWe1sHD0jR8eYsb6mtAJ1YjZhPM5zk=
X-Proofpoint-ORIG-GUID: 8hveSOBAjVRwfFo5zcJtv6O3IRSNliFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NSBTYWx0ZWRfXx6qQUh1sQd4Y
 6H1O0F9bnngmRciRTRMD9U+5xjo0SwuR2DkndUznO32ZUwcREMevlbhc47cUdHqrzgG9V5wZSc3
 2+tG9S0zmKhrPhRKwGGXSp1ueMYqZn56DBDT7PE+NM/tCnZg8jA5X9xOimX+junvkUL0FxypXrf
 Rq0UR6YR892uaXhU+jcIqxRb1i+om8VeBuARXhGtLjZRtAV9Wue+U1loR+LYU7Qt/vobm+VDfRI
 0Pw6osHF5MxzgrcfZ+bRWfVLoDhQuIxHKIrYRIm3oB3t8cI+qztK2My/AoGceoa3I/aCUVHvyCV
 n6ZQbu/bZXoBuLtAQQ86fK3PgGaWS3fai/uGaENCEM/M7oRkjqFBu2duswjMAOP3wTikeuG3fHG
 GXpdpQuN4aKmXomLeCm6yIEcQBru/8fPcpCkjHM4/Yn+ht1/wpzrPF4VHdVi1MmOXFOAHMzAfVg
 tlJUOUxKICUklJFyUrg==
X-Proofpoint-GUID: 8hveSOBAjVRwfFo5zcJtv6O3IRSNliFh
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad2091f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=7SJRNfuEitxYTu7vBacxyQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=mDV3o1hIAAAA:8 a=85MS5epfI4Z2dy0OqHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160045
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 10/16/2026 7:26 AM, Daniel P. Berrangé wrote:
> On Thu, Oct 15, 2026 at 05:31:33PM -0300, Daniel Henrique Barboza wrote:
>> Phil, Pierrick,
>>
>> This patch seems to dwell around your turf.  Did you think about how to
>> instantiate different CPUs that might have different SMP topologies in
>> the context of single binary/split accel work?
> 
> IMHO the -smp argument as it exists today is essentially unfixable
> for the general case and will ultimately need to be declared legacy
> / for simplistic usage only. Trying to paper over the limitations of
> -smp with special cases like "extra cpus" is unlikely to deliver
> attractive solutions long term.
> 
> The eventual emulation of heterogeneous CPUS in the single binary
> work will bring this to a head, but it already causes problems
> today with our per-target binaries because even individual the real
> world CPUs we want to be able to model are not symmetric.
> 
> As a historical reference, a while back, Zhao had an RFC that proposed
> we use '-device' to define each topology level discretely, which would
> allow for arbitrary asymmetric topologies:
> 
>    https://lists.gnu.org/archive/html/qemu-devel/2024-09/msg03727.html

This RFC looks solid.  Any reason why we didn't go through with it back then?
The conversation just fizzled out quietly from what I'm reading in the archives ...

I am not sure about the schedule/planning around the heterogeneous CPU work
but if this RFC is aligned with that effort it would be great if we could push
that forward.   Enabling multiple CPUs of the same architecture/target into
a single board seems like a step into that direction.

We have the tt-atlantis RISC-V board that has a use case for additional CPUs outside
of the main smp topology, i.e. we can use the board as a testcase/validation for
the RFC.


Cheers,
Daniel


> 
> 
> With regards,
> Daniel


