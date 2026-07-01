Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C071FC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 06:10:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weo9P-0004IF-9y; Wed, 01 Jul 2026 02:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weo9N-0004HT-Lv
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:10:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weo9M-0004Aa-0A
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:10:21 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lIiw138708
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 06:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iyeWxppY89wILBKU0wojRM+VOlRW78CF5V2yAd/n2Qo=; b=IQbrzYjVFLz7fDlg
 rxUGuuq3n1qUKtoQv6NMIMpfS6acpRKOqBjud27e9iSMGUZSEiYPgAdvvz8quqNQ
 FiPT6GQFcbZFWk7qv1mNqbR23SAQFIr3ER2Qi1IRMyf704gr67N4F/0cV2+U2OEv
 Sna5xxPoTkVwJde9ARYhSo2dpjUqICpb9m3jd4n/cILoTx28Cv1JHgDrgY1tj6Xo
 GfmVLMEhNo1DhH9YLtV8xtMM7X+OrAdrmr9/sbxO74qKt2AbWm1B0Jvm0iEsp9Li
 hp8cWTRwOvwOirWktweifvg8dB92nRl3/6mMVxnN8tlbkQ6rEcCZ8KMNY+kuy/MB
 HnLDmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw29ky-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 06:10:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92d1cae5939so39535985a.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782886217; x=1783491017; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iyeWxppY89wILBKU0wojRM+VOlRW78CF5V2yAd/n2Qo=;
 b=VffV81Yinu/C+26tVZ4s/ss1n3munC7MayuibTXRHzg1hK762ZsKpSc2yhA219mxDB
 ZeFeyVl3bLD4IHpmbx9C0pO0jvbtd2ruXfE1JpfI4md3/iKmpRx1mVPyKfL5nXtssH/3
 MafHIzv1xPhquEFjla0VGmFThogkyqM8J8d6ZMs8nPjjVWPpYlqpJUa5Tlkdxhe5m9LZ
 Zd1JHa+7DGWRwaeCuPiV3nfRKTbbgYOuga87/tM7G5/Zow8Ma9ZXrqhEIiGonGG6dkx6
 8Y/JaKLF0IvYtFZ7y01Ut0GZVjK94Ec0LvEBzMqTVfd+7r/TbW/v64mfVt8/2/YeiOpx
 bRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782886217; x=1783491017;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iyeWxppY89wILBKU0wojRM+VOlRW78CF5V2yAd/n2Qo=;
 b=X2vNsIZGrAufjTklUuUii7ebEAzGa/v7AWiUF+fjawPyPaQQ3Fv8v7iTJx3f15bIHL
 cTMjEb3Xn0+JhY6d5erIYRsuBsOyO6NQkF4ngm7PGtguWp+4021VRdeX68Ba6Uq7MN9V
 hGulYxOj7qERyGFqtLp5WZx2uVc5frf4cCy9C/R6Kllesdkc193/8ucu5df5Ouhqq8yq
 Obw63MsSi7iNyBQj7WC1URjJVetDlhcU+wfl7xR/7h9DMKCKAgn+wlIg5L3zDkNc1DLs
 k3h+UXDq7l6xjGBZJ4Z2mp5cuLVaRNElgZtldGhbRmqpvIs3PGwSdgCXXJLhjHhyA9yw
 1J2g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KmS2f0BJutZM7wUXP1eENcTGulVGSbj+0oBAQ3AAgRDc1AiEPsNQkDohLNqgI9CLYVsSke+5TsZYF@nongnu.org
X-Gm-Message-State: AOJu0YwQ48VHfOrPQhq1Fptz4xRgXEe+WgVzTP+86v2oUJQ/Oc/BVvSn
 DaoFsryIPsSOS2R/iRFu9DTNJQuySXaq1sZHyG52i+tQeWk4Ikuwa32k+ZjSdcS04YMZoyou8gS
 EqjG+gXvAvS4gMfCmWwKkaR+PQk/xw357kGC0qqu0ZZL/7PAD2/LJXVUjBA==
