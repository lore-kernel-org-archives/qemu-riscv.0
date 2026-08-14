Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1A8C5CFCF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 05:45:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wukjG-0005bv-FY; Fri, 14 Aug 2026 01:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wukj4-0005Rq-FM
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 01:45:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wukix-0003rs-97
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 01:45:04 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E4Qo3P594117
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 05:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M56de8k84TxEmO0hrYouRRFTJOdOt7mdshtL1vdYdl0=; b=jpHupwety6lMHemA
 +kjNJKYIrKha6vl4F19JSFNpcm3rVrF79Z/+IXtsZK811OEy7RfSHgDFtj20U8If
 NnZWtrj5e5/P00zk/73X2dN7gQYuypuxHT3qJQhyTvpx6UDckVBsIF8KkuJlkj2A
 7NwtYM5D7eP2Js43pBDWgZM99in/zOFeNf/JGexnAqvm5ahpJZt8/F4xRqACHvMK
 7JhUqQiwA8wuTN52lsIXeeEvbv/KXrQCMBJLrXTuI0OdA0GKiz6hVA7vaBDLKgs/
 sT1QHwPVfhLPgmYG0Vf2z+/oaaDNXilRyreWrsoMlyTO286f75CrWmx2MaLu0jCV
 Q0+gJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4tup8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 05:44:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52d827597fbso11474991cf.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 22:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786686296; x=1787291096; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=M56de8k84TxEmO0hrYouRRFTJOdOt7mdshtL1vdYdl0=;
 b=FiHu6/zos0L5cOY3hHDNvDzLPtkuZM6ELbf82+ljqf3i4zCvxEYXEsqGSd41Z6NtWi
 y13+Y/6WoxX9ISHk9fUacAbECjUG+HOPtXuh72kzj+h0Mgvg2oPfWxYyXe95+wf18zM1
 /yghKf2vkWTtLVlKYT9B64O1ZDfiLmxTG+Y73/1B0HtHlX7qiJ9UObPABVhyX55gBSEO
 pmJ8Pe95+hdViqgYKtunP8KUlwqQmK1z/9K4K8dyfE4cu10TaK9UkAySBFe+7yKKqRrn
 He/5UskJ3kzBWFH6dbDQtfERolY8o2GlofJc+M5c33YN/oyIoEloBaYBcNhQW43w3Mux
 JlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786686296; x=1787291096;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=M56de8k84TxEmO0hrYouRRFTJOdOt7mdshtL1vdYdl0=;
 b=tZq4ngxwZbEaHbzNTC9VImHzFl5LmllmZUNJe6+N5OqK2V6X++1spSl1aIu+3PZWMy
 BTqDa5z4TCmWAhO1XopzxTIJzU1hMDxXo8T4LUK6J9Kt7DvOJPcDRzdMoWFCJX97Af8D
 0/D8s7DNBq22fnykX5MHmYpVIhjSPtQP/Nz7O1Fou7ERtADKCcewpOawQHeMmNIufViy
 PQIshY2/z24jkxFaugHGW78vEMWx6JMxoAUn9c3/VnttHuuNrcIiRpMRrTuTq0MZQB2l
 tZGsfxr5vGAPsKYWsp9EoFycpeRveoLIiKjXCfZi7IAw5tjAHwqguDHW9mq/zBa68MJE
 xrbw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpxGucQ112GuFdh5MsAB31tmAeP4THJMJQN4qyewFPDZuTDMF/K3qqZOxIaxVNzV/qpQrFDTUzMHjJ/@nongnu.org
X-Gm-Message-State: AOJu0YzIFGFjnDmkliwD265UTFpBo/y86qlJKXuhU0b9AkilAQrjDR5z
 qJwP4xHPy+yd9t9SM/bZuxFV/pWLITfm+dvyfbI/SUlqrJg/FCF9zrcU0/3RNDZsQ7Hr5LkW2Io
 8iCFm9JYRM6uzC0cMOekShuL9IyQPkiBBPoXhU+oElv1OEfEq/ruOZsspEw==
