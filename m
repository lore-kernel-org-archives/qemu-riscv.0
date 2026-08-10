Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3F8C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:37:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtFtf-00069N-U3; Sun, 09 Aug 2026 22:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFtb-00068r-4d
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:37:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFtZ-0002gq-ER
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:37:46 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L6mM03728518
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bAaU9A5Dob+pn+N5J3J972yFuLm2QmofQmJPQlMw98I=; b=i5JnKiEbO7rfVEIO
 oMCZJ07dmmh4ZVDLWSy2wFwmmlfLOTRmWrQ+fcVoYGOdRz+osf9QEeEM2Dcg+lDV
 1pTmYDKG0BWOOqKZXTUSlmHKc0lo+WfHCCkDtYZnEkhdho4/WfGCYYFTFkuWI42V
 36nojLbFqlCEz5Ih4x1k7snqPicIBRdWvJzUuPXXV4JuCuQWn3oBP68o1kqX9LQq
 7SD/WRSicMfsqGmGq509qoOrTYXROBpP3LZw70Km8yRaNUkJE+HbRNJd7D7sPYuM
 XMREAV4tAzvimAB2YudG5TDWhoDTKAoTBPI2VnjPQDFlpcwtkIwVrqsFDFDUFwKY
 R8YoZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush4492-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:37:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so125702785a.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786329460; x=1786934260; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bAaU9A5Dob+pn+N5J3J972yFuLm2QmofQmJPQlMw98I=;
 b=XUfTschePG/9bo4OndK69UOMgwH01eSgSWveYsUtxSbrvoDsSWHTxrisR57TKtgDJH
 mXw7G4paV1srz+PBuhCBfLkPSxy9ksQWRZOopBF8pEEAGNmyqNc8AZ/ok8tg+xIgPFQg
 Ut3tP2W3keb9PHIt537AOmtJ351ZHUIzwUaHgOUWMcyfpdehzbsPNiVQUvX0rc+r6KTA
 A77c9Gux66bhJll5ucCB+fd+l188O43hr7gIvyLLQQBhYJ5ZMd+ke1h7/HNFS+88Z1Kv
 hYZUJcb0RX/XajBCpAw8nvK+5WyVu5Ai2xUGgYUo3ppNwQo6wwnL37Ql9Bdj5CanNHsL
 Tjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786329460; x=1786934260;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bAaU9A5Dob+pn+N5J3J972yFuLm2QmofQmJPQlMw98I=;
 b=SUBO8Jay9jleJe2l646KrGszcnLEAZOd+XN9QIz5IT3VhV9kI8FSEWGVFvVsb/VLog
 PlMklJPeniw5WRoP4jLaNCeU9pxQq0pnBIobIXsUkKRRk2P1YZz2ozvpPgKLn1QDARDp
 OPRW+OzVuqyggmcZgEuTQmCKNLXI7D6K3s+b25sYIaWgljKvX0RSAZwpfgEUJwHaVIMG
 Sm34ZkagDLww1OikENFJF1G8EkCvflMU1yxTfEOK9NGrsDu7FcuZB40sQ3UgOmHtqpBI
 z4LyUqpQhTlMhyke2sZGb4vDRdzygosN90n8zNKnIV1WMlgVzej4Oqcy7An0OYFdQaJr
 IBzA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoAZqnNT+qiZ+/AXD2+UMJbBhzoW+izpb2zea8TSM4g0D9aMI0fs7yq2JsPliIuHMs4/T/Hn0/hJhQq@nongnu.org
X-Gm-Message-State: AOJu0Yx7Kj/dzJqecC3i2KRhalKnEKxvV/3UgJ2SdTZXR9CIXQ5cSeHs
 QrXDS0ApdR5lGbKVKSV8pQhDOlqQggTwcNeGe/fcaM9l+QROxxtaC/xSj5Lkcn8KH8PNfFDE2iL
 cdTu44/W8Jr4/ouhSocAMzSjXy6l87VQK3S+11RjFpowqKyHNiuXufhHQqQ==
