Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DB9C79F9E
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 02:00:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3OeS-00045L-Ao; Sun, 06 Sep 2026 22:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3OeQ-00044y-Cd
 for qemu-riscv@nongnu.org; Sun, 06 Sep 2026 22:00:02 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3OeN-0004mU-Fo
 for qemu-riscv@nongnu.org; Sun, 06 Sep 2026 22:00:02 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66c9995ca60so3849246d50.1
 for <qemu-riscv@nongnu.org>; Sun, 06 Sep 2026 18:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788746398; cv=none;
 d=google.com; s=arc-20260327;
 b=TbTZd7OB4dezzCNQBBGjG9/dacu+FDeHiTNCYRlXyOF63imvxsuDnret5246f50hxI
 Yrw1HSIwoIlzrD+mkIg3nmGp8KsLCdmiBW6HthEE/1enpbSC/UZcooqa29tvUm7kiOey
 s1vXOuCWyUxs625+p+YNOzVn4vfMbt47D/UhZzVoQ//dc7jQIyjxFnDwVMBly85H4pG6
 hzh9EP2cmHdsb9csX7sKIHUXIQ1ka+le/cn7xrJOeJxWz0O5eZW7HINMTHGNFQUDc2G9
 d8g3zft2muKAKmE5bgNvLFA3bZucKg3NVOg2eyMO/ksjvX3UqwGqZ2nDPj1ah6ZKQFzx
 qwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3a35i00JcPO+1PlUnpIvpEu7xlvw5Pcruz3A3w+M5h4=;
 fh=11H9+SR2ZxAWd8SOrAo7HByLRyUKZ/7fcBD2zXTRIN8=;
 b=ecf4DMQI6JzNnOuus9ans8NgDjktATEGEzjb3dzLfZ/DIol262wTRObTzTv4DRxx9t
 QaUH+p2k/0VoKeXvt3xsYvzxWTff0++hqJqDS4Y9nWzlv6Xdiz/Sz6W0UmEnCqs11Q/X
 N4NF36d9XLQFGftWHm9nIs+eMxeue/lwTXiHtrbASvY0N8c0q9QSRRTwoiQav22iAe2h
 QOmTMqVXqksq0GLsxKMoJiDC77UsvR7UY3Pb5eps7+17dQ3AweuAYyVPZvV5HUlxWBus
 q8qgHPTp+7Cmy7da5c8b9Wo7PaU50c+w+innBRAMq0nggZHNbyYGuHv7No1umI9pMhqk
 weqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788746398; x=1789351198; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3a35i00JcPO+1PlUnpIvpEu7xlvw5Pcruz3A3w+M5h4=;
 b=CIUcJ/4kELXbMD25Y6cUe2SsYWQccm/UI43v4uq+9NdZdjEuUsbWXj9YIgd+iVCVpy
 hXwS+uJ1+vhHaPUmsR5Dq6At84Cjz7ggxzSL4gLRyz0jSwjtEpmWioOIWT7AZ0pcb5Pu
 HyBqTvPr6g5hEwj1uZ/HwajEvtbdEucsk0U5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788746398; x=1789351198;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3a35i00JcPO+1PlUnpIvpEu7xlvw5Pcruz3A3w+M5h4=;
 b=H/Cl4kX9optDmJEQJgxbJ75ohGD1BSzVQkwAB5aRUVYhlrvqYiYKwewafwSZ3u/HyP
 4IGqYlCkc7Irg6OK6wjCKt/xe0oF0TpbwKGo4L4jsnAE3/fwzTCOknwzXpiGVA6t727R
 dyq9zcDKAtwo98piPFg0S9vM0vRLNrysAAVXBO/l6IsAOKFS4So+yKGW9a1Fr2O44jaT
 6Z/H09Ct/CTTU2U67nezNLUA4IyKdWXodurj5R+hxVoKg99jMzi44MOLCOsTMTJ8Eubx
 DbURf0ct3ZG7qZArMqmCo+0Hnd03U87tvSkMhRxB7b4czkjztTsUxy0hkdtjkfVUfuom
 O5bQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzt0hd3g39BZUpYw74NlFsmmpqir4+bub+xEx5Hi5okqfnnSXm/FHjldup925DGmiiZp2CB9cT6WfS5@nongnu.org
