Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF149CD5BD5
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:19:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgG3-0003xL-TW; Thu, 28 May 2026 15:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgG2-0003x3-8F
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:19:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgG0-0007Ac-HD
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:19:05 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SH4rP33545331
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bjEkQGsCG9gpGFXL3SPDj9iItUVt/ndart1LZy5mmVo=; b=AYNXHDSruH3Dxul0
 5D1H9+suI1VLTg6Z9W4X6a7R9ohCdMM32954fIL0lgYxrnl1kIuxtPmFmxx2VZg0
 4lFNupnBrhKiUx3pwDDEqUzEG/wsue4ikDO1hTeDbYVN5ZWMIr89u5NYY4kTgfmW
 mwJFQlGD1ZVbLosIs/pGtrn1X5yDJ70mPOTrtHWBJycg6acprbGhPeDmLkw+Rfve
 vOiWrmkTwj5XkGtRre09IBSDy2tOFQkGKwHUfOc68sbzaOvsp8CaFgs8uRp8WSSD
 ombMkZa2GvhjHtiOs3GE+99Vw+D5ns5PLgCml6tvf5Ks1ZLGXRdsBFOj9GBD/3ca
 uFHozA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3ve8d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:19:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304d8e9563eso2717884eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779995940; x=1780600740; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bjEkQGsCG9gpGFXL3SPDj9iItUVt/ndart1LZy5mmVo=;
 b=Az6AksLY/WuXYgnUg54R4GWues5MnXNDVGNHWTe+qGSLbhUa2tsJiTGob5zBMN/c8b
 5N6uAUnx1/UAfK7+IMiMMkL0YpKGZ3NqrPZafQNQoL4I7aevO0QZTiugQA53fXhIKTAD
 wERhgkBXRI7fbXWwrT89w+Fn7xLIoXTCsljNTawUVpnmYUmQTzeij/9XX8XNkAxMCRQf
 Cm0Phc2yMQJgSlmxnRLZUuLQk9cC89t00p16TWdN+B9oziYIcctQ+IeRt0U3t+0ERth+
 XJ0tvJy00Q7DcflDZ1NfyJtXf90STwcrj+Nb8iyWCEnQfGtWyAuApbqBVgut21/3QASA
 x9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779995940; x=1780600740;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bjEkQGsCG9gpGFXL3SPDj9iItUVt/ndart1LZy5mmVo=;
 b=IocsjY47r8YDZ454rReilsFD2HcXTxbHhnGpzcrIAO4URgqIvUK1Uu9h/EySGx3GXS
 3TjYJ7gNVChsBQWSw4dRzyS0TrSy5COlXLdq2Hjv8p8rKK8Spd4Kk8bav7zzZkmqPWkB
 Ba2MicOrWjm1RQSPc60Tgb+5SKNkoG6BCLWcbXeuIbSuvlJY7DWW6P+EmIU5HWlqROef
 vGCKiTvmrRZKUh9xlvLhLhaiE69HDqLyzCDLNI9QRhluobnkw/eXZ+xdqTcGU/KwV9QG
 A/sa5DbMS57hpzmrMEkaMVKQs41y9xvCkBnUUxOApm9atkv00ha7lgIMKZ4u8U1MUAz0
 tvfA==
X-Gm-Message-State: AOJu0YzTEpKbD3q6RHyySn7MNpgvytqaZS61J/nDGt0zSFdGD9MPJRK7
 LeYYQAEdTGzqMXZyj9kjDJzr5rZ0SAcx/BfJMHGptVBhdR4TqSxoPdQz5kDTtB4CDidQmOPn7CM
 82Eoj5zqkPeywOFpOfxLHupfIZ0Pd/fRM13GkK0KnS4WuWNYE+gQAWjeFZA==
