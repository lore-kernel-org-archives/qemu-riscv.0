Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C69606A326
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3benQkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=co9G09Ki
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQW35-00067E-5Q; Mon, 09 Nov 2026 15:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW2U-0005gi-7m
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:32:30 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW2Q-0007jL-F0
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:32:25 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HH8E7879282
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GtYRu/LgOpEYGpU5e9HgPUH/VYaBkTRUhgQkUxoeVHQ=; b=g3benQkWMktjPuxd
 QODcdTxA8VN1cAMDOwDfWeSYrNCXqwX63zx9dJPl0if9DrRmFF1QImB7GQaTKO2I
 4WpCZo1+G+idYsuaIqUFACanBtKEixMOgeGfgxkHJT4ueOxP3f2U3KNZd8h4zHsM
 umL5q0FVXEY4nXOlXUadCn/jgXLqiIL6W9pwHN7gjGOz0jxxKBtyQZmHVLwC5doS
 PGWZXxS2dx+bP887KvWNVQEUsQlX9hCd4W5BMpweONfT8fWyOINiE26CcK9Avx4I
 qlnNLEpXaNA9VC1SDSe4boQGO6ufGWMsTWELKuswHL+i5xUhgZH7Lv+/7peoodWk
 Cyzw6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5t29n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:32:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-535131e4c25so28309521cf.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256340; x=1794861140; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GtYRu/LgOpEYGpU5e9HgPUH/VYaBkTRUhgQkUxoeVHQ=;
 b=co9G09KizDbzT8wadTYHfsBRR+WjDnvmXrhpXA84A/UX2Hqgbw+kfyphvCXjd6ibT9
 IMZF3A1/YCnFmR0EbZSA1yihYBDDB1P/A1KiYZ8Jvc8qYrrMLxf8Vt66ucoZGPul5aSt
 K+lYQ72gISHmJ/3rbyQ1oanoBHCD2kZJiNUO1ZbvHOuZf54jAII949aEWWz16HQl9Mit
 1OPoRj8INvFQml39rrGcj0pyfFsumJU8uvANS9VWFVKgTVl4MrEfYZnZdfBCetT02pme
 WW3hT7QCVmBvcC0QHqOKXxPAqnUj8w+Rm0KVmpU2r+0sIWeJXV1zcyohr/tG9pr/8HGN
 TL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256340; x=1794861140;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GtYRu/LgOpEYGpU5e9HgPUH/VYaBkTRUhgQkUxoeVHQ=;
 b=DXqKwGxwyxupW4/PfnxgWNzqJCL52y4H11r22O91y+dhEtqcGXQAL8Vze0RXu2DsVI
 XCV/VzHqg2EklsISBa7JusFuCinZ6ZPT6Pw/FLImztl6sbGlh0MmPv4CP5wVwnAvpiAZ
 ky72W0TICqMJ0KBtpI2g8MPYKfnZ6PikEpe0Rqw0B8TwIXxyaSs2P6x7/Whc6QrLTVRt
 k+GMtaUn4LAgbpd3eXDbpL9vmzFkYazUrw7064U1EEWJ1bTyENPTgS+rmN5HnUAj9CGg
 ra3A3nsZLSCEEbkkPEjCCvyMoqeqi9Wl477RSQHXGOT/V0Z4u9BF5ZluKFilrppBGDb7
 +62Q==
X-Forwarded-Encrypted: i=1;
 AL+hErFSNaXfqO9ShT4raNR1IEi8M6ueKhiOLrYhc0cNhTaZeIgbEEHx7g9PjkbWODoiqf5Qv4L1fXQNoVz4@nongnu.org
X-Gm-Message-State: APuU4Z9uvDY86ZQUgbETIWVQGQv+4dh4tZ5Yn9ENSYPzKfCAjkXP348M
 lHDto5khqcy5QbtNxcqhCzvjspyq9i1wsRULyxF+q3ZVvfK58Qv84JB7CCxJnbfx3tC7ev58ehV
 zy6csg3XLkSnAQrFtCXlBaONoAqOWmXgr1ReVN4zaa0DGC/Kj+rCoOwPyEA==
