Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC43CD8CA8
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 05:37:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZMUh-0002XP-38; Tue, 16 Jun 2026 01:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZMUf-0002Ws-5X
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 01:37:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZMUd-0005Vq-Gs
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 01:37:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-68d233bf083so5765950a12.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 22:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781588265; cv=none;
 d=google.com; s=arc-20240605;
 b=jkGf1U9e9hYdDw+hY3J4Ge0gyDn7HfmbE7wEGEmm4FWSydD+r5pjcmT+QgC4BQlVlr
 OH3tzkOexDVH+hS3vEuPphfPm5ia4Lc8YwXrfYm5Pin1s/fdnF8Y9rOeqjBYGvrdHkWx
 fP00dcZk6Gk+4J3YCJs/Wm38x9JoOfNGbBO44iH3YPZa6KSs4M0HtXWii0ynwOldCtJE
 5+nGPClf4V8POi17A3mWEACNCqXv8j/w9s1KGOorsbeMGnh5YS2V0Z6gAy4jTs9oVCyc
 cXQGGT2ajp2LSuOLxZjcPjiYS+PzkqIVN9FuAUV9gkL/26bNGO9zkh0l6R56kDeqM3PS
 m9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5uFwkG+95qzaTNv1FdhD4Kjfag1rKFrdZyhPBHtmxOY=;
 fh=68e+OGROc8T9h9MqpsCObQQLSPzsT8/3DaC6mo1GTYE=;
 b=gqXegJwpNJzGwldDuOvhAnYxmsKBcqYQD1+5ZfaBTEO42mQKXU4C8Wq3czXUfPpmg3
 Wg4g7nYIQbVe4tiVyz+J1R9tv0TBmbzHnHfjj7gqQ3yU38vehlX0qEJTCHWUpoz/MjSU
 2FlG1+2OKw6QKNZDmLY+bxdK1M27oaKptDjDDrOInWpPfwFiutPq+4qhSgSvWje2XSFa
 2R4V9tdVXnd44MJHlyn6Ba7d6tDV9GMVy1mdLe9ZgjDqQwP249FbccZ2xgQ27njfzmBJ
 UczQjO69d8OEQugqQpErVBbktLEX6Un4t7DuU8EH4OpczWrEtWqj9KXdopLGve0Ztuqe
 oqzQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781588265; x=1782193065; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5uFwkG+95qzaTNv1FdhD4Kjfag1rKFrdZyhPBHtmxOY=;
 b=LkjW74PAf74H1/vI7f0Zm46N9j6dgwlwlP/Sepunb2u0gLrYW6XphUSjAp1vr/KdMz
 kynWbuR0GGVlta6jZQt8o3b0GUBKshqPVW8XQqbbH8xeQ2+2u3sgpFymKG5K6Y05Sy2R
 AXqINTeNIE/Z7JXbaAPFIY4DQiJ3nifsxdG7Gy89OwysTuxlUN8moRHMHH7Zi37ihpNp
 jRUN00UY226xsu/nooQN+ssyAqbwY0nDxuwbIERK2vWUP9nkM4TsaeqrOE1AmydW4rkB
 vlKACMuWwH7G38FmZvcCjWj1nfWvlMQL6nLd0sA3i2APuSe9fa97XEq2ghk16KXp5kum
 ZI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781588265; x=1782193065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5uFwkG+95qzaTNv1FdhD4Kjfag1rKFrdZyhPBHtmxOY=;
 b=oYk3+99m46JgUYZmrS+XR9JjC92X4AK439ddFOKdcAYR/da/CgFE8t6pOXTmtu4qcq
 s85R67LGbO/NXxJdewcX8jd8Ux0N4Hvor0l3UvpQ8g4QfVjyHG2tXTLPXnyqYuc8Bn4t
 kJMbRzAZOqmEPLGJ+GHBHtudROhBsAeXBQU0J0Q1m8ET2ltTHxQzcT24kfoH65EXK3MZ
 hO876W0tRj3m9MvFFxoRS0nawNYxEuMEX9TuCMqp08tvkH8Q+AZeMyt0suILCunNAg4B
 yLjRd+kkYDbrPZof+eZiTPrMhwC4pW02+tN7EeVRYNGJh+5KfZ6Rba91EWBoof4g4FB3
 mEAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Z7wF74xAFENXluCnKCAevWSvtU1v2mLW142Ytkt6G1TNXiPxp/IAqQWIV/wKAK3/JfeuSqimQzqeu@nongnu.org
