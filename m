Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407AFC61DD6
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 19:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1r0v-0006VI-Jt; Wed, 02 Sep 2026 15:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0m-0006Qg-TG
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 15:52:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0j-0007Vd-Nx
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 15:52:44 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682Hrh1B2730695
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 19:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6Te+6+lQS/EW8h6BW95iDe7+CWxLjVFrpGbJ8eltH2k=; b=ff3WpydxxYK7v2m5
 jwBGQL6YIvJt5Ofl1uZsd2nBW7tmcy05rF98jv43wekJ96QE1YhsC0TSNnM6LLJl
 8ITDL1LX31K4p4gwCMlbMO7hWckkj1MzFUbi4Zfi5T8N5HXJPx+ismDjW5BIdsCZ
 8sxVWvd9RIkidCF3sRioZyFKgCau4vZv+6v5at4JyWtm5TFC6RgqLt0HjWq62uuZ
 XC6R4iZrY5bcggWyFeZquYaoUvShTeB6XX5kRoxD4kL+ZBiNN2S3nwShvv9GS1Lr
 va8QDl2GyKZPnUDrG5Zh/jANSHlBlULYGrsIVyf5FUUjzAOmPE6hiDUCRiDsiODJ
 YLHbnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2qcj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 19:52:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ccb687f82eso20058605ad.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788378760; x=1788983560; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6Te+6+lQS/EW8h6BW95iDe7+CWxLjVFrpGbJ8eltH2k=;
 b=kJbNidcZFW00t5DvyhOawfIWaTtxE4LXrUbSnMLITx/ozP5pXRNWpD5UVnKPJ66iSm
 Erd70/HFuOVCz6ob+AStmlGJg+QOMWCrGBUqf94h+M0Yz8C796Gs6KkeAWYSL0CKNa2K
 fYFJGJmvGpBc2pIAOQcG9cRscbDauuW/QnH80rBARDjGtbYeNvbqgOUaxSIn5kX6XjIL
 rVie8CWekD8+wlMJ+ZU+t4HtxzEkqZnPyHVE9IbeSWLUc1Hw9is9yG8a9QM90gOQQkZv
 pw/7ApyRv8u3T30n33fTw7bylcsld6hSKNbx49tsWcTIkoGRGkLLL5rIOF0utOlgkm8A
 Z/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788378760; x=1788983560;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6Te+6+lQS/EW8h6BW95iDe7+CWxLjVFrpGbJ8eltH2k=;
 b=qyCWdULeY+SpbzDNyJgOHv+42I9NP+2SEI8rYgT1UUV1UZSw4AAox2Y0Jq8pP83yyY
 kc/v7YpcBIMfOcSO/S+B8Zky8zUO1Dvvv3hagYda/XL2XS1i+mqxZYwd2m6iEH045MBU
 QfIqk04np7cn1vQ4ONZ9V7XCOCiA7StWeg31ygtgi9tJXvXCAQtsH7pa0MAIbbP/NtaD
 s99bEwkVsEPoGqP5ufVzVev/2uxDfTCL6gP7glCyJZKI8pWLfEywGQKPhjWcVvo3wzCm
 RDr32W5cOGMg0AAK87PXlTB63QjA1HCAUVoBTRR0Nk/5dlql1ub5Xpmx1h8pMvAR9aN7
 lAJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx+74B1ov7f7OwSRo1+zQhpmRLkfw/zg2YtejnX7pVu1OhgG5qhOX0z7MpbAdLOitsCp/fCzrXnX8WD@nongnu.org
X-Gm-Message-State: AFuF++nk9uuaKYiIsGNC4zGkfI+U/aDzSb10Q5gR8VOuxIphhaXof61F
 9znM4q52fR7lLb/iEQpX+9RN2CsrBhhYjJus65aErhCeHsy33BAxtK/giBOb1LAKckqPhAwlawO
 Vsgj5uzye8y6ZtwvvLkJmR5R8LD/yeFkFctTPcx5KKCNP21yDpftX7vjYwg==
