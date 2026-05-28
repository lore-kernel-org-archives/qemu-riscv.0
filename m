Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B80CCD6E4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:29:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgPi-00077m-JK; Thu, 28 May 2026 15:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgPf-000770-LR
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:29:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgPc-0002By-2B
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:29:02 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SGwLIB2753754
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bX3xaCQ1FcUI4a+8824QvDWXP9oemzHM0B1otFR6mEY=; b=aJOTsEOZG1htB5Df
 vBhVzhZznN60nvyJp+CWzSZctYpYUoHK7kfh66cqml6yQee4nkLBMK6Ulv+nqnB8
 uw0/NNSoNjF0k/rSlZcSJ356eynyr0G+cXlCf1SQ4F9jrEUSOIXfLv9c7mfpkWsb
 shyyYvYaLzRXrMWQB56j/FzW1ZNy36yhpnbgtTWkTPFYVRZm+LkxqjgYX60qFOiK
 XFeEd8z0t+fDsjy9jtIZiGxCuhxsDyR0KU88MvLzg8lKAkTF+QGwqNEz4/xEzIXm
 IApjmd8nrlB5dcC8/Nc+VOn5zwb3aKea7JkRV9UmFiBr+f5jbLXct6sHMFAw5/92
 HaNjrw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn0nvr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:28:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-304b8d0ee63so3360506eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779996537; x=1780601337; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bX3xaCQ1FcUI4a+8824QvDWXP9oemzHM0B1otFR6mEY=;
 b=Aj2JU/OdYgUfXxOGlMxw4gllIXx2paxF2Jrld5xlW3onOsNT3UjTthiRIy1cWRG9Rh
 G+IDUYFSgpgNjR2wYDIlTYw/Y8zS7p4Fza7Rv4Sxbj9vONP+1kr0hFW5ZdNlZ+NlTDm/
 OxfcC+O8SGJLH3bWfoEz5cpAGznWPVGA8jM8EXExphQBgKOPw2hq7rlp93JYaLND43nm
 6bNPw+UtKotGH5H8H3zb2ULswj4A5SJIC3QPVHvNHLfmb22uxwTGNc1jKphTRBA8lCMw
 odm1zeo2p6tgfPnWN9eODS+ODeCwsWuY7zW7JFaM2tXxXgFtNhetSeBXN5DZlLID0Iv0
 3oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779996537; x=1780601337;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bX3xaCQ1FcUI4a+8824QvDWXP9oemzHM0B1otFR6mEY=;
 b=BBe5BxIBvUsNfuQsF9glxT23wslonGDvIR03KVn7I6RZjR8TeIZlH2EZfZ3PSoYDrJ
 nbFBEmGuj8W/gFV2lzM9DvfpHxzaDVFQaQV1KXJOLA9RQ1DEU58dLf6Fjt9SycVzicBV
 KNBp7C1uYy4FweshH8mI14NE28K3oLrUyV7r8kVxRRktqj8y5LByDRkYJbJWeD9Ugw0m
 l2yiQViDt5pvTg5v10o5fkyKiDh9IlgPGRXdAIhTFu4DrkIW3Uosl6Sr23gTdi7ONW9i
 pxf4xnyFAUjPEGGjeAvw16BP9EKBfRmVcIHpnD7L0rk27AJEth7njJZNThTHEuLWyzPK
 +pdA==
X-Gm-Message-State: AOJu0YxDZigHFODLWTA0DksEb1Us834abA71p3yIvW6bDHP+3eDaVXdl
 RDFDbs/dGKZwqA4k/wbeMZIBN2NpnjUgAhgrAjBlw5LkkP216+Q2/52uQzjBwqXG4mqMmD0rhfT
 LrX34FLBpHpSbefLDzmPcLhP60fK5pfqWhEHt9b5tkiozh8r8diNmqV8+Tg==
X-Gm-Gg: Acq92OEs8J3beuftp9z1mIshI+E5TuUH4HIoyHnpgiCTvHlSL06dK4NfxXV758jPZ0z
 +eNzGsIdTM6FEMknMvswI9hhd7wk+ga1gowhZoV+WqIKDnltx8/Xsuvral7VdaKqxBpSWwufSO2
 DEEjYGUvBerN3S4iMtJ3/++gGoJte+SWVqrx9lC4wA8pCVDo2aA7/s0zODcfVpqbQxTMAkkL+Kj
 4gAdNlvE81hQjqmc7/MBHWGQfLMOIWYFIg/t3IuISjoh8w8CmIwEyCoL56Q8/nR6w66uwilurWf
 kXWfXWb8GwXjka34b3S3N+KthsG55O+F6GwNxhwfepcOgrF62GKyEaGUuzHfzd0KeNqD5Ryaf2m
 KM1QbYqoLDPOu7ARLoQv9gJwmLBoHo3CTVB6vplUddFNDtEOJ6VLrsHWjYAL0CU4Mzou0QhSk3q
 mQVPWiFLkhHatQ/V/xx5U0vrvc
X-Received: by 2002:a05:693c:3618:b0:2f2:6dde:df54 with SMTP id
 5a478bee46e88-304e924c0c1mr148287eec.33.1779996536716; 
 Thu, 28 May 2026 12:28:56 -0700 (PDT)
X-Received: by 2002:a05:693c:3618:b0:2f2:6dde:df54 with SMTP id
 5a478bee46e88-304e924c0c1mr148266eec.33.1779996536136; 
 Thu, 28 May 2026 12:28:56 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e99a52d6sm92956eec.30.2026.05.28.12.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:28:55 -0700 (PDT)
Message-ID: <69d04d9d-419a-460e-9a0c-9fc8a9155387@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:28:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/12] target/riscv: Fix page table walk endianness
 for big-endian harts
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
 <20260527201348.29511-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zxmf5IuB8cFpeoOPZm1ihGG0pZip0w5y
X-Proofpoint-ORIG-GUID: Zxmf5IuB8cFpeoOPZm1ihGG0pZip0w5y
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a189779 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ALku5c8DAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pyPUQofOz3_KeMbN-CAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=Skunnq644UPbuD6fT1yj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5NiBTYWx0ZWRfX7SvNZInib2X1
 rjBjHkKZvgxYs+wt6uQaDyGWjf36QT9eoiDvO1exdC1sJ+uAP3+C0bbuxhqO25OHXAWauhrLmwX
 EziRiHiyqGwjQWLuF5786yX1uQ+CpmJ9PZ6gYUPzTHzXCjMlr1s7X2rkirfJvsrajKXOYucLBZK
 1ZP2TGXrhYOEfEtoPGcJOO4/kKpLvxvnpl/Ok7ow+qSA9K3WDcsGtdHcWsLD/nH2SrYvPgEPu3f
 u8rwcFmdqC3I9eBir5pQcAOf3oyYPpnLx+R2Sx8OO86Lwd9teY5uQJwYDNhunGAf4fqXvhUntvk
 mrxVdgMMDKT0aSJJSi/8hksrbUBuUUkfnm2TFUBi0YYc3JSvnesJTR5TYlUkQkyXs8Ct+9yuDvH
 dNsl2nZbAYRZFIhgAVQs73vfFvXzo/UQLAeD0G9FJZKx7sltViPO43qBUhoBUNExFZGqL07vGy7
 sybGQyHbloY4qH/ZQSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280196
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
> The page table walker reads PTEs using address_space_ldl/ldq which use
> compile-time native endianness (always LE for RISC-V). However, when a
> big-endian kernel writes PTEs via normal store instructions, they are
> stored in big-endian byte order. The walker then misinterprets the PTE
> values, causing page faults and a hang when the kernel enables the MMU.
> 
> The RISC-V privileged specification states that implicit data memory
> accesses to supervisor-level memory management data structures follow
> the hart's endianness setting (MSTATUS SBE/MBE bits).
> 
> Fix both PTE reads and atomic A/D bit updates to use the explicit _le
> or _be memory access variants based on the hart's runtime endianness.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/cpu_helper.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

