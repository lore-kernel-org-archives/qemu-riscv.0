Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F80C5DF66
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 09:06:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvWoS-0004S2-Lw; Sun, 16 Aug 2026 05:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWoP-0004RW-V5
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:05:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWoO-0000L3-GK
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:05:49 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G72DhI2810821
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 77LeBJ+22Eapc1K3oRR7nbu1P891lTBRsoTsMkhlZuo=; b=nD+Xb4YVYQ87bNhP
 bHyvpRpc+pO/XFixO9eAR7KgY3ui91WXODpSiLpNVOIUNGjs8ghic/W18oFgkq3w
 6HuQ701PSs6UHGOQQIQoFEWpX8lpXMxEv9WNkjToylk5ihonI4bH5Rd8IhRO4tF7
 uBYmzvNWgFtdlceyY5oaGj9/DLiv+KxXhNfIrNEjQb/So6E5LmgH4atyBYaN933Y
 jbXBPLS+rX+j/ubXmktPAl+zcptkRlOFLzdJt41fKOONGh4UMvq9WLWbsxyq6BG8
 SBxjBqEV6Ym90woJk0YysvxE6z+vxXZVaylBVFwpkOOCsTMHr9LMlT25udJKdutr
 OyG7Fw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghek6nf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:05:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52b4f6ac06aso45870431cf.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871147; x=1787475947; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=77LeBJ+22Eapc1K3oRR7nbu1P891lTBRsoTsMkhlZuo=;
 b=EzfPn4raAosXk3e+/q3Rh9q76B6NRiB/fWYMLKhjPDxxC5fW2XEdW5Ds+O+/ZCA0Bq
 yxvB4JofCefLmfQ8fqKhrRArMCZAw7Fv9Nfp0Zf3rRpVAnCuITU5PFpv0mvI0JmrzemB
 kLGS3dzJNSqTDixfUp9DeFWal/CfV+BfdNWjZeHcGPVFBlMDSRRENScQ8KYFUz2UTAVw
 r+QwEHVH0iSfmiGzUCoWQXIbKoMmA2fE61RRQ9rCgYKuXymGs47d9PNQAby2Lyb0UxaH
 ipb289wz4ZMn64fIjUxILu7DncdUzrKccI8j6KA3x8XF9xyOn0aryT9Hulj/ziBsNKYL
 F/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871147; x=1787475947;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=77LeBJ+22Eapc1K3oRR7nbu1P891lTBRsoTsMkhlZuo=;
 b=f8oY5cJHVZrkUgRxzuyHl7/KdDn2eSOt5zUa0kiYpUs2Go9YksOLoS+1lYGlI2A3P3
 ue5E8hcFD6Y4UCBxbT2HevnP8vXbJdumRzLk2oFVJ6ceBlQkPcEALM31aAW5WmqKjbS5
 70h51RMgvjnQa2XKfVxb4LNcP7faJB4uB+JdQ6nt7Z7XVrruCoaI2J8NIF5hsZqX0ARj
 +XsuFv04D7BH6GV5hL3gcglyjVDfr0XDoXvPA1ge2hB9/yMh5u3Vq6fNlgTyjfIFLplD
 imAEiRYPFR0j9fS6A8WBPzxu1M0zOIHBOednCdK6dFgEQDCu1xUQMHsO8+Ff2j4H2+Lr
 FAqw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrNwaKsc+ts1oL9FkzRAtdEED1HPtEHJvTmaphHSvSlQ+Xl3de6Wq7Cuhj3SCfA/pKTSuHOSpNXNHCs@nongnu.org
X-Gm-Message-State: AOJu0YwHib43xo3qf42TCElRlw8TMqqCzuoM2HJ3AZWBIEjNW5zgAfrM
 CsHdzgHHcP749lxlcBt+eF2OUgM/8vE3vgqDOw1mjeEjULDH0FkZ65QCtaH2fMegSTlrlNA0vN5
 VmemBVCMnlJ9YQLILaWjQ15Ur7RK3I+xlgcgsrFMRdXAUZ8naT+MBY4247H8XeWC5pQ==