X-Gm-Message-State: AFuF++lKN35xVl30qreVOLCQ2JWh06lHL7b/04OIKQO581Tt/Fa/jBlv
 4apc+P21atUPQ+okgNXZI0lvoieUJj7tXDSFbBPO8SqdhDuRkUece9yF3Wv7uCQVuggsag1PQJE
 QfnCZtkEbnjo34lWys7ephMN0VQr+xsU=
X-Gm-Gg: AYBFou2CE6bbLFzVLJ2J7FHdcvRVZs+nkuQ11EaC+SkxWnY3pzqCEIEJVinXeh8fPO1
 XDJjrh1hHTwxq3Qp3ApKP6GRKVLCus9YSeoJiZq/XYOGhzo+7JGpejYX4yCqlpJHVo85g+PE0nM
 5XcR5z4h+QNxVeL7j+IO5Oha+JWVG1BusoVN3zFft0XuvfnovnsJnwgkiWquIZV3FiiTQ5978U7
 79meJf8mdnwATVqaefG0/TUqMc+VgkF//SRXR+BEWU16egcidQ+VjcRSptYj4AZ8Gh/tlMgAfJn
 BlHjUrevwGDt4AaSqebwInozVAGMBJ7WAgM1Yf40aFwNkIZp0O/YQ/JrKY9eLp7h+94j5Em7jR+
 lcX06Mm/hpmWNgO0qbySN8Qrv03h10Z5PvNp98SfVttESChHni5UINR8FGZ0xnWhWUb7MgaYru1
 64Oj8SB4pkAw8OV9OE
X-Received: by 2002:a05:690e:191e:b0:66f:b0f7:5958 with SMTP id
 956f58d0204a3-66fb6cb6334mr3775842d50.6.1788746397762; Sun, 06 Sep 2026
 18:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260831133000.982059-1-liumingliang.dev@bytedance.com>
 <20260831133000.982059-2-liumingliang.dev@bytedance.com>
In-Reply-To: <20260831133000.982059-2-liumingliang.dev@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Sep 2026 11:29:45 +0930
X-Gm-Features: AcwNN1V23c1kPMAFUaWEPk66EgbdprmVFqcJroVl-T7pE2Vshb1acPwRpIo_5PQ
Message-ID: <CACPK8XfqEi8-hbdVLo0gtrsBrGYJhSFqkQmaF5QLb6at9uk7pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/riscv: Add experimental Zvabd extension
 support
To: Mingliang Liu <liumingliang.dev@bytedance.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, chao.liu@processmission.com, 
 Zhibo Hong <hongzhibo@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 31 Aug 2026 at 22:59, Mingliang Liu
<liumingliang.dev@bytedance.com> wrote:
>
> From: Zhibo Hong <hongzhibo@bytedance.com>
>
> The draft Zvabd extension provides vector integer absolute-difference
> operations for image, video, and other data-processing workloads. It
> introduces eight new instructions:
>
>   - vabd.vv, vabd.vx, vabdu.vv, and vabdu.vx support SEW values from
>     8 through ELEN, with SEW 64 requiring Zve64x.
>   - vwabda.vv, vwabda.vx, vwabdau.vv, and vwabdau.vx support SEW 8
>     and 16 and accumulate into a double-width destination.
>
> This patch implement this instruction extension, including instruction
> decoder, TCG translation, and helpers, etc.
>
> The specification is under review at:
> https://github.com/riscv/riscv-isa-manual/pull/3279

Mention this implements 0.9 of the spec. It's notable that the opcodes
(and other things) have changed since 0.7.

> Signed-off-by: Mingliang Liu <liumingliang.dev@bytedance.com>

Assuming we follow the same convention as the kernel, include a
Signed-off-by line from the author, followed by yours as the
submitter.

> --- a/disas/riscv.c
> +++ b/disas/riscv.c

> @@ -2417,6 +2423,8 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                  case 13: return &op_vclmulh_vx;
>                  case 14: return &op_vslide1up_vx;
>                  case 15: return &op_vslide1down_vx;
> +                case 21: return &op_vabd_vx;
> +                case 22: return &op_vabdu_vx;

Should these be in numerical order?

Otherwise, looks good.

Reviewed-by: Joel Stanley <joel@jms.id.au>


>                  case 16:
>                      switch ((inst >> 20) & 0b11111) {
>                      case 0:

