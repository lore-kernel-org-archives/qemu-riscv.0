Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEC5CA5FA1
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 04:33:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBPX9-0005mc-2B; Tue, 29 Sep 2026 00:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBPX6-0005m7-G5
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 00:33:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBPX5-0005W5-45
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 00:33:36 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68T47Ifc2775210
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 04:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 430JWjEgr62QaEjikqEaUKiyLNIOLP7cl7lk3bAOOko=; b=MaW08szCbHjN2yqJ
 TdcM0wMKHXZ4i+ymO0TbPobNFBp8vXx54uuj1BlXJC4A99Oy3hubO6nMrc9yFhi4
 XBNepSiPJFCrriFd6vTpaybGaGKqaxWWaQaXTqAHdnWelxN5lBnIFdZ7fxrppiYM
 4l6u4qZKZ5S3OQVina4OfdVGh/4tpieKPtIv6SDdkkMJyC/efu44sQmVA41hhG+e
 LXnVZ+SGPD11io7eoSqKCAlOFPYjIrHBiVkqooOnnOkXvD6KvnudCROkTpg35tQO
 jZiPZjSQ3/3F0mGuTL076TWXtSwdCnwie25XuniYnz/3V+qUKwBqsIP6U5pEk2Vr
 vyXi+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw224wd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 04:33:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-90c8da50f8dso88225416d6.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 21:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790656412; x=1791261212; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=430JWjEgr62QaEjikqEaUKiyLNIOLP7cl7lk3bAOOko=;
 b=kP6LubDqyQnBHRD1n6SB2/cDgLAUlT6ksClM6KtCpplyyuFZOF2v+c3V7znswm9G+s
 oMTrhT42ggDEAJwifVqRKSw4faHW/MiCYoTJUYZe+w/vimaCZni2OF3uGahK5eUNFNCE
 ID2iR5Uo9rdyDskUtCYG5VbMhCQ8O1VDLoI/xPHnR1uELRGrI3DHMcF4roQ2PmkWV48j
 Y9JwKFZxDoJW2oKXV4YBMnLzA+SU126Iz71NIz5faI4M6UC4kN3tG7RT+rOaU71ATYq/
 v4EBhcQG9w3ShZhjWzlYZP+lTZXFTRWUlmGQA0d2gV4W7FsV6b5//OuLpYliIoiOZ2uT
 rNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790656412; x=1791261212;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=430JWjEgr62QaEjikqEaUKiyLNIOLP7cl7lk3bAOOko=;
 b=M4UjPbS2/Rv8nXWX3cWz89/gCbInTOEwEMImUw9pEOiKnl0YrSDsTNK2S0mZyG2rlR
 krQh0FWs2cTzmTdKOLhTp+RaqmVfTn3pQ3PO3n9TldfBSaEFbMUZE/RnZ42gKfwC3Jse
 7qlf+wd7B6+TteiT0c/FUFm5OoMcSnz4mofyrvsoqrqVnSDSS0Rs/aBYP+VfmMjJ9XxA
 HxihBD4Q2JwDONker0TkEUn/K8yak1DFR/kbe15i4FqaakWlUCP3ykajQJDGDHKNDd1s
 wZV/gLMwmMLCYAxxPTxiKv4yLHuuOYo/K5UJnBD/OVc7TyKEFwrm3VnOBSeIMSZN3bPj
 QNCw==
X-Forwarded-Encrypted: i=1;
 AKwUvByGQ2qrX1gUzUIhOA+6pkQssOmkTp6HyzKY2SpKJiqt2o1jWofO3z1kzkVy/fPzG4X3oYP8OqCamE95@nongnu.org
X-Gm-Message-State: AFuF++mqsH+GSGuC47UWLSrCbrlSGqMnve0K3WsfHOVh83mlPxzMddbf
 QbolnmmHCiCCZiGXz7W10ZXOW7VUH3/h/7RVI5KIcare5EWdchl0rK2pGOEu8gmVAoZUW41jtas
 I1Vix1yrUVyo+QtcfNwBMsynDMxSsD6vfX9RrWKjQDC0OV6tgaTQlGl28ng==
