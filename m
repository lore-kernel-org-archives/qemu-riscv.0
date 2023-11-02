Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E55C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:02:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyM5x-0004fz-1Q; Wed, 01 Nov 2023 21:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM5v-0004fO-Q3; Wed, 01 Nov 2023 21:01:59 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM5u-0006Xq-6C; Wed, 01 Nov 2023 21:01:59 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4a19dac27c4so182942e0c.1; 
 Wed, 01 Nov 2023 18:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886917; x=1699491717; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q092ZBeTjzQvBJNPvec2m+1w27uaIYVwxg3OgbQG0bo=;
 b=CIcUReQvi3HTk47QdaBClgzzWKowu4Cbs+CwQn9KHghnqQ53BPHg1UCBSPLooZpTFe
 Wb+WFhGlBtJdZczeWNXUKIz6oK1iACoejekINS6EW4ItJWgkDhIE9AjqpMxQWoPPX/tr
 FGLcKrAeytQ7FtgMfpypyvUzgPF+lKsTsebRA8JXLQDQE0c8AEbVLtAjGMxz0XxhxwHh
 1+EWT2UScvpEp0QMeAP3trPOVGqZzD74TYG225N5RjDuupLaQJNudWs2Qwl4mDbP+AZq
 ibSxusynVzzr2ptGGWTC84HusLNHqPl1TBqYyXQEku2vjKkvlwexp0A//1iiamp+iXAQ
 JrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886917; x=1699491717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q092ZBeTjzQvBJNPvec2m+1w27uaIYVwxg3OgbQG0bo=;
 b=QUzBPl40xYxzCELCJv5ns46OHB+eV4SWOVuhCtShk/y8+zEbbkykZcuXEgjXVKOI0X
 sCalEUqOSfIdZonB7WlakI990jYnlbm19j9hHmuo3RhIkY0v8pbxv7D+oJzV7Rex/Lie
 S9Ft5LRNS3ttnK0UOIk1hx04EAU/Q2awk8FelZ3qkmYFcar9nflX5C/KWClDceZG3SRA
 CoPjB6DSREMSmmQCme33XCFjRm5tygV/1iuSjSvvXk1yoywsszCd33zfpxM4rrdG58uT
 WC901DjJC+RE6UgAHncH8+qH4IxcjMYFvSaSo3WZQBKsEvmtlVAJMsOLFjIgDPllgYk+
 /5UA==
X-Gm-Message-State: AOJu0Yw7pFWWDUUJIGhngdrf0hsDI6l2EV1DTEWOww0HWv1Fdu5DIkac
 IjjXvI0UfsOUaz+TuIBEM8tK4tgEpPihTmxq+ts=
X-Google-Smtp-Source: AGHT+IG9B3gzuWlQL78qZ/xUKqs2MyAYyBP1pvodWo8zsh9ChYF20Q0/+oezOh7ObSYY+qxwBBW+qMGqDe89QETiYFc=
X-Received: by 2002:a67:b008:0:b0:452:5de9:d303 with SMTP id
 z8-20020a67b008000000b004525de9d303mr16454436vse.30.1698886916504; Wed, 01
 Nov 2023 18:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231030081607.115118-1-liweiwei@iscas.ac.cn>
 <20231030081607.115118-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20231030081607.115118-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 11:01:29 +1000
Message-ID: <CAKmqyKPgcynzcRFhmF1R1VBNg4Q2T9r+ymv+F6qv3FzVb+yUqw@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: update mail address for Weiwei Li
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, lazyparser@gmail.com, 
 Weiwei Li <liwei1518@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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

On Mon, Oct 30, 2023 at 6:17=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> My Iscas mail account will be disabled soon, change to my personal
> gmail account.
>
> Signed-off-by: Weiwei Li <liwei1518@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd8d6b140f..aa5c5d4bff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -323,7 +323,7 @@ RISC-V TCG CPUs
>  M: Palmer Dabbelt <palmer@dabbelt.com>
>  M: Alistair Francis <alistair.francis@wdc.com>
>  M: Bin Meng <bin.meng@windriver.com>
> -R: Weiwei Li <liweiwei@iscas.ac.cn>
> +R: Weiwei Li <liwei1518@gmail.com>
>  R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>  R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>  L: qemu-riscv@nongnu.org
> --
> 2.25.1
>
>

