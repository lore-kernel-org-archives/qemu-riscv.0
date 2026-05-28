Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325FDCD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:12:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSg9d-00031I-9K; Thu, 28 May 2026 15:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSg9c-00030t-67
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:12:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSg9a-0004fX-1U
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:12:27 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SGc4Ba3545339
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KokyjKd6jxuUMQ1Fi97pxhPsMv0ZViojan4rG781nqU=; b=XW2yGRkAJi9aTc5V
 LcBGMXeV7Bv7feVJkTw+tU4ZT25+t8fYiwtf4odoD42WgvfJ0ZVR2fKJIkTnpxvU
 XTNdU8g7pJT4qiQ4RO2yLvW2oA3ZNaIDiR668+krLFsg6+xnG98JS61AjP8ec5F6
 nv7oo9iQEfWze1QHQv+vJkdcURdD0aE6gWCNwC7bYZmXolBlG0TKt4s6TdzmXRHr
 7aelK5khwYYPY/X7E7k0WqFhWikyelfAK0G3rOMk+doUBpB8ZNT2aO24SqYmTUfy
 72Dkc3P2GbstD3w4aIKBe+A/u2JxOD4GBp4X/MAN+saGLqHCfzyGvhaNXl8l5Hu8
 SoYCgw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3vdhn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:12:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2f3ec2e8d07so11016300eec.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779995543; x=1780600343; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KokyjKd6jxuUMQ1Fi97pxhPsMv0ZViojan4rG781nqU=;
 b=hZ6V7qSlB/pQA+sb1KH0v9Q5Nwv5Fedv1GgdoaYFO/PuMOu6O1r5FViVtowWwl8WXA
 7shVPBOZUCNqM+sIZKIhKQFxI5tg0dEmLtzWlTTp6Kk53oOx8ROXYcEoZSUDHVE7L9ju
 GqGlWzWoqXxix5yEo2eaRPWgxBM1ZgminyYbgaobNZJAr6VYo403CHyDxmGw0/k0NmLb
 NhzbMbxOMC2zfiRvn7hE271xKkj3wfSIzCxc27fdkwW7TOfl8AgZUGMqhGdPejTqRL3A
 mXRDLLKuL2uCvCqo1Tg+0/RtSM5bSogFHEhQxBw7SsxidHmJjEswiBEUDKnjIdzSqI1p
 Bt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779995543; x=1780600343;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KokyjKd6jxuUMQ1Fi97pxhPsMv0ZViojan4rG781nqU=;
 b=fhK9aGLR19l/7Woz3Ruiv88ugUQ3Ub1YUInh5gV2w4ZZm9fKu8hRKUTzp70k+13b6u
 X1sdXD4R15zV37V1GJKm9UQ7fMjTx0mKTzalhvhAFvDNzsWnFswyxW5pj0Uhk5ArBsp1
 /3wLb3sPrhvb01gg77aRzpgnyJtFk+83aA2KuxVwp8vRK2EyxkHXJ8/3liV02QVyhe1G
 AFSTa5h8wVlUc5rGWwSZrY+WLqrvwFdEa42yIW8tBq25x+vn0OICy/FvNmbEvtinQVA3
 TthufajnIkjI4RnRw/b4CWokoOvp9xeQx42YQ4sIW1mx2DFCf9n6Rqo08G5bXuYjjMfs
 VH1Q==
X-Gm-Message-State: AOJu0Yz0WXTuT2OtFC8FB38ol8E3dLq1qeqgFdGH4QY5POp/8NNF9BfC
 Y5VhMIKu+fpeHxSwX8x/+0aeiXuQZlNDOd2rTO9mYFNexO59CSSO+uwZXVIZ/0SQ7mA8ZkXBWXw
 npZAAMA9WKOMeJU/jTfYf4mqFtdLbvOcIFACCq70siRoyQSk5v7uDro9bHg==
