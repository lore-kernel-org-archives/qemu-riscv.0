Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B5EC5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 15:13:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsMFc-0006Gh-BJ; Fri, 07 Aug 2026 11:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsMFJ-0006Cq-RY
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:12:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsMFG-0004hy-U9
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:12:28 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677CgG0V989333
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 15:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nr+xrord+dV5kmhOT0Axp35eOG1G0w+7POkAZdjR68o=; b=J/AU445w2ATjiKnA
 nUyKxaP4zQT/dotYcQh6mL9/hU5ilLYp9gKsHsPmaLgWGHu1uGCeUoqmtknD6vO8
 uPkbynJT7csR2RVoSz12uC7GF+jELXOHq+I57ALVRLSTPE6JUtlBg50F4wefKsqZ
 tI6Q0Ll101dOoLbzCShnupyuXpGXule7m+UDMKQIKwbcuY53MvJJcP0MeSHhtRxf
 YELpbSZ7sHt5nxIVT0TAuZhCoiUzB61OJKrRhKYZEcAPkIX4pvmutWEG58g6NOpV
 Rwv3czTTY9wwg8Pq9OGj6Pm2j5lv5ylXb3haF2PCJvhJTv5100lAXv6qD6UnqEB/
 YdMtfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwctp9aa4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 15:12:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5174a236220so32691711cf.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786115541; x=1786720341; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Nr+xrord+dV5kmhOT0Axp35eOG1G0w+7POkAZdjR68o=;
 b=gzmYyo/7M8/9ZX6mp3RjvGhL4RIakpD8lC08Db6rrcN9idCbqeKB2LiUGDZX7iOANI
 Dc2/WEAsbOhtVOuuWBtR1iQd8mUWnFMxq2wjxJIhE00PnnZFTP2ks2ebvZvPSBoUsuzt
 40Qyzb731t+IerXwaWi2TDGZwVDfAyLgTAd5u9GBKi2DnzD9/XaPKZO6XXDOdcYA374k
 j1OtKkluVh1s5hfbNySmPeM9DxZ+WLvZnVAPrGxb0/6VDfRSdK5tzTj1yN4v8bT/ygjd
 ermlWPqdjBeOQRmEWIQQltNpNtZkAi7jHi71ZjkVQ/Fansy0tRJDZrlG/xUMmGQgsrdk
 CdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786115541; x=1786720341;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Nr+xrord+dV5kmhOT0Axp35eOG1G0w+7POkAZdjR68o=;
 b=lzzuo7uZw4IyltRD2NFCDDdw+Ha/dU4mG4TlP0SbSCFUOQoSFcvWs+PVydV00U9n8i
 165xyJBmN4uwblaIPUZ3TJjKErtWn2yie0HRRxXRSNLOXVjqxNwMyAq+cn20Q4+xPiJ5
 +jluGLdKKLceuTQopsXyGSt/UZpwYg7gSlw0gUW/BPolo2EnuJgR6o7ZYXTGHvEOvfT5
 K9nBI97Xmyrz61H2qtdx8jyYSSkmmwXSZ2PKQiXkpJZL7BELQMo+EF9yhi8d+F7R8OA0
 PO8SIT8cxXNax8FfbmHLfQTQmVqm6Vdi1GqFMFx7kf58e1Q7VHsRG4s1vFeMjzdWS+8e
 YWsg==
X-Forwarded-Encrypted: i=1;
 AHgh+RocLE+0WC/urJKQ98s8My1SCljq89ZPXL3is0/MQIVq4c5JbwaRQYy2RguNE8FCeAdo/ngkgylqIYG+@nongnu.org
X-Gm-Message-State: AOJu0YxGXgzZF1++09B46DLNfawHbE6oNac+JA40bPbMSzSuNBLIMr12
 56xT+eUFMaKRPWFgOb9euKMhFPyZtbpeQOo5Xk4tAMWK5x5HIkzqWOdvEB49+Ko2Wv5LvKAySxN
 SaAJWTNjY9QNBkipvhZCHaVZjfLGvy6Vxt0Y0L3S2AMd+pIsrtQKBUqVxDg==
X-Gm-Gg: AR+sD11bL2mox6qwxCe2bu4bITxbcDld4BZQhoG7MBMPNO0oqKI/GGfX54452yzjxZK
 LUFYDhret0NOOnSg1onl2ofkwESqdAgn2gZiuFFKK5KgRGQlA5x5uAM6FomGBBFRzLzqA2zljPe
 9DbmV31faEg1fG0P0QwTTUBp71ry3BDqHNrqLZDr3o79eE+szY2uayLbyXvCy/KTXN+tCXhYE+G
 O6LyodH3KtaC4DbaCnAhl5VEP77uC4LB23LN7g5xC8lJcBNivA2093F4K5LYdFKSbwdbIj0InK1
 pSFSrc4qUDglGFAyG/vd35Q2VytmgvmO8fhy49jrfb7E6MJxPdRwBQsTZjoSp2qbCn2Ljz6oPRO
 ICxRCnyX+NadIrgepEUymDPUezprHPdyNUhTY
