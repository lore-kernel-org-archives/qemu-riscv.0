Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7329C982E6
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 13:51:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8eQe-0000gi-Gx; Mon, 21 Sep 2026 09:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8eQT-0000fY-E7
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 09:51:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8eQP-0004aA-7X
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 09:51:20 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LDowPN1351663
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 13:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xGZCkUtaYFcoJk2o1TLez+CKrQoIlL0zIGYY8o070WY=; b=Uw6FAu8b7mqbL0PF
 OO9+0bUho5oF34f4cj3DzVxLLrSoOnoeHKQPOvbVAIFVN4doMpQggE39W61pxFyk
 P55/g0jqgknc3kX0NG+5KO2UV7n6GwjQUhOhAznUpNafcbcnEpzch9ZDP+VFqXHC
 jCudnXPdSUlptWOgEcRDnN3RqFrn9cv2wUClpNNSIJFE0o58OB2QqAI6Ze9D7sH2
 cYLrADyockkc836ixQYDJQCq7O/pcK5yGx99m/5IQLqw4hWs8+cl2FP2la+W5igr
 SPImNZSFOkw3xCUoYIAcB0760IrvPXS3bMFsoQIhlt7Yd4oExNH6EMJ9EIXwUBED
 u+XwJA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bawt9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 13:51:15 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5c846dd12ccso967040e0c.2
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 06:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789998675; x=1790603475; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xGZCkUtaYFcoJk2o1TLez+CKrQoIlL0zIGYY8o070WY=;
 b=Oo3Ydc7qmRQs9UapRBvotGAWarWIYhvt9pK569d7MXmF7fWZck87SANMWRYqJR862Q
 K2/DA+eyhRN1n+eFi28BweHp5BZX1p95AxZ9hE0PrWjVmSeG4Pl+Iu7jGiXlTM5HfzKs
 e2La6nkHtsZTIxAIv3zDxAIVpw7Ul0vcCHLYf6Fk2Z4cugeHtHQXCiSD1Q1UhB6DwsuC
 f91vpy8RP/X19fPcsrI2BeWk2OCgX7pH3fPrL2oogya5dHIOB+irMICAVORPNwgIRD5Z
 vJtc1CJrwaMyj4TXR6v3DALW5i9e/Jf47OMbDvb3mDLSWN5ak1CAg4qhabbVaSrdSLnq
 U3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789998675; x=1790603475;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xGZCkUtaYFcoJk2o1TLez+CKrQoIlL0zIGYY8o070WY=;
 b=11ErOSflRuQIbuv67gHskOZfBDwX8EYAnNMW57v1AxUVkjumHJAFEBupPLpLcyeyHC
 bu+2g94gnWn/ZuOo9+syyDEiBnCVArQkmhiTQPek1pKSWgRi2xugHtcqPuDbFUA/W5pW
 CSO4BLcQkXpRMzrT863cHReFqjnKMYINjbKVCeWcZIhSf4DdZrNYVpeuSv0KXUbn0lAJ
 OVgMbg4r2XKP77Nzbcos6SQhxbPGLOie71OzArmnK8jM5EHOqbo5815yWMbxKMHr8MHj
 yiYvQXpv+6cojPHIKB1UOCPMRNIgoMOOvIdPG7YDx8xcNCC6y0+kuqhaKu4KXpLBrNOj
 fBCA==
X-Gm-Message-State: AFuF++kFX1tJkSElStGPpcUenp+aVQ0uUbUBvoFa8qW6UNcmTRELP4WJ
 1h48wrNC5dNhhMEX9SHEayqdjSr4Zu+9lF6+w3vZNOHUxVghq9EnbJvxHPf71HiJtjUqHCyGQLx
 e4kK5oee0alL3XIs5OJVgWfdETss6VjOWa4vA2ctKkoUi8BKj+iUdvZ4qNg==
X-Gm-Gg: AYBFou3lnBoy7f2H4lxkXbO1hJStIesfCMc0n/ZClMnh53yI/D6Px9wptaD31HRoSsN
 ng/MB5kC4wbKWpNbR+3PaQvSckDuRWyHmsNMQ4qIUaXghky5A1gMqC8F03VxSDcLBnkJditP7BK
 tM5JpMisBL0R/td5gMzbCjyiTNcsM+i8B+nKJFNxT3j0UtKbKJ/4TRl0pdl/j2jWujJZZHxdNhd
 GyN3kAqrC2PVoATMjF3j3hJvQm6aPLsO+WqvDRKzxDgDe+nfIghO3UCF467rZnLqjjYkpjKt32U
 0aJfyK4C8hZMFxxE6EoT8ZvwCa9bBmk8Zqkk34QxCuGJfH6FlhQ6PrUUk291Jl07EK6MNU+dgQp
 Wzb8DRneQeVPPIXmy2LpI
X-Received: by 2002:a05:6122:893:b0:5c9:c60a:e9af with SMTP id
 71dfb90a1353d-5c9c60af4cdmr3049473e0c.21.1789998674947; 
 Mon, 21 Sep 2026 06:51:14 -0700 (PDT)
X-Received: by 2002:a05:6122:893:b0:5c9:c60a:e9af with SMTP id
 71dfb90a1353d-5c9c60af4cdmr3049413e0c.21.1789998674301; 
 Mon, 21 Sep 2026 06:51:14 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4872442263fsm23680973f8f.1.2026.09.21.06.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 06:51:13 -0700 (PDT)
