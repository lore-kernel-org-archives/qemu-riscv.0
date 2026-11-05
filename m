Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368D606D82E
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 19:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HOTTu2Wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GfG+plk/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP3ND-0004pF-Sv; Thu, 05 Nov 2026 14:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3N7-0004nz-5t
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:43:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3N5-0000Y7-0R
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:43:40 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HeASa2433585
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 19:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hila3885CZM6NsBVhbfHwWG5rcPPwzZn/wBsnZSxIS4=; b=HOTTu2WlBVm5V1a2
 ZTV13lTosDZpfk+VcKcCzr6il3EpLMQMb0BKgb4a+5uo/gyPWGSbnS1NYx/A3sl0
 vwo1PTo0bV1LG3iAmK1h6u5cpgkbywCaafxteP6Gvsvx+iecBSrL51qJ4pu0WQRr
 5V5/n/5sjRx7Sp6w5hPwUcYth2u1/Hu8aniK90lJj86VPjApJNhpU+xKElVPQzWR
 PdiII6+92Zqh4imetvbZPQGiggZDIzz2wYuwzItjrAKudIzqlij0GyRu0HUk50Oq
 v/YOQCdYPweIdFOFAvZL13+QqYbTVgZe1XwLR6O59ACrNLCsFpuJIDg19R1yp9ZB
 BS6n8g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd2hjj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 19:43:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-351788121cfso4246600eec.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793907817; x=1794512617; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Hila3885CZM6NsBVhbfHwWG5rcPPwzZn/wBsnZSxIS4=;
 b=GfG+plk/5gCiXPJNLI+6oPLEMQj5dkVbIF0dd7H3nIA3mwIuuAXyC9svQTqq2ePwfA
 FXVm3YYm5FuGhPWG0Ak+yE2Z8assHWGhK2H2duvWfBB7P8yRCsw5hJH+c7Ok4goBDfmk
 WWCWF1HIU2tvQpz3Hb0g9pltXPK9NcoWJCqZFBV0Rj069xIsa1BHDCDDHH2azBRpZhWE
 iC1n/igbYaqlRs3gV7tAAWf6qIlU3QuVTN7BOyidsQ61e2JpaedF3BAqd17xJUga7Y2U
 6w1JXyEuyZOLnrNgPStkO5tVWgWvZp6Bac2DVW/kzxfc6Ux31frtV3iUAUFLbIGZuV0D
 T9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793907817; x=1794512617;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hila3885CZM6NsBVhbfHwWG5rcPPwzZn/wBsnZSxIS4=;
 b=WOTLEqz1OOdl4ymGpJyWJdqZPdjcHX0gmt5p9t3fkiUbW3gVqoeiX0BXcE7cYLMtPH
 ch1Y0QEbDj6+oJmdQILxYcwSc4ffmwOD8fs+t9/FSSg1wpSSKrA765h3kX1blA3+gxbk
 M3vVBgeJKZWAsU0w+Xm9W3fF1lUkCtRfs6HJql6RjcmBAI7uT8AjDM6x5NcGM8ssL6/B
 o4k/FsAgelEQv5kBevjD/8yHMmcz0r4tkdMgyh03dGn1rZie9ustuVRCaqnY7F3A+8+Q
 tAW/sbFti1wG0USQ6UkniuUAS7Kq6Iq3VB5bi7dbmrijVLoCAAz/QZz+1dbT4FkmKZYq
 9pKw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy2ys3vzOtvdOElLYHmiLfYIhZRBCni07YgkZWmgfgCZ/Zwso/mUU2WqJxxGUn79frS1ysQbifgO7gX@nongnu.org
X-Gm-Message-State: APuU4Z+9pfwwB2FUNL0HzEeIfmc7pq2HLs1qMQpFiPtHxX6WiMy3obL0
 2dvCO+Gt8Un/2FbrOH1hDaPaFBjbpwU56Jd4P8yP/JKAF3uxHnT5y0Jw4Bb0IMwrSyQI/erQ+DV
 FxSS+d6m+FXrOF/GBNfV0VvEkJu8A3z1r93AcBGbh7zaVDoBNz6skvXK3OA==