X-Gm-Gg: AR+sD13jaK4A3lv7U8AWE4rLyVVHVbnJCxyyk7HvFe0t1X9lzJ0W5czS14+WrnJ/sTL
 ZciYvkRSMIm7WZk+YM7E8iPZ3R9AFooMQ2UhScG4Mp73qpdXe8qXbm0/EwGFvNVm+TE1uBd8GIv
 ZxJ7pKGMGUc9PmrFSIJsSMOc9oFua6HUUeyF3fFjkS8+/BTf4ihTd7wPsh/MOChlWOFBPgZSPJV
 jG2Q/tsE7jVzTLLSUVU0gtpzuNNXcJ32mhzfsa/lUkxjTntgCSVYW4jNQoRd+SZ1UWZTRpCCgz7
 8SOUq8Nahwa6iIgYKFUt9GynLL/27UngF1WnMN1y0oCUI0XZlxTV1VbgsDWx9/BuZmbFsUR4a7t
 Jl3QShJGyyU1bVDVSqSFZZqZE6FG8TcH0pTk=
X-Received: by 2002:ac8:6104:0:b0:528:3c2c:5c72 with SMTP id
 d75a77b69052e-52d854a4a51mr44616501cf.32.1786686295711; 
 Thu, 13 Aug 2026 22:44:55 -0700 (PDT)
X-Received: by 2002:ac8:6104:0:b0:528:3c2c:5c72 with SMTP id
 d75a77b69052e-52d854a4a51mr44616091cf.32.1786686295216; 
 Thu, 13 Aug 2026 22:44:55 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b1d33asm22968415e9.10.2026.08.13.22.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 22:44:54 -0700 (PDT)
Message-ID: <7c5a0b1d-12db-4be2-b20c-9d132b027a76@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 07:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] build: add optional librpmi dependency
Content-Language: en-US
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260814045315.3416169-2-subrahmanya.lingappa@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260814045315.3416169-2-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _7G2FL2j9Wzt_tmCGF9N1D_Nm6dCRlbM
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7eab59 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=01anJWeQb-5wN4vR1WoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA0MiBTYWx0ZWRfX/YZErEePzcBl
 nB2poYzwAWnBPMv54JzAl1Slps1w8TMvFZoJJHJryjjrG2nnATGr+ITri9LTg3zRal3r1eULXv+
 9JCkJvMjq38Yy+StYQC8ZVIFd7j3b7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA0MiBTYWx0ZWRfX/o8QpZcJ37rb
 PqLy2PqtykCp2GGBm0tL+aU/XS3Na233W3X7RjEXve9gvWbk+BqSWoOxqAMTIr8+vKOdWxpjj4f
 YepMzn/bSBqY881r3qOlBmQ1usxdKJSeG7PryVRxwBb08HQ02fCbuqyj3kOPZpfo2Niql46NsXS
 h+DV4g9k+wl3mRoKs+G+QU8vAhn20tOHQ0kWbPfupXcdiPKeL00WcoWatYx19c0k1cBjXpC4kni
 XcpjhKHpf6jSNJ3Xkma6fEK5QmC/s34OG63kd8J6jHJYPjstw4Z0Af6ySAWsy81TAz/eAMRxdJj
 SOcBW2U/dJLLdnYSGgS3DMf+/sRQELiUT4kFGXUQS821jNH+7Of3uPe6bcM40CKjxTl79I56AFS
 oL18C3S05WbEDOW30l+LZ/4b3FWewTm/llEIuJL9/uD6M53YdiicDHqnjdMrY3UZfAp2wtkO6+U
 6y1Oulj0s5NXkwqPjvA==
X-Proofpoint-GUID: _7G2FL2j9Wzt_tmCGF9N1D_Nm6dCRlbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140042
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

Hi,

On 14/8/26 06:53, Subrahmanya Lingappa wrote:
> Add a meson option and config probe for librpmi so RISC-V machines can
> opt into RPMI support when the library is available. Keep the dependency
> optional so default builds without librpmi continue to work.
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   Kconfig.host                  |  3 +++
>   meson.build                   | 14 ++++++++++++++
>   meson_options.txt             |  2 ++
>   scripts/meson-buildoptions.sh |  3 +++
>   4 files changed, 22 insertions(+)

Could you provide a cover letter so we can understand the changes
with the previous versions? It is hard to figure out why we are
at v8 and what we have to review again.

Thanks,

Phil.

