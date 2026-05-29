Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F38CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 13:40:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSxQm-0006v7-3x; Fri, 29 May 2026 09:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSxQj-0006uX-0T
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 09:39:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSxQh-0004OX-92
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 09:39:16 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TDKpID1202095
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 13:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eqLKTMoRsKLQgoSRd5utjONT413qeJGEMK1P59WVr6c=; b=MxJsuI/kvso9dTZo
 c1L9/JQvoesZ090SnsYzN1Scb68wt80edV1HNVp84HL1MuqkywbZhmywrQ3bHFfY
 kHL/jYqgbrlLls1Fru7ZOjKPBWTEqlPaVtVJB71DqD1PS+oOhFiL5jwKLfcTW1de
 b9HAK9rgvuOFQg7Y8xOadnex8l/TTDIa0CFEMFgAOwpM4YYqWUiijQATF/DI/+C8
 oqgJPEtDZnCsnPLHm022JLKGEquIWSm4gHya5VuiA4HCSwNlwP+Ywnt/YBsmkFzs
 WYgiyFVAktHXgJiRqS6YGz7G4s/vjOSyzpsL9T4Y9BQv9BiDuTZRSNOjnerKWqxq
 SbM0vA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te24yn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 13:39:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-90cbd806004so2831813685a.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780061950; x=1780666750; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eqLKTMoRsKLQgoSRd5utjONT413qeJGEMK1P59WVr6c=;
 b=VKRUi1SZGSFaDTiA2U077VyOiLNAhah14EoO8Iyb0PgjoHLVQR3zGCWpwuACC3X7OU
 KAzUhHGXCcupWbFxxdIsvYuV7ybTAWqg1E3upZfrn+cLwCAykTOetS3EvjoTa6T5wYC3
 a8Ed40xxwBVfnSivbYxsSTlelhRs5eGxKHq8IyjAsJHFVAkVuh3L9lJcK2MP8yOyqsH1
 ML+h0t1dVxWeCS5OuGj/gtgb87Jy7K4ceQn5iRWeUrnh+P/FifD2cdcvLLz0VHXXIdT0
 t0SFH8ImPw2CQBSznUPTDqs9oghoMFt03iXt9SH/HRgRG2PjRKeHqnVEcSL00TGD984d
 5EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780061950; x=1780666750;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqLKTMoRsKLQgoSRd5utjONT413qeJGEMK1P59WVr6c=;
 b=AEvy36E2WumTKzGwQjSj0nYt/3pjcAfAKQzyxrnSMmjdHrT7DlIHLLAgRCNHBcF5op
 QlBhuAf93/OmQ9UYxGbn0zM2ygjqMb2BfqTL8y7T9CAMOWJMQGb53aEmaHXncIjWlyQE
 YH2aNB2SXqpfyZ56zYTFtnwjpGbMXjnEAzSVCbO/ZKv+U10WCFYZnL0zcnNkd00xvP0Q
 NXDqj44REH6mfVopDSoJQ+gbhAQgBmkIcP8OUNItcOmvHXdyO3TTBIlxHDAGRZ1P7baL
 hX8xI+zR5yhFPLaOtWcyqWTxskdyYm6iQXBMr+qpg8fBNirG/lK16/S8g6ao+DPdZDQY
 ZwKw==
X-Gm-Message-State: AOJu0Yz5u8Li4nbumhfPfgJeIu3hBexovxpT0YEdqypiODlDtqjLjmR2
 Awogs1k1IN7kFEtZpCOMjt3HyZR//oXis9oYLLoGPEqVsDKr000/usZ8uT7uIkn1scgL8mgfgKr
 3id/0mf3+2PPE9CL5o44Dw1eFkm76x4jHhelSPRp9h03UeiqH9E8w3ggyDA==
X-Gm-Gg: Acq92OF/Q6GsX3lOsvXuTy/y53F7W5YEqeanvIVadoAo8ipsyVCGYYEB8Yw+7tpqIII
 Zy8WQt3JoGEHpBo2/cKcsdeWcXLraGTvbg/jIQ7p7uLAlZtQZd+qRd+MfuKR0ufugXyUmwZrG6d
 fFPAZVZHM0sAxRA9ZK5lADaH4D2pEyr0eX0LE0F6ZxHlDPk+ZN72NDrgNUWqnMen5h7+m5CZp1u
 cHlv4p9ErctdS3EJhgHXP193XOXkXYSJCLeuIC8Z5++rr9ufXC4M/KYqiOjFhjHk28LNyM0XaMm
 w2PalZvyratP2efpfP99xSGCHpaE87a/V3IWx/VqUCDJpJc10JvZMWtV6fx9XkTz8Jtfr2Tift2
 /LnW0cFPMjqer+S7SGkpvjNw/+AECjfm90uG65tkFgdf7QBje5rSKwmS9enCy91kb7JeJ
