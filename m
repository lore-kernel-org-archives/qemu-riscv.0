Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBFAC982E1
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 14:08:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8ehQ-0004pc-OM; Mon, 21 Sep 2026 10:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ehJ-0004pA-Jh
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 10:08:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8ehG-0006Mn-Uk
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 10:08:44 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LDogKv2344535
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 14:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ymNGaMTCHRG+Mjq55gspAHPt44XEzt4YpY5Ozb8jc3A=; b=HTI9ojCl8+2qP/vK
 pJZfOmsQk6Q+FW8UhDf2rhOkJzS40ACDQUWl/kncwRwsHkopg/1ulOZpOU7iAkjC
 bNwkvjUQkU34G+x/8oecdT4i1XQdvU4mnWjmc8cuYq/YWvUB2b+DThmuiXFIWv5a
 pDy+qTivWbqO/L8ioWfAGpWH9yNbdxi6bLHRMSDLnpvYvdWGUEWtfm5xbCVkNYIk
 FEbE88X2mLKZ9DWgGj18S/W5qrvsVWmvnswFjADeuD49/77zjQEv2T64neCwtGdv
 BeaAZBwNilvkw4LmWkL7Ja3rzX3yFRhn/mOEsALbyW1eMvrwvtPpSybY40bZwvnA
 Ak18zQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3var94-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 14:08:40 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5c8573c977dso3023042e0c.1
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789999720; x=1790604520; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ymNGaMTCHRG+Mjq55gspAHPt44XEzt4YpY5Ozb8jc3A=;
 b=VO/nQY1WF8KxNlQJi5vHhsDRgN1W+pjt1PqX2TXDUGNGvEInaWNxZOVW3OcVec7dWd
 dU56zyK2ThJKEaHGdGvDLyFUx93IJ4X6QCGGvmvR+hf0cHVnsPwAwCEVYS1RQBEwaggh
 zwY6baiZfnt7swrK9F8KPgGb8hbWLqMa6i/0TYcusEN7P6EPDmhpdrk9CL8HpBRTOPcN
 U9zyobUTrZxxbEBYcw55uuoeKmRW6Dk5uYAU5Nh5sMOKGyBQG272fr48ZYYSlHqh7uud
 RAUvlKqiW2Z+k/32GFlJfO5u06hyYwIC6exLy4rUoW9DvCzCrN4gZrlORwx4cUA+jNuo
 tQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789999720; x=1790604520;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ymNGaMTCHRG+Mjq55gspAHPt44XEzt4YpY5Ozb8jc3A=;
 b=W/sJ9Xx7RfP8OwqDN8ByCjdD6LDopNA27NzcN/DZ+t+fv1KnYbobVab85GT11tt+KS
 PEel3FDQASQJQk5NlE1/xaBF/F8geBS6FRWmolHIqhveRvzas+ZZ3xsOei/Z8O8agSbj
 8kw4AahijdLPqTpDSh53rS+L+zjvMbGMRZnxPnuUPO2Umy4uxndmNqIjxU8CIVJ8RGmz
 A11tbWgSneD7QqVJUYbgRZQmUBMUpjSRNTAIJgqCfZEru0QGsT0o1cI14NDc4m/94dEH
 0siFm2Z7VwKE9VadAcFDmxSNzpQZnFf0/nrQ6/PAriHRlYKwRVTKhKFAyFKdIwwAriQi
 N3wA==
X-Gm-Message-State: AFuF++mTqFnGOyN7eTKSAt2PgnVl0vGStwn1MsUeORuxGuIGiUPPg4AH
 kDaj/7tOdSxCpWERLhgy30Wr0V2Mx45UdvQ7/sdAmzcsMp2BRudNbDDqDi48GZruJve8IyQWEAk
 6L22FbWBump2FFIEKw++AkOuzZLYlCxu1esCr8TnPxI3SCROlKX8XszNHVA==
