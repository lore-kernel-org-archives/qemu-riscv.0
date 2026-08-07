Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961F6C5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 17:05:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsNzy-0002Cf-Kg; Fri, 07 Aug 2026 13:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsNzw-0002C8-Le
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 13:04:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsNzu-00087B-Vd
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 13:04:44 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677GO9wt1190362
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 17:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /K49fWhUG5C7CDZ7wHyE2cppMAagHt5oCBaoFqVeF/g=; b=fWS2qMuCF/9SzME9
 34n/qOXTsbuKhBmdLm33T1DFhcq0ATFCvjUqGiq9Xo5BI8IqjncTsPJFvF38J2hh
 CdfZkBN2Yp5aOP1eRFWSZdeqPaiakVRs/WQB47v7b3fabzs1QLfH9eKx2x2dryrg
 VkBTr1XOcQj5xdCriJF1reuWLw+Yd8Ac7PCEtzfv0cr8kPuXYdhMJcFDv09rxaYS
 DwvliobEo76B/V3y0ILKa60fxDKk3ERB6gyLYrR4o7TpitboXCAJEvjfmtStgA+o
 x/z3DT7SMLN8RQ1rf3uuVHC5Z2EajFPrfjUEesWx5tuDzCDa3eFC/S26aO0YpVsP
 Mm9edw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcujht9f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 17:04:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-930edb4362dso287937385a.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786122279; x=1786727079; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/K49fWhUG5C7CDZ7wHyE2cppMAagHt5oCBaoFqVeF/g=;
 b=jdeUbl+4C/Logqzs4lppHNQqrmTw7wazeijBa/QX6sCeCRJa8EwamdtFrlxUW9X10w
 /IrYi3k4gJ0UsHi6CvMvosdx7FwS/YbI+mljPXoh9tUMAN0lvdhzh1mfd0xiiiNkVbj7
 D4biUsnm1BRYBbZqg9Dp3lyzPZJ0+RyWKhT53ZA3CcS7MPOXAlRiCIZEMeQqTzk+WOfI
 RAI3mXaMrazVG+aMHQLjDjD3zgaLf/5J6aCTE6JghiPeoZmzS1MxFg1DbfBgjznGx8Qn
 7lKV4If70u5171mlwCz73fzXq8uKuYkXCnzCgNTnO022debWQijyuZyOazG2VsNC56Ja
 Xdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786122279; x=1786727079;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/K49fWhUG5C7CDZ7wHyE2cppMAagHt5oCBaoFqVeF/g=;
 b=h7z75BpEJWMDsKVUl0I+qcLn60cSG0d+ImmhA5r0xsbqq+/v9mxxPcx3kPczEwwAu5
 vLz2wOijQpENaL4wG1hEQ7tdTXjEkLoiUC3EHlvVtn5UOAaStGtoJNsuGt9dj3K4B4mu
 H1igtxR6+4LgmzYmzJumbIGSJzzFyj2VzumphDvi+/ZK+CanUFhKR+q66MR55clg684a
 yL/hc1WwoZ/MKzgI/HVo8cNI1nps/FZ70zEH5fjyU9m6o7kWLGMJelF5vU/NIAAfRSdg
 i7XSyznNP+teiIcaXNbkqnzOdoPeZ9YiWDVtZo5aqrjP74TmH7HRHNMlBMhDZ+ONj0O/
 JL8Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrGlc8asy9KPGIDTeoKS3eX06jlCcfo7r9veeCVpi2tF+vD5nmuzwpKvrx7Imv+qzJBr+gM4uZ+s6VH@nongnu.org
X-Gm-Message-State: AOJu0YzpgF2R1tDC9bCvZ3xFewL/LI3yLJ+ke91oy/wxactSvG/PIh3r
 sfs1coGcH953NgGWDTi5W6qBaUQH4HEAvYT1YzB5s68iihoKLWILSyrZcNt1uW/NPbOPNBawsHs
 Kqs0kmKpJzM9b/xLZdkZ6Zpic1K4WIB7d2RogIOIuN9ip2Chhn/uwAOpxQw==
X-Gm-Gg: AR+sD13YPqMWIMQeVtG+pqCHRSmMa5ii7WH4wmCikI49chWJfHus/CBKbIHo3kSk810
 iFUDxpkjnzRHcIIRlF0sotL49uirU/2mptNS4Fxs34bOUcoNAV4oWyARP+l6tRVCXlA7fp2qKQ+
 9V9Wap1E5x63NfV5UYXA/ECy6j0kZTWx6N04FzSAPQldQk5JwOkOc/j4x7txud1J3Yx1q+rShy/
 WuDcJmj3yHLOM2sTNJqe5tEoSVES4siSa89RV+t/qPSxGuyRN8kpnXXkuuSqF10phjMvUpi6Os7
 Y4/DyDguYCNGgw9jJhTQQdFRBe3SAOaWt7h0jiQ/ZybwobJsVlTiTMKbTXRpazN4aKB4n8EI2Uu
 yiiwqd3wQfd/fPC24OE6CNwCD6jXuapIeCqfi
