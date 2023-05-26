Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85141C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:26:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2MD9-0008Dg-CK; Thu, 25 May 2023 21:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MD8-0008DM-0y; Thu, 25 May 2023 21:25:42 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MD3-0004mW-GW; Thu, 25 May 2023 21:25:41 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-456fbddd3e8so57742e0c.3; 
 Thu, 25 May 2023 18:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064336; x=1687656336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JUBNR7UyDzBMfqjFHxHhs00FTmVR/UdbM5KHmGAjgE=;
 b=N+X/SrZWYPZpEhhyxCnQrTUizD19u+dSyXfm0qWuLdr9QslBUDEuThtawNR7pyTeZ2
 YQxVr4cLNdsJaJ8Fo5hUMLJXvGVqUQ4Xzsx6KtKkr1Sw21tIkBQa1y0YXS8FbQ/+WM/n
 sWKFAmqm9Zd1R11IgQM9MY4yUf0qfpq3GI5lYOJXRU3Oi6l8ZRu7fvYIiSbvDHXlTGwG
 oRHcU6pbmuFaIPvl+US/BkfWQuFqlpS0HtU4gUwU0RrBALW8oJeV+QODeAQMbKfrDpWF
 zJCuNAT3B1EUOmoP8rVpHJdtWJ8MStKz/sJKLYKj3ZaoXJBql+EIru11mAi4PNsS4GAw
 44ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064336; x=1687656336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7JUBNR7UyDzBMfqjFHxHhs00FTmVR/UdbM5KHmGAjgE=;
 b=gDrFfP8mjrIZ1bpIfj/WSrXgsnw9oW2StDZB5pGjFYcWTKk82wQMb0eupGFbZSwMfY
 Eowpjtv6rU8gi0Y++mNFCy/DqcIozSiBqwlMDUJTKI6zaDBwWOdjLLRbPndnWcGqoYtk
 qHC7SVo3hWKLtb40ce8fMesqXQLdiZz/j24U99aLUs3ZZ2Gly0AXhOShrK+rGN3GJNeO
 k1LsG3ClpaDLpFju0L0R0FcAMYe3+3IZgStBwHIQg4iqY8qUjlwXoD5Nb/G3+UiraWbW
 d+VMVWX4lPmaaMsYBJbWsssWz82kfa9z15RxYlYaV7O585zZAMIrgebbmdd4sgmkg8pe
 zGRA==
X-Gm-Message-State: AC+VfDyIhADHedj/THLpDfxu0HbEXPSjfysNtvtXUlsSoX0Y/LFo+620
 rNoQNW42t2XDtxeCAzzpmOqtwEN5YVeudjptQsE=
X-Google-Smtp-Source: ACHHUZ5Vq7/Mk1TMv4JgTmLf559Ij7Js6NA8q3gt5KxkKHSxAkkepcLTZXLhPuwEp55pZmQUlfVm5nKvzTuyIHSxBEw=
X-Received: by 2002:a1f:e202:0:b0:456:d63e:c4ea with SMTP id
 z2-20020a1fe202000000b00456d63ec4eamr70222vkg.16.1685064335714; Thu, 25 May
 2023 18:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:25:09 +1000
Message-ID: <CAKmqyKNBOuGX5FdF3kfq9E9enO8SawsL=Jiw=APxvKR+4Bu7xA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] disas/riscv.c: Remove unused decomp_rv32/64 value
 for vector instructions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 23, 2023 at 7:38=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Currently decomp_rv32 and decomp_rv64 value in opcode_data for vector
