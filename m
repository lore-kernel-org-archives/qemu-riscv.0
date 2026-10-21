Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB93606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXkc0gBH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvC+9j6V
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJb9u-0000Z1-IV; Wed, 21 Oct 2026 14:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJb9s-0000YJ-3F
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:35:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJb9q-00025r-CO
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:35:27 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LHpmQZ4040601
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xCX46VFmx1bwUB67OuJI0vc27Wx/NwDF8kL5KC9TSLI=; b=HXkc0gBH0j3ExyEa
 QTFx0GMpg1Dlfrnj+T/KI17r6G6u9kKdKG4GUPKGyU4JnHo1OHliIX8St7FyYbw4
 hvhYLjCtRxspeydqIw8FxVHRg/w5uHwNEokb3Ehq+GS8/GLnu6qRTBLBxCAKvX83
 6EHk+rYbkyXhK4QNhOXXQPfoXY+v0gcpa0iy8bqKXxgL3AIiY7PnSQhensJL20wT
 h9FxWV2vDG8/66XRgrYE9TqwWEIooFTR+UaXdo0IBe/iwNk/pBdGGPIeLF/Y+xLt
 Mdt1UrmGJ+pBvFr91kt0L0jz29CyW+3WmEnsJaDfoPlVa5ixgsLpZguKLjUTRXDe
 Znvf2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy7am2b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:35:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-917b7dd3f1dso18785256d6.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 11:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792607723; x=1793212523; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xCX46VFmx1bwUB67OuJI0vc27Wx/NwDF8kL5KC9TSLI=;
 b=UvC+9j6VyhjFSi8rVLWE6K+NZ2wjJOH0rFIC3OOQ9j1p+3v6rHQz5mKg0KrD/CodFd
 RgILxRc5wMvVWrh5APKBtunSkrgfJeZkX8IBJLLq3qll5ZGqmRis1zPoknqwkt99YVvI
 w0srwLUqXp3Vztufvm5BawO365udqL3NPzKeUq58cOUOfPUL7HikuBW+gAUQu8yvLscZ
 MwGLyAlt5/p3WpXG0PrU2UauvhvQY5rkRLej4Dd9qgtx7UcQ0m65Z8m7yP0IWJfBdABE
 Qu7xbklYr8sV7a9t0wDM5YDy8Nu6e2UWNzmCz7ulEIkIhufst86mnFmNZaiKQ+hGVHt/
 ylHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792607723; x=1793212523;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xCX46VFmx1bwUB67OuJI0vc27Wx/NwDF8kL5KC9TSLI=;
 b=SsJ/KVWSe71AYdb+sQu5NStqt66WxY+ppn88TTibjakv+lnvbinZtTNTZ75WHPqM9T
 g/YQb0zxN4X5ZwzgspKBQDuvOLONG+nMLNpc5pdU8lB236VmIEd6s/VU55K68v28S9qW
 XdmT9zAbu1jboNimcuoAcFMIaem9DJafYGVMdYcN1ozkzc0lPYRFjkUfceSzOKan2R6c
 +9a3h/+EYxIcz0k4sMZnOAZDQ/+yWje7gqp+hMOl6wbbkK+xaCSPegT+l5ElWr6/ec/9
 ooOWmhx56vx4m1qOXKEXF8dUz8HRSt0TGjrCoLI/+qZxlD55ojSSukNJIcRqWdtj5Uv7
 /Ksw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzAj3IVnPtO24Om6ouJmg6gWWpNIz3eiDjnEa6CXq+K58rxPvOVydxGWQDqWAAo2ebgjANqHVMXnOqd@nongnu.org
X-Gm-Message-State: AFq9FYKSRoWhmy+WAwtRtbUOuD8A6GIPIpDRIAGk7Zvz6wlIi0gIJ0UO
 3+iCynvy1vZlvIfA0DkqTszdo4AG8MpYakBO6B57NU+c2mlhF4hYy9ukWGDQImQIS9ZCjZqR3jp
 jCLx+Hiqr2EL/0f2Pv2LlPTksVhux86GAAeH5G3Th2XzXT7kkcR5evDUlYg==
X-Gm-Gg: AYBFou2e1I8I3i25gU6qN/tUhy8DnujrV5HhxLC9gLcEs8lhrOdFc5dxbEO1ngPWpMF
 qHbxNLGnyiU5MQe985WpCaHnGjZiysS95nAToo9Eux1vtvwDZALsPSBXW7WqKsfC7TCFYPzp/aW
 r9aYONn5GgYS10+J290kLeBQipNA5qG+0+FQc+MAnrnOY9EqJnBSkvyRB/wRk6Ml2dIrrFj9v2n
 0gYlBleRvhRH4cKaS/9nu9p3MBObEhUQ3tYRwk2r4OGggkLaQOOzBWdgu5dP4Lm9UrWlQ5KDsyr
 xGxiavQmmubz7tBP9rWsTuAI1+HZO8rM1n/6lpOniZPqEju6B8P6zWIlp8jBffHIMtI8tHx761V
 C2rbdflmuD2/9cwv+wClBobt1uC7hg4uHYH3P3ye8nCbSGBG+IfQJjB7yYC/ejHKsRA8Wd2gM
