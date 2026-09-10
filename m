Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F9C79FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 14:18:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4fbA-0007h8-5X; Thu, 10 Sep 2026 10:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x4fb8-0007gx-3C
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 10:17:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@oss.qualcomm.com>)
 id 1x4fb3-0006Mn-Q7
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 10:17:53 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68ADqqsQ1151397
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J1N/uqAFYfACwM6PZBLrAwEG
 fO9dyVbyHFjMJuzekrE=; b=K3/jehSxCD391p45BvHKJf4nx1HsL8UJ7cG1Hima
 J1byTCpIwZ9TCeFOVLnJZLvV05c8ST0J5fJBHyheetHNYmwfhn5oD3W6TnbUiAh6
 14HRofO5kPg0ni16au7uyWADriiMXdaF3B+RBOx0CGQbIDoudM7P4P9TqiEIQMyu
 7AiHZqpvPdm0uEJLPTJA9mWBt+VCNG0hVN94LxUwyN2gRckAXwVZ9rLGhcA+Fm6X
 Q7Y9woWo9GX4ccu1rCo+/JD0MuUcW9ZF7bYREtkyLWjv7fx17a0jTtM0ZRsJ9xUJ
 5/lsMMiP43zHKDcKsNXBFyPreyptDohoWBUYsUdmDtjoHA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts05bp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 14:17:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-97e8d95121cso707598241.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789049866; x=1789654666; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=J1N/uqAFYfACwM6PZBLrAwEGfO9dyVbyHFjMJuzekrE=;
 b=GMO6NdHozJaGyCTFeNKATKDwT3AGhO0lytnlyUYcRdLTLc+KNyjBOZ4y3/ET5yn+r5
 SfXeeFfwkQFSGSrNz/I66L9sl/zbtQ2uswL22rMNkJVn98UvpIWp+pbqLIKU4GNMkv1H
 8H6s02Lbb1v4BP2yXvTX4kFuQRfOExtitLPU8uQYIbCgvysfZu/M581oP5UYZVe0qLoi
 K4ht8CV8PUnE0dire4LRjMiX+VDPujPzLJN3fkDeBrpWJ559tyFOu5F9yHSuoPbAcnqh
 m+kVnGU4itJHwhB+gf5YbJuC1DSKNvrtO6YNSdi8D39902vv2Nxm4fGrisUrTAiNDjEZ
 RcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789049866; x=1789654666;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=J1N/uqAFYfACwM6PZBLrAwEGfO9dyVbyHFjMJuzekrE=;
 b=f5doHZG2QpvjN8oUZc7p5nptU7EvVo1SXiqDRBJfAVkZTA63hD5NVgb4RVorXci3bn
 X0/ZdGF+qFbYxUJUpO1ms8DrMc6Tjn61emohQ6G001zCF462HOy1tt9lIkrtDcFFH70j
 dF7mcMz3aJSrijGubZep21D2toMQH1gmGJ0hxy0E7jYj2x8cm5dtPKirdbb43TYrz99y
 UozmgnkjR/Jo0P9xKoZep0tVaWYfcVYtH5P4gTaPQSubZ5TJDxymK2G7dZkqXkqhXL4P
 lA/wdtAPKRpQex/i0dUHZcsGvbb9PeFltJi/2A9xBJaRf3DORCIORuXiGm4TWM2/XK/2
 9wSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwzhSEn2K0uzw78Pxs5sRDdRrkMzSn8HhxL0ulE+ni108qfgH/YQVWzcwLzD+6tphAKHq1MAvudYURB@nongnu.org
X-Gm-Message-State: AFuF++lSLyyUcHpbPvvkjFARoPzukdhhS4k7JuZlwUxBaac4Tr7SboOy
 29qkKht0s29aw1eO/49L7HMNUu4iUukG6vQURVJgDTpcSoX64vS6OfBkCXDTZAnGMHcpUQehE3Z
 p+ItW5u0HT3Itg5U/paxbIDzEokRAq9nDqV8975TchSURPVFFZkDKGo9RBA==
