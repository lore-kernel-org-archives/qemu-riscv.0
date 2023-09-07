Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57119EE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 03:02:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe5HF-0001R5-Hx; Wed, 06 Sep 2023 23:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5HC-0001Ql-P4; Wed, 06 Sep 2023 23:01:50 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5HA-0006OF-H2; Wed, 06 Sep 2023 23:01:50 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-44d4d997dcfso199918137.0; 
 Wed, 06 Sep 2023 20:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694055706; x=1694660506; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0EC/StpIzdm1vTgCkZbLeaZAszcVz8fC0cOYnfdPDY=;
 b=U2mJ5/AeIYufY/yjMGywfa6cTzK7AHdmG4K5lfKW9UCH66Si/+mkeZARaKn5LPdym0
 zVJp79uBwd5G9z+oa+UtyaRcwj9TohXofX9GlanQHWFGqqVRuCxFZHqKiH8DgItQOZma
 QztMIUuogGRLvsO0CneVY4/WHNQokSFZUaray+/ragd7SJSn6BZbCrXNdeZAN5hI8YZe
 0xjIqlJf4FGiEe1pQyOTDOMvuM19X9eRKZMChQ7khP4o96cCm4MUfwnu3ORqFxhz2KlQ
 Guj9Oq1tdbad2wV1qdsfJOUooCc5tA4GOU7vdZPzhgw5JzWfBAA3H44BkGS+f4nzojOS
 fvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694055706; x=1694660506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0EC/StpIzdm1vTgCkZbLeaZAszcVz8fC0cOYnfdPDY=;
 b=DeeTe8RoZGIN72VmYlWsZ6HcogKAiIg2UCa0RQqQ5Q6alcrHAKfhMx7VLHUHiHsR7u
 ILBYIhWWZ9KI4Ee5zlBZPx4a1ShS99zTMqEBXPoaJPDXDHvrxJdqmzcAv78qzG4qnybI
 WlyO/qJvJhW30KJWLMpAKFefMbrhuXB0BKZwNdENa6bPHwAdLvjTdtA7G1lEe+MRfQu/
 HP3NPuxbKmbFpk3JL3Ez2afkiWNWdX4bgCCnDPF5GYSBoGg/X9EB079Jq6WQW5qYzAPu
 ioinOmlxNVhLB2WY79H4aN+dF6y7j282DRdlrw8j3eCD3ZPAzcWZRUCPbxGHv5hQvNwR
 +FtQ==
X-Gm-Message-State: AOJu0Yw8Hi/vwbRIJzFFVG3H8DmGiQtEIBk4zYDGU0Y4vzjsK+Ad3yUp
 oYwAFil4m+DziYr72xRor6+7AyNobPuBZKFwaB8=
X-Google-Smtp-Source: AGHT+IGA+DLwMCWATDOJPz6RBvLdgB3HYtVdbZVx34H6dZuq3WadI6gwByhsgPHAxHEZHXq00nZGfw+V3fKEwqCrUKI=
X-Received: by 2002:a67:ec19:0:b0:44d:482a:5443 with SMTP id
 d25-20020a67ec19000000b0044d482a5443mr5132711vso.11.1694055706121; Wed, 06
 Sep 2023 20:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230808090914.17634-1-nikita.shubin@maquefel.me>
In-Reply-To: <20230808090914.17634-1-nikita.shubin@maquefel.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 13:01:19 +1000
Message-ID: <CAKmqyKPO6hTfsqz-M-YXM+KeD7LQQoA8CjVd-Z7_w7j4NeWUMA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: don't read CSR in riscv_csrrw_do64
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Tue, Aug 8, 2023 at 7:10=E2=80=AFPM Nikita Shubin <nikita.shubin@maquefe=
l.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> As per ISA:
>
> "For CSRRWI, if rd=3Dx0, then the instruction shall not read the CSR and
> shall not cause any of the side effects that might occur on a CSR read."
>
> trans_csrrwi() and trans_csrrw() call do_csrw() if rd=3Dx0, do_csrw() cal=
ls
> riscv_csrrw_do64(), via helper_csrw() passing NULL as *ret_value.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changelog v2:
> - fixed uninitialized old_value
>
> Changelog v3:
> - reword comment and commit message as Deniel suggested
>
> ---
>  target/riscv/csr.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..c5564d6d53 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3908,21 +3908,27 @@ static RISCVException riscv_csrrw_do64(CPURISCVSt=
ate *env, int csrno,
>                                         target_ulong write_mask)
>  {
>      RISCVException ret;
> -    target_ulong old_value;
> +    target_ulong old_value =3D 0;
>
>      /* execute combined read/write operation if it exists */
>      if (csr_ops[csrno].op) {
>          return csr_ops[csrno].op(env, csrno, ret_value, new_value, write=
_mask);
>      }
>
> -    /* if no accessor exists then return failure */
> -    if (!csr_ops[csrno].read) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -    /* read old value */
> -    ret =3D csr_ops[csrno].read(env, csrno, &old_value);
> -    if (ret !=3D RISCV_EXCP_NONE) {
> -        return ret;
> +    /*
> +     * ret_value =3D=3D NULL means that rd=3Dx0 and we're coming from he=
lper_csrw()
> +     * and we can't throw side effects caused by CSR reads.
> +     */
> +    if (ret_value) {
> +        /* if no accessor exists then return failure */
> +        if (!csr_ops[csrno].read) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +        /* read old value */
> +        ret =3D csr_ops[csrno].read(env, csrno, &old_value);
> +        if (ret !=3D RISCV_EXCP_NONE) {
> +            return ret;
> +        }
>      }
>
>      /* write value if writable and write mask set, otherwise drop writes=
 */
> --
> 2.39.2
>
>

