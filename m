Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAnWA-0001Jb-Hu
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 03:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1oAnW9-0001JI-Hk
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 03:07:41 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eop.chen@sifive.com>)
 id 1oAnW7-0005sA-Iu
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 03:07:40 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s206so3998604pgs.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Jul 2022 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=z8KpafnG3KuRwZ5NNGJNNLVcmH1Kzp8K1+WaXpNz9/U=;
 b=lBzRCkBBfBVrlXhQZ4rxm2dzy29MZbX1YilU3EmtPFPjdA4q1rhOH6tt3LG5x4mIgA
 egr67mH3Ad0qxJtn9QKlGrRjVjwzJZfXYPiBicTs8IoXKHNPR1L4ZN75Bi0o2V4xsjGm
 Y3nMh61iv8qpFOleAebr4yPCjx5XFk/+EcMW6itPTY2Z1vc16O0kSx5N5yYQlapxyPOm
 W5Xp+nt6l9uuvF3zTdyrLVVqUYjzi3iPg31OhuO/ifzwd9x6Wrx8WtGWSmSaDUWRCLic
 i1cYXM2JY4W2cGJt/MqQOqyHE6ynnGUUIihJoure7knvF29L+P+RP6TLtpAyDuJ1VMNg
 qk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=z8KpafnG3KuRwZ5NNGJNNLVcmH1Kzp8K1+WaXpNz9/U=;
 b=QjYPeQwyj8JwOwftlzn8GkHjK4lyJohw7gt4ByvoD1fteV8Luzg9MMnmT+2XCmmxI7
 Mfnw9ArUi5YG1HSBTz0lbkkG3CVTVhaH72TX+gNn+FWad65S1ooP2HE1os3pXiGoFIjZ
 yFg6L3C9sBrNdnoO/UVdFDz67bqut0vL0YMpCIZwYaq92p1V53v+euW37C2qjS29F1fb
 5TdBIcnoLy6nYVdpJexAKqVW3eTgdfVRGE8FhmBOoHW0vKu9/C//0JZaQ3VAe4L0hhIg
 Be1/HXQ2l3lrgPIAYbSg8ctDasgGKCwywiYYLOsqqU7xOZXVe2GvaMzpQqW5j75/RcEw
 qU5A==
X-Gm-Message-State: AJIora+W8ipz13E2opeh4KilpoAcPA9liqoUReGZgAeA8EZqAOc1TKXe
 vq6HgEG9pGChv8UiuBVydC88ng==
X-Google-Smtp-Source: AGRyM1sVUygF7IWxZSvvYyqxLdgxjB5qmZomGX+d+HapFrk3nZkDKc2KJSi08HZt4tJ+mwFdKEG9Mw==
X-Received: by 2002:a63:2c47:0:b0:411:54ab:97b6 with SMTP id
 s68-20020a632c47000000b0041154ab97b6mr14682595pgs.173.1657523257550; 
 Mon, 11 Jul 2022 00:07:37 -0700 (PDT)
Received: from smtpclient.apple
 (2001-b400-e206-2fe9-6d86-a49d-c662-3395.emome-ip6.hinet.net.
 [2001:b400:e206:2fe9:6d86:a49d:c662:3395])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a170902c28100b0016c08addb4csm3909626pld.127.2022.07.11.00.07.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jul 2022 00:07:37 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH qemu v6 00/10] Add mask agnostic behavior for rvv
 instructions
From: eop Chen <eop.chen@sifive.com>
In-Reply-To: <165570784143.17634.35095816584573691-0@git.sr.ht>
Date: Mon, 11 Jul 2022 15:07:33 +0800
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>, WeiWei Li <liweiwei@iscas.ac.cn>,
 eop Chen <eop.chen@sifive.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F71349B-BD29-44D5-98E9-8AF45ADF05DD@sifive.com>
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=eop.chen@sifive.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jul 2022 07:07:41 -0000

Gentle ping.

Regards,

eop Chen

> ~eopxd <eopxd@git.sr.ht> =E6=96=BC 2022=E5=B9=B46=E6=9C=8820=E6=97=A5 =
=E4=B8=8B=E5=8D=882:50 =E5=AF=AB=E9=81=93=EF=BC=9A
>=20
> According to v-spec, mask agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of mask policies, QEMU should be able to simulate the mask
> agnostic behavior as "set mask elements' bits to all 1s".
>=20
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between mask policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>=20
> The following instructions that are always unmasked and not affected:
>=20
> - Vector add-with-carry and subtract-with-borrow instructions
> - Vector merge and move instructions
> - Vector reduction instructions
> - Vector mask-register logical instructions
> - `vcompress`
>=20
> v2 updates:
> - Rebase upon changes of the tail agnostic patch-set
> - Minor change for vector load/store instructions
>=20
> v3 updates:
> - Rebase upon changes of the tail agnostic patch-set
> - Fix coding style, add missing space
> - Trigger `vma` when encountering vector load instructions and not in
>  vector stores
>=20
> v4 updates:
> - Rebase upon changes of the tail agnostic patch-set
>=20
> v5 updates:
> - Tag WeiWei as Reviewed-by for this patch-set
>=20
> v6 updates:
> - Now that the tail agnostic patch-set has been merged, this
>  patch-set no longer depends on it. Rebased to latest master.
>=20
> Yueh-Ting (eop) Chen (9):
>  target/riscv: rvv: Add mask agnostic for vv instructions
>  target/riscv: rvv: Add mask agnostic for vector load / store
>    instructions
>  target/riscv: rvv: Add mask agnostic for vx instructions
>  target/riscv: rvv: Add mask agnostic for vector integer shift
>    instructions
>  target/riscv: rvv: Add mask agnostic for vector integer comparison
>    instructions
>  target/riscv: rvv: Add mask agnostic for vector fix-point arithmetic
>    instructions
>  target/riscv: rvv: Add mask agnostic for vector floating-point
>    instructions
>  target/riscv: rvv: Add mask agnostic for vector mask instructions
>  target/riscv: rvv: Add mask agnostic for vector permutation
>    instructions
>=20
> eopXD (1):
>  target/riscv: rvv: Add option 'rvv_ma_all_1s' to enable optional mask
>    agnostic behavior
>=20
> target/riscv/cpu.c                      |   1 +
> target/riscv/cpu.h                      |   2 +
> target/riscv/cpu_helper.c               |   2 +
> target/riscv/insn_trans/trans_rvv.c.inc |  28 +++++
> target/riscv/internals.h                |   5 +-
> target/riscv/translate.c                |   2 +
> target/riscv/vector_helper.c            | 152 ++++++++++++++++++++----
> 7 files changed, 167 insertions(+), 25 deletions(-)
>=20
> --=20
> 2.34.2


