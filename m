Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27ECC79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:17:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3cxf-0006Wk-4l; Mon, 07 Sep 2026 13:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3cxc-0006W1-E8
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:16:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3cxa-0000eD-Hn
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:16:48 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687H7mPq512563
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 17:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tKm8qvidRLofJCaGEY/WTB5mlFqgKYJApckUcam/ae0=; b=eYzu0a2JMQezAfE7
 Or6tbdd8IG3wpJ7wBC7RvDDZlETDtjxsa8bQizt0APSRmhuD5gtLN/FasxVeTjcd
 Ad32yix7nQssvcYLAahh5J9ydB7oCMufk3z/Ze07MXNyMir70CUZyP97iFk1NV+b
 pUvSOmESkpIICrEE2cVecmVDgw0ugAF0mOj6B3XE9wmpd117vXbizZayvS0Pa/6F
 XS4vqeT4byWRnAjqQvTjuJQ30f/oCPQVsUV61K8u+gKJyBwEo1Bu6a8Rgk6gFsmh
 zn0x6/FfpWR3xVpzIXfHrkFFHrrlIa986QcUBiW7a7728O6IQ2ddfowXsejERIr3
 7woqCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj310q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 17:16:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-53001b668a6so30813691cf.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788801404; x=1789406204; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tKm8qvidRLofJCaGEY/WTB5mlFqgKYJApckUcam/ae0=;
 b=OyrGWMkuZyG0BlrZDjpB/OUbgVoFlZmC1RusSfDIIdin8MbidD/k1i/6Kn3pCgGJFd
 9fwJt+8jXAHB7lb5sfz1WqIdxn4h/ZsDsl5aIausVGIRK5/0cGEkPVfluX45oqcEBpOr
 6Yy5eolqGAyncdwccvakjfxFny/1GkpvgPpCkpEH1QU6XjsbD1LJL/AXJ2OY0yo0CmNU
 8aD/RmzUZgw2ndIcOMkUepZOCTeJwO5wugXlDGaHa5KJbdycWm1SBajl2d2oRQiRJmwb
 uPdQBxnORi+NbE59d7GRNtuVcv9KCNeeomMa6B6mlkA2iJyojHvn34hIBqWxU4FvqMdV
 FcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788801404; x=1789406204;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tKm8qvidRLofJCaGEY/WTB5mlFqgKYJApckUcam/ae0=;
 b=n/WJQMv/zkJ/jLYoMdxFaAnzlS4JmPj1qQh8gFIdrHssx4r2VGEaD72ubhTNzDvvsh
 cV8DRLAZdhc3Oy8nhb6sZtl3/82sa+j6GhPgQhn0laQYSwV+GSorVw3+VHXSrhBuvqGy
 mMWWpZCVrBS+Cz8XGzU/XCgbIuvOnVRS6/+g3rbPJ9TgrvKXcQZgE06M2UdzIqchJshi
 dX473l+oOuELPBFlKInSgroarYhxZMH7s2HSsx7QXeTfxIexMCN7og70FbTHDW+3o9rb
 0iK8rOkc/op8ljLZ6DOx434HbkVM8XhQvUhj6/9Ew2XzUBCdYehLheXQTOfjnpxGwYV6
 IGyA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4UoEwwatGhsOi/vYh0f9a1dY1Hog2spstaxHnTJix0OGZm47ZY59nSyACGjwd2rE05WJHOMpAQCm3@nongnu.org
X-Gm-Message-State: AFuF++nHC9XI5i2x5/pSN7bcwtDCFiMB1GU5+c6ZMV7Q4CkWOVtLjWAF
 FwgjOkgu1Ioui7XmqSElYajsKgV/XNh9g5odwJjoH+iF5HCBUynNJkCzhCfWeSLlbZkxMnzkzOn
 b3gC7clJFo1kRAtAPzlYv2cc4vmKwTS4c3DHMOvpBmV2lIVdydMKnieNX9Q==
X-Gm-Gg: AYBFou15cNipQsAx/m4IFvsTwnv7SBjLF51MtNrZzuTTiMODP3hJ1kRsPFvZnBluy0O
 aJ4MsEdBh7jvl/PyNQk/sGnWk7P+aDiiqhcH5osepVUtWTRRePgeKcXwNCW2ss9bwDLP8p8V0HM
 3iOcqY7WeygGJDVxS42Ic+QkF/KNjYFwjRQPWfZ3I40XOuXLOFv/X36mG0WvKec8BWbC6wzytE6
 HcL1A4S8yzkMuvXdUKkwVyh123cctASGJxXnbs2oU12cNirLOtviFYcQuliPtp2ya3SuPa2zmFT
 XTOFi1uxh+6EADSqI/UuuaYttvk0ltSuaY5c4T6xPhCgRkGJNAy23zsY+zUs6BVx2KvfTD7QNUq
 aHq4A+muYoBWUnSxTOajGT+JSgPWrL1Rv2Wg=
