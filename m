Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787BDC5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:59:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtGEY-0004vp-Ml; Sun, 09 Aug 2026 22:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGEX-0004vY-Ix
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:59:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGEW-00057c-7s
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:59:25 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L77QG3729459
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dtNukDy+mriNHREpnujIMCaiaLmqiF8aFvwozsBV298=; b=nl3C0tqktXoJHjPE
 VnSXyU4az7igeExQRpFO6k8Jvcdm6+fOEBbZtuo2gdtxtqWeKJxNQCy/xVQAogse
 wK2INrxXLqHG4tNF1dS1ObsJlBcSeWUdFRUkH4Omo0HZZttGjee9mZpRIQzLZgd4
 BqOL8Pp6TXUl9/cHick0E3sh1pinJ5F5jIDxgt1f0eyA2pAIBw5cKwpqXgKdETXS
 v54LF57gXoVLHNO4CnsUhzaMJ8GJ2hhVuUyvTPWD3dX0gkt6UawK5IjE6j/7TVL1
 xFo40sSumnWcO0COca5NqrRyehwXVLf6/nxqWz0sYouDlsoOrUYoGCnLehRWrC2k
 TCp0/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush4644-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:59:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bf321d786so17920901cf.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330762; x=1786935562; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dtNukDy+mriNHREpnujIMCaiaLmqiF8aFvwozsBV298=;
 b=jjuLzo1c8i5g/CBcBlzEvphnHbDiRDzuu6E92GbbZa91Q7KMw2sYouKa0+BfpElEcV
 CbsA0H+SpRZVlQVNd8bfDllrx/shSgcGrl6NkieZ5r/KVLfCiO623qH6dTT2zLwtSap6
 x8V2frA7ujlcivGjtQISO8/ioeFJXNZmTdxjWfKRzkBIfFEwOZHbE1Ag4ArQ4jzK5znM
 I6Jb7rLjkwOrKsGwV9OPmGhw12wPVZPX3jG1BpZws81V0OPpQyARfPgJbiE3sA2IoJ5D
 RX0ePPHF6bFlEyBNTaFPAUR1qYVKhITlgH/hM9mzsvGH+9q/4hWRNXQr4tOyk94k2ZYw
 q8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330762; x=1786935562;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dtNukDy+mriNHREpnujIMCaiaLmqiF8aFvwozsBV298=;
 b=BcXVX42AAtpRaWnk8rompOskNMx/jTQLHrUWPQfpstqO6Zr07BEKCF5X83kiYtsxBv
 UW7pvofcO6ORgQpl5zKrIIW7nI/RdckrCFoNDWVqerhng7hVDUG6Ats2OVUy2eOY4SgC
 chTl+5fupoGNgy0SF/p8rqrqvw6GBSznlU0Hqg7hFw5f73sWZ1Ja4X9JhAuE9wkHe7K2
 vp4YiPSlFGX4fK4wwLZH+sy96P2qnrtJ0YQmyA4MsA9fTQ67/SaiHRmQOREkI03uKUPk
 SB7mcsEu9AMJaZJwGjNyWEOmXfd3Fp6Zr/7RH4zT93aYX9p9QIZwY0evft0zTRUFwEi0
 4d5w==
X-Gm-Message-State: AOJu0YyrW2HcldOfeZ9ydpYd/U3lnoTNt9uMM2HC+Laz4tCwk8RmlKW7
 YF2tHgOfeK7HnawVSxM1jYi2Yh7qM8JRXjX2FCYJsuJxaQ0oqFQEZNyH7+iLI+2AgOKioT6zK/E
 g6GUeovrskGPiO937Vac0D9Epwp006mNeBHmRVm4LFmtrz6i4UGupS5+Rhg==
X-Gm-Gg: AR+sD103KbyPUZlj2XAEXv2WM7S4PouzvXd3wWohRQiZZhI0cnRMEewDx9m9UjCVgei
 xjH3B6K5JE2dU1/OgHw/VsA4YBsq6fDci8CUhFZMbyF/WImaFRtOTrCxi/6Vha/VBZWN8V/lVBC
 k0sQEms5XMFxev/EEBsvNIEJPVJnMQ2h8Ogg2oRf2/iNokWJIGwjWTIR25rpF5QIkDzsx7q3uLJ
 X56pF3kopEBWZnjye5s1ftlaL0DG/n8VzEpTqTSvj1VN0uwYsuJ8I4sJSsBJvGRyZUTMJL4y3vt
 p2WS6f84qm72xPZP+QnS6BYmfGiUYj04wz44Y+VEO7FZdaCnwm2xFMjk+sgNgiQahr3tQYbNhTz
 4DPGIkMM0eNvrwrNIyuj+WmRNfgSsniuOYuE=
X-Received: by 2002:a05:622a:588d:b0:528:38b1:b539 with SMTP id
 d75a77b69052e-52d18e6b461mr233977581cf.10.1786330762512; 
 Sun, 09 Aug 2026 19:59:22 -0700 (PDT)
X-Received: by 2002:a05:622a:588d:b0:528:38b1:b539 with SMTP id
 d75a77b69052e-52d18e6b461mr233977411cf.10.1786330762120; 
 Sun, 09 Aug 2026 19:59:22 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995e9e702dsm299484505e9.3.2026.08.09.19.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:59:21 -0700 (PDT)
Message-ID: <52aa39fe-5b82-4e7d-b86b-1698e617d911@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 56/56] disas/riscv: Sort riscv-op.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20260809223545.730664-1-richard.henderson@linaro.org>
 <20260809223545.730664-57-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809223545.730664-57-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GxBKmwAQLSFUtxzq7Iveo6w33--xZDiE
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a793e8b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GxBKmwAQLSFUtxzq7Iveo6w33--xZDiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX9d6oIRPsr02a
 yZK4UxT9ckb7M4I2RRSM+hEY/014Ms7t2t9GPb+DonX2y90UCIi8udT5NKHGDR1X60GAdhVnnMj
 lipNfT4JwVaAqVDg9u6Hl6afGU2wvOG3Xv38JBCH8lhnzAXIouj9YkLLTw3Tujg8Xxz6bF7RI+T
 KZyxm+c9jdkklX3KkeWdwWbmvSqyj9r2vK8C5fF/RUiO/70vr1/ftmbm7bZZYqes+rzwhCosp7H
 iUnOWXraAUex96khCLOV99y8dvPYreVdJcb7BFCFeiFu6rdg3WIKUv0znhQtsTsJ/ma9Uyq+KjU
 7gNDYCi67Mt0dVHjSVihJTlJm7WU7Rl5wO4jhNNj4eO3UKWW6/HvL54OZUpW3RNWyF2TNWIkg3k
 kV2VwVq0vD2qC3y0QRzm24BkkU3+2iyTNRLfaddyCZ2znjBrkN00YmqG9bJaWuEv/95iIaVgCxz
 TzwGuqc4FPh+yj3dOrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX11xZqoB7L+71
 SYYdlF8ftOHP1FIaw4Oz3j12Pm6BkcjIdMjwAfsZKNdf0K8k/FKnJll7IAn5iAYna+fi+Xj+/c2
 URE/y4W1KkAI7+UzzxePGDvzoPnV6L4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100023
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
> To date, opcodes had to be added to the end of the list,
> resulting in quite the disorder.  Sort via 'LANG=C sort'.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/riscv-op.c.inc | 1704 +++++++++++++++++++++---------------------
>   1 file changed, 852 insertions(+), 852 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

