Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4F606A330
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORqdyTKX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B6EXgzP7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQW90-0007qv-Sp; Mon, 09 Nov 2026 15:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW8x-0007n9-Ab
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:39:08 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW8u-0008Lr-UA
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:39:06 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HGwge4125811
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1+M57gGlvqJvpTBPUDmftOAD8ZcI2Qa2pxM6GermS10=; b=ORqdyTKXjNO4PwCQ
 iZA2+VJuoR3KEINJvjGRv5iHkzCG+95b1ecCMwmMT2LNn2R6FvYYbJCujTh4oujt
 DLqUAb/bqHiZkB7pF8JKGJ8MNVrM3QwD+hrCtRQ7HJxb8bzq+0DxTNLhd3AR/920
 mkfFp3JH2FKn79oMVShlX5LFA/UnqGLN5yBCc6GmhMC+bpswtJiZGcrJssCHKGS4
 giAOgkKdVun/AaROK0f48uiafbFRmR8W7Mk4HnK6oFRV5LAonDNa0pIdH6P9v7Qo
 Lyqs4iH6ZSIM4kj91ZCBK31KzkHEzdmSA9p5x9xBHcCSZQIhO+AxeEg5Z7rOoBg6
 p2/+cw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj9y50-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:38:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c046843f1so33185126d6.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256739; x=1794861539; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1+M57gGlvqJvpTBPUDmftOAD8ZcI2Qa2pxM6GermS10=;
 b=B6EXgzP7G638w3dnaTyyMXVY95YM7MOFro1dMKHSjCFFScZCtbckr0fV4F2oryvyAU
 MgnQij0yQDYlljYyJMs5pHTjn/BZuXG8OFVHDxgRo1p/PaDivN9mRPsAoJ5hHwXX0SWU
 TIZzFm2LYlZHBx4lB8tMgF9Xi/CcmjXNAunSc1qDzuy8f8p2krNyBqOdaC91yjjklmU7
 hlmji90/V4s3uAGOkyIWfo9vCpSCEy1+I7A2gvoLD6Yw7CC2yYS72CNeNEA2XVr0Mt9w
 uOpGim6WD1Qdn8hz+Y/jDbIny5l3n5QctJb4wcOnHowaqyVoHTk0e5Ed5yf1ioRzaNFG
 plVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256739; x=1794861539;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1+M57gGlvqJvpTBPUDmftOAD8ZcI2Qa2pxM6GermS10=;
 b=j53UV6sTyyb2wJ40mJGY8ddiOggHWcJrUlk8ZLteLxVVZqKHXoumEYSMYBSmhtbzD0
 QwHRQtT5NcXxAiaGTjiZJ9Fw97+iknps/UuRwoRAvHHjsHc6i3qIUKZ6o4bQAHGp86I/
 C3m8YHaLDEhi9pGqasqnb3g0OI4qS3/xEzWF3t0xh4ek74KPB30AnHfJrhkuuNr7JG8X
 3qwHeLGs723NlCADxK0mUGGq6W3HmFsUDx28ygGGuwU8aWC+u+6LrhLhEWe7qzEnAlM7
 udK5xPUUEEX43swl6EQ1VH5jfW91L/KiJvK1EQEVQXUtHblLQEynDDqOQO5t1aw+KbMC
 hYhQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGkqQWtQ+tXo8CYEnvMylrCcDKVXWI6Fa1ZeILN9DD/uVFZKx5/PGrLa11K3LDNLkDii2olUTtkceRf@nongnu.org
X-Gm-Message-State: APuU4Z/G8+7icUwFP5lXXxezChDMdXgtWzFbd8zPyJU+esgJ0EyejvS3
 snchL+LEon5J0faEKtW5uws3wBFIgQRcxGriACCdD9A6H9I8089R8gNes/xZOholtOYAEvGbViP
 iUHpGJh7Kh75nJVikEXhp0eOjW4vAhzSnjBwulaWItmErhpSolJRpKVMv2g==
