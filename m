Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A74C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:38:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzIVW-0004MA-To; Wed, 26 Aug 2026 14:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIVU-0004Il-2e
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:37:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIVR-0001OW-Ou
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:37:51 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QHJfHl1573899
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 18:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JCwYThXifyy6LfW29TURN+uYYGzGJkJKgx2XvULwgnY=; b=kfv/+SBhdXsHWsxh
 pw95aOiEaMmuT9ofByLsvf5yLpH0m3nLuxdh1e8lIzTnyIVjAVte+mNR572h/1g/
 7O5SsYfghCXh5pk+PkoK/m8zs6dYsN+41qOiUKF/tBcnWiq9qE0aW2vowhYDV/w1
 usy2msIlDUH7jFvAkqXZJiQ7qtFb6B/6HgG6JrdlUSgL9PUpgNuJBV5m8ANGQIbx
 KNX8Od1aXj9I2s5U9mp2TxXtSUguZ7OkWh3eBPyGiPAGzqzbPq2U0W1cmos4uVHZ
 5HEGmtdEeb0Aolm8YIUi6lUTPYJ4vaRY2lfPOkSeljJqgWVI8HItnANXygE7zSYw
 xZGNLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4ec8a9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 18:37:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5276aa86d00so14892041cf.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787769467; x=1788374267; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JCwYThXifyy6LfW29TURN+uYYGzGJkJKgx2XvULwgnY=;
 b=ZDAVexhYO83HR8GY4Tx5UG8Xs2UUrEMC3ZM2m8bbothZ+Coqp7VU4d2QGnmdWVkqyG
 vbaAwP1NQZay+GDmo3rZeOHLE+DfIvIP58SCcV7hQeIoZ2sGOid+4nJUAfY8sDD1xAQx
 sSBANvIbDsB6xQmXw949sbsN7MdBc+691wu4WmNZmgXB5SIZtG9MpcpNgItf1G6y8EUL
 +HhSYHsKSVV5DWHrKHIsHPoVNnRdUGeVATy+uRrzVyumF1Ci1Ci3e360aZGu6vU2u1YQ
 qGMC0OgGEdBwXl3VVVEl6PSqzHMwhkZc8IPIJT+Q5ioqEiqIDM4DrHfwQkBoDaiBc3BA
 unSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769467; x=1788374267;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JCwYThXifyy6LfW29TURN+uYYGzGJkJKgx2XvULwgnY=;
 b=r9mKFFfOZeJhFMGrA14tX87Gb3lmg7zFlU04C3jQtvYqGVMWT+6Nt18oKbsjf3JIg3
 BF2RJsTJW28kZZBkeNOfsQoMGHiIL0UCmhigPMhuuTSdKOEkcAjYGYRc/Z9fQY63nkGx
 E/U7CDzsiRDaa1knCGhvOlYbj8C1OYcxtTAa+zr3zTW5w6znraFq2DBTihwpqfr3OMuY
 v2N1ClZwdOkp+2tqB3hwgkMQa1H9n6ID8bcAufhAX9N4Zwmpjm+ihpaeivFWW84ZZx9B
 /Eve1aHTLV/7duRphW0cWMxw/FHSg+q085JptDviwwAAojWYC4GmaPAXJGpMQaYoVjEm
 vj2Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq4K9yXDowvJImB7HzB1StGtf11ybzdXNYsTXy6KD9WQg80KgVm0CPTCdL3okx7JmpFOhL07lQBMfnc@nongnu.org
X-Gm-Message-State: AFuF++mz29vhlnMcREXVTzJCTHpDqNlDdSNoMHDggTLIER6/XZ8qTFOP
 WI8VWTgvUjCiWdoiXTiqE2gtHU1V6Vm3NUIJrbKc7BhqyqIYnxuhOGhlzpycd21EL9yTarNik01
 Pj264dkYNvEsRR6T9RFgGYV+5W3RJhbyjdlD75L36dapCNcBy1t6bxiuFGA==
X-Gm-Gg: AR+sD10CFavqPNjaoQsb4n55U6mfzLq/lz2RivecTMaFXiHnjY2/1L+E7+1TAkwwEvU
 9ZdMgTWVVbQSZ7/i/1WJgDI4dwgNciItIdveRK8G9wma5N/JSeI/WkFMbfXEZ3tWOmnh8A65cIU
 HgMCFcoF07L1eBrdl1gKgt6EleP0qtKUh+031khWoxyQvQGZ10DII+PJNGa0KaomdfHGtjKAOa5
 oojyz0aNijIGLyW3kp9PcGpmD+XwFsrAGq2HOq72cc50AsWBE0nW5rVxy9FlpGs0HQjcRk+oM16
 rKvtuFjz+4RVCxUQR7MKbtckzFTiu6tKwOPjf1V1Twg2BIfM77oKbcX/Vx2X66o0gnO7vnZu6jc
 lbERF+Z63KEsjbMzGxIJHB22clCwB3Njwym+dzeqrKQUKoxPYvQ==