X-Received: by 2002:a05:620a:254f:b0:92e:e3eb:de54 with SMTP id
 af79cd13be357-93648ff04cbmr2543585685a.11.1786122278794; 
 Fri, 07 Aug 2026 10:04:38 -0700 (PDT)
X-Received: by 2002:a05:620a:254f:b0:92e:e3eb:de54 with SMTP id
 af79cd13be357-93648ff04cbmr2543572185a.11.1786122278168; 
 Fri, 07 Aug 2026 10:04:38 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9366e229848sm190889585a.24.2026.08.07.10.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 10:04:37 -0700 (PDT)
Message-ID: <6eb6dbac-17a6-4acb-b65f-58f7f9ec5344@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:04:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] target/riscv/kvm: Synchronize privilege mode
To: Xie Bo <xb@ultrarisc.com>, qemu-devel@nongnu.org
Cc: ajones@ventanamicro.com, qemu-riscv@nongnu.org, alistair23@gmail.com,
 pbonzini@redhat.com, anup@brainfault.org, alistair.francis@wdc.com,
 rkrcmar@ventanamicro.com, palmer@dabbelt.com
References: <20250915070811.3422578-1-xb@ultrarisc.com>
 <20260730051926.7322-1-xb@ultrarisc.com>
 <20260730051926.7322-2-xb@ultrarisc.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730051926.7322-2-xb@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEzMyBTYWx0ZWRfX5bBRv3kOIt1s
 C4DBy1JnQr9qLmIHFiJX04LKaZudrZ1JofPIUI4m087tQLEyVQeJhbdxQ7Eez5dAZbLRk6R7sfT
 39oOztoLxY0UwfTroz997UbYo7oer0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEzMyBTYWx0ZWRfX2aUD4G3hC/Lx
 +1WwaF2nt3e9HNHFloyq+TVYrOHzKhD7SGY0rG+XgVPNuoxhiP32b73elpPnmKzR/Rf39qRk2MU
 eheOcVlAuPLld86r0zpJ/yroc89dXiARTa6rr/AnuHkSSagXf8tPMQg4tyORbLSTfZ3LTnG3aqN
 KcllJR5sDpc2TCbN55y3mrb+Sy4FT+mFimWC8Ox/XHNzzTGfOrpIxNRo5sJHhG04eNSkzeV0OSM
 NQ/M+lBNeLqao2SJDQSAZUwbdbli+/QHXX+OIwLzZYzNSKqrm6WNdERqPHmbR9OFoRi4FQAg8Hk
 foZynLgHUne9w3fuj4A8vEF4kGKlgcRun+R61+cxOeoAaAxf5tmWlSCR+ufksVL6a5AlS+zF+VS
 7L0FTLXzFNtNPixLVNH12VQawMBHpqeSQX5TgY33i92cBB5iqQQaErjhnxfUAT9BdNqC8lhQz1l
 4ERaDGZHoYYXCHB8gqA==
X-Proofpoint-ORIG-GUID: SHhOcXR1IjGcz2wNp2T7l7TZbVVOsIet
X-Proofpoint-GUID: SHhOcXR1IjGcz2wNp2T7l7TZbVVOsIet
X-Authority-Analysis: v=2.4 cv=Wssb99fv c=1 sm=1 tr=0 ts=6a761028 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Lx1EvxgrAAAA:8 a=EUspDBNiAAAA:8 a=_1-xPEPxSuS7R4OLlL0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ZFi1QaP_tuf8dODdgmj-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070133
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 7/30/2026 2:19 AM, Xie Bo wrote:
> The KVM core register synchronization currently omits the vCPU privilege
> mode. As a result, env.priv can be stale when the migration stream is saved
> and the destination can restore the vCPU in the wrong mode.
> 
> Read and write the KVM core mode register together with the other core
> registers. The generic RISC-V CPU VMState already carries env.priv, so no
> migration format change is required.
> 
> Signed-off-by: Xie Bo <xb@ultrarisc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/kvm/kvm-cpu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 495cb42dc8..8218832fbe 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -603,6 +603,12 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
>       }
>       env->pc = reg;
>   
> +    ret = kvm_get_one_reg(cs, RISCV_CORE_REG(mode), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->priv = reg;
> +
>       for (i = 1; i < 32; i++) {
>           uint64_t id = KVM_RISCV_REG_ID_ULONG(KVM_REG_RISCV_CORE, i);
>           ret = kvm_get_one_reg(cs, id, &reg);
> @@ -628,6 +634,12 @@ static int kvm_riscv_put_regs_core(CPUState *cs)
>           return ret;
>       }
>   
> +    reg = env->priv;
> +    ret = kvm_set_one_reg(cs, RISCV_CORE_REG(mode), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       for (i = 1; i < 32; i++) {
>           uint64_t id = KVM_RISCV_REG_ID_ULONG(KVM_REG_RISCV_CORE, i);
>           reg = env->gpr[i];


