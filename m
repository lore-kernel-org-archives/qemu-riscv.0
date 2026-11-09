Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094FA606A339
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TilaU1ia;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnt6+YU8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQW4f-00078j-D4; Mon, 09 Nov 2026 15:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW3N-0006Q7-3x
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:33:32 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW3I-0007nB-TM
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:33:19 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHEY9879372
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vVaHhZtuYn3eGFHpSIWVgo4pRWYw/mhN2RLIPvYjJIg=; b=TilaU1iax7VAA7hb
 aD7PmgZx+7sTMVSpM21I60gW3o11Y0FbHO5Qj/ZqLi2CLDibTOuRUkIwMfNQ6euf
 582RnX3mac6G8i+89ZCEC9tLjWal5SBTlPNVc3MPIFLsnRaEFd+yb8xBWN1GcW3c
 aS4lzxXqUc0CEyJwynWwerGIx0BPrzNxgzK3vJiXEMrxNklHh3xcLXZreJSpznTk
 Qy0vrC5R077czv+ML97ts51+xH8CYlC+ItkeWwi0EPhyLiVq8opPM/SMtAhv+uWs
 hTZ1zGHvUABh4XivOMF0LJc9bs7j1UgvDYE+gDfThYLCApQmjK80JvRCn8Y3XlmK
 gVo3cw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5t2bv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:33:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91eaad6eaeaso24102716d6.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256386; x=1794861186; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vVaHhZtuYn3eGFHpSIWVgo4pRWYw/mhN2RLIPvYjJIg=;
 b=fnt6+YU8VEDlWTdbQ+aF+4ekG265aBSrNzM277mWEY5u9aQyZ8bmRF6rCaDxoR6/Ps
 kmUod9881GXii43QVjW2E4NnQRU9IEUYsm3opX5proIJXxlhoExkl53PX4U8rgpZvfYa
 ZEUng0jY3izhYAh9MW71O7h/MAgv0KsnlDddWh41qcxkEAXHvPEMnPeD1+QR73MY6Cgn
 AgvIsaMlfUdakQifNRzIwprvQIIO6XSKyrW5nELWdaVPezuyfEaBAuU4KxTF1ToX1WIi
 PQ9YlIJ9BH/7cxXcxKaEXIw3tgnzT8M02Bwf0/873feZqXPxYE3e6hpvdGsT5hzc5XXD
 Xl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256386; x=1794861186;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vVaHhZtuYn3eGFHpSIWVgo4pRWYw/mhN2RLIPvYjJIg=;
 b=TX+7hhVp2iIKJzjQwXLPzmCRCri8+BcN3ACQmRw5rqrMv95pbO6htEcZUHq5/JAM46
 N0mWE6SQQtnjK5gjR4CdAcLhCJU2oEeYfxCW2Mu+e1N17Nljg6APV9phmhJqqwYxMQ5A
 XqTP+LmPhBQfl0NuEa3drS6EkAzpVZhseA1Epm27I/miGEmvIqqDan/KUkIQilYQpD8x
 oUdnB2BApHuviV1NeL36Qv3tEG3b4inRTD06tiDIvmn1dtQ5qCq/mlJ+yHn3Qdyt8RkD
 uAF3B0uani9XR+NBPjPfmtnptycY/E9zSV1WyR5hRwGAaPoT98hVFbB7rTKGFcVjJYBw
 m7lg==
X-Forwarded-Encrypted: i=1;
 AL+hErGzz3Oueo5HEp6BBnZM2XKwgD0muk8uBFBF5fzH+l+AW8vVjVtto/HdLoFDb5XbxukulzS4GP8KPwpF@nongnu.org
X-Gm-Message-State: APuU4Z+g4wKI02NPHNOcjGuPeDKAOooCUp/n7lW5EAEs0DUL1jESkIs7
 nzzJleR5MvqvYDlFyIIpaHbRjLFw2dDo47XBf2EgfpPjalZkvugdi27lGwHbjV3Wbzxs8TMuZYr
 X5otR6Y0W/kRD5BuYgl2l7e22iexHDbEm6BK6WLrTHdRbQBvRPNse5cjx+SOlhU6WTg==
X-Gm-Gg: AYBFou0eLd/XmPbJ6P1IH3wDkQ/XJ5tWek1AubxCOgmZnqtANmP7jEfvuxEmcp9knKq
 T1G9/hHqiRGHRbZNF2QwBTheZRFZFQ/h83BHdLgW11v+uDfN7I0D/AfylKRYEcVqajuumkvRp33
 4Lbck128PzVCe2/NeaP6VkAJvVKJ0jEGRoUzPpYeDaxHbs7A33+ARr5VRnbAmjlu2vx4nl9eqvj
 vHS23XNMNrbIFophAV52SQuiSUSEi3GnXsJ5fiVta8WVMfEXHm5Fi7n/CuPNgLWBldT2UtAh+r/
 veMuXo4kVs9nIdKY9VSWv3LvBIIpoaDZUslX/My/5C2xdAhKgR0Yj5gpD49vFmWAUHzo55HEenn
 OhJbd+IwkCoGnNBw0tQR4xuK3SQry/ia7nBVM0eDeLiaooyBV2A4Qv2YjgzIhfJVDFeJqL3oOIp
 EB2sP9Dt+j
