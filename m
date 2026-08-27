Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F7C61DC6
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 12:31:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzZGC-0000SL-2G; Thu, 27 Aug 2026 08:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzZG2-0000Pc-UK
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:31:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzZFz-00058f-In
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:31:02 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RCC5LC3803112
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 12:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tFEIsXIw3W9XmSRRHhmv1IWXg4OGitbZJZ/ZgYqFU3M=; b=lGYGBvDk1GcaeZC1
 OeKnMMkjVP1awGnveG8iTjXRwWptZ6NbTNiGsL7mV0vvyZJPeD/+DY2qrHIVRSfa
 vHPkj421JOSH2L995DlBTSbkDTDxbrjhhK7K566YcBkrRG1GucicnslA/18yKwHL
 K4kdB6w7JpbF31J5lYBFykTnuDgjd288PfIeYdEt5tZ0PyumVmhLFDVDFdtHL8rA
 in5tXPHTrhzlYMtEZi1I0zxSZCnmWKoNDRV4iUlBTxFtDHV0yL+4qj+993pU0gqv
 YeqixqAsdS2jxP0+fCWfG3rdW9iIjeRW/HOavf6dx1wvT8+78dAR1FotpMsl5XD7
 zAQXlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak560fmu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 12:30:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93909014c85so49711585a.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787833857; x=1788438657; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tFEIsXIw3W9XmSRRHhmv1IWXg4OGitbZJZ/ZgYqFU3M=;
 b=gspf6acy4F7KyMGjItC+OPc7VFI3mxwpOMyqCtwha6AwJmH401/zyNxotxlwudSaEk
 B6ZR4CCb9NVcH7cElBXYAg3vfegWRVDO349A7O5j8HNY7ZwoyBQLpA+gY6BrW7cSHL18
 82EnvaQu0P5UG99VdMcpmqHAoCBsBQq6j37cy7KE630NxWveaglz9B8Eb09R3tthdNAz
 skOQqUeN+Sxww0k4x4XQrcLsYj/ZIcQfN4HddHt0YcCejsn0fSO5Io3c7Hm9yWURqOtz
 zfq+qZwRhOHBtic/lALeozVGc1a8pl7d8sa+mptDJLKeSBvrSh/Bue4I4AR/wLo381zw
 TIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787833857; x=1788438657;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tFEIsXIw3W9XmSRRHhmv1IWXg4OGitbZJZ/ZgYqFU3M=;
 b=rk0QZ411BEGMh+OBnXZo4vRFOplHoH1O4Q4135XVP6iDvm5ggj0aiOeHgs5zM2UhbR
 kj9jWv6d3XnLEPfzgps5Yyd0hQ7usc/+VnNm08ziekDZllzZebrc3navzofTE2tMF5Vg
 n/RJKABREONQEX53/nRhv0GFyP5lzVkd/xVwdIrB0yaYlAsc5qubNSPIRWP87LK7YL9M
 ZAeuJ/x1XgMdLknDFQhWjpHUm2cOPxiNNQvVIb64ke00ER0ThyFDbhYEjSc0xtwam+Qr
 ToOtMtcToRIUEtLuHzq3iCEM6KQINY+pxJZrvTNNpgwMEiPTG7DgugLuuDg5kv837xTI
 K/8Q==
X-Gm-Message-State: AFuF++nWGEHIbxy+O0Cb/mlyxawygC5Xxaah7A3Ci3t1FLkIq5yBkA29
 vpPOpsvMUkUQKtxou8KRTrRbd2lzkZ/uN0VcUAiVMqnsKnvyM1x0LGnIAO2xDlqGl3xGZjhJ335
 kz5ZaVZ6qipFQUWSjbusN+ImNa6FQpL7tOawgO+OnF3aw+Czpr7fLDqbulA==
X-Gm-Gg: AR+sD11k4k8pOn/KSYnG7REg0KYOid29D+khl89hfLZ4bPxcKcpIttNKOaQwg7XxYRh
 4yMKwBrdWn13/YH33RGDWApN90pxGrBmPLtXY7hrP+Kmxd6fXzXje4m1A7BIt/oYRzsFV84BPFq
 EPjBSJC/OC0mFFLvFytQCEf3MuxwpsAjaKDghYqJRzJJWBZNInV49AR7IDia+MfclxapZdRDbDN
 bYGqbZy/81q8Ko6qqFaxnDhfU+FaaydpkLrXXm5bfJZKPIKJfwnbfhxQ4sc5Cc3VdcmmhE1rKqW
 Lrh/5oc9z7fFUYdJ4LiuN7SLUk5mpSoJUeZqe8Atv01+cNAkcGpZ8+IRHy4zYAHlhLPff9BzfC6
 yndWDyocTZtIB8CDvscwVnCJtnKodiVU/0Luw
X-Received: by 2002:a05:620a:9364:b0:92e:7c7e:9c9a with SMTP id
 af79cd13be357-937803e0f3dmr1142257885a.31.1787833857197; 
 Thu, 27 Aug 2026 05:30:57 -0700 (PDT)
