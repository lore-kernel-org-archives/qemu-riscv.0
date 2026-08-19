Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8792AC5DF85
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 16:10:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwirt-0008GV-Hg; Wed, 19 Aug 2026 12:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wwirr-0008Fz-MP
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 12:10:19 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wwirq-0000oI-0A
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 12:10:19 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c999f162c9aso760056a12.3
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1787155816; x=1787760616; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=N5k8iI9ddDwB1USK9A9PV/6m61r1JqDVegOl0mOVc3M=;
 b=f2ZLkT0QWKf2p2Ln9SbqVctibxyFXeDDOEfp0kdtGIQ0lcaS39Ie+lRVRACbTDEUpw
 H7tEucR+IfbGlPVLuQEETYBjs3Tl3PLvZ725fx1k0yBew5hoFvocoQeX/DsGQvj9N3eF
 RM6lpWRuzTNQfcSZRZEMbiSukpALRmbL0rYIRVilp9S9VYT/eZVnUEVBOMcSEjP4fTfY
 1hj0C5w0IxbvUx0pigEVHk0bo3y4aB9Y4ah/rbAshNzOdse0j0ZrGtrpKSekV/fmnSYc
 apPyQTY1gGcmNGrYRuV9OOyJNWDpOAMgLeiwjApJVtniJdoeUaTQnFM8nwbZreLq88X8
 lQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787155816; x=1787760616;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N5k8iI9ddDwB1USK9A9PV/6m61r1JqDVegOl0mOVc3M=;
 b=UdE/vj0VW/9GfK8dL4aOWSmEIa8wh1cSBYrYFyg6n7ejk9DclTK+DPu8MUmyL5nFhC
 uKrBtoB43Uj7p6K2PdLdlQKfsj0Y84sQvN9vG2iCvRQGSSV6pm1yLajUfd4DEjueLpJw
 N7Vnm7pN8/qcm6FaW3tw4Q1UxTEIKVKKOOPKkB7mAoy+8I3S2AeZMSQ5zb8V5lMpchot
 TmBAPl63qF4zwOQEVH12LsZreB5PEpOg5YigfHM7DVZ4vHrBv0oZICsa1UeYDy3ggfkr
 rwhE74eP1jUrokVwPOEQfDTlzgbCRLYHSyyyDAwW+L0lpV+lXir+IaiWzHbK884eEjrZ
 EqBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq/+rIrzTSO9T0r//4a1CYEEcCwtr5Ms03KW7WHO+1gUMmB+FsHtfbXUw0vL3Mmzqtky6+13YDl3nxd@nongnu.org
X-Gm-Message-State: AFuF++mlZrYNlpdEmJyqrXP2Ba+PRHXc17r833tuMwSDsApQ4sLmTdMa
 D4D/I+qBvuhDUcHRGTntZhJspkHJYLo9u7mwfvBwWeVph73ERK0bNKPXSyzZCt+Ajh4=
X-Gm-Gg: AR+sD13qKHmHC39M0BJu7mSzlxmhKAxtbsDgr8W7szqmmL5Lz6yvkUJyPbXAU/mcExL
 4QtTpbLIvKvk+gxb/rZqvZxeH9kJGFK/XDijOS4UcT+3VmQHBP2jDDabLkVlujE87j7E+UZwMFE
 baENjh+qz26OQDx2V5JvLEv0Hy47Y0urdNS5ZGx6LTGzDNSyN5wbnsrEC6uiX3VKRFrdv0qOkGU
 PVRxBgviI2b04PBAHWF4LvMMQbNG3UkLu7C2AwRp3Epc7zXuPs+xz1IRjWDNR5v+skoHQX4+gnr
 O6opTHciN1XyVIkHprxvElhiTM4ZEXE3edGGoiy8xo5KtWKswlbKKmieuIoN35p2Bf7AyLdqmaR
 mncjMbirEA6fIf4ak6SyooQNEbxQCAfHa/CQrihKhjIz2SrkKGpvEOy1ezLYFOCmktZG6vjhNEx
 XsPELZRI2luSQgeY39qU+qAjs2f1tgilFGRYUMYnf47wn81m36hwHSRl0lenlxNiU1nwX1Xxfa6
 sg38yLh3cugXd+0i7mPY26ibgTED1D/a6Y=