X-Gm-Gg: AYBFou1qWjLedESf8m5urO3c+JwT+z9NEJMGs6uf3tJwqjR+0mJAWfi57h67/Z9xr7M
 6dXCG9arCwBbGrKT6XRO/UrDdB5JwMswm3s684SoqBsDV2BgkObSj/si/oFcyHZSbGzyxIjZiwV
 7IOHD6HcV/915lisMgCZiSUn8bldb2zEjvwMvOgd1IWsgm/h6jGUVPrW111EElLFaBfqaXnyhky
 lC9gHPI80IO2L+bT385YtTuOiQMkPM+NlLndA1JYu6hylxS7jdHO2iypn+LQJ3Q7NwWHdFXIl7T
 cQPedNkHadnPXY1Wzg9sk/6g7hLR3SKvzD5fuEAoyEp8FBY1iFTRu5lXi4EbzaNgHgOFOxUvmPn
 R8Homm4leN4zDhSXsTI3McWbpPJOn5aSLrUt4yzqjlXshiFesdCSco6+6o3nXY0aoPGev2XBkXY
 qSRejZc89t
X-Received: by 2002:ac8:5753:0:b0:533:36d9:a911 with SMTP id
 d75a77b69052e-555277162a9mr8030531cf.28.1794256340043; 
 Mon, 09 Nov 2026 12:32:20 -0800 (PST)
X-Received: by 2002:ac8:5753:0:b0:533:36d9:a911 with SMTP id
 d75a77b69052e-555277162a9mr8030071cf.28.1794256339472; 
 Mon, 09 Nov 2026 12:32:19 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-555065e4ad7sm6365811cf.0.2026.11.09.12.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:32:18 -0800 (PST)
Message-ID: <5c4f9bdc-7087-428c-ad09-ae09a6713cc1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:32:15 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 21/38] target/riscv: rvv: Implement Zvqwbdota8i
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
 <20261104194155.679241-22-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-22-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfX+CnkmFooJ/vs
 0oasGxFLkKbCqm53zXVUm4M/QvaY1aCr7fH+2m9/JujlM0rafWTjftaXWPHmUc/FM2IfrSjBEck
 7EjBzrFr3bHqkmUsHCrLvKOD9lgdFK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfX0ImOCg35VubA
 KcvoTI9PgtfzerKL3y88dJIq80SUhnjApiaD27+SmQ2oNPuo6zyy614dE8lkHoEAZ9m/vxQQ6eq
 ZFORenvGMyN5/cH2MIsQmRtGGeyJj5Qq+IOgDe46tDmaWBi0EYOOmccD7jqupvYcHvArt02x8X0
 lcgJS/k1iWmOeYrGxEF4gxJoHmlzZw3Q+8so8NeWOkjSh1BwSW+Z9lXa6ve8/9Bh2jA3z+JuFvW
 S4rcGkFpCblkAqfxipV6/Ky9kWRSgaM5Ujvep7QKaeVlCXVlT7JEqbpMjwfAnKeu7kgywsQSsXe
 LVED+DQ/nZtG8TLdi06Lo/1AMOjTsy5GhC0r6Q2NhMeewUN+5oqBe2o3Y68rPOdEDHTIXhiONBd
 SBv+SKMpMe8a756wPddBKjySE3VoacCH/f3Y9Ilk7g+GLACHITQnqvEL93lJcK8aMUG2dy//veG
 IhU5zqppFTUr61QXjNA==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af22dd5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=hEq2d094kF5pygbN9H0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: W2L93DVXP86mEG14jKUF1D1AkvBW_AMN
