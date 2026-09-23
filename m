Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B9BC982EA
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 05:01:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9F6p-0001Xu-Je; Wed, 23 Sep 2026 01:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x9F6h-0001X7-9W
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 01:01:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x9F6e-0002YR-Hk
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 01:01:23 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68N3il3N2116424
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 05:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g3IUd09r8UKQAKmuqhU/Rd4KNBbMcrPSu+S4yhNZtBo=; b=kxVRvkdeud+cSyFI
 FtNJrMvR4kNBKBV0FyIdKM7VH8fXpI1vjDCCEt9lFuSf7znmWWWkZR1dxZ8S8w75
 A7Q972BrByLar00F5H0Rj7xhlIRtlvj2vn7QJ0URMSZZvV6iv0Q9XpCvfp5cR0YC
 o+k/AOqFNG+80HcmGMQ2JNeyXhXVkvBu1ZBfq7SvCabwYazommmk+6unuv0aXK3Q
 YBvwVxF34TiAwoba7xFLyFfxrmZDzqoupe+DaZeG11nIVunKeVdju8Z7KkuIVzuy
 jSfVgdKfwvZISEuWL2xtxoeTYLq80tcHLCF+LPNiBmikHcm3Tz6H8U2c9Tgh1Pa6
 4PW16g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qs21w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 05:01:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-854f274dd69so472670b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790139677; x=1790744477; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g3IUd09r8UKQAKmuqhU/Rd4KNBbMcrPSu+S4yhNZtBo=;
 b=QORiYxiUtFhXp1BahQ+ytpf/ms25jaaRevh/shYbYsEtPdHlxu2UPMt5KxhyFBk/M4
 M3FCjA0alb/4BllzU+Riedi7+fCwJpE7KBbuRgkJTlDuUNZI9gOJbFZpGW58HGVmDVhG
 K+0ofUFutdfGYDsiMx9/kKfvBoBEeUY8uojfMZCd1r9LX4EwLT0p4eBK71JbAXpsV7GF
 Ziqwik/rJE+Tq4OoAs2VrVpNTuy2mS4avxewW7CM/27tjiW9ouWV4Q5/wDEkrCo46EBT
 Rh2DU/gBrFwyvA6dkN5S59tHf89h1+SxhH3fMSc67gRhXr/KB9SBU7mfJpM9oU5Sous1
 ojOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790139677; x=1790744477;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g3IUd09r8UKQAKmuqhU/Rd4KNBbMcrPSu+S4yhNZtBo=;
 b=k6GjQ4ZSlhm2RJheCCEW1hnqa/YKPLcvr+tgpPnhjWzaxetNzAnoewFAl6cTCb88Ri
 SFha8qHwRsIUuJmTsfk0QZVEXwnwj4VyMws+9sD8q1m8UIrZX9jAtTrHEJUx8hkhmWIC
 gb0TnywP/s8rXwSab8uyMUCwG9U/WScB2l5S/sTuJMpgJAZr31TV7Sp1a+IwWDnV1SoB
 pGG/BhG8qNAXhFspEYpMq8N9HGnmQ+9dWpUBkc37/fiI9BYs35ZVZQ5CALHavj5IpASl
 y6EAan7TwUwimdEVOZJ74l9vleyoi+SJy9AlLjYA5YDMInjiGMx8eKQc7gYftjMDlOF0
 xeYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy737I9zDcBYH6d6bDWHwU3gGMWoLRQHehPHP9K+Qha59f+Kbru/dOv+qpp7OJeC1VPDc4PUb+FNvdf@nongnu.org
X-Gm-Message-State: AFuF++nXHuHpUGNrCg3BpQPtr/Y6Sx5bcaV+C9dr5sOHme/KUlmIn1wL
 m1Xhl4pYovW8tCN7/JfJv5hEssKEhmM3qC7k6tsdyZGIuVOAHv7q1CMZXSIpIjzb3rQWkaAc/tO
 DEFQ1anuvP7D4MVxoZLO4sPFkTj15R5jws38X5UKS73mtdzigq2XRlk996Q==
