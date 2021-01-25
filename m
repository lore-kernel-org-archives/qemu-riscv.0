Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4BcG-00076E-Cu
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BcE-00072o-9d; Mon, 25 Jan 2021 18:49:50 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BcC-0003Ei-NV; Mon, 25 Jan 2021 18:49:50 -0500
Received: by mail-io1-xd2e.google.com with SMTP id n2so30246886iom.7;
 Mon, 25 Jan 2021 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6T+0wgtlgRjg/l+AP5Dkfo0SKaxpksaAnJcalGumRPY=;
 b=HGhwY3mfiFpfL9bjPoaPpSc+QCG2oQTMh+x/SlZh5XsxTjDzx1kYWjy7wyQ0QMKBBZ
 gJ9sHHf9It3MqBq1F/hUqtGMAJMtcj4x+E/zRMfVfGrcDEO9AO7x3+tsrUdycS9QhqTH
 Tzx3/IfJRZQaYC3sp5TZGaBpY/oWDTlASb4HH5L3rhIE1f9pdk33U8zgGz0y7CWunv2/
 YwK9+7v46pzyN/Lq+z5w88wqw6boZwlrD4FkoWZzToFbOkofw1C//YW40OdX1zj921pb
 nsCSTRf8d0Fkt0p9jZ8L8Zb3yQMVMHTRSy9ey+Dse6G9kecH8c2SUOkPSEwpvmLL6nLA
 Fb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6T+0wgtlgRjg/l+AP5Dkfo0SKaxpksaAnJcalGumRPY=;
 b=T50+WZ+rr4i/x/FapWNTCMz7eg6gMjKycjzloQi95aaON8UZ+Ym7JGQUR1Z3qdgV/8
 MrJplEpG3+OJrZN+Mt46nsenWI8fOkrHVM4ePJDp8Q3M/vL9vifKX9funoAFsSU5oK1t
 vf9Nlds6rtwoBjeH3U3siQ6siGaXpNrkBADuhGaF+GktKcDL96fc9gXFhqtPFPsDEGhV
 fb54n3Uk0xRANaUOApLi5FjiSKktHebYszlIXIyo+HWMCWfHjRe8mr38OTFh6dyIXBs5
 H7p9jLyhHb9JjXVkUWhjg2py72Fv/CKTvME30wxInOJTMUjT8l4Eg0S7iujUqioo6x03
 UiSA==
X-Gm-Message-State: AOAM532lCeSphiaD+r5ztzTBhKWdIHE+tJ/aAk68vrUzJ++qeMHRXob2
 GXzTCUpfEdwClgCYRTTSL0ao9PHssfVz+N5a3ks=
X-Google-Smtp-Source: ABdhPJzFGWDOVtQyZHZoByQTRtlV+o8dki0RfgJiVXS9ikS7cwMAhxiYgkhGlxuTLIfHjKoMyc7pHk84L3w4ZOhNt30=
X-Received: by 2002:a5e:850b:: with SMTP id i11mr2222874ioj.42.1611618587623; 
 Mon, 25 Jan 2021 15:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-27-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-27-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:49:21 -0800
Message-ID: <CAKmqyKPZuswxcDorYHu9sqic4NRFL9J70f_-_Bo0a3eRH=GZ_A@mail.gmail.com>
Subject: Re: [PATCH v6 26/72] target/riscv: rvv-1.0: floating-point
 square-root instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2021 23:49:50 -0000

On Tue, Jan 12, 2021 at 2:03 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e11666f16df..c0053cfb828 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -538,7 +538,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
>  vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
>  vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
>  vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
> -vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
> +vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
>  vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
>  vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
>  vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
> --
> 2.17.1
>
>