X-Gm-Gg: AYBFou2oBPPsdnUrALzWqn/1UJMFAN30T2qcDAnq3pHKs8P4JfkIrZ7fFeinF4CaSyY
 b+5LE1TutnxAEbmDGToW71wGpWxV52WZRBWLlp8Ubykz7yacOxy940FbzAGEzMKt5ponI9a+BVb
 k6878GoiRV56bCglkxMaXIGKegmrvaStYoiowmmYKOVNqFt/oxT+ZWWkpTPlSjnm9mA/0ufSOkt
 tMFG0iVSs5VXfORZGxzFaCAgiriNl036zDm1b3WmKt+QNWos+WjJY6W2qsFm6vdV+wv2cfEG7Ob
 HbIjq+edQFaHLDoJ06PaB+Pov2VfncguRjzkkG8KXPhzrp34BPB6JGydfVC/g9hh7Xtqhhw8NAA
 5GLipYfJ7f8w4ktq2FUypkE9OfLB6s5UwAS7NhqGvtaIVnMWPYQf0a5VkcVyLOdbPfavTGO9Q77
 D9Imhmabo+
X-Received: by 2002:a05:6214:3d8d:b0:91b:8059:5037 with SMTP id
 6a1803df08f44-91eef7d7aa1mr15805286d6.32.1794256738657; 
 Mon, 09 Nov 2026 12:38:58 -0800 (PST)
X-Received: by 2002:a05:6214:3d8d:b0:91b:8059:5037 with SMTP id
 6a1803df08f44-91eef7d7aa1mr15804756d6.32.1794256738026; 
 Mon, 09 Nov 2026 12:38:58 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef0543c8esm4462366d6.40.2026.11.09.12.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:38:57 -0800 (PST)
Message-ID: <12b9e49f-7750-4025-888f-b32e8433f77c@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:38:54 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 25/38] target/riscv: rvv: Implement Zvqwbdota16i
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
 <20261104194155.679241-26-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-26-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6fVTBujB4BA4az7EGLt6AZFL18T94K30
