Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6B8CD4F26
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 09:42:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wd34Y-0005MC-30; Fri, 26 Jun 2026 05:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wd34W-0005LR-KW
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 05:42:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wd34U-0005Y6-O5
 for qemu-riscv@nongnu.org; Fri, 26 Jun 2026 05:42:04 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65Q6VMYm1680034
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 09:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jDJC/0HDTXFtjGlDMT0xml2YFgsL3IOKr7Hd62sc6JI=; b=iLcbzZ8SFuPBUt/H
 uqTG5a+cGGZEM/BkrGiN3eY555J5ocwF/9pQNBkwGMdY5ezEpVnkycooJWwBT++x
 /M8KrFhoqOcjN38Pz3iNEi+MBqrxTOAym+svpQYpS/xkkBCBYQwCFE0ncDestK7G
 bXqRAu5CT6rwKrZ2i1lj8S44rjYmNK9M96PJRXMKtB0izJEPKcQIM9CvUBaCsjQl
 jVbjQlRfqMQznbjZKmx6vwtPduGoGQiso0f5a3I/Kp5hmQzCMKePIik88tQMovdw
 iynpXvidJlEjADlrfBcNhRQyu+U6wQYH9HYpCCqrVtsF75FycLYFn61uU2i9j0hS
 hSyvAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgc1t3f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 09:42:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8db3d8c8c0bso22252076d6.2
 for <qemu-riscv@nongnu.org>; Fri, 26 Jun 2026 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782466919; x=1783071719; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jDJC/0HDTXFtjGlDMT0xml2YFgsL3IOKr7Hd62sc6JI=;
 b=gesZEG/+Mnh51L4sor+d8SDH/YfHCX0xWMOJ0LJkJ3G1zkBwTvZYf52mzvnsiaLNps
 Y5FSfs7E9J+QoSuzyFzgf6AEP0kdIDeyjAquYK9LbBsOC5ah7yKODFwsCnBV6770v2MA
 4GOVgzSdk9f3Y25FsmELtZ9xJnIOutb/O46rXGLZBa0Ryn/W1LutRXYNNx/OjilMs8C0
 AkjaxWgbrbpzqlg/lO2P5THSzP1KMDMZzi33kTcjwas3KJwUWH8p0/K8X5tJW5P3NrtH
 fiu8FrT13KDiTwPWwP8B4Qb9WI5tqY0wKY5DdH8k9sBf0+6E6V8yA+8P/zO9XsvI+jk0
 P0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782466919; x=1783071719;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jDJC/0HDTXFtjGlDMT0xml2YFgsL3IOKr7Hd62sc6JI=;
 b=jqs8nt8Wph2Lc6s8Sy9HF/BR0nRzNgVLLnpyWc1Q+aujG796/IH0Ejx/LbrMtz/Q0o
 iqj9Xgy9/o02Tsm3az+sPX3IGYhvYx69dI1JVMG9lTNmaLnG2AJ3s0KKWB5zA+rpWG2y
 gDaIbI5KJFjeHfa7R+rErs1calRcH+XA3oOypI6AR9IS73DFTOyN5D4H4MbGz/DE4WwQ
 pZ4I6B2jgZq9GAZFDPgr+Y8fpgbDyzCCq3BDa0AUmbBWaCznzTJoFvR2CD8+gY35lnEw
 Dzqm5dJmo8qMfJDa78LUk5Tz6c/y8pXc9Rt3B6zYSVhApL6WKEdZhOv/Q4tyixC/gbu9
 ZnTg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9H1xh+/EpwQn+14ebDOFofgqrfWNybTZd1DwiRXGI4O1V+DE48PBqmiUaQfFBWu/BUSh2QNtifvN6M@nongnu.org
X-Gm-Message-State: AOJu0YwdhlgsmgNT06dvYbt9b3a9Dh1JLVGQR4gAL67GCjPaofahLU6R
 sLfbMiyGxD/jL2SDWIoxShBLDiUvUPKiJIFcNH/E61+Ew928/U0rZ1e8y096JMWKAsVxjy5OV1M
 Li5lFO4JY2s1fngRYqBpifMrFt6YABJgw2UJbGeXar8LgksxOSMD/VF8TCA==
X-Gm-Gg: AfdE7ckqt6TFXl+YAiOWoKnLl5xkSbEmz6PNq7bXR/jcRc2G+xQbzcYxRv+m2P2fDxc
 V03DoXdXu9jD2g4YsVxxRUcb79VVzTxU/XqcAg+fNsT+Kg3Kkftj3PjbNKBvaI1+0fEwFJ+zas1
 Udpb25/QgkFRRcqM6CspdzsSzRnQyDUxB8Qz4UjWmDznwVt3XQUEgzI2fTXXTB/pBzyTlofwF1H
 YpJsk7UBJ1u7yVVzBHivx8M+aEJB/smf0IiM4ulSO+6R2UI+lag1mq6Tx63wS7Y9i7HYgMLKMhA
 2pK/mcx+NkNBug1gRw2cHL7T6Zu5T5DfNJzVeuOnni8Yhbs3k6LhCMRn843D+YlVvlfKbq36/Eb
 JRZbBehSIMVeB8lyexQ7kXlVRc0klObhMiNePVbH0T07RekV3OWr3CBRY6l8mug==
X-Received: by 2002:a05:620a:172c:b0:8cf:e0fe:f217 with SMTP id
 af79cd13be357-9293a9a25a3mr935631085a.20.1782466919243; 
 Fri, 26 Jun 2026 02:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:8cf:e0fe:f217 with SMTP id
 af79cd13be357-9293a9a25a3mr935627885a.20.1782466918687; 
 Fri, 26 Jun 2026 02:41:58 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46e95f3d71fsm7074254f8f.12.2026.06.26.02.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 02:41:57 -0700 (PDT)
