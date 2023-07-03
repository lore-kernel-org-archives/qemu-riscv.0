Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AFAEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:43:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9Wr-0006kj-12; Sun, 02 Jul 2023 22:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Wo-0006hb-KK; Sun, 02 Jul 2023 22:43:02 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Wn-0003Km-4U; Sun, 02 Jul 2023 22:43:02 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-78a065548e3so1501060241.0; 
 Sun, 02 Jul 2023 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688352179; x=1690944179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDhP42FvHcsS2U6/kUBzTXVcolqMQHs4/qX4p6+Ieps=;
 b=DxV0MyaXhs/PHpsy74bd46E/s8NzSqsy3ut6TAh589m92tuRJ/K9U8t9LoRazBi8QM
 7j+BUrgks4ZvMGeoa6rhq0eG/MXtT6YZyLo/ZxZOjSiGdLWlvVPGM+jdjVkG7NZhSjW4
 Oaey20eNamGp1b+MkN0QeozJA7NrrtMAJOWZ7dSdOY6uxTiYaa4guF0fl0rjUcJq5eSw
 JvyD5h+13CRlHGZuIaghihfXlEGn/a1MupP5MVgSOziEjC46mpjPbgbJLcGkU998g1li
 YTUBJJBxyn8RUXC6PYfWLh/fHTSBmx09+AW3GCMc8pQycYmu1KivOGywc4b5MrZzV2V7
 DSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688352179; x=1690944179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RDhP42FvHcsS2U6/kUBzTXVcolqMQHs4/qX4p6+Ieps=;
 b=iNKsNZ8R07GJgVO6G+TtXWxBYXHRh1xGShkO87p8lu3adTLeV36ruTptPt2KDPUcNZ
 hXwv6qiffQflEhl1ZWSjst0cPw2uySOeDTUhgkcNvOgfjnT7S0K1FisPTd2Ybx07i0yN
 7MKcaEQ3Mye+4HHpcBPfsTZwL9opS4sx03Sipheug4dvaKwvvLPwELCufQbsak5nQPOE
 ObZ8NqFh1Myh9U1ak2Am24rg2j5EAZCwTn5a6rtnnEsq+8iXJq2dy5qywAYPoP+W732/
 muHAPixpvkcJ0pyK1W5eHd5y40rH/mYlgzUUmmlTbhQgnSd0Hll6xYB41AiglEBmk/a4
 NU3w==
X-Gm-Message-State: ABy/qLZ2lT/7ZU+sCeE9wY4DLN90TJja1KCNxc1jRMzd7O7nxbaX0tcv
 3kPR8ZcWmlRvFCnhrW65tGQkMrtWvj8eG3I4JVI=
X-Google-Smtp-Source: APBJJlE7R3tNWWy5hRq29pKzl8T9cf7AxmuxL/BOJla79ppGhd57dmZlKwlf2FyNkmzgUPfnGXgcgv+LlmVPcj4H75M=
X-Received: by 2002:a67:f8c2:0:b0:443:5af5:8128 with SMTP id
 c2-20020a67f8c2000000b004435af58128mr4422769vsp.0.1688352179525; Sun, 02 Jul
 2023 19:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230628103651.55194-1-reaperlu@hust.edu.cn>
In-Reply-To: <20230628103651.55194-1-reaperlu@hust.edu.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:42:33 +1000
Message-ID: <CAKmqyKOZfx0kmumiD9NkV2kP=k7jUBdS3uGFPqJ+LFXWoPte7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Remove redundant check in pmp_is_locked
To: Ruibo Lu <reaperlu@hust.edu.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, luruibo2000@163.com, 
 alistair.francis@wdc.com, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Wed, Jun 28, 2023 at 11:34=E2=80=AFPM Ruibo Lu <reaperlu@hust.edu.cn> wr=
ote:
>
> the check of top PMP is redundant and will not influence the return
> value, so consider remove it
>
> Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9d8db493e6..1a9279ba88 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -49,11 +49,6 @@ static inline int pmp_is_locked(CPURISCVState *env, ui=
nt32_t pmp_index)
>          return 1;
>      }
>
> -    /* Top PMP has no 'next' to check */
> -    if ((pmp_index + 1u) >=3D MAX_RISCV_PMPS) {
> -        return 0;
> -    }
> -
>      return 0;
>  }
>
> --
> 2.41.0
>
>

