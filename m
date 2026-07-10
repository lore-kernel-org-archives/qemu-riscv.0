Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA18C44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:49:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJ5S-0002Mb-6t; Fri, 10 Jul 2026 17:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ5O-0001zp-Rz
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:48:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ5N-0004qb-20
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:48:42 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AKDfrJ1811834
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S8qlgycSTJcCt1NmO2CiYGSD4smZGGH3PoLh0rbZ+uU=; b=MIzXo4w8iL+3OeG7
 5NrAITxP8ECO33rX1xn3fpeGgEL7/w8ddX3xoSWRPMxszm+nr0C7O2IfQW37LlzF
 NYfoQMzvz+N7n0nCAUHqPjEcPmX07U8lH96YhUl34Tl9MSYE0nC+T9qlt2Sku6Wi
 8PaCxSIelbhyxfFnLUbsUtr7uMw5JUnU4yS8mSfhWV/6kNoyE2rgrmM7hQuHX9Cq
 IGSj9Eb8u0qas3JvR92PVlA9uh+q5gDOqrYQf6zPpo6weIe81oAacn3YciP7WLts
 stWXOQno74HacJRYmPtaL69ljY8aMqoiTEQdsVDY6r9tzS7TOPfcpDlSvYv8WsQi
 syQGpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5faj3c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:48:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0f0a0760so26889811cf.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720119; x=1784324919; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S8qlgycSTJcCt1NmO2CiYGSD4smZGGH3PoLh0rbZ+uU=;
 b=ilvLU4AEKiuJ/Crysdf/ddrZght3QVA9isDFkJ6XetiHG8WpeaGxJwqduQw6t/pOph
 vR/f54z9ItZ1U35jW2xOsn+FmRTOO/P9KjytuJIiXNJYgrVWzsb8I3qvdj0JQ5CdmJ23
 QqHfjOA+rWw07VHdOWauJa4xynkVFX0B1F+aOzirtPqJwKlcj1Ab6deUfspLZya2pI6U
 bNV+wdJOMiW4kFz0tXBzrYLzWeoHhCLLmCRO9awwcvjv80xWzH0K53CH+e3RGDj9/awp
 VoRw/UQnN0DG3aeOCnGYRz1RciLQm3Y0UZ64136NWRfL918aRs9Uqu4Xp8kgtXxZWuSR
 Anjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720119; x=1784324919;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S8qlgycSTJcCt1NmO2CiYGSD4smZGGH3PoLh0rbZ+uU=;
 b=CBdXFGfoji/b95g9BABzeyqmmz2aSjaIGcsH0VpBtl2gHLhBYcpoVQ1z0hA8ay/CIg
 ejqh2nII/BuEEjqYweSPAZY0JGPLzc9HcbFZN3lEW2kdKnf+OVW9S+JQfRUsV/ejVwYM
 imLa3r3YTQV9I9HQRr3dchACZc4qAcF7AdGiuOOVWikFiF7UwFmLJunvxClLKn04erlY
 ifLzZXiWRaJD5r2sLN9JNhgNT+qAeSvVpwElvkft8n9hUnH9t7BMvUAcn16hquPeInrT
 YqB3ED6hNOiDdD1JJX21aafY8jL2mQdLzr5LlpF8UCNsWNw/KvB0YIKoUYHdBc/Pq6kl
 V2ZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoI2WkKjio7hn+ENT1K91KS2ZUODh0kIN5L95l+n2Y6fgqVFdkh8m4BnIAHZ16euBUsyAqp6CXpxf8w@nongnu.org
X-Gm-Message-State: AOJu0YzuyZ/OhrVGRgl5YQ4C7wcAqz+JWgXHB0lnsm5ezGV9JGVxvfI/
 MP6lYkPyQMicrHGZC0eKQv6fe6vSZ52f7LD9xCYBEjCaZ0xrP+5t89x0I/aB2G55KOIoAzxxcgP
 hus2+0RuTFlTfQjdoa/tpq4z6Lc9P1LuYv/0Vq2XBp60IssL3ksj1zaYR6A==