X-Received: by 2002:a05:620a:40d2:b0:912:1206:ddd1 with SMTP id
 af79cd13be357-9152fd1e304mr370048485a.1.1780061949849; 
 Fri, 29 May 2026 06:39:09 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:912:1206:ddd1 with SMTP id
 af79cd13be357-9152fd1e304mr370042885a.1.1780061949258; 
 Fri, 29 May 2026 06:39:09 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9153244e114sm203883385a.5.2026.05.29.06.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 06:39:08 -0700 (PDT)
Message-ID: <599f551b-0ca4-465d-8c78-d7612f3191a5@oss.qualcomm.com>
Date: Fri, 29 May 2026 10:39:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/numa.c: Supplement cpu topology arguments
To: liu.xuemei1@zte.com.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260529181848378wiq8pXCmbwAZR5_-wZFJd@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529181848378wiq8pXCmbwAZR5_-wZFJd@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HNaWwe47-jAJSGM5lyMG55gCnhVNXJi4
X-Proofpoint-GUID: HNaWwe47-jAJSGM5lyMG55gCnhVNXJi4
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a1996fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=2M_qXnMZ40JJAAL4XIsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzNiBTYWx0ZWRfX8O5Y306ALQl0
 Uzc5tv/RfDsaYJEoX52uGdPUGJuxpvgWD9cfRTHr4sKoDcmY6mroQbT/HC81rN39x8zx/+D6bLW
 h49VUGtTj7tFodQikSIv+HRRRxR/N8AVEW2hNiwzIxfJDlyzbD1M8A88MXRm3EFXnc+Td+ojNh7
 1iCczWxrvyhI54aAvf2XAbzBUBkzmrDzpBbF1yB/DmmK4bhAMd95aKDmOGmkSfdovq1ggbBD2qO
 UYTtYbAqSntv5SSiFOncl6I1zbMLplNbhEUbHIxmsv4OfmH6MJkVrekUlKmZy3Mnc+k9E4QJAe8
 gGwsbfjcUwHLKaMbV1ug1fMxFxag/PM1M4mIf+YJIEo/V0WuMNTL4+LPS0n/ge87//h9NkKKYbT
 RSTR3JF1Zzl6EO6cB5oswsJgMK4BueQiSVNASEu/qLQi1ZwMAMRExtJhS9gBuJihxszR27PICk3
 CgCd2SFy8NfUvZo2WPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290136
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 5/29/2026 7:18 AM, liu.xuemei1@zte.com.cn wrote:
> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
> 
> Supplement RISC-V cpu topology arguments, including support socket
> cluster and threads per core.
> 
> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
> ---

Seems like we can't set clusters/cores/threads as 0 from the command line:

u$ ./build/qemu-system-riscv64 -M virt -smp cores=0
qemu-system-riscv64: Invalid CPU topology: CPU topology parameters must be greater than zero

And any missing SMP values from the cmd line is filled with '1' during
machine_parse_smp_config().  So we're not generating div by zero with
this patch.


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



>   hw/riscv/numa.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 24a803f7fa..8a144925c1 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -239,8 +239,18 @@ const CPUArchIdList *riscv_numa_possible_cpu_arch_ids(MachineState *ms)
>       for (n = 0; n < ms->possible_cpus->len; n++) {
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>           ms->possible_cpus->cpus[n].arch_id = n;
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =
> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
>           ms->possible_cpus->cpus[n].props.has_core_id = true;
> -        ms->possible_cpus->cpus[n].props.core_id = n;
> +        ms->possible_cpus->cpus[n].props.core_id =
> +            (n / ms->smp.threads) % ms->smp.cores;
> +        ms->possible_cpus->cpus[n].props.has_thread_id = true;
> +        ms->possible_cpus->cpus[n].props.thread_id =
> +            n % ms->smp.threads;
>       }
> 
>       return ms->possible_cpus;