X-Received: by 2002:a05:622a:1111:b0:528:32b1:c202 with SMTP id
 d75a77b69052e-52e42235670mr90965011cf.7.1787769467022; 
 Wed, 26 Aug 2026 11:37:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1111:b0:528:32b1:c202 with SMTP id
 d75a77b69052e-52e42235670mr90964331cf.7.1787769466529; 
 Wed, 26 Aug 2026 11:37:46 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a6fd00csm662040566b.15.2026.08.26.11.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:37:45 -0700 (PDT)
Message-ID: <11ab11dc-aa98-467c-bd36-4dad90bc0069@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] target/riscv: seed cfg.big_endian from TargetInfo
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <20260823150731.896-9-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260823150731.896-9-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KIBqylFo c=1 sm=1 tr=0 ts=6a8f327c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=sk3sBhc6xHwubYSXd84A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WrOy7cWaAjrUrC8thD70AaKxPZ98vSIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1NiBTYWx0ZWRfX6orXAnQR2lW7
 dKRCxbRjk35oGJD976HlfyNRIENTtbf7F7l47Wn2+HOprmmPOhF62XrQ8BcvYi+N1lxc2ZFVqyZ
 TkLGt7fZM+cJkbOGLcsUBGKCsqjna+/dxRKS7sbcjR7a4CVVKg+1t+cHd52IQZ8rd+zMSiUU+5t
 v4Rg5j8mEpUpGLwF2Rl3VgvJBkV42buuIxF3NOKbldb5VszwZSBe+AB4i016OUjpDFcPDCIg8sE
 VSb9sMsRjkE85R8Bhk3kv5LETtoe34X4KdNmVWaNJohok512AdO3r/fVDpNwrJ01UKdnIRGNszd
 okWGiSD2nDND901Za/H1gcJgCt2zxzQCkZMhwLnMtw9zCkP/SF3S2DMVVL/KINdZhX2bi4MXh74
 nrcZXvDPsxQ8ZB/7g5JE/yJGLQUZtJqy7RJQYkotqpb4JB/CyqHfZrV1OpYBur4Togur5gJINzu
 V2sN+NEh/fzxY6arIyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1NiBTYWx0ZWRfX5ax5t/fEsoIT
 n5hQr3I0ODdkY2o5L3Uol9m++4JtCuF7s4SUEp6OVrtAO27xLKYqn9w5CCj1/zXnGBoPXuam0cv
 IeTr3ZKSc/SgqJ6FWBSuSyLKUqye+Xs=
X-Proofpoint-GUID: WrOy7cWaAjrUrC8thD70AaKxPZ98vSIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260156
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

On 23/8/26 17:07, Yonggang Luo wrote:
> GDB register packets use target_big_endian() only (gdb_get_reg16/32/64).
> RISC-V gdbstub already goes through those helpers, so future GDB
> big-endian support does not need a second endian source in the CPU
> gdbstub. It needs TargetInfo and the hart to agree.
> 
> Hart endian is cpu->cfg.big_endian, copied into mstatus MBE/SBE/UBE at
> reset. The CPU property still defaults to little-endian, so a
> big-endian TargetInfo would make GDB swap as BE while the hart stayed
> LE.
> 
> - Initialize cfg.big_endian from target_big_endian() in cpu init so a
>    big-endian TargetInfo also sets the hart.
> - Fail realize when -cpu big-endian= disagrees with that selection.
>    GDB cannot follow a per-CPU override, so a split would silently
>    corrupt register byte order.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5a82e6563bf..0681bec0bef 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -29,6 +29,7 @@
>   #include "qapi/error.h"
>   #include "qapi/visitor.h"
>   #include "qemu/error-report.h"
> +#include "qemu/target-info.h"
>   #include "qemu/timer.h"
>   #include "hw/core/qdev-properties.h"
>   #include "hw/core/qdev-prop-internal.h"
> @@ -1226,6 +1227,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>       Error *local_err = NULL;
>   
> +    if (cpu->cfg.big_endian != target_big_endian()) {
> +        error_setg(errp,
> +                   "CPU big-endian=%s does not match selected target endian",
> +                   cpu->cfg.big_endian ? "on" : "off");

Surely the bug is on the GDB path.
> +        return;
> +    }
> +
>       cpu_exec_realizefn(cs, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);

