Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC69BC624D4
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 19:53:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1r0q-0006SG-Gh; Wed, 02 Sep 2026 15:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0k-0006Q0-SO
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 15:52:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0h-0007Uc-HG
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 15:52:42 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682Hr2Mb2372755
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 19:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o9lf+tLTFMt2mBgZsTQ5i9dk7TIdp2RTwx0PI03Puvk=; b=Tapz965ySgCllyjw
 Eop52McWbL92n080PJ+VPQu6Jpdht5AErQYqlBH/oOBfiRWWSuWqAdjVDdl0+Rqp
 x9d2cuxSX3S4/zYg3De0x9Qr0OCeu0G4TYgmTCzFmofEuhx/gpCzDD7qQYrTZw6B
 O2AtEBNDPuksr348lgVSKD+Z7J4x6X6Rdpt9QsGCa9kn7QQHrMnW5gAWPsLle0iI
 cS+2PIzHMX9Ub4aB1jCSZS/3BzqB1TsKcaAMPHvwTmOWdDSN30HWzhU7MOL/Zyxx
 vNas4EITLiAW5oCNtyLoKkLyuWLSYsAvuGuIkIfzqBLyrNIOqH2AWVeZYpTxOHDM
 dAymAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a5q7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 19:52:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cc39363cc88so1309296a12.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788378754; x=1788983554; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=o9lf+tLTFMt2mBgZsTQ5i9dk7TIdp2RTwx0PI03Puvk=;
 b=h0YeQI5ekvSlhKROsDPgIfZul+bvrC2Un4uYm2siDeffe83h1e27jzFx/rgIXGLSGh
 jEzM+srulAwKL/EG+5oMxR6QfnOwh1AMf8jNtBhOZViF6BOfatT0IDzY4I0hiAplC4Vr
 SqhIsfsSA+QJH0XDb2FLZP+8t7KAeIYfhwg/GXm5OScuwOxRvNi1XBTqIZ2Ih68APXt8
 3RBqpqbDWm3gBznKfsiYdM827C4ZQuaVnd8CjVvc8jsYtn+uKFrFJ5DnWtm0bR03SPD7
 2zRuQ3ToCnAxnXbw8NHwCzoDk2HbC8q0lWwdhzD9u3awgOhO3I77+BmcdyBfZFsNC7TJ
 8GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788378754; x=1788983554;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o9lf+tLTFMt2mBgZsTQ5i9dk7TIdp2RTwx0PI03Puvk=;
 b=tQUf8hnuyN801pHBTCYLEDhEIOl0eP/SYmxvfjaON8eEXDaagzjD8DNQEBmGX1U3hZ
 LEudp9luON65RbOQ641xmYVYSKk4LszJ5z56K6O634tA73Z0o4nf80dq/5bys6dzrtE7
 wrjgC++p1VrDlzjSQ1gvIlEqfobkoBb8SfQCa72tGTwMBayaYdRAd9TR64Jg5TU2C9+X
 0WRjuhgqhxGSHyxBtBA1dxKSqX/wFr+AtLPNqAGzooFgAQ4j+zffVH6nm/us2wIIwmnq
 yzZv9Q+k9lknbBPehcueT0EnaMF7EaZdjJAcZE59z/R//PJiqD2+Y9apB7Eg0rIdqs9U
 VQyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwjXWNc54xypWyi5F/2eJKpbC4YMiWfeFymEV07H/GJX8CteBCUeubJV8PGhSNVhkR1cCS59ABK3IzZ@nongnu.org
X-Gm-Message-State: AFuF++nRt0BdjmVIEdRcjqimPLcAyStPfn/CuvFFr2cUHr3UevHk+pug
 JxAvP4lhprfpKCDFspIVja43X0KdUycVZ5u7oB/8DuOBnBQ42YD8PvR7yomELl0PRKAHoOhxfiQ
 O5BKjdKORmBUzwlaF+eSal5TzRsXC91l2SqkaUOFkh3isOw8HXEDsoVbq8w==
