Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F00C606A334
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EHwQvOOU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gExAvPKm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOBLj-0002I2-5m; Tue, 03 Nov 2026 05:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOBLh-0002Hr-7e
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 05:02:37 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xOBLf-000578-EO
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 05:02:36 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A382Hmg470762
 for <qemu-riscv@nongnu.org>; Tue, 3 Nov 2026 10:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FeDlYqU/0euXAohph9leyBuGCXi+5TWVpnxx1k0mlm0=; b=EHwQvOOU6wM5ITA+
 Gks3/QxyvbIhdu/5dIlTXpGkuG4bKvuG1Gz4Hi1Xv8eySXXFDqI3rh/EX1lppXJX
 LYr5Pljscz/RMrioZ0YTsPPOe5t1VCVc0/DBPIn70mAq4imjNatktfoSNN5qxdV4
 BTa26OcDYpb3rEHhBMPNXD+SLFc3PGzBGIkFPyPHR98M1CoU+Lk6jMLCfaPLrpZD
 KDhcfxKzJKuCYugBsv7u+XoHAcwRoOHbnvhSTkvqUxP+tOu6CRxG9JLk7lBg3ZL6
 e/iNxIAPlWArCIgPLObzdXba2PEe31MDQ4cX+cqcuPNg0MOK0zedckoirMQgzXRe
 tKdY1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081u5hw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 10:02:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9440b27c1feso685391885a.2
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 02:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793700151; x=1794304951; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FeDlYqU/0euXAohph9leyBuGCXi+5TWVpnxx1k0mlm0=;
 b=gExAvPKmRFjxXIeQpns/PkXgJR241C6s53dRhl6YpbI9v4CijWW7y7TTjr/8WcyFjZ
 r5hQQM9CpyxgzMxgcDgHJmiC+Y7JqQQ0od3mKHQz2+co2XLMNZ02eWHXYeCUBzReJ3BJ
 leCy9rBzkjVxaS9VYTbX+nTzarbVeLmT+0S8Y31ruUNtRhkiU4VboFk5qSFscZ/SqeB6
 dQIR7FZNK6ZjarvoTX3oMoHuLB/vvJOH/NKHTvnsOWwbz8Z7hpTihzaarZUqbim4ol2q
 7pmlAixNQudUfKTa6n9z9CQzSjD1aELObAZPp35zTo6kFie1M4FBf0krJSXfk+4WLp+f
 3ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793700151; x=1794304951;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FeDlYqU/0euXAohph9leyBuGCXi+5TWVpnxx1k0mlm0=;
 b=CHW4B10+MvfrMTQBmsl0WckXYksVs6+nmw/wW9lKe7raaude5OyXYrLK8qw1DN5a7G
 rhZysOlPg4/5rtmAfdfYIOcMFHw9/X3vkEfw6MwszvPXrRjj7TH/BvVXu8qjuI66mY8p
 FOGyvbZ+Mu84QsLjcv7zG0oMlvk/0NlqJnrZH2eSV0UOSLJrWMZKDG3tv9BsgzuFVuNo
 nAM5GSKkG9OwIzHMQ0xbPTQ/Y9VTdfoWhYAzU16rWZjvmtvZLdNlGNl9kUMBTajwlqF0
 MwZbxS01uaBdocBaAML0EIbmqtANdZum4noLhJpeEaKugrbeOdj9cY3TO/fxMgs1cvVL
 Zgtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxvzgftvgTGxb28nbRi4Ztg5LRoApS1pE9lf9TX3S4SLmcso0MG72Ro6XWm16CufKnUoPBRpEE0DpB3@nongnu.org
X-Gm-Message-State: APuU4Z+lnatqCizk9LqG/bfpLhqU8L1vZzvlt/xRgKLN3ShGRSu8tGc4
 1nzQSLFWtyNAGnG4EyKBmK09C+mZeIKprL+Mt9Qvo1dsXN5lQHYrmyvShUFADwIB/9qhYhMR7wz
 1efxCeKF4V6t6R9iKIAceCUBVrRXz5RO0DLw/muW0pDmnVK52Jl8OkgdJRw==
