Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D433C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0uN8-0001ah-A2; Mon, 31 Aug 2026 01:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uN7-0001aT-F4
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:15:53 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uN5-0007Ye-Rb
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:15:53 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V53LB63028635
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4abdHuCghocnmQou+IWzJfYizbkIW9tksfED/BxXfuM=; b=LC1cixDmq9sqqXuN
 DmChHOLlU8RSDZ/bM/YlvABFOCAIzakNmS0EZtbB2mxzg3wNwYUKEA1R5kuaz/v/
 4Qrvz6BeTDNpOOBdSU68SM/rvhIN6dkPUpPJ4bEvtHAIneaCfvN4GMHOOvZrsBS7
 B+EM5sugyYNJ1tEyNvraf4rbFKTNMK2MCqNAp5P0of/kO7M2ZEEr9joLxRVZSrrt
 qlTiac3EfNEYPZGFdjo6YPRgOSgoqJlVk3I5AoLCj52xMaoWzAeF673GOBls2yfU
 WvsUGGOQdDdNpMsUla1UsHXe1mGYeMs/ZPrzQPAmqeHrUuVvwgGAcHP44Worib0S
 wTY4ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvmndf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:15:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e62e3459fso371000785a.0
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788153350; x=1788758150; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4abdHuCghocnmQou+IWzJfYizbkIW9tksfED/BxXfuM=;
 b=H6SmmU9+j9ycI8qWV9ikixDT/wbkoJj+bNwJorUFvhkLrG+fAedSIR45Sz5J+4OeWE
 m60XJKpd+cWgRQOPdW+hNyeKLk6u1lZeW++6xDdE39wxjJLeQMHgboByYC4zzVkd0Slj
 Z04bosSXRpdVZL/Shly5uy7pjwQQomB451EUyNFnNuwGcH5CPizlfLwjPiZwATsKRfHf
 ZkEvVKh9ZcLbnp2U7BEfR/+XgTD/UfPVtwrQp9ek3kU8ZEDNPkBfh/wbcmHEgbP/QHmQ
 PG/WoW34a0Y3AsxCFSGTPKj/M1xURKm25KSAoCfTZJ0w5rhwA4ZSPcwQJEOc5Jc7PCDh
 KzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788153350; x=1788758150;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4abdHuCghocnmQou+IWzJfYizbkIW9tksfED/BxXfuM=;
 b=Ncm9O08lb1gw3ew/EvW4PC1vCEvnKm875MFahc5JE1pA3rvROskaFV0oxM6+cKluGq
 uYG0DUIh5eCWKgdWYhS+m4rLQx9qjni50I5NEnt5W697+BLWyiU0KJ5tlPMWMZ+KRhAD
 ctIGyk6tYwuXoos3yGfx4xlbUafwx5kP+5yMTMO/r3heQ2mtuK1i8gadF7Ww4wsdSDFI
 A3z9yo2eAmUaLb5hajBdmY+6DkNcHlszfEbT5BUIxxpzmenXz2H/MOOmRPQ7dm5JZ9+u
 vA/EUrblAUSuAkYmzlbQAzAmYdlH6ytZJ/c7FcOB17GXQ+fcYhFFBixN697FkoYgRj8U
 qX/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq3DKer1JDQhUXBcFj71+thY7urArA2JGwgG0RJ6OlRzK7WXHKx1O50BDs5IgL9xobc9+F1wjvbrG/0@nongnu.org
X-Gm-Message-State: AFuF++l5QmkDEn8BzMkH2OuDo5RRy1ObwadDIt1EjI28wn/yB5cu/iZB
 qiKGlZB14rq7q5fXiPhaQc0xDxAjpcTRjVFnP2PdoP9Teig2HvWKge7YgTuQy+q30cFkVrpJYEX
 k6WoxYJd0wBM6OZHOcTRwqN2u0YRPKUHbrKot/M7Xr72Y1UtXyKi8IT+rQA==