X-Gm-Gg: AYBFou1E/7TzTfnCvqFDkIy36oDuuhQAQVgKYaqRe3O3tfne5VP+wUaDev/Z2sJP3YP
 TD51NQQRrIVlC5+bDyRorfproCqew+jOL10XrO57FnpDz9w0bRmfur3jVTqt9hnYec7SUlq827C
 ZN4rmxNmnihe07YkVjrT0tcOZ/39+uhfmvR3D3jS8pHplhD/8sbtgiKv+oeCXZpRTWsspBa9ckQ
 VsP6JuaiboI8C/VDKECUbiWr3m70aaa6PgCkR8JehVH6NjqLcpKpEQJa1/iH0RoB0UemtgDyNoI
 q4WAn+EUHG18sEM0JcZE/uzq6HBoHoDfIKuG7YwuPHWJQsxfO0PHr3ds1lc9grMYI1EwpRuUkTz
 p6s1dDAerRUU/1R3hHckc+EvQ0b9mZfTZ2SBV+6619ix3fa0Pmkhrk3c8CXdrmNS1IrSG
X-Received: by 2002:a05:6a20:728c:b0:3d9:3626:1326 with SMTP id
 adf61e73a8af0-3d9ac3312dcmr11068104637.2.1788378753663; 
 Wed, 02 Sep 2026 12:52:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:728c:b0:3d9:3626:1326 with SMTP id
 adf61e73a8af0-3d9ac3312dcmr11068042637.2.1788378753256; 
 Wed, 02 Sep 2026 12:52:33 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33256416966sm307194eec.23.2026.09.02.12.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 12:52:32 -0700 (PDT)
Message-ID: <cc7bbe77-6257-49e1-a8b6-eb2c3f24f241@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:52:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] target/arm: Call arm*_cpu_do_interrupt directly
 instead of via TCGCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-2-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VqBOqkdaF4f7253ZK1uRZpQF0qDRRi4i
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a987e82 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uK_-vC1rlBskaMxWXFYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX1Ks6lW6rV3i3
 OPkgA//LaKmNjyt9yi0MUnHgjahvtCsjH7bGWiHMw5y7wZPqR/twJsszTpZaZMqAdEXUV4Y6Fex
 u/Nfyw6RnLuASEG9M3J4uUFLQUnp0nLCHun1oIgLZebXIagW2d4vl1Um3NmDWUAsOjwt4yCZQOv
 nvUkA9Fp7lt7kpcV/xVkds65N4W7Quuu3kMBdAmyfProC6VDrf3puQf0fMNxdOfxFxI3Wuc+qtS
 DVBIlmlaPRQW2BD2pj+hVooKa65/f0LQWLAOdCmnub/Ny1kSMtIPuKX1o17dbbwfo6ztyPUcH5H
 z3R0HajHVTdH9O26SfOscrldVsCxsYNybEz9F8TPukCrC6v8x+QqLZRx1bcId8cKvsm7pBwKzB9
 cne8k3PsTl4jz3mtfY0v60Ylr9KSPokMINv0NA28NndrRGWGgVQMF0wTxOz8O4TcPM2fkYvXxqI
 Z4GjjpK/cD9UUyvuauw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfXwS5u4196vq7x
 moraDCIJxS3VibHr/T4GlxgfPuMU20k1PwKlmHXw4vngjVRwI37kYb9P5AFr1ICtAINpeZrZUcQ
 Awt/8lKkKy5fPmoyHBgSdHs0tvO+BcU=
X-Proofpoint-ORIG-GUID: VqBOqkdaF4f7253ZK1uRZpQF0qDRRi4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020176
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

On 9/2/2026 8:20 AM, Philippe Mathieu-Daudé wrote:
> The TCGCPUOps.do_interrupt handler is a target-specific
> callback installed for use by target-agnostic TCG core methods.
> Target-specific code should not dispatch through this indirection;
> call the ARM implementation directly instead.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/arm/cpu-irq.c     | 2 +-
>  target/arm/tcg/cpu-v7m.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

