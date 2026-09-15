Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB2C88E75
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 09:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x6PW8-0003fN-TZ; Tue, 15 Sep 2026 05:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x6PW5-0003ep-SF
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2026 05:31:55 -0400
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1x6PW4-0001Sr-9M
 for qemu-riscv@nongnu.org; Tue, 15 Sep 2026 05:31:53 -0400
Received: by mail-pz2-x2a.google.com with SMTP id
 41be03b00d2f7-cc1cea4c7a0so34745a12.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Sep 2026 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1789464710; x=1790069510; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TUBN0s7qDBNrqjic8a+/7xYR5JVbaPpd9amBBDddmvI=;
 b=kbgxagyzSuFjjrMIIaOIY5IlYr/GxtxqhSSe5GnnqX6Cd0waNpbJdJaAmjSxQsmfpV
 nH4InTDIFa2CwtRPJhbh7nyS2+xVcGwsmI5uuHoIa4yM2id+gBSQD32sNsM+SnQpAcUK
 7UyvROLYvtIKtpYXaQ9u/4ikZtgV82xpZe0PiE/uHtYVRirm9X4gna4wp8xLsnzjB2Vk
 JppRSqcb+lMcK5MeG/teXbD/fNs9s/o1mw96elIlDdXTnEFQxBY/17OY73KxtST77EKB
 O3gQRYJFp0sV7TeHASpAg+/gDX6uhl8lbrjH18w7Pua1ijl1+Ws5cZgcGAyTPwESgsPL
 S74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789464710; x=1790069510;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TUBN0s7qDBNrqjic8a+/7xYR5JVbaPpd9amBBDddmvI=;
 b=RrYkZLnSLtUDHrmTPPecvt/K5MD16yhWc4UHaQvJrDIPsF2gfggrTq5JTZdyr1JQF/
 E10I2GM0KJkxZxoiMC6KwZs5D0O0CZdNJWzuyn2r8ZZtnq1RO9G7RrgZWzWMuSr2+j2D
 5V93Omh906GjVXOqPap69B0KAy1HZlwTW4t7QprA9GLp5QdHf9H7zivBj9DgIhACBPjp
 ONwmL6MLd8jFczIKSPvHorKtzG1FQhkxkSPbSFUxhvwpbfSQznBzjALsG+rbTBIYvCVB
 uSI5xPPhDGEnZ10+fZHa9rxVpOY5y8yBTQDkl3Sl61USs695gNtCOXcsRiirJeRntp8H
 pXeQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwc4sMI04OzSK7HxSfouoDuct96V9KxfXpDpDVj13xkNdFQXeLRn0ePJex1mayEeqhH0q2+w5BIUv2Z@nongnu.org
X-Gm-Message-State: AFuF++nyUx1vJikDqZut1oRXMYDJlw7IgmjrulnrnDMghY2j82OdsQ56
 cJKriYHiNqSJCWXWCTCMzI69BQI534iv4RyDX5BNKibO70rLnPiUA6wcogmwxGm9Pi0=
X-Gm-Gg: AYBFou3ilybE1xysGVz4LKx+Ma5yZydSVnsoWVLlsb6qTyfEPDRbMbxGUrhTlyRvkDS
 qnwjg4dxljxulsmUk06OVIPofKgH/6lMmzSmsC4PuwVkZZ9CwWR2mLDnfd+rSgTEw2LJ/Nrr1fh
 1RkDnfXnFh/aYwiGx/BauqSzyGvF5d71bVdSiZPyxyDu5QPesF56E1xA3mcjhYPe6oroeuh5++L
 ITF/U7zvl2n3yiiBwzZ4OurASHVzs1Ue4pDBZp/nQf4Km0AHeTBSZQBILODBGq39nbEJm7CN1fd
 Fp/9CdoeMD4GQ+VssIn5vwTvfHDHrHorvmNtfyrl1hZx8VnGqD2Q0g/fmZc9vRAxsEOuBc/vlDH
 iZ7s1oyak59eV5KonHoVH+J7SplTg3Vu/IjKXZT5YQrGzcV2ba8mgWf/U/q5JR1WdTolCwqWg28
 /WSNdcwhsJwKlunYaGm5kYu1qnAG4mVAyQJvdsJPtxlLT+1by4h6ocfN2akyQvXheswTj63lvOv
 DxnYDwUMlQH1aav5gc4T/kz0mCeFTJgnISArcHJ4NnB
X-Received: by 2002:a17:90b:164f:b0:398:c3ca:1ebc with SMTP id
 98e67ed59e1d1-39e1103fe18mr128823a91.18.1789464710476; 
 Tue, 15 Sep 2026 02:31:50 -0700 (PDT)
Received: from sifive.com ([136.226.240.165]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39dfdd58af8sm4154361a91.12.2026.09.15.02.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 02:31:50 -0700 (PDT)
Date: Tue, 15 Sep 2026 17:31:45 +0800
From: Max Chou <max.chou@sifive.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: Re: [PATCH] tcg/riscv64: Set vtype before whole-register vector moves
Message-ID: <aqkL1X-VcAOkPZLr@sifive.com>
References: <20260903170011.3627720-1-max.chou@sifive.com>
 <784414c5-0e93-442e-844e-79c648964a92@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <784414c5-0e93-442e-844e-79c648964a92@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:3b::2a;
 envelope-from=max.chou@sifive.com; helo=mail-pz2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 2026-09-10 12:11, Richard Henderson wrote:
> On 9/3/26 07:00, Max Chou wrote:
> > According to the RISC-V unpriviledge spec,
> >    "vset{i}vl{i} and whole register loads and stores do not depend upon
> >     vtype."
> > The whole-register vector move instructions reuqire legal vtype that
> > trap when VILL is set.
> > 
> > The tcg_out_mov in tcg/riscv64 missed the vtype setup before emitting the
> > OPC_VMVNR_V.
> > 
> > Fixes: d4be6ee1111 ("tcg/riscv: Implement vector mov/dup{m/i}")
> > Signed-off-by: Max Chou <max.chou@sifive.com>
> > ---
> >   tcg/riscv64/tcg-target.c.inc | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
> > index 2ce9d47a633..fbfb4c44470 100644
> > --- a/tcg/riscv64/tcg-target.c.inc
> > +++ b/tcg/riscv64/tcg-target.c.inc
> > @@ -778,6 +778,8 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
> >           {
> >               int lmul = type - riscv_lg2_vlenb;
> >               int nf = 1 << MAX(lmul, 0);
> > +
> > +            set_vtype_len(s, type);
> >               tcg_out_opc_vi(s, OPC_VMVNR_V, ret, arg, nf - 1);
> >           }
> >           break;
> 
> If I understand correctly, this happens when vtype is completely unset, such
> as the first use within the TB, or call-clobbered after a helper.
> 
> We don't actually need @type, just not the "uninitialized" type,
> TCG_TYPE_COUNT, per init_setting_vtype.
> 

Hi Richard,

Thanks for the suggestion. Will send v2 for this part.

> That you encountered a reg-reg move in such a situation makes me wonder if
> we have failed to correctly mark all of these vector registers
> call-clobbered?

I just checked the tcg_target_init to confirm that all the vector
registers (v0-v31) are marked call-clobbered.

rnax

> 
> 
> r~

