Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB633CD98F0
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbV4C-0007sH-5M; Sun, 21 Jun 2026 23:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbV44-0007r4-7E
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:11:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbV42-0000RQ-2Y
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:11:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6870ad8072eso5852485a12.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782097868; cv=none;
 d=google.com; s=arc-20240605;
 b=idR2Mwv9XZiBvIBKeXJp8zjl8ThUoQ3c96zsbnDvHgcCMI08Yb2XuqLzRepiG0jH0/
 ZsbJ5FtFLlDnM2MjL3H5I5SKEDQySZflWntFu0tKcE8M6FqXj9iI9fj166tANJPHPxFn
 dt1i0YKyI8W3UUcHZp2MZfZ2ZlfMKO9NLxVq4HW73bvE5/pDErWoZw1LohFxkTtCW1Bq
 CrfT3bLP4UIOizvXBHgJT3oI20UFXwt9CZJ8d1gEoidCUxvKi8+5duA0agJrVRvtSE9n
 ji6u6tPIe3zY2lkxuAZhHIGgrr+1esiz//a41s/BIjwKusx/f7sUSSx+n+4GfWZcqumb
 UKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5251lJHZna8xSeEEf+SDbVoy83ed2bMtD6Z/OC+BWA4=;
 fh=8lZaBsw+dL3BtBpd+ID5caDu3yYiRKFMLk3cATRn2U0=;
 b=lApVWk6TWOeAV1rAcisjgDoHLhKkRfRQ9IY1/C1jPCo5pZb4qoNDtnkwrCahDjv8b1
 CZMSy+u+1u/3/VUH8iZApo+T0xeCoa+HhiPnTL/M+5eGG2e3uBYBkcVpHrPykBAR4fX5
 drDyaD/0QlC9XPjNXphmS1sLwRRYAxcglt0XwsKkx1wzPXDD1mYPy+ISN0s16dM9fO+3
 BZZ3KDznVKCF5w8wn23cVSQHjtnQZ7Se4dLrIpJOOT4MxnTe3aMvt4TdAsqMdSccPSP8
 PAcU6fQ07G3uBQag06WX/pXCFNVisFwmuu78KUgrlx0OFjkpCHfLVCovj1ShPXQpjXX4
 qgGQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782097868; x=1782702668; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5251lJHZna8xSeEEf+SDbVoy83ed2bMtD6Z/OC+BWA4=;
 b=R9Wx0Qs4yYQ3om/bjHfjGWDONfC6TWFhaMw/DU+IeTIgJgVco4wQ/vYlXhIDKR71e2
 kgbxMalBY0DsLsnIkMxG1qoE3XnGzUs9pdkcWfPhCjmq+BHjLSEUvo2vhl7giwoRxDgg
 vMj7tHsv/PFmMCgLuJbMZ/fSmGiZ6CWTy/GLVZcEveZdNvAfZJRcX4+u+EHcL0PVzHw3
 EXCdpiyNXlObdY4dDQPoxyUtvrPs+bx9NlpYpV+Z8wLISBDVNK3KdyUv9KUbVQs/kg9g
 ezEZ8RmM/QRpLuvD0nW3FzDx+m7S4CWRLYaMxyKeqj/gjGiLaQ9ucE0FWmDj+6VdYl+b
 j94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782097868; x=1782702668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5251lJHZna8xSeEEf+SDbVoy83ed2bMtD6Z/OC+BWA4=;
 b=FBVoTUG2ZFMKs3RWro90cKl60UwaArr1PBXsrENwr4v8d6wq2jnAKMmC+4wAI31FBV
 uXZrxVPoS83089YYtNYp72lIfp3Vid/0xxsYzkJbjkcPFrwlRqU7t1rupGl+ALk3+BBS
 3YG+lvKjX9m1sX021on7AovofP60Lj2hLtP3TQx4Q4Jd4i3Gl4/gDp+FrNHRj4xyWR20
 fAwaAuwZ5wFfCTrfBhnFWRRVfZ4y0IgOFQsRWG4rL6+NLOMatAFGl0eyXlb3ZysyNOcS
 65cfz5V4IuY3ZH/Db8CZ0uqwBv00jhZKUHquVLttRzce483bLIQtl+yBIc9+T9npW/02
 xmtQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Qe3fGb0SA+tBczWJCc9Q0kwvbdAU0mIyAKgAzYExuBVKQUy5vXmh4fwQxFH0LzV0njB0hZh6bB9/O@nongnu.org