X-Received: by 2002:a05:622a:301:b0:533:3627:49fd with SMTP id
 d75a77b69052e-5369b8055a9mr51623381cf.18.1792607722743; 
 Wed, 21 Oct 2026 11:35:22 -0700 (PDT)
X-Received: by 2002:a05:622a:301:b0:533:3627:49fd with SMTP id
 d75a77b69052e-5369b8055a9mr51622831cf.18.1792607722062; 
 Wed, 21 Oct 2026 11:35:22 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab4af6eesm6395981cf.1.2026.10.21.11.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 11:35:21 -0700 (PDT)
Message-ID: <00404c44-38ed-494a-ac31-1ea236780485@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:35:17 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] target/riscv: add riscv_cpu_has_supervisor_mode()
To: Ralf Ramsauer <ralf@vmexit.de>, qemu-devel@nongnu.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Bin Meng <bmeng.cn@gmail.com>,
 Lukas Landgraf <lukas.landgraf@st.oth-regensburg.de>
References: <20261021110838.3097959-1-ralf@vmexit.de>
 <20261021110838.3097959-2-ralf@vmexit.de>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021110838.3097959-2-ralf@vmexit.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mD3ol-CsNwTCVAlw6plqgRt99YBj_F5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3NCBTYWx0ZWRfXwENg9XhZqpYt
 n2IeeOEGAYz1ftxhygln8whxmCLiZk4FA05e3lm9tDh3BqmbVnwEHnTXOMsw82Oidj50fCpU6GK
 chOlx0mKXwDlaPbHBZBNWpcVnM9/cvWoC0fRwJ70rkMlS/oYsRVxab2K4bzTyP1bO3aJ5jx5CXl
 36If62zVRqagsQOjHWwqlESJsG8UBrQBaEbQDWsN0Wa15G93dYMhTkqNVCNMPtSXXp2gr+Zp1h0
 m8ZThUeryUFrKNkFYws0/al2kT9996ZglYq2687gl7mMsmuPdESR8hXpTtUbpAAR4uzYW7LPj/x
 uopux8BDAR7obzSyN44PYti4pCw4lTsV8O08luSJOfJDdwHZ9w1bpsYz/c7wHkCEdqvDpyiINoQ
 GH3QZ5TMze9otzdig2R9AGsMCJy3PJzF7tnsivklI45nxrbTGyy+zazxsP73EWh1EPPp1Iyt5fw
 Hp77OFbMtS2J1A2OJGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3NCBTYWx0ZWRfXyjjP0z3tsQUf
 QwCnqS3ZsZDjQnr/mbRk++PTGrSTsbbdLnaAP/aMsWODiKSqtT30SdBWJ5/FSS7fZsp2KlB0vRY
 jR4ydYmG6/kAoQ+dErNnJf6tzxRCWGM=
X-Proofpoint-ORIG-GUID: mD3ol-CsNwTCVAlw6plqgRt99YBj_F5e
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad905eb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ffQtN6DDJp9pZQXGl-YA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210074
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



On 10/21/2026 8:08 AM, Ralf Ramsauer wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> Whether a hart has supervisor mode is decided in two places: KVM harts
> always have it, and for TCG it follows from RVS in the ISA string.
> riscv_plic_hart_config_string() already spells out both cases.
> 
> Board code needs the same answer to describe the interrupt controller,
> but it should not have to reach into CPURISCVState for it.  Add a helper
> next to riscv_cpu_is_vendor() so the next patches can ask the CPU
> instead of inspecting its internals.
> 
> Suggested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c | 14 ++++++++++++++
>   target/riscv/cpu.h |  1 +
>   2 files changed, 15 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index da4c1a090b..19b6553e04 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -334,6 +334,20 @@ bool riscv_cpu_is_vendor(Object *cpu_obj)
>       return object_dynamic_cast(cpu_obj, TYPE_RISCV_VENDOR_CPU) != NULL;
>   }
>   
> +bool riscv_cpu_has_supervisor_mode(RISCVCPU *cpu)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* KVM always provides supervisor mode, regardless of the ISA string */
> +    if (kvm_enabled()) {
> +        return true;
> +    }
> +
> +    return riscv_has_ext(&cpu->env, RVS);
> +#else
> +    return false;
> +#endif
> +}
> +
>   const char * const riscv_int_regnames[] = {
>       "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>       "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8c8ffe94cd..535e56345f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -964,6 +964,7 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
>   bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
>   void riscv_cpu_set_misa_ext(CPURISCVState *env, uint32_t ext);
>   bool riscv_cpu_is_vendor(Object *cpu_obj);
> +bool riscv_cpu_has_supervisor_mode(RISCVCPU *cpu);
>   
>   typedef struct isa_ext_data {
>       const char *name;


