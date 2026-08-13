Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65971C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 10:16:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuSTn-00031v-3i; Thu, 13 Aug 2026 06:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wuSTj-000316-9f
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 06:16:03 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wuSTg-0003Wd-DR
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 06:16:03 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-669944f60b3so2135290d50.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 03:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786616159; cv=none;
 d=google.com; s=arc-20260327;
 b=BMiY0tEH1v4P9B/uhmbMfvh28ZIIBJd2C03B4wSF/x7GKBuG+Me1FE+IjdEwUObZFH
 o/vvd2NuLbY20HLmZJk+8yMFrqdHqpzDJn98x3oLQBhB32fG/w9Xyl9qPXl5vgVhg3yz
 s03knJh2xCkHRd4QkpaqnfKjyFeOfnUqgdeX/mSRd4FD/k7+P+kjmxfBeHN78y0WmRy4
 zkQU/cVx74/meSzMyTZpsspUh3IHbYTfvybn+sl8Kk84LsGnXxhf0YcSnJ1vBXNfkwgD
 9qfXWs6wojE5DJ98Z0tK5s+xboTkeCU+ZRAICRezyGkQmPqxygFTuM1pYgr57dbuLUKj
 79BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=crZ489l831iQsRa0pu9smOPi57JXQ63OLMfU+qAhNjs=;
 fh=2uDBiVjX23WHF3p6ObWE3knNdwBiV01+wMtEYNkWPwA=;
 b=I8Z737gSfwMdrvS/NJLXsMnmfKO6XM0tnQw0rM7bfJf/WFdqsxNkYVMIAaLzXte5WI
 PRxDP9CL5cz0ZaZflRxL3jTHReIKkedOsfjz1+EufsFrVzMWl/zk6GG7RFzAvhRUmYCk
 c8BX97E32ZTjf++YWTedkaTGdb4sYCQKLhydPopsr0cTKnxi7q2FgQpdEyc7TDb3X433
 rOKTxvmS468+N4fERxwKU2CPAXVsEyx7DrE60i8ZwvG/iClGknmPkMJGcC0ry9q82pKf
 o1qF/gfNl9KH1DVR8eLLvw7t8qQCLnnJ5LfUGjqA4kTl8/J1Ixq0OFa9y1eygIvctcgZ
 Uc3g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1786616159; x=1787220959; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=crZ489l831iQsRa0pu9smOPi57JXQ63OLMfU+qAhNjs=;
 b=BCeZP1o2h5sC0utaDcqddoANWIujsUhXzw66A4XiIr2OrYzo7cFRrNIOvZDg4ERj5y
 ImZfRrD2nbLJVbijGFaIceBMvNSYThTk+eYw9xOVo890pLVu9G7IkF4mw6tr7IvPH1M1
 30bn7s2GZJZB6hZrJl+GRf1a5Gww6Q7GeRuM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786616159; x=1787220959;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=crZ489l831iQsRa0pu9smOPi57JXQ63OLMfU+qAhNjs=;
 b=J7fl+BoOhRYzQGqeAJuzdCsaXznok7quycXTqeHF6rcJkBVfdP+VlyC/0SOliYRHyH
 QjfY9wVFvdNVQuEA+YprpfJIq3AJ//txjOCkCEho8DZfSYJzE3ZkHR6JnhqMSWd/M5Ts
 FGTpPVVZfXqntQl25popjImBkiL3jqDOqSJfgHOvNFVb2Yh91uMxnQPeQqvfCfayw7+a
 epYdeXiXfLFTZfsFPLsuAYRQ2VOZG+ws1yhlDsxFAUIxoEau9I+rA8ZqVHN6RiHG9U5f
 fqPJ0dj5MZdDrm7WNI5IwVBZyGCr7kCIT5evSwHLmOE00MzMUunVXttLcHpni3PxrNXd
 GO3w==
X-Forwarded-Encrypted: i=1;
 AHgh+RppgX7+f5up4xMHnoaBn2D90B1xyWKs8thxpcVHkx3L+bnEh/H7DkHrdy8VO2fyZwivtlS5/KBRVe+L@nongnu.org
