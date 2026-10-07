Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B855CA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:37:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEP1n-0007bj-50; Wed, 07 Oct 2026 06:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEP1l-0007av-Jn
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:37:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEP1j-0007vd-VP
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:37:37 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jX9Z2481359
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ddTyb1gr+uVGDwSxcVcS4btfQnkQc2UvMO3yFxjXQ5U=; b=b5om2CppVy15NZT6
 Y4gYxqu7ZsOVpUR8fe+OJ82mYVqgmRmKgRDrnCVcd4GIZbLoA9jL6AA7/qeWIqKg
 ofp7E2logQY+rpGjS2qH5sgIxWQcUE1BrlYkhgTMi0ZFmYenfX4r8ydhi4uj72ab
 CI3Jja4jaXPXSi1cfnWQyF9gAIktaCa2XpO0mQ2/B2jFm9BCwBldxxnPlz1gzbYD
 lJXk2lcgich3Ydhnc4A0Fd0FDGWD/ocEfj7cHhPqxtIeeYGpM9JpjN7bREAxxrwJ
 yGvzhTnAniMtLzaGymOf8dF6Vjj1vgAwWT4I3T0YDVrDOpdQJTAxUE7fAp8tm3v2
 8i5AmA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1pjj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:37:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93e92aad34aso296322085a.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791369453; x=1791974253; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ddTyb1gr+uVGDwSxcVcS4btfQnkQc2UvMO3yFxjXQ5U=;
 b=D19pjxi/xcmknruN3aejZJZDeOrxZL0mdx+uNuF2ExVejaGUwjkpbIY6Kfy3ZacLQs
 TcOJ6RutoSz1Wg4aLCHBGEwXvEnRsgBiN2K3g1FDHkRMOqIFH1gp5Nf2OmZWdI+vbBGi
 9Hilc13E33xFWq4VB035TLOXq7ixk1S4JGQoFexK/OGQKtC780oGoRBuJfaZjyS6vL68
 Ouu+sS2nYBM/I9YtgE2WA47ND10DhluQGouCVYqPHwONOyYrQdpXHPch4o6RTAxVxUHc
 DQboR+asFn+U2ZkU7jFhzoZhR+r53EZdKyeWriUAGxU0/SLpYQ16fnMVfj4zMirslSTu
 1jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791369453; x=1791974253;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ddTyb1gr+uVGDwSxcVcS4btfQnkQc2UvMO3yFxjXQ5U=;
 b=lG/wPpDXG1xfX0P/FQUZ1iG7wPzAPBnTAddP6jB6YpTFizNpvjbe68ThSRzxlAVbrK
 s5yjU5J5ZAQMYuC212W65BdFPDDJgZpGrUTs34AiG8NEmOv2SJIRK46K302soVafCJ4Q
 ACNfaQm70Vh6LVwKDc3RA/4fpIGNaFbE6M9l3MeNuFpjsSfW3j8QAN4ZiiJm+O5Ny+3R
 QRh42MYVgF5ofy7SpRDzk4afTUWZp8ETVJ1jQ7Air037BF3bztYXlsu2cCPipV/ztiwr
 yraMjGQWy4UT82mWBJr1s25pi+fYexD0rElH0FIpfa4YBdOO0QQYLbKSQ2Khu9H5I1ks
 /RFQ==
X-Gm-Message-State: AFuF++mXh1KfLfLkrVNfYaAvY1fOWBUrjC97QEqddMdwMDka5wNGppBO
 O2hLKNb1CyRG+v6QXPGoTLX4fkdVnQZxKsY88BmEgHVL568F5jCDEvl4aBTlYunXkGAxHUG7cde
 5/6AGkMgv7MnGyplLdWtM3rg8SUPX54sKo7vXUwntbQc9x4cAt01b1eKZ9A==
X-Gm-Gg: AYBFou2991taYE9M5WaRKITO71h+Q+Ns2DOhmF/kfUACMLcx0OZB9ekBX1Q8mdW9ZXO
 l1gMRtk+87Tps50dY2w/dcbJd+dBGXFuUewwwWtx/d1l+CQHR32v1SnOLukh8XNvF7Tk5PiD6nN
 WzgWV6dpdasBkzTw19EjtEdj5eehr5dwNGKJuaLBo6huhqcmHRt1ZqAw/8jlsyefT5/q7TKxI25
 PDjhnwPqiH309NYwo028ylQ/kw0cImyMEZa9Lnjy64Wlb54XB4r0qXdZIddOLsQBYU7HDErzL1X
 1gkLxAYjPYC8XGOrurLR6IjNTRxTSMahhHnlI6GBdNBpIBlM9pmozM+cObfbxyeebslnEbNYTl+
 YOr05fmw+r2eFcZJrKw6Lk7L/qMq0fcfkCg==
X-Received: by 2002:a05:620a:2b90:b0:93e:9809:3364 with SMTP id
 af79cd13be357-93e9b82da9fmr302095185a.69.1791369453308; 
 Wed, 07 Oct 2026 03:37:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2b90:b0:93e:9809:3364 with SMTP id
 af79cd13be357-93e9b82da9fmr302091585a.69.1791369452744; 
 Wed, 07 Oct 2026 03:37:32 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178a175aesm181596165e9.2.2026.10.07.03.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:37:18 -0700 (PDT)
Message-ID: <c070e05d-4bfb-47e1-99bd-7c5eb0e51d7b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/18] target/riscv: Compile monitor.c once
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-18-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-18-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfX7U4E4tsp0EGS
 ye+dGD2xLY/zJ8/w51yz/yos8mDaXfKq3XirnRDeILG9kHaY6Zf088JV7lhxZzxDG+kjhMlGaSh
 rXP7AHrfjT5YIy+NZB2ePyWF2Bo4BEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MiBTYWx0ZWRfXyg9ZgnIEAlan
 h9aiw+4HMzceYol7OUu5mDHfPVybCrlZS7oNbFDY10XhWYpUHTaHUvzhPIonEDMqraBXnuNvvl8
 YY3xlsBS1yRL/G3kX/XX615HKKAskRB3fAxfGr7Vf7DHokmpaEbwCGkezisrucX3BO21DNUvjt8
 Z8NmSA+/wIVwZ32RvdQXwBf4V5Ib8xmpO9F0uQ49eqo9FOBIK520rC0Ek2SpfdbtB6lkAREx6sH
 8lV7o7Z4N3cprnmy2ZbUqPKeLXQ8J/PevSEsLSfTC51MqXU1/ufyZ0Fchu1gNbG7PMAbPwCjBrS
 SCq+YxhY1xdOP7jxmzMCFvy2cFP79IG0gBQFjfynWvVTMT6SpM9qa7FrGCGgwQ8G3wSIOKgD2fB
 QMTgJ3vk8k4RT2dWu9m7W4o9ygYNgW90Nmbgi58hIT18fW9wRd/euGjvAqua5/VMzIjv9AiQyjm
 TLIitOIQ1dnsZagsDKA==
X-Proofpoint-ORIG-GUID: 6AWhn1XrxPUvpkcADZm64zkr7T3U6MX_
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac620ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 6AWhn1XrxPUvpkcADZm64zkr7T3U6MX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070042
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

On 7/10/26 10:43, Anton Johansson wrote:
> Replaces uses of target_ulong with vaddr/hwaddr/uint64_t where
> appropriate.  Formatting of printed HMP fields is moved to runtime by
> relying on printf specifiers.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/monitor.c   | 88 ++++++++++++++++++++++++++----------------------
>   target/riscv/meson.build |  2 +-
>   2 files changed, 48 insertions(+), 42 deletions(-)

Thanks :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

