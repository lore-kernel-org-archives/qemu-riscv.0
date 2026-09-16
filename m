Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE1FC982C9
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 17:02:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6t1l-0006d0-TI; Wed, 16 Sep 2026 13:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6t0x-0006Cc-NC
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 13:01:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x6t0u-0004JE-8P
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 13:01:41 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68GGiRdq210634
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 17:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZolQz/GGoOdBiEJnnGRQvS+1BwghJEpbEm1nAnYYteg=; b=QlFCDl8da/YfQmKz
 VyjmGJmU5Mu9etk82d2C30YRRsEloqJofMx7Htos1k1ViBo1R1/uWm+PLMvThv+1
 iSOs7czWR4ImSom09lX7vN1mRUs6f3+6uQcyIgJ936oma+EybmJaRExlQz9HjR3p
 iXjQWJE41yL++6IRAZPH1NoqcBe9oUGwrasIvVwUFhL1eD3ACEauM++nPenbhxOZ
 kFt35/fjr6PW65M9hHSfliq/xcJWxwa//N2AdePQQxfXLb2m9rOeqYVuQZXjmale
 xVG8twBSRPdIxP3Vb8GtuKfxwED3pLpLZtLJ+NUzomO1zTYhgnccgEK+0BEIcKF0
 EFkDwA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8r2w4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 17:01:32 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7f4f0a1f4f2so9713168a34.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789578091; x=1790182891; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZolQz/GGoOdBiEJnnGRQvS+1BwghJEpbEm1nAnYYteg=;
 b=g8ODv703GaWpYdMBgDqS2bUe2+KZLcqLA34sCb8imQjT7nEWG3nYQsKC9kgovU6ukg
 6532ur9oxpgJlUDUCVgZFb3vbCu95Y0vwYxWvnAG4QeivubcH/AWRcyb79m8yXTbO95G
 VTHwWhEw2Wg5t7Hv+e1qYVyDpxYDRbFdnw8LQuhel8DblJE9twRjueKPA1egl2mGZa2T
 klth8jESRW3d7dEdS2jrqJfXqYNK353n2eZlCYtymiFu/vMnt0zFlpPw1pYu6C+gmhSZ
 satVFRMC1o5HD1QxBUOE3z6be+fPJjqHaccMTtbYbA/GRyAvOJ/ItZ3+H/WHRMN7ZIdV
 YihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789578091; x=1790182891;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZolQz/GGoOdBiEJnnGRQvS+1BwghJEpbEm1nAnYYteg=;
 b=kSVimurVlewvUXDRbaT5+daAtTcU9louuDpED7bPCC/J7UnAs4SsU8E9twhhLMPwoS
 a9a07tDLPKN3IS8iZd/Fe0uAs2ogUvPWAi+ulIF1x4CHgZLAykAuZ5aioMnigL6tIXkU
 H/+WUA+TqQaQKMA9ybleq9SDsU9m8kYSP/Y7qYyFdJMLH2F4+eKBpf3/vO+T7TWmQkDv
 St9im/JeiwIGF0+yv0Xgvtdo8rCRTiJLdz5xWbPKR0SS3QCcS9UM91SAO8xD8AW/4iWb
 USZo96XYTAR6kUgEwZm3GoqxyF+NmK5TwBVcpVSB2mepVLAANfEqC0kGtvFcstL5aa3c
 as2g==
X-Gm-Message-State: AFuF++khSD8AQkR5djh4lT0Ha8AQztZ9+m+YVBBbIORNi3J3edPUifey
 FzSTcnjwbZlUnRfENjOJvfg1RqI3jZTXq9JbU/lHQ1CVc2k/LMBL4TnCir8lwluL+oncAcuFCzp
 DD7hkVoBHgnGKd/eLkV3aAriraodZdVb+118LqpAKEuXwIJ75qkxShL8oOg==