X-Gm-Gg: AYBFou2Ur5wybuWWdFXfaW5nWvwFPOp9Wl99hxrXtXN7ra+Ge5SF4YmEzprQqV3vYbB
 Ilx6u7K7hn588ikP+5A4hf66FP0/8pErINg5gU6nJTUrhIuMOamRgHE6LkeamujvoPPqHM2DaR/
 5pGg3HMqbNWAwfb1klTz9OuNrpwHg0D3KLZbFszZKe3TpVBfSC65UuB7Vp9po7W6bZb7bTsi4qV
 1AOvxXJ56uE+Lx1lrKleHOhsCh01Z5M/7QwnD5+zPQ59a0LOvAodL2nXf88Uq/nil0o3znxxvKP
 sU56FBV1k0lEF+VNAtbUbDGWc8sRALhHwvte1uxe7sRTZB7yGSv8qxSlUFtarCV9UWzP0+pQR68
 AGb47LYRaY9xUwyGptSFxNF2ywDxKCmbStSA9Fkfv0cXM6NgyoL3ChTB1r8TMYo0QX6jq
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id
 d9443c01a7336-2dafa6ab21cmr26976315ad.2.1788378759578; 
 Wed, 02 Sep 2026 12:52:39 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id
 d9443c01a7336-2dafa6ab21cmr26975535ad.2.1788378759129; 
 Wed, 02 Sep 2026 12:52:39 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33256416966sm307194eec.23.2026.09.02.12.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 12:52:38 -0700 (PDT)
Message-ID: <2f0f4aa9-54a7-411b-bf59-7c8442b099d1@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:52:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] target/s390x: Restrict interrupt handlers to
 system mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-3-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987e88 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1EuahR8dtqhgXXsTjK4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: _Wq9dwB-KDdOHbXXjQRM6pnAZaIKnHC2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX2OS5VV/vXpMd
 xS9jBzMkLaKMTi/ERp7XMvfBSv2gWtdcC+77g6N1/E4sAgpodaWS+i6KU+iDoC/gRJK3TO9B9mI
 wousN49el3uz65u1e1lyXm90nIxvuCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX6qOH+rsqBDy6
 vL6w6FjE/06f+Zg45TJWuyYTeYMA+uMN/+Tr6MCK2y8KHYz2UI4Zrdzx+7+OqZlangLyNYu4hJx
 W2M9kphhcnmLXLDQfysVm0XmT4kHnRItPbmrghx6e7/yyUApA0plD3oUuZeAcnxJaVC8Xb+xADg
 4Sn0KwIqFhuZsbVzYhAZSnuHyzY0p5bcNpifhmhUlJbWosfxDv7QiNtBv+x0M+LHWDzvkteOUoa
 qu4L7lkeIOPjjD1iBT+TOTySfHOXiWA8sYJ6qtaQDjjvOCXhd+reilxGC7d+XibhkP9JXPvk8BZ
 21hu6l+haVtmC6lId62yV7enasYlvrlf6av/EzOET+elgRF9ajXzMPOAWFerdxuJ0fCLDz82Rhi
 eYaik2umKj2w51N3/ghBXj2VyMqZJ7eEbw0Ak6E+8OnQ8eNifYMbsSgrp8kBfMzgsnZpU5mA+62
 XszMLH2vhv+jpcZRgUg==
X-Proofpoint-ORIG-GUID: _Wq9dwB-KDdOHbXXjQRM6pnAZaIKnHC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
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
> Move s390_cpu_do_interrupt() and s390_cpu_exec_interrupt()
> declarations from system/user shared header to system-mode-only
> section, removing the unused user-mode stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/s390x/s390x-internal.h  | 5 ++---
>  target/s390x/tcg/excp_helper.c | 5 -----
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

