Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8257C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:04:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0uC9-00075K-9o; Mon, 31 Aug 2026 01:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uBz-00074s-KH
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:04:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uBx-0006aH-Ul
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:04:23 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52qfb2681116
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oswsUP+CRX6kLq8yTyjleMpGuJ+YfB26j6ccOi34I+Q=; b=PnILdNOltJ6bGyu6
 HmNePXgPp6ZFDE+wKlBCG9/aeLir/qECFV6Lid7m7moEQrX40SUabppUrdXnF0Qn
 pUKE4/QuYbaLr1KbI1zU8X34puyUqMgkLN89DyEdpk82uNr36J4GqUokbCrZ39Hw
 NmV6FVP573X/Q5WF3Tq0aHNpR7plwuEA+lD7/dHjhwgHDuFJc7W98cZrMv4y8ECR
 rrW40axPuVgmDDHls9jkzRmLd/Jbsh0ssztpCFztkQHrhXFyQXWVvITIPRpXeCTy
 tEvo/jpThA1sczRBYT//eGoFAQPe7tQJDsT7rgXlXtW1Q5mdCfBhuRq76d8+l9zg
 0Ww/6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwcn9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:04:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-933023a5980so637456485a.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788152659; x=1788757459; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oswsUP+CRX6kLq8yTyjleMpGuJ+YfB26j6ccOi34I+Q=;
 b=cKl2ZqVcfssRoOUCRoNPiUfvylYzKX36jSVE962eDun4qSXvEaNCex8Fl7DWdy3IEQ
 jp7Ng0R4LGXkNlpZh5rWHAktt8+feK3uWOujN18r+Xray/hbdVC34EMrTWaPLrRjv20b
 fqUKKLZF2cYvUJH4FmfwxxSWM9YyZb9vYZ6I91uBbOvQR6ffEdSf8SAbDbHEYCvK2NUT
 w0H6BUR4dUk+6ksw8JSTs2MjJXQsmWUHd3/6reQn5M5/JFvbT8sgRfKas7C7p8Yfodyn
 g+yXgKujgLyAdF2122Ap7uCGL1kXjhPppC8G/VhxKXwLFfUCWUKog4rxzsA9Bl2SJAnL
 k43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788152659; x=1788757459;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oswsUP+CRX6kLq8yTyjleMpGuJ+YfB26j6ccOi34I+Q=;
 b=dpTild310wAeiPY4VNfn6nfAJH/Nnq0LoHC5NyxftPc+kSd/8RnlfhZ6Ktl8V2vtHj
 kWqQnCoU7gYfSOcJkqwesk/qcFjLO6c1ND2iLiTXgwsHKxH+eKeepr049YkL/GFt/RbR
 Xe3g69Euh5dQtVcM0YrngRwJ3ePSsKxwAvwfAIWJhPcIb3LuIgU3NtW3/5yjoJMW5SWY
 rGbC+vgFgMEmAZZvb9nA07UD/jezs7VctDpd7fSylWgdvLrzKYVXeOeH4vI12iFl6i5P
 Npuy1PpgYjOOaoPmOJoeoAk1MpsqQb39eS5u2cHGjq+GfJ+M5RUnECqIv8QKXuKEAjW2
 VEBg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpo49xuf4z7bSdASNe0X46AxY6Tuoz/HbxaGP/BhoY3pAIN60WcwE4zI5Hf2q8+22NCppwHyueSrPky@nongnu.org
X-Gm-Message-State: AFuF++kT/H9Q63y0dvbRBCl/2JtB3CrV/9SrgOkn4mg9HphZLkviwSum
 +/WSfGmSYLn75LfzvmWc9G/XEHssxAXdHEOPtizTaoA4abhkBcESY2XwqeJJ4YOV+17B3xQOixn
 2PiU65oO1X+Dbrz8mb098272OsHTnMrkoxdT9hBRp7saXgSKe4r+PSm6Jzw==
