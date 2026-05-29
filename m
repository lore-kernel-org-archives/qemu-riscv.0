Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2497CD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:36:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT24F-0005Ij-Do; Fri, 29 May 2026 14:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT246-0005De-GA
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:36:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT243-0000yC-Sw
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:36:14 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2IP4518390
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8G1AA+C5l7p2QDuZF+PCm2sMqEcpPOuS/PaVjzqSEX8=; b=CTxpL2d7y6Ocz8mH
 HQRbe8DMj+GapAuyHenAR7kh50OG5DZ9vwlP0gQ4x6jkyks843d3f9QVUcSe4r4j
 qKWbdzXB8bNkEvKV6Yh92DNfQlA5+swlqBG5MVoEW/BMyVLKok4g+bKV2C5g7563
 4HAyLgPoC4bEuxPVmy7evW5dReNLqxj8t6XlLFGgShd8UWtAUi4/1SEF+0isohG0
 3adI42c3Jo7IMKRMa/Oh1rswXLE4I0DrDr6jqDi0aCHyMpX/BF8zNFx5151bLgq1
 v/5TYosztN830/fGAN19I3tci1dFyw9X5T1I9lja/oKLPkQwGQS0FfSEeSGYi2WA
 4hn7Vw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgujj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:36:10 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1370417c0bfso4014993c88.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079770; x=1780684570; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8G1AA+C5l7p2QDuZF+PCm2sMqEcpPOuS/PaVjzqSEX8=;
 b=Y9cxQf0h+19G5q0jillGs0MIHld4auSuv+sdh0LtjcOXvoUa2w6eTB3L7Qxg7c/ShL
 j+GFLeHrOdQLwFtKiZGhwWWQCRL9ztHgK60zQyCFMnqHU/B6vs1c0+i1JNwGev0JR1Eh
 goZ0gnHZFerPP3vCTqV+ysO+K/nuDEJM/nMSyMSvbZL4jIjGsDdZjvBrVKydQoOj1IRX
 dc2a0hntywQNkaHCRQD3An/mg/V5xqs2ep1cjoDoq3cdUIqc0k0deGE31q+Hx2MpTu3M
 I6bDtOuf9xLUVom+KOE1IuNJjNPL3iyp5o/ehDXtfXfMUkLebDI52hQwSx23mi0gTcCh
 XP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079770; x=1780684570;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8G1AA+C5l7p2QDuZF+PCm2sMqEcpPOuS/PaVjzqSEX8=;
 b=Zv++0Kplt4YOifspFdDfoWYlHMt24XhIUyKhz4Scddsiic6m6cyxZC0DeeuuG0/W3e
 mK2TZZCD9h6nYBOPvxXnmVZkvQbEO86/QZu0Hgd49wl3FX13NJ/K3VQiRRY7Vpbbvfxg
 zXBF8vLv54h5SsL3+EiG+UPFzG9JC3r6mZU1mBVgmjRTT0l6BcxkEMaDuIk+k/Dq1mJ+
 l3L1ahf9N+i9cOwjzG4RgTj83wtfOQIqUwPqrI3d1fIFbwqcmoZ0DX+jemu7q4L75MDT
 GucZBT/dWkpU9oBfIqgRfM4hNwPAnlLnadsIxwAZ4ceYlUbfE2KOkxtorS3wjJVZCfre
 HHWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WqcMJlcgEmaAO2ygwhHZyZZgCO0W3ULE4iImVShkH1tOTV2r5eSrp3cxHZZGu4pc5mzSpURmGwwZ1@nongnu.org
X-Gm-Message-State: AOJu0YyaC0Wn4bZnSJoiU5PnfOOBRLoOmpFRrt8l/2ktfh5anTcHlJPi
 CJgX9lrpJWocQgq36qGknIRANKWCrjq46Rw5QpfihzxYnK79cbKq6ycdKfi8+iAQ2j5cGPwdAs1
 bo9rO3FAyeBRr9KA/er0QEStoDYkJp1vaXqRUEL/+I3fG1v+vG3U7fIYCcg==
