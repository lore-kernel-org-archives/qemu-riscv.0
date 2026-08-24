Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF235C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:05:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNoS-0005oS-GO; Mon, 24 Aug 2026 02:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyNoQ-0005fu-Pi
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 02:05:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyNoP-0006uQ-71
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 02:05:38 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O5RIlZ1848428
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 06:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mNOh3+3AhVioMOpvSHXm0okox7+ZQtIOz/6ydnkI1DA=; b=Ow5sh0+Xa/fYgyck
 rD3SFhsCEsK0CK7MsTPmPNNGTnRBwLhiTBpYobXoCmluALlGndAQGNPBuQ9L+zBg
 BwkYPKaGG7w9xd0RM+wWRrdLnDHCgottv9qZi22Qdrh5DWdN3e88jtOfMdX2Mm1f
 gzIZuG809yWs48WDKO3+JNiCjs1gYESDjQLPMJCJ0a8vG+NaVvMDAmghYP8cfh2h
 FpFzzQXDZbDAL32NlJdJ2/R7Hs3yAI3nkk/GeQq7Zo9gZQAMzRRune0OigUZ7ihM
 fXXpBbDyY7fhhZqSL/jzviS0YRJJS8Ni/x1ju1x/EEKK+Lukxsj8TyOCnKeacMl2
 NKDsug==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f5ma0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 06:05:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-97c3607c924so3885717241.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 23:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787551535; x=1788156335; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mNOh3+3AhVioMOpvSHXm0okox7+ZQtIOz/6ydnkI1DA=;
 b=RSNtH/HtyprQct/WPtL8TqYoYaIthl9Efc4vQQb4tbdSdum3ulTvf76egGlVCJ8gKm
 yz02xUnSmsbZBTMlNbBQ2jucyk7yakk8nVzkRIVr1WQV5gU8pQRYCOqfhSInzXRElwj9
 z8Nllg+W/YfaLy7t/PBzSUnv99wWeciRlwvjwDVSd+oz9rNWU9G4+c5fOwJ+F1j1kfJQ
 9qU6ITM3YPtjqdd8c39fl6ijKZSFRKr54reWNgXfCEPBhQDJmyNSHyFxc4cEdjfxsUN4
 B55kxRrO3v7q276c/5l4Mw3TQiXIDNeLeVMn+UvaBrGUMB5Gifh31nKF0YPoXVGddMbh
 DSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551535; x=1788156335;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mNOh3+3AhVioMOpvSHXm0okox7+ZQtIOz/6ydnkI1DA=;
 b=mMVh+K84q3sDQlSY/mNAl4xb5uLJVbXoXQH5Rzs7qSyoHIMQ0qh6wKEsgwCh9ZnLQj
 c+tVq4QtIPSfqo7sFugOy3iHbawoyTh1uWP2Cuef6jTFLtdUvYnZQwNJ8xAT/P4gV7sN
 8hqu9NWMZxEAfe3J9FD50LGVtyzg3BTCT4Iwa8ihIgftEKS5zo6WTR77qauKwWgX/FQ8
 ju6NjtJ6RVuECsocfBx9Gm32ATDbar8G9iHja3sLwA2k1eh64IDsEhDJiNcukEKGK2hx
 seNpnC8skbHrnbPjbcg+qUUoDimhK4AtG/XOR1VR2bdcxvtQJjL2jnTcgPFFdkB7AJg8
 lZIw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpdHMM+kusQOJJ8/qL7H7uveU38BVWaTgxbunroTK49cx33TxnuNr1BKRasegCuE/+DYHE6b2hnCK+s@nongnu.org
X-Gm-Message-State: AFuF++kA5f0lLAAv5ZV2PUXStRqTIDcNsTk6yPu5vKpDPdIKQrDFSwCR
 +hSFyIrKsn/Tb/QIzjnT8snAgYCvOGOkaEVorlX0oEepY40VerK5NjK8CZ+6iXKhYCczOhpS6Ga
 NfCIZbMrps9Vg4XJpQsBG56mMxG6bElHY5HOzHk+B+DwxMg9uh9BkPWay8Q==