X-Received: by 2002:a05:620a:9364:b0:92e:7c7e:9c9a with SMTP id
 af79cd13be357-937803e0f3dmr1142243685a.31.1787833856420; 
 Thu, 27 Aug 2026 05:30:56 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9377e6a2711sm430935785a.44.2026.08.27.05.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 05:30:55 -0700 (PDT)
Message-ID: <39ac6e5a-eb8e-4811-9c3c-209b52edd800@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:30:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: remove obsolete smstateen check for JVT
To: Zongmin Zhou <min_halo@163.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <20260826123354.99474-1-min_halo@163.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826123354.99474-1-min_halo@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEwNCBTYWx0ZWRfX5cBbNazTBS1g
 sM7iD8K2huyJ1OcR30pgK81D9E1KfpWDZoCRmAcVe1OLwBHdMotQZQMSG+2cLJTEpc8XTYHRcsf
 RspNHbNi1HKg49E011gdzxn7KQNcwK4=
X-Proofpoint-ORIG-GUID: xRHzZ0jRlRUdn-PU4-G835dsRdcAd7Zh
X-Proofpoint-GUID: xRHzZ0jRlRUdn-PU4-G835dsRdcAd7Zh
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a902e02 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=-UPHL1V84XDOePb9YAgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEwNCBTYWx0ZWRfX/nodmm64WBvY
 2McOzsWZ43K2Tf7qI85lzus1z2ypeF/VgVJap/xaf1zuPSg6TY7FY/JllwDWqQ4nV6IqiGqsX6I
 FmomwexJUP7shy+XnwtUu+yeckvfGgBG8wNUPrpjNm/Vl2JcxmE1vUr0mBy6kgPrElhP0OXLuXa
 ujx1ds1OzpjkA/I28KeSuhT4tAJreDuMEYVztTP4Se1tc5LVV9FnVrzoLcEjx7qTZTKlKU6j551
 p7do1WafxxH55NuIjGGxmJUvqYyV3AQmRCxpkeHG65sg91yJAKsE0LSRrYNRjhHdkgfOL7HOKQ1
 x1XFNqNo+/aFAt4tEPMNX93/jpjUSDNtJN57X5pWboeF5CYKkuGWWYFHc0DjpsGidlLsF25/9S4
 MVl90hprOnAUdfH4BMxCD+viDCs8weYx/IbWEFD1CoC/XJ4yl/FdJXp2SId6B0nxhBesmAWCojr
 sN96Wy7GPXqaUzH1vdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270104
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 8/26/2026 9:33 AM, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> The RISC-V ISA manual used to (incorrectly) state that the JVT CSR and
> the cm.jalt/cm.jt instructions are controlled by mstateen0/hstateen0
> bit 2. That text was spurious and has been removed from the spec by
> riscv/riscv-isa-manual PR #2637 (merged 2026-02-05, closing issue
> #2620).
> 
> Drop the corresponding smstateen_acc_ok() checks from the Zcmt CSR
> predicate and the cm_jalt() helper, along with the now unused
> SMSTATEEN0_JVT definition, so that JVT accesses are no longer
> incorrectly trapped when stateen0 bit 2 is clear.
> 
> Reference: https://github.com/riscv/riscv-isa-manual/pull/2637
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu_bits.h       | 1 -
>   target/riscv/tcg/csr.c        | 7 -------
>   target/riscv/tcg/zce_helper.c | 7 -------
>   3 files changed, 15 deletions(-)
> 
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index c01050ce2b..11648abecf 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -354,7 +354,6 @@
>   #define SMSTATEEN_MAX_COUNT 4
>   #define SMSTATEEN0_CS       (1ULL << 0)
>   #define SMSTATEEN0_FCSR     (1ULL << 1)
> -#define SMSTATEEN0_JVT      (1ULL << 2)
>   #define SMSTATEEN0_CTR      (1ULL << 54)
>   #define SMSTATEEN0_P1P13    (1ULL << 56)
>   #define SMSTATEEN0_HSCONTXT (1ULL << 57)
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 78fdd14a08..967626be75 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -180,13 +180,6 @@ static RISCVException zcmt(CPURISCVState *env, int csrno)
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> -#if !defined(CONFIG_USER_ONLY)
> -    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
> -    if (ret != RISCV_EXCP_NONE) {
> -        return ret;
> -    }
> -#endif
> -
>       return RISCV_EXCP_NONE;
>   }
>   
> diff --git a/target/riscv/tcg/zce_helper.c b/target/riscv/tcg/zce_helper.c
> index c6ba4c1a47..2fa8945b2d 100644
> --- a/target/riscv/tcg/zce_helper.c
> +++ b/target/riscv/tcg/zce_helper.c
> @@ -28,13 +28,6 @@ target_ulong HELPER(cm_jalt)(CPURISCVState *env, uint32_t index)
>       MemOp endian = mo_endian_env(env);
>       MemOpIdx oi;
>   
> -#if !defined(CONFIG_USER_ONLY)
> -    RISCVException ret = smstateen_acc_ok(env, 0, SMSTATEEN0_JVT);
> -    if (ret != RISCV_EXCP_NONE) {
> -        riscv_raise_exception(env, ret, 0);
> -    }
> -#endif
> -
>       target_ulong target;
>       target_ulong val = env->jvt;
>       int xlen = riscv_cpu_xlen(env);