X-Gm-Gg: AR+sD13taUSYTFVZRywpb67iTVCKgzdGlg203flkbxDSvHD9YzHD+AtXIBovRNyLsN3
 zgw7wt3g785cw2zU1iRjOlRhmGs50lwVSwhUS1KLpeYR85tMih4ufXZrWskg7MitHXk4YUQAywP
 pZWkcDA0eE3lxmSFLwKI0VbHg7vT2iArDWXEFsVbfF1clh5A3W5GFMEazG2Zkr8GGFtJ6p4bejP
 xTqdUiD60rh+dIcC/smUPNcqPc7RO4Yp5qCg7BqaloI6HkstY83Pm+F2PgXYEB7nd8fbYatGHqU
 PxTVFiJOAcI8tKcfbf3/++0uH3/eIVQlTcpFSJCn8RfaK3LJaK7N4m72c6G/sEnv8U5JZSNeZaK
 m8XNVg4rYqYQkft5NrR9z7MGhK8bBlGo+7w==
X-Received: by 2002:a05:620a:f04:b0:92e:6a33:7118 with SMTP id
 af79cd13be357-939138df202mr2468636385a.30.1788153350039; 
 Sun, 30 Aug 2026 22:15:50 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:92e:6a33:7118 with SMTP id
 af79cd13be357-939138df202mr2468633185a.30.1788153349607; 
 Sun, 30 Aug 2026 22:15:49 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb2794dsm20953325f8f.25.2026.08.30.22.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:15:48 -0700 (PDT)
Message-ID: <3107fb38-5319-468f-8dfb-91b8364ae584@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] hw/riscv/atlantis: Decouple RAM size from
 MachineState
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
 <20260831021500.82565-13-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831021500.82565-13-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F3_TyQJ8eDXoxHYyvvaXffDmbIhm7mNP
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a950e06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfXwEYBThwg8aWH
 ljWJlkhh4OIU4JjxhoxSoSePHWdSOMAvFw+9F7Ssr1afbRRaUhNnBDux2hF658vAOo9TfSZA+H1
 QGMOuoEzy4QzOqkdXPHeOo1hxmu4Yyb/tWVSRRsNmHrIE4pvediwiMxyc32m4U/c/Se3aquew4W
 /TSzKxuJM2GV4bUtxPjkdyQI555imS0yp74FroA1bCb/URPyGhf9Bt0YbgKilyhS8jOlKISJRFk
 1pr6eGq6+vqvbHrf8yPCN5bF07yBhy8G9U1wYl0g9QJTyL1dVj714xX9g6RoDUkaEfMLrlgClGw
 GwyWMDhLdGV1Ai8213BEQjCG7EbYWJ71rQNcZlkkWUp0Zac6IudzO6HAltoBvTK03yZSpPwABrM
 kTCVfQzUG9ycKt7A5qAIIn+oEQl3IHbu3r33QVl9Q5ePHUXnjPoIJO8HPT5e62+vVkXtF8kSPxE
 h87ylLKOCM+uo8/lZUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfX4wrPmav0wnUZ
 uBe9Q9e8vnu/0vvsAlLF+Jh4BTQJWL3lN3FmjzBqLHvZesz63afa5Xw7qbksQWwcJuy9bSlIJGu
 nFlylo1GnXpJDUJ+pSxSiDl9r9/DfM0=
X-Proofpoint-ORIG-GUID: F3_TyQJ8eDXoxHYyvvaXffDmbIhm7mNP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310042
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

On 31/8/26 04:14, Joel Stanley wrote:
> Keep a reference to the machine's RAM MemoryRegion in TTAtlantisState,
> and get the MemoryRegion's size where the configured RAM size is
> required.
> 
> This allows reading the RAM size without needing a pointer to
> MachineState, decoupling the memory layout setup from the machine.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/riscv/tt_atlantis.h |  1 +
>   hw/riscv/tt_atlantis.c         | 20 ++++++++++++--------
>   2 files changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