X-Gm-Gg: AYBFou35fTfszk61CnJ4XpK2V0Xixxr1saPAtdmt8hF9pL3v1wWSQs8iOm9UpffEhPe
 bDSaioZmdLw6/TC4jmtl3OLCx3wPZ9ZCwQlWFGcSAEhf5zboKTYLiM+lP4veuCdOKULM+bTO7f3
 PGT9WWTW8LseOuKaFJ1g+HKPXm++J5W7AsSV1uLvsxd1wfEVa3/0BhsYbBnrqNxKT0bgMuNXGBV
 Xiiupz493npZOXuv11GxDXq/JwH4uEawQZAJ/C/l9mRiWpNAaI+lPOLFmIF38dpAaWbuEE+6DzW
 kV9tOaz5tO2ARbFc0/+VL3dnHliwHX8cGODEgvak/PX1buQ6weL/AcDNToeV9XKnpARKBJoGk1N
 mB2RBo6+om0wHQUUq5oNyKzAEysHCUhL0KBoxaxbypsAJKwmSwbyaZw==
X-Received: by 2002:a05:6a00:2d03:b0:878:3507:8d65 with SMTP id
 d2e1a72fcca58-87d1c6c0ad1mr1226043b3a.44.1790139676469; 
 Tue, 22 Sep 2026 22:01:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d03:b0:878:3507:8d65 with SMTP id
 d2e1a72fcca58-87d1c6c0ad1mr1226011b3a.44.1790139675853; 
 Tue, 22 Sep 2026 22:01:15 -0700 (PDT)
Received: from [192.168.1.169] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87d1dacd460sm653444b3a.33.2026.09.22.22.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 22:01:15 -0700 (PDT)
Message-ID: <5e3818d6-c2c8-4450-a5dd-8ac8ce1d6cdd@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:01:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] machine: allow -M name to differ from QOM type
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <lvivier@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20260922215533.641-1-luoyonggang@gmail.com>
 <20260922215533.641-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260922215533.641-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab35d1d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=lQA03COSUpqy9BbuZUwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 46r1IZCrUwVoa3M9WpiPjfXDptbos6aJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX4M0ISkjTjaR9
 QXnry2ug63v0kWAvGLo5Uk20irszmlSRQkR5tUdt/UgdULrxX3dKFyz6qJg+HtK8f6XFb7Z7C7C
 yebQBG5yEQtsZBapJ5OUjAO174NOQqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXwSt+HGbkRVsU
 sZkEWt+2lVj1dc30kX5il4lzVOQdawDsdzNbWneajZvnV8t1RLySVHVVjmd5it5IMRUYWgiXXxy
 qN/ehuNkieHd+4p0yY24PjS04/SPhBDN1OYtxI1Um25lBVEPXTyE8SO6ZvV6LRzoD3qtkrQaNIe
 g1U7njwfKKhlA4e86ILTaXMfKz75kGUd09cTZnHQZ9crZpTX+xIzE3WyU4OgV/8m5IaIn7jviId
 GZNUQ6oYaTmgQ6pgxCpFRmu5mZ6oAUmQWmgl8KwbyxxQwYK7o9Mss5nvTc7amhN6YMusj20b+hF
 xZaDNjXE74LtNz4FQs3QJNQlAGwTcAFdHJgslyzGTNKTAJP9I2sbeMY9cDMjqxDcSdqI/Y6a8wx
 hGMX1tX4Jf5Yj9gNwRA9ae5/JKx2BD3ADzU3F56oK910u2QTpyyhqDFddwBUYD/SrFImbomjW/0
 MUfORK4P+NKrXimwGeQ==
X-Proofpoint-ORIG-GUID: 46r1IZCrUwVoa3M9WpiPjfXDptbos6aJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
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

Hi Yonggang,

On 9/22/26 2:55 PM, Yonggang Luo wrote:
> - Add machine_class_set_name() so boards can keep a stable -M name
>    when the QOM type is uniquified. machine_class_base_init still
>    defaults the name to the QOM type without -machine.
> - Document that MachineClass::name is the -M name, not the QOM type.
> - Sort -M help by MachineClass::name so order matches the printed names
>    when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/core/machine.c        |  6 ++++++
>   include/hw/core/boards.h | 12 +++++++++++-
>   system/vl.c              |  8 +++-----
>   3 files changed, 20 insertions(+), 6 deletions(-)
> 

this indeed allows QOM types to coexist in same binary.
In such binary, how are we now supposed to differentiate two virt 
machines from -M <name>, given they both have same alias name?

Regards,
Pierrick