X-Proofpoint-GUID: W2L93DVXP86mEG14jKUF1D1AkvBW_AMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090081
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Implements the Zvqwbdota8i INT8 dot-product instructions:
> - vqwbdotau.vv
> - vqwbdotas.vv
> 
> The vqwbdotau.vv and vqwbdotas.vv instructions perform batched
> dot-product operations on 8-bit integer vectors, computing 8 parallel
> dot products and accumulating into 32-bit integers.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/helper.h                       |  4 ++
>   target/riscv/insn32.decode                  |  4 ++
>   target/riscv/tcg/insn_trans/trans_rvv.c.inc | 75 +++++++++++++++++++++
>   target/riscv/tcg/vector_helper.c            | 56 +++++++++++++++
>   4 files changed, 139 insertions(+)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 48c64f45748..e48b9b4edec 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1400,6 +1400,10 @@ DEF_HELPER_6(vfwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
>   DEF_HELPER_6(vfqwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
>   DEF_HELPER_6(vfqwdota_alt_vv, void, ptr, ptr, ptr, ptr, env, i32)
>   
> +/* Zvqwbdota8i - 8-bit Integer Batched Dot Product */
> +DEF_HELPER_7(vqwbdotau_vv_b, void, ptr, ptr, ptr, ptr, i32, env, i32)
> +DEF_HELPER_7(vqwbdotas_vv_b, void, ptr, ptr, ptr, ptr, i32, env, i32)
> +
>   /* SiFive Custom int8 Matrix-Multiply */
>   DEF_HELPER_5(sf_vqmaccu_4x8x4, void, ptr, ptr, ptr, env, i32)
>   DEF_HELPER_5(sf_vqmacc_4x8x4, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index def5785f8e2..bf325229100 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -1108,3 +1108,7 @@ vfwdota_vv  100100 . ..... ..... 001 ..... 1110111 @r_vm
>   # *** Zvfqwdota8f OCP FP8 Dot-Product Extension ***
>   vfqwdota_vv     100110 . ..... ..... 001 ..... 1110111 @r_vm
>   vfqwdota_alt_vv 100111 . ..... ..... 001 ..... 1110111 @r_vm
> +
> +# *** Zvqwbdota8i 8-bit Integer Batched Dot-Product Extension ***
> +vqwbdotau_vv  101110 . ..... ..... 000 ..... 1110111 @r_vm
> +vqwbdotas_vv  101111 . ..... ..... 000 ..... 1110111 @r_vm
> diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> index 6eb22494838..bc12bcb9b72 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> @@ -4289,3 +4289,78 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                  \
>   
>   GEN_ZVDOTA_FP8_TRANS(vfqwdota_vv, vext_vfqwdota_check)
>   GEN_ZVDOTA_FP8_TRANS(vfqwdota_alt_vv, vext_vfqwdota_check)
> +
> +static bool vext_zvbdota_base_check(DisasContext *s, arg_rmrr * a,
> +                                    int32_t vd_eew)
> +{
> +    int32_t vlenb = s->cfg_ptr->vlenb;
> +    int32_t vd_emul = MAX(0, vd_eew + 3 - ctzl(vlenb));
> +    uint8_t ci = a->rs2 & 0b111;
> +    int rs2 = a->rs2 & ~0x7;
> +
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           s->vstart_eq_zero &&
> +           (s->lmul == 0) &&
> +           ((ci << (3 + vd_eew)) < vlenb) &&
> +           require_vm(a->vm, a->rd) &&
> +           require_align(a->rd, vd_emul) &&
> +           !is_overlapped(a->rd, 1 << vd_emul, a->rs1, 1) &&
> +           !is_overlapped(a->rd, 1 << vd_emul, rs2, 8) &&
> +           vext_check_input_eew(s, a->rs1, s->sew, rs2, s->sew, a->vm);
> +}
> +
> +static bool vext_vqwbdota_check(DisasContext *s, arg_rmrr *a)
> +{
> +    int32_t sew = s->sew;
> +    int32_t vd_eew = sew + 2;
> +    return vext_zvbdota_base_check(s, a, vd_eew) &&
> +           (s->cfg_ptr->ext_zvqwbdota8i && sew == MO_8);
> +}
> +
> +typedef void gen_helper_zvbdota_int(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr,
> +                                    TCGv_i32, TCGv_env, TCGv_i32);
> +
> +#define GEN_ZVBDOTA_INT_TRANS(NAME, CHECK)                               \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
> +{                                                                        \
> +    static gen_helper_zvbdota_int * const fns[2] = {                     \
> +        gen_helper_##NAME##_b, NULL,                                     \
> +    };                                                                   \
> +    if (CHECK(s, a)) {                                                   \
> +        TCGv_ptr dest, src1, src2, mask;                                 \
> +        TCGv_i32 ci, desc;                                               \
> +        uint32_t data = 0;                                               \
> +        int32_t vd_eew = s->sew + 2;                                     \
> +        int32_t vd_emul = MAX(0, vd_eew + 3 - ctzl(s->cfg_ptr->vlenb));  \
> +                                                                         \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                       \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);                     \
> +        data = FIELD_DP32(data, VDATA, LMUL, vd_emul);                   \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);                     \
> +        data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);   \
> +                                                                         \
> +        dest = tcg_temp_new_ptr();                                       \
> +        mask = tcg_temp_new_ptr();                                       \
> +        src1 = tcg_temp_new_ptr();                                       \
> +        src2 = tcg_temp_new_ptr();                                       \
> +        desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,             \
> +                                          s->cfg_ptr->vlenb, data));     \
> +        ci = tcg_constant_i32((a->rs2 & 0x7) << 3);                      \
> +                                                                         \
> +        tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));             \
> +        tcg_gen_addi_ptr(src1, tcg_env, vreg_ofs(s, a->rs1));            \
> +        tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, a->rs2 & ~0x7));     \
> +        tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));                 \
> +                                                                         \
> +        fns[s->sew](dest, mask, src1, src2, ci, tcg_env, desc);          \
> +                                                                         \
> +        finalize_rvv_inst(s);                                            \
> +                                                                         \
> +        return true;                                                     \
> +    }                                                                    \
> +    return false;                                                        \
> +}
> +
> +GEN_ZVBDOTA_INT_TRANS(vqwbdotau_vv, vext_vqwbdota_check)
> +GEN_ZVBDOTA_INT_TRANS(vqwbdotas_vv, vext_vqwbdota_check)
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index b1ca584f9ef..9e872eccaeb 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -6139,3 +6139,59 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,              \
>   
>   GEN_VEXT_ZVDOTA_FP8(vfqwdota_vv, e4m3)
>   GEN_VEXT_ZVDOTA_FP8(vfqwdota_alt_vv, e5m2)
> +
> +/*
> + * Zvqwbdota8i: 8-bit Integer Batched Dot Product with Accumulation
> + */
> +#define GEN_VEXT_ZVBDOTA_INT(NAME, WD, W1, T2, HD, HS)                       \
> +void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,                  \
> +                  uint32_t ci, CPURISCVState *env, uint32_t desc)            \
> +{                                                                            \
> +    uint32_t vm = vext_vm(desc);                                             \
> +    uint32_t vl = env->vl;                                                   \
> +    uint32_t vta = vext_vta(desc);                                           \
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);                             \
> +    uint32_t vlenb = riscv_cpu_cfg(env)->vlenb;                              \
> +    uint32_t vd_emul = vext_lmul(desc);                                      \
> +    uint32_t total_elems = (vlenb << vd_emul) >> ctzl(sizeof(uint##WD##_t)); \
> +    uint8_t altfmt = FIELD_EX64(env->vtype, VTYPE, ALTFMT);                  \
> +    uint32_t n, k;                                                           \
> +    uint32_t stride = vlenb >> ctzl(sizeof(uint##W1##_t));                   \
> +    uint##WD##_t acc, dot_result, a;                                         \
> +                                                                             \
> +    VSTART_CHECK_EARLY_EXIT(env, vl);                                        \
> +                                                                             \
> +    for (n = 0; n < 8; n++) {                                                \
> +        if (!vm && !vext_elem_mask(v0, ci + n)) {                            \
> +            continue;                                                        \
> +        }                                                                    \
> +                                                                             \
> +        acc = *((uint##WD##_t *)vd + HD(ci + n));                            \
> +        dot_result = 0;                                                      \
> +                                                                             \
> +        for (k = 0; k < vl; k++) {                                           \
> +            uint##WD##_t b = *((T2 *)vs2 + n * stride + HS(k));              \
> +            if (altfmt) {                                                    \
> +                a = *((int##W1##_t *)vs1 + HS(k));                           \
> +            } else {                                                         \
> +                a = *((uint##W1##_t *)vs1 + HS(k));                          \
> +            }                                                                \
> +            dot_result += (a * b);                                           \
> +        }                                                                    \
> +                                                                             \
> +        *((uint##WD##_t *)vd + HD(ci + n)) = acc + dot_result;               \
> +    }                                                                        \
> +                                                                             \
> +    env->vstart = 0;                                                         \
> +                                                                             \
> +    if (ci + 8 < total_elems) {                                              \
> +        if (vta_all_1s) {                                                    \
> +            vext_set_elems_1s(vd, vta,                                       \
> +                              (ci + 8) * sizeof(int##WD##_t),                \
> +                              total_elems * sizeof(int##WD##_t));            \
> +        }                                                                    \
> +    }                                                                        \
> +}
> +
> +GEN_VEXT_ZVBDOTA_INT(vqwbdotau_vv_b, 32, 8, uint8_t, H4, H1)
> +GEN_VEXT_ZVBDOTA_INT(vqwbdotas_vv_b, 32, 8, int8_t, H4, H1)