> instructions are the same op index as their own. And they have no
> functional decomp_data. So they have no functional difference from just
> leaving them as zero.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 740 +++++++++++++++++++++++++-------------------------
>  1 file changed, 370 insertions(+), 370 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 108bc2127d..a8eca47da2 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1730,376 +1730,376 @@ const rv_opcode_data opcode_data[] =3D {
>      { "zip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "xperm4", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "vle8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle8=
_v, rv_op_vle8_v, 0 },
> -    { "vle16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle=
16_v, rv_op_vle16_v, 0 },
> -    { "vle32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle=
32_v, rv_op_vle32_v, 0 },
> -    { "vle64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle=
64_v, rv_op_vle64_v, 0 },
> -    { "vse8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse8=
_v, rv_op_vse8_v, 0 },
> -    { "vse16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse=
16_v, rv_op_vse16_v, 0 },
> -    { "vse32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse=
32_v, rv_op_vse32_v, 0 },
> -    { "vse64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse=
64_v, rv_op_vse64_v, 0 },
> -    { "vlm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vlm_v=
, rv_op_vlm_v, 0 },
> -    { "vsm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vsm_v=
, rv_op_vsm_v, 0 },
> -    { "vlse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vl=
se8_v, rv_op_vlse8_v, 0 },
> -    { "vlse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
lse16_v, rv_op_vlse16_v, 0 },
> -    { "vlse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
lse32_v, rv_op_vlse32_v, 0 },
> -    { "vlse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
lse64_v, rv_op_vlse64_v, 0 },
> -    { "vsse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vs=
se8_v, rv_op_vsse8_v, 0 },
> -    { "vsse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
sse16_v, rv_op_vsse16_v, 0 },
> -    { "vsse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
sse32_v, rv_op_vsse32_v, 0 },
> -    { "vsse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
sse64_v, rv_op_vsse64_v, 0 },
> -    { "vluxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vluxei8_v, rv_op_vluxei8_v, 0 },
> -    { "vluxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vluxei16_v, rv_op_vluxei16_v, 0 },
> -    { "vluxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vluxei32_v, rv_op_vluxei32_v, 0 },
> -    { "vluxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vluxei64_v, rv_op_vluxei64_v, 0 },
> -    { "vloxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vloxei8_v, rv_op_vloxei8_v, 0 },
> -    { "vloxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vloxei16_v, rv_op_vloxei16_v, 0 },
> -    { "vloxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vloxei32_v, rv_op_vloxei32_v, 0 },
> -    { "vloxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vloxei64_v, rv_op_vloxei64_v, 0 },
> -    { "vsuxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vsuxei8_v, rv_op_vsuxei8_v, 0 },
> -    { "vsuxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsuxei16_v, rv_op_vsuxei16_v, 0 },
> -    { "vsuxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsuxei32_v, rv_op_vsuxei32_v, 0 },
> -    { "vsuxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsuxei64_v, rv_op_vsuxei64_v, 0 },
> -    { "vsoxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vsoxei8_v, rv_op_vsoxei8_v, 0 },
> -    { "vsoxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsoxei16_v, rv_op_vsoxei16_v, 0 },
> -    { "vsoxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsoxei32_v, rv_op_vsoxei32_v, 0 },
> -    { "vsoxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsoxei64_v, rv_op_vsoxei64_v, 0 },
> -    { "vle8ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
e8ff_v, rv_op_vle8ff_v, 0 },
> -    { "vle16ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
le16ff_v, rv_op_vle16ff_v, 0 },
> -    { "vle32ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
le32ff_v, rv_op_vle32ff_v, 0 },
> -    { "vle64ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
le64ff_v, rv_op_vle64ff_v, 0 },
> -    { "vl1re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
1re8_v, rv_op_vl1re8_v, 0 },
> -    { "vl1re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l1re16_v, rv_op_vl1re16_v, 0 },
> -    { "vl1re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l1re32_v, rv_op_vl1re32_v, 0 },
> -    { "vl1re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l1re64_v, rv_op_vl1re64_v, 0 },
> -    { "vl2re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
2re8_v, rv_op_vl2re8_v, 0 },
> -    { "vl2re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l2re16_v, rv_op_vl2re16_v, 0 },
> -    { "vl2re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l2re32_v, rv_op_vl2re32_v, 0 },
> -    { "vl2re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l2re64_v, rv_op_vl2re64_v, 0 },
> -    { "vl4re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
4re8_v, rv_op_vl4re8_v, 0 },
> -    { "vl4re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l4re16_v, rv_op_vl4re16_v, 0 },
> -    { "vl4re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l4re32_v, rv_op_vl4re32_v, 0 },
> -    { "vl4re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l4re64_v, rv_op_vl4re64_v, 0 },
> -    { "vl8re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
8re8_v, rv_op_vl8re8_v, 0 },
> -    { "vl8re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l8re16_v, rv_op_vl8re16_v, 0 },
> -    { "vl8re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l8re32_v, rv_op_vl8re32_v, 0 },
> -    { "vl8re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l8re64_v, rv_op_vl8re64_v, 0 },
> -    { "vs1r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs1r=
_v, rv_op_vs1r_v, 0 },
> -    { "vs2r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs2r=
_v, rv_op_vs2r_v, 0 },
> -    { "vs4r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs4r=
_v, rv_op_vs4r_v, 0 },
> -    { "vs8r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs8r=
_v, rv_op_vs8r_v, 0 },
> -    { "vadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vadd_vv=
, rv_op_vadd_vv, 0 },
> -    { "vadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vadd_vx=
, rv_op_vadd_vx, 0 },
> -    { "vadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vadd_vi=
, rv_op_vadd_vi, 0 },
> -    { "vsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsub_vv=
, rv_op_vsub_vv, 0 },
> -    { "vsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsub_vx=
, rv_op_vsub_vx, 0 },
> -    { "vrsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrsub_=
vx, rv_op_vrsub_vx, 0 },
> -    { "vrsub.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vrsub_=
vi, rv_op_vrsub_vi, 0 },
> -    { "vwaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd=
u_vv, rv_op_vwaddu_vv, 0 },
> -    { "vwaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd=
u_vx, rv_op_vwaddu_vx, 0 },
> -    { "vwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd_=
vv, rv_op_vwadd_vv, 0 },
> -    { "vwadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd_=
vx, rv_op_vwadd_vx, 0 },
> -    { "vwsubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub=
u_vv, rv_op_vwsubu_vv, 0 },
> -    { "vwsubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub=
u_vx, rv_op_vwsubu_vx, 0 },
> -    { "vwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub_=
vv, rv_op_vwsub_vv, 0 },
> -    { "vwsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub_=
vx, rv_op_vwsub_vx, 0 },
> -    { "vwaddu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd=
u_wv, rv_op_vwaddu_wv, 0 },
> -    { "vwaddu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd=
u_wx, rv_op_vwaddu_wx, 0 },
> -    { "vwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd_=
wv, rv_op_vwadd_wv, 0 },
> -    { "vwadd.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd_=
wx, rv_op_vwadd_wx, 0 },
> -    { "vwsubu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub=
u_wv, rv_op_vwsubu_wv, 0 },
> -    { "vwsubu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub=
u_wx, rv_op_vwsubu_wx, 0 },
> -    { "vwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub_=
wv, rv_op_vwsub_wv, 0 },
> -    { "vwsub.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub_=
wx, rv_op_vwsub_wx, 0 },
> -    { "vadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vadc_v=
vm, rv_op_vadc_vvm, 0 },
> -    { "vadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vadc_v=
xm, rv_op_vadc_vxm, 0 },
> -    { "vadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vadc_v=
im, rv_op_vadc_vim, 0 },
> -    { "vmadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmadc=
_vvm, rv_op_vmadc_vvm, 0 },
> -    { "vmadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmadc=
_vxm, rv_op_vmadc_vxm, 0 },
> -    { "vmadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vmadc=
_vim, rv_op_vmadc_vim, 0 },
> -    { "vsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vsbc_v=
vm, rv_op_vsbc_vvm, 0 },
> -    { "vsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vsbc_v=
xm, rv_op_vsbc_vxm, 0 },
> -    { "vmsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmsbc=
_vvm, rv_op_vmsbc_vvm, 0 },
> -    { "vmsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmsbc=
_vxm, rv_op_vmsbc_vxm, 0 },
> -    { "vand.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vand_vv=
, rv_op_vand_vv, 0 },
> -    { "vand.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vand_vx=
, rv_op_vand_vx, 0 },
> -    { "vand.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vand_vi=
, rv_op_vand_vi, 0 },
> -    { "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vor_vv, =
rv_op_vor_vv, 0 },
> -    { "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vor_vx, =
rv_op_vor_vx, 0 },
> -    { "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vor_vi, =
rv_op_vor_vi, 0 },
> -    { "vxor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vxor_vv=
, rv_op_vxor_vv, 0 },
> -    { "vxor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vxor_vx=
, rv_op_vxor_vx, 0 },
> -    { "vxor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vxor_vi=
, rv_op_vxor_vi, 0 },
> -    { "vsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsll_vv=
, rv_op_vsll_vv, 0 },
> -    { "vsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsll_vx=
, rv_op_vsll_vx, 0 },
> -    { "vsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsll_v=
i, rv_op_vsll_vi, 0 },
> -    { "vsrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsrl_vv=
, rv_op_vsrl_vv, 0 },
> -    { "vsrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsrl_vx=
, rv_op_vsrl_vx, 0 },
> -    { "vsrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsrl_v=
i, rv_op_vsrl_vi, 0 },
> -    { "vsra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsra_vv=
, rv_op_vsra_vv, 0 },
> -    { "vsra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsra_vx=
, rv_op_vsra_vx, 0 },
> -    { "vsra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsra_v=
i, rv_op_vsra_vi, 0 },
> -    { "vnsrl.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnsrl_=
wv, rv_op_vnsrl_wv, 0 },
> -    { "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnsrl_=
wx, rv_op_vnsrl_wx, 0 },
> -    { "vnsrl.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnsrl=
_wi, rv_op_vnsrl_wi, 0 },
> -    { "vnsra.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnsra_=
wv, rv_op_vnsra_wv, 0 },
> -    { "vnsra.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnsra_=
wx, rv_op_vnsra_wx, 0 },
> -    { "vnsra.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnsra=
_wi, rv_op_vnsra_wi, 0 },
> -    { "vmseq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmseq_=
vv, rv_op_vmseq_vv, 0 },
> -    { "vmseq.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmseq_=
vx, rv_op_vmseq_vx, 0 },
> -    { "vmseq.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmseq_=
vi, rv_op_vmseq_vi, 0 },
> -    { "vmsne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsne_=
vv, rv_op_vmsne_vv, 0 },
> -    { "vmsne.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsne_=
vx, rv_op_vmsne_vx, 0 },
> -    { "vmsne.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsne_=
vi, rv_op_vmsne_vi, 0 },
> -    { "vmsltu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmslt=
u_vv, rv_op_vmsltu_vv, 0 },
> -    { "vmsltu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmslt=
u_vx, rv_op_vmsltu_vx, 0 },
> -    { "vmslt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmslt_=
vv, rv_op_vmslt_vv, 0 },
> -    { "vmslt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmslt_=
vx, rv_op_vmslt_vx, 0 },
> -    { "vmsleu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsle=
u_vv, rv_op_vmsleu_vv, 0 },
> -    { "vmsleu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsle=
u_vx, rv_op_vmsleu_vx, 0 },
> -    { "vmsleu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsle=
u_vi, rv_op_vmsleu_vi, 0 },
> -    { "vmsle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsle_=
vv, rv_op_vmsle_vv, 0 },
> -    { "vmsle.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsle_=
vx, rv_op_vmsle_vx, 0 },
> -    { "vmsle.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsle_=
vi, rv_op_vmsle_vi, 0 },
> -    { "vmsgtu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsgt=
u_vx, rv_op_vmsgtu_vx, 0 },
> -    { "vmsgtu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsgt=
u_vi, rv_op_vmsgtu_vi, 0 },
> -    { "vmsgt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsgt_=
vx, rv_op_vmsgt_vx, 0 },
> -    { "vmsgt.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsgt_=
vi, rv_op_vmsgt_vi, 0 },
> -    { "vminu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vminu_=
vv, rv_op_vminu_vv, 0 },
> -    { "vminu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vminu_=
vx, rv_op_vminu_vx, 0 },
> -    { "vmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmin_vv=
, rv_op_vmin_vv, 0 },
> -    { "vmin.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmin_vx=
, rv_op_vmin_vx, 0 },
> -    { "vmaxu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmaxu_=
vv, rv_op_vmaxu_vv, 0 },
> -    { "vmaxu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmaxu_=
vx, rv_op_vmaxu_vx, 0 },
> -    { "vmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmax_vv=
, rv_op_vmax_vv, 0 },
> -    { "vmax.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmax_vx=
, rv_op_vmax_vx, 0 },
> -    { "vmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmul_vv=
, rv_op_vmul_vv, 0 },
> -    { "vmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmul_vx=
, rv_op_vmul_vx, 0 },
> -    { "vmulh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmulh_=
vv, rv_op_vmulh_vv, 0 },
> -    { "vmulh.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmulh_=
vx, rv_op_vmulh_vx, 0 },
> -    { "vmulhu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmulh=
u_vv, rv_op_vmulhu_vv, 0 },
> -    { "vmulhu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmulh=
u_vx, rv_op_vmulhu_vx, 0 },
> -    { "vmulhsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmul=
hsu_vv, rv_op_vmulhsu_vv, 0 },
> -    { "vmulhsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmul=
hsu_vx, rv_op_vmulhsu_vx, 0 },
> -    { "vdivu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vdivu_=
vv, rv_op_vdivu_vv, 0 },
> -    { "vdivu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vdivu_=
vx, rv_op_vdivu_vx, 0 },
> -    { "vdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vdiv_vv=
, rv_op_vdiv_vv, 0 },
> -    { "vdiv.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vdiv_vx=
, rv_op_vdiv_vx, 0 },
> -    { "vremu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vremu_=
vv, rv_op_vremu_vv, 0 },
> -    { "vremu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vremu_=
vx, rv_op_vremu_vx, 0 },
> -    { "vrem.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vrem_vv=
, rv_op_vrem_vv, 0 },
> -    { "vrem.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrem_vx=
, rv_op_vrem_vx, 0 },
> -    { "vwmulu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmul=
u_vv, rv_op_vwmulu_vv, 0 },
> -    { "vwmulu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmul=
u_vx, rv_op_vwmulu_vx, 0 },
> -    { "vwmulsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmu=
lsu_vv, rv_op_vwmulsu_vv, 0 },
> -    { "vwmulsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmu=
lsu_vx, rv_op_vwmulsu_vx, 0 },
> -    { "vwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmul_=
vv, rv_op_vwmul_vv, 0 },
> -    { "vwmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmul_=
vx, rv_op_vwmul_vx, 0 },
> -    { "vmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vmacc_=
vv, rv_op_vmacc_vv, 0 },
> -    { "vmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vmacc_=
vx, rv_op_vmacc_vx, 0 },
> -    { "vnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vnmsa=
c_vv, rv_op_vnmsac_vv, 0 },
> -    { "vnmsac.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vnmsa=
c_vx, rv_op_vnmsac_vx, 0 },
> -    { "vmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vmadd_=
vv, rv_op_vmadd_vv, 0 },
> -    { "vmadd.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vmadd_=
vx, rv_op_vmadd_vx, 0 },
> -    { "vnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vnmsu=
b_vv, rv_op_vnmsub_vv, 0 },
> -    { "vnmsub.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vnmsu=
b_vx, rv_op_vnmsub_vx, 0 },
> -    { "vwmaccu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwma=
ccu_vv, rv_op_vwmaccu_vv, 0 },
> -    { "vwmaccu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwma=
ccu_vx, rv_op_vwmaccu_vx, 0 },
> -    { "vwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwmac=
c_vv, rv_op_vwmacc_vv, 0 },
> -    { "vwmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwmac=
c_vx, rv_op_vwmacc_vx, 0 },
> -    { "vwmaccsu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwm=
accsu_vv, rv_op_vwmaccsu_vv, 0 },
> -    { "vwmaccsu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwm=
accsu_vx, rv_op_vwmaccsu_vx, 0 },
> -    { "vwmaccus.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwm=
accus_vx, rv_op_vwmaccus_vx, 0 },
> -    { "vmv.v.v", rv_codec_v_r, rv_fmt_vd_vs1, NULL, rv_op_vmv_v_v, rv_op=
_vmv_v_v, 0 },
> -    { "vmv.v.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, rv_op_vmv_v_x, rv_op=
_vmv_v_x, 0 },
> -    { "vmv.v.i", rv_codec_v_i, rv_fmt_vd_imm, NULL, rv_op_vmv_v_i, rv_op=
_vmv_v_i, 0 },
> -    { "vmerge.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmer=
ge_vvm, rv_op_vmerge_vvm, 0 },
> -    { "vmerge.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmer=
ge_vxm, rv_op_vmerge_vxm, 0 },
> -    { "vmerge.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vmer=
ge_vim, rv_op_vmerge_vim, 0 },
> -    { "vsaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsadd=
u_vv, rv_op_vsaddu_vv, 0 },
> -    { "vsaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsadd=
u_vx, rv_op_vsaddu_vx, 0 },
> -    { "vsaddu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vsadd=
u_vi, rv_op_vsaddu_vi, 0 },
> -    { "vsadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsadd_=
vv, rv_op_vsadd_vv, 0 },
> -    { "vsadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsadd_=
vx, rv_op_vsadd_vx, 0 },
> -    { "vsadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vsadd_=
vi, rv_op_vsadd_vi, 0 },
> -    { "vssubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssub=
u_vv, rv_op_vssubu_vv, 0 },
> -    { "vssubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssub=
u_vx, rv_op_vssubu_vx, 0 },
> -    { "vssub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssub_=
vv, rv_op_vssub_vv, 0 },
> -    { "vssub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssub_=
vx, rv_op_vssub_vx, 0 },
> -    { "vaadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vaadd_=
vv, rv_op_vaadd_vv, 0 },
> -    { "vaadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vaadd_=
vx, rv_op_vaadd_vx, 0 },
> -    { "vaaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vaadd=
u_vv, rv_op_vaaddu_vv, 0 },
> -    { "vaaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vaadd=
u_vx, rv_op_vaaddu_vx, 0 },
> -    { "vasub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vasub_=
vv, rv_op_vasub_vv, 0 },
> -    { "vasub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vasub_=
vx, rv_op_vasub_vx, 0 },
> -    { "vasubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vasub=
u_vv, rv_op_vasubu_vv, 0 },
> -    { "vasubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vasub=
u_vx, rv_op_vasubu_vx, 0 },
> -    { "vsmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsmul_=
vv, rv_op_vsmul_vv, 0 },
> -    { "vsmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsmul_=
vx, rv_op_vsmul_vx, 0 },
> -    { "vssrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssrl_=
vv, rv_op_vssrl_vv, 0 },
> -    { "vssrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssrl_=
vx, rv_op_vssrl_vx, 0 },
> -    { "vssrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vssrl=
_vi, rv_op_vssrl_vi, 0 },
> -    { "vssra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssra_=
vv, rv_op_vssra_vv, 0 },
> -    { "vssra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssra_=
vx, rv_op_vssra_vx, 0 },
> -    { "vssra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vssra=
_vi, rv_op_vssra_vi, 0 },
> -    { "vnclipu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vncl=
ipu_wv, rv_op_vnclipu_wv, 0 },
> -    { "vnclipu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vncl=
ipu_wx, rv_op_vnclipu_wx, 0 },
> -    { "vnclipu.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnc=
lipu_wi, rv_op_vnclipu_wi, 0 },
> -    { "vnclip.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vncli=
p_wv, rv_op_vnclip_wv, 0 },
> -    { "vnclip.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vncli=
p_wx, rv_op_vnclip_wx, 0 },
> -    { "vnclip.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vncl=
ip_wi, rv_op_vnclip_wi, 0 },
> -    { "vfadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfadd_=
vv, rv_op_vfadd_vv, 0 },
> -    { "vfadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfadd_=
vf, rv_op_vfadd_vf, 0 },
> -    { "vfsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsub_=
vv, rv_op_vfsub_vv, 0 },
> -    { "vfsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsub_=
vf, rv_op_vfsub_vf, 0 },
> -    { "vfrsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfrsu=
b_vf, rv_op_vfrsub_vf, 0 },
> -    { "vfwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwad=
d_vv, rv_op_vfwadd_vv, 0 },
> -    { "vfwadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwad=
d_vf, rv_op_vfwadd_vf, 0 },
> -    { "vfwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwad=
d_wv, rv_op_vfwadd_wv, 0 },
> -    { "vfwadd.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwad=
d_wf, rv_op_vfwadd_wf, 0 },
> -    { "vfwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwsu=
b_vv, rv_op_vfwsub_vv, 0 },
> -    { "vfwsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwsu=
b_vf, rv_op_vfwsub_vf, 0 },
> -    { "vfwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwsu=
b_wv, rv_op_vfwsub_wv, 0 },
> -    { "vfwsub.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwsu=
b_wf, rv_op_vfwsub_wf, 0 },
> -    { "vfmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmul_=
vv, rv_op_vfmul_vv, 0 },
> -    { "vfmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmul_=
vf, rv_op_vfmul_vf, 0 },
> -    { "vfdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfdiv_=
vv, rv_op_vfdiv_vv, 0 },
> -    { "vfdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfdiv_=
vf, rv_op_vfdiv_vf, 0 },
> -    { "vfrdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfrdi=
v_vf, rv_op_vfrdiv_vf, 0 },
> -    { "vfwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwmu=
l_vv, rv_op_vfwmul_vv, 0 },
> -    { "vfwmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwmu=
l_vf, rv_op_vfwmul_vf, 0 },
> -    { "vfmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmac=
c_vv, rv_op_vfmacc_vv, 0 },
> -    { "vfmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmac=
c_vf, rv_op_vfmacc_vf, 0 },
> -    { "vfnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
acc_vv, rv_op_vfnmacc_vv, 0 },
> -    { "vfnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
acc_vf, rv_op_vfnmacc_vf, 0 },
> -    { "vfmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmsa=
c_vv, rv_op_vfmsac_vv, 0 },
> -    { "vfmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmsa=
c_vf, rv_op_vfmsac_vf, 0 },
> -    { "vfnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
sac_vv, rv_op_vfnmsac_vv, 0 },
> -    { "vfnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
sac_vf, rv_op_vfnmsac_vf, 0 },
> -    { "vfmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmad=
d_vv, rv_op_vfmadd_vv, 0 },
> -    { "vfmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmad=
d_vf, rv_op_vfmadd_vf, 0 },
> -    { "vfnmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
add_vv, rv_op_vfnmadd_vv, 0 },
> -    { "vfnmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
add_vf, rv_op_vfnmadd_vf, 0 },
> -    { "vfmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmsu=
b_vv, rv_op_vfmsub_vv, 0 },
> -    { "vfmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmsu=
b_vf, rv_op_vfmsub_vf, 0 },
> -    { "vfnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
sub_vv, rv_op_vfnmsub_vv, 0 },
> -    { "vfnmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
sub_vf, rv_op_vfnmsub_vf, 0 },
> -    { "vfwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwm=
acc_vv, rv_op_vfwmacc_vv, 0 },
> -    { "vfwmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwm=
acc_vf, rv_op_vfwmacc_vf, 0 },
> -    { "vfwnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfw=
nmacc_vv, rv_op_vfwnmacc_vv, 0 },
> -    { "vfwnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfw=
nmacc_vf, rv_op_vfwnmacc_vf, 0 },
> -    { "vfwmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwm=
sac_vv, rv_op_vfwmsac_vv, 0 },
> -    { "vfwmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwm=
sac_vf, rv_op_vfwmsac_vf, 0 },
> -    { "vfwnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfw=
nmsac_vv, rv_op_vfwnmsac_vv, 0 },
> -    { "vfwnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfw=
nmsac_vf, rv_op_vfwnmsac_vf, 0 },
> -    { "vfsqrt.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfsqrt_v, rv_=
op_vfsqrt_v, 0 },
> -    { "vfrsqrt7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfrsqrt7_v,=
 rv_op_vfrsqrt7_v, 0 },
> -    { "vfrec7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfrec7_v, rv_=
op_vfrec7_v, 0 },
> -    { "vfmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmin_=
vv, rv_op_vfmin_vv, 0 },
> -    { "vfmin.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmin_=
vf, rv_op_vfmin_vf, 0 },
> -    { "vfmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmax_=
vv, rv_op_vfmax_vv, 0 },
> -    { "vfmax.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmax_=
vf, rv_op_vfmax_vf, 0 },
> -    { "vfsgnj.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsgn=
j_vv, rv_op_vfsgnj_vv, 0 },
> -    { "vfsgnj.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsgn=
j_vf, rv_op_vfsgnj_vf, 0 },
> -    { "vfsgnjn.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsg=
njn_vv, rv_op_vfsgnjn_vv, 0 },
> -    { "vfsgnjn.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsg=
njn_vf, rv_op_vfsgnjn_vf, 0 },
> -    { "vfsgnjx.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsg=
njx_vv, rv_op_vfsgnjx_vv, 0 },
> -    { "vfsgnjx.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsg=
njx_vf, rv_op_vfsgnjx_vf, 0 },
> -    { "vfslide1up.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_v=
fslide1up_vf, rv_op_vfslide1up_vf, 0 },
> -    { "vfslide1down.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op=
_vfslide1down_vf, rv_op_vfslide1down_vf, 0 },
> -    { "vmfeq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfeq_=
vv, rv_op_vmfeq_vv, 0 },
> -    { "vmfeq.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfeq_=
vf, rv_op_vmfeq_vf, 0 },
> -    { "vmfne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfne_=
vv, rv_op_vmfne_vv, 0 },
> -    { "vmfne.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfne_=
vf, rv_op_vmfne_vf, 0 },
> -    { "vmflt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmflt_=
vv, rv_op_vmflt_vv, 0 },
> -    { "vmflt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmflt_=
vf, rv_op_vmflt_vf, 0 },
> -    { "vmfle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfle_=
vv, rv_op_vmfle_vv, 0 },
> -    { "vmfle.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfle_=
vf, rv_op_vmfle_vf, 0 },
> -    { "vmfgt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfgt_=
vf, rv_op_vmfgt_vf, 0 },
> -    { "vmfge.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfge_=
vf, rv_op_vmfge_vf, 0 },
> -    { "vfclass.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfclass_v=
, rv_op_vfclass_v, 0 },
> -    { "vfmerge.vfm", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vl, NULL, rv_op_vfm=
erge_vfm, rv_op_vfmerge_vfm, 0 },
> -    { "vfmv.v.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, rv_op_vfmv_v_f, rv_=
op_vfmv_v_f, 0 },
> -    { "vfcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_=
xu_f_v, rv_op_vfcvt_xu_f_v, 0 },
> -    { "vfcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_x=
_f_v, rv_op_vfcvt_x_f_v, 0 },
> -    { "vfcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_=
f_xu_v, rv_op_vfcvt_f_xu_v, 0 },
> -    { "vfcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_f=
_x_v, rv_op_vfcvt_f_x_v, 0 },
> -    { "vfcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
cvt_rtz_xu_f_v, rv_op_vfcvt_rtz_xu_f_v, 0 },
> -    { "vfcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfc=
vt_rtz_x_f_v, rv_op_vfcvt_rtz_x_f_v, 0 },
> -    { "vfwcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcv=
t_xu_f_v, rv_op_vfwcvt_xu_f_v, 0 },
> -    { "vfwcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt=
_x_f_v, rv_op_vfwcvt_x_f_v, 0 },
> -    { "vfwcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcv=
t_f_xu_v, rv_op_vfwcvt_f_xu_v, 0 },
> -    { "vfwcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt=
_f_x_v, rv_op_vfwcvt_f_x_v, 0 },
> -    { "vfwcvt.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt=
_f_f_v, rv_op_vfwcvt_f_f_v, 0 },
> -    { "vfwcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_v=
fwcvt_rtz_xu_f_v, rv_op_vfwcvt_rtz_xu_f_v, 0 },
> -    { "vfwcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
wcvt_rtz_x_f_v, rv_op_vfwcvt_rtz_x_f_v, 0 },
> -    { "vfncvt.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncv=
t_xu_f_w, rv_op_vfncvt_xu_f_w, 0 },
> -    { "vfncvt.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt=
_x_f_w, rv_op_vfncvt_x_f_w, 0 },
> -    { "vfncvt.f.xu.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncv=
t_f_xu_w, rv_op_vfncvt_f_xu_w, 0 },
> -    { "vfncvt.f.x.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt=
_f_x_w, rv_op_vfncvt_f_x_w, 0 },
> -    { "vfncvt.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt=
_f_f_w, rv_op_vfncvt_f_f_w, 0 },
> -    { "vfncvt.rod.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
ncvt_rod_f_f_w, rv_op_vfncvt_rod_f_f_w, 0 },
> -    { "vfncvt.rtz.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_v=
fncvt_rtz_xu_f_w, rv_op_vfncvt_rtz_xu_f_w, 0 },
> -    { "vfncvt.rtz.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
ncvt_rtz_x_f_w, rv_op_vfncvt_rtz_x_f_w, 0 },
> -    { "vredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
sum_vs, rv_op_vredsum_vs, 0 },
> -    { "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
and_vs, rv_op_vredand_vs, 0 },
> -    { "vredor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredo=
r_vs, rv_op_vredor_vs, 0 },
> -    { "vredxor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
xor_vs, rv_op_vredxor_vs, 0 },
> -    { "vredminu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vre=
dminu_vs, rv_op_vredminu_vs, 0 },
> -    { "vredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
min_vs, rv_op_vredmin_vs, 0 },
> -    { "vredmaxu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vre=
dmaxu_vs, rv_op_vredmaxu_vs, 0 },
> -    { "vredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
max_vs, rv_op_vredmax_vs, 0 },
> -    { "vwredsumu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vw=
redsumu_vs, rv_op_vwredsumu_vs, 0 },
> -    { "vwredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwr=
edsum_vs, rv_op_vwredsum_vs, 0 },
> -    { "vfredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vf=
redusum_vs, rv_op_vfredusum_vs, 0 },
> -    { "vfredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vf=
redosum_vs, rv_op_vfredosum_vs, 0 },
> -    { "vfredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfr=
edmin_vs, rv_op_vfredmin_vs, 0 },
> -    { "vfredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfr=
edmax_vs, rv_op_vfredmax_vs, 0 },
> -    { "vfwredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_v=
fwredusum_vs, rv_op_vfwredusum_vs, 0 },
> -    { "vfwredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_v=
fwredosum_vs, rv_op_vfwredosum_vs, 0 },
> -    { "vmand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmand_=
mm, rv_op_vmand_mm, 0 },
> -    { "vmnand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmnan=
d_mm, rv_op_vmnand_mm, 0 },
> -    { "vmandn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmand=
n_mm, rv_op_vmandn_mm, 0 },
> -    { "vmxor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmxor_=
mm, rv_op_vmxor_mm, 0 },
> -    { "vmor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmor_mm=
, rv_op_vmor_mm, 0 },
> -    { "vmnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmnor_=
mm, rv_op_vmnor_mm, 0 },
> -    { "vmorn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmorn_=
mm, rv_op_vmorn_mm, 0 },
> -    { "vmxnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmxno=
r_mm, rv_op_vmxnor_mm, 0 },
> -    { "vcpop.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, rv_op_vcpop_m, rv=
_op_vcpop_m, 0 },
> -    { "vfirst.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, rv_op_vfirst_m, =
rv_op_vfirst_m, 0 },
> -    { "vmsbf.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsbf_m, rv=
_op_vmsbf_m, 0 },
> -    { "vmsif.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsif_m, rv=
_op_vmsif_m, 0 },
> -    { "vmsof.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsof_m, rv=
_op_vmsof_m, 0 },
> -    { "viota.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_viota_m, rv=
_op_viota_m, 0 },
> -    { "vid.v", rv_codec_v_r, rv_fmt_vd_vm, NULL, rv_op_vid_v, rv_op_vid_=
v, 0 },
> -    { "vmv.x.s", rv_codec_v_r, rv_fmt_rd_vs2, NULL, rv_op_vmv_x_s, rv_op=
_vmv_x_s, 0 },
> -    { "vmv.s.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, rv_op_vmv_s_x, rv_op=
_vmv_s_x, 0 },
> -    { "vfmv.f.s", rv_codec_v_r, rv_fmt_fd_vs2, NULL, rv_op_vfmv_f_s, rv_=
op_vfmv_f_s, 0 },
> -    { "vfmv.s.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, rv_op_vfmv_s_f, rv_=
op_vfmv_s_f, 0 },
> -    { "vslideup.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsl=
ideup_vx, rv_op_vslideup_vx, 0 },
> -    { "vslideup.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vs=
lideup_vi, rv_op_vslideup_vi, 0 },
> -    { "vslide1up.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vs=
lide1up_vx, rv_op_vslide1up_vx, 0 },
> -    { "vslidedown.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_v=
slidedown_vx, rv_op_vslidedown_vx, 0 },
> -    { "vslidedown.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_=
vslidedown_vi, rv_op_vslidedown_vi, 0 },
> -    { "vslide1down.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_=
vslide1down_vx, rv_op_vslide1down_vx, 0 },
> -    { "vrgather.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vrg=
ather_vv, rv_op_vrgather_vv, 0 },
> -    { "vrgatherei16.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op=
_vrgatherei16_vv, rv_op_vrgatherei16_vv, 0 },
> -    { "vrgather.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrg=
ather_vx, rv_op_vrgather_vx, 0 },
> -    { "vrgather.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vr=
gather_vi, rv_op_vrgather_vi, 0 },
> -    { "vcompress.vm", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, rv_op_vcomp=
ress_vm, rv_op_vcompress_vm, 0 },
> -    { "vmv1r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv1r_v, rv_op=
_vmv1r_v, 0 },
> -    { "vmv2r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv2r_v, rv_op=
_vmv2r_v, 0 },
> -    { "vmv4r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv4r_v, rv_op=
_vmv4r_v, 0 },
> -    { "vmv8r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv8r_v, rv_op=
_vmv8r_v, 0 },
> -    { "vzext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf2=
, rv_op_vzext_vf2, 0 },
> -    { "vzext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf4=
, rv_op_vzext_vf4, 0 },
> -    { "vzext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf8=
, rv_op_vzext_vf8, 0 },
> -    { "vsext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf2=
, rv_op_vsext_vf2, 0 },
> -    { "vsext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf4=
, rv_op_vsext_vf4, 0 },
> -    { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8=
, rv_op_vsext_vf8, 0 },
> -    { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, =
rv_op_vsetvli, 0 },
> -    { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetiv=
li, rv_op_vsetivli, 0 },
> -    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op=
_vsetvl, 0 },
> +    { "vle8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vle16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vle32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vle64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vse8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vse16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vse32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vse64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vlm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vsm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vlse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0 =
},
> +    { "vlse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0=
 },
> +    { "vlse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0=
 },
> +    { "vlse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0=
 },
> +    { "vsse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0 =
},
> +    { "vsse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0=
 },
> +    { "vsse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0=
 },
> +    { "vsse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, 0, 0, 0=
 },
> +    { "vluxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0, =
0 },
> +    { "vluxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vluxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vluxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vloxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0, =
0 },
> +    { "vloxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vloxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vloxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vsuxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0, =
0 },
> +    { "vsuxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vsuxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vsuxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vsoxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0, =
0 },
> +    { "vsoxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vsoxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vsoxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, 0, 0,=
 0 },
> +    { "vle8ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 =
},
> +    { "vle16ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vle32ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vle64ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl1re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 =
},
> +    { "vl1re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl1re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl1re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl2re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 =
},
> +    { "vl2re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl2re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl2re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl4re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 =
},
> +    { "vl4re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl4re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl4re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl8re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 =
},
> +    { "vl8re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl8re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vl8re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vs1r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vs2r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vs4r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vs8r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, 0, 0, 0 },
> +    { "vadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vrsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vrsub.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vwaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwsubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwsubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwaddu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwaddu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwadd.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwsubu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwsubu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwsub.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, 0, 0, 0 },
> +    { "vadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, 0, 0, 0 },
> +    { "vadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, 0, 0, 0 },
> +    { "vmadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, 0, 0, 0 },
> +    { "vmadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, 0, 0, 0 },
> +    { "vmadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, 0, 0, 0 },
> +    { "vsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, 0, 0, 0 },
> +    { "vsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, 0, 0, 0 },
> +    { "vmsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, 0, 0, 0 },
> +    { "vmsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, 0, 0, 0 },
> +    { "vand.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vand.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vand.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vxor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vxor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vxor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vsrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vsrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vsrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vsra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vsra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vsra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vnsrl.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vnsrl.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vnsra.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vnsra.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vnsra.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vmseq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmseq.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmseq.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vmsne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmsne.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmsne.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vmsltu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmsltu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmslt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmslt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmsleu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmsleu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmsleu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vmsle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmsle.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmsle.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vmsgtu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmsgtu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vmsgt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmsgt.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vminu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vminu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmin.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmaxu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmaxu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmax.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmulh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmulh.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmulhu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmulhu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmulhsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmulhsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vdivu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vdivu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vdiv.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vremu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vremu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vrem.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vrem.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwmulu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwmulu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwmulsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwmulsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vnmsac.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vmadd.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vnmsub.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vwmaccu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vwmaccu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vwmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vwmaccsu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vwmaccsu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vwmaccus.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vmv.v.v", rv_codec_v_r, rv_fmt_vd_vs1, NULL, 0, 0, 0 },
> +    { "vmv.v.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, 0, 0, 0 },
> +    { "vmv.v.i", rv_codec_v_i, rv_fmt_vd_imm, NULL, 0, 0, 0 },
> +    { "vmerge.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, 0, 0, 0 },
> +    { "vmerge.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, 0, 0, 0 },
> +    { "vmerge.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, 0, 0, 0 },
> +    { "vsaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vsaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vsaddu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vsadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vsadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vsadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, 0, 0, 0 },
> +    { "vssubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vssubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vssub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vssub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vaadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vaadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vaaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vaaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vasub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vasub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vasubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vasubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vsmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vsmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vssrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vssrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vssrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vssra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vssra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vssra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vnclipu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vnclipu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vnclipu.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 }=
,
> +    { "vnclip.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vnclip.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vnclip.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "vfadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfrsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfwadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfwadd.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfwsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfwsub.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfrdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfwmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfnmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vfwnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vfwmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vfwnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vfsqrt.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vfrsqrt7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vfrec7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vfmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfmin.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfmax.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfsgnj.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfsgnj.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfsgnjn.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfsgnjn.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfsgnjx.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vfsgnjx.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfslide1up.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0=
 },
> +    { "vfslide1down.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0,=
 0 },
> +    { "vmfeq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmfeq.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vmfne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmfne.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vmflt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmflt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vmfle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmfle.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vmfgt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vmfge.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, 0, 0, 0 },
> +    { "vfclass.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfmerge.vfm", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vl, NULL, 0, 0, 0 }=
,
> +    { "vfmv.v.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, 0, 0, 0 },
> +    { "vfcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 =
},
> +    { "vfcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 }=
,
> +    { "vfwcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwcvt.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfwcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0=
 },
> +    { "vfwcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 =
},
> +    { "vfncvt.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfncvt.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfncvt.f.xu.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfncvt.f.x.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfncvt.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfncvt.rod.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 =
},
> +    { "vfncvt.rtz.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0=
 },
> +    { "vfncvt.rtz.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 =
},
> +    { "vredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vredor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vredxor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vredminu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vredmaxu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwredsumu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 =
},
> +    { "vwredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vfredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 =
},
> +    { "vfredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 =
},
> +    { "vfredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vfredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vfwredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0=
 },
> +    { "vfwredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0=
 },
> +    { "vmand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmnand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmandn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmxor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmorn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vmxnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vcpop.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vfirst.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vmsbf.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vmsif.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vmsof.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "viota.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vid.v", rv_codec_v_r, rv_fmt_vd_vm, NULL, 0, 0, 0 },
> +    { "vmv.x.s", rv_codec_v_r, rv_fmt_rd_vs2, NULL, 0, 0, 0 },
> +    { "vmv.s.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, 0, 0, 0 },
> +    { "vfmv.f.s", rv_codec_v_r, rv_fmt_fd_vs2, NULL, 0, 0, 0 },
> +    { "vfmv.s.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, 0, 0, 0 },
> +    { "vslideup.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vslideup.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 =
},
> +    { "vslide1up.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 =
},
> +    { "vslidedown.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0=
 },
> +    { "vslidedown.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, =
0 },
> +    { "vslide1down.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, =
0 },
> +    { "vrgather.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vrgatherei16.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0,=
 0 },
> +    { "vrgather.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 }=
,
> +    { "vrgather.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 =
},
> +    { "vcompress.vm", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
> +    { "vmv1r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vmv2r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vmv4r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vmv8r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vzext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vzext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vzext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vsext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vsext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, 0, 0, 0 },
> +    { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, 0, 0, 0 },
> +    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "c.zext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
>      { "c.sext.b", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
>      { "c.zext.h", rv_codec_zcb_ext, rv_fmt_rd, NULL, 0 },
> --
> 2.25.1
>
>

