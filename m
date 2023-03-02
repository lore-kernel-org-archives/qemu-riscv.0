Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXXRz-0003bI-DL
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 20:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXRx-0003Wk-UG
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 20:09:37 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXRv-0007gG-QW
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 20:09:37 -0500
Received: by mail-pj1-x1029.google.com with SMTP id l1so15253937pjt.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 17:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677719373;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=y9R/oA8vmfl9hBW325XUhmooGKOvMuCINXa6CSyGPts=;
 b=GZqQVFEGbbeKOjhGF2L9VHINPE9oe/8IwuMsnxAuVnGLpFMkEhU6Yu4T+kXaMhsXrM
 wuNU2bg+ZVB1C4WCxJ+b/LPC8e8LtTf58JXn7FBLauXG5hHOwhmJt1U91sfDqmlVg9uh
 q8zbwrhwQih784z6hzhI0zjC7LSBN74ui75SgVA4Znk/S5hv0GFUVYmdsxuelBy3ePVc
 WDj887dPNrEnOqRi5FPQLeKaMAUpwW3cx2t5BYHhvxA6ftpd3nes2YZIMPKpg23YZS9g
 ewsdLi+YFL4Fre3lAiJoW62ubsDrPrTnUq1SgE98ibXDQ6PN0cElyf+CEJj+YpyHaUt+
 zMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677719373;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9R/oA8vmfl9hBW325XUhmooGKOvMuCINXa6CSyGPts=;
 b=1PAQGFNsAY+OzoQW6xgViVAO8g3MWTxBls/xTHAWnYGN9Za+qD0gmKJsInWgQo20wb
 0948ITCfsY5kuIE1YJleGJYn5tiZBmonBSy//0By1YSl9wHT++W3iVcpc1SWCbzCVxmJ
 fm4Iz7J+4tlT9h2rvMoWYw4at4in6ETmFCNapr30nERzDlu5/w1PrE/Pe57GFt1GbTIK
 bz0kpwA4nQZOsi/0jGwAvXi+wxWXOo6Dw1nLOzQbWPAc2WK3DRpK2+bUHDztCGV5Rclr
 Sxmtg3yhgJWZQp88a01OikUhit9lTuRebG3Wae3j9Qx1VfKG9kY1SmMjaAVc4WXDxu6R
 Deqg==
X-Gm-Message-State: AO0yUKXIUgKiw5mJGJU+919APnCbJLOZb57eqRHsjiQ00mQiXTMg1CAe
 UIrh4Bv8ehIkTXAlWtLhqA8DholnZViFb0Fm
X-Google-Smtp-Source: AK7set8A42bxH8GZf43CYkUL9BkcA+mzUPY0n0FTogNtyQxBRRFuDagAfDs2WMihvFqX1vyy4QGvTA==
X-Received: by 2002:a05:6a20:3ba8:b0:cc:8266:994e with SMTP id
 b40-20020a056a203ba800b000cc8266994emr7702664pzh.4.1677719373240; 
 Wed, 01 Mar 2023 17:09:33 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005e5861932c9sm8465433pfn.129.2023.03.01.17.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:09:32 -0800 (PST)
Date: Wed, 01 Mar 2023 17:09:32 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 17:00:40 PST (-0800)
Subject: Re: [PATCH] RISC-V: XTheadMemPair: Remove register restrictions for
 store-pair
In-Reply-To: <20230220095612.1529031-1-christoph.muellner@vrull.eu>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 philipp.tomsich@vrull.eu, manolis.tsamis@vrull.eu, 
 Richard Henderson <richard.henderson@linaro.org>, cooper.qu@linux.alibaba.com,
 lifang_xia@linux.alibaba.com, 
 yunhai@linux.alibaba.com, zhiwei_liu@linux.alibaba.com,
 christoph.muellner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: christoph.muellner@vrull.eu
Message-ID: <mhng-a63a4188-b9ef-4df1-b914-28f027bb557f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 01:09:38 -0000

On Mon, 20 Feb 2023 01:56:12 PST (-0800), christoph.muellner@vrull.eu wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> The XTheadMemPair does not define any restrictions for store-pair
> instructions (th.sdd or th.swd). However, the current code enforces
> the restrictions that are required for load-pair instructions.
> Let's fix this by removing this code.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>  target/riscv/insn_trans/trans_xthead.c.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
> index be87c34f56..cf1731b08d 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -980,10 +980,6 @@ static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
>  static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
>                               int shamt)
>  {
> -    if (a->rs == a->rd1 || a->rs == a->rd2 || a->rd1 == a->rd2) {
> -        return false;
> -    }
> -
>      TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
>      TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
>      TCGv addr1 = tcg_temp_new();

Thanks, this is queued in riscv-to-apply.next .

