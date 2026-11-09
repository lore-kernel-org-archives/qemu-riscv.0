Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C67F606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Eaddl72o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G20zxj0D
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWCu-0005mx-Ll; Mon, 09 Nov 2026 15:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWCs-0005m5-UC
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:43:10 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWCr-0000Xl-1u
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:43:10 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHGOj899570
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PMmTkCavsG1PqwYnDnLpmYeW8A+O+z1AULHpwHTct8Y=; b=Eaddl72obPbw7553
 skvFF73NxNxDObbBzG+lajRdmRueC+qbFnT74/Kb+Bf4n39IFiPiVX9Guh66J1Fy
 J0qJqy+rVsAHnQ0aiDp2h5BxRiKH8OZkZ9+QwYPmUCjP71wx+Id78FJYX0T1DLVU
 rDnUVU7QpfcDBtRrao5nx2zJ6yGRbQWmgsqCJyMZLzGPvZQEjkSEDBZ3AYDbYaf4
 r/lHUPQDHOVl6D3uODu1DIW1aT8zj6kBcgsMMLHUTZxcvcNxHkUryTh8ewni2LQf
 QcVtCowdioVdTAhdR/rQJdRbf9Tt9bGkL4rogiVMVBRrXv394EwKOFtvhMe5EzyP
 AcU7ng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2kfrk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:43:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5351f1b26e6so21308461cf.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256987; x=1794861787; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PMmTkCavsG1PqwYnDnLpmYeW8A+O+z1AULHpwHTct8Y=;
 b=G20zxj0DS490Yn8CgsLYVOXxU45MyRQArixB8/Y+8oWis8/4pwyEhfZGDi093e/s0f
 7z3ToSYiZFDsSARNT14wMpRDMrAUwxOZLxV9DpV1kALE5Awl09aeS1iZhiOoU2dNtR5O
 /705NIDjQhBAT9jvWzrVVo4KSYVXdCbt/nTgTGwx3fQsb6RyG6lf6K0nwMWcqirgxzZf
 PLV0AIv+mlhURQEfNDp/OV1BftxvkHlblwKg/7IvrkAsRWD6pMXsBLDUUuYHShfScUR0
 PxnIJrRnaIxRikXZXLg1aJ00DfjdaJaT3vyfiB6f6kzH4xTnYDICCHekvk6HJa5LWEXF
 OlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256987; x=1794861787;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PMmTkCavsG1PqwYnDnLpmYeW8A+O+z1AULHpwHTct8Y=;
 b=FvxUOIpKMzIU0HN+InMV2S0Vdw+AWmItHtUitk60SYBbu4lhr3dRDsmsuhahMTixIz
 w1z2ZJTi6bG09g50eXeygasM7UMBYn/9PChumY2GkBBDkUQK2P+vCKpvYf63p6j3+N9l
 M/ut9S2BeLhMMqNx8Kxu4He2aTM6oQbXhZ2DGvfaiSYV2npejepRg6TlPm02XWVQRfQN
 EAY8uRJUuw1ZT3Qmkexl/pOXq/LyD4PFVqw9wSuqWulc9EveNGroqzRcoNagJpRyC/E8
 7sN3NM/rt/qX5xv0hKexZI8qD6kJqWDf76Q8kKCnRu4JOecrnYknCJH56tuswbvbuYla
 oZtA==
X-Forwarded-Encrypted: i=1;
 AL+hErEirGyl9IpSp/Ur05G6ls6TkzWAOa+VT3NoWmBRK1qBMArpD0ZBlRHVms23FHe2jUl2wvrSnJTZpKW+@nongnu.org
X-Gm-Message-State: APuU4Z96tmW4E9/xj11utqDD7dB7N0ahSiprUV+1xckhhr4zMvZEyA3r
 lpuPeZfttlCgHcwmP22iW1+OkIigmz4/mp22WAp4Zsf+YdGzF10YtYkIQinZ1Rc24z1ABjQ8Vvk
 +ZwDR+Uld9tauHpZFCSZqYq48H2qkqvEzW7CHAOtFZoDGu+gUp1vxW+8NJQ==