X-Gm-Gg: AR+sD10WguDyTGWifNneIXE8xaOWlnPvwtfPL5U8B+feWl3RxplQvAUCMBblr69xW7O
 OdZV6YqOd19+qVmKS2eAXWJaOCm1VTb2F59tUt0E5w0MHvIFlcWBYI9ifbw+5Di3mqb2FtNMdQU
 YOluJ4ZPDt3wcWDvyX/JAvlYFbizJWIG0V27WPOfl/tjscb+HuOw/cmL+MrO6k49EEZ1DY+yLLy
 GhAAzu+0Z0a7Pw5653jnp2Tl8RXifUP8O/hJKoHKmV5o5qXW6DR39gq6PjnMt37pRM2vIfG3HzO
 HQBcCRP+1oV2n0v0IPelj1Cq7vfbjgz0QcmzffBPEQj+x6Rw+ok2fILKH+grwG/pj3D7z4rmc5g
 XnSayTVxEuUxqUzz7mxUmio6muNKOSt8+Zg==
X-Received: by 2002:a05:620a:46a2:b0:930:f129:1a45 with SMTP id
 af79cd13be357-93913923d59mr2423389485a.30.1788152659490; 
 Sun, 30 Aug 2026 22:04:19 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:930:f129:1a45 with SMTP id
 af79cd13be357-93913923d59mr2423383585a.30.1788152659004; 
 Sun, 30 Aug 2026 22:04:19 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4942298fsm352574695e9.1.2026.08.30.22.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:04:18 -0700 (PDT)
Message-ID: <65d5d8d2-d63e-4bbf-afb0-d65ddcb85a50@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] hw/intc/riscv_aplic: Take a MemoryRegion for the
 created device
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-5-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831021500.82565-5-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5B0p5oNjd1GtdZCoJXs40INZx8A8zySR
X-Proofpoint-ORIG-GUID: 5B0p5oNjd1GtdZCoJXs40INZx8A8zySR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX2O20QuynwqiF
 ryDJOdWAvOe/xwlTtpVfzbUnsXNXpit1irFL5u6Y8aPpnGh7kdRLDsK+SoUT79WNBJb+XN0wmaI
 498SndFY04tYMiZqdOzl/naU6hx6GGU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX0xyvr8yOBwNa
 603y3z2ccvVdd+jG3G2KVF2T+LKqEhUjkJ9MzFeW1ajKJwgiq13TP5cmWhMl5Ke+ytxiwzUBzEK
 hJSFk62mftNB+4sqLxlhiXvCHZptqDcA0bpdfP0Bf1jA83tqCyNY9G6aUrxeYbGwnCIw7i3hOyl
 Gj9v/OMQi3K4bTu/Qxseojs3uZGEKbpNEt99L5Ru1aJHbhk21TY/irVAAofw0ONc8sIpU53grYq
 mimvuNN82FZHaI5twDQ9YYSnG8vPiX8o69IBao2j6MfEZ+GknEvWM8uP5OKuN4Hr7aMG1K4VDCP
 16XNfxRqMmllUe5F+pV7UKydDFuhBEPMW/99AWaMF0cQKDitaAxA6NujYci/DoWfqybdnBZF8wC
 K7Jaqf1iyV0wxdyw8Y1tC/Ho3qWCkQwbsWEdHvepBhRTD1xGnwzUULponeKPb2yK0JqjFUXWEKU
 1a+mcp06nChmzApQ2XQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a950b54 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=c8oAG7Qat8bFSpU1qJEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310041
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

On 31/8/26 04:14, Joel Stanley wrote:
> riscv_aplic_create() maps the device it creates into system_memory,
> which prevents its use by SoCs that map devices into their own memory
> container.
> 
> Add a MemoryRegion parameter and map the device into it instead of
> calling sysbus_mmio_map(). The mapping still only happens when the
> APLIC is emulated. All callers pass system_memory, so there is no
> change in behaviour.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/intc/riscv_aplic.h | 2 +-
>   hw/intc/riscv_aplic.c         | 5 +++--
>   hw/riscv/aia.c                | 6 ++++--
>   hw/riscv/cps.c                | 6 ++++--
>   hw/riscv/xiangshan_kmh.c      | 6 ++++--
>   5 files changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

