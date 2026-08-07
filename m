Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F563C2A09B
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 15:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsMFr-0006OP-Tt; Fri, 07 Aug 2026 11:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsMFo-0006N9-1u
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:13:00 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsMFl-0004l8-7r
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 11:12:59 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677CgDnI263855
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 15:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BTwkOrmxEGHfXBg2R4ZnvDkntQbyu8KMxZeWXabhPJo=; b=kTvGoqa1ShlDErLG
 B6kHgZhxENiiLzOLZIGKwaLaAad0qj5e/3aULYSFiUWIO2jbaPjeonO/E4BCNQYT
 TbuJQT7i+6otEuqs218EiFvvhalGbrX5C11p2KIwVula9vcTVHdaIiGKQaOOXI9z
 2EfVrtQrfvwjE5hrcTxUImPur0AHeJ40FSi43CcJLF2RqiufV2spjz0WtjZfk9HD
 ZLNJ2pt6AXBwGCtViQjbi8HYUXq5PJk24XM48Y4+GZKSs3AFPHKWgJXPdGi48yPi
 8oFhN9AejvlpC2BuKR2lrWNQ/b79BX0jQudF5VVTmByJ6On8+178zy75ulReboMS
 F6Lp1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu21dr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 15:12:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9349c5af52bso611308485a.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786115575; x=1786720375; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BTwkOrmxEGHfXBg2R4ZnvDkntQbyu8KMxZeWXabhPJo=;
 b=SiuCZD3gAzYZ8kerTqWSvOENTXuBEp9/GW/QDjXj12hmo5skL5UhFPQHonJLAX4C6z
 L9naFTUVC95bo84JriW1vw/NLIycujHzzgc/XOcx/ULHERaQzy5HvC5IQ4Wot4PmtowU
 FCjKg/YC8ncFDEWJ98wxJCvaTs/Q1p4umZtOoP2QjNAVRvC0ZFCeZLBjMq7CFpCglRLm
 ORp5eOu04Adi3XTHN2CmqcrzFYAidUInG1IA8uiCPqUcMu9QJQ8X80Amah5GgZsPOb1t
 wHLU2bclcETsNS0ZjxWRNRhDzyPTSPMbhGFDruYenDdCyV/UoM6kmU5n4q0JfkAkDFsC
 ZHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786115575; x=1786720375;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BTwkOrmxEGHfXBg2R4ZnvDkntQbyu8KMxZeWXabhPJo=;
 b=Rfd6Omwm+kJjRR9hsVrUAz0DbOOYVVb3b0JaTqW9jZly1p5peCd0FEHr3S0jHxTlyL
 y4V/am+i+ltdMP5rTgwvBupk13EF8fHrtM7umj315ekb3rElUus15BeEq4U7+hv10dwl
 Gd2mHNOcy8ZKUteFnBegmLs+QNmOz7HXRsDaG7t2lZgtTA+XUWLYpJAzgvO+5F0BleME
 be8QtlhsvzX+1UtNkS5xCXCK+IDSPI4Xai8s/62gIXRZCyzw9ywBclmQsRoZ9Aog70Gc
 rlxuefUJy7DM/CxTlXu66TtG6uvpWHgrb7mS6UU+SXDL1ZRtFMHZOlk0HvZgs2B3RQdc
 RsYA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpj95MiyCPzIhNY+zl4OesCyXCxbaGrWBe9vICvpz8gTSUV2qzmzGZOoHOk/NuWTLNQQQiw3HdVMpxz@nongnu.org
X-Gm-Message-State: AOJu0YyNHQcyx1g1FvMjN8PKhn9p93L0aI06H+G+Ro/7F5eb/ArAHfsw
 VtX/xl+VgXsMPOkWwRkF2FZ8P/8hsxba2lX4Jto258HAOsaYbwZrjguP0e+gxwG3e9pKzORkK68
 QBjRMtbnRBC2M6hFe1z5lfwrMoNorsR+7vkmq0T7sQmoZiFVlA3lhCv7PLg==
X-Gm-Gg: AR+sD10mv6ZLFxfQOeXpP/N1hEjWcUI+7XLTAHoBSd27EpZ0pFYHn5oW42Omo5gGO9H
 PZ4W2kpck+yAZ5PooC1qDe7giAR2dWdHXh9HShnwZKQp6pYtk19L1CMgw/6v8YRqwHzkxMSD5+Q
 SG835Y3DPSWAOIG/6bbyB8D6BaE1WWPkXOWwZru2T/hoAlcIKpizzbDjs0l7+hJSG51pzOdRVAT
 grMKewNL1TwZdROF0xyKl3QSB6dnaMTBFCYLa1KXeIyDoj2DLuu1yRtOI5HxPxXmWK1dgqKe+A9
 bjoIpxCoqdw9B9AInBoWP2fN1UvAuvvj6OTQ0coB0DMGMre90D2KYtkWZXi8KeTFM7O16Jn7d8C
 0pxeujbnae+ykAP4g50l04O5DVjr3owwkUcB3
X-Received: by 2002:a05:620a:950a:b0:930:a718:bafb with SMTP id
 af79cd13be357-9367978f467mr83402985a.10.1786115574650; 
 Fri, 07 Aug 2026 08:12:54 -0700 (PDT)