X-Gm-Message-State: AOJu0YznS6Kg62rTw5UKt3rzByUuhcwDxEYhcqLRnga4pmFDNY4yhDKR
 2NYP5rqUVF1Um0D3hr/BlNgnDD2APou+CLFZTBEnUI+ZCKKOKD7xxkSLJCSacMv2DZ16780kC7P
 sqC15b4NjWyAENVl8B52di5WiBtsEPYE=
X-Gm-Gg: AfdE7cnW8kD2zAyL7CqmiH54mhXd5apThUBv23NDqtnZUSR+qGay/+wIbQxZeUyHzoO
 G8sjkI5cBeaohdFNHUzvB6MqELA8bQV/qZQ0W7OmRzyyEYe3PEEwsW5bccutpVmrZgpskdTjqz+
 7iQXuT0jdQWSnDQvjDdpp0EsFxabUV4aAAbjdH7u9X1sn1fTn4f5xhxFQkS0mEUFz2k4z5WVT5I
 THXNcOXpw0rqyrviKFmPjLaFpBTxv+EH4Mym5X6HSzZeHkzP6kXCBB+QSh+5bhLkcq+6+3un+AQ
 cwSe3iip6WHkG94xUYT9EIG5jpFZ9VY7UUuntg==
X-Received: by 2002:aa7:c74a:0:b0:697:645b:90e5 with SMTP id
 4fb4d7f45d1cf-697645b9235mr3088617a12.4.1782097868438; Sun, 21 Jun 2026
 20:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_FB929239B227F05F30D62745E38BA01D4307@qq.com>
In-Reply-To: <tencent_FB929239B227F05F30D62745E38BA01D4307@qq.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:10:42 +1000
X-Gm-Features: AVVi8CenqP06vFcsdLeDhxSThVRD5GK6GLikm8IbaMn4jsT07kp4jCe_daBurzM
Message-ID: <CAKmqyKMDznn=Dg3dgkTw-9K-N=8fDetGzwR4s6fybasHbf7GSA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: avoid abort when reading vtype before
 env->xl is set
To: ZhengXiang Qin <qinzhengxiang@foxmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Jun 16, 2026 at 1:11=E2=80=AFAM ZhengXiang Qin
<qinzhengxiang@foxmail.com> wrote:
>
> TCG plugins may read registers from the vcpu_init_cb() callback.  For
> vtype, this reaches read_vtype() before env->xl has been initialized.
>
> In that case read_vtype() currently hits g_assert_not_reached() because
> env->xl is zero.  Fall back to the CPU's maximum XLEN only for this
> early-init case.
>
> Fixes: 638181a180bd ("core/cpu-common: initialise plugin state before thr=
ead creation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3545
> Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5514e0f455..6ade7ccb0b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -936,7 +936,16 @@ static RISCVException read_vtype(CPURISCVState *env,=
 int csrno,
>                                   target_ulong *val)
>  {
>      uint64_t vill;
> -    switch (env->xl) {
> +    int xl =3D env->xl;
> +    /*
> +     * TCG plugins can read registers before env->xl is initialized.
> +     * Fall back to the CPU's maximum XLEN in that early-init case.
> +     */
> +    if (xl =3D=3D 0) {
> +        xl =3D riscv_cpu_mxl(env);
> +    }
> +
> +    switch (xl) {
>      case MXL_RV32:
>          vill =3D (uint32_t)env->vill << 31;
>          break;
> --
> 2.43.0
>
>