X-Gm-Gg: Acq92OGcDRoE5z2xRLWPVwB7Ib8zkMP869ySSy/mRiUOzIdItmb/CPHykRz9EfzLSuM
 pBfy9PWpoj+omkUtX9h0ADNGMNWoyAlFPDEveTMppF8M5pkEAwW+9kdF7djVqRreIj7NnMgNIW3
 VDgg0Ut8Q0LzZ/hbBltmCxglDzFHyxm+HePgjQTD8nawUNmHRCdFWjDTBB2nVrkfCPVuHnrz82W
 7Si/ok+KcKSLTYRP1ZXwfXXRQzvG2MXgPRRF5k0AMnvp9ygbHyGmqq4DTXirS8ceFNVmf8DsxB/
 APM7iDUIeYzX6j0Oi2ZGltXN1aKlZuovQwn5H+yErN1lRHdPW7yDV5Mxp+4yPPN8zs6q6iJRIAd
 F/3thmL43fIjCW/lwb/iqwpk5xAQV4cP8tNIaK2BhOgP4QHFjRVf6TWaJWETFT0z+qPyndJfWl6
 qWd4UIdbQOyUtJiSWO0yKPBQNJ
X-Received: by 2002:a05:7022:4384:b0:12c:aae:7b43 with SMTP id
 a92af1059eb24-137aeb9d821mr1740944c88.24.1780079769798; 
 Fri, 29 May 2026 11:36:09 -0700 (PDT)
X-Received: by 2002:a05:7022:4384:b0:12c:aae:7b43 with SMTP id
 a92af1059eb24-137aeb9d821mr1740923c88.24.1780079769224; 
 Fri, 29 May 2026 11:36:09 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed53f316sm2009480eec.19.2026.05.29.11.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:36:08 -0700 (PDT)
Message-ID: <5dd15866-c5d4-4a2a-b126-3f97700459d5@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:36:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] accel/whpx: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WgXx91qNuspLzxRgzhnH03Rnp7_CvCW9
X-Proofpoint-GUID: WgXx91qNuspLzxRgzhnH03Rnp7_CvCW9
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19dc9a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-KmILrV31RuDUJHzopoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NSBTYWx0ZWRfX4ooDBAOzveR4
 YLLWO52l6ufOoDMqHIOmADa03d4+7Fgr7n8Bl4C0eoTofKQYLXadCXTqzw4tl+Dj8CYLtTAJNMg
 KhfQczeDlkviix09ES0tIPH4cQ0c7oacmbTPPUOOX5WArOscg3R7R/vwcEEtfIMvf7W3Y6el8ok
 M5bOmAmE3OR0ueZKQcJpGEcsawK/HlWYYdV6AA2vJvZU26XJF6oPxuxYJ1wm/TnvrH1IVhrkQ8E
 uWJvqU8m/OU/vqB2jDq5ahsWIPi1GhMbmvwG0pw27f0raH2Q742PqzjCwXaQkWaGfJ4MKkNYU+l
 iKu/9/r5ZmYE7brARTwk0eKcC9X0JsAeMkRXyBJqka7IZODCCgPaaeJjXWTrrlsJbPJ3ggGU12Q
 0XRgRJXWemzsbDicEJ0hj2294QehrLbWaze/BnB2Z5sy5BEXQCKeKu5/492wtquP5Pv36R1aIZZ
 1/5NVuHyFYPfzeFPitg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290185
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> Register the new AccelOpsClass::cpu_instance_init hook.
> 
> ACCEL_CPU_NAME("whpx") TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  accel/whpx/whpx-accel-ops.c |  2 ++
>  accel/whpx/whpx-common.c    | 17 -----------------
>  target/arm/whpx/whpx-all.c  |  1 -
>  target/i386/whpx/whpx-all.c |  1 -
>  4 files changed, 2 insertions(+), 19 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