X-Gm-Gg: AYBFou1RdWNYTeBg3BGMhNmFonM3l9QzKAhKo/nQ+CaHcOc/8e0j8FYyyYrfpj1MnrA
 c/f6PQPuaFN/F/H7Zju8OXjpZtQSw5T8F9RLXNsETOGM4w8Jg7YnvA4NtG7m5H9JdNFfqqmMYwG
 6ICe5GbaRopvaF9n//zREkvCNYr8OSrzFkgiB/xaOXK4XdKPcvsYR6JeyAGqwQmRHgzA0o1DqUJ
 i0zWnxnb+py6Jy4by8xEZJu2fTqv4E0lK+/vShzxsL7gfck7ivIX2j1xqkoX5eLsqJVtMlG2bKl
 QDTVSD7uO4hTMxNW4NWSAJFeThk6yOUL+bfIquP1tptWKdWdXlsKjjJLvgBcUESGqhGZurYLK+3
 GD6Rkp4dJmvXt/bPZdBemJVJ9H22xZ34MZWnDJvT9kvQrqmciunPV0Fjwi3Rs0R2ZS0YvxiO0ah
 Ydkl48MRgY
X-Received: by 2002:a05:6214:493:b0:912:517b:7bcd with SMTP id
 6a1803df08f44-91ca4b71b6amr201098496d6.44.1793700150676; 
 Tue, 03 Nov 2026 02:02:30 -0800 (PST)
X-Received: by 2002:a05:6214:493:b0:912:517b:7bcd with SMTP id
 6a1803df08f44-91ca4b71b6amr201097856d6.44.1793700149967; 
 Tue, 03 Nov 2026 02:02:29 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.253])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca7f401f5sm113758616d6.19.2026.11.03.02.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 02:02:29 -0800 (PST)
Message-ID: <bb98a0dd-d550-48fa-a713-2688ef06f3b9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 07:02:26 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/aplic: Fix msicfgaddrH in split mode
To: BillXiang <xiangwencheng@lanxincomputing.com>, palmer@dabbelt.com
Cc: alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 anup@brainfault.org, qemu-riscv@nongnu.org
References: <20261102112256.848400-1-xiangwencheng@lanxincomputing.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261102112256.848400-1-xiangwencheng@lanxincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXyUF8X1Fe1aND
 R8rr/Z5fX5Tou8KaOkFS+0h0m13yffzDRPtIT3UnBv4bWvk0N6BlgVjsL8bog2dUjVQRg5AT+uF
 aZvcKWZTgnYv3dBnkhMuanGOV+8hMVU=
X-Proofpoint-ORIG-GUID: D_d_5IxZh8dt2wb1VpLkCEIv1UFaR36O
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9b137 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=LQvE5zGBNe+6ot3hfEwogQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=4BKX8IsyAAAA:8 a=FHMMiq_iyK9JmBs_6AEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bflBWynC2lygM3eL1Mvi:22
X-Proofpoint-GUID: D_d_5IxZh8dt2wb1VpLkCEIv1UFaR36O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX5RmycUBejT6s
 PUmWcUvWXT7/fW+5rfq7SlFA06mO0VwZandzW++WYUF1p9skE3wbvkmyn2tR/dZjKuMD3lh7z+N
 uOX+OILSFU4cC+X9tvELh2SUql/0ABRWqcZZl4b2PlU+jp94Zv2hDNDVg8WuCslLlWimF+JZ+Tt
 PaOK9pRhSzm6LEZwnmIPydg2E6Ibg5hEQhtrrzNiUdSLum5wq1qKosCIEGfSTTOmzt5KKebubTE
 +IwhE9h+4hLOSzff/kpNO5boIi2a8a6N5k2tKIB133IEjIAGlkwvz42vxrtJCM9btw/1WE/HUH5
 fzFZKbujr0ROuB656OgmuLt2AkBaYfjDlR1g+w4RezNZINt73/tDiXSmj6RiJrQSdSapB+qhFya
 lSeYX710ikGSELj+JvTOn4xFQ1YBe3z3DRPpUA3L4XmENnZ/1Vrpg1DSu0/150uO1cuYJqil80i
 P8bsZwSCuSRgl0dabYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/2026 8:22 AM, BillXiang wrote:
> Add hart_bits and guest_bits to msicfgaddrH in KVM irqchip
> split mode.
> Also remove the redundant left shift when loading
> kvm_msicfgaddrH in riscv_aplic_msi_send().

I suggest doing two patches:  one for the hart_bits and guest_bits change and
another one for the left shift.   Unless the left shift became redundant because
of the hart_bits_and guest_bits made - then it's ok to keep it in a single patch.

