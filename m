Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B767CC5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:58:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtGDP-0004TI-Bq; Sun, 09 Aug 2026 22:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGDN-0004Sz-P7
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:58:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGDM-0004tv-Eq
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:58:13 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L6gsY3498180
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kkCNjjoabB7M88HPmjQPi8sfv9rFaViC3sKts28Scf0=; b=CRxlX0sjoy0x2elE
 uQqUdKWjY6V/BFyBTDtkB2EHJ2KbxPQEmNVGy46pAkyKHEwu+iqJg5IT5DRpQtev
 lvo80pilrV19eLd+WAkusNcijJR+pBy0CXjMM8ro4RuYc/C7GxVt3pShM1LCcAZm
 TVZSzuggThJ/RjVUbAAuhfrL9jfsH7xtA6gamAXuwvqZW+zXTetuwpCIRKf/oz6s
 ihDiAXzMXq65afQpxeV8QUYhilGI5CYQAlzLZcm3eeiUrO75gbaWLNs+8eq3X7an
 xYAHJvXaticZnyt2SNgnAZhPfVy772iDUzoC9J8gAQ/2yaYOIg63lPWyjl5R7hrQ
 77yu4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8m3cu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:58:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52ce64c41efso27661181cf.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330690; x=1786935490; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kkCNjjoabB7M88HPmjQPi8sfv9rFaViC3sKts28Scf0=;
 b=K3aDt9cGv4euv/+WNxr8pqTMl61sPrgA6rJ3MBVskNh34Fqd1wTUpofuMTjj2MnJYf
 AQIBV52k+hHCmfsgSPdAODz4hxjdlLpx/7mGWDP9hfZbCB2tIBIeC1FnJo8ce1ires12
 EU49xTM+dnhVoPiuMZmABSCvHl5PyNXElgkZyqQxzDrY2xQQuna9m6GazUM5Y1fE/cu1
 l/DVL9kb7NspzT15i2MlKNtpbn/Y2yqQ3d9HrHtJItxSSoBxKteVq/jMbTEWK98lH7fu
 3ovpT0B7pgXElyOJyWXD0ZSHS6EK8OqinxS6GeOQI+gciTEcfMwqGyK4Z7gPAAJoTgDi
 mnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330690; x=1786935490;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kkCNjjoabB7M88HPmjQPi8sfv9rFaViC3sKts28Scf0=;
 b=X5eP7Z9wR54s/urIybidXv5A81UZ3cYsjWVa6OqJ7S7MuptSPpxHO8x+5QNhrklemY
 nAPwvJKx9Wk+T/U2O7nSq48/xuV1GwRpkuEb1rRDp1zg8j3Dcb2fAsda8o+s9cYzBqeD
 BPuq62ZhVcogSKyCQZIRjoQX272urkyh1NZrEfa9OF3QTprPmjbPZAyHQMRsIm5/iSsE
 GMEW3vXUbdiNANN83rblrMIgDWUsb+aKqvd+1DF0RCB2jJfD2+03qJWALrUrcmr8WHJQ
 YUXNZX677A57XbGAQ+hTaJQr+DheyW4OuIqHLDVu4eOBXSV+rUCG/g2tRJzgDtYQMs6N
 23AA==
X-Gm-Message-State: AOJu0YyuG0nFUx3N/HQk+McUFr4WqMS2mon2QzTzrjKFuWBZdYZvia6I
 NHPqZInUhXWM98B5UJ3k7sNu7bOLB3Nb0S89ndxI9vH3omMNdtvFRaadvXGX0p3FNl3LoFBtnWX
 4VsjsB+AlASyRwI1TCUgJ9X4bb4IAikDkXB7oysFZD4Xyh13de7+J0udF0w==
X-Gm-Gg: AR+sD123cGXcHaRHaE930n6FVLJcPXX11y9119qdRXBkOEeHTiiWC1WuB2j6g55XUPw
 4ajWOhS/UUcFokUTwWPVsbuKOn5kKlLpwb+516Du7F6LG/DJvfbfMmaWmLjsVUMVnx8lg3xp9a3
 cQRnE5MqPqYQJipxq0ysKC21cpagyoXj9Wj4YztYK/8rNBMubJw/yfbPRrSi/HUthRgye43oMhK
 NMPxiOgbrvtEbOkb19FygrntVDYbR42iXi0egAUCYTgjetDJirpGjv0xNzL5CDCquIu4OliUM/0
 7bUi0O8wiw20UEYpU7s59AlI4vy3RUzbdV6NZwyIrfBq6p3JNvxdIj5IOLJQQ7nAhWrE3v4wsN/
 a833U4wQEOcQSSjg7BDBfonlmWg7Ov2wIqJ4=
X-Received: by 2002:a05:622a:591:b0:52b:6543:d8a with SMTP id
 d75a77b69052e-52ce6110546mr414326931cf.26.1786330690592; 
 Sun, 09 Aug 2026 19:58:10 -0700 (PDT)
X-Received: by 2002:a05:622a:591:b0:52b:6543:d8a with SMTP id
 d75a77b69052e-52ce6110546mr414326621cf.26.1786330690104; 
 Sun, 09 Aug 2026 19:58:10 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021506desm28637783f8f.10.2026.08.09.19.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:58:09 -0700 (PDT)
Message-ID: <be5efc9d-e0ae-444e-a9b9-7c2d28154bd5@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/56] disas/riscv: Drop always true branch psudeos
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20260809223545.730664-1-richard.henderson@linaro.org>
 <20260809223545.730664-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809223545.730664-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gBQM3H_GQFUbROpTgr1bK8pDZO-r5y6J
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a793e43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kK23U5ppG4VNz4uUfwYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gBQM3H_GQFUbROpTgr1bK8pDZO-r5y6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfXwYaPZ78REnUu
 WcdBQtTflkmlNwB21LYhhByPXrVIlZlQemaR4P8D6RYH31IC6WamYi8V7s1IV5kfiXqAGj+ewYQ
 2ndrkjj6qFGJuSDftfrrnAs4pZFuWRvg/VxXcO5nUEoRO8202Ne0gBhPzZHisdgpyTC7N+VxhRL
 7JW4CWZobVx87Ng9JuehlboFkMPNLy7zCXJf7yZeoo35if+lUijvZLhS3prjHb4Gfwd7w0fpk6H
 0F01cJvZ7g/T8l04okO3I5hsTHVdhkNFA5mY/LcT0qGe2+yDQcPQkeBd8OOEiXqnnE/NPTZonoL
 pIM6SaoqHpzPE2o43mSXOw3kQwv116N2bYso1szkWEga44S25tnhg6RGCE9nt91ateOpsX7BJ7H
 vrQgZgPNJwT+mH1MXBexVDOYNYP5L+Mw3c6S5ZVvtwIqneNPMEOxmKZpJDazSPtXgcQZ+XHzZrz
 Ui54UouZtgA4Eowo50w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX2oAqy+WofhJJ
 jj8ny23m9jhYJg3jzvNJpOVVFZi6MN3yrsJBvcmkjplr8WWM3aoM/YWe48CMpiv4amhFsAZGMwz
 7r0zjMGgaw59h+Kq/RfQ1nTiAdLOmFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100023
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

On 10/8/26 00:35, Richard Henderson wrote:
> The real insns are blt, bge, bltu, bgeu.  Do not include
> psuedos that unconditionally swap operands.  That's fine

Typo "pseudos" (also in $subject), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> for an assembler but not a disassembler.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/riscv.c | 32 ++++++--------------------------
>   1 file changed, 6 insertions(+), 26 deletions(-)