X-Proofpoint-ORIG-GUID: 6fVTBujB4BA4az7EGLt6AZFL18T94K30
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af22f63 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=wjfkqwm889CuopmVNFcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX+eovXKkKGPvj
 cFs8xSL5tKwFp1uFD/i4s0gkygwVwOWkWLCZcU7lLCDCr282ABdp20yx+g95fJno7jNOulJrvOU
 wcRZ/MGirhEHaEclbqNYXUG/29pz+uw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX3qII92NpRsNE
 a/tMhKLWjlGP7NM4PtQl+oPeN2rhiLhx2U0edgRifIl3Nvm7mdLVXZGd6TmPljBFZfvSUXvQGEO
 ZVrbVyuNwmD1Giwij/cZX5Wbp8BSzzfDrfHbPRkBqx5WoUIoh9w1o/7nqXyZSe7kogktBnbOKiy
 272m2KyYp1Kv+YpWLYvS/S7kS1+/WWeWtw9JysSK9spJrol6AwpDQYsoefctp8gV6Eh6XgbiaEO
 fImg2ytJE4Nxev/8QatnClraNkyvH+JmQf4mU0Axqwmp+Wv6nLGyljeKb+vWwB1fsYyMNygGwGO
 qZ8fItqa+lQ0AtjF4akMqeNVs89D9BeY4MlixSJKrZ/GOnqu3JEmUPw/0VB2s41omcycgJVqfYO
 zXVifi4Tut659XpF1ba05h0pMa/E8WXR2I3F31kR4/CvVSv8d5HVPkobDtLvet7Kx2/PRgDN+qI
 +wxWtzeVDJdf0ffSt9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090082
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Extend the vqwbdotau.vv and vqwbdotas.vv instructions to support
> both 8-bit (Zvqwbdota8i) and 16-bit (Zvqwbdota16i) batched
> dot-product operations.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/helper.h                       | 4 +++-
>   target/riscv/insn32.decode                  | 2 +-
>   target/riscv/tcg/insn_trans/trans_rvv.c.inc | 5 +++--
>   target/riscv/tcg/vector_helper.c            | 2 ++
>   4 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index e48b9b4edec..84571a999f4 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1400,9 +1400,11 @@ DEF_HELPER_6(vfwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
>   DEF_HELPER_6(vfqwdota_vv, void, ptr, ptr, ptr, ptr, env, i32)
>   DEF_HELPER_6(vfqwdota_alt_vv, void, ptr, ptr, ptr, ptr, env, i32)
>   
> -/* Zvqwbdota8i - 8-bit Integer Batched Dot Product */
> +/* Zvqwbdota8i/Zvqwbdota16i - 8/16-bit Integer Batched Dot Product */
>   DEF_HELPER_7(vqwbdotau_vv_b, void, ptr, ptr, ptr, ptr, i32, env, i32)
>   DEF_HELPER_7(vqwbdotas_vv_b, void, ptr, ptr, ptr, ptr, i32, env, i32)
> +DEF_HELPER_7(vqwbdotau_vv_h, void, ptr, ptr, ptr, ptr, i32, env, i32)
> +DEF_HELPER_7(vqwbdotas_vv_h, void, ptr, ptr, ptr, ptr, i32, env, i32)
>   
>   /* SiFive Custom int8 Matrix-Multiply */
>   DEF_HELPER_5(sf_vqmaccu_4x8x4, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index bf325229100..8a06547a570 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -1109,6 +1109,6 @@ vfwdota_vv  100100 . ..... ..... 001 ..... 1110111 @r_vm
>   vfqwdota_vv     100110 . ..... ..... 001 ..... 1110111 @r_vm
>   vfqwdota_alt_vv 100111 . ..... ..... 001 ..... 1110111 @r_vm
>   
> -# *** Zvqwbdota8i 8-bit Integer Batched Dot-Product Extension ***
> +# *** Zvqwbdota8i/Zvqwbdota16i Integer Batched Dot-Product Extension ***
>   vqwbdotau_vv  101110 . ..... ..... 000 ..... 1110111 @r_vm
>   vqwbdotas_vv  101111 . ..... ..... 000 ..... 1110111 @r_vm
> diff --git a/target/riscv/tcg/insn_trans/trans_rvv.c.inc b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> index bc12bcb9b72..650affc045b 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvv.c.inc
> @@ -4315,7 +4315,8 @@ static bool vext_vqwbdota_check(DisasContext *s, arg_rmrr *a)
>       int32_t sew = s->sew;
>       int32_t vd_eew = sew + 2;
>       return vext_zvbdota_base_check(s, a, vd_eew) &&
> -           (s->cfg_ptr->ext_zvqwbdota8i && sew == MO_8);
> +           ((s->cfg_ptr->ext_zvqwbdota8i && sew == MO_8) ||
> +            (s->cfg_ptr->ext_zvqwbdota16i && s->sew == MO_16));
>   }
>   
>   typedef void gen_helper_zvbdota_int(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr,
> @@ -4325,7 +4326,7 @@ typedef void gen_helper_zvbdota_int(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr,
>   static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
>   {                                                                        \
>       static gen_helper_zvbdota_int * const fns[2] = {                     \
> -        gen_helper_##NAME##_b, NULL,                                     \
> +        gen_helper_##NAME##_b, gen_helper_##NAME##_h,                    \
>       };                                                                   \
>       if (CHECK(s, a)) {                                                   \
>           TCGv_ptr dest, src1, src2, mask;                                 \
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index 5ea073b6d76..683b14f28f3 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -6197,3 +6197,5 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,                  \
>   
>   GEN_VEXT_ZVBDOTA_INT(vqwbdotau_vv_b, 32, 8, uint8_t, H4, H1)
>   GEN_VEXT_ZVBDOTA_INT(vqwbdotas_vv_b, 32, 8, int8_t, H4, H1)
> +GEN_VEXT_ZVBDOTA_INT(vqwbdotau_vv_h, 64, 16, uint16_t, H8, H2)
> +GEN_VEXT_ZVBDOTA_INT(vqwbdotas_vv_h, 64, 16, int16_t, H8, H2)