X-Gm-Gg: AYBFou0x6Fx7lAEObBDhVTedYEVbUQUkzpz7X1c6p6r71mh8ZAYNAOikKiVD2oSMSjG
 kxPbjJ7TvAu/AbDEXqY2ws5ryWS4+RYohkIO80KbKFtdwXpBdhNCe93F2gLDrBtCXpjJoGE31YY
 kf3AXrNKeWVKzoGmDbB1QyVaugAmOMKmDCapWAeSQauuDRAVFadqnU9VxInVbVaMWIgP25lam4l
 EjsSvm0m9kBWO/6R+VrmgASSIZNzH6bH7XYDOUcqcKVKg/5N+655C1V4AhI7Cs5paoPtxmzR9Bf
 IuNcnxzM8FVFh45CyDiVVZOQsT1t9p+t/qlQucKNm6aiY5+OABgwg3I5jWLY5a7THmhTEz3rkTf
 SxDokaPkprSuVUnJFWrSaM8k=
X-Received: by 2002:a05:6122:4689:b0:5bd:81fc:ebe9 with SMTP id
 71dfb90a1353d-5c7ed087c0cmr24063727e0c.0.1789049865100; 
 Thu, 10 Sep 2026 07:17:45 -0700 (PDT)
X-Received: by 2002:a05:6122:4689:b0:5bd:81fc:ebe9 with SMTP id
 71dfb90a1353d-5c7ed087c0cmr24063590e0c.0.1789049864293; 
 Thu, 10 Sep 2026 07:17:44 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d6e1c93sm922489866b.63.2026.09.10.07.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 07:17:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:17:42 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, Icenowy Zheng <uwu@icenowy.me>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v11 2/5] target/riscv: add riscv-server-ref CPU
Message-ID: <w44ujiuswgc4adzlmgimorjgad34vav6vdfcgqtbkbifjjczqa@43b4y5n5pqwv>
References: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
 <20260909210756.1767711-3-daniel.barboza@oss.qualcomm.com>
 <7jkwao2hlaqtkdi44zkvgfe6rij7rpz6dd7qqwm6gw7xmta6vp@biexkhgtrofw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7jkwao2hlaqtkdi44zkvgfe6rij7rpz6dd7qqwm6gw7xmta6vp@biexkhgtrofw>
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa2bc0a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=PXcuKL70AAAA:8
 a=FRSEYCzRAAAA:8 a=lvWoAcddulKRHkWN8sIA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=xVlTc564ipvMDusKsbsT:22 a=1qLaeP4TCVy2vqIEy19U:22
 a=H4N_Y-AU75W7NKDNhZlT:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: Ink8Ir4LmgMCEVFGEGb5O5BWJuJG64zX
X-Proofpoint-ORIG-GUID: Ink8Ir4LmgMCEVFGEGb5O5BWJuJG64zX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX5u12Zi+MuQCP
 bbjo0ZVi2qAlnMxLTJ5JGYaFkXq+d/Bxnw6zeAZlAuG6oE4T7YKTNFjQd40V7fmC8elG3cSo8/M
 3pWqN5lvo1s392OTt1LpM4Y97VhoFL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX1hNArBtE/vO1
 uNbeGdjaZLk2Qbr8zpTcRKzorEvEI3/gWhY6sc1IsORrWaoLbW8VeMWomdSklArEY7KjJT8/uUA
 RbjTDkdUD32jD1qWKWO1wMobhj8NGIdK4DyJSLNm7ivmrL8YXxrJShoCYabZYi4A5GNbhP9vjQl
 dGqhBDmPncTxXJtKuQ/WqaCj5NvyLPspp0yOelOnjRQKpxVjRz5Vo2mM7bTy0lAPfhR+Kj++LKZ
 BqComHMfrncdkY+4nLiSYOr+2HoSs4IhxMtCN/UQVEUzhTk/JgAjwSkH706iWFAu+WnTLpGX9iD
 iNeJsWXzENjL0W+EL0TzdiLuS4iWAi3/nCK+/h0o3dNs0iErNHj3SmY6UgyRZO3Ksjan5kXq56m
 MO0+RwG/7PcbR9yYVdXkJz6DV6KWav0CdUOb2FAO7G9bCetOCeiPrBq6gR3lMMY26hHK/HDn4tU
 p2TULgHnAn4XHQj86Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100172
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=andrew.jones@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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


More comments...

