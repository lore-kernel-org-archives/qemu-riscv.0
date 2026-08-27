Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D11C61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 11:08:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzXxp-0007j4-Uo; Thu, 27 Aug 2026 07:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzXxm-0007hl-5F
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:08:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzXxj-0004hQ-CU
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 07:08:05 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R9Hh6K3524148
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z9VyHhwbxz58HZhIz9qpENU3HijSb3bg3bDJkc4lp7I=; b=WN8EpnPp1aqq1MRD
 AAp4uuBEan8f3zO9fD5D7A3BJEsehETeIprCYHIxS2r7ZxwARpxDpmWF6da0dKUu
 SEvZG8QsCsJbC6uzsDbqyuAY8qp8oWk7mrOgVZLi1RoDMGqEEOWCJOrIoInnta1K
 M9PD88VEdjJHpB1OXOASQoWXRBeLe+/v+tM0/mQrHibJCAXy377NS/CiIOF2dqe/
 sLp0W59rrqfOszum11AWg2W3BwLz3IDz5csU9AaJ+2GK5fdOZX740rVgiR4pA+Iz
 KnG9/rJFVb0BNb02pOY7HrdR60pNdGtm6464YzA0f/jg0gRHiOJcGyGvlE3YlQyI
 V9wcnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gagjfrxdm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 11:08:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52d827597fbso20165221cf.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787828881; x=1788433681; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z9VyHhwbxz58HZhIz9qpENU3HijSb3bg3bDJkc4lp7I=;
 b=ZiOvWORFgeAsUae7zNzE+/5qPejjpNc2Mx0sMy4mCyaVPsXDrzmIYUXfHr9+Bxpe3C
 u14S0UEPO4eUgafB+AprDNP5GwsM3wvt0VrCHiR99nKgd1l31oP1B21Jw/IAC5nWuqcN
 yyGTB7LZsD+vz24pD9+cNedmidvb5V2xPAaym9Coe46ecuj6Ri1iNfh8M9Nnd1+G+f+2
 sh1hz8tG1alLB/qb4W3l81PC8AVtol2zoly8f3zK7FZiRoIi59MIm4Q2JAz1glZ1k3jY
 B+71ytlPxarYFZUcmoUdeBy3AdJaQOofpTUhgFz68h2nf0BbBLTgQn56qa32dbb+O7K5
 BoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787828881; x=1788433681;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z9VyHhwbxz58HZhIz9qpENU3HijSb3bg3bDJkc4lp7I=;
 b=o9/Alz0J0iN3hdTymowyVJDPz11dOSiNxmopVAPk1xdGftnSxLSVET3jOyw0DKMtpH
 5JPDCOB5bOffJ5uByZdsg6qlwVSflxuZBeu98yDPKdI5GNZoCVbTPcZlJnG98NDsljO6
 Otx9IK8AINkAbkKa0XV6Q8WqU/AMA3KnOHfAUTq3UQF3qiZUUFLHjB0mhabaH0E4bLC3
 DPA1v0oAutQwedayb90K/H3pTkqJP/zUAXz1LI/wJcvOfQrkVhbbBz3mwRmijk8Kp3U3
 MsFx+SeEB/Q5a8euc/0Vr77gpFO+oDTzIAOdY5AS3SMT5DmTCtNvdzt3gtvCL6DxijoM
 ooGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlLFLKVt/kAg8EGhShJxlI+Df55jrF77ZGqjyRzk3z9lUeVp5uwhlAcg4F0cXFCGVXJB+APcZoPpHv@nongnu.org
X-Gm-Message-State: AFuF++mm2CEUwbE0ytiSRyeGVSXtbzZDwfpNQhsr4uLEv/HOmQZfn9Nj
 JcqYn5p69Oz0+hsmcLgWjkiFChHxNu6bxCvXVLIZmwzp/LjC/O0ZFgOpkzikKnMhc6qSZ+VrzTx
 uuOS8UDtsWK7i9dNelvAIC0YcXeZRQOjXktyStCQE0ylfNIcozUt7RdrdKQ==
X-Gm-Gg: AR+sD11USq0YGgGqkE/m+PM5JLlybt2wcPp+r5qLAnIff1uhM+VSRYFnv6qrwfBlEus
 rZLfIhWEfuV9hHOIdRt0TXKVB6ug0FYmLYZgVap391MhXmT6grwM22RIp62opJtHi/3NNGJpQ7D
 E1VMvtiHELgZjPmrnZ9pQqoS/ihyd4AIuza4lNKGkf9/HfXgBnbYNx4GAR13iUD61YrrzE31pfF
 vZaa02csqWh6OQdBG09s00uxb8p92Pm0N4jK//xbTVU8TbbUx+XYMS4VLhh8WoonshsQ3QAYoem
 LJGuPSnpD47lpM8FkHDDzRu8MhP0AaPjEoT4TvDBY/ptpMdh5JSxtBEZh9CUsqN9+GOtOsAmv1b
 lsds/L9FvmFaFzncC/nK4fATORSFBDHRmdmjP