X-Gm-Gg: AYBFou1ZBQQRTJnKm/zfgTlr5Xvb3AjrB8S5wlhDMJhlPvH9hlPNmvuaX5Cv6BEO7CI
 Bnwc01GnFr6RymWB3pIG8OYT6Y7QOLMryMmqVawf4UD8aRwermcW5ggFdVIxhd4Lu6pliT43b1y
 JFwRayHwSt2WjKhfnTuHhXQB3xznV3wIDwD9GLmateEk/KZZjucd+sT79Yw8OcrhLPRKblKqvqx
 +ut2x4FU71/SikyJOFaKx0hc3VW5WKKkbuhLHu2dmPYzL1AQlaxKX6eS6M93wtZfzU0w2uUxiYw
 0AuPq632Uz8KcNfJFyF4wnkSPVN1PfFo05y5899FGI8M1uJ6Iw43i3cu3IK2qOAQaVIcb+rNKmh
 o8kI5GYw6PvQair7ecT0=
X-Received: by 2002:a05:620a:1b92:b0:93c:3d7e:6e90 with SMTP id
 af79cd13be357-93c4749a6c1mr2235235085a.32.1790656412151; 
 Mon, 28 Sep 2026 21:33:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1b92:b0:93c:3d7e:6e90 with SMTP id
 af79cd13be357-93c4749a6c1mr2235232385a.32.1790656411551; 
 Mon, 28 Sep 2026 21:33:31 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af508b13fsm601732f8f.27.2026.09.28.21.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 21:33:30 -0700 (PDT)
Message-ID: <a6554812-f075-406f-b364-8b8eb6caac1f@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 06:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/char/dw8250: Fix leak when creating child device
To: portias@oss.tenstorrent.com, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260929031644.1016354-1-portias@oss.tenstorrent.com>
 <20260929031644.1016354-2-portias@oss.tenstorrent.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260929031644.1016354-2-portias@oss.tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb3f9d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=QTt6BuOzr45adi7bDCnRgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-ORIG-GUID: ftz6vMpNTnl1iyAbF-TmX6d1u-nRCDFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX9tCGhXrWcj/l
 XftyRcyLXqou3nIKM7hQJW1WFX2E142tBIFE3Cc2yT2s6oPAOi1rTtrnixwCPVhXBijHwCax5D8
 sfiRZWZ9rATXpFUz7GvXur0DEiAWF93D4EjyA7Vkj5Z5x8HOXW0gadoaoRHddtFTEMu4cDQx9tQ
 6wtJQ6fkYc/NCngpBE3xo3CO/agREjIwSr2VdmboH/qlZf96CKKJtTtO0n4L2LQ9cgTtTTuhCmW
 rYMMO4wfXEdP1VwoGZnqlLgs9ssYEmy5xfQdLPNLrQ9/4w4YCB+rV4yjHYPc4earlE95E0pdSGe
 /GERl9FeGUlBKVy4h3DTsbfGUbKTi0TOW9Jq4ZCyhizhB0eWKh5Kj4h1o5JYMt/w5jKLPO3R/SU
 qGUi4RXQaCMd9wuwLhMD/KF/c4Zz9DvN/TTQgaU6DgmHO28D+5mq7vipnO+mWFgewMNu5fG16Yh
 5GlORZONDck0pIm3R6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/hVkIchEEfbY
 SpsmVUGZBTJrQZvg6I20/oOgyk5Lk40bVWz8MxilFxAAAGSA3bWG1/h7iG5JUmCelrM+5KpV/TW
 VI6qHqi0knt7lWJF6Wi5im/nzee3QlQ=
X-Proofpoint-GUID: ftz6vMpNTnl1iyAbF-TmX6d1u-nRCDFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017
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

On 2026-09-29 5:16, portias@oss.tenstorrent.com wrote:
> From: Portia Stephens <portias@oss.tenstorrent.com>
> 
> dw8250_instance_init() creates two references for serial_mm, one from
> qdev_new() and one from object_property_add_child() which leaks the
> serial_mm object. Fix embedding the SerialMM struct in the DW8250State.
> 
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> ---
>   hw/char/dw8250.c         | 11 +++++------
>   include/hw/char/dw8250.h |  3 ++-
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

