Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2FFCD8CB9
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 12:37:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXIAi-00052U-4c; Wed, 10 Jun 2026 08:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXErA-0003JP-VI
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 05:04:18 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXEr9-0005x2-8m
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 05:04:16 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65A8wtnr735625
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 09:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SAR+SwSQoWE8LstUStkzEY/jIA+Do7OqW+66xAuE7PY=; b=UGgewKC2PsfxJ1CW
 M/PabrVW3Thm4gdaGtu88/BUedAhi1F+KFbQLbBOuW1PER/JbVRA9qZLhyO0forB
 +2yjR5v1Kdgm+cr9Q8A+njh+WkQeVJbNXYwAU5NeA9PRgvGok90wNiAqWguKz5mp
 Vf/iXCSierPQNS98I/cpplA/qzJiq99Mspj4pzCSNLk+f68cf0jWnK95jCWXXgQo
 PyFkOH87AuJN1EDTz249dFpF9DwKVwL36/dlNIVWF3RHIteRyDM4o6H38T3QX0AH
 3k6zK/xl17o4bZpdq02aKlU8i1+qyBjqAv+3sqQfS84VcKvHo5j1AqtqLK/zJcFv
 iAt9Tg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1r0rt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 09:04:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5175b7946d5so53727971cf.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781082252; x=1781687052; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SAR+SwSQoWE8LstUStkzEY/jIA+Do7OqW+66xAuE7PY=;
 b=B5M5FhCAMmNffvbYCLV8kej5V8sXppyD2odqQ9brtgmusSt8MMGkzmYYZ/tttNEzeQ
 a18yWh0osvr3SxgC9mSCvrtGEuB8SJbaZ4ySnQ4sajTc3g0HJubU0xhfH3jYn7m4BS5L
 7heVJBqMXmubXKVQGdg4x3gktMsDHZ8Lyfqw+vVT6WsEJY9Zkvp6X5Tv50Y4mHURKNGD
 GlTdERTWNsmuSU2k+S1Vy2M75ERxskyg0T9cSXCXc1vdtG8F1gr87GJInyCYEnJuxhLq
 i4mwFcLNS8CzGZNmk2j/OrZAD0dsWVo5AA/46OZIo5ixN5y5VrqNfau50CGFqT7orkaq
 ImLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781082252; x=1781687052;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SAR+SwSQoWE8LstUStkzEY/jIA+Do7OqW+66xAuE7PY=;
 b=IeeZl9qhJiTit/snL0ue8MfdQOM3glvvntnFu0aILmqlmeqfnDrMqM3aHp2bcwVOPy
 tGtCUOyWrXY23/cDEjnFPluKCo5y/iQYNdPYcvvEOIDy6aLGgf/uKtd0H9OD94puCR25
 sYMzgPCSg9Vhgp66xwGtzFmQUcml5Yc/VROermSkQapAE3v99CBf2ckHfCpF6dlz5ep2
 YjjuVY+u/iR1c8GxMrM/7b5dZZdVigUzd8yedvaM26MvIEqcHPZqnJ83AyBOOTeScqDN
 Md7eLuboq/9NgSsdqL35egOKpGw8cxUJn38/Fj3kgmUaLaCRrHyR9KjKK4r3/vWVhef0
 azpw==
X-Gm-Message-State: AOJu0YygPdjrKTYD2OOTMNCxiHDTeeSirXx9pHDA/6cVSGInzdi4O1Na
 o7MKfwTogKzNfnZcGWUPkPvjJY5WNUtqxFyyoTAz5vOdtj38UJgayzdqgTwecxv6VQcNtNJActR
 kybfL2BNxKg0x3DzTu0F6K7rMBN2ufqYtIAgK50Sf5aD25W9czmG5N+JcXA==
X-Gm-Gg: Acq92OE1Y805S5VGwOV0WY468TgrkVsBPNFkDE/4kpt7oEoo31AUtzCh9jgVW2aGylV
 EcUdp/FBmxw6IOAb56t4c7BH5Drd+C4RyqNxp3MHUI7gEzm10I0Pzj22KfzlIqM72rydPtx8iaq
 TkT42yrlcSLO3URICW8MBV1TeQv423iNP0tSb/N5I7iLYlyPMpULIXD0NCkQqlK+GBS6Yxied+Z
 e0QOjEMsT+dL470t9IKLzMrSc74gKRFMCkI5/sEqYmAPbxpFgHPS97LeEPZX5idhJm1PKamcdl2
 LBcrY3cvCmiLQf5XXTcCYh24PeNPv5Gv1JnRA4BqMowcoVssk4dlpZveADvEDMvhqwbQaEbptGp
 OjHPrJ7YOtJfhCezETboHLlGgwhwgYM+oLTvvSjgr/IAmuBVOeSbPBN7zgJf/7xG7dHmVhkmn0Q
 ==