X-Received: by 2002:a05:622a:53c7:b0:52d:ea18:a9c with SMTP id
 d75a77b69052e-52e42379a61mr165623811cf.34.1787828880649; 
 Thu, 27 Aug 2026 04:08:00 -0700 (PDT)
X-Received: by 2002:a05:622a:53c7:b0:52d:ea18:a9c with SMTP id
 d75a77b69052e-52e42379a61mr165623161cf.34.1787828880198; 
 Thu, 27 Aug 2026 04:08:00 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52e4273ac9esm34640081cf.20.2026.08.27.04.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 04:07:59 -0700 (PDT)
Message-ID: <53fe0bed-9694-44b0-a1ff-628e2983b0cb@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 08:07:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] hw/intc/riscv_aplic: Take a MemoryRegion for the
 created device
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826220528.54516-5-joel@jms.id.au>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826220528.54516-5-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ijqaL0MlU0fRkwC59b90kbULleXwRFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5MiBTYWx0ZWRfX8GkwWai9sAZF
 ItT4mdIUTeY1C2quYcWN4BDb+hfleLSGhdQl/8evtqV9Ik+VGVFm/TBybGlWmaQxgNGLiTTHODm
 osuI6DsmurhcmN5Kh+Rgjjw6ndrJxoUv8y0jFPAWT79NbX3IvGA80/ddwAQuaMmL7t7nHgBowhk
 jJFzDXI5Eg90RhE3ykvptdqhCwHAPegjSQyYuMYnrFCeyquSixS0OYidorHi4rOsCq3WeG20rrn
 PK8sO18qFvjEdAQ2nUgLE8JAnqVTcCAIeF0S4+gzJIo2V5f4pPZ7nL7HKjbxCx66fBs7/Dn9uZN
 ht7NMVp+CjCcaWnMe7LxDJLvIAzrhJ60IzbtUwbZtV/TbmbAE4p21CpF1VYtjvv0rTwarUUnav0
 n+mv0QtW+7crQUszOGbVlnA0yYsFl0R6NTczABEBVwiY1d2IwheBUKbR54XjZTsEKcdIF16QjVf
 0aRnNdxr+tvCFx+vZ1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5MiBTYWx0ZWRfXyMHR76Ki6txn
 32gEci0npHPh/92g6GfAlsO8udXUPN/ZL3AU9l9bD6TpG5/MzrOEorttLea3E5QNM8dYaMVU6op
 90StuUzqzHvznBUOCy+W2p/bSipflVo=