X-Gm-Gg: AYBFou19Pi4JSqsgrlMIXX+yJkjPV5PCl75sJNilkmBhkl/SM0oGWE19SxPuOvM1idi
 BQv9wvoHneOAv/iaS8eHd7H2RCpg3x+yLA7MgOK1uhMmg9p38/aBmS5PDSeY0z3A/BrDySVTt17
 mtG6VMvZE3sKtccyZCFTFtTOqtKlFAI+SszkD1Y2HBUwRqEFfbhknEt/RpavDV+tB6pTGyJYX0x
 MEnbyRv1pu38BN3tY5TUuiwFcIpzGni6wiWFy3D61Ihxx3hZERvR9vIHfyesQIatcFB6ZYrIFIB
 gwIx/9C0JGzVas56WroG0nXRgYxt7A1s7ZI29Suy24felGjS0Qj3D1yqWBifT0YZ9y4zYG3p8QU
 SkDgikt411kIkIZiwWO9PlVRzKs4sp8ukO2jE4wfJiQXazQOWKDLE+QAWKGFtSCuYtryHG8cmyw
 2MQWWkyzZA8+Zq0u+sy7V6abMgstFuaqvGmvYakPB5Jw==
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id
 5a478bee46e88-36f76023af6mr151212eec.9.1793907816471; 
 Thu, 05 Nov 2026 11:43:36 -0800 (PST)
X-Received: by 2002:a05:7301:4e44:b0:366:dbf9:32bd with SMTP id
 5a478bee46e88-36f76023af6mr151163eec.9.1793907815983; 
 Thu, 05 Nov 2026 11:43:35 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36f722ed274sm329297eec.18.2026.11.05.11.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 11:43:35 -0800 (PST)
Message-ID: <4cef2c5a-9b5b-4793-9af3-106a5d65cc5e@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:43:32 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] Revert "target/riscv/kvm: restrict
 kvm-accel-riscv-cpu to riscv targets"
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Philippe Mathieu-Daude
 <philmd@mailo.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20261105183310.1614-1-luoyonggang@gmail.com>
 <20261105183310.1614-3-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261105183310.1614-3-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX4vvwOs99au4w
 upW1aX68sxCceVQTTKYxdM3xOGoUr46v256Bx8Q3FQYj0LvzIVKFQUlnPEE2eqnOfYQHnOcq3qB
 Ocp8fstsRbC8OFHOB81dRcyg7ZKowec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX/lf0u5dOMipv
 L5OxdITAmByE4l+zcd6qpCGBNZRHsloXWRi7ZkdnU4C+umojQn8a3opR31dFoYSHhNvAuV9MaQh
 WtdVIGTFO6zfKMj1M6hpqdq3s/bF2i8mAzfTUSWgUmhWXAWyuMFCaey4t+Pk4O1XFHqKfD97ZWT
 da71A/yI4VFzooXd28uEtmMxzLyGvCVi3ajQDgowkpYx9+KPuSmMsh4BA1SVYsMNC1dJLnry3OG
 5rdJ98u4HDbYmdpGe2oALuE1DLGJONN5PLlba1cxQRM6ERzK11zCA/EHbNYWi1X9GIODnaRY43o
 vzavDh4AbuiuvAVT7x55kGCDfefXF9ICjLB4wQn+inVRN10Cg1Aivn0F0+zSfucKMhTE69qUXlm
 n+qBOq22ZtVHZ+FQf2euseWSoCowCPgSPP+kI5borfR4vxePkwS/Aorn3xKGHswI30/lxAkxrvb
 Tx4tsXEdeov3Sg5ipdw==
X-Proofpoint-ORIG-GUID: ocpchdjEd7kuZgDRyNSG9UzIzogtDMnq
X-Proofpoint-GUID: ocpchdjEd7kuZgDRyNSG9UzIzogtDMnq
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecdc69 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6iAvmC-XfobcVWHkfosA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 10:33 AM, Yonggang Luo wrote:
> This is redundant now as all accel-$cpu_type parent is already registered.
> 
> This reverts commit 2d3e6b4003d5380c245ce8ffac4b8866f6d10a33.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