X-Gm-Gg: AfdE7cluuuHxNorPU/8l+o7rbn1ssaR8r7wEMjLwesI3JFkYc+k74mD6F/0EwcD2vmx
 7EHT8mtwQbItKXKv8Feby2wQxoEp8gkziZVIPX3zQhT08PSprvDurjwGpskR7rSmWWanTfGwZWg
 xQ9XeVPqbNgQbGTuaRAqOO+ka3ApYFJ20/UerMztfAGQp9ImY4W8SAdQ1k/Putqq+NO9qvq9n0w
 Coqm8NTXPGYFcfzFjFIPNMJrgb1J7DYyo02H5LmHgP6o9SCKZyoJWv3ffueihMYmh4zHE7ghjTf
 ZoUQ77DVna1vJn98NhA6Jl3U/IPhQE0TpEKSsPY0TSGjZxPK43Fe1mPyD1jfi9RXCA5shLLom1J
 bEKZ1nNxZ/P5sX4ZkMoc6jgGJOoLlYfpbeDSar+ny8bLSMKDPYMpBDayx//vz9w==
X-Received: by 2002:a05:620a:458d:b0:92e:2c3a:a15c with SMTP id
 af79cd13be357-92e78257463mr40606185a.29.1782886216671; 
 Tue, 30 Jun 2026 23:10:16 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:92e:2c3a:a15c with SMTP id
 af79cd13be357-92e78257463mr40603785a.29.1782886216278; 
 Tue, 30 Jun 2026 23:10:16 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4eee27sm47292835e9.12.2026.06.30.23.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:10:15 -0700 (PDT)
Message-ID: <a5d3aa14-4b74-4e0a-a514-a8dc23890813@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] exec/breakpoint: Introduce BP_CPU_ID_SHIFT
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44af49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=0tBilwq7XwRVTi-M2XMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kYYbX0V-E7eQc0YzlrovJhxFpeugPoI8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX2Hque2w1Vn3z
 wGE0RJwPE1I5Y19+xOKiQDwonkSPUVj2f/CYzXddBw92iUFkdbrrVA3sfrmcr64ATFj3flrUcEU
 OBF+vWFeMw7BydDSrjk4MyrhvzH6+yE=
X-Proofpoint-GUID: kYYbX0V-E7eQc0YzlrovJhxFpeugPoI8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MSBTYWx0ZWRfX8HvlwmdGJ7Lq
 KWCgs8USrmgSTjDRfQPjxwFLDAu1L5D1LcoGaXQK/l48rvUZGbqxpvzrXSX/6W0gx5FkaflrZs9
 qTQkpCEDNNkPa0JpVe1iFdOSfXBqKdDTTInC9W0tWHwOTJkd5pJhvKoAMy69UOUiZJfpkghJT1I
 obtT2DMepLJLEm2iTfD+QTH1JxmsQOT7/WEnF127w7PLmdgHgSjqxYwIUTE4w8EGVJm2N1Z8sYB
 /YTXOwgkrLZnDir4jZKKc+Hc2wWNfPpbIWUguEPCMVHYLaBVM2RtRIScKNktE2nEXfwShfxtCu0
 GFB9QZrRgUHvg8SfBVKCPv3e1G4d/oIWCg2qSWGfyhRysTeagKaDadz3wVY6CbSjjgvpRnKiyJs
 5DYiVNFr6Zb16Rof+lrYGKaiwVjSv5N3bdZRRSdMIl+yv2EWIdoDd+UjDjDHq3pWDo52Gp+i+Db
 CeH2LT2gUQDprc4awMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010061
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 1/7/26 05:04, Richard Henderson wrote:
> Allow the target to store an identifier with
> breakpoints and watchpoints.  Change "flags" to
> use uint32_t instead of "int".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h | 10 ++++++----
>   cpu-common.c              |  4 ++--
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
> index fc91343875..93876f3304 100644
> --- a/include/exec/breakpoint.h
> +++ b/include/exec/breakpoint.h
> @@ -25,10 +25,12 @@
>   #define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
>   #define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
>   #define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
> +/* Bits [31:16] are reserved as an identifier for BP_CPU. */
> +#define BP_CPU_ID_SHIFT       16
>   
>   struct CPUBreakpoint {
>       vaddr pc;
> -    int flags; /* BP_* */
> +    uint32_t flags; /* BP_* */
>       QTAILQ_ENTRY(CPUBreakpoint) entry;
>   };
>   
> @@ -37,13 +39,13 @@ struct CPUWatchpoint {
>       vaddr len;
>       vaddr hitaddr;
>       MemTxAttrs hitattrs;
> -    int flags; /* BP_* */
> +    uint32_t flags; /* BP_* */
>       QTAILQ_ENTRY(CPUWatchpoint) entry;
>   };

See 
https://lore.kernel.org/qemu-devel/20260630220100.1289-19-philmd@oss.qualcomm.com/ 
;)