On Thu, Sep 10, 2026 at 09:47:27AM +0200, Andrew Jones wrote:
> On Wed, Sep 09, 2026 at 06:07:52PM -0300, Daniel Henrique Barboza wrote:
> > The harts requirements of RISC-V server platform [1] require RVA23 ISA
> > profile support and others.
> > 
> > We're going for a profile-based implementation, instead of a regular CPU
> > that can inherit RVA23, to allow future CPUs to use it internally as a
> > starting base for their own extension sets.  There's also a new
> > 'rvserver-ref-1.0' flag that can be used to set the extensions in the
> > command line for other CPUs, which can be used for testing/debugging
> > purposes.
> > 
> > Note that for all intents and purposes "riscv-server-ref" is a regular
> > CPU and no, we're not trying to set a precedent of calling the riscv
> > server platform spec a profile.
> > 
> > [1] defines in rule SEE_020 that we must support at least 11 debug
> > triggers (4 for insn address, 4 for insn load/store, 1 for icount,
> > one for int, one for excp).  We're going for the minimum.  If more
> > triggers are needed users can set any trigger amount with:
> > 
> > -cpu riscv-server-ref,trigger-count=N

s/trigger-count/num-triggers/

> > 
> > Note that N must be <= 128.

Why? Isn't the limit RV_MAX_TRIGGERS == 1024?

> > 
> > [1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
> > 
> > Suggested-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> > Reviewed-by: Chao Liu <chao.liu@processmission.com>
> > Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
> > ---
> >  target/riscv/cpu-qom.h |  1 +
> >  target/riscv/cpu.c     | 32 ++++++++++++++++++++++++++++++++
> >  2 files changed, 33 insertions(+)
> > 
> > diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> > index 1a28f1369c..61234842e3 100644
> > --- a/target/riscv/cpu-qom.h
> > +++ b/target/riscv/cpu-qom.h
> > @@ -42,6 +42,7 @@
> >  #define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
> >  #define TYPE_RISCV_CPU_RVA23U64         RISCV_CPU_TYPE_NAME("rva23u64")
> >  #define TYPE_RISCV_CPU_RVA23S64         RISCV_CPU_TYPE_NAME("rva23s64")
> > +#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-server-ref")
> >  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
> >  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
> >  #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-e")
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 773aeba8da..0b0b8e0a99 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -2424,11 +2424,36 @@ static RISCVCPUProfile RVA23S64 = {
> >      }
> >  };
> >  
> > +/*
> > + * This riscv-server-ref entry isn't a profile per se but its
> > + * CPU definition can be modelled as a profile that extends
> > + * RVA23, with additional things on top of it, and allowing
> > + * future CPUs to derive from it via
> > + * ".profile = &RVServerRef1_0;".
> > + */
> > +static RISCVCPUProfile RVServerRef1_0 = {
> > +    .s_parent = &RVA23S64,
> > +    .name = "riscv-server-ref-1.0",

rva23 mandates Ss1p13, so shouldn't we have an explicit

 .priv_spec = PRIV_VERSION_1_13_0 

here?

> > +    .satp_mode = VM_1_10_SV48,
> > +    .ext_offsets = {
> > +        CPU_CFG_OFFSET(ext_zkr),
> > +        CPU_CFG_OFFSET(ext_sdext),
> > +        CPU_CFG_OFFSET(ext_sdtrig),
> > +        CPU_CFG_OFFSET(ext_ssaia),
> > +        CPU_CFG_OFFSET(ext_ssccfg),
> > +        /* ssstrict is always enabled for PRIV_VER_1_12 */
> > +
> > +        RISCV_PROFILE_EXT_LIST_END
> > +    }
> > +};
> > +
> > +
> >  RISCVCPUProfile *riscv_profiles[] = {
> >      &RVA22U64,
> >      &RVA22S64,
> >      &RVA23U64,
> >      &RVA23S64,
> > +    &RVServerRef1_0,
> >      NULL,
> >  };
> >  
> > @@ -3766,6 +3791,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
> >  #endif
> >      ),
> >  
> > +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF, TYPE_RISCV_BARE_CPU,
> > +        .profile = &RVServerRef1_0,
> > +        .misa_mxl_max = MXL_RV64,
> > +        .cfg.max_satp_mode = VM_1_10_SV57,

To stick to our minimalist approach, we could default the number of
counters to six

 .cfg.pmu_mask = MAKE_64BIT_MASK(3, 6),

See RVA_060. The user can get more counters with pmu-mask/pmu-num.


> > +        .num_triggers = 11,

Outside the scope of this series, more debug-trigger work is needed for
complete SEE_020 support. In particular, QEMU still needs interrupt and
exception triggers and the required VMID/ASID filtering. The 11 slots
configured here provide the intended capacity, but do not by themselves
provide all the required trigger capabilities.

> > +    ),
> > +
> >  #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
> >      DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
> >          .cfg.max_satp_mode = VM_1_10_SV57,
> > -- 
> > 2.43.0
> > 
> >
>

Thanks,
drew

