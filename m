Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE168C982D0
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 21:00:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7JD5-0003GK-UQ; Thu, 17 Sep 2026 17:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1x7JD3-0003Fc-35
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 16:59:57 -0400
Received: from mail-pj2-x25.google.com ([2607:f8b0:4864:39::25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1x7JD1-0000Hd-3d
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2026 16:59:56 -0400
Received: by mail-pj2-x25.google.com with SMTP id
 d9443c01a7336-2d747ed1368so838425ad.1
 for <qemu-riscv@nongnu.org>; Thu, 17 Sep 2026 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1789678793; x=1790283593;
 darn=nongnu.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:to
 :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=223LVvQTYFB4qIgtEgrekmjxhmKvevlPgQg8RdJwmUI=;
 b=xBCV3z4NIDKyBBl4XC44pNgv222QEvWvAPhH//VX7SazxFH4ZQD2f6m4DrkAuN0MwS
 j+FFhTv1vYKKclMklIpCoWfatwBfFgnYjqO03ZuBHlZqgmqDObjJLP416BqRkGJ0yOQH
 nCCsr7wQyLz5kSbNaD7QxX1IVR8PEkfTYsUypvBFYgjjdjKwNlK3HdvdvlL2kdZJ3h8L
 CMQY7R9roP52nrXOASqWiXlsBdzDPtq7Ri+BA8jyslqNlCL/MDRgk/0/3RyLBWI6MQOa
 CXlOLdPPDCNG6thNsbhjTWY43+JWdjH7REhMGP6Na/Qx/1MR/fYNWyj1D7xUljPQm29R
 Ckyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789678793; x=1790283593;
 h=content-transfer-encoding:content-type:mime-version:message-id:to
 :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=223LVvQTYFB4qIgtEgrekmjxhmKvevlPgQg8RdJwmUI=;
 b=lAoHYJUsWu9JZUaC+nwvOWzDUzcfulTjq5QOmQFviY0wfYXChsm63XyX9p0ec5asyr
 pypjGLnbsdBCqvj+ZqmMtn0SVJBCH4LKtXKdIEmKhDKqNKSesG9/vclxjE88GGhR9r0M
 TGp7hDqyT4Xjs+F7tiF5zMDduHGxgeBJBJB23V4kH9lo+alB62AcuxmEFEFW2fJNsVgh
 6x83SUZGmtrYqjgN4aaJJCUMdJoDqGkM277gLNlNJ4Bf89+9vIXeRqOgyyyB6mywh4HT
 HI0o313mt38G8bFDqUQPHjIBEOcsZ9ihUWKhpsO+J+vrGSq/r2rshFEOOu/lHos8+g09
 pJCg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwiUnn8xrbCVsmifzbYH2sPD19bbQaeP3D/4aamuQm6g5V5IzNCmGNYS9Zm/IZSCFrOFNMmBQnb45p@nongnu.org
X-Gm-Message-State: AFuF++mc1wKkCEAreiT8Goa6ncERBoCrXn4XIxdXK2/YamrZlfPPZsiw
 mj7gEIO+aWufb2YUIk3EEY2BZsYapJ7XAJRD+AO9Tc6sa+KsOj3OAtWc9mY1qP6fLgg=
X-Gm-Gg: AYBFou2yCz++PVOSX94TXuZwBXXqVeuUw74NAN35bQ36MOD14WQxLXmPbZMkonbzj1Y
 K0sgJ9ipuFWrC7J2q9AeZPzmCYQ/WDJH4DjfOKHj+grIwP2VtBpJkk6au+Yf1RQhTmRL3qRnOmc
 xq3vrKvzxsS368/AdRQc8PDufc037Ailk6mHDLHG/OpeCUdyv4zaZGVrhgf48XC6DpsokpcoTrF
 ijm51eIkAS9bFDHFqWh3XOhPP2CEhI3WJnins7zE9U7E2LQ67QnK/9/+KsO5kPLnGdCIOj+aCh+
 ZwIx+nKRsNqP5z2e3fpS2GV/gYwrZebY/8woUhRx4OCYZEQt6AzcNw602plNdpG11dinykigcix
 GL/BpHc8Z774ekEULtBHBvdrD+4OOywG61PAn5N8FSABf0sF9nUGlzmV+JdRKZzhp5buTjMg/l/
 nZgm5+2v1UUBTsh7QGHiUmbJ0a0aGtnNiP91e8iY5Zlq9xqOyeQsNK9JZlJuA+QK9AOIYLnDSRa
 /YFfBAk+/EX1Wa0LYrNgVkADNdgig==
X-Received: by 2002:a17:902:ecd2:b0:2db:8406:db91 with SMTP id
 d9443c01a7336-2ddb1adf368mr8285625ad.10.1789678792675; 
 Thu, 17 Sep 2026 13:59:52 -0700 (PDT)
Received: from localhost ([2001:5a8:4687:d600:a432:5959:dbd9:36fd])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bf5ad9ed5sm19856987eec.22.2026.09.17.13.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 13:59:52 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:59:52 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Sep 2026 13:59:45 PDT (-0700)
Subject: Re: [PATCH v2] tcg/riscv64: Set vtype before whole-register vector
 moves
In-Reply-To: <48d3cf9d-4d76-41c8-aa73-e1cc57db3f40@linaro.org>
CC: max.chou@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, daniel.barboza@oss.qualcomm.com,
 joel@jms.id.au
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <mhng-F8D5674F-046D-44A0-8196-38EDF98E50C3@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::25;
 envelope-from=palmer@dabbelt.com; helo=mail-pj2-x25.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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

On Thu, 17 Sep 2026 13:51:10 PDT (-0700), Richard Henderson wrote:
> On 9/17/26 03:37, Max Chou wrote:
>> According to the RISC-V unpriviledge spec,
>>    "vset{i}vl{i} and whole register loads and stores do not depend upon
>>     vtype."
>> The whole-register vector move instructions reuqire legal vtype that
>> trap when VILL is set.
>>
>> The tcg_out_mov in tcg/riscv64 missed the vtype setup before emitting the
>> OPC_VMVNR_V.
>>
>> Fixes: d4be6ee1111 ("tcg/riscv: Implement vector mov/dup{m/i}")
>> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Max Chou <max.chou@sifive.com>
>> ---
>>   tcg/riscv64/tcg-target.c.inc | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
>> index 2ce9d47a633..e3cfedb579d 100644
>> --- a/tcg/riscv64/tcg-target.c.inc
>> +++ b/tcg/riscv64/tcg-target.c.inc
>> @@ -778,6 +778,10 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>>           {
>>               int lmul = type - riscv_lg2_vlenb;
>>               int nf = 1 << MAX(lmul, 0);
>> +
>> +            if (s->riscv_cur_type == TCG_TYPE_COUNT) {
>> +                set_vtype_len(s, type);
>> +            }
>>               tcg_out_opc_vi(s, OPC_VMVNR_V, ret, arg, nf - 1);
>>           }
>>           break;
>
> Do you have a reproducer for this?  I ask because I still wonder how
> this can occur.
>
> Given that
>
> (1) all vector registers are call-clobbered, there should be none live
> across tcg_out_call_int (which clears the remembered vtype),
>
> (2) the first vector action with no vector registers live must be a load
> or movi (which will initialize vtype).
>
> Performing a move between vector registers when all such registers must
> be dead is... wrong.  It indicates that there's a bug elsewhere.

I'm not quite sure the commit message is right here, but this whole area 
is a bit of a landmine: one of the post-ratification changes to V was 
either this (or very close to this), so we've been through it for every 
project.

Here's the LLVM thread, which I think has links to everything else: 
https://github.com/llvm/llvm-project/issues/114518 (there's a GCC change 
as well).  IIRC hardware is a bit all over the place on this one, for 
the compilers we decided to just emit the code that's safe either way -- 
that's not really an option for QEMU, though, so we'll have to pick one 
side or the other.

> I'll throw an assert in here locally and see what happens...
>
>
> r~