X-Gm-Gg: AYBFou2XyS8PoqojhSPOwCVc7sCraQYA6cV7GFuneAg1/P6KDOr4mfqJeFZknzEJkZX
 Oybq2yn76rKqbEc88QKgzBwt4Vv5VeuQLaN/Yn6N1/ZXF6iVy6BaxLu/awRisI24sNd4A/kfZbd
 uoHqUsA/wDSqwg1yymygNGrDHwaUyq1zxWFVYjsGPLVZLnCgiH9XOx9FEvSCNrlgXtRkqqsjLJB
 3zxnE4laUbLEqZqOMKexmclbZeIbdRVNjDjWhyWNCN6BxbuP6QXRDLOV92LZ4PjCC5geVl00XvY
 2F0ch3AHfRzM/7sKph5LW48qd/GzhZmyx647L3ykb62QAxrDmo5MEFhaIPcvOtWt4QvIbT76Jon
 Sp1ixvIBGMu0MYU8OfKjGSQOjZ9uGlW4Jag==
X-Received: by 2002:a4a:e909:0:b0:6b3:b321:a56e with SMTP id
 006d021491bc7-6c7d16c79bdmr3104280eaf.19.1789578091111; 
 Wed, 16 Sep 2026 10:01:31 -0700 (PDT)
X-Received: by 2002:a4a:e909:0:b0:6b3:b321:a56e with SMTP id
 006d021491bc7-6c7d16c79bdmr3104131eaf.19.1789578089756; 
 Wed, 16 Sep 2026 10:01:29 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33c01728a7esm6168596eec.6.2026.09.16.10.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 10:01:29 -0700 (PDT)
Message-ID: <f692f936-550b-4e5b-90ee-399edf21de73@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:01:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] target-info: Introduce target_riscv32
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20260916-hw-riscv-cpu-int-v4-0-babc367b60f5@rev.ng>
 <20260916-hw-riscv-cpu-int-v4-10-babc367b60f5@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916-hw-riscv-cpu-int-v4-10-babc367b60f5@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dh9edK-iHBN04tTbWdsAP4js81hXMLjy
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aaacb6c cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=n_XsretPTedRupDkkNkA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX2/Jg/0Md+v2Z
 RFgmncEfV0moFz6sWc4DWjO1yTN7thxTDfxYdSkxgK+UtcM6qJSyqjZ+I853G7e2UXZDRfbu6OE
 oFf20WZ9Y1qM5a7AfikgAR16oofmRgQ=
X-Proofpoint-ORIG-GUID: Dh9edK-iHBN04tTbWdsAP4js81hXMLjy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzMyBTYWx0ZWRfX0UUe1gogiPy9
 +RvHfjCJlTGG7cKoyvPk3oSzoGZiKrCylKGTF7VAEOo2IElG61e27p+238tEB2RS3lTyuuxlOvn
 Z23+7dQOwKKM68y67WTEwTIryxMd3O+oKswTVT0tdg31kGGflH/WrV7Ynr+kLTq3LbhmAwxdWkT
 eaYXw2yGNwWGrMBKub93QlsWgtpZuPZWK+xuuNF9HIc2gFqpVoEiqJjt4PKXkg/sThnncyDPkp0
 4pCECEUcuHnzjRIajatDl6ZzENgIHNHGskL9FWSodzeXeXdY/xP6HxplFTRzoqd/LQFDlVJ5YPI
 NTQGL2ZnK+m8rEaU56CWUNI6F5sXiLFd8sXcgBwShvDNHrLNHD3FzjYjb855ls3KdVtFV7eDwju
 IPQM1TPw4wXmYjhVEJoHM8SkQJ6zNiGiVUCxkW/YsGLG4DJkm7/JXfV31u1HBkIydaouxIYif/o
 vymEhnl6tXLzVad43FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160233
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/16/2026 2:19 AM, Anton Johansson wrote:
> Will be used in the following commit to filter machines using
> TypeInfo::is_available, so a simple !target_riscv64() is not sufficient.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  include/qemu/target-info.h | 7 +++++++
>  target-info.c              | 5 +++++
>  2 files changed, 12 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