X-Received: by 2002:a05:620a:950a:b0:930:a718:bafb with SMTP id
 af79cd13be357-9367978f467mr83396885a.10.1786115574157; 
 Fri, 07 Aug 2026 08:12:54 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9366e274b3asm166688585a.37.2026.08.07.08.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 08:12:53 -0700 (PDT)
Message-ID: <7d5e3e9f-136e-4082-998d-9f035ff2f170@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 12:12:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] target/riscv: Support raising misaligned
 exceptions for floating-point loads/stores
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
References: <20260805164345.698208-1-frank.chang@sifive.com>
 <20260805164345.698208-6-frank.chang@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805164345.698208-6-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fWxIOrWQo0Q1D3qLGH6uhYdiLwqwIn3E
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a75f5f7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=1n3FIi9wMlNCWemWLOcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX2zd+pktwe43o
 b3sDarEoeaYv9zfLKBeFkj77VlXlXM9WMyz96LlUXIClF77ZlVo1IPfmxgsXKTvay1vyC6FG6CZ
 wTB+jBiht9Hept9jxoEay2mSuOxRaJo=
X-Proofpoint-GUID: fWxIOrWQo0Q1D3qLGH6uhYdiLwqwIn3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDExOSBTYWx0ZWRfX2jM5T7xGc+I2
 jIQ57S46h7brwEx78WoPp/rF156a30czuDH5+Txvibbz+yso6ZnPL+AA5viaaDzF/0npCX/i7vb
 hHMK+HZIMIYzozhspsrubiHWUAJVqZIGmGO6RIGQdNutaCb3ayXhoKnw4U17R/hldNvHhIcOwPh
 cEJNB3VibjbXqAQ62xTdWmp//UGG33L6DG1j66Dv0qWhpn+XeWOABAGrtknfl0BKOuugX36z2Oy
 xeqoMKG7V74DxV/rTddKA5p6w0G4+LENsXFTtGSOz+rtWWNh9DXvuuWVY4Dn8G7P1TWwymUNp8z
 hokjDOXFUCH7JJF0p6c2Rwt5daAxeY3UZiDtwObsla7LqLlr8tjCMme9Aw8y8mL7/0kO95myEsr
 Ys2c07tVB6YcTenqLlRDfmhi5QWaxipxwPzT7tTe4IxrGa/J97h2J0TxWcqaAYJRuDGIhqeriIj
 AFu8uo1BW/G44bt72wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070119
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
> When the Zicclsm extension is not enabled, raise misaligned load/store
> exceptions for misaligned accesses from floating-point load/store
> instructions (RVF, RVD, Zfh).
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/insn_trans/trans_rvd.c.inc   | 6 ++++++
>   target/riscv/tcg/insn_trans/trans_rvf.c.inc   | 6 ++++++
>   target/riscv/tcg/insn_trans/trans_rvzfh.c.inc | 6 ++++++
>   3 files changed, 18 insertions(+)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvd.c.inc b/target/riscv/tcg/insn_trans/trans_rvd.c.inc
> index 3b9a745520a..1be2bee9465 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvd.c.inc
> @@ -61,6 +61,9 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>           memop |= MO_ATOM_IFALIGN;
>       }
>       memop |= ctx->mo_endianness;
> +    if (!ctx->cfg_ptr->ext_zicclsm) {
> +        memop |= MO_ALIGN;
> +    }
>   
>       decode_save_opc(ctx, 0);
>       addr = get_address(ctx, a->rs1, a->imm);
> @@ -86,6 +89,9 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>           memop |= MO_ATOM_IFALIGN;
>       }
>       memop |= ctx->mo_endianness;
> +    if (!ctx->cfg_ptr->ext_zicclsm) {
> +        memop |= MO_ALIGN;
> +    }
>   
>       decode_save_opc(ctx, 0);
>       addr = get_address(ctx, a->rs1, a->imm);
> diff --git a/target/riscv/tcg/insn_trans/trans_rvf.c.inc b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
> index e935523c93c..481f7282da7 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
> @@ -52,6 +52,9 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>       if (ctx->cfg_ptr->ext_zama16b) {
>           memop |= MO_ATOM_WITHIN16;
>       }
> +    if (!ctx->cfg_ptr->ext_zicclsm) {
> +        memop |= MO_ALIGN;
> +    }
>   
>       decode_save_opc(ctx, 0);
>       addr = get_address(ctx, a->rs1, a->imm);
> @@ -75,6 +78,9 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>       if (ctx->cfg_ptr->ext_zama16b) {
>           memop |= MO_ATOM_WITHIN16;
>       }
> +    if (!ctx->cfg_ptr->ext_zicclsm) {
> +        memop |= MO_ALIGN;
> +    }
>   
>       decode_save_opc(ctx, 0);
>       addr = get_address(ctx, a->rs1, a->imm);
> diff --git a/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc b/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
> index f36b46c2118..88711fb0769 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvzfh.c.inc
> @@ -50,6 +50,9 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>       REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
>   
>       memop |= ctx->mo_endianness;
> +    if (!ctx->cfg_ptr->ext_zicclsm) {
> +        memop |= MO_ALIGN;
> +    }
>       decode_save_opc(ctx, 0);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>       if (a->imm) {
> @@ -75,6 +78,9 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>       REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
>   
>       memop |= ctx->mo_endianness;
> +    if (!ctx->cfg_ptr->ext_zicclsm) {
> +        memop |= MO_ALIGN;
> +    }
>       decode_save_opc(ctx, 0);
>       t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>       if (a->imm) {