X-Gm-Gg: AR+sD11r5LO0BPSaxyli8SyhYTDnVKjrlW8vYxOe0Vqj8ofGP0c6lqtB1o+T+xKDgGM
 ip8MrM8O7zdySqA4PvmIeVODeT0p6Qf9sGyHoX5/dAcmf1T2se2j4WHn4QjrcygD+LytYgjZWhF
 Y9DwT2SqsAp7CAHVHFCDezrJPYHEr2lVUH/VIekjTmKecH+sZTEOLYIV9LZfDXFEn/yADUxFV0s
 vv0DymOQCUwqCSomloPXSbQ25sFrph8eFc7qNuSi57nk582ESQyGeIpMcUfV2A0FF61XbAcu+sy
 IMVRLD1hsgbDL7YAKT/OhWKrFE2VBYTmq6R0vU+ADbPzXqs5/884ea6Dkq+87JwJr9o6dYiwbtC
 n9C6yc+psG2w0ZrNIvKmpT5qsHKjOQ79v1DIOmlgK29HG51Ez9g==
X-Received: by 2002:a05:6102:244d:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-778ed3945cfmr5546564137.0.1787551535313; 
 Sun, 23 Aug 2026 23:05:35 -0700 (PDT)
X-Received: by 2002:a05:6102:244d:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-778ed3945cfmr5546545137.0.1787551534832; 
 Sun, 23 Aug 2026 23:05:34 -0700 (PDT)
Received: from [10.254.188.74] (241.170.88.92.rev.sfr.net. [92.88.170.241])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e012f84sm9765847a12.8.2026.08.23.23.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Aug 2026 23:05:34 -0700 (PDT)
Message-ID: <5259d5dd-04d5-4df3-a8f0-2970342648a1@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/riscv/atlantis: Document QEMU-only I2C device tree
 nodes
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20260824055642.41098-1-joel@jms.id.au>
 <20260824055642.41098-5-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824055642.41098-5-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1MSBTYWx0ZWRfX00vUn7LKkjE0
 o/Fsq5SCpbJdu4BM0s37OaSdB603S6V0BwzZSjs1CKa56jCMwfGome4+CES1tBFYAP680th7nPW
 SCdP8BbgupVlxk6K8Yws9wxBind87ZT4Neh1K15mp7wur/mVQxc2dLq/Xg54CoJx3sTlqspsNBk
 r1NnRhQXRE3/d9+gSbXSOcDf0XiXFDjO+HJW2otfAx25q1KugTYFGVkSOxGDgn/PUl5JVjkif0/
 7gyqOD39nEXG9f4S1O6goQc7nM11vqYJiJAVOzXNIiAVmPFYbgxRqp8DNGoi60TBgr9Gc/LSuMd
 pTlmDlDImAZ4LIm+Td5CAjJ2Y+8jGz7/3/vsXK1QnX87mxa6xtsvfAJIHWluHgzKVsi2OlMXf5U
 gMu7ShbzdaTjUtggF7Z2UNZ2zlAqkERtd3n5xiwxgiFOYNkLolEzTKRI97DTQ90m09mAn3L2lDA
 CXN74T7bn42E9tSMVlA==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a8bdf2f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+Tg70iCNDwYGP/1Xem9bLg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YWV-e9l3BiEZpfse0y0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1MSBTYWx0ZWRfX1monkV0ki8Ge
 Ili8FlrKjjsE6L6HECtAMv44ZKanlqs9GxgPcXqvcGyebdiBfNjZFtprfBUJu3MuqTprjSzNuTP
 Oimr+H9sDmkOXYU0hJYbDe5QY2i+tEE=
X-Proofpoint-GUID: 9BCWhZ_j4aDigQYGBF6tWJwwdxHpadOL
X-Proofpoint-ORIG-GUID: 9BCWhZ_j4aDigQYGBF6tWJwwdxHpadOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240051
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

On 24/8/26 07:56, Joel Stanley wrote:
> The QEMU only I2C devices have a comment next to them, do the same for
> the corresponding device tree entries.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/riscv/tt_atlantis.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