X-Gm-Gg: AYBFou3mUZG4OJYAm2K70TCh1WXZkuobKD65rkagkvBsFNnJivkCUVoagdxzZRjRRwx
 PaMBHS1eirFAsadJ0+woUI3QZtL8MwS90k/dXiySpSIRI8MkwUWb3+28PrfC4Jx3J2RYYfRD4sp
 +w366HUjPT0w8PCPOyIlYjRLE+yXBxnnvPDv40jMRx2cFDBqz4JwKxwPToKWb62VgEg16eDXNlP
 0022LWjRhU17zMzCZvdTeSmJpXq1wVLapUH7BwMr+iNPBDB0Zi9JjeCVfwUysQmqnFHBeBBWuuK
 jFQ4xB74dzzQo6DaxPDfe9tmEwLRzfw5eroI0AWlUwPvCweEPSWIRc13w6FedZeEdVC78uUTyqg
 TCyqds6yCiU5IZXkO8Quio7uTC7KLH7IeyOk9R2Vu1jNS/kEEBs6jQGqr6h9DRkKfEeBCcciTYF
 rscLA1e23l
X-Received: by 2002:a05:622a:401a:b0:534:d386:fa67 with SMTP id
 d75a77b69052e-555290c8f5fmr8587391cf.40.1794256987334; 
 Mon, 09 Nov 2026 12:43:07 -0800 (PST)
X-Received: by 2002:a05:622a:401a:b0:534:d386:fa67 with SMTP id
 d75a77b69052e-555290c8f5fmr8586781cf.40.1794256986696; 
 Mon, 09 Nov 2026 12:43:06 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550b451570sm6335371cf.13.2026.11.09.12.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:43:06 -0800 (PST)
Message-ID: <2552fd40-7f29-4347-a6dc-c82b5beaf0c5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:43:03 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 36/38] target/riscv: rvv: Implement Zvfbdota32f
 instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-37-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-37-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af2305b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=TIqMU8aAlnhDBtQ1I-MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX5P+nGbvFn/ue
 Sw5UaFL68Kc0Yt/d8cFEfte8Zs1uNWB7snP692w6pM+/twF8wVGKgR8/WsqsORBWk+rypfRxnBf
 aNI76WR2ZwBUFIKLPv88gut02U0QNpIRDQJmY9JSEtW35gI5h25nkQce2VY+4YaxRNdQIjdVoz/
 XK8YMaevzBf37w2vLZ8MlrrXwQ6WeP518J+VG3rHJb6KNfhbvIO5DzAxxOZ46jn5LdBpuLqLRiP
 W2R+CisqbHUAfoa7erbZRMu/CPIMq44ZTo45yqr7HPRe5PN+VGXYgz0mtgtyu+inqF5IUtl4RwZ
 8H1ELek/i16y6X1ntghsuj9a8E1cOGVgSpqPFz1CZj7Fe2h98e05VEI8OFfJ2iHvAHxrrKjvEPx
 dpcL4lggGnMkwewKttsKEkif/BvTG/zPe0CoENjIw6LO9C7O1DBtbEpErUv5MSoQZ+g+IysofLX
 l9ZP5Mf73CoUeCIoz2Q==
X-Proofpoint-GUID: oPSGQGqKdS-ZTSZkjoNoxIOanju4E5jf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX4ul0TVhkL7Pw
 F/0kFYw3VB31rYLiSD5tDZ6NTPiwXgsiAreKrfNhPP59szc8SNrlk7PF+2T7qM+/i4t5EculZlT
 e/VWa02Ea/0yUCKM/hujb5rAVU49/SI=
