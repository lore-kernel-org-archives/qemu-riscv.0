Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87321CAC59A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 13:45:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uysSz-0004U9-GW; Wed, 17 Sep 2025 09:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1uysSx-0004TE-F3
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:44:59 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1uysSt-00048j-WE
 for qemu-riscv@nongnu.org; Wed, 17 Sep 2025 09:44:58 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e931c71a1baso6390058276.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Sep 2025 06:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1758116693; x=1758721493; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DnAo/2DPNzNJlRCruVcjhGpDofdhOKJsOj0CkRAW0IA=;
 b=W90MhyGYuXGydLIG+rKt3TVC0EU71Hi+qM7uhMSxpmARFPvFRfgdlZXTOO9yYT7p8U
 BSniosN1bQC8i60K4YKG9JWi9XB0NXXD9Wbu6OY2G0vjnL9hWiyb6FJ+fctx+yrmkmM/
 HBvSaOL2fYHlb9MLh6VB8PapHVzwkjRPI5Nbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758116693; x=1758721493;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DnAo/2DPNzNJlRCruVcjhGpDofdhOKJsOj0CkRAW0IA=;
 b=m/WiHpfGWiLShVK1411e/c1j12v2gqF6PxSfs8Lela3ucPLPusQSvJ/bS1vYoyzwzD
 XrbVUMZnh3L4ulxWEYpmf0Zw07NNW4fX1caFFdqMHT9dLzuTf5OZpbHdUP0w7aeHRmKp
 VzGleiBsRazmkt/mczQvfhCCXUCIph2hMPjPQNLJ8dTzFJNY/FhJut95DR61XFChSYYF
 P03f6OrnoV49Uxtkj/BNZahA51f4YjNL5teSVFILYmw7xYdsmpG/DIE0LATKwHELIv1X
 O4zHHg7c9LiTqqcsqWrkjTEvMXJ3xjdfozFspjEQ6ipWIjkibTpOfsuSI++7EDckT5kG
 CQzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6MasqvlVEeeT95rh/MSqbbGHiD0XE9TEjZIIziCr+mB5Bz+Nx6xME9pANxV39nj/063IKlBv6xFUk@nongnu.org
X-Gm-Message-State: AOJu0YzO+7ACV6CqX+shHw+Tvw331gkp+jZgEza1e8kfGW3ML9k1XmGD
 Ednj2dIlzl2CmabzhSRTy09uv8HUlt0rm5meg0yIe8BD+CZf4UJcCeLFfMqkFyvR6TtQWQcRnGm
 ffRC6FIYyDScfFJ7aYxHEv43yN0aAka4=
X-Gm-Gg: ASbGnctciI+Vw1/y5RGasPDEF+TUyTkn93tnkiygf9Abt4ZdlDHOaFKV1K+SfCXcrtb
 yfYIUB8qbsUtnlsAf2t6kEPtr0oRS4EiBOSk6dkzm0tMtPrNiNTSCdUZl8E6lLuUGkGkLLrrFHe
 ibNa8u6XsUbPubAJM44kzLKqQvlbUjNJixO+aGdrImQDMV6VOf3K3wSSB8F/eQtg2GeB1tYFicj
 igiggA=
X-Google-Smtp-Source: AGHT+IHgmMs5+X+sQEWEMHFWE610CrlbWgH9A1Rc6LlrOXPzIxlnt/SDMG6N3YwrHeDPmFn7nRAks5AfBQvM/zPEkLU=
X-Received: by 2002:a05:6902:6283:b0:ea3:be0a:ccdb with SMTP id
 3f1490d57ef6-ea5c06ca785mr1698131276.49.1758116692811; Wed, 17 Sep 2025
 06:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250903030114.274535-1-npiggin@gmail.com>
 <20250903030114.274535-3-npiggin@gmail.com>
 <6bff4c9d-1da4-40b3-901a-789923d8ef7e@ventanamicro.com>
 <qyikdqxxiewb7tqykt74gpx5oereckbepyptd3vr4flptmrvoc@midnt5c7agnc>
 <3dd9888f-be16-48f8-a858-f58a5b57825d@ventanamicro.com>
 <188f0525-154e-4d08-a155-68e8800e302d@linaro.org>
In-Reply-To: <188f0525-154e-4d08-a155-68e8800e302d@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Sep 2025 23:14:41 +0930
X-Gm-Features: AS18NWCeGWFuyoGez7_HVxFGxkW8bU2PFEbxZV1W3p48u8b7E3YyLpPT6h8kHMY
Message-ID: <CACPK8Xd183vLgSyNfjzN5caUeJGRrjM1J8ugTVRd2k0Ea5LpfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/risvc: Fix vector whole ldst vstart check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-devel@nongnu.org, Chao Liu <chao.liu@zevorn.cn>, 
 Nicholas Joaquin <njoaquin@tenstorrent.com>,
 Ganesh Valliappan <gvalliappan@tenstorrent.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=joel.stan@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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

On Fri, 5 Sept 2025 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/4/25 13:06, Daniel Henrique Barboza wrote:
> > How hard it is to update the GCC version we're running in the docker images for
> > "check-tcg"? We would like to use a RISC-V vector header that isn't supported
> > ATM.
> If debian packages the gcc version, then it's easy: change
>
>    gcc-riscv-linux-gnu
>
> to
>
>    gcc-NN-riscv-linux-gnu

The test that was failing uses debian-all-test-cross. This is based on
Debian 12 which maxes out at GCC 12.

If we move to Debian 13, we get GCC 14. Something like this would do it:

--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -6,7 +6,7 @@
 # basic compilers for as many targets as possible. We shall use this
 # to build and run linux-user tests on GitLab
 #
-FROM docker.io/library/debian:12-slim
+FROM docker.io/library/debian:13-slim

Is updating the distro something we would consider for this development cycle?

Cheers,

Joel

