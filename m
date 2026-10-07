Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4192CCA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:36:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEP0I-0006CX-9I; Wed, 07 Oct 2026 06:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEP00-00068v-0H
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:35:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOzy-0007po-Hv
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:35:47 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jhn93298365
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8a44lFmsaqF99pzdmLjXZYXv/Q+Jj5C5KYp7ERYUtA4=; b=CSWTNBVuXVZHvi3x
 wjYVkVAsA5O1SdleciXuLZT/7KyvK8ccpoxH1BC6zXPH5Mw6ps39Im+MFGc37ZcV
 ck32ilcwZKki7jj03JBvNZknvATUspvMhgC5LjrgRnmsgv4gchecSbTnUAmbvyOU
 LnEn/5jvJdb4EPYW4v/h4IxMM5ZkbvwUQ+8tZJv5XkMN4A/QbNPREnhMFTjHUCjF
 YlV9M/Z+/cpr/e6+9o0j7bbt7yvdvMpKtFXU37XwoEvGJiGWu/0d1N6igN335jlW
 8jSAR61QjyH2zPmbUsI0KqJAjcRaybED+0IommMOCRFgOZ2iAX3mVIsnz+dc2BaP
 rL9pWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrnt1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:35:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93caf7856ffso686241485a.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791369344; x=1791974144; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8a44lFmsaqF99pzdmLjXZYXv/Q+Jj5C5KYp7ERYUtA4=;
 b=GU0H19irIYIxSpMy4Pcwibzh/MHvRHqIi5nvND8EDSpTT+vWT16MuevKcurxtaIZ4j
 SzJNnd+RfSYcd/Af1dRE/0ZExCmyIKEbY6sNGm9LfNNYojuijl1WGwUjaAq+mMSGwXNt
 +Tw9qeizXlsDFxb0XxTSas/2XA2DBVbhSmCPU/AdrkaN5mIG6ITgSbtpEC3YZCq7ywi2
 NbQ+sZfz/fEFAOGo1671VFWYC4WeMxULIN/WVDDRKNo/3/JsGsjavdygogp60rUFIeKw
 C0ugBDB7VVhkxPv9z7dgfSno0FCeBmDcCOu17haOonbmVbzttEod9dpbGUhEatREuLfQ
 GnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791369344; x=1791974144;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8a44lFmsaqF99pzdmLjXZYXv/Q+Jj5C5KYp7ERYUtA4=;
 b=FPTt4Fp9NaJu9nIPLmxPIUzAT0w3hbKQxyvbLt1GLeAqbc+GuN7ZWUbanXw07lkDEp
 PAIk//H6Z5wjAAJuNWygvUdX8HWz2WHBCsCtRj9i/Y479X/TptTG5GZ+qC84kg4TFDDw
 EVt8zbZsqh9Hzh+ABxJ3n+1eM/oPrF9D8oDSIHZQXB/7Kr1YgDEM56uBkrfITXTAupTY
 zPbO7ih/U7ziIFSZ6CUIiNN2vC+Yo/l2LH8TGzryb6hrag4qZ13u1ZvysJDZ9osYaS3/
 i/x3pvenhC0HFzO60Yo0e4bAuq0eNACS0eesRwXj/X1JZmgDYorsQ4z3rIIV+wSWiPJL
 BKHg==
X-Gm-Message-State: AFuF++nvGq4fxzs7DavOOMJ4BIdjkGrc+3CHNcUF/5OKI0xMg4CHCyBz
 kCvNyEfMtG0HxYYoVu4ui8d9mFRVwpGJpIbWk4xUT/5+COd0DiEhz+cHUmZBOPRcrJi1G5DLoym
 AHA6hbHeZxmEiaq0/kepnjJvhY4nMQwN7JHxPPownswOQoTWoxyuj892zng==
X-Gm-Gg: AYBFou2f6xuYaEMe9EkX0vh9FzBkIHAd5j3xPi6IKnYeKcn22dZZqEE8zRSrHQn3Cou
 UVbr2jPpurJAe/pEwx3Q+tcIgSY1s0eKWZ7wEO/hUpxfHBceXNqtObOdgFrN/AvRdf74a6gFV+0
 eshiD3hVYX0FFjFjc/chNxy+mgz6lUFQvWLrwslVk9tUPf2iHHG3wrr3Uya8qnHXXdzQDO6wb5E
 yJ+9BeREKnY3A5Pwbjcq0AP3tB0oygYxVGEb2jnJBqBpD5cX84gvrpaPXJbWGZ8zW1LKlkFxwJq
 YrRRBF0yk6KCn3IjXjl8w3ZMnkRNnkehO+s49+K5GRjwpdkHbWFkiYFjzi4Z7OQgz6vKP/yc2n3
 RN+v0MnC2Rw0/EkwWWMwpoT4xzeyryNI0Fg==
X-Received: by 2002:a05:620a:838e:b0:93b:e6d3:3145 with SMTP id
 af79cd13be357-93e9b890fafmr341648285a.64.1791369344436; 
 Wed, 07 Oct 2026 03:35:44 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:93b:e6d3:3145 with SMTP id
 af79cd13be357-93e9b890fafmr341644185a.64.1791369343839; 
 Wed, 07 Oct 2026 03:35:43 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f5510desm53070525e9.7.2026.10.07.03.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:35:36 -0700 (PDT)
Message-ID: <ebb9178a-c2eb-40a2-b217-db93e76bdc49@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/18] target/riscv: Compile machine.c once
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-16-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-16-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yqno7Fd_1l1aC7WHnz1rom3GTTVC3Ul3
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac62081 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX1wUHGJqtQ8ns
 FN4jPFnZ0hZkT/3bqhWi++/uPRqz30Z52MnDj3e27eNa/D62rZNbsYz4sWJWkSbc9z+yRikRib+
 Trcba+7HFk0lqL439IBcAA9h0H1cSF4=
X-Proofpoint-ORIG-GUID: yqno7Fd_1l1aC7WHnz1rom3GTTVC3Ul3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX7d0R8GO1VM5j
 tM6Ak6QhJ+8gv6+nFb808TT1mUmbP5m4J06JanObdZNQlC27meGPU5DIL2ZvnPsaP57mRH8Vh67
 HN1EL0jSqFslFBA2l7RvrrZurWZmxOjM2vzKsSLImHvD+G9/CsAmGgsxTBmx6VCDEJ4ZrDskeRv
 oooDABOFr3GPe/XN0BEqmOw90lLLoW/QRfMKnl62a/T5pdtpbhR5vKWJMP1wn+XXAB+WCbSW/gD
 dTk+0CaNGp/MBEXexO8NXcMrVPZPPbcxJGolF2Jq/Rf5Kj3yLYNk2dKEe0fY7W85SKZvzIH4fyB
 YBKh2E2rU3/Wpo56iPpZ5jBbW3fyIuktXdlx9GB6q/PUEKOzOkTzc7RfMRyzRdrsRDFSg0uzr+3
 A/ki1P2kU0n22VfY/qItkOwLvDp3T5tLKZTZgJzv/LwYOgJ5KGGlW2mQ4FtJSoCPotY7VTt3OKe
 JjeoO1FSZWTs/rf7Cog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042
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

On 7/10/26 10:43, Anton Johansson wrote:
> There's now also no change in migration stream between KVM/non-KVM
> configurations, KVM fields are filtered out via .is_needed().
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/machine.c   | 10 +---------
>   target/riscv/meson.build |  2 +-
>   2 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