X-Gm-Message-State: AOJu0YwguIj94nTko/Jz+fqqNUA5ZPyp97ibkFxOlp671OwOeNOu5k1u
 yt4QlVt4dqYPiw4G8X9mIK+Yp1JGyHngWLzF6bV6v3vE9uVTfRrQiyGW84T7kDM/fgYq75NQzuD
 q6sEB3OvkO/1x85OzoLaZmWws5+poM4Q=
X-Gm-Gg: AR+sD139yuvwCDuWHlwze0jPzih1cs0l3DooQJ2ig+bswxcbzrtO5jB2Gq1oXiqXm3P
 uzfaa6ord+hoCtdB/2GQQ4tRHW/2sw2WPcECdavFe43JxdBBOn/N0rwYNfyiB/dFT6WqftNxXtl
 AfyT9WkuTXsNaUA6Y41Kf5rn9H7hdWIiBgF5Fdy0CD6ln7XRjF2hhjnLAsp0EWCffPFEJzf8Mn4
 wWBMmVn76U4U1YQMGkqVwJaTZ1Y10dmDjTvMa8rgACsRHztf8DsesVI8jWj3FBlmFLN06xVLxBf
 Bf7t9gHY58BX8snbBviGjMeoZmZY8veJEsrG/58HtIPdTw6k/4fCOv0Yuwyl2iHA6tFpfnXNyZu
 3DXObZRaULLpKxwXwKhkKo8XBtVSj5NMVyyde3IdEwkQjVyBXRjnmvZ9QObOYRdTTj775BOYWNQ
 pcVCZ8+9lQfd2/K5ccEWHlevP4QR09EE/m
X-Received: by 2002:a53:a711:0:b0:667:e51a:118e with SMTP id
 956f58d0204a3-66c514c173cmr1692022d50.15.1786616158879; Thu, 13 Aug 2026
 03:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260806133755.45924-1-vvisaev@gmail.com>
In-Reply-To: <20260806133755.45924-1-vvisaev@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Aug 2026 19:45:47 +0930
X-Gm-Features: AUfX_mwk8znExUaJ2xzgyzCycVESvJcluR7oNvx-lMhgsJKoumwEX03KpPImQlQ
Message-ID: <CACPK8Xf9H6aJK8Xj-s_UgusJk+dduMGz1M6tS2z8wGbTqOWmZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: csr: do not drop C bit on misa write
To: Vladimir Isaev <vvisaev@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 6 Aug 2026 at 23:07, Vladimir Isaev <vvisaev@gmail.com> wrote:
>
> According to spec:
> > Writing misa may increase IALIGN, e.g., by disabling the "C" extension.
> > If an instruction that would write misa increases IALIGN, and the
> > subsequent instruction=E2=80=99s address is not IALIGN-bit aligned, the
> > write to misa is suppressed, leaving misa unchanged.
>
> So attempt to disable C extension if next instruction is not aligned shou=
ld not
> change the misa.
>
> Signed-off-by: Vladimir Isaev <vvisaev@gmail.com>
> ---
>  target/riscv/tcg/csr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 36f2004bc5..58c206c1fa 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2182,9 +2182,10 @@ static RISCVException write_misa(CPURISCVState *en=
v, int csrno,
>      /* Mask extensions that are not supported by this hart */
>      val &=3D env->misa_ext_mask;
>
> -    /* Suppress 'C' if next instruction is not aligned. */
> -    if ((val & RVC) && (get_next_pc(env, ra) & 3) !=3D 0) {
> -        val &=3D ~RVC;
> +    /* drop write if RVC is cleared and next instruction is not aligned =
*/
> +    if ((env->misa_ext & RVC) && !(val & RVC) &&
> +         (get_next_pc(env, ra) & 3) !=3D 0) {
> +        return RISCV_EXCP_NONE;
>      }

I thought we'd already fixed this so I went hunting. This is similar
to Nick's patch:

https://lore.kernel.org/qemu-devel/acTSDKzeEb3bbv08@lima-default/

I think the conclusion there was to additionally check ra, and do
a qemu_log_mask(LOG_GUEST_ERROR, ...)

I don't think he got around to sending the next version of that series.

Cheers,

Joel

