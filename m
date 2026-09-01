Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3A2C61DD6
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 21:54:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1WQX-0006OP-DC; Tue, 01 Sep 2026 17:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1WQV-0006Nt-SR
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 17:53:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1WQU-0002oV-8D
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 17:53:55 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681KT9HJ147603
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 21:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KP0qegUkgSEw4edjzJT958f76RslNCL03yWxO6ZTYAM=; b=GmvUqbHLYTt2/VWT
 G5DWAadTJD0G1xGe4GY2VY0FG+c4ni262CCZNxFkH9iLIBkUBpWjml1oCY7jilUL
 0lUez1TpNOIIUX1KMj08DT6Q771bvDeb8ufnwiofYBKkvvs0ctBe6ddtp85AJPC8
 fu3CrvMSRn3oaA/Atmltjh1JL7g1nIMEJTirjBRiBviF1nTo6Lcb/RJjIxplvWrq
 GUXmyaFXdhVsN1bNdgTvYcaZn9f8t73wjGMTuQqz/YMiF/H6vomF5fyjOThxTCzx
 cHy6z6sSjw9gifV5o8q65O9fzmTKoJTg5BWtVKpgBYrsjhTvpTc3u1Ln4MpdOUnG
 f/N1aw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9njgsw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 21:53:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52ff59f2c47so8860331cf.1
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788299630; x=1788904430; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KP0qegUkgSEw4edjzJT958f76RslNCL03yWxO6ZTYAM=;
 b=QqKZAHXKir76sy0D98GOrGMozmEjWgrns+Op0jKVHTmw8gouGB8Qp5aY+zAyR162QU
 M379xvK2jnpI+dlhpQxhJq49ZW0/qtUC+ACTElFyQy5/sJxCvuxBfguXXyhe7pPhUqAr
 5aik8tsqM6uNQM1UjkCbNQiBWP9C9CbmRodxrfUBFkes6gcVrHPhnbO8qQacErSrSsX/
 xsUIDCss3I1VbhrW78Kv5QePVAtM5bcs/hdzHlK5RoHpplwv27XR6kQf1ngW8OLy5tGL
 pFAtmvtOS03gX7PLIM6LP4qe7kkWS1qAzsi/RaslGWObTeePslWXoums3RSmXxQ+uX3f
 b1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788299630; x=1788904430;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KP0qegUkgSEw4edjzJT958f76RslNCL03yWxO6ZTYAM=;
 b=YT5GJGW5YQl2ROYZfTKhuUw7yIGbPXJStbokv3CF9p2uQ2RvAC4wuwOIdOu+36dxuM
 bWRc87gZgpQ65mGDzYUqkBQdX9xtuQC+DV3HrjSJX7si06p4ixJjhXWndx4FvBJHhzkX
 k/Ykdtpw3+1Nw6tZt80xoaQhuSek0JB+6RUhJypKZV1bypA5u9m01nL31caffZooz7ef
 Q/lcsvcfFlhVOO26u5qSJhadm01IGy+ntFchT7UgvGx5loTDfh4g338MgeS3DqJhERIP
 mljQymAUUoc7rCiCd+Vvfwwek/tTCzKTiZIN+DymK96hBhFeWgP7msRE0FTXKKsYu3EH
 8Yfw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpTVDzIn79dClXOzTgJtGJXOOwB8zJYmz25e6lYxnyEb5rzULmcNZbou7cFx57fllhp2mrft+JGsJm4@nongnu.org
X-Gm-Message-State: AFuF++m6xqqtWURozedS7T+4qXkLqSnW2iqQeae1NTIBbsDkjGcubcNf
 GGD+1K2hcuHFDSZQfo0M/zhM7sO2oqTTLP3awKicHrB3dxwx7bgx8uibrN9T06dRYmk78mRXlqR
 Bhkvzgv/f8Bzii/jsCWwYkkQXf9WyqBxd3dtmCAe3BPHNP9zHhJxK+xWEtA==
X-Gm-Gg: AR+sD13Aw7boqrNY2Lmt51jW5jU2ANzxiKPXjUGqMbbc/HG/MxeNP6v+/qlLVFPPOdZ
 IDOqMU2gXuo1XkVBCRyQZHe6EcKYwqOUuf+EwMBn3w9j8GVGdQ1MYFU50/DmOzCeMbncd4HEWUK
 ASlRzfslLOXU7MPfSieKXTtPGOKWLPtaUnppV5O4cVXge8rOiYL2fHz3/ehGzaMwUkeFutEaJyB
 G1CCDZRX7xotdSkf8OY//sF+Ng5szXgk3AMRAtBsIOZLRL2NPd/4jXWB/OSMXijPlPteuu/+vK8
 04Dhbz+0BWze0qwXkk5xP4eighDC9z6YdFvmjGWUeZpjrxR/gwgxSgs9pwWtkH/eFtiiBLpeC7A
 5MOfb2bvO0PIelFRnqA/DJKIYqCi9Zy4yD/nD
