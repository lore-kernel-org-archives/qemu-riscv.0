Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A78606A334
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 18:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgROA807;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ULtB2VA3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJaqi-00079M-C0; Wed, 21 Oct 2026 14:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJaqQ-0006vT-US
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:15:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJaqP-0008LR-BS
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:15:22 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LHpUCB996564
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cS1BtsvyyYqE4NW9AJlViTsvQpuH2ej3S8uzgU2953U=; b=kgROA807YcSjGqBe
 etZM9vEDz6bCN2v4qJsVVXlDVUD67tKaWOIg82JMrQqWM2YNRKRdBudwe1Jt9oVU
 3QhGsUiQmQ8s+U/0yXuIUslpEEKRwgaeLtpidPgFmn8Zk7coEO66Gs8741hXfKND
 YjHSnTXNgzQfWn1K4QeX8f1PnffWhhx2t9viS6egJQZpXVhk8eTzsG/fu/iAYGM0
 S1xb7+qKdIfgsudCgd+8wWG/bLbtmHlA0Iz3scEMKPKhqghZoMNVP90k8tHcgIzF
 nIvwyNMJT6gV4YMXsO3yOuH2gH2wdbWO16hg4SotNnWDIiT5overkwdhoKlVlI6X
 tciFuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vsa2y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:15:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-9179a556c43so21831386d6.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 11:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792606518; x=1793211318; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cS1BtsvyyYqE4NW9AJlViTsvQpuH2ej3S8uzgU2953U=;
 b=ULtB2VA3Evz+fBPOkIFTxb2WvuUgRG8Q53sEpxjlQen1IY5+7bkQxaFLfjiRcl0u+e
 ob8BsDHQvHZGILyDR5qhLRJpPEoSaNuvSsOTvtYowOeT7s0Ge9rgVrGfnVqzxvtENfat
 TpFzA208E6URl5YpZhpMyR8x944hynNTyewIumB4PxAHnwNvje5EiMEGsIZUvi1JK6nV
 1I/ds4nrn0luQTphKNsWx97/rbGzS3YTY7AwkWKosRbEEpGgG1fyMNNtXuUBswqTrCYM
 K6vdZcWpro71OBeDD7eIcLLk0RfTP35W10U9bt9wV9LhoaLjhYpywS4kAIp1eDpxShyf
 mmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792606518; x=1793211318;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cS1BtsvyyYqE4NW9AJlViTsvQpuH2ej3S8uzgU2953U=;
 b=rTNemO3iC2BylGfdgKiusrlY440EpvTHJR7Z5Qlcm7VHtNmGha0GLdZYfxBJDUo6HQ
 U6eZBQ8QNUiCJI3Oytm/HmWC2jvzDWAMW69GhtiHbs24xA6D0RvWgYOyiKhJak15pqEM
 mhmNwYc6lCxGz4MSquZzBfYInFKYDgTg80r8vHG9ZF8XokM3volBraBOi2GmqwOewObw
 mkWR9NS9oTLokt5SspIemU6wXsVhg31OYV4jB9+PdLC7THYzAkwaEkMOTDVbSirtSqym
 0os69iiT2zOLlmqYHr0jc4+RoaDt9yElZQ42i7opQsCJT/rKpLoRpZkeIW/v8AUDqEuZ
 Vq6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcPGDDEqi66kCgrZSXa29HzaXU3M71wyVG00GGahryOUC75A+kHPeblR/mUP99l2UzaMZIbRmPDciY@nongnu.org
X-Gm-Message-State: AFq9FYIz90ur4nu3n8F0prIi5SjmiB4oQGoIhndQwyJkWKPOXRcHPFWI
 XIGY4olo9MX8Wh9vu39n6xMJbNvHmnUh1nJYptUEiuujUiw0skZO7udakcN6jZu4gxsle3sT3DP
 rM8wc8BVDogjvvpQyhAoPRRlDgWzjVfh/HAV8aa0TDtxvpYLS2PW5vl0BJQ==
X-Gm-Gg: AYBFou2l9V5YshCKAakLfXy4hrNCDwZGTDG7ayUNPlvH3cUsz4GZ/l4RUBSWBWGrdGX
 y8gJOfh5nlnxp9EnbIerdu3OBsa+eV7L/oiWA/1qcrjJLlKo4bHNKhuRpqkYglBPWDCMonsRFTG
 HY/L5PuuaGqHXLRL9nE3MScCsSAMR+Pvio6LcaH+wy6SpNmAC6CWmGpb5ZmuFQl95dqnpVV/5uu
 DvRTXhyuNWfamXqakSX6ANzIGNVEUdKZxr18IayVX6/us9xWUb3xvxcgwjOLK8xS1hIFoHOHMVi
 4zBC8SWcJe62/vhpom/hj8ZdjTewmLF/I7clb/B3i9B87acfcbG9ML/DjCukoGaOsxL8ASRij74
 UAD9fiyg3N+C2DD8jiEtCVBR1VlzsadpxNM7jJHLi5ae4DD+a5C4HvFXS2dPL1nvAaYNfhiyV