X-Gm-Gg: AR+sD132zpNiYhJy0j53eTXqmWaJAE3zFOv4IgfUtDrnW45OkL5YRkOxIc60yZVSTgN
 Xi3p8yJKJLjyWSdoh0EzimLBiwbNo07Q/Efc8/POQxF6WN8PJWciyZlrQ74HSIOKT1rrvDwo4VP
 cnm+UsLRVbTyeqAzW5K8SS8HeERfiJmgvavvuxMM0ne0KyAfRyBtMJ/kuKTLIO0xZ5VfmZvQeRc
 PT+5EhV1FOtTexGaDwwaL9f6GIL1Ph1O/S32Yb3CITbt9ql7batfUzZBqzF9VdY10+DuJ96Hy36
 DUV30zJ3KSvy5eRfwOKSt6aL837ahtD0F/ig28wH6qOLXNOgoZnP0ZFuYL/LAZ0iNDzZn5nmduU
 LFFYiWYJ4XTMb8hRuC/bSAHHVZ7rFg0dToMs=
X-Received: by 2002:a05:622a:40c8:b0:527:7842:72cc with SMTP id
 d75a77b69052e-52d854e5526mr203053571cf.39.1786871146676; 
 Sun, 16 Aug 2026 02:05:46 -0700 (PDT)
X-Received: by 2002:a05:622a:40c8:b0:527:7842:72cc with SMTP id
 d75a77b69052e-52d854e5526mr203053341cf.39.1786871146355; 
 Sun, 16 Aug 2026 02:05:46 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1f90sm21758169f8f.18.2026.08.16.02.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:05:45 -0700 (PDT)
Message-ID: <701c7946-1396-447b-8fff-2e17fdf5bfcc@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/18] accel/tcg: Drop fault_size from user-only
 probe_access_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EKc2FVZC c=1 sm=1 tr=0 ts=6a817d6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2NiBTYWx0ZWRfXy9W+uqd1vqSW
 4u+YkEf9DBhEiQE7TyE6x8jvnIGPTipAIF7pdsZd+aYw/9hgndz1oJ5hKIMAyaM21pfa4bYVWtn
 p1AB4+xE+1ox+ANeSCD1hrYW0n/4X0w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2NiBTYWx0ZWRfX727zNUHtgTdB
 OMzR+rk8L6h9IWRQ5wRtxrbl15kDJbjcDu+THLaOj0gUuJqQr0aCW+GVMeBQTDXAwFffhsV42bt
 A6rxXmsYWA50hkXd4XbnaMOCUPYIXJ+1i0d9bvmFGMHwtD2zEOlOTOW/Lp++7kQCkKpljfKENqr
 L8juo9BenizZFFp5qaaggaeiA+NFEWw3iVbBggj2B5ZEhbAnsTrXR4w+TLHk9VyUMXDrjao2JVh
 /7eJlh6tYfUgUcQXbYE9OxizWR/mx6kxpdLW98SccUJ/McJDrJqkaAozSCKswllhCYMrACsBar0
 J8nFNnbk4FkCQbuNUK+Yuf+UEj1626q8baZ8x0cfIOIaImgiQUYMCv78aEqc6GETWeNgXFYAH53
 PK466Ryulc3HShrfS7zdANZjvWNQ6c9EQK6hHda5edentLGSmjhdh+bw96Gegs21aKEGRPQ5NM2
 K2SPIr8MGtpydPFX+EA==
X-Proofpoint-GUID: 3kO4v5_Si122PuqCCOvPlWhyWD4f2fAx
X-Proofpoint-ORIG-GUID: 3kO4v5_Si122PuqCCOvPlWhyWD4f2fAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160066
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 15/8/26 22:37, Richard Henderson wrote:
> This argument is unused.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/user-exec.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