X-Received: by 2002:a17:90b:2792:b0:395:5404:95 with SMTP id
 98e67ed59e1d1-3958108bb19mr12077549a91.12.1787155815880; 
 Wed, 19 Aug 2026 09:10:15 -0700 (PDT)
Received: from sifive.com ([136.226.240.165]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957fb304easm3070184a91.14.2026.08.19.09.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 09:10:15 -0700 (PDT)
Date: Thu, 20 Aug 2026 00:10:11 +0800
From: Max Chou <max.chou@sifive.com>
To: Molly Chen <xiaoou@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 06/18] target/riscv: Add packed SIMD shift instructions
Message-ID: <aoXO5KIBKDQZSdd4@sifive.com>
References: <cover.1784280142.git.xiaoou@iscas.ac.cn>
 <193352ab49c6febc51250ececb4c431ffa165be6.1784280142.git.xiaoou@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <193352ab49c6febc51250ececb4c431ffa165be6.1784280142.git.xiaoou@iscas.ac.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2026-07-17 10:06, Molly Chen wrote:
> Signed-off-by: Molly Chen <xiaoou@iscas.ac.cn>
> ---
>  target/riscv/helper.h                       |  43 ++++++
>  target/riscv/insn32.decode                  |  57 ++++++++
>  target/riscv/tcg/insn_trans/trans_rvp.c.inc |  43 ++++++
>  target/riscv/tcg/psimd_helper.c             | 149 ++++++++++++++++++++
>  4 files changed, 292 insertions(+)
...
> diff --git a/target/riscv/tcg/psimd_helper.c b/target/riscv/tcg/psimd_helper.c
> index 034afe5a054..8b106a336f5 100644
> --- a/target/riscv/tcg/psimd_helper.c
> +++ b/target/riscv/tcg/psimd_helper.c
> @@ -1903,3 +1903,152 @@ GEN_PSIMD_BINOP(mslt, uint32_t, int32_t, uint32_t,
>  GEN_PSIMD_BINOP(msltu, uint32_t, uint32_t, uint32_t,
>                  EXTRACT32, INSERT32, ELEMS_W, PSIMD_DO_LT_MASK)
>  
> +/* Shift operations (immediate and register) */
> +
> +GEN_PSIMD_SHIFTOP(pslli_b, target_ulong, uint8_t, uint8_t,
> +                  EXTRACT8, INSERT8, ELEMS_B, 0x07, PSIMD_DO_SLL)
> +GEN_PSIMD_SHIFTOP(psll_bs, target_ulong, uint8_t, uint8_t,
> +                  EXTRACT8, INSERT8, ELEMS_B, 0x07, PSIMD_DO_SLL)

The spec instead specifies a uniform 5-bit mask (shamt = X[rs2][4:0]),
regardless of element width.
So the SHMASK should be 0x1f for PSLL/PSRL/PSRA.[BS|HS] instructions.

...

> +
> +/**
> + * SSHAR - 32-bit scalar variable shift with rounding and saturation
> + */
> +uint32_t HELPER(sshar)(CPURISCVState *env, uint32_t rs1, uint32_t rs2)
> +{
> +    int32_t a = (int32_t)rs1;
> +    int8_t shamt = (int8_t)(rs2 & 0xFF);
> +    int sat = 0;
> +    int32_t res;
> +
> +    if (shamt >= 0) {
> +        int64_t shifted = (int64_t)a << shamt;
> +        res = signed_saturate_w(shifted, &sat);
> +    } else {
> +        int right = -shamt;
> +        if (right >= 32) {
> +            res = (a < 0) ? -1 : 0;

According to the p ext isa spec, SSHAR here extracts a sign-filled
33-bit value and then applies RNU rounding. The result here should be
0 for both positive and negative inputs.

> +        } else {
> +            int64_t rounded = ((a >> (right - 1)) + 1) >> 1;

Here may has undefined behavior for negative sources at in-range
amounts.

I think that we could extract the SSHAR implementation from
GEN_PSIMD_VAR_SSHAR and share it between here and
GEN_PSIMD_VAR_SSHAR.

rnax