X-Gm-Gg: Acq92OEW1UqJpomML1CBmlGW/wtpK0SKv2B5L2yMm1Y8bqd4ZWhRArspFMea2F1LSb5
 ApanEBqLA6DcRncGHcgQvlTBRw8/jrH/3MqtVxd6x7PtVun9rK5YCQa/SL3VilXJFYv23j6Lt7C
 qTEVnZKmWYTxEywcn3bgVTPEmRzc/yqCmGqUIY4G1yFaBZtRVNG/2b2szFP+poUfXZCZz5As530
 LiSZWMkUbAkVQPzuRVQtl7jV+G5n3pcFIZC35et4Jug9PILMCxuCsHwSRmu6iRgwsBS1+ayZWG6
 8zyTSPORw0SvZLqv9UZhaFlVRsWB9mJhIc+pCveKc16QJvZbMbSXYchvesSQoz9Lhq0t2ineNpT
 SY6ko54AGvQX6Tp4QefkA8hfEpSoGdAI56coOLUVosjrQOCwX7zX2eyuHbjoxeHdENGO41DJJjj
 rTDdwt5oAygPeN5AlHsGybg16b
X-Received: by 2002:a05:7300:dc95:b0:304:cd60:b6a6 with SMTP id
 5a478bee46e88-304e9256e5emr140024eec.30.1779995940334; 
 Thu, 28 May 2026 12:19:00 -0700 (PDT)
X-Received: by 2002:a05:7300:dc95:b0:304:cd60:b6a6 with SMTP id
 5a478bee46e88-304e9256e5emr140002eec.30.1779995939775; 
 Thu, 28 May 2026 12:18:59 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e99788fcsm85390eec.27.2026.05.28.12.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:18:59 -0700 (PDT)
Message-ID: <09c45039-110e-4fe5-b799-f4c33d545c3e@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:18:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/12] target/riscv: Implement runtime data endianness
 via MSTATUS bits
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
 <20260527201348.29511-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: J7XFguwg7nIb6hhYozPK2rvOBYoGiDQF
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a189526 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ALku5c8DAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pyPUQofOz3_KeMbN-CAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=Skunnq644UPbuD6fT1yj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: J7XFguwg7nIb6hhYozPK2rvOBYoGiDQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5NCBTYWx0ZWRfX77v6i8Hd2RuJ
 fByB9XQticAVW+AmuFGHWfAHaxbEFeqOR6N7wO84cuFawkHMXAfOxcwuer3DuTh0kxhs4IVJJIB
 nbjKSIZWfnJyKI1WtFqwyPKcDsQzQs9cGB54f1U1yDtB0I0MsHrkG/x2xID5aCxoTJn6M5CumVZ
 7sDAye/qfpR8/+rPsx0h7QCoFsn/nAmugS+8dRqOB+t9f/ZCDac6lWoUSy0l5LDSrjRgxIi4qSh
 tHpR0NLDhDPUGlUtIlOtp05MOECWAFEpCQdJqckb0MGrtck4ylWtlT2VeWbhk1EBIo/ywacGxnG
 kMPxPOO79FNd3ShXol9WKup0bp+H8KZGLxxwVM1p0Sb2+4lQezz7ihSSetqBm0N1wOxNmwlK35N
 Kun/7Xhh5J0WnH0oc7e4QgcCQGhAzF16D+UXE15xiWOBn1WER2p9AJw9Vmew90qpTFaxHFqjC0X
 7hIDgD3Y7U2j53vKeug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280194
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
> 
> Make data accesses honour the MSTATUS MBE/SBE/UBE endianness bits
> instead of being hardcoded to little-endian. Update mo_endian_env()
> to pick the bit corresponding to the current privilege level (MBE
> for M, SBE for S, UBE for U). Remove the now unused mo_endian()
> helper.
> 
> Note, TB_FLAGS has no free bits, so the data endianness is carried
> in the extended RISC-V TB flags stored in cs_base. It uses
> EXT_TB_FLAGS.BIG_ENDIAN at bit 33, leaving bit 32 for
> EXT_TB_FLAGS.ALTFMT. This keys TBs correctly on the current data
> endianness.
> 
> Instruction fetches remain MO_LE unconditionally; RISC-V instructions
> are always little-endian per the ISA specification. Update the
> disassembler comment to clarify that BFD_ENDIAN_LITTLE is correct.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Co-developed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/cpu.h         |  1 +
>  target/riscv/internals.h   | 29 +++++++++++++++++++++--------
>  target/riscv/cpu.c         |  7 ++-----
>  target/riscv/tcg/tcg-cpu.c |  2 ++
>  target/riscv/translate.c   | 15 ++-------------
>  5 files changed, 28 insertions(+), 26 deletions(-)
> 

Patch 1 makes more sense with this one, but order is not too important.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