X-Received: by 2002:ac8:6546:0:b0:51c:e14:87ae with SMTP id
 d75a77b69052e-52ce614ec09mr291527461cf.34.1786115540837; 
 Fri, 07 Aug 2026 08:12:20 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:51c:e14:87ae with SMTP id
 d75a77b69052e-52ce614ec09mr291526341cf.34.1786115540350; 
 Fri, 07 Aug 2026 08:12:20 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d16337589sm13824821cf.6.2026.08.07.08.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 08:12:19 -0700 (PDT)
Message-ID: <2d754ac0-2aea-4d29-bfba-5fd3ce5fb5a1@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 12:12:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/8] hw/riscv: sifive_u: Align ROM reset vector data
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
References: <20260805164345.698208-1-frank.chang@sifive.com>
 <20260805164345.698208-4-frank.chang@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805164345.698208-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fp01OWrq c=1 sm=1 tr=0 ts=6a75f5d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=88c-oCugi1Ou6iAe7WsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: 22YHIL1QmsKrO3pGQ557cr7u2357NOvP
X-Proofpoint-ORIG-GUID: 22YHIL1QmsKrO3pGQ557cr7u2357NOvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX74zdgAClptMe
 cTV2KTi2WKN6zMMfTwDLYX4ct1HdVT8Ll4bEf3NCprA5BBqHRgLCzXsRn3Tp+3lFfXEOnVpw2AE
 GdBBxXjti4R1oMJCaYgOLLiPlD5SM5D5sKpqIXx79MS0UmQiWj9J5gc7GGK6+6PDPwOGG32B8BU
 WZCtYpSY6VXICtflcE5fsAcPRuT1Q15gZ2hT2ecrVmyAorki1L9SlFKyzBiByYIp3AgcxvzaAO7
 /+LqKqOxJt4sfEUm1MUfrlsZncgaioF5tYnpKf16foichvM4rJO8BrNxXwPkKuLs6f4/cO+OTYL
 UBdcDRUM/lh3zM95MaOlcDvSjw0KWONMY/PlEPNct1Zrp7ptDJJxnhRX+UTXmm5trZd8r1rj3mt
 BQKkrKiTc1F+qpJhtZgq8fZKCVCwdYRgkooKNQlVlVE5kc7s59co/92YSRRYXnlMB1XO+Tz365c
 /AdfZFzLCfuAkDoasag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX0BWOTTJpPOh3
 tyNk1j0pvfqHGT7A/g/a4BxHceeIJQ51jXIYxXh57HjNY37Dams76dVczMtVJyAzQoDUvRhkPmm
 LHc8v8svQwCG3/c812giXi78LQTHxdc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070119
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



On 8/5/2026 1:43 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> The SiFive U ROM reset vector data needs proper 8-byte alignment for
> RV64 ld instructions. The misaligned load will cause exception when
> Zicclsm is supported as SiFive U CPU doesn't support hardware misaligned
> loads and stores.
> 
> Add padding to ensure start_addr and fdt_load_addr are placed at 8-byte
> aligned offsets and adjust the load instruction offsets to match the new
> data layout.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/sifive_u.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 99423ef472d..57a57c96e16 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -564,19 +564,20 @@ static void sifive_u_machine_init(MachineState *machine)
>           0,
>           0,
>           0x00028067,                    /*     jr     t0 */
> +        0x00000000,                    /* padding for alignment */
>           start_addr,                    /* start: .dword */
>           start_addr_hi32,
>           fdt_load_addr,                 /* fdt_laddr: .dword */
>           fdt_load_addr_hi32,
> -        0x00000000,
>                                          /* fw_dyn: */
>       };
> +
>       if (riscv_is_32bit(&s->soc.u_cpus)) {
> -        reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
> -        reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
> +        reset_vec[4] = 0x0242a583;     /*     lw     a1, 36(t0) */
> +        reset_vec[5] = 0x01c2a283;     /*     lw     t0, 28(t0) */
>       } else {
> -        reset_vec[4] = 0x0202b583;     /*     ld     a1, 32(t0) */
> -        reset_vec[5] = 0x0182b283;     /*     ld     t0, 24(t0) */
> +        reset_vec[4] = 0x0242b583;     /*     ld     a1, 36(t0) */
> +        reset_vec[5] = 0x01c2b283;     /*     ld     t0, 28(t0) */
>       }
>   
>   