X-Received: by 2002:a05:6214:240d:b0:91b:88fe:a426 with SMTP id
 6a1803df08f44-91c12d0ee58mr50635616d6.0.1792606517428; 
 Wed, 21 Oct 2026 11:15:17 -0700 (PDT)
X-Received: by 2002:a05:6214:240d:b0:91b:88fe:a426 with SMTP id
 6a1803df08f44-91c12d0ee58mr50634576d6.0.1792606516695; 
 Wed, 21 Oct 2026 11:15:16 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c10c0f838sm30382806d6.32.2026.10.21.11.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 11:15:16 -0700 (PDT)
Message-ID: <0c32b74a-ed4b-4ab8-86d1-129f35d5862b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:15:12 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv/kvm: Detect SBI STA extension support
To: Wang Yechao <wang.yechao255@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20261017145211.219258-1-wang.yechao255@zte.com.cn>
 <20261017145211.219258-2-wang.yechao255@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017145211.219258-2-wang.yechao255@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ep1G9d-9sI6xElxDgfMdVjumuoXij9kt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfX7Yn0P0AB8/eq
 jY8iMpH8degHl8sD2VUEUo6eNCSe70tuUPqCb96Lahs+YnIsLuhNiElUWws8VaCDjUUIDGTTz9D
 8AXc+roSFnxhF86uinGtizBE6IPDpQs=
X-Proofpoint-GUID: Ep1G9d-9sI6xElxDgfMdVjumuoXij9kt
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad90136 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=wf5jhZewy8u8kOt9vRIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MiBTYWx0ZWRfX560//cd+8bxD
 E25bhGmEO1JCrtbKTGK8j9MIEtCPaj7sp0+QF7QZBIgqumMkuDZW66YAk103Jwa0kLXvYkQblql
 qcOOjAVd66Jl++A1iTYbhbXUleiS4Eg076wX5Q7kMq08HXwvN7jo3fHab8QK1HZZocrMZxykjbO
 avNMapnrir6fSNcsZoUNdxWPnnih+s74QvdiNIfWLvXHuh35nI5Zbd1JfNA+cbplfC1+4XIdXqI
 4YP3ZZQz6uMpuedkeEeWc3u2/2+4pti7fJpnU5n8HGCgQJYmNtc7niY3Urt8acb7FCRYKkrhHbK
 lBmHOcIapk+utp8CpgDdWrrUv6hdHOguRjwAhRT3sB6wLkWUarLVyvNdfqjCM7PgJF4TqFf7Bnx
 L6s33YSH9y+QYW/msDUub/nA8BPwJNfzSlLZVCCYq8KKLBZcsLdqAekhzWzdl6D5y6XBHYTxGb8
 e7ZA8NvqEvUhl8jFPGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210072
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/2026 11:51 AM, Wang Yechao wrote:
> Probe for the SBI STA extension by searching for a one-reg id built
> from KVM_REG_RISCV_SBI_EXT and KVM_RISCV_SBI_EXT_STA in the register
> list returned by KVM, following the existing SBI DBCN pattern, and
> record the result in kvm_sbi_sta.supported.
> 
> This patch only adds capability detection; nothing consumes
> kvm_sbi_sta.supported yet. The register synchronization that uses it
> is added by a subsequent patch.
> 
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/kvm/kvm-cpu.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c085b22b23..8ab43432dd 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -473,6 +473,12 @@ static KVMCPUConfig kvm_sbi_dbcn = {
>                     KVM_REG_RISCV_SBI_EXT | KVM_RISCV_SBI_EXT_DBCN
>   };
>   
> +static KVMCPUConfig kvm_sbi_sta = {
> +    .name = "sbi_sta",
> +    .kvm_reg_id = KVM_REG_RISCV | KVM_REG_SIZE_U64 |
> +                  KVM_REG_RISCV_SBI_EXT | KVM_RISCV_SBI_EXT_STA
> +};
> +
>   static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>   {
>       uint64_t id, reg;
> @@ -1233,6 +1239,19 @@ static void kvm_riscv_check_sbi_dbcn_support(RISCVCPU *cpu,
>       }
>   }
>   
> +static void kvm_riscv_check_sbi_sta_support(RISCVCPU *cpu,
> +                                            struct kvm_reg_list *reglist)
> +{
> +    struct kvm_reg_list *reg_search;
> +
> +    reg_search = bsearch(&kvm_sbi_sta.kvm_reg_id, reglist->reg, reglist->n,
> +                         sizeof(uint64_t), uint64_cmp);
> +
> +    if (reg_search) {
> +        kvm_sbi_sta.supported = true;
> +    }
> +}
> +
>   static void kvm_riscv_read_vlenb(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
>                                    struct kvm_reg_list *reglist)
>   {
> @@ -1365,6 +1384,7 @@ static void kvm_riscv_init_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>       }
>   
>       kvm_riscv_check_sbi_dbcn_support(cpu, reglist);
> +    kvm_riscv_check_sbi_sta_support(cpu, reglist);
>       kvm_riscv_read_csr_cfg(reglist);
>   }
>   