X-Proofpoint-GUID: 4ijqaL0MlU0fRkwC59b90kbULleXwRFH
X-Authority-Analysis: v=2.4 cv=dd+wG3Xe c=1 sm=1 tr=0 ts=6a901a91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=raEWF1n8FxO4QE1NUZkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270092
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 8/26/2026 7:05 PM, Joel Stanley wrote:
> riscv_aplic_create() maps the device it creates into system_memory,
> which prevents its use by SoCs that map devices into their own memory
> container.
> 
> Add a MemoryRegion parameter and map the device into it instead of
> calling sysbus_mmio_map(). The mapping still only happens when the
> APLIC is emulated. All callers pass system_memory, so there is no
> change in behaviour.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/intc/riscv_aplic.h | 2 +-
>   hw/intc/riscv_aplic.c         | 5 +++--
>   hw/riscv/aia.c                | 6 ++++--
>   hw/riscv/cps.c                | 6 ++++--
>   hw/riscv/xiangshan_kmh.c      | 6 ++++--
>   5 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
> index c7a4d4ad0172..baeec76e4c3e 100644
> --- a/include/hw/intc/riscv_aplic.h
> +++ b/include/hw/intc/riscv_aplic.h
> @@ -80,7 +80,7 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode);
>   bool riscv_use_emulated_aplic(bool msimode);
>   void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr addr);
>   
> -DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> +DeviceState *riscv_aplic_create(MemoryRegion *mr, hwaddr addr, hwaddr size,
>       uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
>       uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
>   
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 84606e9f3d88..87d7d9e49cdd 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -1109,7 +1109,7 @@ void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
>   /*
>    * Create APLIC device.
>    */
> -DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> +DeviceState *riscv_aplic_create(MemoryRegion *mr, hwaddr addr, hwaddr size,
>       uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
>       uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
>   {
> @@ -1137,7 +1137,8 @@ DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>       if (riscv_use_emulated_aplic(msimode)) {
> -        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +        memory_region_add_subregion(mr, addr,
> +            sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
>   
>           if (!msimode) {
>               for (i = 0; i < num_harts; i++) {
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index 49cb14349f00..974806c425e2 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -71,7 +71,8 @@ DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
>   
>       if (!kvm_enabled()) {
>           /* Per-socket M-level APLIC */
> -        aplic_m_dev = riscv_aplic_create(aplic_m->base +
> +        aplic_m_dev = riscv_aplic_create(mr,
> +                                     aplic_m->base +
>                                        socket * aplic_m->size,
>                                        aplic_m->size,
>                                        (msimode) ? 0 : base_hartid,

Not a problem with your patch but seems like we have a goofed indentation here
and down below in the next riscv_aplic_create() instance.  Seems like we tried
very hard to avoid breaking the 80 char line and we ended up doing this:


         aplic_m_dev = riscv_aplic_create(aplic_m->base +
                                      socket * aplic_m->size,
                                      aplic_m->size,
                                      (msimode) ? 0 : base_hartid,
                                      (msimode) ? 0 : hart_count,
                                      num_sources,
                                      num_prio_bits,
                                      msimode, true, NULL);


i.e we moved the MULT to the next line, indented it, and all other parameters
follow suit.  The result is not pleasant.

If you could take the oppourtinity to also fix the indentation of these 2 instances
that would be terrific.  It will break 80+ char line soft rule and that's fine - the
hard limit for checkpatch is 90 chars per line for 10+ years now.  It should be
120 char/line at this point but anyway ...



As for the code:

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



> @@ -82,7 +83,8 @@ DeviceState *riscv_create_aia(MemoryRegion *mr, bool msimode, int aia_guests,
>       }
>   
>       /* Per-socket S-level APLIC */
> -    aplic_s_dev = riscv_aplic_create(aplic_s->base +
> +    aplic_s_dev = riscv_aplic_create(mr,
> +                                 aplic_s->base +
>                                    socket * aplic_s->size,
>                                    aplic_s->size,
>                                    (msimode) ? 0 : base_hartid,
> diff --git a/hw/riscv/cps.c b/hw/riscv/cps.c
> index 5cfb54aa27d2..d2fd9638a08d 100644
> --- a/hw/riscv/cps.c
> +++ b/hw/riscv/cps.c
> @@ -135,14 +135,16 @@ static void riscv_cps_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < num_of_clusters; i++) {
>           uint64_t cm_base = GLOBAL_CM_BASE + (CM_SIZE * i);
>           uint32_t hartid_base = i << MHARTID_CLUSTER_SHIFT;
> -        s->aplic = riscv_aplic_create(cm_base + AIA_PLIC_M_OFFSET,
> +        s->aplic = riscv_aplic_create(get_system_memory(),
> +                                      cm_base + AIA_PLIC_M_OFFSET,
>                                         AIA_PLIC_M_SIZE,
>                                         hartid_base, /* hartid_base */
>                                         MAX_HARTS, /* num_harts */
>                                         APLIC_NUM_SOURCES,
>                                         APLIC_NUM_PRIO_BITS,
>                                         false, true, NULL);
> -        riscv_aplic_create(cm_base + AIA_PLIC_S_OFFSET,
> +        riscv_aplic_create(get_system_memory(),
> +                           cm_base + AIA_PLIC_S_OFFSET,
>                              AIA_PLIC_S_SIZE,
>                              hartid_base, /* hartid_base */
>                              MAX_HARTS, /* num_harts */
> diff --git a/hw/riscv/xiangshan_kmh.c b/hw/riscv/xiangshan_kmh.c
> index 9eb608f8c578..c5a654ab417d 100644
> --- a/hw/riscv/xiangshan_kmh.c
> +++ b/hw/riscv/xiangshan_kmh.c
> @@ -80,13 +80,15 @@ static DeviceState *xiangshan_kmh_create_aia(uint32_t num_harts)
>       }
>   
>       /* M-level APLIC */
> -    aplic_m = riscv_aplic_create(memmap[XIANGSHAN_KMH_APLIC_M].base,
> +    aplic_m = riscv_aplic_create(get_system_memory(),
> +                                 memmap[XIANGSHAN_KMH_APLIC_M].base,
>                                    memmap[XIANGSHAN_KMH_APLIC_M].size,
>                                    0, 0, XIANGSHAN_KMH_APLIC_NUM_SOURCES,
>                                    1, true, true, NULL);
>   
>       /* S-level APLIC */
> -    riscv_aplic_create(memmap[XIANGSHAN_KMH_APLIC_S].base,
> +    riscv_aplic_create(get_system_memory(),
> +                       memmap[XIANGSHAN_KMH_APLIC_S].base,
>                          memmap[XIANGSHAN_KMH_APLIC_S].size,
>                          0, 0, XIANGSHAN_KMH_APLIC_NUM_SOURCES,
>                          1, true, false, aplic_m);