X-Received: by 2002:a05:622a:4e94:b0:516:585d:d1c8 with SMTP id
 d75a77b69052e-51795be1037mr319372211cf.33.1781082251416; 
 Wed, 10 Jun 2026 02:04:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4e94:b0:516:585d:d1c8 with SMTP id
 d75a77b69052e-51795be1037mr319371781cf.33.1781082250927; 
 Wed, 10 Jun 2026 02:04:10 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf8ce503f84sm260652766b.5.2026.06.10.02.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 02:04:10 -0700 (PDT)
Message-ID: <6db02c91-83fb-4021-91ec-72e6b56afeb3@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: add 'trigger-count' debug property
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260609213905.1126795-1-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260609213905.1126795-1-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 97M3sgdHNpgznTSv0W-91pxm-mvAXVL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX4UNcOAxbbTFQ
 5NW/u4NXgVQ920D8bYDVrdGBfJ97uTBRESp7Q6efVZy6Q+qj9KQro+LOBB0M7+sj1D9qe/6AhhC
 8rMdeZOVEdXGXLzb3XMNsf/jXY75UJhLUwYWUHJ6xx8KeVvCuyUE+rfKBj6vEBvIrw6porEJ7IE
 HSHHKgVBperGZc+F7aru8WyIHZdyd9IDiK8FhMtFk9eWRT/DWB6PeVmfUW/C+OG8+oUJX/1yB02
 TcpM8F9iW2527uNboGH1UOmPdoNHLEeoXNgC20j+65VA72V48ntCDXwkwFrQF8Phy0LOw5Og/EH
 /AjtZILvMx++JNIfY34TgLhoGDqHqrElyqF4jx0NN4rnxURyOtjFDwQKI09nZRiPHgF+OFMquXC
 ymGbWDcwve+p0v6svyymaTRqv6pvdHm6fGgR+EoyMkpSfEhwVKOg3E2nC/57JVM48AVwO1QRShJ
 VpV2FUP90dU8bCj4NSg==
X-Proofpoint-GUID: 97M3sgdHNpgznTSv0W-91pxm-mvAXVL-
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a29288c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CdBnIkB1nSb6GziZJysA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084
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
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:36:37 -0400
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

Hi Daniel,

On 9/6/26 23:39, Daniel Henrique Barboza wrote:
> All CPUs have the same amount of triggers: 2 triggers per hart, set via
> RV_MAX_TRIGGERS.  This is not enough anymore: we'll have at least one
> future CPU that will demand more triggers per hart when implementing the
> RISC-V Server Ref Platform, requiring at least 11 triggers per hart.
> 
> Parametrize the trigger amount using a new 'trigger_count' env property.
> The default amount is kept at 2.  Set the new maximum to an educated
> guess of 128 triggers per hart (which is less than 2^XLEN theoretical
> maximum by the spec).  All relevant callers (csr.c and debug.c) will now
> use env->trigger_count instead of RV_MAX_TRIGGERS.
> 
> We're also adding two ways of setting the property:
> 
> - a '.trigger_count' CPU definition flag, allowing CPUs to set a custom
>    amount inside the CPU def in DEFINE_RISCV_CPU();
> - a new 'trigger-count' user property.  The user property has a higher
>    priority than an existing '.trigger_count' CPU def setting.
> 
> Assuming a hypotetical case where a CPU 'X' is defined with
> '.trigger_count = 8':
> 
> - -cpu X,trigger-count=30 => trigger_count set to 30
> - -cpu X (...)            => trigger_count set to 8
> 
> For a CPU that doesn't set '.trigger_count':
> 
> - -cpu rv64,trigger-count=30 => trigger_count set to 30
> - -cpu rv64 (...)            => trigger_count set to 2
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c         | 11 +++++++++++
>   target/riscv/cpu.h         | 23 ++++++++++++++++++++++-
>   target/riscv/csr.c         |  2 +-
>   target/riscv/debug.c       | 16 ++++++++--------
>   target/riscv/machine.c     |  4 ++--
>   target/riscv/tcg/tcg-cpu.c |  7 +++++++
>   6 files changed, 51 insertions(+), 12 deletions(-)


> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 6e70b145a5..a667c06b17 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -240,8 +240,8 @@ static int debug_post_load(void *opaque, int version_id)
>   
>   static const VMStateDescription vmstate_debug = {
>       .name = "cpu/debug",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,

Since you bump the migration version, we can also change the array size
to only serialize the number of trigger used:

@@ -246,9 +246,9 @@ static const VMStateDescription vmstate_debug = {
      .post_load = debug_post_load,
      .fields = (const VMStateField[]) {
          VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
-        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
-        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
-        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
+        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, env.trigger_count),
+        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, env.trigger_count),
+        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, env.trigger_count),
          VMSTATE_END_OF_LIST()
      }
  };

Orthogonal, we'd need to replace these target_ulong at some point
(likely bumping the version number again).