X-Gm-Gg: Acq92OFIxHxaj4a6Zszapixsf2Osz3IhagR0oVCvF+KEBQlPdWB9NmoJunSS7O+uRTB
 tUexo8Is8OvSHfm0vJydcRpSXilBzLLSFcCjrSOQrBWdcKO2wvWcBT0JIoQT9VCPg8WKH6BoE/W
 mpC5OE9QDuQOKdGv801YksyS4p5SJTrxKgj6fXMiBdeCioDjgmN9YPIIHhIzBYkISDnempF0u8G
 05chQJw06gHx8mJqCUQAac73KVkKuFGQSdz2fmlr3WyWN0iVm6fAyeyV01YRKvPP7Hbkanif89a
 RWZM7oHOuL3DtFHN+ZQ326mvVjVlzqN/yVUnRZxxS09OKaOciiii4edEhCfp3xFmq1fEdPhFbt2
 87Dgmy0gRPd1zZBqiGHRK6HXXtD1wg2i+RnJXL2yNUdsL1GL72+vMeq+mP4O7Qcl8nuKhFGmbzU
 RCxwJZ4NfxKaKkq8ag3xAMio6C
X-Received: by 2002:a05:7301:168d:b0:2e7:c701:aa85 with SMTP id
 5a478bee46e88-304e9137200mr134742eec.17.1779995542825; 
 Thu, 28 May 2026 12:12:22 -0700 (PDT)
X-Received: by 2002:a05:7301:168d:b0:2e7:c701:aa85 with SMTP id
 5a478bee46e88-304e9137200mr134715eec.17.1779995542318; 
 Thu, 28 May 2026 12:12:22 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e971361csm114094eec.9.2026.05.28.12.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:12:21 -0700 (PDT)
Message-ID: <9b1dc3cd-e749-47fb-866b-803d228897b7@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:12:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/12] target/riscv: Initialize
 DisasContext::mo_endian once
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: q3ufVkcA7vgNRDdApzK4gqaVvR-9J_T_
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a189397 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ALku5c8DAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7DLw7mqCjl1eLh2tDsAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=Skunnq644UPbuD6fT1yj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: q3ufVkcA7vgNRDdApzK4gqaVvR-9J_T_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MyBTYWx0ZWRfX+mEM10XWp4Tp
 XKRJnYCTra8AHFPkyN2JZH6BXoSaDOOrfwg8BQoWcch4Y3iPERuUqdC39yuE2w+Mn5+YwIszp5b
 ki+AvQPDLIGjIb9zSniPZtd9FDXJT3QbaBP0SC1ukUkPs98xqFhy5UnOC+NbFtwAkxHCI+jHTQ1
 41WqEK3zO6I5N5n5ZDmgbYoS5oFbIIbZKNIbxOgoTrPcfzf9JZetiMh714u3dquL0PH6pnJULP7
 QdtrzA5UkQhSER9S8JK/73Lncc/aN9WFwT3d4kDkos3wEuHyAundNoIur4dHK/u69Z/ULK3hU0+
 CZjplVFdP7y+fQp+tG8fuJaZSmn1llan4TNN96lJOhexfS0Q1XIRTCOanO2sDMfg5YKyGJ9GnYV
 6+uzezbBYy+6OorNqYv7rwOXqYhe7pR+mSDsDg8+o3x6bVPZfC8zUCW145sfj3D5XxRInACSFqy
 lD0vvghSP0wBYrso2+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280193
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> The data access endianness is constant during a translation
> block; rather than calling the mo_endian() method each time,
> initialize the DisasContext::mo_endianness field once in
> TranslatorOps::init_disas_context().
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/translate.c                      |  9 ++++++---
>  target/riscv/insn_trans/trans_rva.c.inc       |  4 ++--
>  target/riscv/insn_trans/trans_rvd.c.inc       |  4 ++--
>  target/riscv/insn_trans/trans_rvf.c.inc       |  4 ++--
>  target/riscv/insn_trans/trans_rvi.c.inc       |  8 ++++----
>  target/riscv/insn_trans/trans_rvzacas.c.inc   |  4 ++--
>  target/riscv/insn_trans/trans_rvzalasr.c.inc  |  4 ++--
>  target/riscv/insn_trans/trans_rvzce.c.inc     |  4 ++--
>  target/riscv/insn_trans/trans_rvzfh.c.inc     |  4 ++--
>  target/riscv/insn_trans/trans_rvzicfiss.c.inc |  4 ++--
>  target/riscv/insn_trans/trans_xmips.c.inc     |  8 ++++----
>  target/riscv/insn_trans/trans_xthead.c.inc    | 16 ++++++++--------
>  target/riscv/insn_trans/trans_zilsd.c.inc     |  4 ++--
>  13 files changed, 40 insertions(+), 37 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