X-Received: by 2002:a05:622a:156:b0:52d:6f91:86e with SMTP id
 d75a77b69052e-530253c4c2fmr111086881cf.15.1788299629982; 
 Tue, 01 Sep 2026 14:53:49 -0700 (PDT)
X-Received: by 2002:a05:622a:156:b0:52d:6f91:86e with SMTP id
 d75a77b69052e-530253c4c2fmr111086331cf.15.1788299629549; 
 Tue, 01 Sep 2026 14:53:49 -0700 (PDT)
Received: from [192.168.68.101] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9ef0e9b1sm3509186d6.43.2026.09.01.14.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 14:53:48 -0700 (PDT)
Message-ID: <b8ab3fbd-cf37-499b-8efa-26df5fd01fd9@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:53:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: use a targeted TLB page flush for
 sfence.vma with a vaddr operand
To: Trevor Gamblin <tgamblin@baylibre.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260831-riscv_tlb_page_flush-v1-0-4fc6af95673a@baylibre.com>
 <20260831-riscv_tlb_page_flush-v1-3-4fc6af95673a@baylibre.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260831-riscv_tlb_page_flush-v1-3-4fc6af95673a@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE5MiBTYWx0ZWRfX01hlmXsCbg14
 /hkPDeVL8fsWSmiY7eosrbAYQDiLHdoFa7KhxJ2HBIqNsfA05Eu5RFB08K3dXASXT/MDks2Qh5y
 abNnJ+on55sW8SPHJvOtkaKjurkzL10=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE5MiBTYWx0ZWRfX1zGOZoZ4y0c/
 +CduO8wrpkIzTOLqanCWwie698hSDoTDdOF8R2Ag0PZJ0ZG+urYFKLS88CDL75k++UgIEivW3fk
 ZeIUB8tpv9KeT8vl0CPTjSeo86Hy72TaFRDKVieHb+4Yc+xP+zGldLRUZrsSc3hV9XEwFMDc6Uc
 j1i/eq4nLPZ5mSJC0J5zw0VN2LLcEzwh64qe3OSvWbbi/zlziWs1Vlg1DhPhXCLS0NBXiyhahZ+
 m557w991bCIDxBzJlowOfttRxqhPcI22kKOBkLzps8h0yJo/RnNn4IF7LwOGf9uROmOUYHmIi0V
 flAkFV8/Us8xdsS5sBqcUbHIfASGUsEEwA88Cis317ZSgBZ+2omUj23nK+29QP0HX9fnBM87tF2
 OMHSsDxPZ4Kh5aIN8AKb2PZ9CeLB6nUnhtt5RwYWnrvyFsoh97Vvi0OeUXM5yR5ENdGXJo1UJQg
 O4YB/yw2f4BdiWxVqow==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a97496f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=IpJZQVW2AAAA:8 a=8Hkwp5nkjh_TlMOIT6UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: iwiMtZikwUSzSiY1Kneftjw4ATOyx7BV
X-Proofpoint-GUID: iwiMtZikwUSzSiY1Kneftjw4ATOyx7BV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010192
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/31/2026 3:59 PM, Trevor Gamblin wrote:
> sfence.vma unconditionally called helper_tlb_flush(), regardless of the
> rs1 (vaddr) and rs2 (asid) operands, forcing a page-table walk on the
> next access. Use helper_tlb_flush_page() whenever rs1 != 0, falling back
> to the existing full flush for rs1 == 0. This makes RISC-V behaviour
> more similar to ARM's equivalent (tlbi_aa64_vae1_write), which already
> does tlb_flush_page_by_mmuidx() instead of a full flush.
> 
> Pass get_address(ctx, a->rs1, 0) to gen_helper_tlb_flush_page() rather
> than get_gpr(), so that the address being passed matches the current
> addr_xl width regardless of '-cpu' input. Otherwise, the raw register
> value can carry garbage above that width and never match the address the
> TLB entry was actually filled under, so the flush silently misses and a
> stale mapping survives.
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   target/riscv/tcg/insn_trans/trans_privileged.c.inc | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> index a8eaccef67..8655fa332e 100644
> --- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> @@ -155,7 +155,11 @@ static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
>   {
>   #ifndef CONFIG_USER_ONLY
>       decode_save_opc(ctx, 0);
> -    gen_helper_tlb_flush(tcg_env);
> +    if (a->rs1 == 0) {
> +        gen_helper_tlb_flush(tcg_env);
> +    } else {
> +        gen_helper_tlb_flush_page(tcg_env, get_address(ctx, a->rs1, 0));
> +    }

As I said in patch 2 I believe patch 2 and 3 should be squashed.

LGTM otherwise.  That's a nice performance boost for a handful of lines.  If only
all optimizations were like that :)



Thanks,
Daniel

>       return true;
>   #endif
>       return false;
> 