X-Gm-Gg: AR+sD11mayHr9KOODX9uOSSTnyL347a+QNjg+yNU6ZjDQXM4WAD39JX/siRVyC2oKz9
 sn6CbMr1ldLCLaRM5nFYwmHUdW/HRELNQIbde0WAFX5YkQaNh31bUHrQHIw0F2VEXb0Ron6LBoi
 fP+0F5tteWTZ+khoIBkITDeXb8mzzxDQSJuOMDArzcENga4Dm7ZE5k0vmVqXa4IUeJU1eP1Mhpp
 JnP0nH00eH8n/fc9HUc3KEKcWoRVQpa89tlJMpAs+7B+I7HeWota6RmS+UduBpDjDPnNsMUvOpX
 hvoyYd+8Pnd49QPbpFoxIbUA8UE2HmVp9O50Nxw3UvVPfKdNlIiFQEGcN0ZyoAdGBKPc8bG3IXk
 ARsnQ3elWw3BYReVfgygH5e5Z8wdD5D7Ma5M=
X-Received: by 2002:a05:622a:5905:b0:517:7e26:36a9 with SMTP id
 d75a77b69052e-52ce62036d0mr472184041cf.39.1786329460270; 
 Sun, 09 Aug 2026 19:37:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5905:b0:517:7e26:36a9 with SMTP id
 d75a77b69052e-52ce62036d0mr472183871cf.39.1786329459871; 
 Sun, 09 Aug 2026 19:37:39 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4800220aa83sm25238954f8f.36.2026.08.09.19.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:37:39 -0700 (PDT)
Message-ID: <380deb38-062a-4208-b8e1-aca8b1e3b19e@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] target/sh4: Enable disassembly via capstone
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809013343.664966-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SYjPy-ev-juk8eyUjvSOouuv9a4wxzyu
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a793976 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5i7MnQJ1OzotH2LNuDwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SYjPy-ev-juk8eyUjvSOouuv9a4wxzyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfX6A4x1Pfc5HVz
 kL8VrRUpMas2NyMMuKGyaCjmzUQBnsPxQ/gcQA7y7lYPD3NcGncAr96XJbzILOl4vGPkSazYxHz
 M21YCVU1qbrofAhZlukSPXNGvqbPVvqzkkIWvjdsaj0YIvi59luDIY644FT18XVc5q1nROvM5zi
 zoR2qSbuX9o1lpCp2i8mUbAc3xx5aWZoQ6BgSiCsy+Tp29kuSOLDbDxdGuQqAT5YCivlbunZ94r
 gs3OlDZakcvomTcOGrxvXbd2iIgxweN44b6AOTwyp1cyJsz1YwVgnLwR+4vBvokGrHIdy2qTLcG
 zXeG4HAO4Oo4U+p8Unii8hiB7sbw7X5GWyi5b1dQwtFlp05RtZ1amdpLuhyXhPd2B2b3/lOk/aK
 oKVEGeTNlQ8WDyehEmThuu+I7s5XWSMJAHMXbrvpmtZMbcvqO3lgTiB2hKrus97kZ8auJAtnlec
 PxhlIe+UCMGr6zdnAYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfX8MSr7tv+bkIA
 yksVoUcJm7xxsFysp6ag3wvkakSTjnT4IsBbqumnSu9Q8u9jCtZyIdxyHWc97QKujU8VykX3ABM
 Pq0qy/5EHF5UxMjXOFPmUWeNNp1di5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100021
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

On 9/8/26 03:33, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/capstone.h |  7 +++++++
>   target/sh4/cpu.c         | 14 ++++++++++++++
>   2 files changed, 21 insertions(+)


> @@ -167,10 +168,23 @@ static void superh_cpu_reset_hold(Object *obj, ResetType type)
>   static void superh_cpu_disas_set_info(const CPUState *cpu,
>                                         disassemble_info *info)
>   {
> +    const CPUSH4State *env = cpu_env((CPUState *)cpu);
> +
>       info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG
>                                        : BFD_ENDIAN_LITTLE;
>       info->mach = bfd_mach_sh4;
>       info->print_insn = print_insn_sh;
> +
> +    info->cap_arch = CS_ARCH_SH;
> +    info->cap_insn_unit = 2;
> +    info->cap_insn_split = 2;
> +    /*
> +     * Possible capstone bug: the isa levels are not additive:
> +     * least significant bit wins, so SH4 overrides SH4A.
> +     * Work around by settiing one or the other but not both.

"setting"

> +     */
> +    info->cap_mode = CS_MODE_SHFPU
> +        | (env->features & SH_FEATURE_SH4A ? CS_MODE_SH4A : CS_MODE_SH4);
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