Message-ID: <47b47ca5-0a24-4c12-88d7-f32184728dad@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 11:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Report QEMU CPU archid as 42
Content-Language: en-US
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Atish Patra <atish.patra@linux.dev>, qemu-riscv@nongnu.org
References: <20260625-marchid-v2-1-3821c351028b@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260625-marchid-v2-1-3821c351028b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX5p49uVi93AWJ
 +Bmq/CvUCSJRn/pra/wDlgoAHjjkQhekj3i0baIk5eCsQWtgpxRFUrUcEN9pFW6nBNUBDXD7bcm
 4ZPmvCiibX8/ZOorWld2TXQR+Diiws0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX0sRoASaSZ6lt
 rc8XU3xMDQcW6t+/Jb4UjiDygysxhOtGUZJHoRH7OA3O3idqshQSTQTesSG7M9al3jlTHogdtDc
 H8VfGWp3t0Wrs5Yqk+vBmNwv8fKwbpWvfdwZfBmskoyijDDGsL/rj06weSD27NrBpC/+3MMJQMy
 1vo/gOZj4nYSkkSgSvP/iivi0AprZ8qFkvN08jzWODwcmtV8XZkZiLV2rMyNcemOLVdbZpM75Kn
 z0mshJUj6jQBtgtrKoyqP7jgYKOeSdb+lxh+TF9jk8LICBeOrHHRNgSC5cRAStgyS3sub0zBwWM
 Mdo+PIXB7FNFuYpc61QAqZbz3IhBG8Grxywf+tCsKpwMgF7gmyKc8PyOGMK76XA8P9bsseOT+zx
 GIh2vuhH0rIcBzDzJt3ayB3ULv/7SAzbaVh/K1eFhy78d9gP0bBybdtxhq3Ftzl3zDw4NB9G6Ae
 8Y62GTY+r83fuivP/4A==
X-Authority-Analysis: v=2.4 cv=O4oJeh9W c=1 sm=1 tr=0 ts=6a3e4968 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=xvfqbYfxAAAA:20 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=PP3pwVRpa4UdzyismAsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=MSi_79tMYmZZG2gvAgS0:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: pjaXUh-RVOpucSSts8ciebLdzTk_y-fz
X-Proofpoint-GUID: pjaXUh-RVOpucSSts8ciebLdzTk_y-fz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260077
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 26/6/26 07:12, Charlie Jenkins wrote:
> When a non-vendor CPU is used, report the archid as 42 which has been
> allocated for QEMU in the riscv isa manual [1]. This can help software
> check if it is running in QEMU.
> 
> [1] https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
> This series was original proposed by Palmer Dabbelt [1] with a follow up
> by Daniel Henrique Barboza. This patch implement's Daniel's suggestion.
> 
> When booting with a non-vendor CPU such as with the qemu arg "-cpu rv64"
> marchid will now be reported as 42.
> 
>> qemu-system-riscv64 ... -cpu rv64
> 
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
> mmu             : sv57
> mvendorid       : 0x0
> marchid         : 0x2a
> mimpid          : 0x0
> hart isa        : rv64imafdch_zicbom_zicbop_zicboz_ziccrse_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zaamo_zalrsc_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu_svvptc
> 
> When booting with a vendor CPU like veyron-v1, the proper marchid will
> still appear.
> 
>> qemu-system-riscv64 ... -cpu veyron-v1
> 
> processor       : 0
> hart            : 0
> isa             : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
> mmu             : sv48
> mvendorid       : 0x61f
> marchid         : 0x8000000000010000
> mimpid          : 0x111
> hart isa        : rv64imafdch_zicbom_zicboz_ziccrse_zicntr_zicsr_zifencei_zihpm_zaamo_zalrsc_zca_zcd_zba_zbb_zbc_zbs_smaia_smstateen_ssaia_sscofpmf_sstc_svinval_svnapot_svpbmt
> 
> [1] https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.com/
> ---
> Changes in v2:
> - Added comment linking the spec allocating 42 to marchid
> - Cleaned up the id setting
> - Link to v1: https://lore.kernel.org/qemu-devel/20260624-marchid-v1-1-a0af7997071f@gmail.com
> ---
>   target/riscv/cpu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fa497e5e8a..94946d335f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -47,6 +47,13 @@
>   static const char riscv_single_letter_exts[] = "IEMAFDQCBPVH";
>   const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>                                 RVC, RVS, RVU, RVH, RVG, RVB, 0};
> +#define RISCV_CPU_MVENDORID 0
> +#define RISCV_CPU_MIMPID 0
> +/*
> + * marchid allocated for qemu:
> + * https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
> + */
> +#define RISCV_CPU_MARCHID 42
>   
>   /*
>    * From vector_helper.c
> @@ -1183,6 +1190,10 @@ static void riscv_cpu_init(Object *obj)
>           mcc->def->profile->enabled = true;
>       }
>   
> +    cpu->cfg.mvendorid = RISCV_CPU_MVENDORID;
> +    cpu->cfg.marchid = RISCV_CPU_MARCHID;
> +    cpu->cfg.mimpid = RISCV_CPU_MIMPID;
> +
>       env->misa_ext_mask = env->misa_ext = mcc->def->misa_ext;

I'd have put it here, then followed by a comment such:

         /* Let vendor override defaults */

>       riscv_cpu_cfg_merge(&cpu->cfg, &mcc->def->cfg);

Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>   
> 
> ---
> base-commit: b83371668192a705b878e909c5ae9c1233cbd5fb
> change-id: 20260624-marchid-80d176b873d8
> 
> Best regards,
> --
> - Charlie
> 


