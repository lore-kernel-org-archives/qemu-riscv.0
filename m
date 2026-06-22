Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBBCCDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 01:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbT92-0006vh-KJ; Sun, 21 Jun 2026 21:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbT91-0006v5-1H
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 21:08:11 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbT8z-00051l-Df
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 21:08:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-69531108f25so7028193a12.2
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 18:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782090487; cv=none;
 d=google.com; s=arc-20240605;
 b=i2cUjNJI0r4LMsbO6q1MEKjkPMmqaaClAs1IM03FIjVKh/56GQRc9sBTu59hyGpDZx
 1R2G5TFUO2pLoC2rA/S9CSjU7qqUMhDJcZRm5UqSRL61i1fTgKe+CYquww44Au8vQOZo
 tE9E/leRbd/2yQGef6J25iyPQRL2IoleiYuqsvJl8d2Xi2w3Z+Q2hEk0eBy+igOBTvxl
 lzB1omWG0qvpdkuZMonzQwF+eoH3SZCE6iDS9hPbnpRB8a8Kj4UnGpZJzoE/YQONwYje
 47wntmqoTryqKnyWJk8xHoouliognhkOGchEa8Y1LD3YA1Jv33A1xAL0W9EtV2r46tW/
 v4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sNodhsPSoYCVVYVH8wDldbY0IH1E8gorxJFk2aDbIRY=;
 fh=6RXR10RQKQsRTPEAZAjBesXZEE8BBUMsw2KA5ErfQ0M=;
 b=TchjCywkYjOQtUdcxhG1k8vwm4bbyIynaBqo5t7ubOAd3aCkMqwDHlG3hJpkjaqktc
 AC8SnfEcvtwSN7tB2WDClWbZWbmir6WZmwDC+10ZZnK/hsT8ibbLDo5/SVrtUMHgVG4i
 n6jJ6kFqANj4aufvDPJcyOfpD8MAs8mlvuiY3T60HKVp9wafobOxpkfwioMgNQUuP9MS
 JH7MF8u1FGjId3lXPAxfLub06q+TyymKI0N2RgpZbOiTdANowsa4CYOS69iHwkN/+q9s
 EPyW4ZZCAs7gXi1F4wlk/MzT83hWoGXer2s1T6Avxo/hL2Q0vk8nX0VGweeG5/yGl0RZ
 kZog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782090487; x=1782695287; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNodhsPSoYCVVYVH8wDldbY0IH1E8gorxJFk2aDbIRY=;
 b=VV73X4VLyErJ84JdSk7rSodvYMeH2qLCAxthiwiKu3Rcjdpjv/jwWa68pip4ULV+7o
 j6FlTcquhzQdu8XE5fBnO6Zd+al0T6/zXP9XUGkbvcd1nIDQ6D5eEe4DPPPg2Up0xppN
 T+S5bFuEVPL0M6Azcqs1rmd2kJlOoVQ5hoRfZOZ8GjUaRWvHi3Qt0lLDl1JEnBbLlEsT
 QTcqS8PQzvnReh03KFwBqWGfdo82QdnvjVx1IIkhY94STtSbDoy9AHLcMNEUJr14lMjJ
 5chSFKZUKysmTuJDMpL/8qS2DbD6hpyvzzNZaToOd51nvxn6CKZEzI6jHYuBMUj87H4c
 7snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782090487; x=1782695287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sNodhsPSoYCVVYVH8wDldbY0IH1E8gorxJFk2aDbIRY=;
 b=UEoJCZTDJKQ1GTMxUAt19Aql3hZkytvVOc0Fx0suYWHJ7etFfkzbkvCFsFR6kpfU3P
 iBbFElPhGOFEbsqWMSZv8aIcJ6VhCqqAgELucunksvHjqtJ6npnRi4PoPzx1G1toQzwQ
 M7x6zxMxk8solvC8Fe+pXsr7u2lzbGhqJzHLWSfP7A6lWSeQpK/jycvW4BLfEF/bqVDF
 CprJYTPNb69RS+62bN/wEycp1r+BQOf8t3ikl7SIwGJzZpfBqBgg92iSf/MPIOld2LBU
 mgeC2AxkrWf3w0k/FCXgNZlPMtqZvTK9YgvlwM50PfxQgR5wM4BoYZwHKUwzR66SQlBe
 Z4LA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9vmyIE7Cu3N+6xVRajkz0n5+EnRxfCpeTVZieYnkcGahxBvF0Jw/SJ7tHM+rINKWXAYUfTloEItHHy@nongnu.org
X-Gm-Message-State: AOJu0Ywi4ymMOt/l1FzNbgsxGI/7Ul7gon9DJ3jASb3oU36WmY+/bQXi
 5BE2T36ADFDcOnouH14K3vYNKV3XyzS2m9IGwOd8xSdX59LVYU45Ftx00+xcBqrmsVVuWI8044G
 mVCvHTon97pnpj07Whu6eNOrhHUi6Kd0=
X-Gm-Gg: AfdE7clC1ojWHy3zSxjQkwEmBKLtxyHYvPimjrydnSjszy7T/Edi7HDb98ITrLDhAVv
 tjTraAJ0gk7J0181hi18Jq7NvflSmiLEwzbfnmQ85jV4ORQ+tqYlonsUfwG9c3uwaRPPKkNBvnN
 DeuOab0XyKSpa9xMl9/+bh9zMHnhphd6GkIvT3e5e2LTptM3kZ0xOYOiA0jmTx7HfcbTlcWlTlU
 ar49nJQzcgx/UHsgPMgipZrxfb0SQl1XVgmPBG3UE5c2tleNk9d3X0fQvAgDynyFdZLEJXP1JbW
 vA/JJNnjX1StQB77hpCD9+O4gOU=
X-Received: by 2002:a05:6402:358d:b0:697:7f6a:cf55 with SMTP id
 4fb4d7f45d1cf-6977f6ad063mr3646439a12.26.1782090487321; Sun, 21 Jun 2026
 18:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260617131710.1855353-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260617131710.1855353-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 11:07:40 +1000
X-Gm-Features: AVVi8CdLeqlr5yAhh3mHUqfjdXKHsdh-lA9c9YLubCBvngSrYDuayA6j5QfA8tI
Message-ID: <CAKmqyKPAuQhfZxjY_80AQyPMHjqrpS0soQ4cmxDaGvC5HU9YVQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] target/riscv: parametrize debug trigger number
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

On Wed, Jun 17, 2026 at 11:18=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hi,
>
> This is a re-send after rebase with current master after the recent
> RISC-V PR got merged.  No other changes made.
>
> Changes from v4:
> - rebased to 'master'
> - v3 link: https://lore.kernel.org/qemu-devel/20260611123412.2135600-1-da=
niel.barboza@oss.qualcomm.com/
>
> Daniel Henrique Barboza (3):
>   target/riscv/cpu: add CPU unrealize callback
>   target/riscv: dynamic alloc of debug trigger arrays
>   target/riscv: add 'num-triggers' debug property

Thanks!

Applied to riscv-to-apply.next

Alistair

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