X-Received: by 2002:a05:6214:29ec:b0:91b:d5d7:8c84 with SMTP id
 6a1803df08f44-91eef5e13c5mr14247886d6.7.1794256385829; 
 Mon, 09 Nov 2026 12:33:05 -0800 (PST)
X-Received: by 2002:a05:6214:29ec:b0:91b:d5d7:8c84 with SMTP id
 6a1803df08f44-91eef5e13c5mr14247346d6.7.1794256385219; 
 Mon, 09 Nov 2026 12:33:05 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04b01c8sm4421376d6.10.2026.11.09.12.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:33:04 -0800 (PST)
Message-ID: <84403cca-b624-4ac5-9678-ffeceeb77c1d@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:33:01 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 23/38] target/riscv: Add cfg property for Zvqwbdota16i
 extension
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
 <20261104194155.679241-24-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-24-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfXwc49ijiwE4mR
 QAnfy+NXYgnqGj+yqlxEAxiXsNydKm7pJ+GlN/IQrSvLX6PFt8OCG4SNB106DHTYku9kHvmy2//
 COLtVxRS7Y5HjuKeuakPSkmnRXn8H0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfX4/Or0LPTAeNV
 HiXMx5iUJ2InNeKK0MXmZawek9+6SE26cf3HynczbvDnfYcm0ou3cA4RTkPjfINb6gSZvr1rn0Y
 5o4MlcjmuoetzF/zBmJles/TjqoY/uOX01k7+akE4eNWW/4Hd0yFGeVsak8QIHb7znAsEIlh9T4
 CZ3shIiwjDP0ZimipVY/qeLiVJTk/ROxAMtxpbR+gYJY7DaqM5IF2ICHuDxrnQ4RXyN0wS6Cott
 yWVweez1zjvt9Heu47Lpbfk4PO6qtOhFBoFLpNbRZRoLtp3ALefDLUtWt/WIP+b8vt1NBoZHDHY
 dCBDRyk1exg9iwqQA/oAY8XQraPk6qDNikm9M2V9S1GmmRlEG6RYX8LCU6NThfcI/1fwxtQRBQK
 o+Y8mj0MUNmPcBFkePHsXZWJQ2yFQGA89z+ipdnr1WOxZFR7DZfWV8iDHumkGy49JNm/C32mM4Q
 lu9NZlCVzDFczMCezQg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af22e02 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=RypaF7NShuVFdLthz2oA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: lSNj9O7UNswPygthqxqR7Afft0n96Xtk
X-Proofpoint-GUID: lSNj9O7UNswPygthqxqR7Afft0n96Xtk
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



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add CPU configuration property of Zvqwbdota16i extension which depends on
> the Zve64x extension per the specification.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c                | 2 ++
>   target/riscv/cpu_cfg_fields.h.inc | 1 +
>   target/riscv/tcg/tcg-cpu.c        | 5 +++++
>   target/riscv/tcg/vector_helper.c  | 2 ++
>   4 files changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 26d5ac69c75..99c82b898f0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -254,6 +254,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
>       ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
>       ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
> +    ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwbdota16i, PRIV_VERSION_1_13_0,
> +                                    ext_zvqwbdota16i),
>       ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwbdota8i, PRIV_VERSION_1_13_0,
>                                       ext_zvqwbdota8i),
>       ISA_EXPERIMENTAL_EXT_DATA_ENTRY(zvqwdota16i, PRIV_VERSION_1_13_0,
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 3d822432d48..83a3d8a7f9d 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -108,6 +108,7 @@ BOOL_FIELD(ext_zvfh)
>   BOOL_FIELD(ext_zvfhmin)
>   BOOL_FIELD(ext_zvfqwdota8f)
>   BOOL_FIELD(ext_zvfwdota16bf)
> +BOOL_FIELD(ext_zvqwbdota16i)
>   BOOL_FIELD(ext_zvqwbdota8i)
>   BOOL_FIELD(ext_zvqwdota16i)
>   BOOL_FIELD(ext_zvqwdota8i)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 782e38b608e..8735cf94f35 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -716,6 +716,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zvqwbdota16i && !cpu->cfg.ext_zve64x) {
> +        error_setg(errp, "Zvqwbdota16i extension depends on Zve64x extension");
> +        return;
> +    }
> +
>       if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
>           error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
>           return;
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index 9e872eccaeb..5ea073b6d76 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -42,6 +42,7 @@ static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)
>       if (riscv_cpu_cfg(env)->ext_zvfbfa ||
>           riscv_cpu_cfg(env)->ext_zvfqwdota8f ||
>           riscv_cpu_cfg(env)->ext_zvfwdota16bf ||
> +        riscv_cpu_cfg(env)->ext_zvqwbdota16i ||
>           riscv_cpu_cfg(env)->ext_zvqwbdota8i ||
>           riscv_cpu_cfg(env)->ext_zvqwdota16i ||
>           riscv_cpu_cfg(env)->ext_zvqwdota8i) {
> @@ -101,6 +102,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>       case MO_16:
>           ill_altfmt &= !(cpu->cfg.ext_zvfbfa ||
>                           cpu->cfg.ext_zvfwdota16bf ||
> +                        cpu->cfg.ext_zvqwbdota16i ||
>                           cpu->cfg.ext_zvqwdota16i);
>           break;
>       default:


