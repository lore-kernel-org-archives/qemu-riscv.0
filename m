Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E639C5CFCF
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 15:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuuC0-0003c7-Mr; Fri, 14 Aug 2026 11:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuuBv-0003Yh-VM
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 11:51:31 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flamboyant.h.01@gmail.com>)
 id 1wuuBu-0004zI-Kk
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 11:51:31 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-66825847b2cso1322180d50.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 08:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786722689; cv=none;
 d=google.com; s=arc-20260327;
 b=HgWfg3NB1ghN7JDCkA0zRbveRtPNYqfR5eHEqbKxsm1YfL3nNBcd2GFOloVPoV3FpA
 oj7bvfg3QnmdjGaHjmgT9y1h4OcjDfpXs/16yyLQP/OpHsG7XoWQfppkwVsxhDYk6+sL
 OK39y9kt1O6hwX40APQSxMmDmduHzAEBU5M+ZOheQyhMMpUTFG9g8De2mdOX4EGd8M7f
 lXFYykSlUv8BHoeswyYxH3Emi5IQL64f/Ot8WPDk5EkjWrhanx6PkhYgwDQjLnrWql5l
 sKQrMDJXlf80NrD7REzT7d4wueZdT08KZ3+y+u2AmJ3/0jUmJ+Xzjn/8mGzfafd6TM+2
 R/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dUhBMO8NC+eAqyDxPKMtSw8zgeFz//KtjkJmG3llBVA=;
 fh=Lt5AKVOjIwXAvlWLdckarz1KX/t6V8qltLl4xycnzfE=;
 b=Xy7o1qAsqOW4dXtOhsNmKhXR0yAmUiAhX37bWpCbPfmbMeWJqTKo5F9jm6Uh43n2h+
 had0Kx8GfX9xzUw/MQ2p/mIK1w7CR/Yfz3GAs9sC0ymwoZs7n7FrhkdiOOLhqQ2JsCA2
 N1OEq5379r0Jy3r32Bl87BUBY1tJ2h9OmVYm498sQg1E9kX5IrzsFbFhxtoNFT4vgnRU
 9OUfDCfhsLsbeLK0L5nn/RX4nEvB9sc+zbBBCfWDwqRGzYgJhDdm0+939diEg0+kf3cg
 Y0XP6MRwOa9pHW9u8siutyuDcOrN0WHk+/locNJ3dnfTAWf/doKmBtw0njgs6+Vvkw/g
 jiSg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786722689; x=1787327489; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dUhBMO8NC+eAqyDxPKMtSw8zgeFz//KtjkJmG3llBVA=;
 b=CZ+qUZk3dlOIO8BFng8NWnmQcKYoau+iIlv52EN48Zbuex0uHVd4BPmIjUoivt1aZt
 o5CDajcYOlxzr5ncUE/O/EsyQrII9OR3ImAh+RBex4cPc0yTvkzkXhAKTioRGLkjzXHS
 zIz1Q8NpUIiI0o0A6jzWqymUcRUffx4FErodpzbx7G7phEnZIRGV9yLe4mz72f2HdpIO
 FEO6Jj79ga43TWMZzxX6Xbs6Rw0j7CbBFhvlt14rVcWMQm/s+EdkEL/adYR8a0cijPz8
 RsJhj3xo8GdJZ4FnVbDPUmjuOBp4TF301dQk4sPucaqiJFitkxk13m8sshncaOzaj+GN
 P+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786722689; x=1787327489;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dUhBMO8NC+eAqyDxPKMtSw8zgeFz//KtjkJmG3llBVA=;
 b=DvqYmp+qAN+rdPV9Kv3mrKShY/XoUzRu7zB86YeT4esA4Z/Cd0ihcBMkUggszKeNw2
 BFZD/e22/AO00SfDthQIVxqHLYF3xdR/LdMYvwfMLcZeyZdcYNMM15VRLYDkmkPkxusP
 EILm/sF1gt/fK0y+LdJELAWJrbHVs2ovQgCnkA2Z2UMLLsJh1cYXK/XtNl6vCtTxuX12
 PYkMWuCKXEwQWZZxgRb27aZ/Axxn2C+LJCfJFv3GwVwSPA4+Uho6j6xiaxDBykRpPnmY
 Fk5YQBAG8Od6ga4hFEBObA/FrIIT1bRToeyZVkenOKm3Is/EULvcBhtq2jG/zr2VO6Um
 WsOA==