X-Gm-Message-State: AOJu0YzNdd+48wjxP2cniTLdOvQYf2HmNA4QCSNOrQaA5dvpdSgg3M7I
 wrCGXMlukGU3ZojRaJonPq4UdVo/yk113lbw9+lqZMJpCC9XIv8qMjQVbf72MlRroMHFh6UCZg4
 pwwJbETiDIE+WqtoFIF1ciPhN2ZmTTrE=
X-Gm-Gg: Acq92OEevNJo8KCT8AMqYxvVUJywm7A37RLgHEesIEbTDKECpFo+hujHD8PZjakAlUt
 KO8BvbDaD7uRPvMrZIbwIyIm/HOaMPy0aVwHGSRJn/FqTk/1bog4TtSHBYHJljDUuu/N+iVkN35
 2VVx3PI7yq82dcufpfI0xlJkgHgt1vruEFRyEpCKp0HbBSEkbgn3nnZjPTeHGyaJ0i0bKrVKAA7
 u8P7wSRbdb2SUXo3CBLK1BEGqLLFiLLJvj4/KTAojHKfBf3yZa3Puxb9Zk3Ym24TsEa5Whf7itH
 ciGSXIToMucPfdYDbXAqzNuscLsSIhep4rUJ8g==
X-Received: by 2002:a05:6402:3907:b0:691:6fca:c1a6 with SMTP id
 4fb4d7f45d1cf-69378a5a009mr7720299a12.26.1781588265291; Mon, 15 Jun 2026
 22:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 15:37:18 +1000
X-Gm-Features: AVVi8CepJSERSEEcvIrkW3C0kjRtmyqoZQBrG75f486f8udXUrNnyJLJhl6tqjo
Message-ID: <CAKmqyKMUN-iDhhAF176eZsVsdDd7_-soL4CYL0vYfxGHkFEKhw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/riscv: parametrize debug trigger number
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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

On Thu, Jun 11, 2026 at 10:34=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hi,
>
> In this new version we're adding Phil's comments in v2, in particular
> the need for an unrealize() callback to free the stuff we're now
> allocating.
>
> Patches based on alistair/riscv-to-apply.next.

Hmm... I can't get this to apply. Mind resending?

Alistair

>
> Changes from v2:
> - patch 1 (new):
>   - add RISC-V CPU unrealize callback
> - patch 2 (former 1):
>   - free allocated debug trigger arrays during unrealize()
>   - change version_id and minimum_version from vmstate_debug
> - patch 3 (former 2):
>   - do not touch vmstate_debug version_id/minimum_version_id
>   - added Phil's R-b
> - v2 link: https://lore.kernel.org/qemu-devel/20260610205457.1868701-1-da=
niel.barboza@oss.qualcomm.com/
>
>
> Daniel Henrique Barboza (3):
>   target/riscv/cpu: add CPU unrealize callback
>   target/riscv: dynamic alloc of debug trigger arrays
>   target/riscv: add 'num-triggers' debug property
>
>  target/riscv/cpu.c     | 26 ++++++++++++++++++++++++
>  target/riscv/cpu.h     | 39 ++++++++++++++++++++++++++++-------
>  target/riscv/csr.c     |  2 +-
>  target/riscv/debug.c   | 46 ++++++++++++++++++++++++++++++++++--------
>  target/riscv/debug.h   |  1 +
>  target/riscv/machine.c | 16 ++++++++++-----
>  6 files changed, 109 insertions(+), 21 deletions(-)
>
> --
> 2.43.0
>
>

