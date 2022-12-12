Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4g0e-0002LP-4H
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 05:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p4g0I-000250-Kb; Mon, 12 Dec 2022 05:25:49 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p4g0F-0000m7-CY; Mon, 12 Dec 2022 05:25:44 -0500
Received: by mail-ej1-x636.google.com with SMTP id bj12so26663645ejb.13;
 Mon, 12 Dec 2022 02:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fW8IR3Va4lE4dsyn33tm7sal5rJRGK2GnmYBDkaNsAk=;
 b=T7R9avpRKnVU0VM/6qVS+FvVqX5wUFbAxKsts8h7pLQ+lwgx5Ry9Aprknr3Lxtc8pu
 W8AkyDvi/RFOzorA9pdlU8ST6QapwM52v3D7EBR3nX/WMLWx2BqrJ+omiSsfuy1pAMMg
 CNZLn5ChUt8GV1HstmbC6I8UEhYbJCKd960XkzkctElWjkefT6CnQrlxVa0EKPYZ8qLc
 3dsOpp8kRYhqx0nSlq/ztBj1YLjffAYfzy6PFEdnHrhvpb5FN8XL1L5tfrOqK2IUD1qR
 GLBkrYRkmc6Ed4CaVknaSM0S/PpK1RD39W9PZLkC3qLfoD5QzvkeZ8E3mA8X6HauqXT4
 p7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fW8IR3Va4lE4dsyn33tm7sal5rJRGK2GnmYBDkaNsAk=;
 b=BNdR3+vYuZwdMKyQh/J07Y+AQSCx+6T1i6DZGEpdo+VLk7qlj0LZtHedxCcWCCXywU
 vkMY0vZdbcdnRmSACjFOeykAts5wvBmPaD0YFemhzoi65L4ad4QJTNxgP521wow43CsW
 6YzHQef4DJoSWbF1dPRqN3hrnj7791pmophzId75I25eFKyIff9h+rcsyj5nc57T7CQm
 SF76RrYeGhtUGiYqdnp35XfI/Jr6xdgnxZxOmKN7eCBThUfr1FJvf3ATNdv4+kIcE/sd
 zXxyqhnDqzJW84y0EiFrIFtSu7GLAsyaLLjn/qcf43rkj+672AeItepDQetzLzQ9F93X
 c76w==
X-Gm-Message-State: ANoB5pkjqcfgtrsjTey+B4dsoLJvde18GgfFxSn+FnC4yCxsdlvJcbnK
 Ej74zyglZf76eyuofuWRLFEY0/lXPsCYHk5h6iM=
X-Google-Smtp-Source: AA0mqf7F73CG4nOhhjCutDkN6J6uaymPGz0zmGLhRm/fNpEknGSbchvAYHHxCdks9uDkN9nECpEHp6vuvfrk4Bp2nS0=
X-Received: by 2002:a17:906:17da:b0:7bb:d55e:417f with SMTP id
 u26-20020a17090617da00b007bbd55e417fmr55818588eje.13.1670840741096; Mon, 12
 Dec 2022 02:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20221212070431.306727-1-armbru@redhat.com>
In-Reply-To: <20221212070431.306727-1-armbru@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Dec 2022 18:25:29 +0800
Message-ID: <CAEUhbmVKz4xsF33FGmZjNMB2BHGa1yfU=gg-dSfxyWXQaYmrvw@mail.gmail.com>
Subject: Re: [PATCH] include: Don't include qemu/osdep.h
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, kevans@freebsd.org, 
 berrange@redhat.com, jonathan.cameron@huawei.com, 
 kbastian@mail.uni-paderborn.de, jasowang@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 12 Dec 2022 10:25:57 -0000

On Mon, Dec 12, 2022 at 3:05 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> docs/devel/style.rst mandates:
>
>     The "qemu/osdep.h" header contains preprocessor macros that affect
>     the behavior of core system headers like <stdint.h>.  It must be
>     the first include so that core system headers included by external
>     libraries get the preprocessor macros that QEMU depends on.
>
>     Do not include "qemu/osdep.h" from header files since the .c file
>     will have already included it.
>
> A few violations have crept in.  Fix them.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  bsd-user/qemu.h                 | 1 -
>  crypto/block-luks-priv.h        | 1 -
>  include/hw/cxl/cxl_host.h       | 1 -
>  include/hw/input/pl050.h        | 1 -
>  include/hw/tricore/triboard.h   | 1 -
>  include/qemu/userfaultfd.h      | 1 -
>  net/vmnet_int.h                 | 1 -
>  qga/cutils.h                    | 1 -
>  target/hexagon/hex_arch_types.h | 1 -
>  target/hexagon/mmvec/macros.h   | 1 -
>  target/riscv/pmu.h              | 1 -
>  qga/cutils.c                    | 3 ++-
>  12 files changed, 2 insertions(+), 12 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