X-Proofpoint-ORIG-GUID: oPSGQGqKdS-ZTSZkjoNoxIOanju4E5jf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090082
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add support for the Zvfbdota32f FP32 batched dot-product instruction.
> The vfbdota.vv instruction performs 8 parallel dot products between
> FP32 vectors, accumulating into FP32 elements.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/helper.h                       |  3 ++
>   target/riscv/insn32.decode                  |  3 ++
>   target/riscv/tcg/insn_trans/trans_rvv.c.inc | 11 ++++
>   target/riscv/tcg/vector_helper.c            | 58 +++++++++++++++++++++
>   4 files changed, 75 insertions(+)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index a257436fb31..94f4d9c40c6 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1398,6 +1398,9 @@ DEF_HELPER_6(vfwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
>   /* Zvfwbdota16bf - BF16 Batched Dot Product */
>   DEF_HELPER_7(vfwbdota_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
>   
> +/* Zvfbdota32f - FP32 Batched Dot Product */
> +DEF_HELPER_7(vfbdota_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
> +
>   /* Zvfqwbdota8f - OCP FP8 Batched Dot Product */
>   DEF_HELPER_7(vfqwbdota_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
>   DEF_HELPER_7(vfqwbdota_alt_vv, void, ptr, ptr, ptr, ptr, i32, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 48597915f7b..7fdb7eb54da 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -1112,6 +1112,9 @@ vfwbdota_vv 101100 . ..... ..... 001 ..... 1110111 @r_vm
>   vfqwbdota_vv     101110 . ..... ..... 001 ..... 1110111 @r_vm
>   vfqwbdota_alt_vv 101111 . ..... ..... 001 ..... 1110111 @r_vm
>   
> +# *** Zvfbdota32f FP32 Batched Dot-Product Extension ***
> +vfbdota_vv  101011 . ..... ..... 001 ..... 1110111 @r_vm
> +
>   # *** Zvfqwdota8f OCP FP8 Dot-Product Extension ***
>   vfqwdota_vv     100110 . ..... ..... 001 ..... 1110111 @r_vm
>   vfqwdota_alt_vv 100111 . ..... ..... 001 ..... 1110111 @r_vm
> diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> index 50f0f67ea60..9b06c6a782c 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> @@ -4430,3 +4430,14 @@ static bool vext_vfqwbdota_check(DisasContext *s, arg_rmrr * a)
>   
>   GEN_ZVBDOTA_FP_TRANS(vfqwbdota_vv, vext_vfqwbdota_check, MO_32)
>   GEN_ZVBDOTA_FP_TRANS(vfqwbdota_alt_vv, vext_vfqwbdota_check, MO_32)
> +
> +/* Zvfbdota32f FP32 Batched Dot-Product Extension */
> +static bool vext_vfbdota_check(DisasContext *s, arg_rmrr * a)
> +{
> +    int32_t sew = s->sew;
> +    return s->mstatus_fs != EXT_STATUS_DISABLED &&
> +           vext_zvbdota_base_check(s, a, sew) &&
> +           (s->cfg_ptr->ext_zvfbdota32f && sew == MO_32);
> +}
> +
> +GEN_ZVBDOTA_FP_TRANS(vfbdota_vv, vext_vfbdota_check, MO_32)
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index e641e21d088..7d680747ddd 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -6327,3 +6327,61 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,              \
>   
>   GEN_VEXT_ZVBDOTA_FP8(vfqwbdota_vv, e4m3)
>   GEN_VEXT_ZVBDOTA_FP8(vfqwbdota_alt_vv, e5m2)
> +
> +/*
> + * Zvfbdota32f: FP32 Batched Dot Product with Accumulation
> + */
> +void HELPER(vfbdota_vv)(void *vd, void *v0, void *vs1, void *vs2, uint32_t ci,
> +                        CPURISCVState *env, uint32_t desc)
> +{
> +    uint32_t vm = vext_vm(desc);
> +    uint32_t vl = env->vl;
> +    uint32_t vta = vext_vta(desc);
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);
> +    uint32_t vlenb = riscv_cpu_cfg(env)->vlenb;
> +    uint32_t vd_emul = vext_lmul(desc);
> +    uint32_t log_esz = 2;
> +    uint32_t vlmax = vlenb >> MO_32;
> +    uint32_t total_elems = (vlenb << vd_emul) >> log_esz;
> +    uint32_t n, k;
> +    float32 *a_vec, *b_vec;
> +    float32 acc, prod, a, b;
> +
> +    VSTART_CHECK_EARLY_EXIT(env, vl);
> +
> +    a_vec = g_new0(float32, vlmax);
> +    b_vec = g_new0(float32, vlmax);

Same g_autofree comment from previous patches.  With this changed:


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> +
> +    FloatExceptionFlags pre_fflag = get_float_exception_flags(&env->fp_status);
> +    for (n = 0; n < 8; n++) {
> +        if (!vm && !vext_elem_mask(v0, ci + n)) {
> +            continue;
> +        }
> +
> +        for (k = 0; k < vl; k++) {
> +            a_vec[k] = *((float32 *)vs2 + n * vlmax + H4(k));
> +            b_vec[k] = *((float32 *)vs1 + H4(k));
> +        }
> +
> +        acc = *((float32 *)vd + H4(ci + n));
> +        for (k = 0; k < vlmax; k++) {
> +            a = a_vec[k];
> +            b = b_vec[k];
> +            prod = float32_mul(a, b, &env->fp_status);
> +            acc = float32_add(acc, prod, &env->fp_status);
> +        }
> +        *((float32 *)vd + H4(ci + n)) = acc;
> +    }
> +    riscv_cpu_check_fflags(env, pre_fflag);
> +
> +    g_free(a_vec);
> +    g_free(b_vec);
> +
> +    env->vstart = 0;
> +
> +    if (ci + 8 < total_elems) {
> +        if (vta_all_1s) {
> +            vext_set_elems_1s(vd, vta, (ci + 8) * 4, total_elems * 4);
> +        }
> +    }
> +}