X-Gm-Gg: AYBFou0kV5SKE5M5+vHoL+U4vRwNfFx+ZFJdUikfuCVefwqaonZM4YqogvIGXb600PW
 2lv0ndINo6FIqyEYYH66pCwUiOj+i3Je207YGCoapMIS17KQQEgsA/HQ1FZtKm1CcUB7EC2tgpV
 2f6+1sscmehBJhz0kU92vFd2QznkIYctLSw7RhX80E7k7yCVxDcD2268dv3/ak2xGkfayfwCiNJ
 P7HfeZEI4ZmKWz7maG4Sma04PXZ9YufnNk/kApCvUGL2Kw9gTRsQzzwNoY90nzDY7vsCMr97SsX
 9xQyevBc8d47/JhF1tCFXAAdgFkOwblqL2wU25oEPZiBvCKpC1hwU2fcuyUNMjI9A28axgTCruv
 iIVlQBAJQAFyaBZtKY/o=
X-Received: by 2002:a05:6122:338c:b0:5c9:a60b:e5b0 with SMTP id
 71dfb90a1353d-5c9b593424cmr5754963e0c.9.1789999719622; 
 Mon, 21 Sep 2026 07:08:39 -0700 (PDT)
X-Received: by 2002:a05:6122:338c:b0:5c9:a60b:e5b0 with SMTP id
 71dfb90a1353d-5c9b593424cmr5754893e0c.9.1789999719220; 
 Mon, 21 Sep 2026 07:08:39 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724589c02sm22539670f8f.24.2026.09.21.07.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:08:38 -0700 (PDT)
Message-ID: <3c8a82f3-6f48-416a-94d7-64f4f65d12b5@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] target/riscv: Replace TYPE_RISCV_CPU_BASE
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260918-hw-riscv-cpu-int-v5-0-f98c5a244636@rev.ng>
 <20260918-hw-riscv-cpu-int-v5-1-f98c5a244636@rev.ng>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918-hw-riscv-cpu-int-v5-1-f98c5a244636@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab13a68 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=2B1V6qbIr79x5vUCd9sA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2KtY8iKHOgkdjGxwe1JLFHH9yk69Mj1u
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwNSBTYWx0ZWRfXw07OsFSKG+ZN
 WfUZmONLxWXrbgGHkWmSDq9sLPnIzyizCNE8TG6MG2d/Lj3FohmV/Wm076zXG24YZroVp/XSqSm
 N6ujRscgre6l0/49pkTxQwhFk8+VDIM=
X-Proofpoint-GUID: 2KtY8iKHOgkdjGxwe1JLFHH9yk69Mj1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwNSBTYWx0ZWRfX6O+qbEZgitzR
 ulq+3oNuSOsp42P+FRN298BzCgmM0bZ43Em0ysINk5kB1KLjg2EwK2DBQNJy5QCa/1X6Dpq0+Rg
 5O6sZmm5Ox1jGFkZ+Uy1kqULYsujauMby1EIe+4jUmL+1V+c35/uHp9TKZKly58k3pFkYIu3aJk
 qCi9lntVEW+VorLbbA0GYHDUl+gZ3wP4vZUX/7Sm0fGuX6LqP2XO2GhAmA3XQev4Jw7vPwqHWf3
 oEa9XLuXcy3M6DHVoWC7G6biYTvcATNDxkoypmeN9s0BEbUkLncYhfQwk2QLGtrJB/vI9J1aVxi
 E4STW1xG1Z6NP7KXgdkXD/uVFuLpbRViSrxdqXNwW1zHmK5PIzD+1Xhe+5i6Uj1QQHPE0/vPttq
 Up3dJbT+5On8T1/AwDv8SZdTNcslIpG1BlxQw2WkXDqCkFySKP8BsK5N6p987T+QDNqbKz0XpZ0
 F/e5mpETNQM/KLtZong==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210205
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 2026-09-18 0:04, Anton Johansson wrote:
> TYPE_RISCV_CPU_BASE is used only to initialize the correct default
> machine for 2 machines. Replace it with a runtime check.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> --
> Note, this patch is to be replaced by: 20260526095731.63525-1-philmd@linaro.org

I don't remember, do we need the whole series or only
https://lore.kernel.org/qemu-devel/20260526095731.63525-5-philmd@linaro.org/ 
?> ---
>   target/riscv/cpu.h              | 6 ------
>   hw/riscv/microblaze-v-generic.c | 4 +++-
>   hw/riscv/virt.c                 | 4 +++-
>   3 files changed, 6 insertions(+), 8 deletions(-)