X-Received: by 2002:a05:622a:2443:b0:530:256c:3718 with SMTP id
 d75a77b69052e-5305494a90cmr284506041cf.38.1788801403836; 
 Mon, 07 Sep 2026 10:16:43 -0700 (PDT)
X-Received: by 2002:a05:622a:2443:b0:530:256c:3718 with SMTP id
 d75a77b69052e-5305494a90cmr284505721cf.38.1788801403356; 
 Mon, 07 Sep 2026 10:16:43 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530868ceb68sm26893771cf.29.2026.09.07.10.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 10:16:42 -0700 (PDT)
Message-ID: <71b4b979-9d14-476b-90b9-918f4f50c2a0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:16:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] target/riscv: mask RV32 XTheadBb th.srri shift amount
To: wangyang <wangyang25@otcaix.iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260905093749.491-1-wangyang25@otcaix.iscas.ac.cn>
 <20260905093749.491-3-wangyang25@otcaix.iscas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260905093749.491-3-wangyang25@otcaix.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE5MiBTYWx0ZWRfXx4dmrnR0BOsR
 23ZYkx7D9gjuNljlyL8MK7Hvz06SkFeIvFhknEbtT6JkHJVTfp0KbVZfDm882giAL3duSm9m/X+
 wDQVj4ItxGQRvggIIVzYFyRjOREXqh6z9MyxcFnI0wIl7cLNSOLgsjuJaOMRRCL8En58Z9J6m84
 hBQVDfrHYBgHy5VAls1UrND5TrAwyQL+7xYI/zrpwigLGlah081Wy/G5Yb6/LSbaJM1ACTVOFEM
 +lrYl8fEy7tMMIVx0cb2y8EDDzum2EXMwhCWBui/KSOkAx0wYkv/IbmjKfFiJXrkYMaTVoKe0Fk
 +lwXGq8+QH9cdUfTOU2gJey5TNUyfj//4mJFXVXLuRYUBP+Pwj71bwQspTC2iZH29uYwTHF7Q/n
 LqbMer7dtYbh0gD2kdYDyDlOd7CjCqbF/oPiGMsIXTsIveRMVmsx0syNt/jP2O9nTl22P8pDhwD
 tFWL08Tj6f9cU/mT3iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE5MiBTYWx0ZWRfX3F0KKwqfheJN
 cYJs4h6/bBOSD1sjNY2DVC9AC2KQ81kVzmc7uEu9IlbJVdnG7nVtqbkmjQGqBVkf8sFaJWagebG
 oDuQBdu8x6TKV/kEvzFegOukFNw2jLI=
X-Proofpoint-ORIG-GUID: Pds4txLYZGKSec1Rmirs4-Sf11eHu7HQ
X-Proofpoint-GUID: Pds4txLYZGKSec1Rmirs4-Sf11eHu7HQ
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9ef17c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=6hpQRmv5nqXfxsFbynUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070192
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



On 9/5/2026 6:37 AM, wangyang wrote:
> The XTheadBb th.srri instruction uses the low log2(XLEN) bits of
> imm6. The generic shift helper rejects values greater than or equal to
> XLEN, which incorrectly rejects imm6 values 32 through 63 on RV32.
> Normalize the operand before calling the helper.
> 
> Tested: RV32 imm6 0, 31, 32, and 63 witnesses with XTheadBb
> enabled and disabled.
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4413
> 
> Signed-off-by: wangyang <wangyang25@otcaix.iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/insn_trans/trans_xthead.c.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_xthead.c.inc b/target/riscv/tcg/insn_trans/trans_xthead.c.inc
> index 681f70e5bc..34226b1be5 100644
> --- a/target/riscv/tcg/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_xthead.c.inc
> @@ -141,6 +141,7 @@ GEN_TRANS_TH_ADDSL(3)
>   static bool trans_th_srri(DisasContext *ctx, arg_th_srri * a)
>   {
>       REQUIRE_XTHEADBB(ctx);
> +    a->shamt &= get_olen(ctx) - 1;
>       return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
>                                      tcg_gen_rotri_tl, gen_roriw, NULL);
>   }