> 
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
>   hw/intc/riscv_aplic.c         | 13 +++++++++----
>   hw/riscv/aia.c                |  6 +++++-
>   include/hw/intc/riscv_aplic.h |  3 ++-
>   3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 03a0852b8b..2b618e73df 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -182,7 +182,8 @@ bool riscv_use_emulated_aplic(bool msimode)
>       return kvm_kernel_irqchip_split();
>   }
>   
> -void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
> +void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr,
> +                                    uint32_t hart_bits, uint32_t guest_bits)
>   {
>       if (!kvm_enabled()) {
>           return;
> @@ -191,8 +192,12 @@ void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr)
>       if (riscv_use_emulated_aplic(aplic->msimode)) {
>           addr >>= APLIC_xMSICFGADDR_PPN_SHIFT;
>           aplic->kvm_msicfgaddr = extract64(addr, 0, 32);
> -        aplic->kvm_msicfgaddrH = extract64(addr, 32, 32) &
> -                                 APLIC_MMSICFGADDRH_VALID_MASK;
> +        aplic->kvm_msicfgaddrH =
> +            ((hart_bits & APLIC_xMSICFGADDRH_LHXW_MASK) <<
> +             APLIC_xMSICFGADDRH_LHXW_SHIFT) |
> +            ((guest_bits & APLIC_xMSICFGADDRH_LHXS_MASK) <<
> +             APLIC_xMSICFGADDRH_LHXS_SHIFT) |
> +            (extract64(addr, 32, 32) & APLIC_xMSICFGADDRH_BAPPN_MASK);

Please add temporary variables like:

uint64_t hart_bits_shift = ((hart_bits & APLIC_xMSICFGADDRH_LHXW_MASK) << APLIC_xMSICFGADDRH_LHXW_SHIFT)
uint64_t guest_bits_shift = (guest_bits & APLIC_xMSICFGADDRH_LHXS_MASK) << APLIC_xMSICFGADDRH_LHXS_SHIFT)

And then use the temp variables for the kvm_msicfgaddrH calculation.

Also, please explain the rationale used.  Can be in code comment format or in the
commit msg.


>       }
>   }
>   
> @@ -404,7 +409,7 @@ static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
>   
>       if (aplic->kvm_splitmode) {
>           msicfgaddr = aplic->kvm_msicfgaddr;
> -        msicfgaddrH = ((uint64_t)aplic->kvm_msicfgaddrH << 32);
> +        msicfgaddrH = aplic->kvm_msicfgaddrH;

Same thing here.  I'm assuming that this is now irrelevant due to the hart_bits and
guest_bits change, but instead of assuming it's better if you just explain why is
this the case.


Thanks,
Daniel

>       } else {
>           msicfgaddr = aplic_m->mmsicfgaddr;
>           msicfgaddrH = aplic_m->mmsicfgaddrH;
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index 56fc064533..bd608bd7a6 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -38,6 +38,7 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
>   {
>       int i;
>       hwaddr addr = 0;
> +    uint32_t hart_bits, guest_bits;
>       DeviceState *aplic_s_dev = NULL;
>       DeviceState *aplic_m_dev = NULL;
>   
> @@ -93,7 +94,10 @@ DeviceState *riscv_create_aia(MemoryRegion *container,
>                                    msimode, false, aplic_m_dev);
>   
>       if (kvm_enabled() && msimode) {
> -        riscv_aplic_set_kvm_msicfgaddr(RISCV_APLIC(aplic_s_dev), addr);
> +        hart_bits = imsic_num_bits(hart_count);
> +        guest_bits = imsic_num_bits(aia_guests + 1);
> +        riscv_aplic_set_kvm_msicfgaddr(RISCV_APLIC(aplic_s_dev), addr,
> +                                    hart_bits, guest_bits);
>       }
>   
>       return kvm_enabled() ? aplic_s_dev : aplic_m_dev;
> diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
> index 62d2b33ade..d3ee2e537a 100644
> --- a/include/hw/intc/riscv_aplic.h
> +++ b/include/hw/intc/riscv_aplic.h
> @@ -78,7 +78,8 @@ struct RISCVAPLICState {
>   void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);
>   bool riscv_is_kvm_aia_aplic_imsic(bool msimode);
>   bool riscv_use_emulated_aplic(bool msimode);
> -void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr);
> +void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr,
> +                                    uint32_t hart_bits, uint32_t guest_bits);
>   
>   DeviceState *riscv_aplic_create(MemoryRegion *container,
>       hwaddr addr, hwaddr size, uint32_t hartid_base, uint32_t num_harts,