X-Forwarded-Encrypted: i=1;
 AHgh+RphNscE8rsi8N1zoShsozkCTuSw/XUOG2KMbFNSH09aCzoI2bwzsw6NZInWD2SX+f8zgBWjLDhtVEBg@nongnu.org
X-Gm-Message-State: AOJu0Yz0LzeWUsx0lg8vf4B63nMU0VKlS32/OEAw8XJzRb7K1vNgjYP8
 bCi/HXneNj9tkno6KMb90i8h16T3tr7bh+pq1179Tzpkx7M7zE0k/PgiB9PrqcbLZZkJR3y/EvG
 G6XBhKPCxKfokP+WSt613bcVP+ITgDaI=
X-Gm-Gg: AR+sD13kWq7znQdRoMslGWaeV1eOWMtxNPe3CJc/TDL6oFF+DSCbzpWelA/niomkQNo
 APBu+fgDlgkrvctkjhc4kQs2LnuzTUQ33nufQueGMYtk3YvnmPoQqceA14pQkcJ6XYK4bO9Bzps
 S4cXT8xOEAB0YMMwhpQznuDNgZRZC2IuT5obssMcfnsHuRbK1WhCM0pnaXvI5e56/W+SQFqdPGG
 qw57J67IGA2uN6jOItE82iU/mc43LQo4ftWKbNRwVI3waw6mpJOzzszmZbjxopGTr3mrhNHjxVy
 ELCEkzRI8gNpfVjDPXXiMxp3gEp8H5axnNf9Dv5Eypr2Cuhx
X-Received: by 2002:a05:690e:418e:b0:66c:4937:d319 with SMTP id
 956f58d0204a3-66c72d2ec6bmr3064484d50.46.1786722689144; Fri, 14 Aug 2026
 08:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260808182956.290561-1-flamboyant.h.01@gmail.com>
 <CAAW0U4azckLqyWEy=bGRH3Js8AOeW=rpN2+rgkhVStzC0Jv5mA@mail.gmail.com>
 <CAEUhbmU1LYzeQU39eOhd-S+WY6w7A--MOtmcG+cbTgeyCEMr9A@mail.gmail.com>
In-Reply-To: <CAEUhbmU1LYzeQU39eOhd-S+WY6w7A--MOtmcG+cbTgeyCEMr9A@mail.gmail.com>
From: Kangjie Huang <flamboyant.h.01@gmail.com>
Date: Fri, 14 Aug 2026 23:51:18 +0800
X-Gm-Features: AUfX_mx0PcnB9LQoUpT8QcXJ2mmymJCV2pvlJWfkLMmnQeWuTIfb3_ZGFGNKHOc
Message-ID: <CAAW0U4bS=usrkxTruUS=-YEYJ=er2o3tKF4ridZ8ZFX-Qmyo4w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] hw/riscv: Add K230 DWC SSI Standard PIO support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Kangjie Huang <flamboyant.h.01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=flamboyant.h.01@gmail.com; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Bin Meng <bmeng.cn@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8814=E6=97=A5=
=E5=91=A8=E4=BA=94 17:25=E5=86=99=E9=81=93=EF=BC=9A

>
> For review comments raised during a normal process to the *existing*
> patches, the Suggested-by is usually not needed.
>
> This tag is mainly used for *new* patches inspired from the review
> process / discussion thread.
>
Hi Bin,
I understand. Thank you very much for the explanation. I'll drop the
wrong Suggested-by
tags in the next revision and make sure not to add them again.

If you have time, could you take a look at the implementation? I'd
appreciate any review comments.

Regards,
Kangjie

