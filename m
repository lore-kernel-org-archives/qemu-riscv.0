Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CA6CDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:25:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcvJ4-0001Pj-G4; Thu, 25 Jun 2026 21:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvIz-0001Or-Uj
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:24:30 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvIy-0006R4-Bh
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:24:29 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6974ef0c3b1so483706a12.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782437066; cv=none;
 d=google.com; s=arc-20260327;
 b=B9M1tTVTu5bS2K0lhyOdRJgy/Q7hzllFOTS5nuR13Z8xyBaEvoe/lIONHMp2O5TL1Q
 I6hqu6AQ8uT09GikKRj3b3SeT/OtNdGE2s74V8W8aGsOHO7yx2ES8hrvenWGtzaKp5F6
 FvZ5SmuPoQtcVmLjsUIrSX+M905rVS5WLfDH6LFRjHwdWaUQhtNthoVLzB+5Wadxe5Af
 zgW4EW+ENbGhmk4y4Gc/nKontLsB1c1/vfA3Hofsfw+xyRbyOQQ54GIH8S6OLxJh2OKV
 hvk6CvzxC2OgeR6vdI1jZZ1iIM6PWhKdJV86ykfVnbuTenNLaMPA4BVTZy+ZTtwwYMhV
 +CwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6aFSE0QtIX76LK3aJUe3u28K91h4HLU3HkEZ6L9j4tw=;
 fh=i62rpRCZmGP0zzVABaYQ+Hf0qrjlwtYDpxkx+cAfYd4=;
 b=g2yb8jIEy6A6s2GtWd/yVbIaahgbfFwttQRyTKGDibjtxwOQJwORVqNYGCCn/PFiCr
 XVThxrc5YMnPc9nvhfJBPC4cR4DwNcgbW4I+jZwjjBCm1UuTKj7N1SoqLFQr37oi1WPf
 0Y1y9lxt/cN5gyY3ldR7wBhXPd4I41Q65GFGzsHPeWNxm+3KRGKJVFgNJ7d6Itui4Ba1
 2CgeE3jCPoKBJ5Ij4SrFNZ7oCjU9zp6ta9B8EZvgXZ0jluGtPLa4zkTaFYptk/6/oRi3
 WgzriogP1P+VSwPWldf8bQ0sWJI5K5UI/zL7d2GvqhAhEgPbdpOFtcq5pvhv5Leu9nxG
 tF6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782437066; x=1783041866; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6aFSE0QtIX76LK3aJUe3u28K91h4HLU3HkEZ6L9j4tw=;
 b=d7oW7cRRKDI6nnRpdpPK4+5+JXiRtNxpekCGrnaBLKRGDAH7T5JjY5QsZehiKSpy9C
 3ISA/ldYBqJ9MoEbxcqLibHtOwFTiWq0KRJs+ip0KhM3/OUMOw7I12j2mrxTqVw0wKoI
 b9RpZvJbC3QiztMLG27XHVly+4uPXkQvuT2kX8m9HOmVgF604WHSBpJDZVUkhh4R69Ws
 IyxokuQghMWCNz5HXf47gLHtoaIlr04uax7ECRpdR2+NfJConT7tiPMoJ0Yi2VwcStU9
 qhkFUNvk7FJlVfmzOWjBAfCF/9H60Dcg1j6pXOAQ4j6K/dOdIa/gAjXcqksg/duJVfZ/
 8odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782437066; x=1783041866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6aFSE0QtIX76LK3aJUe3u28K91h4HLU3HkEZ6L9j4tw=;
 b=gzO37ahKE41wbvuECUr2vr2GlR5CECE3xR8w/Hfq7xzgJiQtHzlngwxbvDWFK461md
 wimJzysd0NsNmHbYt++QOqfo3dlXRe11Lx/NXc/tBP7dIshengdiAyCv0++DT8HCr2Qd
 XBcDNAOfz81F9xvfrPra1k9gEK88rqibZnWoq9cNrufcjtECZeR3omVvseeWk7UrKTRz
 endcSbOc0Sk3p4XRT27vHFQEHrOQO/fNGyuFrGpR1FcoNrJrXWT4VDZXBmnqTlf8tU7+
 iGmZ7YaQblQ9EvZezJneGXNQ3HLhY3A5lCPm2CfA4WC8X4eICMaZLx8eURBIi9PrXXA+
 mR/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpd4uO04pAnyBllNwWHNAgB3XxBzY7z6hXK4UWX1EnUC3TtLWtHuSKk+b6XBKRHFPt9Go46RAkx1ZJN@nongnu.org
X-Gm-Message-State: AOJu0YwIRlnWKi9rb7OZrM06QPyQd/LPX3ermshJKZ/dgDjkYSGBstFp
 nquzaUeDV85gqK34VZTC0TMgE5Sbya2SsYMydvFSY/o3kYIBryh8NnLy8w0Byo0a9Xdb75DhqOH
 0RZUbuv0t2iB9V19+0DVGoH0W3p36OXc=
X-Gm-Gg: AfdE7cm/nXZ/Bfp9ZYu76yRlEYIIM44lJtWaGgNdB+FKiKhiaSiNpMIkEWe6PgvzVdB
 njGFWm0Bp42sSWOOQOGW+enO7cFiRPtLbhTo0JABAq8sc2LGdo+WFpx1JCRV2xFpW/8YjD+swa0
 XZ54BDVB003k5DFgKHKeNFxEEaY/8fkvkATxSuqEBLEuwY/q6Lv6O2xDXrlkivEtzfmJCD1CwcP
 HlsJRr8Yfkddx3vakMFrMeiw0aD+IqRoQhpDVIPBIJ751Xhd/HG/leBB3joV5LTxfS896M4yfKD
 u9onP5vy6zHNvdXqh4jJIBzpY64=
X-Received: by 2002:a05:6402:51d2:b0:697:750e:e9f5 with SMTP id
 4fb4d7f45d1cf-69810ae06c1mr835672a12.23.1782437065719; Thu, 25 Jun 2026
 18:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-25-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-25-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:23:59 +1000
X-Gm-Features: AVVi8CcDHAKsNTE9w0uiKTR9BIEsft8XDAugUtH3sGX0aP55wLZcge8LAJtWmgA
Message-ID: <CAKmqyKMb65w5=e7BE0zwxWmoNbyvy90hiKAx+R0-v=3mBv4zyg@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] gitlab-ci.d/crossbuilds: add riscv64 KVM-only
 build job
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
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

On Wed, Jun 24, 2026 at 10:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> From: Zephyr Li <fritchleybohrer@gmail.com>
>
> Add CI coverage for a riscv64 --disable-tcg cross build. This ensures tha=
t
> RISC-V no-TCG/KVM-only builds keep working and prevents TCG-only code fro=
m
> being accidentally pulled into common RISC-V sources again.
>
> The cross_accel_build_job template enables KVM by default via
> --enable-${ACCEL:-kvm}, so the extra options only need to disable TCG.
>
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index eaeeb533ce..a823aaaa21 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -59,6 +59,14 @@ cross-riscv64-user:
>    variables:
>      IMAGE: debian-riscv64-cross
>
> +cross-riscv64-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    - job: riscv64-debian-cross-container
> +  variables:
> +    IMAGE: debian-riscv64-cross
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
> +
>  cross-s390x-system:
>    extends: .cross_system_build_job
>    needs:
> --
> 2.43.0
>
>