Message-ID: <a636e448-911e-437c-9d41-6c9187eeaa9c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] hw/riscv: Filter for 32- or 64-bit machine types
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com
References: <20260918-hw-riscv-cpu-int-v5-0-f98c5a244636@rev.ng>
 <20260918-hw-riscv-cpu-int-v5-10-f98c5a244636@rev.ng>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918-hw-riscv-cpu-int-v5-10-f98c5a244636@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfXwjv0KtB7+Ncg
 q3Sw72UzRzZaEXXfL6z+ubpDpruWomXmnv3Zu6SjeZ3SbKkX0iR9LQSLAuqSeKNHpsU+a+ONZEF
 w2aQIS/ppW8jmAOTCXPOZogWj2J+l7fPPhjucltQ3kgW/eWW+QXhsvKA1F2/9iJtCbKqQPDOgem
 Rw2ywbOeEx3vIzElRgN7N9QxOOFxrL9XdnjHDlYmaFKpKbamdwV/BCkHVW6IWDbA171cu5HYUAa
 kzVVZ5z06pIN53LRX8mI0AmQme2xLSEtFydoTu893Y0mbt2CKcOpiaOoQ6N6GlxWEEGwzUX6Mqs
 FznsTB3Y17A6IB2pW7LJtj9X/hJi59HtNDkm9KOtqNUqZEGFtUM4qNcUq2JQ/xhJwRO1Z31TKuO
 xTHiDPOC47JaQ5MaBWgGd4NbUMtg4HKfqA0bToDSDjbpGjyOsmMVl/5umOTPn08AMOOztOUb3St
 4GalIe2R0xKGtKSaDIA==
X-Proofpoint-GUID: VvDUH-RwmjVauvO-NTJxjMnW98Di235K
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab13653 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YDJjWJwHATzlH2HiSMUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: VvDUH-RwmjVauvO-NTJxjMnW98Di235K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMSBTYWx0ZWRfX5HCQ2R/uk0bS
 gFrxH85AuIcn13h5Y0Fv59tpNtEWlW3DyiIg9kHTvrOS5yjauXeI4YoTkHSIfKMAxVef28JlrJJ
 WStvCRDgWYcsF0CNT5Xle31AS8H2z2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210201
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

On 2026-09-18 0:05, Anton Johansson wrote:
> Filters for 32- or 64-bit machine types using TypeInfo::is_available,
> machines available for both 32-bit and 64-bit (amd-microblaze-v-generic,
> sifive-[e|u], spike, virt) leave the field unset.  For boston-aia,
> DEFINE_MACHINE() has been inlined to set is_available.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   hw/riscv/boston-aia.c      | 34 ++++++++++++++++++++--------------
>   hw/riscv/k230.c            |  3 +++
>   hw/riscv/microchip_pfsoc.c |  3 +++
>   hw/riscv/opentitan.c       |  3 +++
>   hw/riscv/shakti_c.c        |  3 +++
>   hw/riscv/tt_atlantis.c     |  3 +++
>   hw/riscv/xiangshan_kmh.c   |  3 +++
>   7 files changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/riscv/boston-aia.c b/hw/riscv/boston-aia.c
> index b90da096ea..ba16b7dbc6 100644
> --- a/hw/riscv/boston-aia.c
> +++ b/hw/riscv/boston-aia.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/target-info.h"
>   #include "qemu/units.h"
>   
>   #include "hw/core/boards.h"
> @@ -263,18 +264,6 @@ static const MemoryRegionOps boston_platreg_ops = {
>       },
>   };
>   
> -static const TypeInfo boston_device = {
> -    .name          = TYPE_MIPS_BOSTON_AIA,
> -    .parent        = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(BostonState),
> -};
> -
> -static void boston_register_types(void)
> -{
> -    type_register_static(&boston_device);
> -}
> -type_init(boston_register_types)
> -
>   #define NUM_INSNS 6
>   static void gen_firmware(uint32_t *p)
>   {
> @@ -462,8 +451,9 @@ static void boston_mach_init(MachineState *machine)
>       }
>   }
>   
> -static void boston_mach_class_init(MachineClass *mc)
> +static void boston_mach_class_init(ObjectClass *oc, const void *data)
>   {
> +    MachineClass *mc = MACHINE_CLASS(oc);
>       mc->desc = "MIPS Boston-aia";
>       mc->init = boston_mach_init;
>       mc->block_default_type = IF_IDE;
> @@ -473,4 +463,20 @@ static void boston_mach_class_init(MachineClass *mc)
>       mc->default_cpu_type = TYPE_RISCV_CPU_MIPS_P8700;
>   }
>   
> -DEFINE_MACHINE("boston-aia", boston_mach_class_init)
> +static const TypeInfo boston_types[] = {
> +    {
> +        .name          = TYPE_MIPS_BOSTON_AIA,
> +        .parent        = TYPE_SYS_BUS_DEVICE,
> +        .instance_size = sizeof(BostonState),
> +        .is_available  = target_riscv64,

If you ever have to respin, please convert the device (not a
machine) in a preliminary patch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> +    },
> +    {
> +        .name          = MACHINE_TYPE_NAME("boston-aia"),
> +        .parent        = TYPE_MACHINE,
> +        .class_init    = boston_mach_class_init,
> +        .instance_size = sizeof(MachineState),
> +        .is_available  = target_riscv64,
> +    },
> +};
> +
> +DEFINE_TYPES(boston_types)