X-Gm-Gg: AfdE7cm53yyFUYtv09l7fiDZA1tCegYMxvhyhucHahYPjSycSGaaO9Fx930QDkERoZn
 ZKprI6s5afeercQSASda9SfeXVhSiyElNBuQRP/3teEUBF6O54C3dZAAX3oamdfL2aeqQORKfZL
 OEO8dJDvG/XBSC9Tk8+I0RcXHff3SZ5RegVzHqlqllRuw8YmTZAtWMRiZsfIUoTI15K+hHg78s6
 tS2PfsBPPLUpkzbQU2gd3IIVbA3BWJpBWAI9TCxLoCWDz2ipWuCTlVRVmsrGcgL06NkjDE4feJI
 YfSoXx/Sm9mAZD6kagjUW0a5a4wlSiy7/vx/uwL+oIc9gGE1qzsHvk6tCzNw+zGacoRvwGOitlc
 Eh/h1ee6PP6xi0zhG5AINFBXtreC5lvGNRXKHzpH/oxoFa386pMboB+Fh+TICLA==
X-Received: by 2002:ac8:7c4b:0:b0:517:6d82:ceff with SMTP id
 d75a77b69052e-51cbf0c4a59mr8214551cf.13.1783720119489; 
 Fri, 10 Jul 2026 14:48:39 -0700 (PDT)
X-Received: by 2002:ac8:7c4b:0:b0:517:6d82:ceff with SMTP id
 d75a77b69052e-51cbf0c4a59mr8214181cf.13.1783720118961; 
 Fri, 10 Jul 2026 14:48:38 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb73b161sm149404535e9.9.2026.07.10.14.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:48:36 -0700 (PDT)
Message-ID: <e37a2ba5-f43e-435e-897a-6ff0ac1573fe@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/51] exec/watchpoint: Add CPUWatchpoint.id
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a5168b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fXGwQeFF1h1RlHq-LvNw2GAuL61l6Z4W
X-Proofpoint-GUID: fXGwQeFF1h1RlHq-LvNw2GAuL61l6Z4W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX17v1xaPZ4rrK
 bdoVdssOfCpNCMOjbr70Nuw88rdkQEa0/ijo/ORTDMc6ZanRfwaWDkbszsAZJo9nu06vieAIfl7
 iNCG+NxV1Mn2vDuLVSta/8MOPp/fT0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfXzojgORETgxOy
 uxZaIf0msSSVYaEycHL4m3iEiGEPxMr60GglRWq0KnazOzRf2rUw0/jWz50QQ0r6Y1Y7femxmjT
 TRiEJyhKmJ8Qe5lkthjmo6luAIkYq/QyaPZKe02flE55N+YL90Vq1DIbYUCozSMd+W4fuAMOGwJ
 xvV0MdXq8A8K+bDBM7lKfd3CxC3KgeIwCR1Tb3cyAdsvbIJ5zc25aprKZCOlMho3mU6WbYxYqn/
 iIWBx+uQfxahTLjGfkPL2YyeSFgrZeFJ5IFw/HZuJQg4roZq2/l7kVCEgWyTN16f1Mn3KQPDGKJ
 Yz+RQZgdGIWMNzSEzS+B/CSI7qg3SrtS+N60hkcW0xgFWMH2eioJ/JndaNbG4x6SvHW4P6GlM0L
 pGcEjBwxMylH76R5mnpHr3TgLmJZf1Nl/Q1YFFCo2DUhojhY2x+CJ2f28/+E51ci5RPoPKW//Ey
 HGjkLL68eL77Nb7qtBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100219
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 10/7/26 22:53, Richard Henderson wrote:
> Add an identifier for use by targets with BP_CPU.  For most targets
> the index of the hardware breakpoint resource is to hand.  For s390x,
> there is only one resource so use id 0.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h           |  4 +++-
>   accel/tcg/tcg-accel-ops.c           |  2 +-
>   accel/tcg/user-exec-stub.c          |  3 ++-
>   system/watchpoint.c                 |  3 ++-
>   target/arm/tcg/debug.c              |  2 +-
>   target/i386/tcg/system/bpt_helper.c |  4 ++--
>   target/ppc/cpu.c                    |  3 ++-
>   target/riscv/debug.c                |  8 ++++----
>   target/s390x/tcg/debug.c            | 11 +++++------
>   target/xtensa/dbg_helper.c          |  2 +-
>   10 files changed, 23 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

